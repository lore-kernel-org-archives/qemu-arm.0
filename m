Received: by 10.223.197.9 with SMTP id q9csp2520976wrf;
        Mon, 9 Oct 2017 07:40:18 -0700 (PDT)
X-Received: by 10.55.18.28 with SMTP id c28mr9807215qkh.297.1507560018486;
        Mon, 09 Oct 2017 07:40:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507560018; cv=none;
        d=google.com; s=arc-20160816;
        b=ISPoI5bpn1gD1yxEpb4q9eRdncHbBSMQPwPLHKXPCFYVv/UCd5bwbSGENWHBbWxqFz
         PQUrI5y8YsFjLQ1RJ4FOoXbVgtmsWaQagZq9oFrg/QYBpkvlCpSNkpdHbLBibEHP5+J0
         jFVa2YtCXqJa8V2CYl4fiprSKksgGypdd9fiQr3Jy+khUeHeXQZl6Eg7J77zHCFFAQDO
         g/1Mp3GsUB3Vwh0lkDTaW0aAyxOg2t5TGAW2psMcu6zSvFQ36kw3tOfXSYJMARFYTngM
         J0gYeVEcJm1pLZ/Wdgq6FgLoCu7YPmo4HI2fuaiJ3cgrGwJJDo584mexp4qideXAKK6D
         b7Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=zFvSie2lfV1/3sTNXOT4fLhannVBVtqUmoWRfQJg4rM=;
        b=zXoYeupHY67eijyR8VlZzjgTBkJlby1veX6JZEdMBbweucGWWU8AuRU8EFd3H9B1dD
         l9f5WXVGqSFrBpAVce2u0T6XgeAMdO3c0zUnQV3w/Wyq8kD3WpwWVnMtDq9SCA6uag9i
         DvjLA7d2XQrFAOqkXDzR7xXS0OUfx32HVLKwDwKyUeWTomxIV2PWOQT7+pIyTjQ+x9/z
         K8VK7vgE3eJ+tLFI7h4wufTNTQRCGkyrVSWvUakUOFbtNHWnSYwWoCIPPtwUbylSyiqW
         pFeYP4VI6mYe9pzVAIeL6+hQ7vpXi1kdrIwVU8/yhLGG5/uZltFQAw9S1X7GfHbZuMVc
         Irjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=M7DHChoW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p66si6415559qka.85.2017.10.09.07.40.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Oct 2017 07:40:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=M7DHChoW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58221 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e1ZEA-00056m-0S
	for alex.bennee@linaro.org; Mon, 09 Oct 2017 10:40:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59601)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e1ZDv-00051H-Sa
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 10:40:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e1ZDu-0006do-IJ
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 10:40:03 -0400
Received: from mail-wm0-x22c.google.com ([2a00:1450:400c:c09::22c]:51302)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e1ZDu-0006d3-7W
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 10:40:02 -0400
Received: by mail-wm0-x22c.google.com with SMTP id f4so24148854wme.0
	for <qemu-arm@nongnu.org>; Mon, 09 Oct 2017 07:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zFvSie2lfV1/3sTNXOT4fLhannVBVtqUmoWRfQJg4rM=;
	b=M7DHChoWRnLfCnBgl/HbeO5nbQaezvzXj3nI90FBDioZBQMzREl+IieOSw1FiKbcCa
	C3dYqZ0fhP6haxqLPj+Kl8iZnKGhOEAAzFTT8Sy8ZQ1ty0EFXDTdaWqf9U9wTm28kms/
	0qpI03riBhK1Wea7kjYFkZE5yB82aQ2hUglw4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zFvSie2lfV1/3sTNXOT4fLhannVBVtqUmoWRfQJg4rM=;
	b=bmkDeTqaTRyXfrPe4Yph0EJd1YLDywkYwOkGsNcQYAllWghXE7he5t0hkPw7o6pyYs
	+wRi20nBtTi6C1bWdydamnkHXThNtLRLed1Z6HsN1Eib/Na/UYwJG2utFm+yIO9/b4c1
	KPq0tdqdbJC7qXOZBTtzzba2smjlBCbvT6B08Sn6xaqryTtcn7sOKdrXcNNZW3umrVN9
	Gb4Xw34V+thbY6QgSqTvuyw8Tv9/TOFLqCIGFzjEtbSYBFEfCQI1P0CgePNv1mx+y6tW
	/nvfX3iFQKZds5MMhFWcekJKfEaODsRZ0PvA5S6AaHDQjs/U2JPS1J9pElDjCj86VTtA
	HOpw==
