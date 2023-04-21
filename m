Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id m1-20020a7bca41000000b003f179fc6d8esm4765070wml.44.2023.04.21.06.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 06:28:34 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 6CCA01FFB7;
	Fri, 21 Apr 2023 14:28:34 +0100 (BST)
References: <20230421131547.2177449-1-clg@kaod.org>
User-agent: mu4e 1.11.2; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Thomas
 Huth <thuth@redhat.com>, Andrew Jeffery <andrew@aj.id.au>, Steven Lee
 <steven_lee@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 qemu-arm@nongnu.org
Subject: Re: [PATCH] aspeed/hace: Initialize g_autofree pointer
Date: Fri, 21 Apr 2023 14:28:29 +0100
In-reply-to: <20230421131547.2177449-1-clg@kaod.org>
Message-ID: <87cz3xbbzx.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: nbm0Dd7SM/V3


C=C3=A9dric Le Goater <clg@kaod.org> writes:

> As mentioned in docs/devel/style.rst "Automatic memory deallocation":
>
> * Variables declared with g_auto* MUST always be initialized,
>   otherwise the cleanup function will use uninitialized stack memory
>
> This avoids QEMU to coredump when running the "hash test" command
> under Zephyr.
>
> Cc: Steven Lee <steven_lee@aspeedtech.com>
> Cc: Joel Stanley <joel@jms.id.au>
> Fixes: c5475b3f9a ("hw: Model ASPEED's Hash and Crypto Engine")
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
