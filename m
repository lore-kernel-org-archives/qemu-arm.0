Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id t11-20020adfe44b000000b0030fd03e3d25sm21832382wrm.75.2023.08.16.08.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 08:02:33 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id D85EA1FFBB;
	Wed, 16 Aug 2023 16:02:32 +0100 (BST)
References: <20230731084354.115015-1-akihiko.odaki@daynix.com>
 <20230731084354.115015-7-akihiko.odaki@daynix.com>
 <871qg5sryb.fsf@linaro.org>
 <ee599577-f185-4f12-b985-209a6322d2f7@daynix.com>
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
Subject: Re: [RFC PATCH 06/24] hw/core/cpu: Replace gdb_core_xml_file with
 gdb_core_feature
Date: Wed, 16 Aug 2023 16:00:48 +0100
In-reply-to: <ee599577-f185-4f12-b985-209a6322d2f7@daynix.com>
Message-ID: <87v8dfni7r.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: PAGDYHHmryHn


Akihiko Odaki <akihiko.odaki@daynix.com> writes:

> On 2023/08/14 20:59, Alex Benn=C3=A9e wrote:
>> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
>>=20
>>> This is a tree-wide change to replace gdb_core_xml_file, the path to
>>> GDB XML file with gdb_core_feature, the pointer to GDBFeature. This
>>> also replaces the values assigned to gdb_num_core_regs with the
>>> num_regs member of GDBFeature where applicable to remove magic numbers.
>>>
>>> A following change will utilize additional information provided by
>>> GDBFeature to simplify XML file lookup.
>>>
>>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>>> ---
>>>   include/hw/core/cpu.h   | 5 +++--
>>>   target/s390x/cpu.h      | 2 --
>>>   gdbstub/gdbstub.c       | 6 +++---
>>>   target/arm/cpu.c        | 4 ++--
>>>   target/arm/cpu64.c      | 4 ++--
>>>   target/arm/tcg/cpu32.c  | 3 ++-
>>>   target/avr/cpu.c        | 4 ++--
>>>   target/hexagon/cpu.c    | 2 +-
>>>   target/i386/cpu.c       | 7 +++----
>>>   target/loongarch/cpu.c  | 4 ++--
>>>   target/m68k/cpu.c       | 7 ++++---
>>>   target/microblaze/cpu.c | 4 ++--
>>>   target/ppc/cpu_init.c   | 4 ++--
>>>   target/riscv/cpu.c      | 7 ++++---
>>>   target/rx/cpu.c         | 4 ++--
>>>   target/s390x/cpu.c      | 4 ++--
>>>   16 files changed, 36 insertions(+), 35 deletions(-)
>>>
>>> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
>>> index fdcbe87352..84219c1885 100644
>>> --- a/include/hw/core/cpu.h
>>> +++ b/include/hw/core/cpu.h
>>> @@ -23,6 +23,7 @@
>>>   #include "hw/qdev-core.h"
>>>   #include "disas/dis-asm.h"
>>>   #include "exec/cpu-common.h"
>>> +#include "exec/gdbstub.h"
>>>   #include "exec/hwaddr.h"
>>>   #include "exec/memattrs.h"
>>>   #include "qapi/qapi-types-run-state.h"
>>> @@ -127,7 +128,7 @@ struct SysemuCPUOps;
>>>    *       breakpoint.  Used by AVR to handle a gdb mis-feature with
>>>    *       its Harvard architecture split code and data.
>>>    * @gdb_num_core_regs: Number of core registers accessible to GDB.
>> It seems redundant to have this when gdb_core_features already
>> encapsulates this, especially since...
>>=20
>>> - * @gdb_core_xml_file: File name for core registers GDB XML descriptio=
n.
>>> + * @gdb_core_feature: GDB core feature description.
>>>    * @gdb_stop_before_watchpoint: Indicates whether GDB expects the CPU=
 to stop
>>>    *           before the insn which triggers a watchpoint rather than =
after it.
>>>    * @gdb_arch_name: Optional callback that returns the architecture na=
me known
>>> @@ -163,7 +164,7 @@ struct CPUClass {
>>>       int (*gdb_write_register)(CPUState *cpu, uint8_t *buf, int reg);
>>>       vaddr (*gdb_adjust_breakpoint)(CPUState *cpu, vaddr addr);
>>>   -    const char *gdb_core_xml_file;
>>> +    const GDBFeature *gdb_core_feature;
>>>       gchar * (*gdb_arch_name)(CPUState *cpu);
>>>       const char * (*gdb_get_dynamic_xml)(CPUState *cpu, const char *xm=
lname);
>>>=20=20=20
>> <snip>
>>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>>> index d71a162070..a206ab6b1b 100644
>>> --- a/target/arm/cpu.c
>>> +++ b/target/arm/cpu.c
>>> @@ -2353,7 +2353,6 @@ static void arm_cpu_class_init(ObjectClass *oc, v=
oid *data)
>>>   #ifndef CONFIG_USER_ONLY
>>>       cc->sysemu_ops =3D &arm_sysemu_ops;
>>>   #endif
>>> -    cc->gdb_num_core_regs =3D 26;
>>>       cc->gdb_arch_name =3D arm_gdb_arch_name;
>>>       cc->gdb_get_dynamic_xml =3D arm_gdb_get_dynamic_xml;
>>>       cc->gdb_stop_before_watchpoint =3D true;
>>> @@ -2378,7 +2377,8 @@ static void cpu_register_class_init(ObjectClass *=
oc, void *data)
>>>       CPUClass *cc =3D CPU_CLASS(acc);
>>>         acc->info =3D data;
>>> -    cc->gdb_core_xml_file =3D "arm-core.xml";
>>> +    cc->gdb_core_feature =3D gdb_find_static_feature("arm-core.xml");
>>> +    cc->gdb_num_core_regs =3D cc->gdb_core_feature->num_regs;
>> You are doing assignments like this. I think something like this in
>> gdbstub:
>> modified   gdbstub/gdbstub.c
>> @@ -440,7 +440,7 @@ int gdb_read_register(CPUState *cpu, GByteArray *buf=
, int reg, bool has_xml)
>>       CPUArchState *env =3D cpu->env_ptr;
>>       GDBRegisterState *r;
>>   -    if (reg < cc->gdb_num_core_regs) {
>> +    if (reg < cc->gdb_core_feature->num_regs) {
>>           return cc->gdb_read_register(cpu, buf, reg, has_xml);
>>       }
>>   @@ -459,7 +459,7 @@ static int gdb_write_register(CPUState *cpu,
>> uint8_t *mem_buf, int reg,
>>       CPUArchState *env =3D cpu->env_ptr;
>>       GDBRegisterState *r;
>>   -    if (reg < cc->gdb_num_core_regs) {
>> +    if (reg < cc->gdb_core_feature->num_regs) {
>>           return cc->gdb_write_register(cpu, mem_buf, reg, has_xml);
>>       }
>> makes most of the uses go away. Some of the other arches might need
>> target specific tweaks.
>
> The problem is how to deal with the target specific tweaks. ppc
> requires gdb_num_core_regs to have some value greater than
> cc->gdb_core_feature->num_regs for compatibility with legacy GDB.
> Other architectures simply do not have XMLs. Simply replacing
> cc->gdb_num_core_regs with cc->gdb_core_feature->num_regs will break
> those architectures.

How about:

  int core_regs =3D cc->gdb_core_feature ? cc->gdb_core_feature->num_regs
  : cc->gdb_num_core_regs

And document the field as for legacy gdb use only?

>
>> <snip>
>>=20


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
