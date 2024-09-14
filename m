Received: by 2002:a17:504:2a14:b0:1be9:327d:8ee3 with SMTP id p20csp161342njl;
        Sat, 14 Sep 2024 01:12:46 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCVa9yNyov5fdaidlKA2PsCq3k8vouYRDGtnK0Izjzt241ukBITRdURLkEO6+QrIyGGItXr5hk7gHMpBOg==@linaro.org
X-Google-Smtp-Source: AGHT+IEqo9fwvbX7xNNVHs6fYmh+CdQbFvpgmxKwoXzxpdIy7lPYuWTmZpLoS44TB27joWYzpzPG
X-Received: by 2002:a17:90a:6f81:b0:2c9:6aa9:1d76 with SMTP id 98e67ed59e1d1-2db9ffda691mr10209834a91.18.1726301566636;
        Sat, 14 Sep 2024 01:12:46 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1726301566; cv=pass;
        d=google.com; s=arc-20240605;
        b=KQizLmqPEEWVjwa+8vEM9IexJEy3rcwSEgNuRKXhBxQhnp07QMq8f0ihOTnQk4wEXv
         IRAbq3t6CgHLNHGEFbpnEFfCUM9lvWO19LJqXtD5p5TYne/xoAFHRwYWYk46U+W6UODK
         pxvRpFlTEA5uC5KCYYK4eBw5PjxeE9nPU1XeBkerO4y53ADiuwMH4znmEbSsWQvKnojp
         XnW6h2Z9lZLPbYbOfA28F2DSRAI969O49Liw+414SGiXQBmP2od1Mu54yVxdXwWR7pZE
         1wCBVdPWJtB2MS3ki0EEWW/pXJcljt38Y/6w/H1i3tKP8TkckzXSlQwFoy33b0Zynpda
         OtGw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:dkim-signature;
        bh=CBmXgYl8X7WjD0fx8Rz/d05lMNX4U+zcr0FpvBjSMMY=;
        fh=B6sqipkaAQ+OF2UgK3kcInK4GieGzJrLphHSdvBer70=;
        b=Xd6gtWWQYpLtOp8GXzqpRdpqc99abtBxdJ6nj/NU+Lg7SYbNjp9fMcWN+NzO4JFoB7
         skVX7pk/d0sHD3u05P2dtf/wzidhSShAdAkBxlIQlg40RR6nxdx1htcvpUgeq+oXdiFu
         sG3Rp6QbXRbt3ES1vW7qSJGu8YWNB9vsGZEuS1Mw1DVbzqPeLaexhsa5+8FTsBEkRSan
         sjsDMMZ46EAH/MPG2L3fb7JWMq6RqZHFn/lY0XaDuY3ycwRDf+2zRDiY2sto/GwOR+zW
         7ag0+uLN2jkMVc2Bd51U7tIdSvP+mgMET/hMSytGnfDXmWDM5e51nv27kHRmkANzqrEd
         WiaQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@hotmail.com header.s=selector1 header.b="LdHgbqa/";
       arc=pass (i=1);
       spf=pass (google.com: domain of junjie.mao@hotmail.com designates 2a01:111:f403:2819::807 as permitted sender) smtp.mailfrom=junjie.mao@hotmail.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=hotmail.com
