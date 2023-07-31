Received: by 2002:a17:906:fc12:b0:98d:b2f5:1316 with SMTP id ov18csp2180029ejb;
        Mon, 31 Jul 2023 06:37:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:1893:b0:66f:7076:a5b4 with SMTP id x19-20020a056a00189300b0066f7076a5b4mr11654064pfh.7.1690810644972;
        Mon, 31 Jul 2023 06:37:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690810644; cv=none;
        d=google.com; s=arc-20160816;
        b=0rAVxUJocAuePSMDfvv+6Y3zbemoqsW9O9Lpi8SvQkKzvjzwCA+4UJxh+leLyIqJ+B
         JSM3+geoWDH5Y/ik24834hJq7ZN+ktwG7SIkB+RvPGGiGmhvf0RQ4sLi5u9O/RD8eXIx
         Rrjfod1DR5yU78yan0sPK6roTdVw1PLErVBgLUJMMhJEhPDKanU2bUEClQV/LTAB93yX
         RCrTSx7jkPHK/fXqEHubyRkBTdZ6luxn/QsXKxjim5gLfz6ffXn/SzZ0R3kn0NebEN0H
         eUJFW9/ddQOzBFu0+7CatW/XMt0rLJJBh64nSl4QRPNqyQQULw6dVLZQ6UFffd70lQM3
         h4BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=wz6Vx54FIU5ogvkImhwxegOc+8g8JAPNfio7xsw4wDc=;
        fh=Vyq5/6xHMnUXaCcwNIruSPKpraLOPjqJ2O/oHLYr/lI=;
        b=EV6uiT7o+jHFEXqrphqo+EyeE9TA3k6+vU67kShoVsFy5YjQ0aCY/geJs6Kra5bJa2
         /wdw5Vp8Zzzyfiburbmb0vLLhIwRF6ZAJDLqcr5cYxwjowKqQ+lO/5YMxkgQQhmWxPYO
         KmbetaYzzI9iB9XauCm/psOzCh9xKwAMsoz0ZjzbDtjG6DZD17Wswz/pxhTuzXTBNroo
         8tmxR2rPz/tjtEgc4jciUdMz699y4gVolmKoXQOdc7GrUVoVGy9FBznSprJUuc0aOpAN
         1z0zLDJ6OonjDHrw8FOBsxzBwbZCC1S7N5WnNU14JdH/oRqHqzrk3qPxZ8tSByLGNwsT
         0rmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=wF+1m525;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id bm2-20020a056a00320200b0067adbac7ab1sor3506327pfb.2.2023.07.31.06.37.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 31 Jul 2023 06:37:24 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=wF+1m525;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1690810644; x=1691415444;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wz6Vx54FIU5ogvkImhwxegOc+8g8JAPNfio7xsw4wDc=;
        b=wF+1m525H0KInlRxDAVoygeysI63uzG64Vkwf9qLMZJGozFYGZJ6UzFS+Ugb0yYro9
         lToi2DrUCcbGyzrskhFTIPqdlKqwdqcwm3VIbSEcAWTcnVvj0bB6L0Yv3GAArekfq0bs
         N1EEexuzXIaN0zwIrQXsqZtwyNpqEEHlT2Ao7BxjKWm/StI0Gi0uy5DyktcsCnLl81r5
         4KuQ3Bz9WEbELeiQ0lJGSoAJDKJesJT5XsmeQRta0jEGKXLWd2e6/42lnTUolAUE84QU
         GtRK6P3PAZDHi6vUMzkcomhpGyAiVuWNRm9z25j8/cLaFv2iHTkQ1yc1DV6jCsoYqg9j
         CeoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690810644; x=1691415444;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wz6Vx54FIU5ogvkImhwxegOc+8g8JAPNfio7xsw4wDc=;
        b=PFxLCppz4Ao2T9psw6QGjqeiW6tpuMzo9Qy+SWUCGwhvK7e+jSdkZMtYjMvCk4cAPp
         RuSGq1wTdhzZIedsHzvVSljgWZT+0wCp0NghREtRco04cArFGEnYly4vsTbjnq+LNoFF
         XXcdqC2k6dMcDPYjokSgY4AuJCabbFBmi71qDmz/XUqQuF7NNfQGJTaBAfg+pQ5o3CiR
         A4qK/nJrT0BSiDOS5aM3p6akRSHMZ14YL2nG+saQ6Vt/uF8cdbCJ+VJDUS4hbZ+6I36j
         /4vleNWO7dK+vTrO99tcubmiimQBMkzzYHe6g0Zdq0IdP6JdOPg+F7BgDub8Gg2I6hQG
         TyuA==
