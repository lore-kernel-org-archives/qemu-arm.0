Received: by 10.223.183.22 with SMTP id l22csp2312442wre;
        Thu, 17 Aug 2017 08:33:38 -0700 (PDT)
X-Received: by 10.237.63.131 with SMTP id s3mr7792225qth.90.1502984018528;
        Thu, 17 Aug 2017 08:33:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502984018; cv=none;
        d=google.com; s=arc-20160816;
        b=LeDoEJjSzhz81zNtOO6TMPScujA0pW1sPg5iXqOesbKTkfL849kAgAptaa/0jo0h+R
         vptRyAaVEesGcrdvZl537WvFjj6BiV0+EGbAijdWXr6fEbVcKQnuBwaGaXOO2OicMdOn
         TUW9cYle2cO2AEChmD96F8A/Kmq9OvvhL1Nbm9+x8mFxIk33FhLhyuWlIbix5EVcSbjf
         qwFyMzkwOAUTwErWvdKvdpCFaNUrIzVSwKIuJw5tTe4FdV5SyjuzJ74PDTDaYc8//XY9
         TsggCa97GGQnGxQkzmc/WcFK6Jvc6J83EknLDQDDl+WnlUvBwOJtjXpGjRLnksik25cj
         +nKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dmarc-filter
         :arc-authentication-results;
        bh=pi6lQ0mwCYzsSF78be5YPg4V0xioVt1J/GO43ts6v2g=;
        b=zpS+LzuzTZXDsoHUlPqd0S29ZLh9WCJG7Lss9sK7vjjLZ8g2uKPoMwCW9IH7Ww7WC+
         CEdkWsiFi3lKnLtwx7DgZMHLxfHSWu7g0fX7L1FJy5Kp/gcBtZiohoztmkA8Z2UJcFKM
         GrxR48eZE4dEgP6rHrNeyClmVW6ltVOyl4yEKwo7tgSah3dw5T3ey2ySMQp3AgOZxeP6
         lNW6jXV6qtKvnSC1zbztHjm9QaJUiiaeIGqQexNrlGUWG0GOcdEcb9Ywn7VRwTSqnlyh
         8rxqd1i+bfrlqlS8X5UiAgiFp6zKvVy3XPVV0GAS1Sp0Hi0wheZUYvPwIwYMh40zEv5p
         5GDA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s2si3150187qkd.346.2017.08.17.08.33.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Aug 2017 08:33:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59053 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1diMnf-0004um-HK
	for alex.bennee@linaro.org; Thu, 17 Aug 2017 11:33:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56195)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1diMnZ-0004tz-OE
	for qemu-arm@nongnu.org; Thu, 17 Aug 2017 11:33:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1diMnW-0001SJ-KM
	for qemu-arm@nongnu.org; Thu, 17 Aug 2017 11:33:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54256)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1diMnW-0001QM-Bq; Thu, 17 Aug 2017 11:33:26 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 63F6D13AAD;
	Thu, 17 Aug 2017 15:33:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 63F6D13AAD
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain (ovpn-116-50.ams2.redhat.com
	[10.36.116.50])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 81B055D9CC;
	Thu, 17 Aug 2017 15:33:12 +0000 (UTC)
To: Bharat Bhushan <Bharat.Bhushan@nxp.com>, eric.auger.pro@gmail.com,
	peter.maydell@linaro.org, alex.williamson@redhat.com, mst@redhat.com,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <1500017104-3574-1-git-send-email-Bharat.Bhushan@nxp.com>
	<1500017104-3574-2-git-send-email-Bharat.Bhushan@nxp.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <c5f6a0f8-0f7c-aff8-1411-ae83b8ff83e6@redhat.com>