Return-Path: <junjie.mao@hotmail.com>
Received: from AUS01-SY4-obe.outbound.protection.outlook.com (mail-sy4aus01olkn20807.outbound.protection.outlook.com. [2a01:111:f403:2819::807])
        by mx.google.com with ESMTPS id 98e67ed59e1d1-2dbcfd62988si1288822a91.101.2024.09.14.01.12.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 14 Sep 2024 01:12:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of junjie.mao@hotmail.com designates 2a01:111:f403:2819::807 as permitted sender) client-ip=2a01:111:f403:2819::807;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@hotmail.com header.s=selector1 header.b="LdHgbqa/";
       arc=pass (i=1);
       spf=pass (google.com: domain of junjie.mao@hotmail.com designates 2a01:111:f403:2819::807 as permitted sender) smtp.mailfrom=junjie.mao@hotmail.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=hotmail.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ObFwUVYBV8Vvnl0y9VFIeUxp2JxIIVuKipnorXUvRu+lhKRxv5JxXtt7nrLG4zXjC56yTyYVhtOKq+co2PvA0V6P0zqGwDaxpAbE0kK9S+V6VJpQo4ToTn9qaeCeXFHxmImZGwgdgN0D9ItzYFPv92I+kLtgcTBNSLfdijL6DA/XHmXL+VYUUbkFssgIcDSMD24eQhFCBbKsB/H4XbNG5CFFdutondp7/Huq871ojsZg4pfoc3GYoYOGz7k2+WjTr/b4qb8/KKsvQ2mOWl83R+EQRZ9b829QERUhDRje6bkqO483F/CmEK4gYuLnZODMayfrngh9UO+OY9h3ZJCCuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CBmXgYl8X7WjD0fx8Rz/d05lMNX4U+zcr0FpvBjSMMY=;
 b=AijimsYHrawn3sL1E/bSpGejrz7O07JPBFY2Qr5vOreocsDOLq9iR7yZCAMwCUvA1cmY+OkAn3ElmEDi4JOxUdVEDAdWk9mFS5U2y8/jNIyaNYuJ5YY8mE5zTNvqL+FfxrTfVxP5kyJXgI9b8u0DBHsNO9KR3Wz4cs+Swr1/JHbZnI2T48pm2wLwGJ6vKmvwi7w5uKAIPKwmDyLqwMoCbFqSge2koaBvuLGEbNMI19kk+u64VfXx/4P7CHHePeUEZE8COkweC2jm6DYRJfacB9jtzJXixJ4H9BvFe8HVyyJdFA+7HSfs2UyTer/ujbB7HoYqcrun+78AEqzUgidpmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CBmXgYl8X7WjD0fx8Rz/d05lMNX4U+zcr0FpvBjSMMY=;
 b=LdHgbqa/QMfSgv0vkGiQHSPFeF1KF0v6tjckrV3sdjg3v6y/rbYPzhedTCmjeQivvz1l6GgL5ga3ozmt+BaIOZGrR9s3cO3yGn00RoDyHIiXxa8G5bzbTKKTwKVBlpSWyOXs5GWJZora0AL4erausRccqUeJ56JoOo99fiALrCVXXjuwLTYfr7BH5/ipaZVskuVjeBDeOh8zlzt3X1haAMzbmVv/koFcWzA/g7/87VPRMb0bngmL2IzS+WJbIjFSzRKNwBc6uV+p/JWv4CldaWj2b0wIqXYBlJCLS290UuI2lXY03cJdinJnVfzge1eLidQ8ZOj4JYfQ+qYqK8A5FA==
Received: from SY0P300MB1026.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:282::22)
 by ME0P300MB0581.AUSP300.PROD.OUTLOOK.COM (2603:10c6:220:229::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.22; Sat, 14 Sep
 2024 08:12:40 +0000
Received: from SY0P300MB1026.AUSP300.PROD.OUTLOOK.COM
 ([fe80::aea3:2365:f9e8:5bd]) by SY0P300MB1026.AUSP300.PROD.OUTLOOK.COM
 ([fe80::aea3:2365:f9e8:5bd%2]) with mapi id 15.20.7962.021; Sat, 14 Sep 2024
 08:12:40 +0000
From: Junjie Mao <junjie.mao@hotmail.com>
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: qemu-devel@nongnu.org,  Paolo Bonzini <pbonzini@redhat.com>,
  =?utf-8?Q?Marc-Andr=C3=A9?=
 Lureau <marcandre.lureau@redhat.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Thomas Huth <thuth@redhat.com>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Pierrick Bouvier
 <pierrick.bouvier@linaro.org>,  Richard Henderson
 <richard.henderson@linaro.org>,  Gustavo Romero
 <gustavo.romero@linaro.org>,  Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,  Peter
 Maydell <peter.maydell@linaro.org>,  Junjie Mao <junjie.mao@intel.com>,
  Zhao Liu <zhao1.liu@intel.com>,  John Snow <jsnow@redhat.com>,  Cleber
 Rosa <crosa@redhat.com>,  Beraldo Leal <bleal@redhat.com>,  Wainer dos
 Santos Moschetta <wainersm@redhat.com>,  qemu-arm@nongnu.org
Subject: Re: [PATCH v10 8/9] rust: add utility procedural macro crate
References: <20240910-rust-pl011-v10-0-85a89ee33c40@linaro.org>
	<20240910-rust-pl011-v10-8-85a89ee33c40@linaro.org>
Date: Sat, 14 Sep 2024 16:12:32 +0800
In-Reply-To: <20240910-rust-pl011-v10-8-85a89ee33c40@linaro.org> (Manos
	Pitsidianakis's message of "Tue, 10 Sep 2024 15:35:14 +0300")
Message-ID:
 <SY0P300MB102640ED87329D3B2F42D26595662@SY0P300MB1026.AUSP300.PROD.OUTLOOK.COM>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0001.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::15) To SY0P300MB1026.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:282::22)
