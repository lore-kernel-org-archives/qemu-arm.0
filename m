Received: by 10.25.85.209 with SMTP id j200csp1095434lfb;
        Mon, 13 Jun 2016 02:12:31 -0700 (PDT)
X-Received: by 10.140.41.51 with SMTP id y48mr12585488qgy.58.1465809151153;
        Mon, 13 Jun 2016 02:12:31 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z63si8957395qtc.93.2016.06.13.02.12.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Jun 2016 02:12:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54577 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCNv4-0005qX-Fc
	for alex.bennee@linaro.org; Mon, 13 Jun 2016 05:12:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40365)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bCNtO-0004nK-Cp
	for qemu-devel@nongnu.org; Mon, 13 Jun 2016 05:10:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bCNtM-0003WN-63
	for qemu-devel@nongnu.org; Mon, 13 Jun 2016 05:10:45 -0400
Received: from mail-vk0-x22f.google.com ([2607:f8b0:400c:c05::22f]:35656)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bCNtK-0003W9-Sx
	for qemu-devel@nongnu.org; Mon, 13 Jun 2016 05:10:44 -0400
Received: by mail-vk0-x22f.google.com with SMTP id d127so170359617vkh.2
	for <qemu-devel@nongnu.org>; Mon, 13 Jun 2016 02:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ELTomsWKKUw/72/3OxGyZPJlovpYS4NdP8dFveHzPeg=;
	b=Om8Q0FZvRIBI3JMRRJp/fklP8Jy6sCefKBXyd94fxCH8T/P80fzvZnbC+Gs9F0YvaT
	HuPPVQ+tWMjMAaFOslmAbgIqBtdSlXmwnWcD3b7yiPPGOpe83hR62Ygi1zlxqWAAFBZU
	NMNkySNqOcW5CpkXfx/Wf6CMoP2l058X8U3IU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ELTomsWKKUw/72/3OxGyZPJlovpYS4NdP8dFveHzPeg=;
	b=OPshtyvtwYsQZce5quW/egLq5xcCQCmRCsSdA9PGoAeSd6UrNO5RZYwnFgu3iQcXp2
	QKbjbibozISF0DMfMBWkbGqozxZEiGezgcMhhYOfDfKa7AoWVHQUSdqY4dPs56veVZ4p
	Uef3zHPaB2jagn2OjeJImuUpAtxePVkH1E94/graTAp5VCxFrXf4oyyAEci5SsaDhdsz
	g/6zA+3xSxrRIjC8aqf1vlKQXVBwT4vJUp+3wqSiUBElpi50HAonMXGGQvh/oqSlso81
	DxNoEs0x6BbO1As5wYzeOu8mVrpcJzqJrduoO3MUJexagw6aKy4thrTa9TaAdWcynZmB
	SlEA==
X-Gm-Message-State: ALyK8tK87mZ7LCQkLQ1tQx8KeZZQywQ1+gqirZcrVCFkMKcf7C5Rpx35A4xi779dtTzGbgSjVtNcNfhuuEyevFEu
X-Received: by 10.176.5.227 with SMTP id e90mr6277330uae.4.1465809042406; Mon,
	13 Jun 2016 02:10:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.97.68 with HTTP; Mon, 13 Jun 2016 02:10:22 -0700 (PDT)
In-Reply-To: <575E673E.2080500@huawei.com>
References: <1464274540-19693-1-git-send-email-peter.maydell@linaro.org>
	<1464274540-19693-17-git-send-email-peter.maydell@linaro.org>
	<575E673E.2080500@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Jun 2016 10:10:22 +0100
Message-ID: <CAFEAcA-91=s368kA_50J259EMd5U5W9fbvK09B_RGpNGxRpRLQ@mail.gmail.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22f
Subject: Re: [Qemu-devel] [PATCH v2 16/22] hw/intc/arm_gicv3: Implement
 gicv3_cpuif_update()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Patch Tracking <patches@linaro.org>,
	Shlomo Pongratz <shlomo.pongratz@huawei.com>,
	Shlomo Pongratz <shlomopongratz@gmail.com>,
	Pavel Fedin <p.fedin@samsung.com>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Shannon Zhao <shannon.zhao@linaro.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rQeQmI6RHRQJ

On 13 June 2016 at 08:56, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
>
>
> On 2016/5/26 22:55, Peter Maydell wrote:
>> +void gicv3_cpuif_update(GICv3CPUState *cs)
>> +{
>> +    /* Tell the CPU about its highest priority pending interrupt */
>> +    int irqlevel = 0;
>> +    int fiqlevel = 0;
>> +    ARMCPU *cpu = ARM_CPU(cs->cpu);
>> +    CPUARMState *env = &cpu->env;
>> +
>> +    trace_gicv3_cpuif_update(gicv3_redist_affid(cs), cs->hppi.irq,
>> +                             cs->hppi.grp, cs->hppi.prio);
>> +
>> +    if (cs->hppi.grp == GICV3_G1 && !arm_feature(env, ARM_FEATURE_EL3)) {
>> +        /* If a Security-enabled GIC sends a G1S interrupt to a
>> +         * Security-disabled CPU, we must treat it as if it were G0.
>> +         */
>> +        cs->hppi.grp = GICV3_G0;
>> +    }
>> +
>> +    if (icc_hppi_can_preempt(cs)) {
>> +        /* We have an interrupt: should we signal it as IRQ or FIQ?
>> +         * This is described in the GICv3 spec section 4.6.2.
>> +         */
>> +        bool isfiq;
>> +
>> +        switch (cs->hppi.grp) {
>> +        case GICV3_G0:
>> +            isfiq = true;
>> +            break;
>> +        case GICV3_G1:
>> +            isfiq = (!arm_is_secure(env) ||
>> +                     (arm_current_el(env) == 3 && arm_el_is_aa64(env, 3)));
>> +            break;
>> +        case GICV3_G1NS:
>> +            isfiq = arm_is_secure(env);
>> +            break;
>> +        default:
>> +            g_assert_not_reached();
>> +        }
>> +
>> +        if (isfiq) {
>> +            fiqlevel = 1;
>> +        } else {
>> +            irqlevel = 1;
>> +        }
>> +    }
>> +
>> +    trace_gicv3_cpuif_set_irqs(gicv3_redist_affid(cs), fiqlevel, irqlevel);
>> +
>> +    qemu_set_irq(cs->parent_fiq, fiqlevel);
>> +    qemu_set_irq(cs->parent_irq, irqlevel);
> Does it need to set both fiq and irq for one interrupt? I think it
> should be called differently based on the value of isfiq.

If the state of the CPU changes then an asserted interrupt may
switch from "must assert FIQ" to "must assert IRQ". This means
we need to call qemu_set_irq() for both (in one case with a 0
level and in the other case with a 1 level); we can't just ignore
the IRQ/FIQ line which doesn't apply to this interrupt.
There's also the case of "icc_hppi_can_preempt() returns false" where
we need to make both calls with a 0 level, so we can't simplify to
one call with isfiq and one call with !isfiq.

thanks
-- PMM
