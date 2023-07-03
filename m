Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp2300308ejy;
        Mon, 3 Jul 2023 07:11:41 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7yiQzdNAHu1DIGrutC9wkwx6dwQrVE21U/DrIP0LMGlEVkgrvblA5s4IxVjl90eqEZQ5z9
X-Received: by 2002:a05:600c:2259:b0:3f7:aee8:c23a with SMTP id a25-20020a05600c225900b003f7aee8c23amr13302979wmm.19.1688393501234;
        Mon, 03 Jul 2023 07:11:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688393501; cv=none;
        d=google.com; s=arc-20160816;
        b=s71Tn2gcrhej8OXWMnyDhdsL3fkD9AFu7nqpNpXDt16aQ78lYskEbKaeUp6sbQ5E2b
         0NPhdTV+33QKuA0Gdd93soxjVgGXI3NMroi0BnR2H0xpzztNXLu8gFyWTXe9CfugkHsC
         IEAiTem0yci9BHnjFt9IamqASR5NNUpmCaQnmD8gq2wraBIatMKdTUhaNPG7sBvsSW8r
         l4O+jwmQb9SFhikkPkqxw5a6Z8nE8E5D3209yC/17J+bJjojpP8jAYMst8Nqf7a6mTV7
         Mw7XE8q3K0qN7iiFpOc10pskFjnZuRkSeaWcQn1kLotJ0NxwYpv8BNniXh01QMYtu9Oq
         kCDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:subject:from:references:cc:to:content-language
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=m8O6s7v9ZvaIFftldwIB6Y3Vt8Am4q3YdNxGm1LPC3I=;
        fh=Mh6s2dfsUq3r0tqPmNQSLmKbijpmXp1FlukScB5eR7M=;
        b=F4RFzVKLcIElfu/LRjwjwhwnGBhy2ANlPrh6aIzzNvYomFSPBgXW2VqDbtayzpKIGB
         xHeye9MMeJJQe3zbvLVlcK+gZcHevcl5uOZQ0OBymse8fViQFqZxs6M2iqAB2ZKtPrEw
         WYR8s8FNlOZkbythwk6JeqVsNozUyb9mURsM5e/GeXdg4MS79aVtxsdOSfAgGFAPiW9T
         ZCd4obIdeTpKO6hhTA/1mi6/my1qB316fR4DJeP0ndxLTrcjk1GNh7iqSMgsgVD6Dk4F
         XU7AClKxseqr6EenS3DXywevXo10Y7WH1KFutsY2RdqccekKHrt5L5we5gVFuAMMUiSt
         z0GQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20221208 header.b=qmbJcXt2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p1-20020a05600c204100b003fbdcc2c5e1si751074wmg.98.2023.07.03.07.11.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Jul 2023 07:11:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20221208 header.b=qmbJcXt2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qGKGd-0002w1-4Q; Mon, 03 Jul 2023 10:11:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1qGKGS-0002uj-6i; Mon, 03 Jul 2023 10:10:52 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1qGKGO-0005UV-Pq; Mon, 03 Jul 2023 10:10:51 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-579dd20b1c8so26982197b3.1; 
 Mon, 03 Jul 2023 07:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688393447; x=1690985447;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:sender
 :from:to:cc:subject:date:message-id:reply-to;
 bh=m8O6s7v9ZvaIFftldwIB6Y3Vt8Am4q3YdNxGm1LPC3I=;
 b=qmbJcXt2BTWPOC2tMnassY1A3LlPWyZaOOITtwbac+3/i4vwJyAE4fGDzQp7nCRco0
 +GC+fIdAA1g7gq9ZSHaNCxOobwg7qq+DBcIMxKZUIdTjNNy7Jx/7nCIUQ0ZsTf22jxIo
 UrIJDku+KwTOJmp3QNqdZmQpSWm0DyT4/xc8PqdkogIkvwwCKs2gR097Ts4UwVTaRVQl
 yHWeeasM4Dt9frDSYVLNsxfUZK9fpTmmKdIP08VRDNrBpA08G5O0uKXwELBZXl+xuIdF
 /vdhpqor7EDl7Hgv1FN9w1/EKFjG+by77svKtzy8PDLQKFdvzzmnYE0LoEDG35fx2Y9a
 3QLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688393447; x=1690985447;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:sender
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m8O6s7v9ZvaIFftldwIB6Y3Vt8Am4q3YdNxGm1LPC3I=;
 b=RRFD65/KOrPhICP9M+bRASqiUBgNJH3j3PM5r8NGTAL0IP+UE9G7ZbvbiPUinj0ple
 eV+oHimq2il1HvZ4MCTpDnjgzOF1ECggjWsIm219NdwfVjoAQFRvHhFP0mMcubG1KWY8
 N4gbnIzB3IQFxQjJdJA0oC1ifHaIui3+juoCaZWc7D22R5uC7LLugzNvBxAop1AF86HA
 COq4gB8J+KW3wm+JLifZ6iDLucMmUVRD204E1HqaBq+08axyVgu3PKahlC5rXFRZP72Y
 I2X8teGun4vFD66PkLYC9p7FX+GCMTKGWWvt0gkP6VjUWA3fgEIwunFzyh9cEkABwVTw
 iE9A==