X-Gm-Message-State: ABy/qLYRXo/OevLenTJtCwlxi5J1HORm1GuYuzoOY3Z/z5pY8kX9InUE
	1C2m/XyXbGwETOu16Ejl6YTlmQ==
X-Google-Smtp-Source: APBJJlFiuOnRmsCy7oUaEdzbUnuI+jsQ2FM7sZKGG6HwcOpUEPr39FUVgk+v8+IQYZ6JQ4LxEyyxnA==
X-Received: by 2002:a05:6a20:160b:b0:133:bf18:ef7b with SMTP id l11-20020a056a20160b00b00133bf18ef7bmr11737737pzj.24.1690810644425;
        Mon, 31 Jul 2023 06:37:24 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from [10.4.77.224] ([118.103.63.129])
        by smtp.gmail.com with ESMTPSA id c11-20020aa78e0b000000b00662c4ca18ebsm7631950pfr.128.2023.07.31.06.37.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jul 2023 06:37:24 -0700 (PDT)
Message-ID: <70355844-5c8f-4e3b-5ba5-d53a116349ac@daynix.com>
Date: Mon, 31 Jul 2023 22:37:14 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 06/24] hw/core/cpu: Replace gdb_core_xml_file with
 gdb_core_feature
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour
 <ma.mandourr@gmail.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
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
 <09cad822-85c2-3e0b-9414-e1da9de2a2d1@linaro.org>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <09cad822-85c2-3e0b-9414-e1da9de2a2d1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: +ATa3IOGb3RF

On 2023/07/31 22:27, Philippe Mathieu-Daudé wrote:
> On 31/7/23 10:43, Akihiko Odaki wrote:
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
>>   include/hw/core/cpu.h   | 5 +++--
>>   target/s390x/cpu.h      | 2 --
>>   gdbstub/gdbstub.c       | 6 +++---
>>   target/arm/cpu.c        | 4 ++--
>>   target/arm/cpu64.c      | 4 ++--
>>   target/arm/tcg/cpu32.c  | 3 ++-
>>   target/avr/cpu.c        | 4 ++--
>>   target/hexagon/cpu.c    | 2 +-
>>   target/i386/cpu.c       | 7 +++----
>>   target/loongarch/cpu.c  | 4 ++--
>>   target/m68k/cpu.c       | 7 ++++---
>>   target/microblaze/cpu.c | 4 ++--
>>   target/ppc/cpu_init.c   | 4 ++--
>>   target/riscv/cpu.c      | 7 ++++---
>>   target/rx/cpu.c         | 4 ++--
>>   target/s390x/cpu.c      | 4 ++--
>>   16 files changed, 36 insertions(+), 35 deletions(-)
> 
> 
>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>> index d71a162070..a206ab6b1b 100644
>> --- a/target/arm/cpu.c
>> +++ b/target/arm/cpu.c
>> @@ -2353,7 +2353,6 @@ static void arm_cpu_class_init(ObjectClass *oc, 
>> void *data)
>>   #ifndef CONFIG_USER_ONLY
>>       cc->sysemu_ops = &arm_sysemu_ops;
>>   #endif
>> -    cc->gdb_num_core_regs = 26;
>>       cc->gdb_arch_name = arm_gdb_arch_name;
>>       cc->gdb_get_dynamic_xml = arm_gdb_get_dynamic_xml;
>>       cc->gdb_stop_before_watchpoint = true;
>> @@ -2378,7 +2377,8 @@ static void cpu_register_class_init(ObjectClass 
>> *oc, void *data)
>>       CPUClass *cc = CPU_CLASS(acc);
>>       acc->info = data;
>> -    cc->gdb_core_xml_file = "arm-core.xml";
>> +    cc->gdb_core_feature = gdb_find_static_feature("arm-core.xml");
> 
> Can we have:
> 
>    cc->gdb_core_feature = gdb_find_static_feature(cc->gdb_core_xml_file);
> 
> once in hw/core/cpu-common.c::cpu_class_init()?
> 
> (haven't verified, just wondering)

Unfortunately no, cpu_class_init() earlier than this line. Also the 
feature needs to be resolved here because the next line refers to it.

> 
>> +    cc->gdb_num_core_regs = cc->gdb_core_feature->num_regs;
>>   }
> 
> 
