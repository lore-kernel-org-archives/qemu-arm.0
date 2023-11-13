Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp1694179ejc;
        Mon, 13 Nov 2023 15:47:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF8TDPfeOPeKevwaLKPdVBY9Y/QQvN9Ry1VVQmWiDUGwUBezV/ELhFEn/ewNIOD0khbwtno
X-Received: by 2002:a05:6870:d07:b0:1e9:da9a:f2d6 with SMTP id mk7-20020a0568700d0700b001e9da9af2d6mr11098714oab.40.1699919248900;
        Mon, 13 Nov 2023 15:47:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699919248; cv=none;
        d=google.com; s=arc-20160816;
        b=YtDTx7BlJmJ5EyzlCKZ150wC6xLqhczUsp9Tsu25c1L+abdq+zNTmaDx6dsPi8OMvX
         6blQ7X7+kO0mYqUU3D4N2n2Ts0Z1YRszULPfLJjADDise4P+QyAmRHbBqvIt+T//dvX/
         3UekrCVvv3ArppSRcZqyUWXDmrI77+KJliYKxH6OlazxNsGdEEGlB3Z0mBQflbwEOE+Y
         eSlVsq1szRCHmxrIJ9aM+6pfwvdzq8S2kgS1ZkvLXbuLKUa8eGHvtWQtzzuHdmRzRAu3
         b2YrBiQtWeb52Ide4wUrxTb7lL996N7hf9J2GYmQqlcY6/9jGkQkAmg4g/e8nq33kien
         QN2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=sGUuKvwBfQnuZThD6dwFXx+pkZQdA2vvt9ZH1MIF/ao=;
        fh=9oVi/nj9UAEUrQ57vsoUXRmvoirMfEtGVeTXMQTp4D8=;
        b=wF89/gOzoy72W54CpsmhuEnDO1RDyMRPZ2ini9z9Ys3am+wu+2QjmKqUzvfKvhXFbY
         4HGW0PKTx4KEI5elkdICAeiMo4oMkf32aJxx6dfqyassFeNgAF9DEflFBrgeNRNMzFf/
         /faD5DYUAYCyK3vrKmr3TdPO519BKPli9gQIY+Lkh3k0y7Rh94IYk4KLheNReSHUGh3J
         JgZ/lHp04tzUvuc0VB9MfZX5TL9C4/jZBi/XAfyCc41Zbt+ID5t6Tfi0VzAUqlmLIUb5
         gIEhM9024n2F1jugtQR1nkZXvMuPEqZD2cEwLIrzI5a1oihxXG2fg62k8SLSjcvS+bHc
         WGFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GsE7r42N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m7-20020a05620a290700b0077a3bdd7079si5455089qkp.688.2023.11.13.15.47.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Nov 2023 15:47:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GsE7r42N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r2gdq-0003CV-CM; Mon, 13 Nov 2023 18:46:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r2gdo-0003CF-N7
 for qemu-arm@nongnu.org; Mon, 13 Nov 2023 18:46:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r2gdY-0005z7-QF
 for qemu-arm@nongnu.org; Mon, 13 Nov 2023 18:46:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699919195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sGUuKvwBfQnuZThD6dwFXx+pkZQdA2vvt9ZH1MIF/ao=;
 b=GsE7r42No6Co2mnFRQiqZNwFDF0kIVY6pW7wo363L8AInUecoFeRmkgCJuWKmmmOLiHF+K
 Ql9UbWuquW5Khfh4AGo0P5LUBnUJsTZQ4evBmDiRFtwVA1Ts0JCsN/rH9rm5LthANBmBWz
 pkQP3sP9NBz9pkl8vEGqGayIvQdzpns=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-313-LEBw6RA2PGuDx8oHrp2NRg-1; Mon, 13 Nov 2023 18:46:32 -0500
X-MC-Unique: LEBw6RA2PGuDx8oHrp2NRg-1
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-1cc3ad55c75so53903325ad.0
 for <qemu-arm@nongnu.org>; Mon, 13 Nov 2023 15:46:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699919191; x=1700523991;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sGUuKvwBfQnuZThD6dwFXx+pkZQdA2vvt9ZH1MIF/ao=;
 b=acU/yoDuVa4U6mXjlrXiyltpq7A0wHVw3Ur4nff7vdmrboZOrN59ciG2jaa2ctt7gt
 5T2e1xQlJVM0s7fhuSgOEktGyK/QLGufHkYh+iGUZBjWfXnnLdud+s7SvYIuBpsnQqqb
 1T+tooNo3+fFHpNVwAqmH+Hal4lAXvQFMAEMI/jeEKmc/2m+ZnqJrQnuYdbXviL+xYuF
 X2rBX6hT+CUlLeqDfGKsU4AVR9B/RkEh9XVZR8kCUkWh9F7QRdKm+pRrBLxHFYU8lFyd
 4cPXerPlNfDlp1ZEMgKgGF5/jryc403smBy2VT7PwJscByP390V7v5uq3vraLC1uehVY
 PHjg==
