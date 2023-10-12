Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp819965ejc;
        Thu, 12 Oct 2023 06:43:39 -0700 (PDT)
X-Received: by 2002:a17:906:1097:b0:9b2:b786:5e9c with SMTP id u23-20020a170906109700b009b2b7865e9cmr21525987eju.28.1697118219199;
        Thu, 12 Oct 2023 06:43:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697118219; cv=none;
        d=google.com; s=arc-20160816;
        b=HPVqfsTUwC7LrwYMILuckFgrnKtRofK0DTdcNxNwd3rETjsNtFwtiyfiDRHDq7C+8q
         qKdvkdA94UrrIlwM3syqlvF2hDDMZYq01/Tij2TpyLyabouL1smCr/NpGgrcRelG1Et/
         doAngq7/VH+/D+bJLi2No59L/PF6fmNOJnNjJB3ieq8jbaPUybp90BjeHUy9E+MAvVBN
         Od/0KkBeenRE4he3sDkdvNCnlWzXAzjviHRG6lPCBhdhYW1kg/q8MvmgpTkFhzZpQMw1
         bPVxM5ved6vylHPO8oUnxeSovSPwInp9c2G7NixPz6erNVbo4vz7Mol215wBKMkeLXZE
         vz/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=L2A4E9+dNa00po2MED/4cipHnTQuGy+ZY0n6n2MKQQc=;
        fh=ovd0F/xMYUGzFGoSoczNgPZOEykr/FBab/SK3NMMjV8=;
        b=n2XMbE+lgszxUrFTb2ODcioidqhsN4oeEo95AiiRhkaBaximFnTJKf6iXMIz7Y/99B
         COIkCsxq4rKP9gHXQyelciR34zT1q2d4GtW5lLroOT2QG/5gpvPuPEApQnJFXU2qoryr
         TAgqac8AHqBz8yzDHF8dsEtqcpOM8EuNCIXQHwgn1Qun17aMORW3H3IIgjayUiZJFJM5
         OkOhQ9HzM6eIeOZ2GQMFW2y88HIWQbRHQscOQ1sh+sULAkCNXM9O0PmsXDS72W6IUoKY
         10dFJ82h1XHJhyUkwvOOOqDXe1Upc411YNG0omQ2voYYl6Pz9vhrmYp6JBskbmLoB3Xt
         FgCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xtNEprvP;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id my48-20020a1709065a7000b009b8b6835845sor6052163ejc.4.2023.10.12.06.43.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Oct 2023 06:43:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xtNEprvP;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697118219; x=1697723019; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L2A4E9+dNa00po2MED/4cipHnTQuGy+ZY0n6n2MKQQc=;
        b=xtNEprvPBG7VhzvLB1GqdhpOkroJtDY9Pb/I9DwSKZH8hEJkVCWAj0Hy3jW1dIKBYt
         jUf3X9tpSROTG0soV3fOi2ZEy/daIWxFSSEAik+0CzJkOYhOAd4TCCkmO39+POK2/cao
         1vFLHIUib4e6V83pBMJLnqwYb+7SHAR3+W6WJIRXO+kbhnfWnBxN25TyOFC9APvHqq77
         yxWoGthXFZGx5qTWFNkLNcMwzuz6fBoXSQJ3zZpGQFuupA8aWgHfRbL7UUgPhdbmYroq
         bHpDiwTncUXjqVGJXqA7XWIlUEpPBUZwIHtndn9y+emKfVeWYQJEnDtw5QGhQQqzn29r
         weew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697118219; x=1697723019;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L2A4E9+dNa00po2MED/4cipHnTQuGy+ZY0n6n2MKQQc=;
        b=NF2Donj2c0TooF0VmZsisQ1N9L8iQBWkqx4LnuUIVbtGVP3Z4rcwa1IkuDnpnlnmWN
         BcZ6Xg2TPW8BmB059+Aqt0cAkLejrJjq5WcHvDxk8BDa9FskkTMhHUFvJLs6eHFRXA+T
         j8koyQy3NXjqwN1ojK/EwP21S8qU1VeK26cbOpk1DTfV36M9o8gQj8sxtuwKDBDzvRma
         i+6CqWyr7aC1SvXN6PCO4i01PVML2K45lISv8aQgPqbHrNAGzVP6udG35GBshDTGI53Y
         jffWM/wnqk1pGnxk8dTuBO2WpxZ/KzfwxdsjCNptLkbQ+XfvrMytZwNXoy5gZcguyF6I
         toQQ==
