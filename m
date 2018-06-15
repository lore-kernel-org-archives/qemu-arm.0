Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp992748wrq;
        Fri, 15 Jun 2018 08:37:36 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKI3UVXaG/EYU/jA5ZpfZUEVqEbxRfQT1tZP3Gr0xTMezjFoyTnNkKHeapbIE6hZEe3m5ao7
X-Received: by 2002:aed:25ac:: with SMTP id x41-v6mr1952458qtc.286.1529077056106;
        Fri, 15 Jun 2018 08:37:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529077056; cv=none;
        d=google.com; s=arc-20160816;
        b=xIDdFdZxllJIsoczUQpAkmalIZvxZwQs/017ne1JvSDaZr64E/aKaccE1MdypMUWuW
         PAdHmhLWZEOhcQi0moHfv0H6xuTXXkQurm5XJj5Ij3MRYVJ7ma5uWOAZhJGrHN8dca0A
         BJwwX2tRXtKbOmW+edXd4/hfcgAPgCGq6aHg3fjQFih4okonQbBGgeJiWdB21sTMPZ9R
         rhSA8i6RUJ7dzOSgXt83KJB95qu00+Km5IalBsCTKaVehqr39s9n3khijmDrccCHW8Cu
         vYkK/M+oxOM6r8/ZvanORZhhe1Qs9UFN66bBGnk0Tr3EMrN7gEluS3S8iC9rJWMry4HE
         XShQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=uMmz8x/x9tEPzAgAqUNyuun2raCKsegryxHBose1YcY=;
        b=E+jslMb4tp1gBVwtd9uiKSA8OTJFrJQO9YVPvzifZYpYsNBKBuz0SiNJ1mY6DRG4z7
         joChQ+auzro85eCL789xz9S5No8XH4OzxdIeZIcugorP55RXRtwgPQPX+IRsIne5A21t
         uqQ4piLlCGJVmvQyo1PguPlhufkrzUJw98CoFqoYZhZksEsOgTOG5SxafRlaiLrS8qvg
         oOC337Z8aq1/hmLw75f6XfSFGzysABBC24yKoHy8YctTz2mxDHnQPkTnMjEmN0kElnlK
         QIA/UtL10oMBUolojWY9QthNzJiU3U6qh1c+j5SdeqbbSMkZbuqg+l1uAbVX2hJAot95
         Oxvg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w66-v6si2047779qkb.343.2018.06.15.08.37.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jun 2018 08:37:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47604 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fTqn9-0005MT-FP
	for alex.bennee@linaro.org; Fri, 15 Jun 2018 11:37:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48746)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1fTqVa-00073E-Qx
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 11:19:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1fTqVX-0002WF-L5
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 11:19:26 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:44014 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1fTqVX-0002UW-DU; Fri, 15 Jun 2018 11:19:23 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4BF9D4057CDF;
	Fri, 15 Jun 2018 15:19:22 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 75C2720283A3;
	Fri, 15 Jun 2018 15:19:20 +0000 (UTC)
Date: Fri, 15 Jun 2018 17:19:18 +0200
From: Andrew Jones <drjones@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20180615151918.f6vnevdv2ayusn3e@kamzik.brq.redhat.com>
References: <1529072910-16156-1-git-send-email-eric.auger@redhat.com>
	<1529072910-16156-5-git-send-email-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1529072910-16156-5-git-send-email-eric.auger@redhat.com>
User-Agent: NeoMutt/20180512
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Fri, 15 Jun 2018 15:19:22 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Fri, 15 Jun 2018 15:19:22 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'drjones@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH v2 04/11] hw/intc/arm_gicv3_kvm: Get prepared
 to handle multiple redist regions
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
X-TUID: q/KRrC6tDLIQ

On Fri, Jun 15, 2018 at 04:28:23PM +0200, Eric Auger wrote:
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
> v1 (virt3.0)-> v2
> - added a comment to explain why the regions are registered in
>   reverse order
> 
> v2 -> v3:
> - In kvm_arm_gicv3_realize rename val into add_ormask local variable and
>   add a comment
> - start the redist region registration  from s->nb_redist_regions - 1
>   downwards
> ---
>  hw/intc/arm_gicv3_kvm.c | 37 ++++++++++++++++++++++++++++++++++---
>  1 file changed, 34 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
> index ed7b719..5cb94fc 100644
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
> @@ -798,9 +811,27 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
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
> +        /* we register regions in reverse order as "devices" are inserted at

Capital w on we would be nicer, but probably not worth respinning for

> +         * the head of a QSLIST and the list is then popped from the head
> +         * onwards by kvm_arm_machine_init_done()
> +         */
> +        for (i = s->nb_redist_regions - 1; i >= 0; i--) {
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

Reviewed-by: Andrew Jones <drjones@redhat.com>
