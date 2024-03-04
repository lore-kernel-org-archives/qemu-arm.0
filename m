Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp2549059eja;
        Mon, 4 Mar 2024 04:18:51 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWohmFGB218B393kBP4VBHo3S3YKGV9LRj7Rjt0Sl4DKsjmwpryZX8Crssc9/x4pD6yD3nJ9538Ai0JubYlxX9KD/+1YGSU
X-Google-Smtp-Source: AGHT+IFcnC9iCyWayqsW9RdXYiShupOS3X4auKYUBQh5RM3yoPAQcQlv/00zPCsSSo6S+CVAQ749
X-Received: by 2002:a05:6871:878b:b0:21e:a2c0:fd1 with SMTP id td11-20020a056871878b00b0021ea2c00fd1mr10739658oab.34.1709554731058;
        Mon, 04 Mar 2024 04:18:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709554731; cv=none;
        d=google.com; s=arc-20160816;
        b=Y8DHooXdNQIH0p+zVdpY9xlfLz/yE0aVQkoAP3x9Jz9dBCz6N3VdYwXqUkOsy/WSf7
         7Fq+bCnbfuiG2ywAa9ZQvn0NlC5qqLNNNXi3h16kR1Y0ox77ddeTZFsBlLi18nmczWXC
         6WcFqTijNcaTy1/bgU734uGxieivdupaYuh7r0y+oXQwnVhxB1M1TQl3CzVtFF6yJsO3
         VZz24O0qfaiemv5aziqX1Etypp5EvYjtF63dnF9Pzd0nS0VKxE6d6xvOju8bSwBstxF3
         tficHlqE6e3Du72CAVA1mM4x1mvEsyqFxu/vZnSH5PPf71j5fxUpyBoLCF2CuSan3x4L
         7lsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:in-reply-to:references:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=QxbO8n8qocr/wzHLhXn2zR38V3Yaw9Tevlii/Y8VJ54=;
        fh=/TX5S8kgkt7/rBZYZ+crJ/+YKPw+5BFKLYKcqwsm7JU=;
        b=sA+ps7My4XxS1jlGqz5DJnREi+zdOC862QEMmfrGDx2li2Ag9v1IpHammVgRxv3cr0
         g5NixCoZvAjw12JnIkfjSs/XHRRDLS+7Vg6/0kUqrBC9zUIbhq6HMv58i6fjg+R7XUGo
         tSZ1+dKLmxxgmIfqswE26FzIe0/6HnrBgU2qqMLZJvVJpSYziLM8hI399dcfJxAe5LyK
         MOZqirGJ+HU+Ga34HLAxzQmw6SWwZXb9wjCT1LfoD4QNnUR313tWrDHxLMSFMyJCylqM
         ChpoXLh9E5xMdFWGRL3Zdrh+oPgzwD5OHH3F6WHhdmzwIDiJsbnzWMirnv12RkIEbwQU
         AHSA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b20-20020a05620a127400b00787b7b46c49si9475614qkl.683.2024.03.04.04.18.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Mar 2024 04:18:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rh7HB-0002v7-4R; Mon, 04 Mar 2024 07:18:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rh7H9-0002uf-Ps; Mon, 04 Mar 2024 07:18:35 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rh7H6-0006Zc-2h; Mon, 04 Mar 2024 07:18:35 -0500
