Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2069079wrt;
        Thu, 18 Oct 2018 03:32:51 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60uY7d+W0HWaujL8JfS/TQW8iEQKUgOnFZ8vy283Ye7N36NLO7lsb3mAai6/py4mPvt9TwW
X-Received: by 2002:ac8:23ad:: with SMTP id q42-v6mr28534320qtq.322.1539858771718;
        Thu, 18 Oct 2018 03:32:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539858771; cv=none;
        d=google.com; s=arc-20160816;
        b=sPh09tKN571f+PkiaeE9XE72u9GySMXldJ26M/aF2ACGhWs+D2qHKgkebMGgTd54th
         3op552BZJgkM797pX74dLijzApWrLY7Ji+1BpuN+LT6XvBu4P8zkbJ7Jgx/EidC1AOO/
         TSsqrh94Tig3n+tsGImY8LwttK7uqW4dW0kW7PjQtrd1+MAYXpcAfir8RAAezvn2poD/
         2PY6LP1YFc3PkRrU16iRgW+po2yu/YAhHbDSTW1v1OEhmhlVxZ1mntTFzoRsqV3eHVLV
         xz4mgT4vOb05po0j5qtepgR/5eZbVZm5jeQ8BgvAXSH+jg11r9e4Pbg2k+MtDbfVRrET
         CwNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:dlp-reaction:dlp-version:dlp-product
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:to:from;
        bh=qwgAT4X9NxjH/3WQejGlL6yUEDcRZPNDMcdw+fmBDX4=;
        b=phjtH+Wxdci7mqNvTNPx3KLGd/BotfagaEYXiZKxzUp5ml1PdSjmbMAvfoXAE03jnW
         Oa6KA98rP7nBgFwF+91Xe/qLk4fztJcUzuRg1gWqITJo6iou6A2S+Z5rgI2A+60ki7HS
         z7zZyyDYWPD8elmCNk87Vp5eWgy2V/ZgbfyR5qPR926S4urJ1ceH9XhJaq3TVtzB2OJ8
         HKe51G8HbltiRzxcixInIWCssZachUqIT1ZDjQ7/S9YRPkozlh4LN8UT96QrJ+m2nl1B
         34DwqKN6LDJaz2gu3KFKfQx0MDNSFmou5vjpG8Gfnzj375IF8B0WXCtofDjsFFJ5zrgd
         rBVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i13-v6si801508qtm.305.2018.10.18.03.32.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 03:32:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:41524 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gD5bn-0001er-8M
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 06:32:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55469)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yi.l.liu@intel.com>) id 1gD5a0-00014l-3C
	for qemu-devel@nongnu.org; Thu, 18 Oct 2018 06:31:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <yi.l.liu@intel.com>) id 1gD5Zu-00039U-W4
	for qemu-devel@nongnu.org; Thu, 18 Oct 2018 06:30:59 -0400
Received: from mga02.intel.com ([134.134.136.20]:19503)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <yi.l.liu@intel.com>)
	id 1gD5Zu-00033e-Ln; Thu, 18 Oct 2018 06:30:54 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Oct 2018 03:30:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,396,1534834800"; d="scan'208";a="96290831"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
	by fmsmga002.fm.intel.com with ESMTP; 18 Oct 2018 03:30:51 -0700
Received: from fmsmsx119.amr.corp.intel.com (10.18.124.207) by
	FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Thu, 18 Oct 2018 03:30:50 -0700
Received: from shsmsx103.ccr.corp.intel.com (10.239.4.69) by
	FMSMSX119.amr.corp.intel.com (10.18.124.207) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Thu, 18 Oct 2018 03:30:49 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.48]) by
	SHSMSX103.ccr.corp.intel.com ([169.254.4.245]) with mapi id
	14.03.0319.002; Thu, 18 Oct 2018 18:30:47 +0800
From: "Liu, Yi L" <yi.l.liu@intel.com>
To: Eric Auger <eric.auger@redhat.com>, "eric.auger.pro@gmail.com"
	<eric.auger.pro@gmail.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>
Thread-Topic: [RFC v2 00/28] vSMMUv3/pSMMUv3 2 stage VFIO integration
Thread-Index: AQHUUYPG4Vn8CydKKEelflcsj1GMg6Uk8aPw
Date: Thu, 18 Oct 2018 10:30:46 +0000
Message-ID: <A2975661238FB949B60364EF0F2C257439D32CBE@SHSMSX104.ccr.corp.intel.com>
References: <20180921081819.9203-1-eric.auger@redhat.com>
In-Reply-To: <20180921081819.9203-1-eric.auger@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNjQ3YzU4NjctYmFmYS00ODZjLTk4MjEtMmY2MDNkN2U0NzFjIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiUnR2enRaeUwrbXRuN2hjVkIzZjh2TWlIVHlyUitxclpnYTIzdGdxXC9TYlR6aWJHS0IzSjNJSThtSzJzSFB4M2IifQ==
x-originating-ip: [10.239.127.40]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.20
Subject: Re: [Qemu-devel] [RFC v2 00/28] vSMMUv3/pSMMUv3 2 stage VFIO
 integration
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Tian, Kevin" <kevin.tian@intel.com>, "cdall@kernel.org" <cdall@kernel.org>,
	"mst@redhat.com" <mst@redhat.com>,
	"jean-philippe.brucker@arm.com" <jean-philippe.brucker@arm.com>, "Sun, 
	Yi Y" <yi.y.sun@intel.com>, "peterx@redhat.com" <peterx@redhat.com>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qtmGsHYWvb2x

Hi Eric,

