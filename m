Received: by 10.25.15.230 with SMTP id 99csp1666582lfp;
        Tue, 28 Mar 2017 08:08:53 -0700 (PDT)
X-Received: by 10.55.130.4 with SMTP id e4mr27409955qkd.65.1490713733426;
        Tue, 28 Mar 2017 08:08:53 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i20si3651485qta.138.2017.03.28.08.08.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 28 Mar 2017 08:08:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53841 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cssjs-00007J-Tj
	for alex.bennee@linaro.org; Tue, 28 Mar 2017 11:08:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34654)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1cssjp-00006I-56
	for qemu-arm@nongnu.org; Tue, 28 Mar 2017 11:08:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1cssjo-0007Sf-93
	for qemu-arm@nongnu.org; Tue, 28 Mar 2017 11:08:49 -0400
Received: from mail-ot0-x244.google.com ([2607:f8b0:4003:c0f::244]:33467)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <vijay.kilari@gmail.com>)
	id 1cssjo-0007SC-53; Tue, 28 Mar 2017 11:08:48 -0400
Received: by mail-ot0-x244.google.com with SMTP id j47so9584765otd.0;
	Tue, 28 Mar 2017 08:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=38o4fG9DoRfOVZMQr9cauAox0K2r0Kz+jQumx0YUofE=;
	b=bEPwsyC+KCVZ2JynqgkIjX7cB7wHWHhnz2lWgfndM5Azoy2cvunhhvRnqIMO0+34+h
	gO05JyORCi0rd+UrpWxR6rUgzOsvOIhsWLA35DVURcceNUaqOW2r+i2Ak2W1A6Kam7NW
	mI0FOaW2A7AaIDYj0VdGPtpsmdgAr83nMC6Jk9JRQVe1dtZ0SP6CCiedahytHQ27fsgD
	mKRsp0iHWQBOVr02D8ltJWnHWxTY8uvGE6Fn8ekYwtO3y2dX9Mc5oFRte+AnhvTDtsFq
	XCeB3Ifg/N4ny1aFdYL0yZYyYJh+o6L6grVQSpjgsRN8/3J5BUHoJAjfBoIrfJBM0Fjv
	027g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=38o4fG9DoRfOVZMQr9cauAox0K2r0Kz+jQumx0YUofE=;
	b=Dko9WAhocEE/f9d9eiZgFHAvKD7pd16qpi7YA0EF2fCujqktwpbOWNqNPoWxNIc+Ys
	x4GgEL/Fi8XNt3mTqxg5O9EOo+kaa5hOi/Wa6tLtYVFF5vxNzO6InXu6zBNs3zFUvsuQ
	6FidlbP1bnBp0VS8tdjImFFg81Clh7AdVjVQDzYBEA5VWpOCeAf8Vdk4M2QKmvwQ4l8B
	O/fzoD3O1yuYgvh9ebKJKCcIvNQxp1soqTzrOjzF39SNEJ2waxQJ3e1ncvjwvefQY7/9
	Dwl6RJ38MU+02nNUU88sTO6CBlIi49kP7Edek+tcHGfwVzc/qYntfslxxj+4SYG8sHkd
	Pm4Q==
X-Gm-Message-State: AFeK/H1jhZSciNfMOsIcpH6WJ5RpRazduD60QnSSFJukNWS9Qrp5fa0fgg/2iM02HED8AumwweBCtwuI9Yd/Rg==
X-Received: by 10.157.46.232 with SMTP id w95mr13028068ota.78.1490713727298;
	Tue, 28 Mar 2017 08:08:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.37.120 with HTTP; Tue, 28 Mar 2017 08:08:46 -0700 (PDT)
In-Reply-To: <1490709513-7180-1-git-send-email-eric.auger@redhat.com>
References: <1490709513-7180-1-git-send-email-eric.auger@redhat.com>
From: Vijay Kilari <vijay.kilari@gmail.com>
Date: Tue, 28 Mar 2017 20:38:46 +0530
Message-ID: <CALicx6t8ZsN96rqOb8ydh56FnO9mPog3QxhN_Sa3Apa85_9nUQ@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::244
Subject: Re: [Qemu-arm] [PATCH] hw/intc/arm_gicv3_kvm: Check
 KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS in reset
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
Cc: Peter Maydell <peter.maydell@linaro.org>, drjones@redhat.com,
	QEMU Developers <qemu-devel@nongnu.org>, "Kumar,
	Vijaya" <Vijaya.Kumar@cavium.com>,
	qemu-arm <qemu-arm@nongnu.org>, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CATSSuMYpejm

Hi Eric,

On Tue, Mar 28, 2017 at 7:28 PM, Eric Auger <eric.auger@redhat.com> wrote:
> KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS needs to be checked before
> attempting to read ICC_CTLR_EL1; otherwise kernel versions not
> exposing this kvm device group will be incompatible with qemu 2.9.
>
> Fixes: 07a5628  ("hw/intc/arm_gicv3_kvm: Reset GICv3 cpu interface registers")
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reported-by: Prakash B <bjsprakash.linux@gmail.com>
>
> ---
>
> I understand the ICC_CTLR_EL1 state only is used in the put() function
> which is used for migration
> ---
>  hw/intc/arm_gicv3_kvm.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
>
> diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
> index 81f0403..4c3a88e 100644
> --- a/hw/intc/arm_gicv3_kvm.c
> +++ b/hw/intc/arm_gicv3_kvm.c
> @@ -614,12 +614,6 @@ static void arm_gicv3_icc_reset(CPUARMState *env, const ARMCPRegInfo *ri)
>      s = c->gic;
>      cpu = ARM_CPU(c->cpu);
>
> -    /* Initialize to actual HW supported configuration */
> -    kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS,
> -                      KVM_VGIC_ATTR(ICC_CTLR_EL1, cpu->mp_affinity),
> -                      &c->icc_ctlr_el1[GICV3_NS], false);
> -
> -    c->icc_ctlr_el1[GICV3_S] = c->icc_ctlr_el1[GICV3_NS];
>      c->icc_pmr_el1 = 0;
>      c->icc_bpr[GICV3_G0] = GIC_MIN_BPR;
>      c->icc_bpr[GICV3_G1] = GIC_MIN_BPR;
> @@ -628,6 +622,17 @@ static void arm_gicv3_icc_reset(CPUARMState *env, const ARMCPRegInfo *ri)
>      c->icc_sre_el1 = 0x7;
>      memset(c->icc_apr, 0, sizeof(c->icc_apr));
>      memset(c->icc_igrpen, 0, sizeof(c->icc_igrpen));
> +
> +    if (!kvm_device_check_attr(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS,
> +                              KVM_VGIC_ATTR(ICC_CTLR_EL1, cpu->mp_affinity))) {
> +        return;
> +    }

 Can't we use gicv3 migration blocker provided if it is set before this reset.

> +    /* Initialize to actual HW supported configuration */
> +    kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS,
> +                      KVM_VGIC_ATTR(ICC_CTLR_EL1, cpu->mp_affinity),
> +                      &c->icc_ctlr_el1[GICV3_NS], false);
> +
> +    c->icc_ctlr_el1[GICV3_S] = c->icc_ctlr_el1[GICV3_NS];
>  }
>
>  static void kvm_arm_gicv3_reset(DeviceState *dev)
> --
> 2.5.5
>
