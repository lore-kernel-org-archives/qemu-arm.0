Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B037CC6B30
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Oct 2026 10:40:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHIsg-0005cp-IQ; Thu, 15 Oct 2026 06:40:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xHIsV-0005PC-Qi
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 06:40:03 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xHIsP-0006Iz-2i
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 06:40:00 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-8b06c0794cfso20336667b3.0
 for <qemu-arm@nongnu.org>; Thu, 15 Oct 2026 03:39:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792060789; cv=none;
 d=google.com; s=arc-20260327;
 b=MufCjE1zbDrnzfyOhGGlVtc1evaft90qpHwCaVOh98bSWdEfVx0ehnnqBDGQaOKax+
 v8cyZzcPvB3v05bl7bsk1s6WxEYr0XSWnoTrdjj4X08iqjvyNxkkpHeJQeQFdx/wtR4v
 II4/NDzB/XIl9pM5UYk7wPgBDxCkxaD20T3avR9iZyX6Op0OonipM2tAjHcadubtbEqC
 k5bYr+bhDFJ5E691s95sJx07sKYzsywzJfVDLYnObvPWG2L8sxXHzNaDcJJrhZUnBvIK
 Ibn897sm7i7Se1JSiVxcF6pc6rPPKmoIK/MOiVXYVjgjmVhQzHty0dEn2MrDQQ3yYqs9
 Ivlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :dkim-signature;
 bh=V/znOodw9ZtSRrxHNh4pka25Q+ZzciVoG0oKJ7iCvkI=;
 fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
 b=cbL7sLjiYu6ExN0x0FaH2oQsZlPhGmOYaoK3mutXS+cs1JAZYfFjG2INztpoQXHFfk
 iXjIECANR6n1LVt8QtIQ76fVBp9O/XDZPCJnYdmNgONyDa5+dfv+PJkInglEz2k6LcI8
 gdkrgdxMSvEq2lzHmddSfyt9Gt5DV9LhfGU/QHnSQFGQ96u/Mb6Kg/j4rnnfkgkL1ksG
 yWVdzExYbIDiH/iZkcPR4Vh0tkAo7g9UkIIGS6o7ocKU5pCm5t4BO5t9aDMNVVm8TBEh
 6ZO8Kb30B+Q4AUnoaB1err+Lv9Vs7ndHrPlBIWydezR9+m9urR1BLtuhPaYxG51eneZQ
 jbnw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792060789; x=1792665589; darn=nongnu.org;
 h=content-type:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=V/znOodw9ZtSRrxHNh4pka25Q+ZzciVoG0oKJ7iCvkI=;
 b=vOiPTq/hw+siiTVtfkb8VqqI0ebEb71G37BFSmARqsX8kKnhp6CJ1zBEpLLLunxf5Z
 DxCGbH5gF3VKdJKQhTEPA9TROyaSLSQe8c+Ly2vSQ6H8k7VLrwjTRoj47DdubQ5HjuKg
 TuzySFBTRvTbyD9DSkCPrcn8dJtLUPIq5Hhv9zMUHxJzzVjlu3qwKvQ9GrsLr1IaesA/
 L4hYmsqZkFCYDorGhxgIpDR1UytwkPBpMEbw3V5Al8TQW4IqztMgFbhisQdp3IlhLNwz
 nl+lTFp2Na4IJu2bQL08qbrxZppF5nGdnvLrFF8ATfoZFQ9OQiCb/qfqo+qCtAuc9Uvp
 0ZzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792060789; x=1792665589;
 h=content-type:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=V/znOodw9ZtSRrxHNh4pka25Q+ZzciVoG0oKJ7iCvkI=;
 b=CtdOxwI0ZpExbMHlYcw8zEWNv3MqPuGpjvGx5mtsnbA02U3NnojNBX0mySqSnOvvJm
 9NfKzqkl63AXtpSFXuBXIApUjn3OwSPVW/YhekySLAoJmKQ54ggl3uxvsBvQDkkpJho+
 jLgbmlikL7jX+MFgQ9fLOEP1W6A4p/AS/+hLEg3LdF5rTUULRAKcYHRCLWPTHE9C9Bx6
 JGt5/jE8/yvHmeD06dgfEAUY8BT5PxdI4l22pxPdx7z3nrZ+zdFAXYpHJMe+PAFkOTJS
 CZduhbbwBOT2F9o4iXUs0K7U2C0M7gPe7TaZyvbonpb/Go4AMDYx7bBMw1Wiui/HawrW
 xDog==
