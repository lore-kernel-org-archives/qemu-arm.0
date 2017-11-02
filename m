Received: by 10.223.161.27 with SMTP id o27csp2070965wro;
        Thu, 2 Nov 2017 06:06:14 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+Ri3mSt55MdkZsBoYW0vkNVVQJBI5A1ThzLE9CW7gyXMb9jwo94QA2r28bVP3e2UhLE2B01
X-Received: by 10.129.48.10 with SMTP id w10mr2259017yww.378.1509627974280;
        Thu, 02 Nov 2017 06:06:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509627974; cv=none;
        d=google.com; s=arc-20160816;
        b=CGwQD6q18AEkGR3ysOZNgM5LDJ/0H93umfyqMMEGIsAroKmIq6Vn9MEABYmHDQGYsZ
         AAVAOEif3SSvO1vX5c6Xjc872TPpozwGt7g6H2yAV2RoAK9lFoCvLxZLPFfEq17goeh6
         Vv1z178ZcHWVbatoZl10apFx7TCSU7TtUgoMUY1gfEK52THuO+ePLrcctbQlfI4JCUxo
         27CKwkXmPhS/PwMV8PK2POC6nqJbv3eS5WYX6AX6wPIshtjmBLDikhwjJkBCCpM3H9FV
         RN9fakdcGdJJveNBtMwrgCdKjIwsec7TRzXzPO/fE/nCsvXaaJg2iPxKBBdaN2YSr2pM
         7Dgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=ffx0JX7JdKQXg5RIcITZcQ1guljcq0sifI5VEBrV75M=;
        b=TQd6g8xuKDZDK8lqTT5YLvtoFzAlTPxDQp3U7E6U3q2pdG8i+YRYSH1w0YN3mymsYP
         5u0ltpuc7S7wBJj4/zhYDvFn8OBoKb/78dagcjICsGiZnSsS5i8yBTV6Z0mnofhtPc5k
         hIrroyfzstIQgT+GG5DL74wJ0bnAsgjlkBD9GFIe1rO9dPnP07xXYfYjFkQPWOuj5wYd
         as1Rp90cuoS8g/xBUdW/ra6DDLaw5MtvhUMMaGtCc8RnUVMAgwrAJgvaFShmnUPzqk7R
         d2y8A0pP041/l8Cc1as+y3CMwrGNFCivPiE+bcwM/2KcfClryofkcozBV94FDVjOzVJa
         xVRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VWyBzyLL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x4si738996ybx.465.2017.11.02.06.06.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 02 Nov 2017 06:06:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VWyBzyLL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60299 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eAFCH-0005DJ-Gq
	for alex.bennee@linaro.org; Thu, 02 Nov 2017 09:06:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47727)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eAFBN-0004bw-2s
	for qemu-arm@nongnu.org; Thu, 02 Nov 2017 09:05:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eAFBC-000057-7j
	for qemu-arm@nongnu.org; Thu, 02 Nov 2017 09:05:16 -0400
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243]:46105)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eAFBC-0008WF-0q
	for qemu-arm@nongnu.org; Thu, 02 Nov 2017 09:05:06 -0400
