Received: by 10.25.208.211 with SMTP id h202csp1886947lfg;
        Tue, 23 Feb 2016 11:18:13 -0800 (PST)
X-Received: by 10.140.201.209 with SMTP id w200mr46443385qha.57.1456255093271;
        Tue, 23 Feb 2016 11:18:13 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e6si24292754qge.68.2016.02.23.11.18.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Feb 2016 11:18:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:59472 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aYITL-0006Y4-P8
	for alex.bennee@linaro.org; Tue, 23 Feb 2016 14:18:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50272)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aYITJ-0006Xx-Qk
	for qemu-arm@nongnu.org; Tue, 23 Feb 2016 14:18:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aYITJ-0005Zg-0j
	for qemu-arm@nongnu.org; Tue, 23 Feb 2016 14:18:09 -0500
Received: from mail-vk0-x22b.google.com ([2607:f8b0:400c:c05::22b]:33119)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aYITI-0005ZT-RD
	for qemu-arm@nongnu.org; Tue, 23 Feb 2016 14:18:08 -0500
Received: by mail-vk0-x22b.google.com with SMTP id k196so172526188vka.0
	for <qemu-arm@nongnu.org>; Tue, 23 Feb 2016 11:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=dqoN5+pqZ7+9b5mGEbhAMqM9D4BRkyVFgopGivHqn90=;
	b=Vjj1vzw1KC9zK8PXCq2r86u+ml4ztDRHdGFAaDT6cjcAdBg3JxznuIOiBYiflGUU5Q
	ib8JhYQLk9KQ2+lqrWB5dcP80pcdj/4tlbfHGzTD8/BFVbSwtLkf/NnayPBMcvkmFrzP
	TjVLDSHLxogDLnISTLrBBircm7EMRR3mD26MY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=dqoN5+pqZ7+9b5mGEbhAMqM9D4BRkyVFgopGivHqn90=;
	b=lAg89/kVF/R+AsknsuvAIiXLnATmKjbaPHkeDpNBbjUxMACmizDUBIn8y5h4Y8Z3Gf
	0qNl5u+2ux2S6tfHcAJtILtpkeve+GB+bpYbNNi2q12/GRNu1otrk/C/1IqVx9NgmYW9
	bG0ulakGjUfmuITzN+aNT4GNTzpvAroyp7Sx/77EY296F0WFpsitX7+FGPq+5FJ5N1IW
	cwtQg+lJ/t3tt5EIGw9OSkk8HI4kmQz9um8i7fawNfW/M8ftmxgYcnOSOUoR9ouDQxFY
	aW4yCErS7hk4BsDMaHpRGrstOP+JCzN+z/vtmYz1+lOFONSEpaK7QQQTNSGwy2234cTB
	MNeg==
X-Gm-Message-State: AG10YOQLKtEambh0EJFpRLzn9XkcJqBVZK38j1NReKOSgmk6vyksN3sraMYASqu3WkAOUzFF+y/FHaf8q7gxNqik
X-Received: by 10.31.194.130 with SMTP id s124mr29089363vkf.92.1456255088265; 
	Tue, 23 Feb 2016 11:18:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Tue, 23 Feb 2016 11:17:48 -0800 (PST)
In-Reply-To: <1456253425-13541-1-git-send-email-peter.maydell@linaro.org>
References: <1456253425-13541-1-git-send-email-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 23 Feb 2016 19:17:48 +0000
Message-ID: <CAFEAcA8inHvaA8yehT0t1JWqwqU+6Ar4ZS4Nj1mtnTFtJZpAcw@mail.gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22b
Cc: Shlomo Pongratz <shlomopongratz@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/intc/arm_gic.c: Implement
	GICv2 GICC_DIR
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: esPfqR+TnSyG

On 23 February 2016 at 18:50, Peter Maydell <peter.maydell@linaro.org> wrote:
> The GICv2 introduces a new CPU interface register GICC_DIR, which
> allows an OS to split the "priority drop" and "deactivate interrupt"
> parts of interrupt completion. Implement this register.
> (Note that the register is at offset 0x1000 in the CPU interface,
> which means it is on a different 4K page from all the other registers.)
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

> +static void gic_deactivate_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
> +{
> +    int cm = 1 << cpu;
> +    int group = gic_has_groups(s) && GIC_TEST_GROUP(irq, cm);
> +
> +    if (!gic_eoi_split(s, cpu, attrs)) {
> +        /* This is UNPREDICTABLE; we choose to ignore it */
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "gic_deactivate_irq: GICC_DIR write when EOIMode clear");
> +        return;
> +    }
> +
> +    if (s->security_extn && !attrs.secure && !group) {
> +        DPRINTF("Non-secure DI for Group0 interrupt %d ignored\n", irq);
> +        return;
> +    }
> +
> +    GIC_CLEAR_ACTIVE(irq, cm);
> +    gic_update(s);

Whoops, this gic_update() call should be deleted, because the caller
will do a gic_update anyway. (The extra call is harmless but unnecessary.)

thanks
-- PMM
