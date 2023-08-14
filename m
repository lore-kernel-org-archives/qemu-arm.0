Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id q5-20020a7bce85000000b003fe17e04269sm14281629wmj.40.2023.08.14.06.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 06:21:15 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id D93D21FFBB;
	Mon, 14 Aug 2023 14:21:14 +0100 (BST)
References: <20230731084354.115015-1-akihiko.odaki@daynix.com>
 <20230731084354.115015-7-akihiko.odaki@daynix.com>
User-agent: mu4e 1.11.14; emacs 29.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour
 <ma.mandourr@gmail.com>, Eduardo Habkost <eduardo@habkost.net>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Philippe =?utf-8?Q?Mathieu-Daud?=
 =?utf-8?Q?=C3=A9?=
 <philmd@linaro.org>, Yanan Wang <wangyanan55@huawei.com>, Richard
 Henderson <richard.henderson@linaro.org>, =?utf-8?Q?Marc-Andr=C3=A9?=
 Lureau
 <marcandre.lureau@redhat.com>, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>, Peter
 Maydell <peter.maydell@linaro.org>, Michael Rolnik <mrolnik@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Brian Cain
 <bcain@quicinc.com>, Song Gao <gaosong@loongson.cn>, Xiaojuan Yang
 <yangxiaojuan@loongson.cn>, Laurent Vivier <laurent@vivier.eu>, Aurelien
 Jarno <aurelien@aurel32.net>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Chris Wulff
 <crwulff@gmail.com>, Marek Vasut <marex@denx.de>, Stafford Horne
 <shorne@gmail.com>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, David Gibson
 <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>, Nicholas Piggin
 <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis
 <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>, Weiwei Li
 <liweiwei@iscas.ac.cn>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, David Hildenbrand
 <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, Max Filippov
 <jcmvbkbc@gmail.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: Re: [RFC PATCH 06/24] hw/core/cpu: Replace gdb_core_xml_file with
 gdb_core_feature
Date: Mon, 14 Aug 2023 14:19:38 +0100
In-reply-to: <20230731084354.115015-7-akihiko.odaki@daynix.com>
Message-ID: <87o7j9rc8l.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: L1bGlaLlAY4b


Akihiko Odaki <akihiko.odaki@daynix.com> writes:

> This is a tree-wide change to replace gdb_core_xml_file, the path to
> GDB XML file with gdb_core_feature, the pointer to GDBFeature. This
> also replaces the values assigned to gdb_num_core_regs with the
> num_regs member of GDBFeature where applicable to remove magic numbers.
>
> A following change will utilize additional information provided by
> GDBFeature to simplify XML file lookup.

re: other comment about assert(). Maybe gdb_find_static_feature() needs to =
assert
success because:

Thread 1 "qemu-loongarch6" received signal SIGSEGV, Segmentation fault.
loongarch_cpu_class_init (c=3D<optimized out>, data=3D<optimized out>) at .=
./../target/loongarch/cpu.c:726
726         cc->gdb_num_core_regs =3D cc->gdb_core_feature->num_regs;
(gdb) p/x cc->gdb_core_feature=20
$1 =3D 0x0
(gdb) l
721         cc->disas_set_info =3D loongarch_cpu_disas_set_info;
722         cc->gdb_read_register =3D loongarch_cpu_gdb_read_register;
723         cc->gdb_write_register =3D loongarch_cpu_gdb_write_register;
724         cc->disas_set_info =3D loongarch_cpu_disas_set_info;
725         cc->gdb_core_feature =3D gdb_find_static_feature("loongarch-bas=
e64.xml");
726         cc->gdb_num_core_regs =3D cc->gdb_core_feature->num_regs;
727         cc->gdb_stop_before_watchpoint =3D true;
728         cc->gdb_arch_name =3D loongarch_gdb_arch_name;
729
730     #ifdef CONFIG_TCG

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
