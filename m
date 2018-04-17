Received: by 10.28.4.212 with SMTP id 203csp3677037wme;
        Tue, 17 Apr 2018 04:03:31 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4+HI7Xt291w8hGwURxiafk2GA9kTiLMK/j16LeS0VfE/vAaUyFsM1vDnBWSJg951D2ndCNN
X-Received: by 2002:a25:b446:: with SMTP id c6-v6mr796498ybg.289.1523963011100;
        Tue, 17 Apr 2018 04:03:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523963011; cv=none;
        d=google.com; s=arc-20160816;
        b=iq0BigZ2tA6cKRHJV0C4y3Sqej6UGE+dVwkuyIpcJAWLQU81Zsm673tasFAEhKa6dw
         FXWEE9N6p5xo9nSgd2XdhsLEkdgRJ6c6HvWJBrBBDwy3JnnE1EbaEiT4/VB+Jkg90zGN
         iB0SSnPkgHqj31YNvOjgV7h9SglO7+XiPzRseqHlteZIs/O3R2pLU9tJ+xxZt7Xh6OOf
         yPg7ACe6XqBeKXvKhAuLGziwLMb5kZauvb2iRzUA9cuXu2LLJjdf3M73BFZuwxduzTHo
         L/kALWNAEsnXMCI+ksQmKqI3n70h5IErkBDOmHuFfjvVxjS8yUI0zI25ibmGTISIODfV
         9WwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=uOQyhWw5I4SdgRieYm+XfoGcHDX505Vb/I0K0CbBFMI=;
        b=lhPV2P5wf8S/2+8+laTgPHtS7JsZnuGvxnfIpYovWtl2EYvY40LIpzvSRlnHGVa5+G
         JaddgrXL/P06JEr1dX+/VxPln1YgtgPJsru+tZnxekcE5lEBtwCOcsvPNhnvyAGLhre3
         G9JL2j2vLnerpDjogGQdl4K39Cawpzkv82BNjv/N0RufnJXHV6c1gt0t3g9SYEHU+cmQ
         e7DErCf+heu3vUrXFBQj+13Ar4JNIH0pdKhugEIBWFBX3cm/qv6uYfh01IfJa0upjzPw
         KrcIYYNmTUP7LOMf7Pr09b+zRRmkz43EamEgHt/OG52UqmjjDx2LPCV5YI/opNXNGAxt
         fDDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LsIaGrAO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v92si7925232qte.373.2018.04.17.04.03.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Apr 2018 04:03:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LsIaGrAO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59407 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f8OOY-0001Yr-Ka
	for alex.bennee@linaro.org; Tue, 17 Apr 2018 07:03:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56973)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f8OOL-0001Xq-VH
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 07:03:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f8OOH-0003V0-Mm
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 07:03:18 -0400
Received: from mail-ot0-x244.google.com ([2607:f8b0:4003:c0f::244]:35113)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f8OOH-0003UX-Hm
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 07:03:13 -0400
Received: by mail-ot0-x244.google.com with SMTP id f47-v6so20890873oth.2
	for <qemu-arm@nongnu.org>; Tue, 17 Apr 2018 04:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uOQyhWw5I4SdgRieYm+XfoGcHDX505Vb/I0K0CbBFMI=;
	b=LsIaGrAO3X+WhyHHOJiedAN7H4Hi+ET2w7Nh1xwsreOAFsjd75sP+1fDTHeZ9i0JWu
	cwHeL9tq1jCCDfjLVZAa1lrIqjqyguD+oKqNFnH27SdVAV5Z0k/o3uqOeI4TXaoTzxi4
	hU2BS0YLKJR3/LqcTZ6x/OSwSjz/DEJLEalRI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uOQyhWw5I4SdgRieYm+XfoGcHDX505Vb/I0K0CbBFMI=;
	b=gR7aBtACH8OP+IFzyBzrfXViIC7GAJm0OUsPPeRkluooc3d4j0BuqGeGs6La1kRCsF
	swp2HnKRniv7erjGnkSWzq1bZQwy22nsUaZWB7W/8Z4rBvd2c8DqUnHEGzXAri7DSTql
	6V+iyyumQUrijMYuThb7V+i23LkkIHCItr3WkasQ8vV1K18Bj88erlmsi2Rk9Jv6UOix
	avS4Sf2zph9T5Fhv4zqq9fP/aD6rb0q1rG0P3DOA/y8K7Om5G+K9BHkkHWZQv7n4udQ1
	AuU4Ij7rU2gu5UgyNENziTlT6rjl6w+H3s8ic62bNvfxHGRjg/oJf4cZ/CEHLW7F0J/G
	gMGg==
