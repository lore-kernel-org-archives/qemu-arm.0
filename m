Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp2304153dye;
        Mon, 30 Jun 2025 00:38:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV6lcsEchfzht/Ech15noZ+Mf+8KvnF6gnVbUWZuqlxcRniiI7gVdmWgPuQyLgHPTXzVQXtYoJsoUn5hQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEPXfPrtadObTDekPiwU3cYtpDLPs08pffOjzClf+zFrzcRo863QbSdEBkdldZ1bJzv57VA
X-Received: by 2002:a05:620a:44d0:b0:7c5:4463:29a3 with SMTP id af79cd13be357-7d443916000mr1724230185a.25.1751269107651;
        Mon, 30 Jun 2025 00:38:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751269107; cv=none;
        d=google.com; s=arc-20240605;
        b=eVSTXQbX3K2HCexNsAVM49d4Yx6XAwz3f157nJKqmk10H050faJczZ6NGxGTDSGg7J
         5FYuuSNEYzA4VW64GYyHbc9LArtCFlwFz9VOLpySRE1Z3R6BLmubabYc5LbKrcndS+2b
         xl4D5iC8Ai+5ZnYivsjmKPPYPQZbhV5cYDEYdN1Xa1Q7P5+fJwyhDPy3BzgGdkZvdKgG
         kifccqD6a63FmxlZd6kRVWQWEyS/HxZSdyW/lNJw6ksE28SDCQSRV8i3npZ6AgTO1Wrs
         0Y9Lv93FniGnU0nJjPmoNqUjCIuoX2eOeWbeEVJb/rF10aKeAhOskjRaQvou3EAZ9yWU
         I0KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to;
        bh=b0XZl5VOerToOo3nmry9g6/n0lOq4l6KCWkuGhyDkis=;
        fh=605i3wiMsxxvtVcNhth/O4wFqNclfOUoa3m8pN98eBE=;
        b=MGIhRKVnmsqkgzekIdtcElbBCuaDCqh6iTQ+vsHUO/+HW89fc0Tm50g6A/IpGHANfJ
         N5qQKupvpOEtsyKSOlvymnke1kmpHvy/vpazmZ1ARsEOpoR0H3+ZALg3O4j1aGK9N0eF
         1PCRT2m2makSPohq2kN/OXt9uap7O/ja+Dt4tuPV1uQdUwdaU/jwbfHrV6g4I0LWyeke
         47tVhlxGmrAJQgg1JV2mzKRWmBwWbFBnxiTXYgvSoEAL8/wJBJoSM4w+28m6celEdfDJ
         2LEDmEQVoD9LqBLlV7jGhTt4wCBfnRUkXSHcx3H9a5bvMklDQ2eUq03MOgE/NcBYtBdB
         PSWg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc1e739esi83493851cf.239.2025.06.30.00.38.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Jun 2025 00:38:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uW95e-0004uu-QA; Mon, 30 Jun 2025 03:38:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1uW95K-0004jw-BH
 for qemu-arm@nongnu.org; Mon, 30 Jun 2025 03:37:52 -0400