X-Gm-Message-State: AMCzsaV8sy0e/oV8jy5wR4rFz/Zkrt/HSLXdpfAGgj1ySkNDwX2kw1kU
	j8dBmn2qmsE3RnzkXZIYYIj03YIZ0pLuMMPtu6Q7kQ==
X-Google-Smtp-Source: AOwi7QASMZPhaVKKOBjdN7xS8dg5wYzWe0/xus76+WHnUR6ixPeOtXisorlQKpUW8mZwASAnK7LaZhJjkABx8eH0sTs=
X-Received: by 10.223.175.56 with SMTP id z53mr11037009wrc.177.1507560000967; 
	Mon, 09 Oct 2017 07:40:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.128.207 with HTTP; Mon, 9 Oct 2017 07:39:40 -0700 (PDT)
In-Reply-To: <1504286483-23327-3-git-send-email-eric.auger@redhat.com>
References: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
	<1504286483-23327-3-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Oct 2017 15:39:40 +0100
Message-ID: <CAFEAcA8AP4nu-vZNbCSEpHOTV1v+BsVprD9siMsBuS2Nf56n=A@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22c
Subject: Re: [Qemu-arm] [PATCH v7 02/20] hw/arm/smmu-common: IOMMU memory
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
Cc: Radha Mohan <mohun106@gmail.com>, Andrew Jones <drjones@redhat.com>,
	Trey Cain <tcain@qti.qualcomm.com>,
	Radha.Chintakuntla@cavium.com, Sunil.Goutham@cavium.com,
	"Michael S. Tsirkin" <mst@redhat.com>,
	jean-philippe.brucker@arm.com, Tomasz Nowicki <tn@semihalf.com>,
	Will Deacon <will.deacon@arm.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Peter Xu <peterx@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	robin.murphy@arm.com, wtownsen@redhat.com,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	Prem Mallappa <prem.mallappa@gmail.com>, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ds3teBu1qXwk

On 1 September 2017 at 18:21, Eric Auger <eric.auger@redhat.com> wrote:
> We enumerate all the PCI devices attached to the SMMU and
> initialize an associated IOMMU memory region and address space.
> This happens on SMMU base instance init.
>
> Those info are stored in SMMUDevice objects. The devices are
> grouped according to the PCIBus they belong to. A hash table
> indexed by the PCIBus poinet is used. Also an array indexed by
> the bus number allows to find the list of SMMUDevices.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/arm/smmu-common.c         | 89 ++++++++++++++++++++++++++++++++++++++++++++
>  include/hw/arm/smmu-common.h |  6 +++
>  2 files changed, 95 insertions(+)
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 56608f1..3e67992 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -30,8 +30,97 @@
>  #include "qemu/error-report.h"
>  #include "hw/arm/smmu-common.h"
>
> +/******************/
> +/* Infrastructure */
> +/******************/

Minor thing, but we don't really need this kind of fancy comment
formatting.

