Received: by 2002:a17:906:5ac8:b0:98d:b2f5:1316 with SMTP id x8csp426552ejs;
        Wed, 16 Aug 2023 08:10:29 -0700 (PDT)
X-Received: by 2002:aca:1a11:0:b0:3a7:4478:714f with SMTP id a17-20020aca1a11000000b003a74478714fmr2305892oia.55.1692198628838;
        Wed, 16 Aug 2023 08:10:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692198628; cv=none;
        d=google.com; s=arc-20160816;
        b=sw+fnxo5jPxHOZ+r4YsqVM2FmBRvVJ60B+Vnx8KsAAXbSD/7Fc2pu09G2TXdUNtQZ+
         Xr7WSaeWQkfHeIHh64sSL8Fi0kXeDi+wzi+2LpiVVUt8B3p9AZ88Z6cM9lQSYQt+o9UH
         2Q/rGVniYFBjCJrOIv6FzGEk+HmqieFz+4+A0fM8tX7yINq9QoTJeGsddivfClK/AfkR
         BboJXoAvQy7vkx5ViS/s0CkEHbN3LTNhuOK4+5EHh4dQ6U6AZdk9gd35CtBRjjg/5Ykn
         nZcBImAEGZ3jZBjr2pHFOujBxxUWCP5xeEnG6L5LuBS3Pak1NdJsfY5TsTM/6Z7TCk1E
         xuaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=GtoAo+YxHq0clYt7noLkNz2QwIMfUfU18YfbLW+CcZw=;
        fh=EcO5he7kBhkq1+blo3bftTd/gQjAs68nzvCtO96H+rw=;
        b=JZ5Ja6hzO7XiDUz4IIyIb+g5opVGrTgRone0Ig/XOzan4dS67rz8lIBfK0xgf8QTsh
         Vz9riZF2RJzo5yyuHGEeq4iublzfokKUhYWbEwOKDY/YYIZ+d4guAkWsxmrI6fyvcsKR
         Q/MXBDnpYg7q+f9SV/Jcd2wzoLkM2oa7IXjXSjVFlZ22KVPsHaBwwS40EpJHKDTyr1BU
         CHvW3X2i4enXFZQQi55gBJP5WX69b59+01NTqvhtqBbPnfbrYYoiZMVpZIwW7Nw6BPWT
         alCRjy18gkg+hWneH+pp7oefTVN/hvKBnDHrcz2r3dzd25w0kQQw8BSzeG4gyNBkBH/7
         Kj3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=x571F1g6;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a4-20020a05680804c400b003a776cf12e5sor10048981oie.1.2023.08.16.08.10.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 16 Aug 2023 08:10:28 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=x571F1g6;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1692198628; x=1692803428;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GtoAo+YxHq0clYt7noLkNz2QwIMfUfU18YfbLW+CcZw=;
        b=x571F1g6bhI/imq7nswqdVi6pdBnlRL5suIXx9pVbrSD60+ryP03ijxfrXv+ZonCnL
         Pqs62fp8c1gdveQFMPbdAFr8DqEakNVuGmTloYUCHvt4L+8Y8U91IwrywXzMc4leUrkG
         t9n/7WMJarsxqPhbTf6/R2gikQJblVVJdhpQFiWg9pracbPxg7dp/i6cXXi0dIW4pJWn
         OH4BCeXKBnEPNaX11ok/TTgRY+13gVPDWitN2nu1DQg6CXBygaAOXw5VfJiQNKwKJicf
         Sr1xO29v9/GwEUNUTiRZfODGZyrJ2pFf5kI5DWQHlk+Cc3bvGJDamS8UlVB6aYgATZCF
         Jmmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692198628; x=1692803428;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GtoAo+YxHq0clYt7noLkNz2QwIMfUfU18YfbLW+CcZw=;
        b=S3rBxt8TgoOPkfy7MP774mGb3WQbAYITmO8cO7XR3NufM1FeKqYYSA17CjOw3E1yh+
         xZobOILl6LFs9jAG5xTOUfX3L5g+7V4myldNOcgTMEq52mDRkBhA4eMC/zCS2OEohRWA
         Hvtd4jdESLYDIkSrYGuGpxjSDiJjHhZuJIsYHRFaLiSXE7Em6o3lPSt6/QRgVWYPvIwi
         0qjsA4AxQToXvJDwDKkLqpIbYeRnRZpXBiQxreqAaSjKz7j4ZSZbqKQP3SZ1n4lxqhSQ
         tc9Y23oaPapg7Erk2GLA1BduikMXS8iEPDBun8V7NqwjO3k0O+vqHYunxu5/xpNo0bEK
         GxIA==
