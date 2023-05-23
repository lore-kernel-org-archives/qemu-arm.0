Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id t5-20020adfe445000000b003079986fd71sm11166021wrm.88.2023.05.23.06.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 06:36:56 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id D96431FFBB;
	Tue, 23 May 2023 14:36:55 +0100 (BST)
References: <20230522153144.30610-1-philmd@linaro.org>
 <20230522153144.30610-10-philmd@linaro.org>
User-agent: mu4e 1.11.6; emacs 29.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>, Peter
 Maydell
 <peter.maydell@linaro.org>
Subject: Re: [PATCH 09/12] hw/char/pl011: Check if transmitter is enabled
Date: Tue, 23 May 2023 14:36:52 +0100
In-reply-to: <20230522153144.30610-10-philmd@linaro.org>
Message-ID: <87h6s341ag.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: KujMx+6fN/NA


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Do not transmit characters when UART or transmitter are disabled.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
