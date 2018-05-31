Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp5949316wre;
        Thu, 31 May 2018 06:51:09 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKk7eCH0s18KMBf2u5b1vPDPMOcrURHa9Y7L5nnDln6ydPfr787hEsEI53u5nazfJOh7o8X
X-Received: by 2002:a37:9285:: with SMTP id u127-v6mr6293208qkd.261.1527774669643;
        Thu, 31 May 2018 06:51:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527774669; cv=none;
        d=google.com; s=arc-20160816;
        b=f1quePgj0IK8Ygk1LOMSlMWnhJNVcu5mpQnlEpc/2KQY3g3d/MWFJamByXA8Km5Oce
         Su09aOAy3lKVvs8nGugJAPtEutECljdsIV3ya76tofsxyqnQkIKfE4uPpKaOcSyu6+Z2
         xsxJr7LIPLE5UmDvGVRBSvqoX/Evjred+VXvvpCyXO1mUZnSRGgwTCpfHOlpPvM95wGf
         H6l0k1HqKRnsFYPMU6D/MbJ4hbTU0oSUHJQsp8kggmhxG/JHZDycBA5zeEq6K24v80+B
         kGt6U02B5Hj/YsQfZyzoENl/4+fI31ilVKsT8wlmgGTbtxXlrWFQ7lpkj1ZefX8rVx7q
         byjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=O6oZtWc2A7Gd01POKpyUPT58+NP8Hnjy+lp3OLmMEtI=;
        b=vn4vfjFKboCG38M8xEtoXvxo/tRB3mMU86NejHTOdJ4SSsHNdxAUBywOVyH1u6jiH2
         iUHXsOtpDQkgfT3DlBAIfLwrPNtYWCSzbcCoOjjiTjOGPJr267ubS3rcup1r0fLf/PaA
         4H3k6gWCuPGed2j4ukpVuabdRzJeeWdUTdCjt71FD327Tn3F2AfWrZZiJSPpCGBk2Hzc
         3xMsCrU6ftK452jQouBTY8M+F7qhZSDI0JvxP7pHDZE/97VAxOCNSlyHWQ0LS3vJRsaL
         b6amIscZQ6281e9VS7YJMfSalnNp9GKHy5qcmswhL3BXawzN8nn7WIK+c7Q4j7UyvLZF
         s7/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XFYsz5Ah;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p60-v6si3089872qtd.15.2018.05.31.06.51.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 31 May 2018 06:51:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XFYsz5Ah;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44244 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fONyv-00082F-4D
	for alex.bennee@linaro.org; Thu, 31 May 2018 09:51:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33602)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fONyg-00081H-NY
	for qemu-arm@nongnu.org; Thu, 31 May 2018 09:50:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fONyf-0005pk-SM
	for qemu-arm@nongnu.org; Thu, 31 May 2018 09:50:54 -0400
Received: from mail-ot0-x244.google.com ([2607:f8b0:4003:c0f::244]:42218)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fONyf-0005pG-NW
	for qemu-arm@nongnu.org; Thu, 31 May 2018 09:50:53 -0400
