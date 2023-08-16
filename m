Received: by 2002:a17:906:5ac8:b0:98d:b2f5:1316 with SMTP id x8csp368115ejs;
        Wed, 16 Aug 2023 06:47:25 -0700 (PDT)
X-Received: by 2002:a17:903:190:b0:1b9:d2fc:ba9f with SMTP id z16-20020a170903019000b001b9d2fcba9fmr1724947plg.11.1692193644687;
        Wed, 16 Aug 2023 06:47:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692193644; cv=none;
        d=google.com; s=arc-20160816;
        b=ybtXh9mAj7R90xi8BOFqKo9n5dHr4A/acBzMcJsc3vsi1FB4EOPTwBX5ZR5TJSVUhn
         LuwsmcOnI7AGoUayNUuF6Bc+wPSV3BVjs5DdRIC6KEVV02vOJFcCHFh3gy1ncjF29mdl
         lwitXQjIYncNogjIB3H6VYQD32rU501tug0+iM88eh6OYkephnbWflWr9wRZf1npDZIK
         mKAwgFzhJJhrXXshZMo/rwxETrCqXMG9OfjJwO1IcAH5ijcvKwQp/OFmmxyznZqmK2qx
         UvM4i+6tjQFAxpSvh3vN4S39XA8SnYglFcJPk9nDH9+JFo3iFKstf8ej2vlBVM4b5fiB
         4QVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=l/z8QZ0Iyfmp7CByB11orbYdHmX+bbWzBKeQ+vlrDZA=;
        fh=EcO5he7kBhkq1+blo3bftTd/gQjAs68nzvCtO96H+rw=;
        b=fAQG5yJBENGtZ+ieFyNYWroa7g3op57WCLTrrC3N+bKxwBIR8AD3jcZAxX3zCLheGW
         HqaJfI8EImEDHKpA8KTAXMeiNubtZwc+IaNSBC7R+p5Oewd20N3xB4PIWXC+19bUtW7k
         0uzFbCsq35Uldz3tZRqFmhtlbRhmNpdHPaQWZ/+EcHERAbWFQeC2/Q7UGpP4OKUtIHQG
         9UsZ/Yxiwlm9uT8jvUXaJ4Ed0FE8TAPFITMHi1UWtrgijs/Tme8stDGDO3NERe5jAGAT
         WEFtyZkmv3fZdJxETEQM7XjUk2l/C1QBKb72Q8cyJorbFt3vNyro4CKHC4YOct0j13gY
         hv5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=B2FXIFjw;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ij4-20020a170902ab4400b001bc6dd8ff17sor6743931plb.9.2023.08.16.06.47.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 16 Aug 2023 06:47:24 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=B2FXIFjw;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1692193644; x=1692798444;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l/z8QZ0Iyfmp7CByB11orbYdHmX+bbWzBKeQ+vlrDZA=;
        b=B2FXIFjwY4yHzn6USOC/GxHZnIVSlW4HHE37ljJr0T6ccLMl1BRU5Hnw6nsm8eH/a+
         3Uew6y3gd+f9B05ajxeuUvPsPsj+s/NJmd8T6OQGNFSYltZmikZLtYdKhhy7XtAD6Bb5
         yCVALmeVzvpwyYV5V83uVUxVWqr+e8Cfrn+UMoxYR3ImwrOlGgFc7uXCH7Se9p+2xY8P
         pNMCHJP/QldmjQUckv402gRF8uzckTov5MfEYnYMgnxJYT0jDxSU9AIc05oR1ZFS+Dmq
         RI83O7smbdn3rPjam5MzvYQfnONohf+OYX77Is0hmQjtMIEHFDH2RoR8G1Av9QLnt634
         RuMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692193644; x=1692798444;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l/z8QZ0Iyfmp7CByB11orbYdHmX+bbWzBKeQ+vlrDZA=;
        b=EpJV4EveZPvmgqtz8EXzz+3UNOWFYTioXEd3svIFke+GEg9m7KO70PQTQeA32Okwen
         JVXn7Df7JEBuuoxAA00Rr+HrbOUKlBC7FxLOGi6e2j5xniZHCwFhVtF6hdlUU7paNUKv
         mZxYhAiLLEjILueiylKzgkIVSqMEcDq/lxBI6iHcCHeoSZNafDLW6J1Eqyc0Xvu42R0N
         SHc0qN+6y70EnlsUqV8XSmDZDFeylIiZNmZwdWIYrJod45w4nDdwUzVsn7120enY2kZh
         zpunF+BumdGlYbw19XMmksMoLjYUQADcNlffsyMdYdNnqVfajgGH/2HQMwsRts6mrvmL
         Hz9w==
