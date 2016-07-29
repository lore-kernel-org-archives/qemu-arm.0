Received: by 10.25.21.156 with SMTP id 28csp1345303lfv;
        Fri, 29 Jul 2016 06:35:53 -0700 (PDT)
X-Received: by 10.200.50.20 with SMTP id x20mr65491795qta.71.1469799353099;
        Fri, 29 Jul 2016 06:35:53 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d6si12188628qtd.129.2016.07.29.06.35.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Jul 2016 06:35:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59616 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bT7xA-0005dX-EZ
	for alex.bennee@linaro.org; Fri, 29 Jul 2016 09:35:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56842)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bT7x6-0005cz-Hl
	for qemu-arm@nongnu.org; Fri, 29 Jul 2016 09:35:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bT7x5-0003Kr-IM
	for qemu-arm@nongnu.org; Fri, 29 Jul 2016 09:35:48 -0400
Received: from mail-ua0-x22e.google.com ([2607:f8b0:400c:c08::22e]:35817)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bT7x4-0003Ke-CH
	for qemu-arm@nongnu.org; Fri, 29 Jul 2016 09:35:47 -0400
Received: by mail-ua0-x22e.google.com with SMTP id l32so61936006ual.2
	for <qemu-arm@nongnu.org>; Fri, 29 Jul 2016 06:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cFRr+2yptT7oNfRCssvo4WIv0m5fb+wKSXIPE1CaX6Q=;
	b=X5DYvsFTwhL+KuNHXyxPjDxhbdUlIe3TjJNdKYXXz1iuZccVP9UqgjxO5Tf90uq6Sy
	BccdMB++ha7DntrPvQocaE9BZNTMvXkPKFxGdlm8LrGfLIs0wl5upMU0+IcWU8zwA3pb
	ZPhH4whDatk40v+yJeFntNxHAdnQsorY2GBhw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cFRr+2yptT7oNfRCssvo4WIv0m5fb+wKSXIPE1CaX6Q=;
	b=RDonhYHtBU/hrLYwmv2LVIRmFsve04VhI/zT59YrnCz7xMr1Q1nzyDaFLXJYz7t986
	zuVD6CiJf43m04Jvc1BL90LitfrLtJHTpJukn/JXFy0wq5oYgqkrXCUbrmfnH26mPV0H
	U4bHjA21vEmE7tV3b+sW0/gYJrsEljITwSLbOI0LCxSbDWF/kxTf7yguiDEadX6LFghW
	eeI6ULV49LFEHEGq7la0jXp20DcLKw4bYnG+jvaJOOKEMgR8q2IIaf3WHsP+bPDO69d3
	Y8lvoGNvZABozNXJErj9a73WYl6XeEwjAzlBmr0V2+/0X3ne1g2B7xI1XXtYC6BdKGgG
	1HNA==
X-Gm-Message-State: AEkoouuu95WNbepTPxLlkGDyGV6wDQ74vXZ0Q61PpbgCmVaYmMhmf1RPwblcIYwLzuFvVJ6Fm+s5MSTk+TKt8Ta5
X-Received: by 10.176.65.71 with SMTP id j65mr18586664uad.103.1469799345457;
	Fri, 29 Jul 2016 06:35:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.137.136 with HTTP; Fri, 29 Jul 2016 06:35:26 -0700 (PDT)
In-Reply-To: <1467798364-9049-6-git-send-email-eric.auger@redhat.com>
References: <1467798364-9049-1-git-send-email-eric.auger@redhat.com>
	<1467798364-9049-6-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 29 Jul 2016 14:35:26 +0100
Message-ID: <CAFEAcA9zz0Dr4+O02oDfjsjOAo=X1m=C2h48ged8_bDQiQmb6A@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::22e
Subject: Re: [Qemu-arm] [RFC v4 5/6] hw/intc/arm_gicv3_its: Implement
 support for in-kernel ITS emulation
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
Cc: Shlomo Pongratz <shlomopongratz@gmail.com>,
	Pavel Fedin <p.fedin@samsung.com>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	Diana Craciun <diana.craciun@freescale.com>, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zFvUPX+eYnpo

On 6 July 2016 at 10:46, Eric Auger <eric.auger@redhat.com> wrote:
> +/**
> + *
> + * We currently do not use kvm_arm_register_device to provide
> + * the kernel with the vITS control frame base address since the
> + * KVM_DEV_ARM_VGIC_CTRL_INIT init MUST be called after the
> + * KVM_ARM_SET_DEVICE_ADDR and the kvm_arm_register_device
> + * infra does not allow this.
> + */

So the conclusion on the kvm-arm mailing list was that the
kernel ought to permit DEVICE_ADDR to be set after INIT,
the same way it does for the GIC proper, right?

thanks
-- PMM
