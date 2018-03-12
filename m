Received: by 10.28.91.67 with SMTP id p64csp672554wmb;
        Mon, 12 Mar 2018 05:00:12 -0700 (PDT)
X-Google-Smtp-Source: AG47ELsLTnpzPBmiaUhgM8z0V5X1DouN4ysI73l5Y9PKeHZJUBudE+aAMgjDJ5lODGNZUzGm2BsG
X-Received: by 10.13.246.129 with SMTP id g123mr4348655ywf.124.1520856012561;
        Mon, 12 Mar 2018 05:00:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1520856012; cv=none;
        d=google.com; s=arc-20160816;
        b=EnLQvNQMKh4I3uOqSJ+vl1mONH/la9b3jhc7idN9i4Ynga116Ki7BCXJhKMFJmb2bO
         TxkTRh3qB/uRFuZiRl6gQj6yynh9R8LwfK32oHgqBLsS92P2/IR0KajsvAs66T4lfBDc
         Ei7aS8rFvTFoEHtuWwEaaEve9/aaFl7WT1Hx32FrKRg1ixZU0QipkLH1Zimw7kZwjcoP
         nsZNoj3CAUT28xPFmLpCiAa346ACaPThLrtCJA1IP4vMBh/B3GrblYZC+8wgISTJb6Nn
         9jAqMwgOTwWXWrxB5ga7bjG+tAdal+ZVRulx+D7vAWcZPTaaMb2kk6J3B5AB3qdP0y+6
         ozDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=nUQBEnrlk55quKCSQGErXisS69+guuAa5OwaDklPBWQ=;
        b=KgZYEYPH+SSCCAJJ4n++LUYSuTsyI1vCkiYGh1KKp6QuRC112cEkMadU2EoS1LCiNN
         4eD6TnHF5nPSYyFnUre7jfi1ejx53YnDqpShEZGeLzgord920wCZQs7DZbchdiGFg0Hk
         XjlVPZHz9BMhMiwa2QkvUc4CQtIscfIrLPjJPKpuj0szvQTTkdsV8H69UzvkCDOgjrHI
         swU6mkg5tJFNUnFAMMrr/JRuN2D8dl1BDhNXaS+sKO74oME5Yem1RtCtU54kX2usOT+1
         lODZZQWXDFViK/Sl0NXJQaEY4L3fQFCgddkPwQJobObQ2QRuy1M4tVk6mhhil35u70pS
         XvUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bFx6AhxA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w129si1245069ywd.258.2018.03.12.05.00.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Mar 2018 05:00:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bFx6AhxA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57987 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1evM7f-0006LI-S8
	for alex.bennee@linaro.org; Mon, 12 Mar 2018 08:00:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58359)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1evM7T-0006JH-99
	for qemu-arm@nongnu.org; Mon, 12 Mar 2018 08:00:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1evM7S-0005fo-7a
	for qemu-arm@nongnu.org; Mon, 12 Mar 2018 07:59:59 -0400
Received: from mail-ot0-x244.google.com ([2607:f8b0:4003:c0f::244]:39601)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1evM7S-0005eb-1s
	for qemu-arm@nongnu.org; Mon, 12 Mar 2018 07:59:58 -0400
Received: by mail-ot0-x244.google.com with SMTP id h8so14959257oti.6
	for <qemu-arm@nongnu.org>; Mon, 12 Mar 2018 04:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nUQBEnrlk55quKCSQGErXisS69+guuAa5OwaDklPBWQ=;
	b=bFx6AhxAYxrRlrxe+FPmzu6caAaGmRMj1g1mLywN1ppY0BSwHaBjJ+018cYqXjLmhn
	tx5DQO/PwT1FDw6EW4WYA/4Hzd2t7KkgrQUoGZ/MKwb7aASUPNhT+bZowDCcf+msDlJp
	rDHQn+TpcEYkczY/QSwiR289knj5ZwAzZxprE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nUQBEnrlk55quKCSQGErXisS69+guuAa5OwaDklPBWQ=;
	b=Crr+g74WWuvoDVBz8f1Mzmx2cPPuKAW4hZipffLFDgxENfXSNtOngcZbBAwaQBtbtK
	KASvkH3GrbRI8c32Px0z8fCTmwrgJOZn2AhKSo8Wz2o0GUnDbfs/wwgjEIfGC8ioHYEp
	nAjTFeLxOu6OLbx9dcQV1EXzLa1to2z7gjsHLh2CDudXkoWN/fVvd0Xt95KW2qfE2Lkn
	JIcd937LHdIb10L2MIYKLsvj+ry6IUVH7fa/aVs+zzJQKze2aIg7iPWz46UmRsOJEtzy
	doSWpZVTPnxXavOcVLGJ1gYR17DN1Bc6Wsq8yOsxKRx8mpoKtN+JgS6yPI8O/gp6qIDi
	prUw==
