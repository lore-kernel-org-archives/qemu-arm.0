Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id z11-20020adff1cb000000b0030789698eebsm11096719wro.89.2023.05.23.06.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 06:38:57 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 5ADEF1FFBB;
	Tue, 23 May 2023 14:38:57 +0100 (BST)
References: <20230522153144.30610-1-philmd@linaro.org>
 <20230522153144.30610-11-philmd@linaro.org>
User-agent: mu4e 1.11.6; emacs 29.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>, Peter
 Maydell
 <peter.maydell@linaro.org>
Subject: Re: [PATCH 10/12] hw/char/pl011: Check if receiver is enabled
Date: Tue, 23 May 2023 14:38:52 +0100
In-reply-to: <20230522153144.30610-11-philmd@linaro.org>
Message-ID: <87cz2r4172.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: sdSCtbrBWtlf


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Do not receive characters when UART or receiver are disabled.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
