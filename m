Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp862010ejc;
        Thu, 12 Oct 2023 07:45:15 -0700 (PDT)
X-Received: by 2002:a05:6a00:2da3:b0:690:bc3f:4ffa with SMTP id fb35-20020a056a002da300b00690bc3f4ffamr23465668pfb.14.1697121915086;
        Thu, 12 Oct 2023 07:45:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697121915; cv=none;
        d=google.com; s=arc-20160816;
        b=r9u+Wi0hGQ2nEJEVzWXxl5vbyilcsYLXwVteOqFDsCtLN6xcEqwOoCUyVX4sB6/Umi
         wPRgUrAXN3aMYSkndR2TvmFdRkLy23Z4jZXjkOL+E8qwkW6PiJOnN+t/QA192xosZd4/
         3kZKoL6POILKdFQnyDyhxCtXDo0RN8xwfXJ/aSPtZl5FRcqDMNYEebD+ecYNwf11d5xb
         Jesn3SxtItpxsysiG5XcBpmqnkmkLSgbKGPC2tr2H3CeFZOUW5Vw9oJKr9R0nuzofZCq
         1pIuODKL2DR2/7KMurW9jjJ0C0CLqPS8NBsi2+iLHlI+AycslNc2xLyri5dG1fJrLxdj
         yQ2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=+gxakmX5egNupoUva4qv0ThRigbN+mUSk0Jo0iRI4+c=;
        fh=CDmI8V5QEejurhe+LbNCz9g3yeO6WqWMF2tOdb390d8=;
        b=vLghP8HDuTlo7fbQPc89ElPbxZoK5y6oBXV2NPmUh3HTiHLjVf1WZJxigmUlxH6HKw
         PdHgcZAxHtOtCqrqArMKhGOD2nMLuLtDoV8FhtCiHqSmsv/p4a+AMSPGutu/u805pe5L
         7AJ+4g8IPuQg/c3urDZ5q4HS+Jr7OHWhiDZW40N8fy3Vz+bdO4IMFBeNaqN5GnhD/R8P
         2IrJdiMyHfht1b/TbzbWMFuHwXKYOWe7ZiLrLTmknLTAtvOR3+mvWvguhnXVUbbwwZTm
         d8MDbwlQQg5ZM6BFSR/rfH32lySen8SUTc69NH2XkX70j1AIwOtS6JSDFHQr0U6L4UM3
         xRbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=aGEgi0UL;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id b123-20020a633481000000b0057743fca31csor797610pga.4.2023.10.12.07.45.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Oct 2023 07:45:15 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=aGEgi0UL;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1697121914; x=1697726714; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+gxakmX5egNupoUva4qv0ThRigbN+mUSk0Jo0iRI4+c=;
        b=aGEgi0UL0N3+wnsHNmx/7oA1oitKTPbJwBw18TcwszLK8Bpq0bJTW+SAMwD6I3BIwN
         YQEl84ePwovaOmCfcKvVTWJ/sjWd4HHuoJLkjaCXKE1cvd3o1O+oaHQvIQxZQ/wW2myF
         3emeUDHSmG6XME4Gww1pWcOgQTsALvW4X0CxJ4/n5AeuhY8o+q1s60VAFBXIKKWxR3Pt
         fzjti2XawZV3mI+/Jh1oOHRMUhd/4hWSjMzb5RwHDshFnamYeRIQkVuSawEtV2LIZ9oh
         VYX9krZ4ygoeX0/+DP6QS6AOyfOJ1YD4zaNMFl9rSIwbZCk6q2vM6ANgJ93y2smT6KXF
         LqDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697121914; x=1697726714;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+gxakmX5egNupoUva4qv0ThRigbN+mUSk0Jo0iRI4+c=;
        b=XIG0NxABJmFX89g32ad+XVbUPpLp+stedCSYC6/Mq2I8HjNbkA9+GFEL8hc/9SK150
         6wEG6FWuRlCMJlKoC9OJiCDK4cENwX+RPHbRqDsjfnVxAR4UEb49o3grxGdiBSynamNd
         cyVIOmOQAEMogugeKUTMOE2uT9hgqBc8hI1uj7APhvWwfMJ0KusDre/b7rgO/C3kZW6P
         lnoxtqQt71l0CRDyPWY696pcvA3JU1C4vUPhhYZZV5/OgbCaF91WUhlrTBPEKyaxZjAf
         n6lAiN6sjrMjWzzoMPNYKzF521BKE9m7FAh9RWd/5FHt2iWfD6EzrCxIqK9eE+OUt89D
         8rDg==
X-Gm-Message-State: AOJu0YwjU/G8MealuxjkjbcXDgKuRHk923ORohr0EfOIdW8FWd0B2grw
	G+NBvV1TA5nqK128ym8cESGgKg==