X-Gm-Message-State: ABy/qLZ2+bXP8WNQY7m9q272SEffuROmT1Uas/M42igI0DcFpvP9LNSA
 R2p0MiHgXHfaY/02bXjxVWA=
X-Received: by 2002:a81:6dc3:0:b0:559:ed0a:96c4 with SMTP id
 i186-20020a816dc3000000b00559ed0a96c4mr9270093ywc.44.1688393447056; 
 Mon, 03 Jul 2023 07:10:47 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 y186-20020a817dc3000000b0057736c436f1sm2251846ywc.141.2023.07.03.07.10.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jul 2023 07:10:46 -0700 (PDT)
Message-ID: <189ab78e-805c-983f-c1c7-f8c81f79b00f@roeck-us.net>
Date: Mon, 3 Jul 2023 07:10:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>
Cc: Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair23@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Jia Liu <proljc@gmail.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Paul Burton <paulburton@kernel.org>, Peter Maydell
 <peter.maydell@linaro.org>, Radoslaw Biernacki <rad@semihalf.com>,
 Song Gao <gaosong@loongson.cn>, Stafford Horne <shorne@gmail.com>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20230703034614.3909079-1-linux@roeck-us.net>
 <e08863cd-f4ac-9ffa-b79b-5f9c594f1db4@linaro.org>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] riscv: Generate devicetree only after machine
 initialization is complete
In-Reply-To: <e08863cd-f4ac-9ffa-b79b-5f9c594f1db4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=groeck7@gmail.com; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: LnN5XZqGHDH9

On 7/3/23 00:46, Philippe Mathieu-Daudé wrote:
> On 3/7/23 05:46, Guenter Roeck wrote:
>> If the devicetree is created before machine initialization is complete,
>> it misses dynamic devices. Specifically, the tpm device is not added
>> to the devicetree file and is therefore not instantiated in Linux.
>> Create devicetree in virt_machine_done() to solve the problem.
> 
> This makes sense, but what about the other archs/machines?
> Shouldn't we fix this generically?
> 

I had a brief look into various implementations. To me the code looks
all very machine specific. I don't think it can be solved generically
(if other machines are even affected), but then I am not a qemu expert
and may be wrong.

Guenter

>> Cc: Alistair Francis <alistair23@gmail.com>
>> Fixes: 325b7c4e75 hw/riscv: Enable TPM backends
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>>   hw/riscv/virt.c | 9 ++++++---
>>   1 file changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
>> index ed4c27487e..08876284f5 100644
>> --- a/hw/riscv/virt.c
>> +++ b/hw/riscv/virt.c
>> @@ -1248,6 +1248,11 @@ static void virt_machine_done(Notifier *notifier, void *data)
>>       uint64_t kernel_entry = 0;
>>       BlockBackend *pflash_blk0;
>> +    /* create devicetree if not provided */
>> +    if (!machine->dtb) {
>> +        create_fdt(s, memmap);
>> +    }
>> +
>>       /*
>>        * Only direct boot kernel is currently supported for KVM VM,
>>        * so the "-bios" parameter is not supported when KVM is enabled.
>> @@ -1508,15 +1513,13 @@ static void virt_machine_init(MachineState *machine)
>>       }
>>       virt_flash_map(s, system_memory);
>> -    /* load/create device tree */
>> +    /* load device tree */
>>       if (machine->dtb) {
>>           machine->fdt = load_device_tree(machine->dtb, &s->fdt_size);
>>           if (!machine->fdt) {
>>               error_report("load_device_tree() failed");
>>               exit(1);
>>           }
>> -    } else {
>> -        create_fdt(s, memmap);
>>       }
>>       s->machine_done.notify = virt_machine_done;
> 

