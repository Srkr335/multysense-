<?php

declare(strict_types=1);

namespace PackageVersions;

use Composer\InstalledVersions;
use OutOfBoundsException;

class_exists(InstalledVersions::class);

/**
 * This class is generated by composer/package-versions-deprecated, specifically by
 * @see \PackageVersions\Installer
 *
 * This file is overwritten at every run of `composer install` or `composer update`.
 *
 * @deprecated in favor of the Composer\InstalledVersions class provided by Composer 2. Require composer-runtime-api:^2 to ensure it is present.
 */
final class Versions
{
    /**
     * @deprecated please use {@see self::rootPackageName()} instead.
     *             This constant will be removed in version 2.0.0.
     */
    const ROOT_PACKAGE_NAME = 'laravel/laravel';

    /**
     * Array of all available composer packages.
     * Dont read this array from your calling code, but use the \PackageVersions\Versions::getVersion() method instead.
     *
     * @var array<string, string>
     * @internal
     */
    const VERSIONS          = array (
  'asm89/stack-cors' => 'v2.1.1@73e5b88775c64ccc0b84fb60836b30dc9d92ac4a',
  'authorizenet/authorizenet' => '2.0.2@a3e76f96f674d16e892f87c58bedb99dada4b067',
  'aws/aws-crt-php' => 'v1.0.2@3942776a8c99209908ee0b287746263725685732',
  'aws/aws-sdk-php' => '3.218.3@a1bd2174db1255598344570e88c864cb18ab84f7',
  'barryvdh/laravel-cors' => 'v2.2.0@783a74f5e3431d7b9805be8afb60fd0a8f743534',
  'barryvdh/laravel-dompdf' => 'v0.8.7@30310e0a675462bf2aa9d448c8dcbf57fbcc517d',
  'barryvdh/laravel-translation-manager' => 'v0.5.10@18ed550eb74f9e61d2fc72d06dfa576296d0d5cb',
  'berkayk/onesignal-laravel' => 'v1.0.10@4b3bc2ff3376f5adb224948b759ccf052e3e6b7b',
  'brick/math' => '0.9.3@ca57d18f028f84f777b2168cd1911b0dee2343ae',
  'composer/ca-bundle' => '1.3.1@4c679186f2aca4ab6a0f1b0b9cf9252decb44d0b',
  'composer/package-versions-deprecated' => '1.11.99.5@b4f54f74ef3453349c24a845d22392cd31e65f1d',
  'craftsys/msg91-laravel' => 'v0.7.2@5c836d78181646f51043aa01256bb28b6833a2d5',
  'craftsys/msg91-laravel-notification-channel' => 'v0.3.1@aea3c094b05aea8daf2bf8d7e424783a401362e6',
  'craftsys/msg91-php' => 'v0.8.1@635ad7f0b3d83d459e8294133ad6ac9ce75c3d22',
  'doctrine/annotations' => '1.13.2@5b668aef16090008790395c02c893b1ba13f7e08',
  'doctrine/cache' => '1.12.1@4cf401d14df219fa6f38b671f5493449151c9ad8',
  'doctrine/collections' => '1.6.8@1958a744696c6bb3bb0d28db2611dc11610e78af',
  'doctrine/common' => 'v2.5.3@10f1f19651343f87573129ca970aef1a47a6f29e',
  'doctrine/dbal' => 'v2.5.0@71140662c0a954602e81271667b6e03d9f53ea34',
  'doctrine/inflector' => '1.4.4@4bd5c1cdfcd00e9e2d8c484f79150f67e5d355d9',
  'doctrine/lexer' => '1.2.3@c268e882d4dbdd85e36e4ad69e02dc284f89d229',
  'dompdf/dompdf' => 'v0.8.6@db91d81866c69a42dad1d2926f61515a1e3f42c5',
  'dragonmantank/cron-expression' => 'v2.3.1@65b2d8ee1f10915efb3b55597da3404f096acba2',
  'edujugon/push-notification' => 'v4.5.0@27f6d0814c636a47d236fbfd8a39e2aed0333411',
  'egulias/email-validator' => '2.1.25@0dbf5d78455d4d6a41d186da50adc1122ec066f4',
  'eluceo/ical' => '0.13.0@913b89e67b9f7865e1399b2dbc22d21857e7e236',
  'ezyang/htmlpurifier' => 'v4.14.0@12ab42bd6e742c70c0a52f7b82477fcd44e64b75',
  'fideloper/proxy' => '4.4.1@c073b2bd04d1c90e04dc1b787662b558dd65ade0',
  'firebase/php-jwt' => 'v5.5.1@83b609028194aa042ea33b5af2d41a7427de80e6',
  'froiden/envato' => '1.8.5@228724e3c1538197a02c36122b36b9a38feb8b32',
  'froiden/laravel-installer' => '1.6.4@7a4ebe442b61bec8056b4ead6f02e48ec98ec0b5',
  'froiden/laravel-rest-api' => '7.0.3@93917e1b6809430e4e2311f6e98070a3fc21f47c',
  'google/apiclient' => 'v2.12.2@a18b0e1ef5618523c607c01a41ec137c7f9af3b1',
  'google/apiclient-services' => 'v0.242.0@73d4c0ed4b241e7396699e0ee1d1cdebabac25e8',
  'google/auth' => 'v1.19.0@31e5d24d5fa0eaf6adc7e596292dc4732f4b60c5',
  'google/cloud-core' => 'v1.44.1@897df2db2f0b04c370c44f8564ae3fd69034e273',
  'google/cloud-translate' => 'v1.12.3@2e770c18a865bd4aeab76a8c22d54fee555376d0',
  'google/common-protos' => '2.0.0@a1bcb7b37f1fa1c92d65c3c6339fc701a65916ee',
  'google/gax' => 'v1.12.0@d802c9b40c349f5368f077bfcbc2982e7c31f43c',
  'google/grpc-gcp' => 'v0.2.0@2465c2273e11ada1e95155aa1e209f3b8f03c314',
  'google/protobuf' => 'v3.20.0@c2fa02b7b39786ff9f76e3b3c1bb28a022987278',
  'grpc/grpc' => '1.42.0@9fa44f104cb92e924d4da547323a97f3d8aca6d4',
  'guzzlehttp/guzzle' => '6.5.5@9d4290de1cfd701f38099ef7e183b64b4b7b0c5e',
  'guzzlehttp/promises' => '1.5.1@fe752aedc9fd8fcca3fe7ad05d419d32998a06da',
  'guzzlehttp/psr7' => '1.8.5@337e3ad8e5716c15f9657bd214d16cc5e69df268',
  'intervention/image' => '2.7.1@744ebba495319501b873a4e48787759c72e3fb8c',
  'laminas/laminas-diactoros' => '2.9.0@954e2dcfb1607681be44599faac10fc63bb6925a',
  'laravel-lang/lang' => '6.1.4@18a7845e813e737a56a7f164301d5014b536950c',
  'laravel-notification-channels/onesignal' => 'v2.3.0@882d842962c92e33692a43995ddd7c679dc684d2',
  'laravel-notification-channels/twilio' => '3.2.0@c14bafbd59d59aed94e73cb83d89c0d33ad88c79',
  'laravel/cashier' => 'v12.17.0@da1a55e9b3e711669bdf7055b0af42cfd762af0e',
  'laravel/framework' => 'v7.30.6@ecdafad1dda3c790af186a6d18479ea4757ef9ee',
  'laravel/helpers' => 'v1.5.0@c28b0ccd799d58564c41a62395ac9511a1e72931',
  'laravel/nexmo-notification-channel' => 'v2.5.1@178c9f0eb3a18d4b5682471bffca104a15d817a7',
  'laravel/slack-notification-channel' => 'v2.4.0@060617a31562c88656c95c5971a36989122d4b53',
  'laravel/socialite' => 'v4.4.1@80951df0d93435b773aa00efe1fad6d5015fac75',
  'laravel/tinker' => 'v2.7.2@dff39b661e827dae6e092412f976658df82dbac5',
  'laravel/ui' => 'v2.5.0@d01a705763c243b07be795e9d1bb47f89260f73d',
  'laravelcollective/html' => 'v6.3.0@78c3cb516ac9e6d3d76cad9191f81d217302dea6',
  'lcobucci/jwt' => '3.3.3@c1123697f6a2ec29162b82f170dd4a491f524773',
  'league/commonmark' => '1.6.7@2b8185c13bc9578367a5bf901881d1c1b5bbd09b',
  'league/flysystem' => '1.1.9@094defdb4a7001845300334e7c1ee2335925ef99',
  'league/flysystem-aws-s3-v3' => '1.0.29@4e25cc0582a36a786c31115e419c6e40498f6972',
  'league/mime-type-detection' => '1.9.0@aa70e813a6ad3d1558fc927863d47309b4c23e69',
  'league/oauth1-client' => 'v1.10.0@88dd16b0cff68eb9167bfc849707d2c40ad91ddc',
  'league/oauth2-client' => '2.6.1@2334c249907190c132364f5dae0287ab8666aa19',
  'maatwebsite/excel' => '3.1.38@dff132ce4d30b19863f4e84de1613fca99604992',
  'macellan/laravel-zip' => '1.0.5@0c40d22de710acb5e4da8620663fb336741cdc5d',
  'macsidigital/laravel-api-client' => '3.3.5@5af84e875f82ec09de4f7a4989af60038f6e2806',
  'macsidigital/laravel-oauth2-client' => '1.2.0@bcaba6b76d4e91c6dd79ebab857b4cc960bd1b09',
  'macsidigital/laravel-zoom' => '4.1.9@b91f5bd4130cb66c772e04052dc91263b19accb3',
  'maennchen/zipstream-php' => '2.1.0@c4c5803cc1f93df3d2448478ef79394a5981cc58',
  'markbaker/complex' => '3.0.1@ab8bc271e404909db09ff2d5ffa1e538085c0f22',
  'markbaker/matrix' => '3.0.0@c66aefcafb4f6c269510e9ac46b82619a904c576',
  'mollie/laravel-mollie' => 'v2.17.0@0bac3f611059b1679391feeaaaa61fcec021eb48',
  'mollie/mollie-api-php' => 'v2.42.0@1d3ba6a8c345140f23f52facc4267ece12395b11',
  'moneyphp/money' => 'v3.3.1@122664c2621a95180a13c1ac81fea1d2ef20781e',
  'monolog/monolog' => '2.4.0@d7fd7450628561ba697b7097d86db72662f54aef',
  'mtdowling/jmespath.php' => '2.6.1@9b87907a81b87bc76d19a7fb2d61e61486ee9edb',
  'myclabs/php-enum' => '1.8.3@b942d263c641ddb5190929ff840c68f78713e937',
  'namshi/jose' => '7.2.3@89a24d7eb3040e285dd5925fcad992378b82bcff',
  'nesbot/carbon' => '2.57.0@4a54375c21eea4811dbd1149fe6b246517554e78',
  'nexmo/laravel' => '2.4.1@029bdc19fc58cd6ef0aa75c7041d82b9d9dc61bd',
  'nikic/php-parser' => 'v4.13.2@210577fe3cf7badcc5814d99455df46564f3c077',
  'nwidart/laravel-modules' => '7.3.0@5194d3c1941518f6131238745aff916453afc727',
  'opis/closure' => '3.6.3@3d81e4309d2a927abbe66df935f4bb60082805ad',
  'paragonie/constant_time_encoding' => 'v2.5.0@9229e15f2e6ba772f0c55dd6986c563b937170a8',
  'paragonie/random_compat' => 'v1.4.3@9b3899e3c3ddde89016f576edb8c489708ad64cd',
  'paragonie/sodium_compat' => 'v1.17.1@ac994053faac18d386328c91c7900f930acadf1e',
  'paypal/rest-api-sdk-php' => '1.14.0@72e2f2466975bf128a31e02b15110180f059fc04',
  'pcinaglia/laraupdater' => '1.0.2@d19d88f0b1c1cbe7a2fdb5505d3d5f434939e8dd',
  'phenx/php-font-lib' => '0.5.4@dd448ad1ce34c63d09baccd05415e361300c35b4',
  'phenx/php-svg-lib' => '0.3.4@f627771eb854aa7f45f80add0f23c6c4d67ea0f2',
  'php-http/guzzle6-adapter' => 'v2.0.2@9d1a45eb1c59f12574552e81fb295e9e53430a56',
  'php-http/httplug' => '2.3.0@f640739f80dfa1152533976e3c112477f69274eb',
  'php-http/promise' => '1.1.0@4c4c1f9b7289a2ec57cde7f1e9762a5789506f88',
  'phpoffice/phpspreadsheet' => '1.22.0@3a9e29b4f386a08a151a33578e80ef1747037a48',
  'phpoption/phpoption' => '1.8.1@eab7a0df01fe2344d172bff4cd6dbd3f8b84ad15',
  'phpseclib/phpseclib' => '3.0.14@2f0b7af658cbea265cbb4a791d6c29a6613f98ef',
  'psr/cache' => '1.0.1@d11b50ad223250cf17b86e38383413f5a6764bf8',
  'psr/container' => '1.1.2@513e0666f7216c7459170d56df27dfcefe1689ea',
  'psr/event-dispatcher' => '1.0.0@dbefd12671e8a14ec7f180cab83036ed26714bb0',
  'psr/http-client' => '1.0.1@2dfb5f6c5eff0e91e20e913f8c5452ed95b86621',
  'psr/http-factory' => '1.0.1@12ac7fcd07e5b077433f5f2bee95b3a771bf61be',
  'psr/http-message' => '1.0.1@f6561bf28d520154e4b0ec72be95418abe6d9363',
  'psr/log' => '1.1.4@d49695b909c3b7628b6289db5479a1c204601f11',
  'psr/simple-cache' => '1.0.1@408d5eafb83c57f6365a3ca330ff23aa4a5fa39b',
  'psy/psysh' => 'v0.11.2@7f7da640d68b9c9fec819caae7c744a213df6514',
  'pusher/pusher-php-server' => 'v4.1.5@251f22602320c1b1aff84798fe74f3f7ee0504a9',
  'ralouphie/getallheaders' => '3.0.3@120b605dfeb996808c31b6477290a714d356e822',
  'ramsey/collection' => '1.2.2@cccc74ee5e328031b15640b51056ee8d3bb66c0a',
  'ramsey/uuid' => '4.2.3@fc9bb7fb5388691fd7373cd44dcb4d63bbcf24df',
  'razorpay/razorpay' => 'v2.8.2@f36ad5ec74522d2930ffad3b160dddc454e42f4d',
  'rize/uri-template' => '0.3.4@2a874863c48d643b9e2e254ab288ec203060a0b8',
  'rmccue/requests' => 'v1.8.0@afbe4790e4def03581c4a0963a1e8aa01f6030f1',
  'sabberworm/php-css-parser' => '8.4.0@e41d2140031d533348b2192a83f02d8dd8a71d30',
  'simshaun/recurr' => 'v4.0.5@08b0b46879f598cd11dd42b4c1a9c221a0562749',
  'spatie/laravel-cookie-consent' => '2.12.13@8e93b9efee3a68960e5c832f937170c2fc0b2f37',
  'stichoza/google-translate-php' => 'v4.1.6@ea96d2ca42af3e40890cd0ca043d1c3efb46f292',
  'stripe/stripe-php' => 'v7.121.0@e36e7afb71ae5511aae23b52dca712a0ef06d981',
  'swiftmailer/swiftmailer' => 'v6.3.0@8a5d5072dca8f48460fce2f4131fcc495eec654c',
  'symfony/console' => 'v5.4.7@900275254f0a1a2afff1ab0e11abd5587a10e1d6',
  'symfony/css-selector' => 'v5.4.3@b0a190285cd95cb019237851205b8140ef6e368e',
  'symfony/deprecation-contracts' => 'v2.5.1@e8b495ea28c1d97b5e0c121748d6f9b53d075c66',
  'symfony/error-handler' => 'v5.4.7@060bc01856a1846e3e4385261bc9ed11a1dd7b6a',
  'symfony/event-dispatcher' => 'v5.4.3@dec8a9f58d20df252b9cd89f1c6c1530f747685d',
  'symfony/event-dispatcher-contracts' => 'v2.5.1@f98b54df6ad059855739db6fcbc2d36995283fe1',
  'symfony/finder' => 'v5.4.3@231313534dded84c7ecaa79d14bc5da4ccb69b7d',
  'symfony/http-foundation' => 'v5.4.6@34e89bc147633c0f9dd6caaaf56da3b806a21465',
  'symfony/http-kernel' => 'v5.4.7@509243b9b3656db966284c45dffce9316c1ecc5c',
  'symfony/mime' => 'v5.4.7@92d27a34dea2e199fa9b687e3fff3a7d169b7b1c',
  'symfony/polyfill-ctype' => 'v1.25.0@30885182c981ab175d4d034db0f6f469898070ab',
  'symfony/polyfill-iconv' => 'v1.25.0@f1aed619e28cb077fc83fac8c4c0383578356e40',
  'symfony/polyfill-intl-grapheme' => 'v1.25.0@81b86b50cf841a64252b439e738e97f4a34e2783',
  'symfony/polyfill-intl-icu' => 'v1.25.0@c023a439b8551e320cc3c8433b198e408a623af1',
  'symfony/polyfill-intl-idn' => 'v1.25.0@749045c69efb97c70d25d7463abba812e91f3a44',
  'symfony/polyfill-intl-normalizer' => 'v1.25.0@8590a5f561694770bdcd3f9b5c69dde6945028e8',
  'symfony/polyfill-mbstring' => 'v1.25.0@0abb51d2f102e00a4eefcf46ba7fec406d245825',
  'symfony/polyfill-php56' => 'v1.20.0@54b8cd7e6c1643d78d011f3be89f3ef1f9f4c675',
  'symfony/polyfill-php72' => 'v1.25.0@9a142215a36a3888e30d0a9eeea9766764e96976',
  'symfony/polyfill-php73' => 'v1.25.0@cc5db0e22b3cb4111010e48785a97f670b350ca5',
  'symfony/polyfill-php80' => 'v1.25.0@4407588e0d3f1f52efb65fbe92babe41f37fe50c',
  'symfony/polyfill-php81' => 'v1.25.0@5de4ba2d41b15f9bd0e19b2ab9674135813ec98f',
  'symfony/process' => 'v5.4.7@38a44b2517b470a436e1c944bf9b9ba3961137fb',
  'symfony/psr-http-message-bridge' => 'v2.1.2@22b37c8a3f6b5d94e9cdbd88e1270d96e2f97b34',
  'symfony/routing' => 'v5.4.3@44b29c7a94e867ccde1da604792f11a469958981',
  'symfony/service-contracts' => 'v2.5.1@24d9dc654b83e91aa59f9d167b131bc3b5bea24c',
  'symfony/string' => 'v5.4.3@92043b7d8383e48104e411bc9434b260dbeb5a10',
  'symfony/translation' => 'v5.4.7@e1eb790575202ee3ac2659f55b93b05853726f8e',
  'symfony/translation-contracts' => 'v2.5.1@1211df0afa701e45a04253110e959d4af4ef0f07',
  'symfony/var-dumper' => 'v5.4.6@294e9da6e2e0dd404e983daa5aa74253d92c05d0',
  'tanmuhittin/laravel-google-translate' => '2.1.0@65e53f8cf442dd29c2eb386099acee931592aef0',
  'tijsverkoyen/css-to-inline-styles' => '2.2.4@da444caae6aca7a19c0c140f68c6182e337d5b1c',
  'trebol/entrust' => '1.0.2@09ae198e9676cfd2a039616f9260b28854d5deb8',
  'twilio/sdk' => '6.36.0@86de6fb1ba57eb69c092cf49cff88e125342ecaf',
  'tymon/jwt-auth' => '1.0.2@e588cb719539366c0e2f6017f975379cb73e9680',
  'unicodeveloper/laravel-paystack' => '1.0.7@bfcb92255c29d92b0c4e80355a65de14e2e156f3',
  'vlucas/phpdotenv' => 'v4.2.2@77e974614d2ead521f18069dccc571696f52b8dc',
  'voku/portable-ascii' => '1.6.1@87337c91b9dfacee02452244ee14ab3c43bc485a',
  'vonage/client' => '2.3.0@e9c1492a9f1572124143e6fa963da417bb20d9ae',
  'vonage/client-core' => 'v2.6.0@0c293b4649ba7e6ab212b74db9933b81acc399eb',
  'vonage/nexmo-bridge' => '0.1.1@36490dcc5915f12abeaa233c6098e0dce14bbb0a',
  'yajra/laravel-datatables-buttons' => 'v4.13.3@5c8fb97c26c14408c8933f68d86c6e4823d05740',
  'yajra/laravel-datatables-html' => 'v4.41.1@55895b55539cd776a8cd22dce874d1b6a7b9de8c',
  'yajra/laravel-datatables-oracle' => 'v9.19.1@c4baacc0a90d5f894cdeaedf19558d8794c09b08',
  'yandex/translate-api' => '1.5.2@c99e69cde3e688fc0f99c4d8a21585226a8e1938',
  'barryvdh/laravel-debugbar' => 'v3.6.7@b96f9820aaf1ff9afe945207883149e1c7afb298',
  'doctrine/instantiator' => '1.4.1@10dcfce151b967d20fde1b34ae6640712c3891bc',
  'facade/flare-client-php' => '1.9.1@b2adf1512755637d0cef4f7d1b54301325ac78ed',
  'facade/ignition' => '2.17.5@1d71996f83c9a5a7807331b8986ac890352b7a0c',
  'facade/ignition-contracts' => '1.0.2@3c921a1cdba35b68a7f0ccffc6dffc1995b18267',
  'filp/whoops' => '2.14.5@a63e5e8f26ebbebf8ed3c5c691637325512eb0dc',
  'fzaninotto/faker' => 'v1.9.2@848d8125239d7dbf8ab25cb7f054f1a630e68c2e',
  'hamcrest/hamcrest-php' => 'v1.2.2@b37020aa976fa52d3de9aa904aa2522dc518f79c',
  'maximebf/debugbar' => 'v1.18.0@0d44b75f3b5d6d41ae83b79c7a4bceae7fbc78b6',
  'mockery/mockery' => '0.9.11@be9bf28d8e57d67883cba9fcadfcff8caab667f8',
  'myclabs/deep-copy' => '1.10.2@776f831124e9c62e1a2c601ecc52e776d8bb7220',
  'nunomaduro/collision' => 'v4.3.0@7c125dc2463f3e144ddc7e05e63077109508c94e',
  'phar-io/manifest' => '2.0.3@97803eca37d319dfa7826cc2437fc020857acb53',
  'phar-io/version' => '3.2.1@4f7fd7836c6f332bb2933569e566a0d6c4cbed74',
  'phpdocumentor/reflection-common' => '2.2.0@1d01c49d4ed62f25aa84a747ad35d5a16924662b',
  'phpdocumentor/reflection-docblock' => '5.3.0@622548b623e81ca6d78b721c5e029f4ce664f170',
  'phpdocumentor/type-resolver' => '1.6.1@77a32518733312af16a44300404e945338981de3',
  'phpspec/prophecy' => 'v1.15.0@bbcd7380b0ebf3961ee21409db7b38bc31d69a13',
  'phpunit/php-code-coverage' => '7.0.15@819f92bba8b001d4363065928088de22f25a3a48',
  'phpunit/php-file-iterator' => '2.0.5@42c5ba5220e6904cbfe8b1a1bda7c0cfdc8c12f5',
  'phpunit/php-text-template' => '1.2.1@31f8b717e51d9a2afca6c9f046f5d69fc27c8686',
  'phpunit/php-timer' => '2.1.3@2454ae1765516d20c4ffe103d85a58a9a3bd5662',
  'phpunit/php-token-stream' => '4.0.4@a853a0e183b9db7eed023d7933a858fa1c8d25a3',
  'phpunit/phpunit' => '8.5.26@ef117c59fc4c54a979021b26d08a3373e386606d',
  'sebastian/code-unit-reverse-lookup' => '1.0.2@1de8cd5c010cb153fcd68b8d0f64606f523f7619',
  'sebastian/comparator' => '3.0.3@1071dfcef776a57013124ff35e1fc41ccd294758',
  'sebastian/diff' => '3.0.3@14f72dd46eaf2f2293cbe79c93cc0bc43161a211',
  'sebastian/environment' => '4.2.4@d47bbbad83711771f167c72d4e3f25f7fcc1f8b0',
  'sebastian/exporter' => '3.1.4@0c32ea2e40dbf59de29f3b49bf375176ce7dd8db',
  'sebastian/global-state' => '3.0.2@de036ec91d55d2a9e0db2ba975b512cdb1c23921',
  'sebastian/object-enumerator' => '3.0.4@e67f6d32ebd0c749cf9d1dbd9f226c727043cdf2',
  'sebastian/object-reflector' => '1.1.2@9b8772b9cbd456ab45d4a598d2dd1a1bced6363d',
  'sebastian/recursion-context' => '3.0.1@367dcba38d6e1977be014dc4b22f47a484dac7fb',
  'sebastian/resource-operations' => '2.0.2@31d35ca87926450c44eae7e2611d45a7a65ea8b3',
  'sebastian/type' => '1.1.4@0150cfbc4495ed2df3872fb31b26781e4e077eb4',
  'sebastian/version' => '2.0.1@99732be0ddb3361e16ad77b68ba41efc8e979019',
  'symfony/debug' => 'v4.4.37@5de6c6e7f52b364840e53851c126be4d71e60470',
  'theseer/tokenizer' => '1.2.1@34a41e998c2183e22995f158c581e7b5e755ab9e',
  'webmozart/assert' => '1.10.0@6964c76c7804814a842473e0c8fd15bab0f18e25',
  'laravel/laravel' => 'dev-staging@2012f9b552e568166a477e3f856848192ce69a9f',
);