> +static inline gboolean smmu_uint64_equal(gconstpointer v1, gconstpointer v2)
> +{
> +    return *((const uint64_t *)v1) == *((const uint64_t *)v2);
> +}
> +
> +static inline guint smmu_uint64_hash(gconstpointer v)
> +{
> +    return (guint)*(const uint64_t *)v;
> +}
> +
> +SMMUPciBus *smmu_find_as_from_bus_num(SMMUState *s, uint8_t bus_num)
> +{
> +    SMMUPciBus *smmu_pci_bus = s->smmu_as_by_bus_num[bus_num];
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
> +    }
> +    return smmu_pci_bus;
> +}
> +
> +static AddressSpace *smmu_find_add_as(PCIBus *bus, void *opaque, int devfn)
> +{
> +    SMMUState *s = opaque;
> +    uintptr_t key = (uintptr_t)bus;
> +    SMMUPciBus *sbus = g_hash_table_lookup(s->smmu_as_by_busptr, &key);
> +    SMMUDevice *sdev;
> +
> +    if (!sbus) {
> +        uintptr_t *new_key = g_malloc(sizeof(*new_key));
> +
> +        *new_key = (uintptr_t)bus;
> +        sbus = g_malloc0(sizeof(SMMUPciBus) +
> +                         sizeof(SMMUDevice *) * SMMU_PCI_DEVFN_MAX);
> +        sbus->bus = bus;
> +        g_hash_table_insert(s->smmu_as_by_busptr, new_key, sbus);

Why do we allocate memory containing a uintptr_t which we set to
be the (integer value of the) pointer to the bus, and then use the
pointer to that uintptr_t as the key, when we could just use the
pointer to the bus as the key ? That would save you having a specialist
equal function, hash function and having to free the keys.

> +    }
> +
> +    sdev = sbus->pbdev[devfn];
> +    if (!sdev) {
> +        char *name = g_strdup_printf("%s-%d-%d",
> +                                     s->mrtypename,
> +                                     pci_bus_num(bus), devfn);
> +        sdev = sbus->pbdev[devfn] = g_malloc0(sizeof(SMMUDevice));

g_new0() is slightly stylistically preferable for this kind of thing.

> +
> +        sdev->smmu = s;
> +        sdev->bus = bus;
> +        sdev->devfn = devfn;
> +
> +        memory_region_init_iommu(&sdev->iommu, sizeof(sdev->iommu),
> +                                 s->mrtypename,
> +                                 OBJECT(s), name, 1ULL << 48);

What is this 1ULL << 48 ? Is it intended to be the input address
size, intermediate address size or output address size? It's not
clear to me that hardcoded 1 << 48 is right in any of those cases...

> +        address_space_init(&sdev->as,
> +                           MEMORY_REGION(&sdev->iommu), name);
> +    }
> +
> +    return &sdev->as;
> +}
> +
> +static void smmu_init_iommu_as(SMMUState *s)
> +{
> +    PCIBus *pcibus = pci_find_primary_bus();

This looks odd. I would expect the board model to be
instantiating and wiring up the SMMU somehow so that
it is in the path of whatever PCI bus it is sitting in
front of. It shouldn't need to look for the PCI bus like
this, which prevents modelling a system where there are
two PCI buses each of which has its own SMMU.

> +
> +    if (pcibus) {
> +        pci_setup_iommu(pcibus, smmu_find_add_as, s);
> +    } else {
> +        error_report("No PCI bus, SMMU is not registered");
> +    }
> +}
> +
>  static void smmu_base_instance_init(Object *obj)
>  {
> +    SMMUState *s = SMMU_SYS_DEV(obj);
> +
> +    memset(s->smmu_as_by_bus_num, 0, sizeof(s->smmu_as_by_bus_num));

Instance init doesn't need to clear the data structure.

> +
> +    s->smmu_as_by_busptr = g_hash_table_new_full(smmu_uint64_hash,
> +                                                 smmu_uint64_equal,
> +                                                 g_free, g_free);
> +    smmu_init_iommu_as(s);
>  }
>
>  static void smmu_base_class_init(ObjectClass *klass, void *data)
> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> index 38cd18f..20f3fe6 100644
> --- a/include/hw/arm/smmu-common.h
> +++ b/include/hw/arm/smmu-common.h
> @@ -105,4 +105,10 @@ typedef struct {
>  #define SMMU_DEVICE_CLASS(klass)                                    \
>      OBJECT_CLASS_CHECK(SMMUBaseClass, (klass), TYPE_SMMU_DEV_BASE)
>
> +SMMUPciBus *smmu_find_as_from_bus_num(SMMUState *s, uint8_t bus_num);
> +
> +static inline uint16_t smmu_get_sid(SMMUDevice *sdev)
> +{
> +    return  ((pci_bus_num(sdev->bus) & 0xff) << 8) | sdev->devfn;
> +}
>  #endif  /* HW_ARM_SMMU_COMMON */
> --
> 2.5.5

thanks
-- PMM
