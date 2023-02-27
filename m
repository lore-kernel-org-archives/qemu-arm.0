Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id l7-20020a5d5267000000b002c8ed82c56csm6744383wrc.116.2023.02.27.02.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 02:49:58 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id B57711FFB7;
	Mon, 27 Feb 2023 10:49:57 +0000 (GMT)
References: <20230220091358.17038-1-philmd@linaro.org>
 <20230220091358.17038-3-philmd@linaro.org>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, John Snow
 <jsnow@redhat.com>, qemu-block@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v2 02/24] hw/ide/mmio: Use CamelCase for MMIO_IDE state
 name
Date: Mon, 27 Feb 2023 10:49:53 +0000
In-reply-to: <20230220091358.17038-3-philmd@linaro.org>
Message-ID: <87zg8zidre.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: bX9kHS3t2mA2


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Following docs/devel/style.rst guidelines, rename MMIOIDEState
> as MmioIdeState.
>
> Having the structure name and its typedef named equally,
> we can manually convert from the old DECLARE_INSTANCE_CHECKER()
> macro to the more recent OBJECT_DECLARE_SIMPLE_TYPE().
>
> Note, due to that name mismatch, this macro wasn't automatically
> converted during commit 8063396bf3 ("Use OBJECT_DECLARE_SIMPLE_TYPE
> when possible").
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