Received: by mail-wm0-x243.google.com with SMTP id m72so10994033wmc.1
	for <qemu-arm@nongnu.org>; Thu, 02 Nov 2017 06:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ffx0JX7JdKQXg5RIcITZcQ1guljcq0sifI5VEBrV75M=;
	b=VWyBzyLLYCq9Ml5/kgKA4sDuVVOMDwOw+DMJbXNlTs5G81sR14GtPd9wcfsy2uhgkH
	HL9MwtKtf2Rv01bRpep76pKI18+Qqu2Dz+oR5opRdNBXLKFH9N4huow1qDUY/GwsBugy
	FLkAAXrQX5vvOMUAY6vZxqgk8Y7steAsUuxiE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ffx0JX7JdKQXg5RIcITZcQ1guljcq0sifI5VEBrV75M=;
	b=J3Mu7ylf90hbJnFUwP6PrUkC9rIgHV+W/GBoIR3yST/Uz3iC4kfcI2hEIE0dQ9gqvg
	Z9MNGXngmkyoSYQ90V9nu61dwCKWVrCuj8Ad1k5mbl6o7yOkSoxVyphzrtTHGUld3mFh
	L5uKANYvCFofIwaFHU6r+q0O0w6mNqUsMt4xp3wqZPYLQOqun3iJdyOIi/90ez0PFQtG
	q/NUyHPCaA00bITMACoOQ4P6cgO6EuN6WZe1v+LwkXWz/YurjFyryuYHzdmlM5YxiB+7
	Aj8aJ/67RU2vaTe8qj8kAOR7zCkRm2b/cU3D8hqPjLGjrXMy4yTbVnhER/PaMZi+EJUM
	84tg==
X-Gm-Message-State: AMCzsaUQli/TC9jEeOxdSVjFPlL8lGlFIt30cXigdvBrv+mgv+4gt0DG
	0CTArdHozGfVmp+D2Lj4N+GZ2TgQ152nI352KJMezqt1
X-Received: by 10.28.10.147 with SMTP id 141mr1484193wmk.40.1509627905050;
	Thu, 02 Nov 2017 06:05:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.161.5 with HTTP; Thu, 2 Nov 2017 06:04:44 -0700 (PDT)
In-Reply-To: <1508772937-21054-5-git-send-email-eric.auger@redhat.com>
References: <1508772937-21054-1-git-send-email-eric.auger@redhat.com>
	<1508772937-21054-5-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Nov 2017 13:04:44 +0000
Message-ID: <CAFEAcA-ePpQn44zURCOyOV9cm6HAOD2YP4SLgWjkqzJErpEO5Q@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::243
Subject: Re: [Qemu-arm] [RFC v2 4/4] hw/intc/arm_gicv3_its: Implement full
 reset
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
Cc: Andrew Jones <drjones@redhat.com>, Vijay Kilari <vijay.kilari@gmail.com>,
	Juan Quintela <quintela@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, wu.wubin@huawei.com,
	wanghaibin.wang@huawei.com, Christoffer Dall <christoffer.dall@linaro.org>,
	eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: O1AePkK4pNvy

On 23 October 2017 at 16:35, Eric Auger <eric.auger@redhat.com> wrote:
> Voiding the ITS caches is not supposed to happen via
> individual register writes. So we introduced a dedicated
> ITS KVM device ioctl to perform a cold reset of the ITS:
> KVM_DEV_ARM_VGIC_GRP_CTRL/KVM_DEV_ARM_ITS_CTRL_RESET. Let's
> use this latter if the kernel supports it.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/intc/arm_gicv3_its_kvm.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
> index 537cea1..73e2530 100644
> --- a/hw/intc/arm_gicv3_its_kvm.c
> +++ b/hw/intc/arm_gicv3_its_kvm.c
> @@ -215,9 +215,19 @@ static void kvm_arm_its_post_load(GICv3ITSState *s)
>
>  static void kvm_arm_its_reset(DeviceState *dev)
>  {
> +    GICv3ITSState *s = ARM_GICV3_ITS_COMMON(dev);
>      KVMARMITSClass *c = KVM_ARM_ITS_GET_CLASS(s);
>
>      c->parent_reset(dev);
> +
> +    if (!kvm_device_check_attr(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
> +                               KVM_DEV_ARM_ITS_CTRL_RESET)) {
> +        error_report("ITS KVM: reset is not supported by the kernel");

Best to say "host kernel" so users know we're not complaining about
the guest kernel.

> +        return;
> +    }
> +
> +    kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
> +                      KVM_DEV_ARM_ITS_CTRL_RESET, NULL, true, &error_abort);
>  }
>
>  static Property kvm_arm_its_props[] = {
> --

This would be the right patch for the boilerplate for adding
the parent class and hooking into the reset function chain.

thanks
-- PMM