X-Google-Smtp-Source: AGHT+IG6msMDBy42iIKwAHANSgWLrCQlK34Sg8Ybyakh4SAKLr0ImFK8wAXKv4pv6OmMhYZ+V96BQw==
X-Received: by 2002:a05:6a20:dda4:b0:16b:7602:1837 with SMTP id kw36-20020a056a20dda400b0016b76021837mr14670113pzb.29.1697121914552;
        Thu, 12 Oct 2023 07:45:14 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from ?IPV6:2400:4050:a840:1e00:78d2:b862:10a7:d486? ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id jw10-20020a170903278a00b001c5fa48b9a0sm2083248plb.33.2023.10.12.07.45.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 07:45:14 -0700 (PDT)
Message-ID: <d38a342b-4c63-46b0-9ce3-952412708eea@daynix.com>
Date: Thu, 12 Oct 2023 23:45:07 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 11/18] gdbstub: Infer number of core registers from
 XML
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Mikhail Tyutin <m.tyutin@yadro.com>, Aleksandr Anenkov
 <a.anenkov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Peter Maydell
 <peter.maydell@linaro.org>, Michael Rolnik <mrolnik@gmail.com>,
 Brian Cain <bcain@quicinc.com>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Laurent Vivier
 <laurent@vivier.eu>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 "open list:S390 general arch..." <qemu-s390x@nongnu.org>
References: <20231012130616.7941-1-akihiko.odaki@daynix.com>
 <20231012130616.7941-12-akihiko.odaki@daynix.com>
 <62fd649b-1c07-c0f5-11cc-ca17ad0675e5@linaro.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <62fd649b-1c07-c0f5-11cc-ca17ad0675e5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 3zIIQw+4NFWB

On 2023/10/12 22:43, Philippe Mathieu-Daudé wrote:
> Hi Akihiko,
> 
> On 12/10/23 15:06, Akihiko Odaki wrote:
>> GDBFeature has the num_regs member so use it where applicable to
>> remove magic numbers.
>>
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>> ---
>>   include/hw/core/cpu.h   | 3 ++-
>>   target/s390x/cpu.h      | 2 --
>>   gdbstub/gdbstub.c       | 5 ++++-
>>   target/arm/cpu.c        | 1 -
>>   target/arm/cpu64.c      | 1 -
>>   target/avr/cpu.c        | 1 -
>>   target/hexagon/cpu.c    | 1 -
>>   target/i386/cpu.c       | 2 --
>>   target/loongarch/cpu.c  | 2 --
>>   target/m68k/cpu.c       | 1 -
>>   target/microblaze/cpu.c | 1 -
>>   target/riscv/cpu.c      | 1 -
>>   target/rx/cpu.c         | 1 -
>>   target/s390x/cpu.c      | 1 -
>>   14 files changed, 6 insertions(+), 17 deletions(-)
>>
>> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
>> index 3968369554..11d4b5cd0c 100644
>> --- a/include/hw/core/cpu.h
>> +++ b/include/hw/core/cpu.h
>> @@ -127,7 +127,8 @@ struct SysemuCPUOps;
>>    * @gdb_adjust_breakpoint: Callback for adjusting the address of a
>>    *       breakpoint.  Used by AVR to handle a gdb mis-feature with
>>    *       its Harvard architecture split code and data.
>> - * @gdb_num_core_regs: Number of core registers accessible to GDB.
>> + * @gdb_num_core_regs: Number of core registers accessible to GDB or 
>> 0 to infer
>> + *                     from @gdb_core_xml_file.
>>    * @gdb_core_xml_file: File name for core registers GDB XML 
>> description.
>>    * @gdb_stop_before_watchpoint: Indicates whether GDB expects the 
>> CPU to stop
>>    *           before the insn which triggers a watchpoint rather than 
>> after it.
>> diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
>> index 7bea7075e1..83eafbe4b1 100644
>> --- a/target/s390x/cpu.h
>> +++ b/target/s390x/cpu.h
>> @@ -452,8 +452,6 @@ static inline void 
>> cpu_get_tb_cpu_state(CPUS390XState *env, vaddr *pc,
>>   #define S390_R13_REGNUM 15
>>   #define S390_R14_REGNUM 16
>>   #define S390_R15_REGNUM 17
>> -/* Total Core Registers. */
>> -#define S390_NUM_CORE_REGS 18
>>   static inline void setcc(S390CPU *cpu, uint64_t cc)
>>   {
>> diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
>> index 49fb23a68a..c19f1785e4 100644
>> --- a/gdbstub/gdbstub.c
>> +++ b/gdbstub/gdbstub.c
>> @@ -541,9 +541,12 @@ void gdb_init_cpu(CPUState *cpu)
>>           gdb_register_feature(cpu, 0,
>>                                cc->gdb_read_register, 
>> cc->gdb_write_register,
>>                                feature);
>> +        cpu->gdb_num_regs = cpu->gdb_num_g_regs = feature->num_regs;
>>       }
>> -    cpu->gdb_num_regs = cpu->gdb_num_g_regs = cc->gdb_num_core_regs;
>> +    if (cc->gdb_num_core_regs) {
>> +        cpu->gdb_num_regs = cpu->gdb_num_g_regs = cc->gdb_num_core_regs;
> 
> Why not remove SysemuCPUOps::gdb_num_core_regs entirely?

It is used by targets without XMLs and ppc, which overrides the number 
from XML.