X-Gm-Message-State: AElRT7FVzq4Wd0EzxZTXYbOgTFzWufRk3dhydzF5AK2WZ0+X9axtIfI9
	GA1vm1iC+fF81+QVd19euJtTcN9ZrFpCUApotmkSvg==
X-Received: by 10.157.69.152 with SMTP id x24mr4951526ote.126.1520855997133;
	Mon, 12 Mar 2018 04:59:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2164:0:0:0:0:0 with HTTP; Mon, 12 Mar 2018 04:59:36
	-0700 (PDT)
In-Reply-To: <1518893216-9983-12-git-send-email-eric.auger@redhat.com>
References: <1518893216-9983-1-git-send-email-eric.auger@redhat.com>
	<1518893216-9983-12-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Mar 2018 11:59:36 +0000
Message-ID: <CAFEAcA_9cmK9gebqE9997fzhTzKT6Ky9q4jn=fxwziopDyK9Ew@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::244
Subject: Re: [Qemu-arm] [PATCH v9 11/14] target/arm/kvm: Translate the MSI
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	Tomasz Nowicki <tn@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Peter Xu <peterx@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>, linuc.decode@gmail.com,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	Prem Mallappa <prem.mallappa@gmail.com>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7Frnv36aHf95

On 17 February 2018 at 18:46, Eric Auger <eric.auger@redhat.com> wrote:
> In case the MSI is translated by an IOMMU we need to fixup the
> MSI route with the translated address.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>
> ---
>
> v5 -> v6:
> - use IOMMUMemoryRegionClass API
>
> It is still unclear to me if we need to register an IOMMUNotifier
> to handle any change in the MSI doorbell which would occur behind
> the scene and would not lead to any call to kvm_arch_fixup_msi_route().

Paolo, do you know the answer to this question ?

> ---
>  target/arm/kvm.c        | 27 +++++++++++++++++++++++++++
>  target/arm/trace-events |  3 +++
>  2 files changed, 30 insertions(+)
>
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 1219d00..9f5976a 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -20,8 +20,13 @@
>  #include "sysemu/kvm.h"
>  #include "kvm_arm.h"
>  #include "cpu.h"
> +#include "trace.h"
>  #include "internals.h"
>  #include "hw/arm/arm.h"
> +#include "hw/pci/pci.h"
> +#include "hw/pci/msi.h"
> +#include "hw/arm/smmu-common.h"
> +#include "hw/arm/smmuv3.h"
>  #include "exec/memattrs.h"
>  #include "exec/address-spaces.h"
>  #include "hw/boards.h"
> @@ -666,6 +671,28 @@ int kvm_arm_vgic_probe(void)
>  int kvm_arch_fixup_msi_route(struct kvm_irq_routing_entry *route,
>                               uint64_t address, uint32_t data, PCIDevice *dev)
>  {
> +    AddressSpace *as = pci_device_iommu_address_space(dev);
> +    IOMMUMemoryRegionClass *imrc;
> +    IOMMUTLBEntry entry;
> +    SMMUDevice *sdev;
> +
> +    if (as == &address_space_memory) {
> +        return 0;
> +    }
> +
> +    /* MSI doorbell address is translated by an IOMMU */
> +    sdev = container_of(as, SMMUDevice, as);
> +    imrc = IOMMU_MEMORY_REGION_GET_CLASS(&sdev->iommu);
> +
> +    entry = imrc->translate(&sdev->iommu, address, IOMMU_WO);
> +
> +    route->u.msi.address_lo = entry.translated_addr;
> +    route->u.msi.address_hi = entry.translated_addr >> 32;
> +
> +    trace_kvm_arm_fixup_msi_route(address, sdev->devfn,
> +                                  sdev->iommu.parent_obj.name,
> +                                  entry.translated_addr);
> +
>      return 0;
>  }

It seems a bit odd that:
 * the code for arm for "PCI devices behind IOMMU need to have
   the MSI doorbell writes go through the IOMMU" looks rather
   different from the code for x86 for the same thing
 * the code here needs to know specifically that this is an SMMU
   and not some other kind of IOMMU

I would have expected this to be more generic-to-all-IOMMU
APIs and maybe even implemented in the generic KVM support code...

The x86 code seems to be similarly x86-specific though, so
this is more of a "perhaps there is a cleanup opportunity here"
observation I guess.

thanks
-- PMM
