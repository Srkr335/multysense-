<?php

namespace App\Http;

use App\Http\Middleware\AccountSetup;
use App\Http\Middleware\CheckInstaller;
use App\Http\Middleware\DisableFrontend;
use App\Http\Middleware\LicenceExpire;
use App\Http\Middleware\LicenseExpireDateWise;
use App\Http\Middleware\SuperAdmin;
use Froiden\Envato\Middleware\XSS;
use Fruitcake\Cors\HandleCors;
use Illuminate\Foundation\Http\Kernel as HttpKernel;

class Kernel extends HttpKernel
{
    /**
     * The application's global HTTP middleware stack.
     *
     * These middleware are run during every request to your application.
     *
     * @var array
     */
    protected $middleware = [
        \Illuminate\Foundation\Http\Middleware\CheckForMaintenanceMode::class,
        \Illuminate\Foundation\Http\Middleware\ValidatePostSize::class,
        \App\Http\Middleware\TrimStrings::class,
        \Illuminate\Foundation\Http\Middleware\ConvertEmptyStringsToNull::class,
        XSS::class
    ];

    /**
     * The application's route middleware groups.
     *
     * @var array
     */
    protected $middlewareGroups = [
        'web' => [
            \App\Http\Middleware\EncryptCookies::class,
            \Illuminate\Cookie\Middleware\AddQueuedCookiesToResponse::class,
            \Illuminate\Session\Middleware\StartSession::class,
            // \Illuminate\Session\Middleware\AuthenticateSession::class,
            \Illuminate\View\Middleware\ShareErrorsFromSession::class,
            \App\Http\Middleware\VerifyCsrfToken::class,
            \Illuminate\Routing\Middleware\SubstituteBindings::class,
            HandleCors::class
        ],

        // 'api' => [
        //     'throttle:60,1',
        //     'bindings',
        // ],
        'api' => [
                \Laravel\Sanctum\Http\Middleware\EnsureFrontendRequestsAreStateful::class,
                'throttle:60,1', // or 'throttle:api'
                \Illuminate\Routing\Middleware\SubstituteBindings::class,
        ],

    ];

    /**
     * The application's route middleware.
     *
     * These middleware may be assigned to groups or used individually.
     *
     * @var array
     */
    protected $routeMiddleware = [
        'auth' => \Illuminate\Auth\Middleware\Authenticate::class,
        'auth.basic' => \Illuminate\Auth\Middleware\AuthenticateWithBasicAuth::class,
        'bindings' => \Illuminate\Routing\Middleware\SubstituteBindings::class,
        'can' => \Illuminate\Auth\Middleware\Authorize::class,
        'guest' => \App\Http\Middleware\RedirectIfAuthenticated::class,
        'throttle' => \Illuminate\Routing\Middleware\ThrottleRequests::class,

        'role' => \Trebol\Entrust\Middleware\EntrustRole::class,
        'permission' => \Trebol\Entrust\Middleware\EntrustPermission::class,
        'ability' => \Trebol\Entrust\Middleware\EntrustAbility::class,
        'cors' => \Barryvdh\Cors\HandleCors::class,
        'super-admin' => SuperAdmin::class,
        'check-install' => CheckInstaller::class,
        'account-setup' => AccountSetup::class,
        'license-expire' => LicenseExpireDateWise::class,
        'disable-frontend' => DisableFrontend::class,
    ];
}
