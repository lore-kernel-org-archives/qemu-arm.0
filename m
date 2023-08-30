Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id f11-20020a7bcd0b000000b003fedcd02e2asm2539785wmj.35.2023.08.30.08.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 08:02:22 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 460E71FFBB;
	Wed, 30 Aug 2023 16:02:22 +0100 (BST)
References: <20230818033648.8326-1-akihiko.odaki@daynix.com>
 <20230818033648.8326-19-akihiko.odaki@daynix.com>
User-agent: mu4e 1.11.16; emacs 29.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Mikhail Tyutin <m.tyutin@yadro.com>, Aleksandr Anenkov
 <a.anenkov@yadro.com>, qemu-devel@nongnu.org, Peter Maydell
 <peter.maydell@linaro.org>, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Subject: Re: [PATCH RESEND v5 18/26] target/arm: Remove references to
 gdb_has_xml
Date: Wed, 30 Aug 2023 16:02:17 +0100
In-reply-to: <20230818033648.8326-19-akihiko.odaki@daynix.com>
Message-ID: <87msy8r2td.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: XIi+duXjVEFq


Akihiko Odaki <akihiko.odaki@daynix.com> writes:

> GDB has XML support since 6.7 which was released in 2007.
> It's time to remove support for old GDB versions without XML support.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
