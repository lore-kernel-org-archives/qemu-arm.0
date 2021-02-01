Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id v4sm30395438wrw.42.2021.02.01.03.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Feb 2021 03:11:58 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 13D1C1FF7E;
	Mon,  1 Feb 2021 11:11:58 +0000 (GMT)
References: <20210131111316.232778-1-f4bug@amsat.org>
 <20210131111316.232778-5-f4bug@amsat.org>
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
Subject: Re: [PATCH 04/10] hw/lm32/Kconfig: Have MILKYMIST select
 LM32_PERIPHERALS
Date: Mon, 01 Feb 2021 11:11:52 +0000
In-reply-to: <20210131111316.232778-5-f4bug@amsat.org>
Message-ID: <87k0rsvy81.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: Vl4KCUDp7g/H


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> The Milkymist board requires more than the PTIMER. Directly
> select the LM32_PERIPHERALS. This fixes:
>
>   /usr/bin/ld:
>   libqemu-lm32-softmmu.fa.p/target_lm32_gdbstub.c.o: in function `lm32_cp=
u_gdb_read_register':
>   target/lm32/gdbstub.c:46: undefined reference to `lm32_pic_get_im'
>   target/lm32/gdbstub.c:48: undefined reference to `lm32_pic_get_ip'
>   libqemu-lm32-softmmu.fa.p/target_lm32_op_helper.c.o: in function `helpe=
r_wcsr_im':
>   target/lm32/op_helper.c:107: undefined reference to `lm32_pic_set_im'
>   libqemu-lm32-softmmu.fa.p/target_lm32_op_helper.c.o: in function `helpe=
r_wcsr_ip':
>   target/lm32/op_helper.c:114: undefined reference to `lm32_pic_set_ip'
>   libqemu-lm32-softmmu.fa.p/target_lm32_op_helper.c.o: in function `helpe=
r_wcsr_jtx':
>   target/lm32/op_helper.c:120: undefined reference to `lm32_juart_set_jtx'
>   libqemu-lm32-softmmu.fa.p/target_lm32_op_helper.c.o: in function `helpe=
r_wcsr_jrx':
>   target/lm32/op_helper.c:125: undefined reference to `lm32_juart_set_jrx'
>   libqemu-lm32-softmmu.fa.p/target_lm32_translate.c.o: in function `lm32_=
cpu_dump_state':
>   target/lm32/translate.c:1161: undefined reference to `lm32_pic_get_ip'
>   target/lm32/translate.c:1161: undefined reference to `lm32_pic_get_im'
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