Received: by mail-ot0-x244.google.com with SMTP id l13-v6so25349769otk.9
	for <qemu-arm@nongnu.org>; Thu, 31 May 2018 06:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=O6oZtWc2A7Gd01POKpyUPT58+NP8Hnjy+lp3OLmMEtI=;
	b=XFYsz5Ah0IRbl5WoNlj6QiM78mTqkyuw3EJTnAEWIwozCZ5ILspEPRB2nCZObnILkt
	wfrUgI6ojfH058qkWo5+j0M3fg69s7GXXc9dELPz0EbUETTZkieJvgbLh6lo9+i2twIr
	4lbSbnNDs+vFUTUfbCmxDQsOL70b2kfBKZmzE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=O6oZtWc2A7Gd01POKpyUPT58+NP8Hnjy+lp3OLmMEtI=;
	b=jheUmqF5XsvngLkmcfMx9o09G/qhA6aI42ak46IPVJsnPWawKxg5CxcLbL9BGfXoce
	BFQsi1tGWNhk52P7A5P9zSdQBXSf2/rkk1oUBNXe8+/RCPKiATB/M16F2TDgKAHHnkeg
	Pa9e6xL7DCALDhLPoihwUpSbZMTnYD5N+lfjfaIJ9xY2/YnGNaKwGE5TgYDJyDBrsHa5
	Jfn16gcOowzYnl1poqZaFe8ub2RdvtPZ1bS0HgAei0g98/f7ksxA8jmuLq/20MIAE4AB
	4L0kfnRblU87paCL96RuXSEO913j516HaDATdcO3kRjbCiEEJYQM3LRemG7MZCfg0i7u
	X10w==
X-Gm-Message-State: APt69E2FyFImKT7ZAJSdfA4ojr4mq/Fc4N8PiTlsaA+q69Wluf20iySa
	3ao6eppt4l5PCbGpUNn0y2b3ma+QgOQGJXCZNXi4Og==
X-Received: by 2002:a9d:34db:: with SMTP id
	t27-v6mr1343937otd.316.1527774653048; 
	Thu, 31 May 2018 06:50:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Thu, 31 May 2018 06:50:32
	-0700 (PDT)
In-Reply-To: <1527736557-11084-3-git-send-email-zhaoshenglong@huawei.com>
References: <1527736557-11084-1-git-send-email-zhaoshenglong@huawei.com>
	<1527736557-11084-3-git-send-email-zhaoshenglong@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 31 May 2018 14:50:32 +0100
Message-ID: <CAFEAcA-qWkhueUUnZ1RmhRuhHLstGpwmameHgsOM7UautJVxpw@mail.gmail.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::244
Subject: Re: [Qemu-arm] [PATCH v5 2/2] arm_gicv3_kvm: kvm_dist_get/put: skip
 the registers banked by GICR
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
Cc: Eric Auger <eric.auger@redhat.com>, qemu-stable <qemu-stable@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nj13cKZacf3u

On 31 May 2018 at 04:15, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
> While we skip the GIC_INTERNAL irqs, we don't change the register offset
> accordingly. This will overlap the GICR registers value and leave the
> last GIC_INTERNAL irq's registers out of update.
>
> Fix this by skipping the registers banked by GICR.
>
> Also for migration compatibility if the migration source (old version
> qemu) doesn't send gicd_no_migration_shift_bug = 1 to destination, then
> we shift the data of PPI to get the right data for SPI.
>
> Fixes: 367b9f527becdd20ddf116e17a3c0c2bbc486920
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>

> +    /*
> +     * While this new version QEMU doesn't have this kind of bug as we fix it,
> +     * so it's need to set the flag to true to indicate that and it's neccessary
> +     * for next migration to work from this new version QEMU.
> +     */
> +    cs->gicd_no_migration_shift_bug = true;

Nice catch; I would have forgotten that we needed to do this...


>
> +    /* For the KVM GICv3, affinity routing is always enabled, and the
> +     * GICD_IGROUPR0/GICD_IGRPMODR0/GICD_ISENABLER0/GICD_ISPENDR0/
> +     * GICD_ISACTIVER0 registers are always RAZ/WI. The corresponding
> +     * functionality is replaced by the GICR registers. It doesn't need to sync
> +     * them. So it should increase the offset to skip GIC_INTERNAL irqs.
> +     * This matches the for_each_dist_irq_reg() macro which also skips the
> +     * first GIC_INTERNAL irqs.
> +     */
> +    offset += (GIC_INTERNAL * 1) / 8;
> +    if (clroffset != 0) {
> +        clroffset += (1 * sizeof(uint32_t));
> +    }
> +

Shouldn't we be adding the same thing to clroffset that we add to offset ?

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
