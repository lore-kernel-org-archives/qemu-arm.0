Received: by 10.28.91.67 with SMTP id p64csp3774784wmb;
        Tue, 6 Mar 2018 06:08:43 -0800 (PST)
X-Google-Smtp-Source: AG47ELsnKL7I2dZdHLhnaTV3NDLTo3rJowuODRSBzw/l9tux2Oggu60q/0JOZwrlskVwl9FRVcnt
X-Received: by 10.129.125.65 with SMTP id y62mr11509860ywc.190.1520345323665;
        Tue, 06 Mar 2018 06:08:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520345323; cv=none;
        d=google.com; s=arc-20160816;
        b=I+uE4AWWwv03aeUV+3B6E56F9wPcGcWPdQngaPGGXsIbNPmbrBvn3Kkg97K3a+UDZ1
         szhMRY+1djNy9LeuNiRv/Fdi/zA5fXkhJQiFx+Bc/DXSNd4EERYCUGwDKZdnSl94Koeg
         YXHQlzuFnWnEg/L10gRbdU9nPNE8CVYKOvpn8gu9vVrIjclF4wFUXmgYFfzCA9zJk/ph
         cOLJPV7NqDQOifH/FM58WWTX3mmi+OueL79H12VjguBaySpPwmh1ws3Tj7nHGLr0u1iz
         KHj/14ubvTIJjlxhWhaL95V06lN9g/kKb5ND597UoGBjtNvqdHw9juXSqnrFU/J+QRGb
         L9Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=anyzf6t2lLOmaccnW1PXctBZw79AejjqiK2FwefrJzM=;
        b=is7ECeGN/z12TNKLgNDAZXgxFd90uP/LpGgXcfXe5NHqYWlQS6NKMbu+MYaf6c63fS
         i6+N0r4CEBSN31atUxS2U+lxje6ppF0F7J5NGmHrcbSQSC93m5HITxc3REwGlQAKU/+O
         uzyLxXnIlqXfVOtxmlIPRgubqBk3uruWpCvAJlhuWiCy7pVjD0zOp0bdkkarMkaqghYj
         3tKFf71BrFLQAcbQLVlmEW6gRxbmGWTwMXIJ1DoMYT4GB4M35a+MYQ5fMm9sg9OKcu85
         zGdIaqKeaeFKb7u9D0pvEJKRTMjPigLnRQxEnRD902nq+1DWJ/iijLwhBagQKSTyWEgE
         3+3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TiBmvCi6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u84-v6si1661217yba.445.2018.03.06.06.08.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Mar 2018 06:08:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TiBmvCi6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56060 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1etDGl-0004eo-17
	for alex.bennee@linaro.org; Tue, 06 Mar 2018 09:08:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59344)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1etDGY-0004dC-L7
	for qemu-arm@nongnu.org; Tue, 06 Mar 2018 09:08:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1etDGX-00076s-Cq
	for qemu-arm@nongnu.org; Tue, 06 Mar 2018 09:08:30 -0500
Received: from mail-ot0-x244.google.com ([2607:f8b0:4003:c0f::244]:43656)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1etDGX-00076V-6p
	for qemu-arm@nongnu.org; Tue, 06 Mar 2018 09:08:29 -0500