Date: Thu, 17 Aug 2017 17:33:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1500017104-3574-2-git-send-email-Bharat.Bhushan@nxp.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 17 Aug 2017 15:33:22 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v2 PATCH 1/2] target/arm/kvm:
 Translate the MSI doorbell in kvm_arch_fixup_msi_route
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
Cc: kevin.tian@intel.com, marc.zyngier@arm.com, tn@semihalf.com,
	will.deacon@arm.com, drjones@redhat.com, robin.murphy@arm.com,
	christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +IBtlca7WlET

Hi Bharat,
On 14/07/2017 09:25, Bharat Bhushan wrote:
> Translate msi address if device is behind virtio-iommu.
> This logic is similar to vSMMUv3/Intel iommu emulation.
Why Intel?
> 
> This RFC patch does not handle the case where both vsmmuv3 and
> virtio-iommu are available.
I think this should be hidden by the creation of a base vIOMMU object as
initiated by Peter in: "[Qemu-devel] [RFC PATCH 0/8] IOMMU: introduce
common IOMMUObject". I will try to rebase the virtio-iommu and vsmmuv3
series on this idea.

Thanks

Eric
> 
> Signed-off-by: Bharat Bhushan <Bharat.Bhushan@nxp.com>
> ---
> v1-v2:
>   - Added trace events
>   - removed vSMMU3 link in patch description
> 
>  target/arm/kvm.c        | 25 +++++++++++++++++++++++++
>  target/arm/trace-events |  3 +++
>  2 files changed, 28 insertions(+)
> 
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 4555468..5a28956 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -21,7 +21,11 @@
>  #include "kvm_arm.h"
>  #include "cpu.h"
>  #include "internals.h"
> +#include "trace.h"
>  #include "hw/arm/arm.h"
> +#include "hw/pci/pci.h"
> +#include "hw/pci/msi.h"
> +#include "hw/virtio/virtio-iommu.h"
>  #include "exec/memattrs.h"
>  #include "exec/address-spaces.h"
>  #include "hw/boards.h"
> @@ -611,6 +615,27 @@ int kvm_arm_vgic_probe(void)
>  int kvm_arch_fixup_msi_route(struct kvm_irq_routing_entry *route,
>                               uint64_t address, uint32_t data, PCIDevice *dev)
>  {
> +    AddressSpace *as = pci_device_iommu_address_space(dev);
> +    IOMMUTLBEntry entry;
> +    IOMMUDevice *sdev;
> +    VirtIOIOMMU *s;
> +
> +    if (as == &address_space_memory) {
> +        return 0;
> +    }
> +
> +    /* MSI doorbell address is translated by an IOMMU */
> +    sdev = container_of(as, IOMMUDevice, as);
> +    s = sdev->viommu;
> +
> +    entry = s->iommu_ops.translate(&sdev->iommu_mr, address, IOMMU_WO);
> +
> +    route->u.msi.address_lo = entry.translated_addr;
> +    route->u.msi.address_hi = entry.translated_addr >> 32;
> +
> +    trace_kvm_arm_fixup_msi_route(address, sdev->devfn, sdev->iommu_mr.name,
> +                                  entry.translated_addr);
> +
>      return 0;
>  }
>  
> diff --git a/target/arm/trace-events b/target/arm/trace-events
> index e21c84f..eff2822 100644
> --- a/target/arm/trace-events
> +++ b/target/arm/trace-events
> @@ -8,3 +8,6 @@ arm_gt_tval_write(int timer, uint64_t value) "gt_tval_write: timer %d value %" P
>  arm_gt_ctl_write(int timer, uint64_t value) "gt_ctl_write: timer %d value %" PRIx64
>  arm_gt_imask_toggle(int timer, int irqstate) "gt_ctl_write: timer %d IMASK toggle, new irqstate %d"
>  arm_gt_cntvoff_write(uint64_t value) "gt_cntvoff_write: value %" PRIx64
> +
> +# target/arm/kvm.c
> +kvm_arm_fixup_msi_route(uint64_t iova, uint32_t devid, const char *name, uint64_t gpa) "MSI addr = 0x%"PRIx64" is translated for devfn=%d through %s into 0x%"PRIx64
> 