Received: from mail.maildlp.com (unknown [172.19.163.174])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4TpHkx3J5jzRjZb;
 Mon,  4 Mar 2024 20:17:29 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 01505140EBB;
 Mon,  4 Mar 2024 20:18:11 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemi500008.china.huawei.com (7.221.188.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 4 Mar 2024 20:18:10 +0800
Message-ID: <895fa382-1c0f-ae33-ba6b-76387506ad16@huawei.com>
Date: Mon, 4 Mar 2024 20:18:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [RFC PATCH v5 18/22] hw/intc/arm_gicv3: Implement NMI interrupt
 prioirty
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
References: <20240229131039.1868904-1-ruanjinjie@huawei.com>
 <20240229131039.1868904-19-ruanjinjie@huawei.com>
 <85d632e6-8eb9-4bb5-bef4-b6430d499e61@linaro.org>
In-Reply-To: <85d632e6-8eb9-4bb5-bef4-b6430d499e61@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=ruanjinjie@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -82
X-Spam_score: -8.3
X-Spam_bar: --------
X-Spam_report: (-8.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-4.098,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Jinjie Ruan <ruanjinjie@huawei.com>
From:  Jinjie Ruan via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: c/S0Oy93bkVG



On 2024/3/1 7:50, Richard Henderson wrote:
> On 2/29/24 03:10, Jinjie Ruan via wrote:
>> If GICD_CTLR_DS bit is zero and the NMI is non-secure, the NMI prioirty
>> is higher than 0x80, otherwise it is higher than 0x0. And save NMI
>> super prioirty information in hppi.superprio to deliver NMI exception.
>> Since both GICR and GICD can deliver NMI, it is both necessary to check
>> whether the pending irq is NMI in gicv3_redist_update_noirqset and
>> gicv3_update_noirqset. And In irqbetter(), only a non-NMI with the same
>> priority and a smaller interrupt number can be preempted but not NMI.
>>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>> v4:
>> - Replace is_nmi with has_superprio to not a mix NMI and superpriority.
>> - Update the comment in irqbetter().
>> - Extract gicv3_get_priority() to avoid code repeat.
>> ---
>> v3:
>> - Add missing brace
>> ---
>>   hw/intc/arm_gicv3.c | 71 ++++++++++++++++++++++++++++++++++++++++-----
>>   1 file changed, 63 insertions(+), 8 deletions(-)
>>
>> diff --git a/hw/intc/arm_gicv3.c b/hw/intc/arm_gicv3.c
>> index 0b8f79a122..1d16a53b23 100644
>> --- a/hw/intc/arm_gicv3.c
>> +++ b/hw/intc/arm_gicv3.c
>> @@ -21,7 +21,8 @@
>>   #include "hw/intc/arm_gicv3.h"
>>   #include "gicv3_internal.h"
>>   -static bool irqbetter(GICv3CPUState *cs, int irq, uint8_t prio)
>> +static bool irqbetter(GICv3CPUState *cs, int irq, uint8_t prio,
>> +                      bool has_superprio)
>>   {
>>       /* Return true if this IRQ at this priority should take
>>        * precedence over the current recorded highest priority
>> @@ -33,11 +34,24 @@ static bool irqbetter(GICv3CPUState *cs, int irq,
>> uint8_t prio)
>>       if (prio < cs->hppi.prio) {
>>           return true;
>>       }
>> +
>> +    /*
>> +     * Current highest prioirity pending interrupt is an IRQ without
>> +     * superpriority, the new IRQ with superpriority has same priority
>> +     * should signal to the CPU as it have the priority higher than
>> +     * the labelled 0x80 or 0x00.
>> +     */
>> +    if (prio == cs->hppi.prio && !cs->hppi.superprio && has_superprio) {
>> +        return true;
>> +    }
>> +
>>       /* If multiple pending interrupts have the same priority then it
>> is an
>>        * IMPDEF choice which of them to signal to the CPU. We choose to
>> -     * signal the one with the lowest interrupt number.
>> +     * signal the one with the lowest interrupt number if they don't
>> have
>> +     * superpriority.
>>        */
>> -    if (prio == cs->hppi.prio && irq <= cs->hppi.irq) {
>> +    if (prio == cs->hppi.prio && !cs->hppi.superprio &&
>> +        !has_superprio && irq <= cs->hppi.irq) {
>>           return true;
>>       }
>>       return false;
>> @@ -129,6 +143,35 @@ static uint32_t gicr_int_pending(GICv3CPUState *cs)
>>       return pend;
>>   }
>>   +static bool gicv3_get_priority(GICv3CPUState *cs, bool is_redist,
>> +                               uint32_t superprio, uint8_t *prio, int
>> irq)
>> +{
>> +    bool has_superprio = false;
>> +
>> +    if (superprio) {
>> +        has_superprio = true;
>> +
>> +        /* DS = 0 & Non-secure NMI */
>> +        if (!(cs->gic->gicd_ctlr & GICD_CTLR_DS) &&
>> +            ((is_redist && extract32(cs->gicr_igroupr0, irq, 1)) ||
>> +             (!is_redist && gicv3_gicd_group_test(cs->gic, irq)))) {
>> +            *prio = 0x80;
>> +        } else {
>> +            *prio = 0x0;
>> +        }
>> +    } else {
>> +        has_superprio = false;
>> +
>> +        if (is_redist) {
>> +            *prio = cs->gicr_ipriorityr[irq];
>> +        } else {
>> +            *prio = cs->gic->gicd_ipriority[irq];
>> +        }
>> +    }
>> +
>> +    return has_superprio;
>> +}
> 
> Did you not like the idea to map {priority, !superpriority} into a
> single value?
> 
> It would eliminate the change in irqbetter(), which is a bit more
> complex than it needs to be.

I will try to change to implement this mapping scheme.

> 
>> @@ -152,10 +197,13 @@ static void
>> gicv3_redist_update_noirqset(GICv3CPUState *cs)
>>               if (!(pend & (1 << i))) {
>>                   continue;
>>               }
>> -            prio = cs->gicr_ipriorityr[i];
>> -            if (irqbetter(cs, i, prio)) {
>> +            superprio = extract32(cs->gicr_isuperprio, i, 1);
>> +            has_superprio = gicv3_get_priority(cs, true, superprio,
>> &prio, i);
> 
> It would allow moving the read of gicr_isuperprio into
> gicv3_get_priority(), alongside the read of gicr_ipriorityr.
> 
> Is there a bug here not handling is_redist for GCIR_INMI*?
> 
>> @@ -168,7 +216,7 @@ static void
>> gicv3_redist_update_noirqset(GICv3CPUState *cs)
>>       if ((cs->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) &&
>> cs->gic->lpi_enable &&
>>           (cs->gic->gicd_ctlr & GICD_CTLR_EN_GRP1NS) &&
>>           (cs->hpplpi.prio != 0xff)) {
>> -        if (irqbetter(cs, cs->hpplpi.irq, cs->hpplpi.prio)) {
>> +        if (irqbetter(cs, cs->hpplpi.irq, cs->hpplpi.prio, false)) {
> 
> Always passing false here is incorrect -- again missing the
> redistributor nmi bit?
> 
> 
> r~