X-Gm-Message-State: AFq9FYK6W2hbysqvuINxM2QJujveiWnvAV5WKUP/S6srHErp4fq1LOEI
 KO3RX6bemML2aCRiuZmaLYBx7SndeBXpVyu5y65i6L4TSEwCQSgi/lBFGD+el0Q5VZup6XGYXOR
 JXHVx/1rr++Aov6Oh2p4yrrI8giMD9MMRWsUd+ZxBpr+hUQLVlAlOGJk=
X-Gm-Gg: AYBFou247IQzxoN5VbWbvwjsyyxTLnPeR4qJxYllaFI9/I7n6leLBnQ72nM2DObjZ0L
 NVLOR3oZt3iEFEpZ3zZMGcLWf27IlXt8SWEwQfxPG9MyPiS1vaGwV4qnq8nBvganAz6wTkQEQef
 JEJHNiL6+Jpcc4RfwggiDJ8Qa9OkZgnB8r4gRhpQ5XGQdPRu+XLnmdBxKjibeffa5Ulxe9XR+j1
 0FGRu0p7vxp/I5IVm+nRM+T8J3ViwJFGM67t+v6/L8EhpKFNM4g2w3LOW9AgBdHtPc8HDn298th
 C64tvORiQj3veUeQZcnrlvnfnvzu2jGGGVVkU5vcVh8VGxbphCeqxzJyJOaMYJ/842kldGeNsRA
 YlMl1R79GTCGCyTWdlW241OQVNyDoRonYW3CFIUM=
X-Received: by 2002:a05:690c:289:b0:8b0:9e27:fcd0 with SMTP id
 00721157ae682-8b09e27fd6dmr57410827b3.21.1792060788749; Thu, 15 Oct 2026
 03:39:48 -0700 (PDT)
MIME-Version: 1.0
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
 <20261013083933.1024405-36-peter.maydell@linaro.org>
In-Reply-To: <20261013083933.1024405-36-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Oct 2026 11:39:37 +0100
X-Gm-Features: AclHuK9aHktjF_CMh96v8m_Vq8kpnwQFwVtLPlfmgQDJvfdwCQ_F51h_zqRg0B8
Message-ID: <CAFEAcA8UdkDPneWVVBXQ0HS1SdvRvJVqJYA8RN7giT8fX1fh7g@mail.gmail.com>
Subject: Re: [PATCH 35/86] target/arm: GICv5 cpuif: Implement ICH_CONTEXTR_EL2
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Tue, 13 Oct 2026 at 09:40, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The ICH_CONTEXTR_EL2 register is how the hypervisor tells the GICv5
> to make a VCPU for a VM resident on a CPU, so that the IRS will
> forward virtual interrupts for that VCPU to this CPU. We implement
> this similarly to the GICv5 stream protocol, which uses a
> SetResident command to tell the IRS to make the VCPU resident.
> This will always fail until we have implemented the IRS's
> end of virtualization support.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---

> +    /*
> +     * Changing V definitely causes us to make a new VPE resident, or
> +     * remove the old one.
> +     *
> +     * Changing VPE or VM while V=1 is CONSTRAINED UNPREDICTABLE
> +     * (R_VFKHN): we choose to make the new VPE resident so that we
> +     * can trust that the information we have in the register matches
> +     * what the IRS thinks the resident VPE is.
> +     *
> +     * For writes that don't trigger a change of resident VPE, we only
> +     * need to update our copy of the register, and recalculate
> +     * interrupts if IIRICHPPIDIS changed.
> +     *
> +     * If we do change the resident VPE, the interrupt recalculation
> +     * will happen when the IRS calls gicv5_forward_interrupt().
> +     */
> +    if (!(valid_changed || (valid && vm_vpe_changed))) {
> +        if ((oldval & value) & R_ICH_CONTEXTR_EL2_IRICHPPIDIS_MASK) {

This is supposed to be the usual "did a bit change?" check,
which should be "oldval ^ value", not "&"...

-- PMM

