Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2049119wrq;
        Thu, 14 Jun 2018 06:39:25 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJWEZQQD3T7F+u3s36/t3CubZJuQ/Pdnyv9tUikvPNuq1jLXgf13a5pKTzDiZ2MB4ZBq/V9
X-Received: by 2002:a37:6294:: with SMTP id w142-v6mr2111632qkb.124.1528983565456;
        Thu, 14 Jun 2018 06:39:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528983565; cv=none;
        d=google.com; s=arc-20160816;
        b=p3QkDS0TfD70QtExMVAnhfTaFyJocuEhm3ijtX3xaJS/Vml95AcjxEdTJvdy+nJpNb
         KZFJPmjaZT+Tmq9VjIg2Q27cuEkzu1arbJ5/+7JJsYu1Iq2wZFr+OU6pB3gMdZvfhBdc
         R9YcXNtT1csILIHx9HK/mTU8ah1zuZrnrP3i1B93JGr80FhQHlhVeG0lqJmZKQ9KuoFj
         VL8FHN2R4sP6qSSjesYj070IuM6LZajuTWF3kTNZuyvrntC0ywFlm0giYN9TQ37/uf3E
         0zyM20ybxw9pS5DD81pydJBwZXrlBL04/aOrLJF+HUztBOF6uAcHdxkDWnVWYTq1ZNFE
         YVdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=LOE3u18/z1CBlXwN+vbTvA/MYUq1Dx1a/b9eiRxH/N0=;
        b=ogzD+XDzl0NVdkyNPhQ8w7b7lCGIdWqQRtPNtSlFCalOUjQ+IAzu/bA9v0/upnHnDu
         WoM+nKXbD/ThdzTpUAqvhFmkFPldq5Bz5/c/eweF852ibMJPAXzjhwVLAb0MucKinFPA
         Li/J5ikD+LikyxTzJSSA997fFUTSQ5nO6nzAMtH2L90nx26JILUjeRp6m4gsd97obazr
         Yc+/EB8SWyYmU9A8/YL8qqf/5rYWwiwv5M+PK6PvZ78vrH28df+SW5rY+mdI8EEbK9L4
         7VHcPPf29M+oRHOxLKxwHMK/ndOLalk9+Le5aOVbX2zNVfQyanxoxgVYjkXTYwRPXM9u
         KlJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 39-v6si1089194qtm.383.2018.06.14.06.39.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Jun 2018 06:39:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40733 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fTSTE-0004uP-US
	for alex.bennee@linaro.org; Thu, 14 Jun 2018 09:39:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49253)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1fTST4-0004sD-PO
	for qemu-arm@nongnu.org; Thu, 14 Jun 2018 09:39:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1fTSSz-0001cl-NI
	for qemu-arm@nongnu.org; Thu, 14 Jun 2018 09:39:14 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:58990 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1fTSSz-0001cR-Hx; Thu, 14 Jun 2018 09:39:09 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ABE0640214E2;
	Thu, 14 Jun 2018 13:39:08 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DD871201E8ED;
	Thu, 14 Jun 2018 13:39:06 +0000 (UTC)
Date: Thu, 14 Jun 2018 15:39:04 +0200
From: Andrew Jones <drjones@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20180614133904.bic4wwjeed4ybu2u@kamzik.brq.redhat.com>
References: <1528879723-24675-1-git-send-email-eric.auger@redhat.com>
	<1528879723-24675-5-git-send-email-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1528879723-24675-5-git-send-email-eric.auger@redhat.com>
User-Agent: NeoMutt/20180512
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Thu, 14 Jun 2018 13:39:08 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Thu, 14 Jun 2018 13:39:08 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'drjones@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 4/9] hw/intc/arm_gicv3_kvm: Get
 prepared to handle multiple redist regions
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
Cc: peter.maydell@linaro.org, ard.biesheuvel@linaro.org, marc.zyngier@arm.com,
	qemu-devel@nongnu.org, christoffer.dall@arm.com,
	qemu-arm@nongnu.org, zhaoshenglong@huawei.com, lersek@redhat.com,
	eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UaXgKF5jtGBS

On Wed, Jun 13, 2018 at 10:48:38AM +0200, Eric Auger wrote:
> Let's check if KVM_VGIC_V3_ADDR_TYPE_REDIST_REGION is supported.
> If not, we check the number of redist region is equal to 1 and use the
> legacy KVM_VGIC_V3_ADDR_TYPE_REDIST attribute. Otherwise we use
> the new attribute and allow to register multiple regions to the
> KVM device.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> ---
> 
> v2 -> v3:
> - In kvm_arm_gicv3_realize rename val into add_ormask local variable and
>   add a comment
> - start the redist region registration  from s->nb_redist_regions - 1
>   downwards
> ---
>  hw/intc/arm_gicv3_kvm.c | 33 ++++++++++++++++++++++++++++++---
>  1 file changed, 30 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
> index ed7b719..52e6e70 100644
> --- a/hw/intc/arm_gicv3_kvm.c
> +++ b/hw/intc/arm_gicv3_kvm.c
> @@ -753,6 +753,7 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
>  {
>      GICv3State *s = KVM_ARM_GICV3(dev);
>      KVMARMGICv3Class *kgc = KVM_ARM_GICV3_GET_CLASS(s);
> +    bool multiple_redist_region_allowed;
>      Error *local_err = NULL;
>      int i;
>  
> @@ -789,6 +790,18 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
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
> @@ -798,9 +811,23 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
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
> +        for (i = s->nb_redist_regions - 1; i >= 0; i--) {

So we register in reverse-index order? Looking at your update to Linux doc
Documentation/virtual/kvm/devices/arm-vgic-v3.txt, shouldn't they be
registered in index-order? The doc says "Redistributor regions must be
registered in the incremental index order, starting from index 0."

Thanks,
drew

> +            /* Address mask made of the rdist region index and count */
> +            uint64_t addr_ormask =
> +                        i | ((uint64_t)s->redist_region_count[i] << 52);
> +
> +            kvm_arm_register_device(&s->iomem_redist[i], -1,
> +                                    KVM_DEV_ARM_VGIC_GRP_ADDR,
> +                                    KVM_VGIC_V3_ADDR_TYPE_REDIST_REGION,
> +                                    s->dev_fd, addr_ormask);
> +        }
> +    }
>  
>      if (kvm_has_gsi_routing()) {
>          /* set up irq routing */
> -- 
> 2.5.5
> 
> 