    private function __construct()
    {
    }

    /**
     * @psalm-pure
     *
     * @psalm-suppress ImpureMethodCall we know that {@see InstalledVersions} interaction does not
     *                                  cause any side effects here.
     */
    public static function rootPackageName() : string
    {
        if (!self::composer2ApiUsable()) {
            return self::ROOT_PACKAGE_NAME;
        }

        return InstalledVersions::getRootPackage()['name'];
    }

    /**
     * @throws OutOfBoundsException If a version cannot be located.
     *
     * @psalm-param key-of<self::VERSIONS> $packageName
     * @psalm-pure
     *
     * @psalm-suppress ImpureMethodCall we know that {@see InstalledVersions} interaction does not
     *                                  cause any side effects here.
     */
    public static function getVersion(string $packageName): string
    {
        if (self::composer2ApiUsable()) {
            return InstalledVersions::getPrettyVersion($packageName)
                . '@' . InstalledVersions::getReference($packageName);
        }

        if (isset(self::VERSIONS[$packageName])) {
            return self::VERSIONS[$packageName];
        }

        throw new OutOfBoundsException(
            'Required package "' . $packageName . '" is not installed: check your ./vendor/composer/installed.json and/or ./composer.lock files'
        );
    }

    private static function composer2ApiUsable(): bool
    {
        if (!class_exists(InstalledVersions::class, false)) {
            return false;
        }

        if (method_exists(InstalledVersions::class, 'getAllRawData')) {
            $rawData = InstalledVersions::getAllRawData();
            if (count($rawData) === 1 && count($rawData[0]) === 0) {
                return false;
            }
        } else {
            $rawData = InstalledVersions::getRawData();
            if ($rawData === null || $rawData === []) {
                return false;
            }
        }

        return true;
    }
}
