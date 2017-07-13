Received: by 10.25.44.15 with SMTP id s15csp2375725lfs;
        Thu, 13 Jul 2017 09:19:33 -0700 (PDT)
X-Received: by 10.55.39.5 with SMTP id n5mr2891227qkn.60.1499962773857;
        Thu, 13 Jul 2017 09:19:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499962773; cv=none;
        d=google.com; s=arc-20160816;
        b=tWwd+i0vrq48YK1LISkdO03yffAxTmVUluXTC4vhK+lwu8oEoVpnDypfPacKlBs0AB
         ubugDhyyDtilWtaoj336waQup1yeOH070W6ZJUnJkBoG4zz/Rp/jC+X7OV/cnoXNuhA0
         9NmwylePj6P2uRCsTKy6HqKX6I9iQs0IzsQdMyi7MlcDOEjqedhKs9VLZ3sfDx6lXTi7
         d4vTRTNoE8pWz6LD6cchJgntUvXc2V03F+UusXVtO6tQHiwvwxMQexc7afV8Z73D/qwK
         GP2Pf9mxfSLdNKsi6J5jOrFRs+NWbXKF+rPAkafqDGXwbcShbqD0Zw19jp+tD7KRxKuP
         cyjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-filter:dmarc-filter:arc-authentication-results;
        bh=TfbuAK8f1PZ7W1doGPd3JRGxn3z6lIb45Q7wh0nmCNI=;
        b=W5PegD3JSlitNCiRKkEWrF2YUwaUevHq6Z2KXriKH+QKwReDPt9EQMmh8DcQFGICd3
         XHIX7lzqTmnWVE4tb1+LLO0q3PCvH4RHs0MmD5WDLiN9bdeBiKSx+21gGXH47ihhzZMy
         u89YmoHM+JMsZQRn8Okhw82n6WUM9Hf1Fzte11ji6SwGlKI0mFKiKQuqWoMB5JDE/yQC
         LLw7Bg6gaGkLN+O0mRSim+bONzQ8lnB0WKXO/1JYHdcnqXPXyS7/86UQ7TjvVBOffmQk
         IOtYaSV/kaXPjOX26GBG3ZY87o/UJ+uHFCJlDi8ZnNr78EkAA18I3joc5xaRKZEZUbyV
         gBWg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id 19si5659115qkk.176.2017.07.13.09.19.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Jul 2017 09:19:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:32841 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dVgpv-00047x-2F
	for alex.bennee@linaro.org; Thu, 13 Jul 2017 12:19:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34077)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1dVghX-0002jL-3a
	for qemu-arm@nongnu.org; Thu, 13 Jul 2017 12:10:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1dVghS-00016Z-B6
	for qemu-arm@nongnu.org; Thu, 13 Jul 2017 12:10:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56656)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1dVghS-00016D-39; Thu, 13 Jul 2017 12:10:46 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C2CA5267C0;
	Thu, 13 Jul 2017 16:10:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com C2CA5267C0
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=mst@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com C2CA5267C0
Received: from redhat.com (ovpn-121-70.rdu2.redhat.com [10.10.121.70])
	by smtp.corp.redhat.com (Postfix) with SMTP id 2557567CD2;
	Thu, 13 Jul 2017 16:10:39 +0000 (UTC)
Date: Thu, 13 Jul 2017 19:10:38 +0300
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bharat Bhushan <Bharat.Bhushan@nxp.com>
Message-ID: <20170713190931-mutt-send-email-mst@kernel.org>
References: <1499927922-32303-1-git-send-email-Bharat.Bhushan@nxp.com>
	<1499927922-32303-2-git-send-email-Bharat.Bhushan@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1499927922-32303-2-git-send-email-Bharat.Bhushan@nxp.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 13 Jul 2017 16:10:45 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [RFC PATCH 1/2] target/arm/kvm: Translate the MSI
 doorbell in kvm_arch_fixup_msi_route
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
Cc: peter.maydell@linaro.org, kevin.tian@intel.com, drjones@redhat.com,
	marc.zyngier@arm.com, tn@semihalf.com, will.deacon@arm.com,
	qemu-devel@nongnu.org, eric.auger@redhat.com,
	alex.williamson@redhat.com, qemu-arm@nongnu.org,
	robin.murphy@arm.com, christoffer.dall@linaro.org, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LQucCcfjJ75u

On Thu, Jul 13, 2017 at 12:08:41PM +0530, Bharat Bhushan wrote:
> Fix-up MSI address if it translate via virtual iommu.
> This code is based on http://patchwork.ozlabs.org/patch/785951/
> 
> Signed-off-by: Bharat Bhushan <Bharat.Bhushan@nxp.com>

Links go dead with time. And following links
is hard on reviewers. Please copy the full description
tweaking as appropriate and attribute in commit log.

> ---
>  target/arm/kvm.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 4555468..eff7e8f 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -22,6 +22,9 @@
>  #include "cpu.h"
>  #include "internals.h"
>  #include "hw/arm/arm.h"
> +#include "hw/pci/pci.h"
> +#include "hw/pci/msi.h"
> +#include "hw/virtio/virtio-iommu.h"
>  #include "exec/memattrs.h"
>  #include "exec/address-spaces.h"
>  #include "hw/boards.h"
> @@ -611,6 +614,24 @@ int kvm_arm_vgic_probe(void)
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
>      return 0;
>  }
>  
> -- 
> 1.9.3