Received: from [185.176.79.56] (helo=frasgout.his.huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1uW94y-0001Zc-Ij
 for qemu-arm@nongnu.org; Mon, 30 Jun 2025 03:37:49 -0400
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bVybW274hz6L573;
 Mon, 30 Jun 2025 15:34:31 +0800 (CST)
Received: from frapeml100007.china.huawei.com (unknown [7.182.85.133])
 by mail.maildlp.com (Postfix) with ESMTPS id 366B71402F1;
 Mon, 30 Jun 2025 15:37:18 +0800 (CST)
Received: from frapeml500008.china.huawei.com (7.182.85.71) by
 frapeml100007.china.huawei.com (7.182.85.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 30 Jun 2025 09:37:17 +0200
Received: from frapeml500008.china.huawei.com ([7.182.85.71]) by
 frapeml500008.china.huawei.com ([7.182.85.71]) with mapi id 15.01.2507.039;
 Mon, 30 Jun 2025 09:37:17 +0200
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "Michael S . Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
CC: "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>, "jgg@nvidia.com"
 <jgg@nvidia.com>, "nicolinc@nvidia.com" <nicolinc@nvidia.com>,
 "ddutile@redhat.com" <ddutile@redhat.com>, "berrange@redhat.com"
 <berrange@redhat.com>, "imammedo@redhat.com" <imammedo@redhat.com>,
 "nathanc@nvidia.com" <nathanc@nvidia.com>, "mochs@nvidia.com"
 <mochs@nvidia.com>, "smostafa@google.com" <smostafa@google.com>,
 "gustavo.romero@linaro.org" <gustavo.romero@linaro.org>, Linuxarm
 <linuxarm@huawei.com>, "Wangzhou (B)" <wangzhou1@hisilicon.com>, jiangkunkun
 <jiangkunkun@huawei.com>, Jonathan Cameron <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>
Subject: RE: [PATCH v5 06/11] hw/pci: Introduce pci_setup_iommu_per_bus() for
 per-bus IOMMU ops retrieval
Thread-Topic: [PATCH v5 06/11] hw/pci: Introduce pci_setup_iommu_per_bus() for
 per-bus IOMMU ops retrieval
Thread-Index: AQHb5Ci5FbhTt10phUunNrQS3OB7wrQbWWgA
Date: Mon, 30 Jun 2025 07:37:17 +0000
Message-ID: <3253e85fbabe4207bba56378f241e68e@huawei.com>
References: <20250623094230.76084-1-shameerali.kolothum.thodi@huawei.com>
 <20250623094230.76084-7-shameerali.kolothum.thodi@huawei.com>
In-Reply-To: <20250623094230.76084-7-shameerali.kolothum.thodi@huawei.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.203.177.241]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Host-Lookup-Failed: Reverse DNS lookup failed for 185.176.79.56 (deferred)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=shameerali.kolothum.thodi@huawei.com;
 helo=frasgout.his.huawei.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-to:  Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
From:  Shameerali Kolothum Thodi via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: YkQcvp3kx5Rd

Hi,

> -----Original Message-----
> From: qemu-devel-
> bounces+shameerali.kolothum.thodi=3Dhuawei.com@nongnu.org <qemu-
> devel-bounces+shameerali.kolothum.thodi=3Dhuawei.com@nongnu.org> On
> Behalf Of Shameer Kolothum via
> Sent: Monday, June 23, 2025 10:42 AM
> To: qemu-arm@nongnu.org; qemu-devel@nongnu.org
> Cc: eric.auger@redhat.com; peter.maydell@linaro.org; jgg@nvidia.com;
> nicolinc@nvidia.com; ddutile@redhat.com; berrange@redhat.com;
> imammedo@redhat.com; nathanc@nvidia.com; mochs@nvidia.com;
> smostafa@google.com; gustavo.romero@linaro.org; Linuxarm
> <linuxarm@huawei.com>; Wangzhou (B) <wangzhou1@hisilicon.com>;
> jiangkunkun <jiangkunkun@huawei.com>; Jonathan Cameron
> <jonathan.cameron@huawei.com>; zhangfei.gao@linaro.org
> Subject: [PATCH v5 06/11] hw/pci: Introduce pci_setup_iommu_per_bus()
> for per-bus IOMMU ops retrieval

+ PCI maintainers to the thread (Sorry I missed that and thanks to Eric for
 the reminder).

Background:

This patch series adds support for creating multiple arm-smmuv3 devices,
each tied to a specific PCIe root complex on the virt board. This lays the
groundwork for upcoming support for accelerated SMMUv3, where we
intend to leverage the host's nested SMMUv3 configuration-for VFIO-PCI
passthrough device assignment.

For the context on the issue addressed in this patch, please refer to the
commit message below and the cover letter here[0].

Please take a look and let me know.

Thanks,
Shameer
[0] https://lore.kernel.org/qemu-devel/20250623094230.76084-1-shameerali.ko=
lothum.thodi@huawei.com/

> Currently, pci_setup_iommu() registers IOMMU ops for a given PCIBus.
> However, when retrieving IOMMU ops for a device using
> pci_device_get_iommu_bus_devfn(), the function checks the parent_dev
> and fetches IOMMU ops from the parent device, even if the current
> bus does not have any associated IOMMU ops.
>=20
> This behavior works for now because QEMU's IOMMU implementations are
> globally scoped, and host bridges rely on the bypass_iommu property
> to skip IOMMU translation when needed.
>=20
> However, this model will break with the soon to be introduced
> arm-smmuv3 device, which allows users to associate the IOMMU
> with a specific PCIe root complex (e.g., the default pcie.0
> or a pxb-pcie root complex).
>=20
> For example, consider the following setup with multiple root
> complexes:
>=20
> -device arm-smmuv3,primary-bus=3Dpcie.0,id=3Dsmmuv3.0 \
> ...
> -device pxb-pcie,id=3Dpcie.1,bus_nr=3D8,bus=3Dpcie.0 \
> -device pcie-root-port,id=3Dpcie.port1,bus=3Dpcie.1 \
> -device virtio-net-pci,bus=3Dpcie.port1
>=20
> In Qemu, pxb-pcie acts as a special root complex whose parent is
> effectively the default root complex(pcie.0). Hence, though pcie.1
> has no associated SMMUv3 as per above,
> pci_device_get_iommu_bus_devfn()
> will incorrectly return the IOMMU ops from pcie.0 due to the fallback
> via parent_dev.
>=20
> To fix this, introduce a new helper pci_setup_iommu_per_bus() that
> explicitly sets the new iommu_per_bus field in the PCIBus structure.
> Update pci_device_get_iommu_bus_devfn() to use this when determining
> the correct IOMMU ops, ensuring accurate behavior for per-bus IOMMUs.
>=20
> Signed-off-by: Shameer Kolothum
> <shameerali.kolothum.thodi@huawei.com>
> ---
> Please refer cover letter for more details on the issue that
> this is trying to fix.
> ---
>  hw/pci/pci.c             | 25 +++++++++++++++++++++++++
>  include/hw/pci/pci.h     |  2 ++
>  include/hw/pci/pci_bus.h |  1 +
>  3 files changed, 28 insertions(+)
>=20
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index c70b5ceeba..e1940c05d9 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -2909,6 +2909,19 @@ static void
> pci_device_get_iommu_bus_devfn(PCIDevice *dev,
>              }
>          }
>=20
> +        /*
> +         * When multiple PCI Express Root Buses are defined using pxb-pc=
ie,
> +         * the IOMMU configuration may be specific to each root bus.
> However,
> +         * pxb-pcie acts as a special root complex whose parent is effec=
tively
> +         * the default root complex(pcie.0). Ensure that we retrieve the
> +         * correct IOMMU ops(if any) in such cases.
> +         */
> +        if (pci_bus_is_express(iommu_bus) && pci_bus_is_root(iommu_bus))
> {
> +            if (!iommu_bus->iommu_per_bus && parent_bus-
> >iommu_per_bus) {
> +                break;
> +            }
> +        }
> +
>          iommu_bus =3D parent_bus;
>      }
>=20
> @@ -3169,6 +3182,18 @@ void pci_setup_iommu(PCIBus *bus, const
> PCIIOMMUOps *ops, void *opaque)
>      bus->iommu_opaque =3D opaque;
>  }
>=20
> +/*
> + * This is same as pci_setup_iommu() except it sets the iommu_per_bus
> + * to true indicating the iommu is specific to this bus and
> + * not applicable to any parent or child.
> + */
> +void pci_setup_iommu_per_bus(PCIBus *bus, const PCIIOMMUOps *ops,
> +                             void *opaque)
> +{
> +    pci_setup_iommu(bus, ops, opaque);
> +    bus->iommu_per_bus =3D true;
> +}
> +
>  static void pci_dev_get_w64(PCIBus *b, PCIDevice *dev, void *opaque)
>  {
>      Range *range =3D opaque;
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index df3cc7b875..a3e0870a15 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -764,6 +764,8 @@ int pci_iommu_unregister_iotlb_notifier(PCIDevice
> *dev, uint32_t pasid,
>   */
>  void pci_setup_iommu(PCIBus *bus, const PCIIOMMUOps *ops, void
> *opaque);
>=20
> +void pci_setup_iommu_per_bus(PCIBus *bus, const PCIIOMMUOps *ops,
> void *opaque);
> +
>  pcibus_t pci_bar_address(PCIDevice *d,
>                           int reg, uint8_t type, pcibus_t size);
>=20
> diff --git a/include/hw/pci/pci_bus.h b/include/hw/pci/pci_bus.h
> index 2261312546..c738446788 100644
> --- a/include/hw/pci/pci_bus.h
> +++ b/include/hw/pci/pci_bus.h
> @@ -35,6 +35,7 @@ struct PCIBus {
>      enum PCIBusFlags flags;
>      const PCIIOMMUOps *iommu_ops;
>      void *iommu_opaque;
> +    bool iommu_per_bus;
>      uint8_t devfn_min;
>      uint32_t slot_reserved_mask;
>      pci_set_irq_fn set_irq;
> --
> 2.34.1
>=20