X-Gm-Message-State: AOJu0Yw3QfY8x+GCcMPcwWA/GuDjaI4fF3z8+rnnXD9adwfVO5M5t9/A
	sDoRPtYN8JhTGNjY2vLBDPn8QZcuUNmLNYEYlys=
X-Google-Smtp-Source: AGHT+IHoY8nLEIT/A9eWI3EkdY0/kp2NxDyiFfDp57Yfn++hxAybdRaiFFvValtegzFhn55DAj3sWA==
X-Received: by 2002:a05:6808:f94:b0:3a7:239d:af64 with SMTP id o20-20020a0568080f9400b003a7239daf64mr2278717oiw.49.1692198628312;
        Wed, 16 Aug 2023 08:10:28 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from ?IPV6:2400:4050:a840:1e00:78d2:b862:10a7:d486? ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id s10-20020a639e0a000000b005633311c70dsm10919319pgd.32.2023.08.16.08.10.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Aug 2023 08:10:27 -0700 (PDT)
Message-ID: <05c975ac-4138-4705-9dae-9b529ddb70d4@daynix.com>
Date: Thu, 17 Aug 2023 00:10:18 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 06/24] hw/core/cpu: Replace gdb_core_xml_file with
 gdb_core_feature
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour
 <ma.mandourr@gmail.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Michael Rolnik
 <mrolnik@gmail.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Brian Cain <bcain@quicinc.com>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Laurent Vivier
 <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
References: <20230731084354.115015-1-akihiko.odaki@daynix.com>
 <20230731084354.115015-7-akihiko.odaki@daynix.com>
 <871qg5sryb.fsf@linaro.org> <ee599577-f185-4f12-b985-209a6322d2f7@daynix.com>
 <87v8dfni7r.fsf@linaro.org>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <87v8dfni7r.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 7hclvax4uj4Q