X-Gm-Message-State: AOJu0Yw5iN1tt83vFG2uhJnORU/MDMcHe0yB5hd1R27kWzUpctiwv1ym
	p8yKfoBWDlwpLPjaSWboWxGPz0HSn4HhUBFj7kM=
X-Google-Smtp-Source: AGHT+IEX7HQ67DyK6O1PBSM6FlzIn8b+m72ZldbtSyZnYGzkcPcROr4VNrH508/KmTITzYkfoj3QiA==
X-Received: by 2002:a17:902:830b:b0:1b8:5ab2:49a4 with SMTP id bd11-20020a170902830b00b001b85ab249a4mr1610182plb.53.1692193643961;
        Wed, 16 Aug 2023 06:47:23 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from ?IPV6:2400:4050:a840:1e00:78d2:b862:10a7:d486? ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id bg3-20020a1709028e8300b001b6a27dff99sm13144303plb.159.2023.08.16.06.47.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Aug 2023 06:47:23 -0700 (PDT)
Message-ID: <ee599577-f185-4f12-b985-209a6322d2f7@daynix.com>
Date: Wed, 16 Aug 2023 22:47:13 +0900
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
 <871qg5sryb.fsf@linaro.org>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <871qg5sryb.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: J/4ChaC2Na52

On 2023/08/14 20:59, Alex Bennée wrote:
> 
> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
> 
>> This is a tree-wide change to replace gdb_core_xml_file, the path to
>> GDB XML file with gdb_core_feature, the pointer to GDBFeature. This
>> also replaces the values assigned to gdb_num_core_regs with the
>> num_regs member of GDBFeature where applicable to remove magic numbers.
>>
>> A following change will utilize additional information provided by
>> GDBFeature to simplify XML file lookup.
>>
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>> ---
>>   include/hw/core/cpu.h   | 5 +++--
>>   target/s390x/cpu.h      | 2 --
>>   gdbstub/gdbstub.c       | 6 +++---
>>   target/arm/cpu.c        | 4 ++--
>>   target/arm/cpu64.c      | 4 ++--
>>   target/arm/tcg/cpu32.c  | 3 ++-
>>   target/avr/cpu.c        | 4 ++--
>>   target/hexagon/cpu.c    | 2 +-
>>   target/i386/cpu.c       | 7 +++----
>>   target/loongarch/cpu.c  | 4 ++--
>>   target/m68k/cpu.c       | 7 ++++---
>>   target/microblaze/cpu.c | 4 ++--
>>   target/ppc/cpu_init.c   | 4 ++--
>>   target/riscv/cpu.c      | 7 ++++---
>>   target/rx/cpu.c         | 4 ++--
>>   target/s390x/cpu.c      | 4 ++--
>>   16 files changed, 36 insertions(+), 35 deletions(-)
>>
>> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
>> index fdcbe87352..84219c1885 100644
>> --- a/include/hw/core/cpu.h
>> +++ b/include/hw/core/cpu.h
>> @@ -23,6 +23,7 @@
>>   #include "hw/qdev-core.h"
>>   #include "disas/dis-asm.h"
>>   #include "exec/cpu-common.h"
>> +#include "exec/gdbstub.h"
>>   #include "exec/hwaddr.h"
>>   #include "exec/memattrs.h"
>>   #include "qapi/qapi-types-run-state.h"
>> @@ -127,7 +128,7 @@ struct SysemuCPUOps;
>>    *       breakpoint.  Used by AVR to handle a gdb mis-feature with
>>    *       its Harvard architecture split code and data.
>>    * @gdb_num_core_regs: Number of core registers accessible to GDB.
> 
> It seems redundant to have this when gdb_core_features already
> encapsulates this, especially since...
> 
>> - * @gdb_core_xml_file: File name for core registers GDB XML description.
>> + * @gdb_core_feature: GDB core feature description.
>>    * @gdb_stop_before_watchpoint: Indicates whether GDB expects the CPU to stop
>>    *           before the insn which triggers a watchpoint rather than after it.
>>    * @gdb_arch_name: Optional callback that returns the architecture name known
>> @@ -163,7 +164,7 @@ struct CPUClass {
>>       int (*gdb_write_register)(CPUState *cpu, uint8_t *buf, int reg);
>>       vaddr (*gdb_adjust_breakpoint)(CPUState *cpu, vaddr addr);
>>   
>> -    const char *gdb_core_xml_file;
>> +    const GDBFeature *gdb_core_feature;
>>       gchar * (*gdb_arch_name)(CPUState *cpu);
>>       const char * (*gdb_get_dynamic_xml)(CPUState *cpu, const char *xmlname);
>>   
> <snip>
>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>> index d71a162070..a206ab6b1b 100644
>> --- a/target/arm/cpu.c
>> +++ b/target/arm/cpu.c
>> @@ -2353,7 +2353,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
>>   #ifndef CONFIG_USER_ONLY
>>       cc->sysemu_ops = &arm_sysemu_ops;
>>   #endif
>> -    cc->gdb_num_core_regs = 26;
>>       cc->gdb_arch_name = arm_gdb_arch_name;
>>       cc->gdb_get_dynamic_xml = arm_gdb_get_dynamic_xml;
>>       cc->gdb_stop_before_watchpoint = true;
>> @@ -2378,7 +2377,8 @@ static void cpu_register_class_init(ObjectClass *oc, void *data)
>>       CPUClass *cc = CPU_CLASS(acc);
>>   
>>       acc->info = data;
>> -    cc->gdb_core_xml_file = "arm-core.xml";
>> +    cc->gdb_core_feature = gdb_find_static_feature("arm-core.xml");
>> +    cc->gdb_num_core_regs = cc->gdb_core_feature->num_regs;
> 
> You are doing assignments like this. I think something like this in
> gdbstub:
> 
> modified   gdbstub/gdbstub.c
> @@ -440,7 +440,7 @@ int gdb_read_register(CPUState *cpu, GByteArray *buf, int reg, bool has_xml)
>       CPUArchState *env = cpu->env_ptr;
>       GDBRegisterState *r;
>   
> -    if (reg < cc->gdb_num_core_regs) {
> +    if (reg < cc->gdb_core_feature->num_regs) {
>           return cc->gdb_read_register(cpu, buf, reg, has_xml);
>       }
>   
> @@ -459,7 +459,7 @@ static int gdb_write_register(CPUState *cpu, uint8_t *mem_buf, int reg,
>       CPUArchState *env = cpu->env_ptr;
>       GDBRegisterState *r;
>   
> -    if (reg < cc->gdb_num_core_regs) {
> +    if (reg < cc->gdb_core_feature->num_regs) {
>           return cc->gdb_write_register(cpu, mem_buf, reg, has_xml);
>       }
> 
> makes most of the uses go away. Some of the other arches might need
> target specific tweaks.

The problem is how to deal with the target specific tweaks. ppc requires 
gdb_num_core_regs to have some value greater than 
cc->gdb_core_feature->num_regs for compatibility with legacy GDB. Other 
architectures simply do not have XMLs. Simply replacing 
cc->gdb_num_core_regs with cc->gdb_core_feature->num_regs will break 
those architectures.

> 
> <snip>
> 
