Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id n5-20020a5d51c5000000b002c70d97af78sm6888569wrv.85.2023.02.27.03.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 03:13:24 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id A50CC1FFB7;
	Mon, 27 Feb 2023 11:13:23 +0000 (GMT)
References: <20230220091358.17038-1-philmd@linaro.org>
 <20230220091358.17038-10-philmd@linaro.org>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>,
 qemu-block@nongnu.org, qemu-arm@nongnu.org, Richard Henderson
 <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 09/24] hw/ide: Include 'exec/ioport.h' instead of
 'hw/isa/isa.h'
Date: Mon, 27 Feb 2023 11:13:18 +0000
In-reply-to: <20230220091358.17038-10-philmd@linaro.org>
Message-ID: <87mt4zicoc.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: t7Yjhdl0KANz


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> The IDEBus structure has PortioList fields, so we need its
> declarations from "exec/ioport.h". "hw/isa/isa.h" is not required.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Message-Id: <20230215112712.23110-9-philmd@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
