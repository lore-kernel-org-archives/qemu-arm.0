Received: by 10.28.71.155 with SMTP id m27csp306414wmi;
        Thu, 22 Mar 2018 05:52:13 -0700 (PDT)
X-Google-Smtp-Source: AIpwx48gOmNV6MUWHC6I05vRpTE2zFt7kDuBgYFHtm5I+WyWXkI/jC1EkfQpJJ0DeITEl5zTnRFh
X-Received: by 10.237.47.99 with SMTP id l90mr7784583qtd.27.1521723133062;
        Thu, 22 Mar 2018 05:52:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521723133; cv=none;
        d=google.com; s=arc-20160816;
        b=AN/tTEAQmkaJ8XzeZUJWd9g49mvrTArnJFhp2Kz89n3fVn2pH8hB+XT5tG+ov3lg6R
         J+ZM6BkpKMgeZoMi5cxGRDqnAp7SabjxmhIxlpNPk+ZRTfkEBECuRIeNDIeEOo/uRyQ9
         qVHRFE5VP645PCvbLaCf9NNvDvuqz8FhTR18DP7EaUeuOqXHg9MDEqhAGWomwUa9ju8d
         6xA8BM7bqqmwOoSaVZ6zdtdDuH1yt8EaovIK/M1a0pg2mqXkqtJWapWOzne+9Sle4Yvj
         pigCpcKpQKGj+7VGYYH8DdRjKI9H34a9ahk5lVllhjmz22B5JzYhprPV34DXjR3+MtUE
         j95A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=XHN4vkjp2wWeG0w3dqsS2QoKRsyI57A20/SShmcLl4E=;
        b=TKxlZNs7IAgc17T+V4ZgaZjd4hNkBXq2QWyTssg5TyDJtgHaDNbZEfhmmAECCHDrfE
         tjPg8yss9I2psiuPMXYdv4K+9a0/F7sjvy4Ialwe+XxhqMUkEf1jbU/xCXVkCtnRhozF
         helY2dnC1lITrR150tG6ljYPm6ydsmqejtOXyjE1GdYnt93DyOkDYu2aX27kF8SN2yaj
         02Wsq4+vxSWi5LL7tggkuCX+PlqI4n03w4Xau4nRqaI1ThPpo8cBvfr3Cn/RPJLXD9+c
         Gmz2NNl+XGRlf9mhLHBw3VDhcxRTvaVYFx+qvbV7t6x/d+nn2mmBG2ltVc2IFIkWbjn/
         DO+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JLh4Hidz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z185si757346qke.190.2018.03.22.05.52.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Mar 2018 05:52:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JLh4Hidz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60614 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyzhU-0004Ps-IX
	for alex.bennee@linaro.org; Thu, 22 Mar 2018 08:52:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59377)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eyzhF-0004PL-E3
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 08:51:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eyzhE-0002va-Bf
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 08:51:57 -0400
Received: from mail-ot0-x244.google.com ([2607:f8b0:4003:c0f::244]:41130)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eyzhE-0002vD-7K
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 08:51:56 -0400
Received: by mail-ot0-x244.google.com with SMTP id i28-v6so9280993otf.8
	for <qemu-arm@nongnu.org>; Thu, 22 Mar 2018 05:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XHN4vkjp2wWeG0w3dqsS2QoKRsyI57A20/SShmcLl4E=;
	b=JLh4HidzCBwdtWBbbOdQ4qDMhXsUmGXPDJPUMf7J+W4tc9ZpDsdtz3q+dlb61mICCT
	9B8iTOpXpjLeDouDxCTUFA6VwrmKtXSJBC657/M37O2js6HPjG1xgZXUJaTsryfexe2T
	ZMIxpRvoD4RBu1n26hQuqTsE4aN7Wbc6ySPzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XHN4vkjp2wWeG0w3dqsS2QoKRsyI57A20/SShmcLl4E=;
	b=mUp8GGeFQTKixOjplxa75FxJ/o54yGHtC0B5YCtWufQF3sn1NDSI5Cb37uCkP4XFTX
	t9X3vlij0XzYw5xVvrHbByl2wl8u3OYi47DfbIOOxIBR4Bw0WBizTif98QK+lLJwQr+s
	FWLBvsDFSbePqDtqYAKftWMnjGG9/x7AM6NdZkmIKp2ngAO0SiboAJFlBX/Wo325QV9e
	/e8q1tjb5XtMmoFPVWiocHQhLPh8dvVei+RRll04DoaO3jw1yxdcrGNOLLNS9LrTOIQB
	qwicFOtzY1fc9qfrkgWh99Bg5J8lalPQ2AFGYtOkfqHfuYEcydqtElTN9EvRdPQX0o8s
	YaNA==
