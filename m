Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id f4sm26791911wrs.34.2021.02.01.02.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Feb 2021 02:29:48 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id DF20B1FF7E;
	Mon,  1 Feb 2021 10:29:47 +0000 (GMT)
References: <20210131111316.232778-1-f4bug@amsat.org>
 <20210131111316.232778-4-f4bug@amsat.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Sarah Harris
 <S.E.Harris@kent.ac.uk>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, Eduardo
 Habkost <ehabkost@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, Anthony Green
 <green@moxielogic.com>, Kevin Wolf <kwolf@redhat.com>, Max Reitz
 <mreitz@redhat.com>, Chris Wulff <crwulff@gmail.com>, Guan Xuetao
 <gxt@mprc.pku.edu.cn>, qemu-riscv@nongnu.org, David Hildenbrand
 <david@redhat.com>, qemu-arm@nongnu.org, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, Michael Walle <michael@walle.cc>, Greg
 Kurz <groug@kaod.org>, qemu-ppc@nongnu.org, Peter Maydell
 <peter.maydell@linaro.org>, Stafford Horne <shorne@gmail.com>, Cornelia
 Huck <cohuck@redhat.com>, Marek Vasut <marex@denx.de>, Aleksandar Rikalo
 <aleksandar.rikalo@syrmia.com>, Sagar Karandikar
 <sagark@eecs.berkeley.edu>, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Thomas Huth
 <thuth@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>, =?utf-8?Q?Mar?=
 =?utf-8?Q?c-Andr=C3=A9?=
 Lureau <marcandre.lureau@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Michael Rolnik <mrolnik@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Alistair Francis <Alistair.Francis@wdc.com>, David Gibson
 <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 03/10] hw/sh4/Kconfig: Rename CONFIG_LM32 ->
 CONFIG_LM32_PERIPHERALS
Date: Mon, 01 Feb 2021 10:29:28 +0000
In-reply-to: <20210131111316.232778-4-f4bug@amsat.org>
Message-ID: <87mtwow06c.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: +ogcdUYtkUab


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> We want to be able to use the 'LM32' config for architecture
> specific features. As CONFIG_LM32 is only used to select
> peripherals, rename it CONFIG_LM32_PERIPHERALS.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

_DEVICES if you want, either way:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