X-Gm-Message-State: AOJu0YxzZAazOFnc/UUl23CX2SNHffM9GVixuocrOu24YiUS4Qgb9/Pu
 +OhVBR3bu4dZ42qnkUPqcOYypXdHkoQOBUHxZwFilKx6o3SkUoyAU0On/oS7axjzB8LIssoKAno
 P4sPzXMGsnM9S
X-Received: by 2002:a17:902:e88c:b0:1ca:a290:4c0c with SMTP id
 w12-20020a170902e88c00b001caa2904c0cmr934923plg.16.1699919191068; 
 Mon, 13 Nov 2023 15:46:31 -0800 (PST)
X-Received: by 2002:a17:902:e88c:b0:1ca:a290:4c0c with SMTP id
 w12-20020a170902e88c00b001caa2904c0cmr934885plg.16.1699919190654; 
 Mon, 13 Nov 2023 15:46:30 -0800 (PST)
Received: from ?IPV6:2001:8003:e5b0:9f00:b890:3e54:96bb:2a15?
 ([2001:8003:e5b0:9f00:b890:3e54:96bb:2a15])
 by smtp.gmail.com with ESMTPSA id
 ba12-20020a170902720c00b001c60d0a6d84sm4535699plb.127.2023.11.13.15.46.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Nov 2023 15:46:30 -0800 (PST)
Message-ID: <0dbc478c-45f9-44e8-a938-de71fed6c3ec@redhat.com>
Date: Tue, 14 Nov 2023 09:46:12 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/33] hw/cpu: Call object_class_is_abstract() once in
 cpu_class_by_name()
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, philmd@linaro.org, clg@kaod.org,
 imp@bsdimp.com, kevans@freebsd.org, richard.henderson@linaro.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, b.galvani@gmail.com,
 strahinja.p.jankovic@gmail.com, sundeep.lkml@gmail.com, kfting@nuvoton.com,
 wuhaotsh@google.com, nieklinnenbank@gmail.com, rad@semihalf.com,
 quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, wangyanan55@huawei.com,
 laurent@vivier.eu, vijai@behindbytes.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, mrolnik@gmail.com,
 edgar.iglesias@gmail.com, bcain@quicinc.com, gaosong@loongson.cn,
 aurelien@aurel32.net, jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com,
 chenhuacai@kernel.org, crwulff@gmail.com, marex@denx.de, shorne@gmail.com,
 npiggin@gmail.com, ysato@users.sourceforge.jp, david@redhat.com,
 thuth@redhat.com, iii@linux.ibm.com, kbastian@mail.uni-paderborn.de,
 jcmvbkbc@gmail.com, shan.gavin@gmail.com
References: <20231102002500.1750692-1-gshan@redhat.com>
 <20231102002500.1750692-3-gshan@redhat.com>
 <20231106154029.0354f0ed@imammedo.users.ipa.redhat.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20231106154029.0354f0ed@imammedo.users.ipa.redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 2h6FdUhFHtH3