Received: by mail-ot0-x244.google.com with SMTP id m22so18397158otf.10
	for <qemu-arm@nongnu.org>; Tue, 06 Mar 2018 06:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=anyzf6t2lLOmaccnW1PXctBZw79AejjqiK2FwefrJzM=;
	b=TiBmvCi6v6thc5kTfVUQst6uuSbnYFbTbcCASrb5fDMJqnujx7gUWWjRgpYoKLgD1x
	9yqXwYwgDkANlG7GEBkmuFkF0zAoRY2T6e6Q5zbIwURigBRUb7yV2P0MnAWcPpyQx+G1
	L7UbnfCgC3Faaaaq435PL2B62Ahh2wbFp04OI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=anyzf6t2lLOmaccnW1PXctBZw79AejjqiK2FwefrJzM=;
	b=q9udVYV5UWXkNa76a0MN19+guX5pcLcd9JhfJIQmVTv5ZQwJmqGtW+qC/t6PLj/FAh
	/6kECSo0l2eiRyZYblWMgitL754R63UTLTabCAVCUfbFu9bm2YNGwpcnhuxyKJms6xt1
	xn8j9AmmJH+atDAvx/qmS95dQI0K3VraRHkM7d+q5MT2pOKzc17954Qz7JUnMkBzpUba
	vYxf38E4AVvZv5/PfCj320qK1oRIPgmQzy5dKhm5uAqq5wo+SB/yltcV95uouQ8LOBOg
	dtz1vsmScD+2Dn6GGafqE4kKJTgmhwOyijevPFP+gO3aMOwBIv6MQl9SeVkbqb90nBuW
	l/ZQ==
X-Gm-Message-State: AElRT7FycSXjGlG4hr2ABtc+gTnb4BsNmPswr1x6cde86EQSYEoVOgMr
	m5UfG3JLce+BNeqacB+ZrGx5HLe9NxJZy/DbajEkKw==
X-Received: by 10.157.23.34 with SMTP id i34mr13931311ota.210.1520345308387;
	Tue, 06 Mar 2018 06:08:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Tue, 6 Mar 2018 06:08:07 -0800 (PST)
In-Reply-To: <1518893216-9983-3-git-send-email-eric.auger@redhat.com>
References: <1518893216-9983-1-git-send-email-eric.auger@redhat.com>
	<1518893216-9983-3-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Mar 2018 14:08:07 +0000
Message-ID: <CAFEAcA-uMZwR8HfVDx0Rau9G2unMypWJEL0o3ACPHxCqZ+g=_Q@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::244
Subject: Re: [Qemu-arm] [PATCH v9 02/14] hw/arm/smmu-common: IOMMU memory
 region and address space setup
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
	linuc.decode@gmail.com, Bharat Bhushan <bharat.bhushan@nxp.com>,
	Prem Mallappa <prem.mallappa@gmail.com>, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lN626Ei51daK

On 17 February 2018 at 18:46, Eric Auger <eric.auger@redhat.com> wrote:
> We enumerate all the PCI devices attached to the SMMU and
> initialize an associated IOMMU memory region and address space.
> This happens on SMMU base instance init.
>
> Those info are stored in SMMUDevice objects. The devices are
> grouped according to the PCIBus they belong to. A hash table
> indexed by the PCIBus poinet is used. Also an array indexed by

"pointer".

