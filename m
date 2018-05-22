Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp1437770wme;
        Tue, 22 May 2018 05:35:29 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZp3+ZGUmSP+qHUSgYtrWrZsQti9iPBY+HqmDkG2mDReDb79Hci+pj+dKFyOtvadm+07MyPP
X-Received: by 2002:a37:1f91:: with SMTP id n17-v6mr21198342qkh.374.1526992529586;
        Tue, 22 May 2018 05:35:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526992529; cv=none;
        d=google.com; s=arc-20160816;
        b=sOPaT182ihGdqmek5RElz+XPTNCvcC4DXHOq0/Sa4magjyQc1TzsJ4B8xIAHT2hIKj
         BAJsoVr9CWU9sZdjdi+Paq254Tr5Ag1Y0wb8YG4AlFdzXvjzkAOqYc6FDStwExewU8uy
         2F/emKDcZiwBksKnFOoU/gqNOxxcGNp7e9aHrGDvBHWccE1V2GYFT+2uJ58GzET0ChpP
         IDogSpkF9AiTDq4PO+4oycQ8nvkycKAv2RQSSsamMEo/z2edyrcPFWaEbF9AJMj652mH
         fIlwltyKnxamwKm1fvurQvW/H38LjJe7wCL1ynbwJUntdSNCFjPTeKiH4UZCI6wejvFm
         o7EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=56y+3N6wiwno+dpAw+wPVidc4WlvKNpkXBrH85/qi48=;
        b=h4JWiZqy8sHqMaGv5gyLu+dM58h17bPe1KwqNZYeoIQEURhxmYIhFUCAvQMN5FEFJt
         6eMcII0IYMUVMMkVd1P3nIXiYGZ75dFPRVHM11NNn1MyA2fwPAJ0vxBhH38pTkMH3IH2
         i+i1sX1Im9H8HGfoXFCARuoIf/6i27K6jCxpOKreO4venLYl888wJQVBvTbMfeQIeE5c
         oqHFxYXYPYrM6ThMO7lUVhKhJWFBhy/7dEyfNA3pgf6mtXP1lOOn5XB7PetLhqND37nf
         siylgj5fJG+VMtQnVFF7NukQ+lDpkrmVUnFZk2RP2FTpmbeag2ZIlUjfb/pKkni+J+UU
         1qzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EwrgJhUm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z19-v6si745524qtm.214.2018.05.22.05.35.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 May 2018 05:35:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EwrgJhUm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55508 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fL6Vl-00028y-44
	for alex.bennee@linaro.org; Tue, 22 May 2018 08:35:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36129)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fL6VZ-00024H-6f
	for qemu-arm@nongnu.org; Tue, 22 May 2018 08:35:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fL6VX-0001e7-VB
	for qemu-arm@nongnu.org; Tue, 22 May 2018 08:35:17 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:37933)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fL6VX-0001dX-R7
	for qemu-arm@nongnu.org; Tue, 22 May 2018 08:35:15 -0400
Received: by mail-oi0-x241.google.com with SMTP id k17-v6so16024884oih.5
	for <qemu-arm@nongnu.org>; Tue, 22 May 2018 05:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=56y+3N6wiwno+dpAw+wPVidc4WlvKNpkXBrH85/qi48=;
	b=EwrgJhUmQlEUsxueg90nTyK1+e8wExcb46Po/RDu+RKaw8GcaW0D9k+9hnTMnnzlEP
	cmIwkIVJz/gHAtHPiCxg535mLYgbiNsRp74Nv+UfaVLGY4ZucEdJhH1wRIQj9NqDlSDG
	6IXRgMIT9rRzURKQNI4NP2ZsLK4Y4Pedk00ko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=56y+3N6wiwno+dpAw+wPVidc4WlvKNpkXBrH85/qi48=;
	b=pE9u5rAw3ryAXaVZ9t4c9ju61PsFJjpdnyd4WI2R+FrRwVWZMfvbHNQ66okw2FjCBp
	kEYQwDz5/u7D8B1JJ86UiWf29NNRkteJKH3Sxn45Z74A97YqpCp8d4BUnexRg842k1JF
	yO9s80nClpLZDeIOJUUn9hiP1mY2BDEfM/s+Zv73vlz4deRnWxieuff49NOAl1IVOhqw
	hg8XT/a4w7aphAuMkMCSCU6mw6VAT3JNr23rlj9nZQVickxIihrUwxgnx8q+5fT0vmJb
	5wSZepdSRP01H2pnPke5wp7qkViCTYkv2tETJIR+0udD0pS5aMeWA8v/q6AQ4fB2g4n0
	I5nA==
