Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp2568421eja;
        Mon, 4 Mar 2024 04:59:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXJ3z2lxvgNngf0lFaehJwan8/NPnTPyUxhO8f7ai+uwsw3f3SS/Ehw+s7gQANbmTkODe1c71XGmZ8ROa0GDORV0QQi7Vcn
X-Google-Smtp-Source: AGHT+IGAplvZi5X6ToG3p1esnb7knwPa70X+irXvMdeWJ5j7sg9sbuXgXBmIMnTG6ElTJ9B4Eb3e
X-Received: by 2002:ad4:4212:0:b0:690:621e:59de with SMTP id k18-20020ad44212000000b00690621e59demr5685150qvp.14.1709557189546;
        Mon, 04 Mar 2024 04:59:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709557189; cv=none;
        d=google.com; s=arc-20160816;
        b=dFXVGh9Eb84YTm50hHqoO83KcmoGdNXv2+coEawZC6cYeVcewgqs4tkCi01L+LuqWR
         Kw1Pw2tjnpaBFEGNJZq/jALnTvE8MKIjQ4JOHOHyFyRlRxM233FxNVdgPonfXydxEgz6
         Gc5rBxhZSmmy/JWepJD8aDM/XZDiEVIr+/QANmse9/X+32nSu5UmeAY9AiqCfknHQxBP
         /vGsMbVoGV2U04349gFrnqthiEYmQaP/k03OSk4cPXJcAnQ3/VmsVx3GKszL2CMyunQ6
         Na2fzOqtmr/fbYXIqDhOojjGnLQL0ieTnV6ytkXiOshQnTk51JFZEu5dEHN/sYhkANtH
         2z7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:in-reply-to:references:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=/JCn4SdIxEGNgPKioH6JBVx8YoHdHQMCrX9PWLiEcP4=;
        fh=/TX5S8kgkt7/rBZYZ+crJ/+YKPw+5BFKLYKcqwsm7JU=;
        b=pFM7qN0fhmnv7EcvGhKw8AoxzX4q3A8RKefA0sIAdoE4LlbuYrnm8w2H3LCAN/Sl8F
         0ylyOlK0U50zjsILPl+gUrLdNRnPQIFoUIiuHNmu6Ko64YA38c2ytHmX6GFzivaoUpt3
         xQKAgQs3gXDrlWRyqOoMOiFA9z3pwINYQ5rco+9RnGrh1+JcIFBvUJAKB4fNe5MU+x59
         46bXlAHcXQaUpRXpXXGf7h9X+/kPxqFUhklU9PgGSLkyU+4IX+Y2Z7Uw80Y9vGlXlZVn
         yjcjxBtPv8HDoDNs6HvAXxZYJtFq8o6ur+RN9upi6QqzNBQ9Egkcwk0N2wocbXfCE+me
         XG8A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r3-20020a0562140c8300b006903099b236si9566701qvr.504.2024.03.04.04.59.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Mar 2024 04:59:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rh7uk-0008VM-6A; Mon, 04 Mar 2024 07:59:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rh7ui-0008V6-SH; Mon, 04 Mar 2024 07:59:28 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rh7ug-0008V7-1A; Mon, 04 Mar 2024 07:59:28 -0500
Received: from mail.maildlp.com (unknown [172.19.163.174])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4TpJcc69J9zwPFs;
 Mon,  4 Mar 2024 20:57:04 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 4BF241402CD;
 Mon,  4 Mar 2024 20:59:20 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemi500008.china.huawei.com (7.221.188.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 4 Mar 2024 20:59:19 +0800
Message-ID: <7f9d680d-1e1f-10b2-ca3f-dd2e385b69f7@huawei.com>
Date: Mon, 4 Mar 2024 20:59:18 +0800
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
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=ruanjinjie@huawei.com; helo=szxga01-in.huawei.com
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
X-TUID: o+Yd2UFpNWPq



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

There seems no bug. Since prio = cs->gicr_ipriorityr[i] or  prio =
s->gicd_ipriority[i] are separately used originally,

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
