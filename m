Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp258735ejo;
        Thu, 4 Jan 2024 10:12:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHmJ1si2RH/8MJKMBkN7wXevBX2byOIL3fgld0LDTyLom28hIlxXv+ZmIjD+jw8Y7aiPSRD
X-Received: by 2002:a05:600c:3549:b0:40d:5e88:10bc with SMTP id i9-20020a05600c354900b0040d5e8810bcmr614958wmq.18.1704391969230;
        Thu, 04 Jan 2024 10:12:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704391969; cv=none;
        d=google.com; s=arc-20160816;
        b=AQWiMWOXBrsVccJqPkrzyWLwtrOOr8hGByOrOoCiPN4X5e6QmOKDRxez8w1QWfxD6m
         YHJq9ujK3I8bkAdH55Mykm7jSKTuIXdmU6tzjjptEg9FqE/B0rxoicSk+0iQpi7nrsTN
         w8mp1jLIbIE+empOD8bITrY+SQXcAKLj0Rvb9bXW13Q2FOe1eE5L1vubH/bEYR8J9ZBB
         iOizXXbQ3d4ZBfinGdRBJ9H9uaL2aAiefG+zkfQcmDJgaeKFZNnR3eEt5jzVbWYyCgZp
         yQb3jPQKLjddl0MAVNVAyDbEjznsgs2InvZeqL2ObXxueZrKNlO6cEQt+UCnhjhz2VAe
         Gosw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:references:cc:to:from:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=sDUuF9dozzTZnMqPT4WhJ/Hlq7qfud2Jb3j/6GkUXbQ=;
        fh=kkXiFTARBZnvGvZovphXqG7wDCaoTBOjvPWmZGXRx6U=;
        b=NZAAKrJi66e56lsJjVsnCeClnZAXQtFu9XLw2nwcYB285fWAtOSX8R4eGojWzMQHp2
         VOgcVrgnRyuR4K/bv3N8OsBlSCngyT6mPFv+bFpaB8JeCkPmK7tj+oevgqD11P1KSBvR
         fo5gZz/DAvZltueVHXjtLxI+fGTSfdu6d12Jo0gY+yDaVG8Ad7xNVssYNavmPdPvIR8n
         xtArBOKLEpssEE4puAK1HZo67N0cLwCSqnymrB8CPbRVNoW0/bldxV746GBmDpDJNAiQ
         3ZSKvH+bISI9JCFVtT/m0mkxa+GyVGykbpI+d8/ZHW1ygEddj5jQkGAe9Vtbpm+X77qF
         7R/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=veauWBtL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d13-20020adff2cd000000b003367b76466csi14151248wrp.815.2024.01.04.10.12.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jan 2024 10:12:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=veauWBtL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rLSCl-0006V0-Qe; Thu, 04 Jan 2024 13:12:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLSCk-0006Ub-Im
 for qemu-arm@nongnu.org; Thu, 04 Jan 2024 13:12:30 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLSCQ-0000W1-Eh
 for qemu-arm@nongnu.org; Thu, 04 Jan 2024 13:12:25 -0500
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-33678156e27so604232f8f.1
 for <qemu-arm@nongnu.org>; Thu, 04 Jan 2024 10:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704391927; x=1704996727; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sDUuF9dozzTZnMqPT4WhJ/Hlq7qfud2Jb3j/6GkUXbQ=;
 b=veauWBtLkDRXgf6jXnK2yDECVYuYQO2MkKz4UqK9R4VgT+gqej+tkZHFFoH8W7abhV
 tnaYWkrbqLii5COHr72Q8WUepO5/4NWxVApQ5y66ZT+RQwd+YxZiaFpKXf5sMkqWN9jX
 RegpJEAMJW1wuY8vrXQhHGtWGh8YXMQKn2w5tNZe9ynNYk3I0VkiZSu7tjZyGbLYe34s
 C9LpU5YsQRX0GW5lo5nEkXVZHq3JaJWQ/Ni51dgIzE4Fdc94zcJARvsFzt0cb8dlF+vA
 qe2Myu2f1YXmKiALhz4qtpP5e5TinQYGsDpCPcJjAwK/T7CSQVvcT8OGRCnDKk08ICok
 EEjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704391927; x=1704996727;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sDUuF9dozzTZnMqPT4WhJ/Hlq7qfud2Jb3j/6GkUXbQ=;
 b=Ojqj0rvUtyV6TjGtsgvk21SF63Zabeo8AVOKgVIbZVEgKo+daQ9F3Zj4iKOEGsZtG5
 uYCUDylaWWRjAwmsbVEjzecK34v27/ryeiYJoHcrKlM4RXpdJOS8vkxkF6/SNAoRxj7P
 ti81nqK+l+YkgZp1JHA8T6MS71Jzz0Dm5sp5xlvMTBMJnOn6o5jRu1X+JmDZ5T0DNLvO
 E9zDuYabibUufyymD3Hv9ayExMuJqXgaNFK9TxpcCBg1URXGnHRnZco6cQyh82Xt1gV5
 jRKspi/FAsm+f69Jp6IoS7t5XbdBS4h5VE1KEp5upn/hdyq3j1RQJGsKuaqRNO5GgkNj
 QhkA==
X-Gm-Message-State: AOJu0Ywb5iU+L7ja9nhGZFEr9LLcd8i2h1FdtHZ47UTrshpX31Eg0Oqw
 6r2upa4xGV483vPYY7Mfij5W4aNYI5eTUQ==
X-Received: by 2002:adf:f30e:0:b0:337:39c7:2c8 with SMTP id
 i14-20020adff30e000000b0033739c702c8mr566203wro.110.1704391927570; 
 Thu, 04 Jan 2024 10:12:07 -0800 (PST)