Return-Path: junjie.mao@hotmail.com
X-Microsoft-Original-Message-ID: <87plp6irgv.fsf@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY0P300MB1026:EE_|ME0P300MB0581:EE_
X-MS-Office365-Filtering-Correlation-Id: a8498312-3941-4ba2-f5fc-08dcd4950021
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799003|5072599009|8060799006|461199028|15080799006|7092599003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	E/mjiiJnstqfJOejk0nvlwrQJy3gAt6Rp7qyodG5l7iZKDRkromPiXe42IfUecu6ffvJ1Vu5dM6hfU01x4GaQj6mABapeUNSEQNc22wOlt6jy1mNWHfe7gN7Bb3D5OkD+YK4U0JMg3fxSGCQJOvMdJEW+rHe8fOOwtzzgOp44yealxUi22GyV7AwUgBXspKLE5BEWc9+jcH9ILtFB41PBI3Vo8oCCbx5eahEaxExW26irqnCoxM6I0wlLbHmkM1D5wkBn08MzZ+3wgbZHqCbrL2l/topYPfHng/iX6oPMDCOaDm8fpX2fzlmX0s/K5AuG4mb2SUFGUQDHMCuzLD7QCv624r/RT3CGSUhxbYHzNQvun4CEEQEii1k4hoS1HcQD5IEMwqbG1v/HdvS/W/8lxmMHMboalBBwFKh+MtllvgjRb4hpF/mOSSK397e9EwmaprmC9DCBt34yYjXhNDhdRDYliowPF8EK0bzMTlbu4JAQvM9DJcbD9HX4iUz1gv2Sh3hO3SjQtZ7vmpV1pqojPS+LOofL6ww2QC5XOAMHtu6yIddC9caomSpxU3+busOPxHhoFdPqFrpTMyWTbfTCp8ue3zKR3ZDCBMgZQ+zajM6gcn2zwtbAVd3ubH3fVQpFCj5yQ0T4rZyMDVkReYMVViC2r2VWwdpt7YTDVyt9BWIwqFTu/bnvwEGcGfD3LOFKgr4APDj7EwoY/HuOKcRHVaQ6WfLeNC+l624xVdznds=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?V3VnOniXLsH6dw+3P8Z91NHlWgrBkKAlYz2+KyESAY6xYD4mwNZvWUVr6mXu?=
 =?us-ascii?Q?DZqZJrdt0T3MxDjFFxuhJC/Iskf2bs9tZNTFUTPEJ1XM1gYD5EAYlEOJ7rjs?=
 =?us-ascii?Q?Xgtp9ue3anJLfbea5e4UCcUUIYx3y74ZB8t2EZrVpLBdDkjfKFz8mooJtelR?=
 =?us-ascii?Q?p0WlzXl9Tm86X+39gb+Hw7brF17Lp8sv+q6jR3/tBuQuXCqFZpW7foTQQ10G?=
 =?us-ascii?Q?AV0UhfvblrXoY0kL2YfY1Rw5BzyggTo/GF7WrqSg1aKifMybuSaoyfSXLdkB?=
 =?us-ascii?Q?aJTdP4wINS8XG3dOAIqRXU7xhd0lCUxGdoZwrUqTLxU9zBaDXpY/pwFGC1GN?=
 =?us-ascii?Q?v+bu5xeO2lWg1YkDuKdsaNvLEATZyBgShn70IomYIaAxxuPFvhwT+vR4sGAl?=
 =?us-ascii?Q?RTr5pYG8aMPxmB/5LudpfaMKXGm3YqcFTVJIcOP+awQWfDEC4hjYuIPfFNiv?=
 =?us-ascii?Q?fgz+FBzMIoqX30mn5TDQiXX/P4cIH1iTmXxrzSsAFuXnpoXBuKnuzJDHJaeU?=
 =?us-ascii?Q?jECtAsWQYBw5dc+myb5MkvrRmN+BiKexgIktdotSYso89Uf2kQM4sLjSXz7v?=
 =?us-ascii?Q?4Z6fLh1R0oV9M7Jhe++PZE56z31Ki4X/7LVCrS9keRxjUf838phim/qyMeJu?=
 =?us-ascii?Q?qljTyp1RNDdcu+7DmA+U7jxG3p1mixSQoePVt9yAaWPJJYWhS1qPPqB8rY6t?=
 =?us-ascii?Q?PXFQk46gHtTjTCVW03x5wby2tyLEsVGGiGeXgY1+BhtLqYferd9dbmg+mDrK?=
 =?us-ascii?Q?HcRPAyzzIbPGqVu3kVjAUZhIOBAnY6RxIx3H9vnovvmRkZi/PTNE9PsIve5c?=
 =?us-ascii?Q?soeJFAZ0Om8D/l8uBGdyZm4+8E3EYBIa2HbI0QblEgOVIzq2E3bSWZmJORgk?=
 =?us-ascii?Q?Ze3HVzDET3cob26e8ZfzMUtv9N9x1gLJPJFBWugMrAle8w19WdjMNN5UG415?=
 =?us-ascii?Q?IBvxpEAFWCYzDgPfHP+iLNtussPkeWm/En7EAV8zo6SgQ87RKkFGY16FGYrN?=
 =?us-ascii?Q?VcyaGC1FPoMoo8vR1O9A+LHQ1ufvqDzQ0I88clrTgO1rVRgxZ65wWQL3rs1S?=
 =?us-ascii?Q?cfaC8OZP9Mpl4zRDhGEpjjRV2rN+vT9Cva0q7BjuDWcDK7NSpr8PQEuV7Sba?=
 =?us-ascii?Q?dOECuGBJoftuimzzuo17km1i7buxoCJ+pwO6fAVVxqDZ4M+4HfR4z8S0apz9?=
 =?us-ascii?Q?6pc/Y+71QPQgkb274RbAaKsoUV/4NMw5GpOH0+kKhQOZcM1GatciOwEgn0k?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-448bf.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: a8498312-3941-4ba2-f5fc-08dcd4950021
