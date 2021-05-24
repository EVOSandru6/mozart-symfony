<?php

declare(strict_types=1);

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Factory\AppFactory;
use Slim\Middleware\ContentLengthMiddleware;

chdir(dirname(__DIR__));
require 'vendor/autoload.php';

http_response_code(500);

(function () {
    $app = AppFactory::create();

    $app->addErrorMiddleware((bool)getenv('APP_DEBUG'), false, false);
    $app->add(new ContentLengthMiddleware());

    $app->get('/', function (Request $request, Response $response) {
        $data = ['name' => 'Manager', 'param' => $request->getQueryParams()['param']];
        $payload = json_encode($data);

        $response->getBody()->write($payload);
        return $response
            ->withHeader('Content-Type', 'application/json')
            ->withStatus(201);
    });

    $app->run();
})();