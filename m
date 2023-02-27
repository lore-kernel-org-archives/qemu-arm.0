Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id u26-20020a05600c441a00b003e21638c0edsm8956302wmn.45.2023.02.27.03.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 03:12:55 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id A85581FFB7;
	Mon, 27 Feb 2023 11:12:54 +0000 (GMT)
References: <20230220091358.17038-1-philmd@linaro.org>
 <20230220091358.17038-8-philmd@linaro.org>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, John Snow
 <jsnow@redhat.com>, qemu-block@nongnu.org, Richard Henderson
 <richard.henderson@linaro.org>, qemu-arm@nongnu.org
Subject: Re: [PATCH v2 07/24] hw/ide/atapi: Restrict 'scsi/constants.h'
 inclusion
Date: Mon, 27 Feb 2023 11:12:49 +0000
In-reply-to: <20230220091358.17038-8-philmd@linaro.org>
Message-ID: <87v8jnicp5.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: tYRMcO+ciLst


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Only atapi.c requires the SCSI constants. No need to include
> it in all files including "hw/ide/internal.h".
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Message-Id: <20230215112712.23110-7-philmd@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