X-Gm-Message-State: AOJu0Yy+ROiYthGEb0dhlloLcOfkisEQxyQ8JSE+sPxjbWmtn8TasDs8
	ojDGCc59qN5X4eqcVKy+gQ1wdPdM3GLsFGrfDoN1yuPG
X-Google-Smtp-Source: AGHT+IEDy6fJIRNDADZI7QVJi+E/Qi6xb8q8nnzhVdJmr6Hoa6fvIuP8jXhrKbJskGQZ/rNo7vLFyw==
X-Received: by 2002:a17:906:76d4:b0:9b7:37de:600d with SMTP id q20-20020a17090676d400b009b737de600dmr21357008ejn.62.1697118218838;
        Thu, 12 Oct 2023 06:43:38 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] (176-131-211-232.abo.bbox.fr. [176.131.211.232])
        by smtp.gmail.com with ESMTPSA id w19-20020a170906481300b009b9720a85e5sm11078419ejq.38.2023.10.12.06.43.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 06:43:38 -0700 (PDT)
Message-ID: <62fd649b-1c07-c0f5-11cc-ca17ad0675e5@linaro.org>
Date: Thu, 12 Oct 2023 15:43:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH v11 11/18] gdbstub: Infer number of core registers from
 XML
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
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
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231012130616.7941-12-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 7WP3BHXvN0zt

Hi Akihiko,

On 12/10/23 15:06, Akihiko Odaki wrote:
> GDBFeature has the num_regs member so use it where applicable to
> remove magic numbers.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   include/hw/core/cpu.h   | 3 ++-
>   target/s390x/cpu.h      | 2 --
>   gdbstub/gdbstub.c       | 5 ++++-
>   target/arm/cpu.c        | 1 -
>   target/arm/cpu64.c      | 1 -
>   target/avr/cpu.c        | 1 -
>   target/hexagon/cpu.c    | 1 -
>   target/i386/cpu.c       | 2 --
>   target/loongarch/cpu.c  | 2 --
>   target/m68k/cpu.c       | 1 -
>   target/microblaze/cpu.c | 1 -
>   target/riscv/cpu.c      | 1 -
>   target/rx/cpu.c         | 1 -
>   target/s390x/cpu.c      | 1 -
>   14 files changed, 6 insertions(+), 17 deletions(-)
> 
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 3968369554..11d4b5cd0c 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -127,7 +127,8 @@ struct SysemuCPUOps;
>    * @gdb_adjust_breakpoint: Callback for adjusting the address of a
>    *       breakpoint.  Used by AVR to handle a gdb mis-feature with
>    *       its Harvard architecture split code and data.
> - * @gdb_num_core_regs: Number of core registers accessible to GDB.
> + * @gdb_num_core_regs: Number of core registers accessible to GDB or 0 to infer
> + *                     from @gdb_core_xml_file.
>    * @gdb_core_xml_file: File name for core registers GDB XML description.
>    * @gdb_stop_before_watchpoint: Indicates whether GDB expects the CPU to stop
>    *           before the insn which triggers a watchpoint rather than after it.
> diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
> index 7bea7075e1..83eafbe4b1 100644
> --- a/target/s390x/cpu.h
> +++ b/target/s390x/cpu.h
> @@ -452,8 +452,6 @@ static inline void cpu_get_tb_cpu_state(CPUS390XState *env, vaddr *pc,
>   #define S390_R13_REGNUM 15
>   #define S390_R14_REGNUM 16
>   #define S390_R15_REGNUM 17
> -/* Total Core Registers. */
> -#define S390_NUM_CORE_REGS 18
>   
>   static inline void setcc(S390CPU *cpu, uint64_t cc)
>   {
> diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
> index 49fb23a68a..c19f1785e4 100644
> --- a/gdbstub/gdbstub.c
> +++ b/gdbstub/gdbstub.c
> @@ -541,9 +541,12 @@ void gdb_init_cpu(CPUState *cpu)
>           gdb_register_feature(cpu, 0,
>                                cc->gdb_read_register, cc->gdb_write_register,
>                                feature);
> +        cpu->gdb_num_regs = cpu->gdb_num_g_regs = feature->num_regs;
>       }
>   
> -    cpu->gdb_num_regs = cpu->gdb_num_g_regs = cc->gdb_num_core_regs;
> +    if (cc->gdb_num_core_regs) {
> +        cpu->gdb_num_regs = cpu->gdb_num_g_regs = cc->gdb_num_core_regs;

Why not remove SysemuCPUOps::gdb_num_core_regs entirely?

> +    }
>   }