> From: Eric Auger [mailto:eric.auger@redhat.com]
> Sent: Friday, September 21, 2018 4:18 PM
> Subject: [RFC v2 00/28] vSMMUv3/pSMMUv3 2 stage VFIO integration
>=20
> Up to now vSMMUv3 has not been integrated with VFIO. VFIO
> integration requires to program the physical IOMMU consistently
> with the guest mappings. However, as opposed to VTD, SMMUv3 has
> no "Caching Mode" which allows easy trapping of guest mappings.
> This means the vSMMUV3 cannot use the same VFIO integration as VTD.
>=20
> However SMMUv3 has 2 translation stages. This was devised with
> virtualization use case in mind where stage 1 is "owned" by the
> guest whereas the host uses stage 2 for VM isolation.
>=20
> This series sets up this nested translation stage. It only works
> if there is one physical SMMUv3 used along with QEMU vSMMUv3 (in
> other words, it does not work if there is a physical SMMUv2).
>=20
> The series uses a new kernel user API [1], still under definition.
>=20
> - We force the host to use stage 2 instead of stage 1, when we
>   detect a vSMMUV3 is behind a VFIO device. For a VFIO device
>   without any virtual IOMMU, we still use stage 1 as many existing
>   SMMUs expect this behavior.
> - We introduce new IOTLB "config" notifiers, requested to notify
>   changes in the config of a given iommu memory region. So now
>   we have notifiers for IOTLB changes and config changes.
> - vSMMUv3 calls config notifiers when STE (Stream Table Entries)
>   are updated by the guest.
> - We implement a specific UNMAP notifier that conveys guest
>   IOTLB invalidations to the host
> - We implement a new MAP notifiers only used for MSI IOVAs so
>   that the host can build a nested stage translation for MSI IOVAs
> - As the legacy MAP notifier is not called anymore, we must make
>   sure stage 2 mappings are set. This is achieved through another
>   memory listener.
> - Physical SMMUs faults are reported to the guest via en eventfd
>   mechanism and reinjected into this latter.
>=20
> Note: some iommu memory notifier rework related patches are close
> to those previously published by Peter and Liu. I will be pleased to
> add their Signed-off-by if they agree/wish.

Yeah, feel free to add mine if it's originated from our previous work.

BTW. Curiously, are you planning to implement all vIOMMU related
operations through MemoryRegion notifiers? Honestly, I did it in such
way in early RFC for vSVA work. However, we encountered two issues
at that time. First, how to check whether the notifier should be registered=
.
Second, there are cases in which the vfio_listener_region_add is not
triggered but vIOMMU exists. Details can be got by the link below:
(http://lists.gnu.org/archive/html/qemu-devel/2018-03/msg00078.html)

As thus, we had some discussions in community. Last time, PCIPASIDOps
was proposed. It is to add callbacks in PCIDevice. VFIO would register its
implementations in vfio_realize(). Supposedly, pasid_table_bind,
page_table_bind, sva_tlb_invalidation_passdown and other vIOMMU
related operations can be done in such way. The sample patch below
may show how it looks like. (the full patch is in my sandbox, planned to
send out with Scalable Mode emulation patch).

Sample patch:
include/hw/pci/pci.h:
 +typedef struct PCIPASIDOps PCIPASIDOps;
 +struct PCIPASIDOps {
 +    void (*pasid_bind_table)(PCIBus *bus, int32_t devfn,
 +                            struct pasid_table_config *ptbl_cfg);
 +    void (*pasid_invalidate_extend_iotlb)(PCIBus *bus, int32_t devfn,
 +                            struct tlb_invalidate_info *inv_info);
 +};

 @@ -350,6 +359,7 @@ struct PCIDevice {
      MSIVectorUseNotifier msix_vector_use_notifier;
      MSIVectorReleaseNotifier msix_vector_release_notifier;
      MSIVectorPollNotifier msix_vector_poll_notifier;
 +    PCIPASIDOps *pasid_ops;
  };

hw/pci/pci.c:
+void pci_setup_pasid_ops(PCIDevice *dev, PCIPASIDOps *ops)
 +{
 +    assert(ops && !dev->pasid_ops);
 +    dev->pasid_ops =3D ops;
 +}
 +
 +void pci_device_pasid_bind_table(PCIBus *bus, int32_t devfn,
 +                                 struct pasid_table_config *ptbl_cfg)
 +{
 +    PCIDevice *dev;
 +
 +    if (!bus) {
 +        return;
 +    }
 +
 +    dev =3D bus->devices[devfn];
 +    if (dev && dev->pasid_ops) {
 +        dev->pasid_ops->pasid_bind_table(bus, devfn, ptbl_cfg);
 +    }
 +}

hw/vfio/pci.c:
+static PCIPASIDOps vfio_pci_pasid_ops =3D {
 +    .pasid_bind_table =3D vfio_pci_device_pasid_bind_table,
 +    .pasid_invalidate_extend_iotlb =3D vfio_pci_device_pasid_invalidate_e=
iotlb,
 +};
 +
  static void vfio_realize(PCIDevice *pdev, Error **errp)
  {
      VFIOPCIDevice *vdev =3D DO_UPCAST(VFIOPCIDevice, pdev, pdev);
 @@ -3048,6 +3068,8 @@ static void vfio_realize(PCIDevice *pdev, Error **er=
rp)
      vfio_register_req_notifier(vdev);
      vfio_setup_resetfn_quirk(vdev);

 +    pci_setup_pasid_ops(pdev, &vfio_pci_pasid_ops);
 +
      return;

Regards,
Yi Liu