On 2023/08/17 0:00, Alex Bennée wrote:
> 
> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
> 
>> On 2023/08/14 20:59, Alex Bennée wrote:
>>> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
>>>
>>>> This is a tree-wide change to replace gdb_core_xml_file, the path to
>>>> GDB XML file with gdb_core_feature, the pointer to GDBFeature. This
>>>> also replaces the values assigned to gdb_num_core_regs with the
>>>> num_regs member of GDBFeature where applicable to remove magic numbers.
>>>>
>>>> A following change will utilize additional information provided by
>>>> GDBFeature to simplify XML file lookup.
>>>>
>>>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>>>> ---
>>>>    include/hw/core/cpu.h   | 5 +++--
>>>>    target/s390x/cpu.h      | 2 --
>>>>    gdbstub/gdbstub.c       | 6 +++---
>>>>    target/arm/cpu.c        | 4 ++--
>>>>    target/arm/cpu64.c      | 4 ++--
>>>>    target/arm/tcg/cpu32.c  | 3 ++-
>>>>    target/avr/cpu.c        | 4 ++--
>>>>    target/hexagon/cpu.c    | 2 +-
>>>>    target/i386/cpu.c       | 7 +++----
>>>>    target/loongarch/cpu.c  | 4 ++--
>>>>    target/m68k/cpu.c       | 7 ++++---
>>>>    target/microblaze/cpu.c | 4 ++--
>>>>    target/ppc/cpu_init.c   | 4 ++--
>>>>    target/riscv/cpu.c      | 7 ++++---
>>>>    target/rx/cpu.c         | 4 ++--
>>>>    target/s390x/cpu.c      | 4 ++--
>>>>    16 files changed, 36 insertions(+), 35 deletions(-)
>>>>
>>>> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
>>>> index fdcbe87352..84219c1885 100644
>>>> --- a/include/hw/core/cpu.h
>>>> +++ b/include/hw/core/cpu.h
>>>> @@ -23,6 +23,7 @@
>>>>    #include "hw/qdev-core.h"
>>>>    #include "disas/dis-asm.h"
>>>>    #include "exec/cpu-common.h"
>>>> +#include "exec/gdbstub.h"
>>>>    #include "exec/hwaddr.h"
>>>>    #include "exec/memattrs.h"
>>>>    #include "qapi/qapi-types-run-state.h"
>>>> @@ -127,7 +128,7 @@ struct SysemuCPUOps;
>>>>     *       breakpoint.  Used by AVR to handle a gdb mis-feature with
>>>>     *       its Harvard architecture split code and data.
>>>>     * @gdb_num_core_regs: Number of core registers accessible to GDB.
>>> It seems redundant to have this when gdb_core_features already
>>> encapsulates this, especially since...
>>>
>>>> - * @gdb_core_xml_file: File name for core registers GDB XML description.
>>>> + * @gdb_core_feature: GDB core feature description.
>>>>     * @gdb_stop_before_watchpoint: Indicates whether GDB expects the CPU to stop
>>>>     *           before the insn which triggers a watchpoint rather than after it.
>>>>     * @gdb_arch_name: Optional callback that returns the architecture name known
>>>> @@ -163,7 +164,7 @@ struct CPUClass {
>>>>        int (*gdb_write_register)(CPUState *cpu, uint8_t *buf, int reg);
>>>>        vaddr (*gdb_adjust_breakpoint)(CPUState *cpu, vaddr addr);
>>>>    -    const char *gdb_core_xml_file;
>>>> +    const GDBFeature *gdb_core_feature;
>>>>        gchar * (*gdb_arch_name)(CPUState *cpu);
>>>>        const char * (*gdb_get_dynamic_xml)(CPUState *cpu, const char *xmlname);
>>>>    
>>> <snip>
>>>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>>>> index d71a162070..a206ab6b1b 100644
>>>> --- a/target/arm/cpu.c
>>>> +++ b/target/arm/cpu.c
>>>> @@ -2353,7 +2353,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
>>>>    #ifndef CONFIG_USER_ONLY
>>>>        cc->sysemu_ops = &arm_sysemu_ops;
>>>>    #endif
>>>> -    cc->gdb_num_core_regs = 26;
>>>>        cc->gdb_arch_name = arm_gdb_arch_name;
>>>>        cc->gdb_get_dynamic_xml = arm_gdb_get_dynamic_xml;
>>>>        cc->gdb_stop_before_watchpoint = true;
>>>> @@ -2378,7 +2377,8 @@ static void cpu_register_class_init(ObjectClass *oc, void *data)
>>>>        CPUClass *cc = CPU_CLASS(acc);
>>>>          acc->info = data;
>>>> -    cc->gdb_core_xml_file = "arm-core.xml";
>>>> +    cc->gdb_core_feature = gdb_find_static_feature("arm-core.xml");
>>>> +    cc->gdb_num_core_regs = cc->gdb_core_feature->num_regs;
>>> You are doing assignments like this. I think something like this in
>>> gdbstub:
>>> modified   gdbstub/gdbstub.c
>>> @@ -440,7 +440,7 @@ int gdb_read_register(CPUState *cpu, GByteArray *buf, int reg, bool has_xml)
>>>        CPUArchState *env = cpu->env_ptr;
>>>        GDBRegisterState *r;
>>>    -    if (reg < cc->gdb_num_core_regs) {
>>> +    if (reg < cc->gdb_core_feature->num_regs) {
>>>            return cc->gdb_read_register(cpu, buf, reg, has_xml);
>>>        }
>>>    @@ -459,7 +459,7 @@ static int gdb_write_register(CPUState *cpu,
>>> uint8_t *mem_buf, int reg,
>>>        CPUArchState *env = cpu->env_ptr;
>>>        GDBRegisterState *r;
>>>    -    if (reg < cc->gdb_num_core_regs) {
>>> +    if (reg < cc->gdb_core_feature->num_regs) {
>>>            return cc->gdb_write_register(cpu, mem_buf, reg, has_xml);
>>>        }
>>> makes most of the uses go away. Some of the other arches might need
>>> target specific tweaks.
>>
>> The problem is how to deal with the target specific tweaks. ppc
>> requires gdb_num_core_regs to have some value greater than
>> cc->gdb_core_feature->num_regs for compatibility with legacy GDB.
>> Other architectures simply do not have XMLs. Simply replacing
>> cc->gdb_num_core_regs with cc->gdb_core_feature->num_regs will break
>> those architectures.
> 
> How about:
> 
>    int core_regs = cc->gdb_core_feature ? cc->gdb_core_feature->num_regs
>    : cc->gdb_num_core_regs
> 
> And document the field as for legacy gdb use only?

I'm not sure. It looks a more error-prone way to derive the core 
register number.

> 
>>
>>> <snip>
>>>
> 
> 