X-Gm-Message-State: ALQs6tBFVC9q7JvmURkV2ShhsLGV824zMEULCwSl0U9EHbbkIqkzERGt
	z10EnaxYuU8UDzEeVpAMCZBq8Ga8otBJAOLEgvZU5A==
X-Received: by 2002:a9d:5cc1:: with SMTP id r1-v6mr837726oti.258.1523962992614;
	Tue, 17 Apr 2018 04:03:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Tue, 17 Apr 2018 04:02:52
	-0700 (PDT)
In-Reply-To: <1523518688-26674-12-git-send-email-eric.auger@redhat.com>
References: <1523518688-26674-1-git-send-email-eric.auger@redhat.com>
	<1523518688-26674-12-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Apr 2018 12:02:52 +0100
Message-ID: <CAFEAcA_hgGFmUmg2S7bb5nYeEh1z0kBNWrSud0_TMbkUcf7uxg@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::244
Subject: Re: [Qemu-arm] [PATCH v11 11/17] target/arm/kvm: Translate the MSI
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
Cc: Christoffer Dall <cdall@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	Tomasz Nowicki <tn@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Peter Xu <peterx@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, linuc.decode@gmail.com,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	Jintack Lim <jintack@cs.columbia.edu>,
	Prem Mallappa <prem.mallappa@gmail.com>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: abMC3K0F3Rxq

On 12 April 2018 at 08:38, Eric Auger <eric.auger@redhat.com> wrote:
> In case the MSI is translated by an IOMMU we need to fixup the
> MSI route with the translated address.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Bharat Bhushan <Bharat.Bhushan@nxp.com>
>
> ---
> v9 -> v10:
> - use address_space_translate
>
> v5 -> v6:
> - use IOMMUMemoryRegionClass API
> ---
>  target/arm/kvm.c        | 27 +++++++++++++++++++++++++++
>  target/arm/trace-events |  3 +++
>  2 files changed, 30 insertions(+)
>
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index ecc39ac..c6f6aa8 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -20,8 +20,10 @@
>  #include "sysemu/kvm.h"
>  #include "kvm_arm.h"
>  #include "cpu.h"
> +#include "trace.h"
>  #include "internals.h"
>  #include "hw/arm/arm.h"
> +#include "hw/pci/pci.h"
>  #include "exec/memattrs.h"
>  #include "exec/address-spaces.h"
>  #include "hw/boards.h"
> @@ -649,6 +651,31 @@ int kvm_arm_vgic_probe(void)
>  int kvm_arch_fixup_msi_route(struct kvm_irq_routing_entry *route,
>                               uint64_t address, uint32_t data, PCIDevice *dev)
>  {
> +    AddressSpace *as = pci_device_iommu_address_space(dev);
> +    hwaddr xlat, len, doorbell_gpa;
> +    MemoryRegionSection mrs;
> +    MemoryRegion *mr;
> +
> +    if (as == &address_space_memory) {
> +        return 0;
> +    }
> +
> +    /* MSI doorbell address is translated by an IOMMU */
> +
> +    rcu_read_lock();
> +    mr = address_space_translate(as, address, &xlat, &len, true);
> +    if (!mr) {
> +        return 1;

This early-return code path fails to release the rcu_read_lock.

> +    }
> +    mrs = memory_region_find(mr, xlat, 0);

Is it really valid to pass a size of 0 to memory_region_find() ?
We should probably use however big the doorbell write is.

Do we need to do something here to handle the case where
memory_region_find() doesn't find a a region, or does that
just work automatically?

> +    doorbell_gpa = mrs.offset_within_address_space;
> +    rcu_read_unlock();
> +
> +    route->u.msi.address_lo = doorbell_gpa;
> +    route->u.msi.address_hi = doorbell_gpa >> 32;
> +
> +    trace_kvm_arm_fixup_msi_route(address, doorbell_gpa);
> +
>      return 0;
>  }
>
> diff --git a/target/arm/trace-events b/target/arm/trace-events
> index 9e37131..6b759f9 100644
> --- a/target/arm/trace-events
> +++ b/target/arm/trace-events
> @@ -8,3 +8,6 @@ arm_gt_tval_write(int timer, uint64_t value) "gt_tval_write: timer %d value 0x%"
>  arm_gt_ctl_write(int timer, uint64_t value) "gt_ctl_write: timer %d value 0x%" PRIx64
>  arm_gt_imask_toggle(int timer, int irqstate) "gt_ctl_write: timer %d IMASK toggle, new irqstate %d"
>  arm_gt_cntvoff_write(uint64_t value) "gt_cntvoff_write: value 0x%" PRIx64
> +
> +# target/arm/kvm.c
> +kvm_arm_fixup_msi_route(uint64_t iova, uint64_t gpa) "MSI iova = 0x%"PRIx64" is translated into 0x%"PRIx64
> --
> 2.5.5

thanks
-- PMM
