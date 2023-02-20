Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 18-20020a05600c231200b003e20fa01a86sm1025760wmo.13.2023.02.20.07.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 07:31:28 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 12B7E1FFB7;
	Mon, 20 Feb 2023 15:31:28 +0000 (GMT)
References: <20230220115114.25237-1-philmd@linaro.org>
 <20230220115114.25237-4-philmd@linaro.org>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Markus
 Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, =?utf-8?Q?Marc-Andr=C3=A9?=
 Lureau
 <marcandre.lureau@redhat.com>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org
Subject: Re: [PATCH 3/8] hw/char/pl011: Open-code pl011_luminary_create()
Date: Mon, 20 Feb 2023 15:31:23 +0000
In-reply-to: <20230220115114.25237-4-philmd@linaro.org>
Message-ID: <87pma4s69b.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 06HrzxUyMnAs


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> pl011_luminary_create() is only used for the Stellaris board,
> open-code it.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
