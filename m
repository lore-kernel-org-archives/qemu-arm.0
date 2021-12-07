Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp4280721lfk;
        Tue, 7 Dec 2021 01:35:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy//3ys0n1uFTzcEFhjzn1/Mqk+Pn4n7n09pHytkEKMN5S2MRVLJkqkKSX3TPxfWjvQKOv/
X-Received: by 2002:a25:d292:: with SMTP id j140mr50472541ybg.637.1638869716608;
        Tue, 07 Dec 2021 01:35:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1638869716; cv=none;
        d=google.com; s=arc-20160816;
        b=VdFMMR2W8JVipRIyMmfYTLiiZVcHzzp0U44mUsfJpuvewfIrjlqmUcHN/pVZoYPlGp
         vBDIVAiIqbV47ib5Y+sTJIpzNopAjlpu0VJSniIf2VXDBD2iHJ6Z4phHvTPlw0K7NdQ1
         MsG/4vGOqYKn+JBscj7HjwDRdOmhYMauKZyJM9XAbvTbv8Sure4FqWXbhvzRXA5CPUs0
         V0DIQEcKa9skTMvN8MobJHZ8VVrQ9XlvBM+2jsTPpsoFGBOhd/JqyLmYUMoN3ElWihMA
         1AcOzYWsINi1QjKQV6wypxFx7J1qMgFwn8b3gFccqt4o1Ua5nmT4WwzbDr2pg/rbRaLo
         Voeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=Ga/TdewAwnYjtrz0dYb625T8oTmYNGoMR2hoDFVmITg=;
        b=Doe2qCNpJgVgfOMe9Vmv8LZXnI5JT/kb3mCccEdwfk9+Uq+9zaAGXt/x8tM6XDrBS0
         5jd3ir81Ruti6WqpF6iSyPN95ANYcV7+kiIRQqZdJCy7ib7mAN0bPsBY8PWkRqzogb0H
         ywQejWP+X1/UW6oCxS1i439AlYErSYI4qfLWAktPcZ7TLt27tD0qYD4k2aM5bvXuVToz
         z9RZwhSF3tL4tC7FjHa5FWj88MUN24kRPMZiz/U37rZwe/leJSvuByEjK8l9P4pJZE4W
         JWr3N2uhNd2dv6PvtQDrJVzAj+lJlaHdEsEJaUmgh6Nka6dHa3OGqz+xxKRylfXVmRcD
         UyAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=idlKOHpT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i10si19896494yba.599.2021.12.07.01.35.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Dec 2021 01:35:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=idlKOHpT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1muWsV-0001wq-S8
	for alex.bennee@linaro.org; Tue, 07 Dec 2021 04:35:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1muWrj-0001w5-31; Tue, 07 Dec 2021 04:34:27 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:35532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1muWrd-0000bo-M0; Tue, 07 Dec 2021 04:34:24 -0500
Received: from [172.17.10.6] (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 8D85820778;
 Tue,  7 Dec 2021 09:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1638869658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ga/TdewAwnYjtrz0dYb625T8oTmYNGoMR2hoDFVmITg=;
 b=idlKOHpTjEdlGEr55tJsHK8sefwnoffzAC3/rBG55UsEiHAJqQnesqZMnIMzjMAZpXEiEA
 tr9EYqJRNr4PV0XKoSRSzGW5vwVn+5yS6dAQZru9vADUv9PGidYs3fkPOr2UCkrbEZ9Nvo
 WiFYbSBCycwbedrCOX01TbuiqUUuvU0=
Message-ID: <6a85da1b-722a-b13e-3f3f-d69c70e23536@greensocs.com>
Date: Tue, 7 Dec 2021 10:34:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH for 6.2?] gicv3: fix ICH_MISR's LRENP computation
Content-Language: en-US-large
To: qemu-devel@nongnu.org
References: <20211207092909.2933-1-damien.hedde@greensocs.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <20211207092909.2933-1-damien.hedde@greensocs.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.44,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, shashi.mallela@linaro.org,
 qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: L8bjAY8Tyw1B

Sorry for the inconvenience, I screwed-up with the subject line.
Should I resend ?

Damien

On 12/7/21 10:29, Damien Hedde wrote:
> Subject: [PATCH for 6.2?] gicv3: fix ICH_MISR's LRENP computation
> 
> According to the "Arm Generic Interrupt Controller Architecture
> Specification GIC architecture version 3 and 4" (version G: page 345
> for aarch64 or 509 for aarch32):
> LRENP bit of ICH_MISR is set when ICH_HCR.LRENPIE==1 and
> ICH_HCR.EOIcount is non-zero.
> 
> When only LRENPIE was set (and EOI count was zero), the LRENP bit was
> wrongly set and MISR value was wrong.
> 
> As an additional consequence, if an hypervisor set ICH_HCR.LRENPIE,
> the maintenance interrupt was constantly fired. It happens since patch
> 9cee1efe92 ("hw/intc: Set GIC maintenance interrupt level to only 0 or 1")
> which fixed another bug about maintenance interrupt (most significant
> bits of misr, including this one, were ignored in the interrupt trigger).
> 
> Fixes: 83f036fe3d ("hw/intc/arm_gicv3: Add accessors for ICH_ system registers")
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
> The gic doc is available here:
> https://developer.arm.com/documentation/ihi0069/g
> ---
>   hw/intc/arm_gicv3_cpuif.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
> index 7fba931450..85fc369e55 100644
> --- a/hw/intc/arm_gicv3_cpuif.c
> +++ b/hw/intc/arm_gicv3_cpuif.c
> @@ -351,7 +351,8 @@ static uint32_t maintenance_interrupt_state(GICv3CPUState *cs)
>       /* Scan list registers and fill in the U, NP and EOI bits */
>       eoi_maintenance_interrupt_state(cs, &value);
>   
> -    if (cs->ich_hcr_el2 & (ICH_HCR_EL2_LRENPIE | ICH_HCR_EL2_EOICOUNT_MASK)) {
> +    if ((cs->ich_hcr_el2 & ICH_HCR_EL2_LRENPIE) &&
> +        (cs->ich_hcr_el2 & ICH_HCR_EL2_EOICOUNT_MASK)) {
>           value |= ICH_MISR_EL2_LRENP;
>       }
>   
> 