X-MS-Exchange-CrossTenant-AuthSource: SY0P300MB1026.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2024 08:12:39.9404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME0P300MB0581
X-TUID: z29IJKi5wHSU

Manos Pitsidianakis <manos.pitsidianakis@linaro.org> writes:

> This commit adds a helper crate library, qemu-api-macros for derive (and
> other procedural) macros to be used along qemu-api.
>
> It needs to be a separate library because in Rust, procedural macros, or
> macros that can generate arbitrary code, need to be special separate
> compilation units.
>
> Only one macro is introduced in this patch, #[derive(Object)]. It
> generates a constructor to register a QOM TypeInfo on init and it must
> be used on types that implement qemu_api::definitions::ObjectImpl trait.
>
> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

Reviewed-by: Junjie Mao <junjie.mao@hotmail.com>

> ---
>  MAINTAINERS                                        |  1 +
>  rust/meson.build                                   |  1 +
>  rust/qemu-api-macros/Cargo.lock                    | 47 ++++++++++++++++++++++
>  rust/qemu-api-macros/Cargo.toml                    | 25 ++++++++++++
>  rust/qemu-api-macros/README.md                     |  1 +
>  rust/qemu-api-macros/meson.build                   | 25 ++++++++++++
>  rust/qemu-api-macros/src/lib.rs                    | 43 ++++++++++++++++++++
>  rust/qemu-api/meson.build                          |  3 ++
>  scripts/archive-source.sh                          |  4 +-
>  scripts/make-release                               |  3 +-
>  subprojects/.gitignore                             |  4 ++
>  .../packagefiles/proc-macro2-1-rs/meson.build      | 31 ++++++++++++++
>  subprojects/packagefiles/quote-1-rs/meson.build    | 29 +++++++++++++
>  subprojects/packagefiles/syn-2-rs/meson.build      | 40 ++++++++++++++++++
>  subprojects/proc-macro2-1-rs.wrap                  |  7 ++++
>  subprojects/quote-1-rs.wrap                        |  7 ++++
>  subprojects/syn-2-rs.wrap                          |  7 ++++
>  subprojects/unicode-ident-1-rs.wrap                |  7 ++++
>  subprojects/unicode-ident-1-rs/meson.build         | 20 +++++++++
>  19 files changed, 303 insertions(+), 2 deletions(-)
