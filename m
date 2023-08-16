Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id t1-20020a5d5341000000b0031763fd36c4sm21636148wrv.104.2023.08.16.08.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 08:04:04 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 6E4681FFBB;
	Wed, 16 Aug 2023 16:04:04 +0100 (BST)
References: <20230731084354.115015-1-akihiko.odaki@daynix.com>
 <20230731084354.115015-16-akihiko.odaki@daynix.com>
 <87350lr7p8.fsf@linaro.org>
 <f41aae27-8538-46b5-93fa-67de41602077@daynix.com>
User-agent: mu4e 1.11.14; emacs 29.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, Akihiko Odaki
 <akihiko.odaki@daynix.com>
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
Subject: Re: [RFC PATCH 15/24] target/arm: Fill new members of GDBFeature
Date: Wed, 16 Aug 2023 16:03:31 +0100
In-reply-to: <f41aae27-8538-46b5-93fa-67de41602077@daynix.com>
Message-ID: <87r0o3ni57.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: saIqk7kX3GYw


Akihiko Odaki <akihiko.odaki@daynix.com> writes:

> On 2023/08/14 23:56, Alex Benn=C3=A9e wrote:
>> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
>>=20
>>> These members will be used to help plugins to identify registers.
>>>
>>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>>> ---
>>>   target/arm/gdbstub.c   | 46 +++++++++++++++++++++++++++---------------
>>>   target/arm/gdbstub64.c | 42 +++++++++++++++++++++++++-------------
>>>   2 files changed, 58 insertions(+), 30 deletions(-)
>>>
>>> diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
>>> index 100a6eed15..56d24028f6 100644
>>> --- a/target/arm/gdbstub.c
>>> +++ b/target/arm/gdbstub.c
>>> @@ -270,6 +270,7 @@ static void arm_gen_one_feature_sysreg(GString *s,
>>>       g_string_append_printf(s, " regnum=3D\"%d\"", regnum);
>>>       g_string_append_printf(s, " group=3D\"cp_regs\"/>");
>>>       dyn_feature->data.cpregs.keys[dyn_feature->desc.num_regs] =3D ri_=
key;
>>> +    ((const char **)dyn_feature->desc.regs)[dyn_feature->desc.num_regs=
] =3D ri->name;
>>>       dyn_feature->desc.num_regs++;
>>>   }
>>>   @@ -316,6 +317,8 @@ static GDBFeature
>>> *arm_gen_dynamic_sysreg_feature(CPUState *cs, int base_reg)
>>>       DynamicGDBFeatureInfo *dyn_feature =3D &cpu->dyn_sysreg_feature;
>>>       gsize num_regs =3D g_hash_table_size(cpu->cp_regs);
>>>   +    dyn_feature->desc.name =3D "org.qemu.gdb.arm.sys.regs";
>>> +    dyn_feature->desc.regs =3D g_new(const char *, num_regs);
>> AIUI this means we now have an array of register names which mirrors
>> the
>> names embedded in the XML. This smells like a few steps away from just
>> abstracting the whole XML away from the targets and generating them
>> inside gdbstub when we need them. As per my stalled attempt I referenced
>> earlier.
>
> The abstraction is strictly limited for identifiers. Most plugin
> should already have some knowledge of how registers are used. For
> example, a plugin that tracks stack frame for RISC-V should know sp is
> the stack pointer register. Similarly, a cycle simulator plugin should
> know how registers are used in a program. Only identifiers matter in
> such cases.
>
> I'm definitely *not* in favor of abstracting the whole XML for
> plugins. It will be too hard to maintain ABI compatibility when a new
> attribute emerges, for example.

No I agree the XML shouldn't go near the plugins. I was just looking to
avoid having an XML builder for every target.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