On 11/7/23 00:40, Igor Mammedov wrote:
> On Thu,  2 Nov 2023 10:24:29 +1000
> Gavin Shan <gshan@redhat.com> wrote:
> 
>> From: Philippe Mathieu-Daudé <philmd@linaro.org>
>>
>> Let CPUClass::class_by_name() handlers to return abstract classes,
>> and filter them once in the public cpu_class_by_name() method.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Reviewed-by: Gavin Shan <gshan@redhat.com>
>> ---
>>   hw/core/cpu-common.c   | 8 +++++++-
>>   include/hw/core/cpu.h  | 7 ++++---
>>   target/alpha/cpu.c     | 2 +-
>>   target/arm/cpu.c       | 3 +--
>>   target/avr/cpu.c       | 3 +--
>>   target/cris/cpu.c      | 3 +--
>>   target/hexagon/cpu.c   | 3 +--
>>   target/loongarch/cpu.c | 3 +--
>>   target/m68k/cpu.c      | 3 +--
>>   target/openrisc/cpu.c  | 3 +--
>>   target/riscv/cpu.c     | 3 +--
>>   target/rx/cpu.c        | 5 +----
>>   target/sh4/cpu.c       | 3 ---
>>   target/tricore/cpu.c   | 3 +--
>>   target/xtensa/cpu.c    | 3 +--
>>   15 files changed, 23 insertions(+), 32 deletions(-)
>>
>> diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
>> index bab8942c30..bca0323e9f 100644
>> --- a/hw/core/cpu-common.c
>> +++ b/hw/core/cpu-common.c
>> @@ -150,9 +150,15 @@ static bool cpu_common_has_work(CPUState *cs)
>>   ObjectClass *cpu_class_by_name(const char *typename, const char *cpu_model)
>>   {
>>       CPUClass *cc = CPU_CLASS(object_class_by_name(typename));
>> +    ObjectClass *oc;
>>   
>>       assert(cpu_model && cc->class_by_name);
>> -    return cc->class_by_name(cpu_model);
>> +    oc = cc->class_by_name(cpu_model);
>> +    if (oc && !object_class_is_abstract(oc)) {
>> +        return oc;
>> +    }
>> +
>> +    return NULL;
>>   }
>>   
>>   static void cpu_common_parse_features(const char *typename, char *features,
>> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
>> index 18593db5b2..ee85aafdf5 100644
>> --- a/include/hw/core/cpu.h
>> +++ b/include/hw/core/cpu.h
>> @@ -102,7 +102,7 @@ struct SysemuCPUOps;
>>   /**
>>    * CPUClass:
>>    * @class_by_name: Callback to map -cpu command line model name to an
>> - * instantiatable CPU type.
>> + *                 instantiatable CPU type.
>>    * @parse_features: Callback to parse command line arguments.
>>    * @reset_dump_flags: #CPUDumpFlags to use for reset logging.
>>    * @has_work: Callback for checking if there is work to do.
>> @@ -772,9 +772,10 @@ void cpu_reset(CPUState *cpu);
>>    * @typename: The CPU base type.
>>    * @cpu_model: The model string without any parameters.
>>    *
>> - * Looks up a CPU #ObjectClass matching name @cpu_model.
>> + * Looks up a concrete CPU #ObjectClass matching name @cpu_model.
>>    *
>> - * Returns: A #CPUClass or %NULL if not matching class is found.
>> + * Returns: A concrete #CPUClass or %NULL if no matching class is found
>> + *          or if the matching class is abstract.
>>    */
>>   ObjectClass *cpu_class_by_name(const char *typename, const char *cpu_model);
>>   
>> diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
>> index c7ae4d6a41..9436859c7b 100644
>> --- a/target/alpha/cpu.c
>> +++ b/target/alpha/cpu.c
>> @@ -126,7 +126,7 @@ static ObjectClass *alpha_cpu_class_by_name(const char *cpu_model)
>>       int i;
>>   
>>       oc = object_class_by_name(cpu_model);
>> -    if (oc != NULL && object_class_dynamic_cast(oc, TYPE_ALPHA_CPU) != NULL &&
> I'd split 'oc != NULL &&' into a separate patch
> 

Agree. It's a good idea, but this patch has been merged as:

3a9d0d7b64 hw/cpu: Call object_class_is_abstract() once in cpu_class_by_name()

>> +    if (object_class_dynamic_cast(oc, TYPE_ALPHA_CPU) &&
>>           !object_class_is_abstract(oc)) {
> 
> stray abstract check leftover??
> 

Nope, It's intentional. We will fall back to @alpha_cpu_aliases if the
CPU class corresponding to @cpu_model is abstract.

>>           return oc;
>>       }
>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>> index 954328d72a..8c622d6b59 100644
>> --- a/target/arm/cpu.c
>> +++ b/target/arm/cpu.c
>> @@ -2399,8 +2399,7 @@ static ObjectClass *arm_cpu_class_by_name(const char *cpu_model)
>>       oc = object_class_by_name(typename);
>>       g_strfreev(cpuname);
>>       g_free(typename);
>> -    if (!oc || !object_class_dynamic_cast(oc, TYPE_ARM_CPU) ||
>> -        object_class_is_abstract(oc)) {
>> +    if (!object_class_dynamic_cast(oc, TYPE_ARM_CPU)) {
>>           return NULL;
>>       }
>>       return oc;
>> diff --git a/target/avr/cpu.c b/target/avr/cpu.c
>> index 14d8b9d1f0..113d522f75 100644
>> --- a/target/avr/cpu.c
>> +++ b/target/avr/cpu.c
>> @@ -157,8 +157,7 @@ static ObjectClass *avr_cpu_class_by_name(const char *cpu_model)
>>       ObjectClass *oc;
>>   
>>       oc = object_class_by_name(cpu_model);
>> -    if (object_class_dynamic_cast(oc, TYPE_AVR_CPU) == NULL ||
>> -        object_class_is_abstract(oc)) {
>> +    if (!object_class_dynamic_cast(oc, TYPE_AVR_CPU)) {
>>           oc = NULL;
>>       }
>>       return oc;
>> diff --git a/target/cris/cpu.c b/target/cris/cpu.c
>> index be4a44c218..1cb431cd46 100644
>> --- a/target/cris/cpu.c
>> +++ b/target/cris/cpu.c
>> @@ -95,8 +95,7 @@ static ObjectClass *cris_cpu_class_by_name(const char *cpu_model)
>>       typename = g_strdup_printf(CRIS_CPU_TYPE_NAME("%s"), cpu_model);
>>       oc = object_class_by_name(typename);
>>       g_free(typename);
>> -    if (oc != NULL && (!object_class_dynamic_cast(oc, TYPE_CRIS_CPU) ||
>> -                       object_class_is_abstract(oc))) {
>> +    if (!object_class_dynamic_cast(oc, TYPE_CRIS_CPU)) {
>>           oc = NULL;
>>       }
>>       return oc;
>> diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
>> index 1adc11b713..bd5adb7acd 100644
>> --- a/target/hexagon/cpu.c
>> +++ b/target/hexagon/cpu.c
>> @@ -63,8 +63,7 @@ static ObjectClass *hexagon_cpu_class_by_name(const char *cpu_model)
>>       oc = object_class_by_name(typename);
>>       g_strfreev(cpuname);
>>       g_free(typename);
>> -    if (!oc || !object_class_dynamic_cast(oc, TYPE_HEXAGON_CPU) ||
>> -        object_class_is_abstract(oc)) {
>> +    if (!object_class_dynamic_cast(oc, TYPE_HEXAGON_CPU)) {
>>           return NULL;
>>       }
>>       return oc;
>> diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
>> index ef1bf89dac..06d1b9bb95 100644
>> --- a/target/loongarch/cpu.c
>> +++ b/target/loongarch/cpu.c
>> @@ -648,8 +648,7 @@ static ObjectClass *loongarch_cpu_class_by_name(const char *cpu_model)
>>           }
>>       }
>>   
>> -    if (object_class_dynamic_cast(oc, TYPE_LOONGARCH_CPU)
>> -        && !object_class_is_abstract(oc)) {
>> +    if (object_class_dynamic_cast(oc, TYPE_LOONGARCH_CPU)) {
>>           return oc;
>>       }
>>       return NULL;
>> diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
>> index 538d9473c2..fe381cc5d3 100644
>> --- a/target/m68k/cpu.c
>> +++ b/target/m68k/cpu.c
>> @@ -111,8 +111,7 @@ static ObjectClass *m68k_cpu_class_by_name(const char *cpu_model)
>>       typename = g_strdup_printf(M68K_CPU_TYPE_NAME("%s"), cpu_model);
>>       oc = object_class_by_name(typename);
>>       g_free(typename);
>> -    if (oc != NULL && (object_class_dynamic_cast(oc, TYPE_M68K_CPU) == NULL ||
>> -                       object_class_is_abstract(oc))) {
>> +    if (!object_class_dynamic_cast(oc, TYPE_M68K_CPU)) {
>>           return NULL;
>>       }
>>       return oc;
>> diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
>> index f5a3d5273b..cc94f37e77 100644
>> --- a/target/openrisc/cpu.c
>> +++ b/target/openrisc/cpu.c
>> @@ -164,8 +164,7 @@ static ObjectClass *openrisc_cpu_class_by_name(const char *cpu_model)
>>       typename = g_strdup_printf(OPENRISC_CPU_TYPE_NAME("%s"), cpu_model);
>>       oc = object_class_by_name(typename);
>>       g_free(typename);
>> -    if (oc != NULL && (!object_class_dynamic_cast(oc, TYPE_OPENRISC_CPU) ||
>> -                       object_class_is_abstract(oc))) {
>> +    if (!object_class_dynamic_cast(oc, TYPE_OPENRISC_CPU)) {
>>           return NULL;
>>       }
>>       return oc;
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index ac4a6c7eec..018bad6f82 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -636,8 +636,7 @@ static ObjectClass *riscv_cpu_class_by_name(const char *cpu_model)
>>       oc = object_class_by_name(typename);
>>       g_strfreev(cpuname);
>>       g_free(typename);
>> -    if (!oc || !object_class_dynamic_cast(oc, TYPE_RISCV_CPU) ||
>> -        object_class_is_abstract(oc)) {
>> +    if (!object_class_dynamic_cast(oc, TYPE_RISCV_CPU)) {
>>           return NULL;
>>       }
>>       return oc;
>> diff --git a/target/rx/cpu.c b/target/rx/cpu.c
>> index 4d0d3a0c8c..0063837e93 100644
>> --- a/target/rx/cpu.c
>> +++ b/target/rx/cpu.c
>> @@ -111,16 +111,13 @@ static ObjectClass *rx_cpu_class_by_name(const char *cpu_model)
>>       char *typename;
>>   
>>       oc = object_class_by_name(cpu_model);
>> -    if (oc != NULL && object_class_dynamic_cast(oc, TYPE_RX_CPU) != NULL &&
>> +    if (object_class_dynamic_cast(oc, TYPE_RX_CPU) &&
>>           !object_class_is_abstract(oc)) {
> 
> ditto wrt strays
> 

Same as above. It's intentional. We will fall back to @cpu_model-rx-cpu if
the CPU class corresponding to @cpu_model is abstract. The point is we don't
want rx_cpu_class_by_name() returns an abstract CPU class in the middle. The
last returned CPU class will be validated by cpu_class_by_name() like below.

ObjectClass *cpu_class_by_name(const char *typename, const char *cpu_model)
{
     :
     if (oc == NULL || object_class_is_abstract(oc)) {
         return NULL;
     }
     return oc;
}


>>           return oc;
>>       }
>>       typename = g_strdup_printf(RX_CPU_TYPE_NAME("%s"), cpu_model);
>>       oc = object_class_by_name(typename);
>>       g_free(typename);
>> -    if (oc != NULL && object_class_is_abstract(oc)) {
>> -        oc = NULL;
>> -    }
>>   
>>       return oc;
>>   }
>> diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
>> index 788e41fea6..a8ec98b134 100644
>> --- a/target/sh4/cpu.c
>> +++ b/target/sh4/cpu.c
>> @@ -152,9 +152,6 @@ static ObjectClass *superh_cpu_class_by_name(const char *cpu_model)
>>   
>>       typename = g_strdup_printf(SUPERH_CPU_TYPE_NAME("%s"), s);
>>       oc = object_class_by_name(typename);
>> -    if (oc != NULL && object_class_is_abstract(oc)) {
>> -        oc = NULL;
>> -    }
> 
> Why they do not do
>      object_class_dynamic_cast(oc, TYPE_ABSTRACT_FOO_CPU)
> here, do we really need this dynamic cast elsewhere at all?
> 

I think it was missed at the beginning. We need to ensure the class is a CPU class
here. It's not harmful at least.

>>   out:
>>       g_free(s);
>> diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
>> index 5ca666ee12..47e1c272cf 100644
>> --- a/target/tricore/cpu.c
>> +++ b/target/tricore/cpu.c
>> @@ -132,8 +132,7 @@ static ObjectClass *tricore_cpu_class_by_name(const char *cpu_model)
>>       typename = g_strdup_printf(TRICORE_CPU_TYPE_NAME("%s"), cpu_model);
>>       oc = object_class_by_name(typename);
>>       g_free(typename);
>> -    if (!oc || !object_class_dynamic_cast(oc, TYPE_TRICORE_CPU) ||
>> -        object_class_is_abstract(oc)) {
>> +    if (!object_class_dynamic_cast(oc, TYPE_TRICORE_CPU)) {
>>           return NULL;
>>       }
>>       return oc;
>> diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
>> index ea1dae7390..5d1c090467 100644
>> --- a/target/xtensa/cpu.c
>> +++ b/target/xtensa/cpu.c
>> @@ -141,8 +141,7 @@ static ObjectClass *xtensa_cpu_class_by_name(const char *cpu_model)
>>       typename = g_strdup_printf(XTENSA_CPU_TYPE_NAME("%s"), cpu_model);
>>       oc = object_class_by_name(typename);
>>       g_free(typename);
>> -    if (oc == NULL || !object_class_dynamic_cast(oc, TYPE_XTENSA_CPU) ||
>> -        object_class_is_abstract(oc)) {
>> +    if (!object_class_dynamic_cast(oc, TYPE_XTENSA_CPU)) {
>>           return NULL;
>>       }
>>       return oc;
> 

Thanks,
Gavin

