Received: by 10.223.188.70 with SMTP id a6csp563425wrh;
        Fri, 25 Aug 2017 02:35:54 -0700 (PDT)
X-Received: by 10.55.97.200 with SMTP id v191mr12917336qkb.169.1503653754349;
        Fri, 25 Aug 2017 02:35:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503653754; cv=none;
        d=google.com; s=arc-20160816;
        b=gtO23gwKMIBbixnTJuPC2dyvxl8r75+ww21ybm8NERTExFgh0LPh92tCkzaSIa5AhT
         nSLf+y1mmTRhqzQmVguQ6jPapoWY60hLgGQvz1VLMK2eebHE5MQr+LT3gYRs+Zom8FhC
         w4Yz0qY0kEBKwY9GYWpMxogW1bFvhS6S8N4xh/QfosCl3+GRVRfiaPAZ1yVqQM0HOYdG
         9II5R9HMTvT0w+W0pu+f8aVdtOS4Gfibr3RsE6moRuCY34gvuQxQq4ZyHB99jvzoOorv
         L+jrdaUTjxZjYODVCvdZ942j5Na/i9kRAtuYBz/6/iQT31J1aDcEG3D+0SAhsBK1QlKs
         rSfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Q0ox92N4cjNhzJTdHkjnIMOois3yAbWo+/egkS4GKc0=;
        b=uVwLVkERLstD+dBLZCfDK5vfXfqxoZzu9cuCWgiTQjvpG/3x0m+a4uvWf7rWjmpVR6
         nO2biKemMXarkBNXKJB9rO9u/mS78/FqnYiBuWMjvQs41kELDI9EpI4HVykIjF4s0Gok
         fzJmAvY78uKLqWa4i+WePcexbHg5gVta+nbyX89LwnsGwsRwrswZ7MNJQVoLAV//Aej4
         i5YhZnrE2gtKfbIG7Wl7AJ74P7Kn+7IyABUVRuM92Yo8KysCc/o19cXH0nxJ/Mk23/qF
         YqsXr8y50mmz6Yi26+J2EGMYnpVa6KJr7BkUtB0UPIITf65Cb7MzqohIhUx11q25S4Js
         m2KA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OeGUC0gz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g64si2240896qtd.528.2017.08.25.02.35.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 25 Aug 2017 02:35:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OeGUC0gz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52265 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dlB1s-0002Sh-2O
	for alex.bennee@linaro.org; Fri, 25 Aug 2017 05:35:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46669)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dlB0Q-0001Lf-NC
	for qemu-devel@nongnu.org; Fri, 25 Aug 2017 05:34:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dlB0P-0001SM-T2
	for qemu-devel@nongnu.org; Fri, 25 Aug 2017 05:34:22 -0400
Received: from mail-wm0-x233.google.com ([2a00:1450:400c:c09::233]:37670)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dlB0P-0001Rk-Lb
	for qemu-devel@nongnu.org; Fri, 25 Aug 2017 05:34:21 -0400
Received: by mail-wm0-x233.google.com with SMTP id b189so8146051wmd.0
	for <qemu-devel@nongnu.org>; Fri, 25 Aug 2017 02:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Q0ox92N4cjNhzJTdHkjnIMOois3yAbWo+/egkS4GKc0=;
	b=OeGUC0gzmejDnlKd+7pfE9FVs2s2sTCMgRhfJ/FgftwdHEdrGYoTHAqh+UIjdubMTV
	fTB6XWSaAWHQszvL9IZDUBtt8ww234mApxWDidUR4pwI2Fd8ypRSQksQD+t54UeFt9gC
	pzlkkdnXDGEmAkzeoiRLnqmzyCSyfo0dMXcsc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Q0ox92N4cjNhzJTdHkjnIMOois3yAbWo+/egkS4GKc0=;
	b=kvC6ZJR+aih5zzzp+pXt5FGewNNgKw3uaUGqRkaBkZB8TQwl7A/ZiOSRtFk0omDT9o
	DBiup4Z/rDI1zL+o13oXuqjK6YMU5vXFl4NVSuDoSD7frAkhdwwEMgJeHcSjHr/IrdFF
	yfDkvHIg0EeXbuyadyK6BWhcyg6PTykoF0mL/5ViA0TVvlMfUqYyGpNasZkpVFZ7ewco
	8eKXB3ilxxs/uKiwtr339tGSbCjXG9P7kCzpsaXIyQYyDHouO5c9CWv6Pd3fQLYjtZmh
	rtKkFeJD4ZZhuRiewjeKFl16JvyInNr7aLtPStZeH1oKpN+1FTphBKsE3TtaS/oF7Kak
	bBcQ==
X-Gm-Message-State: AHYfb5ilcrI25/oN3XyZ51MJSU6IDsvXx6x4KGtKSpJAVrEStNItxRHB
	REfUe0EoDpP8DcNOhy9mm6CDXtMkpt1Z
X-Received: by 10.28.152.87 with SMTP id a84mr845150wme.130.1503653660603;
	Fri, 25 Aug 2017 02:34:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.54 with HTTP; Fri, 25 Aug 2017 02:34:00 -0700 (PDT)
In-Reply-To: <1503414539-28762-6-git-send-email-peter.maydell@linaro.org>
References: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
	<1503414539-28762-6-git-send-email-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Aug 2017 10:34:00 +0100
Message-ID: <CAFEAcA_+oy3ys_56j+QjDDrCabU_f5SamOCiPaMJ-z+3ZkdKVA@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::233
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 05/20] target/arm: Add MMU
 indexes for secure v8M
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
Cc: "patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ufEdZ8m17AEr

On 22 August 2017 at 16:08, Peter Maydell <peter.maydell@linaro.org> wrote:
> Now that MPU lookups can return different results for v8M
> when the CPU is in secure vs non-secure state, we need to
> have separate MMU indexes; add the secure counterparts
> to the existing three M profile MMU indexes.

> @@ -2206,7 +2217,11 @@ static inline int cpu_mmu_index(CPUARMState *env, bool ifetch)
>           */
>          if ((env->v7m.exception > 0 && env->v7m.exception <= 3)
>              || env->v7m.faultmask) {
> -            return arm_to_core_mmu_idx(ARMMMUIdx_MNegPri);
> +            mmu_idx = ARMMMUIdx_MNegPri;
> +        }

Incidentally this is not exactly the right check to make when
the security extension is present, but at this point in the
series it's the best we can do (the right check requires us
to have exception banking support in the NVIC so we can
check secure HF and nonsecure HF separately); the patch to
do it right will come after the NVIC patches.

thanks
-- PMM