X-Gm-Message-State: AElRT7FE3/3K0MKCTWA35FMSeL1yRDET3WcJdcIboqQFim3aqtlGWWM8
	mU7vJfF1VuJRjiKvAuNlr0n3HKezjtrxjbnBuHcneezS
X-Received: by 2002:a9d:4598:: with SMTP id
	x24-v6mr14868519ote.126.1521723115167; 
	Thu, 22 Mar 2018 05:51:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Thu, 22 Mar 2018 05:51:34
	-0700 (PDT)
In-Reply-To: <20180315133441.24149-1-peter.maydell@linaro.org>
References: <20180315133441.24149-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Mar 2018 12:51:34 +0000
Message-ID: <CAFEAcA_hAmDDdbTpR2PYu0SLd5nJvwcw34xRgiHXtiU_5kQxWg@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-2.12] hw/intc/arm_gicv3: Fix
 secure-GIC NS ICC_PMR and ICC_RPR accesses
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 07ql4VUGYEBr

Ping for code review -- it would be nice to put this bugfix
into rc1.

thanks
-- PMM

On 15 March 2018 at 13:34, Peter Maydell <peter.maydell@linaro.org> wrote:
> If the GIC has the security extension support enabled, then a
> non-secure access to ICC_PMR must take account of the non-secure
> view of interrupt priorities, where real priorities 0..0x7f
> are secure-only and not visible to the non-secure guest, and
> priorities 0x80..0xff are shown to the guest as if they were
> 0x00..0xff. We had the logic here wrong:
>  * on reads, the priority is in the secure range if bit 7
>    is clear, not if it is set
>  * on writes, we want to set bit 7, not mask everything else
>
> Our ICC_RPR read code had the same error as ICC_PMR.
>
> (Compare the GICv3 spec pseudocode functions ICC_RPR_EL1
> and ICC_PMR_EL1.)
>
> Fixes: https://bugs.launchpad.net/qemu/+bug/1748434
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/arm_gicv3_cpuif.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
> index 5cbafaf497..26f5eeda94 100644
> --- a/hw/intc/arm_gicv3_cpuif.c
> +++ b/hw/intc/arm_gicv3_cpuif.c
> @@ -836,7 +836,7 @@ static uint64_t icc_pmr_read(CPUARMState *env, const ARMCPRegInfo *ri)
>          /* NS access and Group 0 is inaccessible to NS: return the
>           * NS view of the current priority
>           */
> -        if (value & 0x80) {
> +        if ((value & 0x80) == 0) {
>              /* Secure priorities not visible to NS */
>              value = 0;
>          } else if (value != 0xff) {
> @@ -871,7 +871,7 @@ static void icc_pmr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>              /* Current PMR in the secure range, don't allow NS to change it */
>              return;
>          }
> -        value = (value >> 1) & 0x80;
> +        value = (value >> 1) | 0x80;
>      }
>      cs->icc_pmr_el1 = value;
>      gicv3_cpuif_update(cs);
> @@ -1609,7 +1609,7 @@ static uint64_t icc_rpr_read(CPUARMState *env, const ARMCPRegInfo *ri)
>      if (arm_feature(env, ARM_FEATURE_EL3) &&
>          !arm_is_secure(env) && (env->cp15.scr_el3 & SCR_FIQ)) {
>          /* NS GIC access and Group 0 is inaccessible to NS */
> -        if (prio & 0x80) {
> +        if ((prio & 0x80) == 0) {
>              /* NS mustn't see priorities in the Secure half of the range */
>              prio = 0;
>          } else if (prio != 0xff) {
> --
> 2.16.2
