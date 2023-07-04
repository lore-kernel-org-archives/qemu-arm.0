Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id q18-20020a1ce912000000b003fbd9e390e1sm6039315wmc.47.2023.07.04.06.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 06:43:42 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id D86061FFBB;
	Tue,  4 Jul 2023 14:43:41 +0100 (BST)
References: <20230628110905.38125-1-akihiko.odaki@daynix.com>
User-agent: mu4e 1.11.8; emacs 29.0.92
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org, Strahinja Jankovic
 <strahinja.p.jankovic@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>, Beniamino Galvani <b.galvani@gmail.com>,
 qemu-arm@nongnu.org
Subject: Re: [PATCH] hw: arm: allwinner-sramc: Set class_size
Date: Tue, 04 Jul 2023 14:43:35 +0100
In-reply-to: <20230628110905.38125-1-akihiko.odaki@daynix.com>
Message-ID: <871qhnhjw2.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: qYTZVQnkK9D3


Akihiko Odaki <akihiko.odaki@daynix.com> writes:

> AwSRAMCClass is larger than SysBusDeviceClass so the class size must be
> advertised accordingly.
>
> Fixes: 05def917e1 ("hw: arm: allwinner-sramc: Add SRAM Controller support=
 for R40")
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
