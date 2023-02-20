Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id h18-20020a5d4312000000b002be0b1e556esm2733222wrq.59.2023.02.20.07.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 07:30:44 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 464111FFB7;
	Mon, 20 Feb 2023 15:30:44 +0000 (GMT)
References: <20230220115114.25237-1-philmd@linaro.org>
 <20230220115114.25237-3-philmd@linaro.org>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Markus
 Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, =?utf-8?Q?Marc-Andr=C3=A9?=
 Lureau
 <marcandre.lureau@redhat.com>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org
Subject: Re: [PATCH 2/8] hw/char/pl011: Un-inline pl011_create()
Date: Mon, 20 Feb 2023 15:30:39 +0000
In-reply-to: <20230220115114.25237-3-philmd@linaro.org>
Message-ID: <87ttzgs6aj.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 7oYOVni1OoLO


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> pl011_create() is only used in DeviceRealize handlers,
> not a hot-path. Inlining is not justified.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