X-Gm-Message-State: ALKqPwedYKKtUY7ScOPaoZvR7qpYq+nR4l9F9DmWPGBl/5INAqv/NsMQ
	sPjIaFkcQJIVFg+SCxwbsL1Fy6BtqxnhNHAhrfWJyA==
X-Received: by 2002:aca:f141:: with SMTP id
	p62-v6mr14411167oih.80.1526992515158; 
	Tue, 22 May 2018 05:35:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Tue, 22 May 2018 05:34:54
	-0700 (PDT)
In-Reply-To: <1526222114-5324-5-git-send-email-eric.auger@redhat.com>
References: <1526222114-5324-1-git-send-email-eric.auger@redhat.com>
	<1526222114-5324-5-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 May 2018 13:34:54 +0100
Message-ID: <CAFEAcA-foFnb7zcO_apsOk15ELpYcWqhAo1pyonm6h_1Wrkd8Q@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [RFC v2 4/7] hw/intc/arm_gicv3_kvm: Get prepared to
 handle multiple redist regions
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
Cc: Andrew Jones <drjones@redhat.com>, Marc Zyngier <marc.zyngier@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YpEswTiPSpUg

On 13 May 2018 at 15:35, Eric Auger <eric.auger@redhat.com> wrote:
> Let's check if KVM_VGIC_V3_ADDR_TYPE_REDIST_REGION is supported.
> If not, we check the number of redist region is equal to 1 and use the
> legacy KVM_VGIC_V3_ADDR_TYPE_REDIST attribute. Otherwise we use
> the new attribute and allow to register multiple regions to the
> KVM device.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/intc/arm_gicv3_kvm.c | 31 ++++++++++++++++++++++++++++---
>  1 file changed, 28 insertions(+), 3 deletions(-)
>
> diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
> index 7e76b87..1b32804 100644
> --- a/hw/intc/arm_gicv3_kvm.c
> +++ b/hw/intc/arm_gicv3_kvm.c
> @@ -714,6 +714,7 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
>  {
>      GICv3State *s = KVM_ARM_GICV3(dev);
>      KVMARMGICv3Class *kgc = KVM_ARM_GICV3_GET_CLASS(s);
> +    bool multiple_redist_region_allowed;
>      Error *local_err = NULL;
>      int i;
>
> @@ -750,6 +751,18 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
>          return;
>      }
>
> +    multiple_redist_region_allowed =
> +        kvm_device_check_attr(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_ADDR,
> +                              KVM_VGIC_V3_ADDR_TYPE_REDIST_REGION);
> +
> +    if (!multiple_redist_region_allowed && s->nb_redist_regions > 1) {
> +        error_setg(errp, "Multiple VGICv3 redistributor regions are not "
> +                   "supported by this host kernel");
> +        error_append_hint(errp, "A maximum of %d VCPUs can be used",
> +                          s->redist_region_count[0]);
> +        return;
> +    }
> +
>      kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_NR_IRQS,
>                        0, &s->num_irq, true, &error_abort);
>
> @@ -759,9 +772,21 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
>
>      kvm_arm_register_device(&s->iomem_dist, -1, KVM_DEV_ARM_VGIC_GRP_ADDR,
>                              KVM_VGIC_V3_ADDR_TYPE_DIST, s->dev_fd, 0);
> -    kvm_arm_register_device(&s->iomem_redist[0], -1,
> -                            KVM_DEV_ARM_VGIC_GRP_ADDR,
> -                            KVM_VGIC_V3_ADDR_TYPE_REDIST, s->dev_fd, 0);
> +
> +    if (!multiple_redist_region_allowed) {
> +        kvm_arm_register_device(&s->iomem_redist[0], -1,
> +                                KVM_DEV_ARM_VGIC_GRP_ADDR,
> +                                KVM_VGIC_V3_ADDR_TYPE_REDIST, s->dev_fd, 0);
> +    } else {
> +        for (i = s->nb_redist_regions; i >= 0; i--) {
> +            uint64_t val = i | ((uint64_t)s->redist_region_count[i] << 52);

A comment here about what this value is would be useful.

> +
> +            kvm_arm_register_device(&s->iomem_redist[i], -1,
> +                                    KVM_DEV_ARM_VGIC_GRP_ADDR,
> +                                    KVM_VGIC_V3_ADDR_TYPE_REDIST_REGION,
> +                                    s->dev_fd, val);
> +        }
> +    }
>
>      if (kvm_has_gsi_routing()) {
>          /* set up irq routing */

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