Received: from [192.168.69.100] ([176.187.194.232])
 by smtp.gmail.com with ESMTPSA id
 p9-20020adfcc89000000b003368100ff71sm33292931wrj.10.2024.01.04.10.12.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jan 2024 10:12:06 -0800 (PST)
Message-ID: <6bff96da-acfe-4969-91fd-db9d9ef03d34@linaro.org>
Date: Thu, 4 Jan 2024 19:12:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/31] target/alpha: Remove 'ev67' CPU class
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Gavin Shan <gshan@redhat.com>, laurent@vivier.eu,
 richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 imp@bsdimp.com, kevans@freebsd.org, pbonzini@redhat.com,
 peter.maydell@linaro.org, imammedo@redhat.com, b.galvani@gmail.com,
 strahinja.p.jankovic@gmail.com, sundeep.lkml@gmail.com, kfting@nuvoton.com,
 wuhaotsh@google.com, nieklinnenbank@gmail.com, rad@semihalf.com,
 qemu-arm@nongnu.org, quic_llindhol@quicinc.com,
 marcin.juszkiewicz@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, wangyanan55@huawei.com, vijai@behindbytes.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, mrolnik@gmail.com, edgar.iglesias@gmail.com,
 bcain@quicinc.com, gaosong@loongson.cn, aurelien@aurel32.net,
 jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com,
 chenhuacai@kernel.org, shorne@gmail.com, npiggin@gmail.com, clg@kaod.org,
 ysato@users.sourceforge.jp, kbastian@mail.uni-paderborn.de,
 jcmvbkbc@gmail.com, shan.gavin@gmail.com
References: <20231114235628.534334-1-gshan@redhat.com>
 <20231114235628.534334-2-gshan@redhat.com>
 <9fcd0827-a729-4cf8-a6ab-93cda04d88f9@linaro.org>
 <04107470-8438-4e24-9a9a-03f6fa30bb31@linaro.org>
In-Reply-To: <04107470-8438-4e24-9a9a-03f6fa30bb31@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: D7VLKcdKg2rp

On 4/1/24 19:03, Philippe Mathieu-Daudé wrote:
> On 4/1/24 18:58, Philippe Mathieu-Daudé wrote:
>> On 15/11/23 00:55, Gavin Shan wrote:
>>> 'ev67' CPU class will be returned to match everything, which makes
>>> no sense as mentioned in the comments. Remove the logic to fall
>>> back to 'ev67' CPU class to match everything.
>>>
>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>> ---
>>>   target/alpha/cpu.c | 7 ++-----
>>>   1 file changed, 2 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
>>> index 39cf841b3e..91fe8ae095 100644
>>> --- a/target/alpha/cpu.c
>>> +++ b/target/alpha/cpu.c
>>> @@ -141,11 +141,8 @@ static ObjectClass 
>>> *alpha_cpu_class_by_name(const char *cpu_model)
>>>       typename = g_strdup_printf(ALPHA_CPU_TYPE_NAME("%s"), cpu_model);
>>>       oc = object_class_by_name(typename);
>>>       g_free(typename);
>>> -
>>> -    /* TODO: remove match everything nonsense */
>>> -    if (!oc || object_class_is_abstract(oc)) {
>>> -        /* Default to ev67; no reason not to emulate insns by 
>>> default. */
>>> -        oc = object_class_by_name(ALPHA_CPU_TYPE_NAME("ev67"));
>>> +    if (!oc || !object_class_dynamic_cast(oc, TYPE_ALPHA_CPU)) {
>>> +        return NULL;
>>>       }
>>
>> This breaks linux-user:
>>
>> qemu-alpha: unable to find CPU model 'any'
> 
> Thread 1 "qemu-alpha" hit Breakpoint 1, alpha_cpu_class_by_name 
> (cpu_model=0x5555557202a0 "any") at target/alpha/cpu.c:123
> 123    {
> (gdb) bt
> #0  alpha_cpu_class_by_name (cpu_model=0x5555557202a0 "any") at 
> target/alpha/cpu.c:123
> #1  0x0000555555583956 in cpu_class_by_name 
> (typename=typename@entry=0x555555674af8 "alpha-cpu", 
> cpu_model=0x5555557202a0 "any")
>      at hw/core/cpu-common.c:156
> #2  0x00005555555904a1 in parse_cpu_option (cpu_option=<optimized out>) 
> at cpu-target.c:257
> #3  0x00005555555822e9 in main (argc=2, argv=0x7fffffffe318, 
> envp=<optimized out>) at linux-user/main.c:784
> 
> in main():
> 
>   781     if (cpu_model == NULL) {
>   782         cpu_model = cpu_get_model(get_elf_eflags(execfd));
>   783     }
>   784     cpu_type = parse_cpu_option(cpu_model);
> 
> Having:
> 
> $ cat linux-user/alpha/target_elf.h
> ...
> #ifndef ALPHA_TARGET_ELF_H
> #define ALPHA_TARGET_ELF_H
> static inline const char *cpu_get_model(uint32_t eflags)
> {
>      return "any";
> }
> #endif

Laurent, Richard, are you OK with this fix?

-- >8 --
diff --git a/linux-user/alpha/target_elf.h b/linux-user/alpha/target_elf.h
index 344e9f4d39..b77d638f6d 100644
--- a/linux-user/alpha/target_elf.h
+++ b/linux-user/alpha/target_elf.h
@@ -9,6 +9,6 @@
  #define ALPHA_TARGET_ELF_H
  static inline const char *cpu_get_model(uint32_t eflags)
  {
-    return "any";
+    return "ev67";
  }
  #endif
---

