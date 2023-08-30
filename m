Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id j14-20020adfea4e000000b003142ea7a661sm16947763wrn.21.2023.08.30.08.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 08:01:01 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 5165E1FFBB;
	Wed, 30 Aug 2023 16:01:01 +0100 (BST)
References: <20230818033648.8326-1-akihiko.odaki@daynix.com>
 <20230818033648.8326-14-akihiko.odaki@daynix.com>
User-agent: mu4e 1.11.16; emacs 29.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Mikhail Tyutin <m.tyutin@yadro.com>, Aleksandr Anenkov
 <a.anenkov@yadro.com>, qemu-devel@nongnu.org, Philippe =?utf-8?Q?Mathieu-?=
 =?utf-8?Q?Daud=C3=A9?=
 <philmd@linaro.org>, Eduardo Habkost <eduardo@habkost.net>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Yanan Wang
 <wangyanan55@huawei.com>, Peter Maydell <peter.maydell@linaro.org>, Song
 Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, =?utf-8?Q?C=C3=A9dric?= Le
 Goater
 <clg@kaod.org>, David Gibson <david@gibson.dropbear.id.au>, Greg Kurz
 <groug@kaod.org>, Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>, Bin
 Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, Liu
 Zhiwei <zhiwei_liu@linux.alibaba.com>, Richard Henderson
 <richard.henderson@linaro.org>, David Hildenbrand <david@redhat.com>, Ilya
 Leoshkevich <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>, Bastian
 Koppelmann <kbastian@mail.uni-paderborn.de>, "open list:ARM TCG CPUs"
 <qemu-arm@nongnu.org>, "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>, "open list:S390 TCG
 CPUs" <qemu-s390x@nongnu.org>
Subject: Re: [PATCH RESEND v5 13/26] hw/core/cpu: Return static value with
 gdb_arch_name()
Date: Wed, 30 Aug 2023 16:00:56 +0100
In-reply-to: <20230818033648.8326-14-akihiko.odaki@daynix.com>
Message-ID: <87r0nkr2vm.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 9D5btklerzCT


Akihiko Odaki <akihiko.odaki@daynix.com> writes:

> All implementations of gdb_arch_name() returns dynamic duplicates of
> static strings. It's also unlikely that there will be an implementation
> of gdb_arch_name() that returns a truly dynamic value due to the nature
> of the function returning a well-known identifiers. Qualify the value
> gdb_arch_name() with const and make all of its implementations return
> static strings.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