> the bus number allows to find the list of SMMUDevices.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>
> ---
> v8 -> v9:
> - fix key value for lookup
>
> v7 -> v8:
> - introduce SMMU_MAX_VA_BITS
> - use PCI bus handle as a key
> - do not clear s->smmu_as_by_bus_num
> - use g_new0 instead of g_malloc0
> - use primary_bus field
> ---
>  hw/arm/smmu-common.c         | 59 ++++++++++++++++++++++++++++++++++++++++++++
>  include/hw/arm/smmu-common.h |  6 +++++
>  2 files changed, 65 insertions(+)
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 86a5aab..d0516dc 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -28,12 +28,71 @@
>  #include "qemu/error-report.h"
>  #include "hw/arm/smmu-common.h"
>
> +SMMUPciBus *smmu_find_as_from_bus_num(SMMUState *s, uint8_t bus_num)
> +{
> +    SMMUPciBus *smmu_pci_bus = s->smmu_as_by_bus_num[bus_num];

Variable name suggests this is a table of AddressSpaces indexed by
bus number, but the code says we're getting SMMUPCIBus objects from it?

> +
> +    if (!smmu_pci_bus) {
> +        GHashTableIter iter;
> +
> +        g_hash_table_iter_init(&iter, s->smmu_as_by_busptr);
> +        while (g_hash_table_iter_next(&iter, NULL, (void **)&smmu_pci_bus)) {
> +            if (pci_bus_num(smmu_pci_bus->bus) == bus_num) {
> +                s->smmu_as_by_bus_num[bus_num] = smmu_pci_bus;
> +                return smmu_pci_bus;
> +            }
> +        }

Why do we populate this hashtable lazily rather than when we
put the SMMUPciBus in the smmu_as_by_busptr table? Do we
expect this function not to ordinarily be called?

> +    }
> +    return smmu_pci_bus;
> +}
> +
> +static AddressSpace *smmu_find_add_as(PCIBus *bus, void *opaque, int devfn)
> +{
> +    SMMUState *s = opaque;
> +    SMMUPciBus *sbus = g_hash_table_lookup(s->smmu_as_by_busptr, bus);
> +    SMMUDevice *sdev;
> +
> +    if (!sbus) {
> +        sbus = g_malloc0(sizeof(SMMUPciBus) +
> +                         sizeof(SMMUDevice *) * SMMU_PCI_DEVFN_MAX);
> +        sbus->bus = bus;
> +        g_hash_table_insert(s->smmu_as_by_busptr, bus, sbus);
> +    }
> +
> +    sdev = sbus->pbdev[devfn];
> +    if (!sdev) {
> +        char *name = g_strdup_printf("%s-%d-%d",
> +                                     s->mrtypename,
> +                                     pci_bus_num(bus), devfn);
> +        sdev = sbus->pbdev[devfn] = g_new0(SMMUDevice, 1);
> +
> +        sdev->smmu = s;
> +        sdev->bus = bus;
> +        sdev->devfn = devfn;
> +
> +        memory_region_init_iommu(&sdev->iommu, sizeof(sdev->iommu),
> +                                 s->mrtypename,
> +                                 OBJECT(s), name, 1ULL << SMMU_MAX_VA_BITS);
> +        address_space_init(&sdev->as,
> +                           MEMORY_REGION(&sdev->iommu), name);

This leaks the memory pointed to by name, doesn't it?
(address_space_init() takes a copy of the name string, so you want
to g_free(name) here.)

> +    }
> +
> +    return &sdev->as;
> +}
> +
>  static void smmu_base_realize(DeviceState *dev, Error **errp)
>  {
>      SMMUState *s = ARM_SMMU(dev);
>
>      s->configs = g_hash_table_new_full(NULL, NULL, NULL, g_free);
>      s->iotlb = g_hash_table_new_full(NULL, NULL, NULL, g_free);
> +    s->smmu_as_by_busptr = g_hash_table_new(NULL, NULL);
> +
> +    if (s->primary_bus) {
> +        pci_setup_iommu(s->primary_bus, smmu_find_add_as, s);
> +    } else {
> +        error_setg(errp, "SMMU is not attached to any PCI bus!");
> +    }
>  }
>
>  static void smmu_base_reset(DeviceState *dev)
> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> index 8a9d931..aee96c2 100644
> --- a/include/hw/arm/smmu-common.h
> +++ b/include/hw/arm/smmu-common.h
> @@ -121,4 +121,10 @@ typedef struct {
>  #define ARM_SMMU_GET_CLASS(obj)                              \
>      OBJECT_GET_CLASS(SMMUBaseClass, (obj), TYPE_ARM_SMMU)
>
> +SMMUPciBus *smmu_find_as_from_bus_num(SMMUState *s, uint8_t bus_num);
> +
> +static inline uint16_t smmu_get_sid(SMMUDevice *sdev)
> +{
> +    return  ((pci_bus_num(sdev->bus) & 0xff) << 8) | sdev->devfn;
> +}

Can we have at least brief documentation comments for any
new functions or prototypes added to header files, please?

>  #endif  /* HW_ARM_SMMU_COMMON */
> --

thanks
-- PMM
