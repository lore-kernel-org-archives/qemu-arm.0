Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp374141ejb;
        Thu, 19 Oct 2023 02:07:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBryZDOW5ghSfde2OLmoqPQ/Gg85eF1+Tly2Zu8W17VNemYCrqVULBWNamEtZ2vjrloy5B
X-Received: by 2002:a05:6214:2385:b0:66d:1a20:f26c with SMTP id fw5-20020a056214238500b0066d1a20f26cmr1173557qvb.37.1697706464926;
        Thu, 19 Oct 2023 02:07:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697706464; cv=none;
        d=google.com; s=arc-20160816;
        b=MaAmO+1SIkKHnT24q2I3vXBs6S8jCJnKFZ4JYOs7Aqy8xTwNuifRoOcIT45HRSSHnj
         Wi31Ct3u93qb2FSKt8oPnWKehypo24t0+uMV1BPZEkVeOzBh4CXfQMAylXnnZ/DUiQ5X
         63ygAj3wogWh3EEbOPXWzCRoOND5LMJJdVU5pcGvopk1SsXPNWxfIpUpHkRcmiEasRR+
         +2oV7DfufYn4JTGGWkyqIM15ot6z8aWiLt5QKjsBomnydvidcZW67u1Z/r95IPmqw91d
         rr1Nw9xZbYBwMCy6GJuoUi7YB2aspkjMWDXkJJlyyR4err7pg1KWusU8vFJA+xrOvr8B
         2Mlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=otrf+KyCMw/Ydvi/gAU7O3+mROmgl3QS9I3TKAF2hCY=;
        fh=F17jLVu8AZLcLgxntiwfuOYo6J4yPopdhjl9CABfLQQ=;
        b=vRZlLWDnT8Lm7kzIFtFH1EDwgSpXI9M+yJQUcsgqhiyZBC2iDyB3N/Uy3DtaoBL0qg
         nRB1FTBM/Jx8sLAZ3Q253ycqDB/5tjgSeeK9EdrGup5KnIV0GTjr0SEuZrOFeeAEN/cA
         Cot6OgLeRJ17AjYyz0ajUD91ocg9wTqZBxZVqCS2LWIOjHWyw/gwrLcWj7OOhDB31qSu
         D+Zf1BoZIQtU+oHfe8S0qA/xKXmLmyz7DXDzckT1MiYDXqPdGow/OGsiY0sIjAcj9aS5
         2cfu5SDIpr3CarY2mT2FbahsT5A61bel/TH1sbaQ/oa2ZlDoNvkVoil+LhMNbnknrL7u
         FpCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BILmG6kw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x7-20020a05620a258700b00775a1063051si1228505qko.501.2023.10.19.02.07.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 02:07:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BILmG6kw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtP07-0006w9-0m; Thu, 19 Oct 2023 05:07:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yanghliu@redhat.com>)
 id 1qtP05-0006vz-N0
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 05:07:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yanghliu@redhat.com>)
 id 1qtP03-0000j4-RS
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 05:07:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697706446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=otrf+KyCMw/Ydvi/gAU7O3+mROmgl3QS9I3TKAF2hCY=;
 b=BILmG6kw/JWqiKyJUg4Bb/sCmfkCGLmehnaSgeWe2X74MCuwZ+m54d+Vd9cFJ+LB0yZAad
 oWTuaXCHEuS98lqJgdZflcCxibXswL7x6+jrxrayd3MmW58XRF/HKaRDNjnRYRLpfG4b1f
 nr5qZ55xPZxdh29VH1V0jYBMnnQYBS8=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683-aQ4XDbVnOu2Bl-7Sz2dgKw-1; Thu, 19 Oct 2023 05:07:24 -0400
X-MC-Unique: aQ4XDbVnOu2Bl-7Sz2dgKw-1
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-2c512a53e82so49420111fa.0
 for <qemu-arm@nongnu.org>; Thu, 19 Oct 2023 02:07:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697706443; x=1698311243;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=otrf+KyCMw/Ydvi/gAU7O3+mROmgl3QS9I3TKAF2hCY=;
 b=JRVbsU2i04Apy9FnAB2GVzq4lYoI+B2aHTxV/tfEe82lCECMWhHhcOS7EVR1VB5q63
 po1vnERAIoVMa8iUh+YN/defq320CekAeNZM2jHgLLsoReB6u1ALVNlWyD9yAQWe0mEe
 QevHdHB5b3T0VfUpKf5/CRXZ1H50TsRQ3SFPL0zlmVffXa722rTpZtGbr72zIyeJD2+5
 /crRUU8WeAwRgaAOkCTeTIB5nx/q60JnobGvbMQFl8vsTUx9+ZY0eLglVgXpAwMBqNEQ
 pgFCmK8dSmtIOf0ZJyaVSBUQRxINyWfyJZ70QZZwoi9Qt9claaQtMkGh3Tt7/ncWxeNf
 rdXg==
X-Gm-Message-State: AOJu0YwEFrbrJQ+n4QRQ6xxcwYpamMXC00fjzGhpDpHlDLh43fT9wwWo
 W6qupaiODDETA35+gtSl+vTaGb7WUh+VkO9jkhuc+0kMpo1pc4XQSejCcQIdKLPGh8gxsbE9P6M
 dMR2qeB8SkDivvc4xKfWGTToq6HQ1
X-Received: by 2002:a05:651c:2109:b0:2c5:fde:e457 with SMTP id
 a9-20020a05651c210900b002c50fdee457mr1099806ljq.3.1697706443172; 
 Thu, 19 Oct 2023 02:07:23 -0700 (PDT)
X-Received: by 2002:a05:651c:2109:b0:2c5:fde:e457 with SMTP id
 a9-20020a05651c210900b002c50fdee457mr1099781ljq.3.1697706442781; Thu, 19 Oct
 2023 02:07:22 -0700 (PDT)
MIME-Version: 1.0
References: <20231011175516.541374-1-eric.auger@redhat.com>
 <20231018093723-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231018093723-mutt-send-email-mst@kernel.org>
From: YangHang Liu <yanghliu@redhat.com>
Date: Thu, 19 Oct 2023 17:07:11 +0800
Message-ID: <CAGYh1E_RQOWkDP+rxfTV-AoVekw_SpuOxOVCZ0V7Gj+keZWXLw@mail.gmail.com>
Subject: Re: [PATCH v3 00/13] VIRTIO-IOMMU/VFIO: Don't assume 64b IOVA space
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org, alex.williamson@redhat.com, clg@redhat.com, 
 jean-philippe@linaro.org, pbonzini@redhat.com, peter.maydell@linaro.org, 
 peterx@redhat.com, david@redhat.com, philmd@linaro.org, 
 zhenzhong.duan@intel.com, yi.l.liu@intel.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=yanghliu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 6kbvi8nGFz9f

The original issue I found : After starting a VM which has two ice PFs
and a virtio-iommu device, qemu-kvm and VM guest dmesg throw lots of
duplicate VFIO_MAP_DMA errors

After testing with Eric's build, the  original issue is gone and the
Tier1 regression test against ice PF and virtio iommu device gets PASS
as well.

Tested-by: Yanghang Liu <yanghliu@redhat.com>


On Wed, Oct 18, 2023 at 9:45=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Wed, Oct 11, 2023 at 07:52:16PM +0200, Eric Auger wrote:
> > This applies on top of vfio-next:
> > https://github.com/legoater/qemu/, vfio-next branch
>
> virtio things make sense
>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>
> let me know how you want to merge all this.
>
>
>
> > On x86, when assigning VFIO-PCI devices protected with virtio-iommu
> > we encounter the case where the guest tries to map IOVAs beyond 48b
> > whereas the physical VTD IOMMU only supports 48b. This ends up with
> > VFIO_MAP_DMA failures at qemu level because at kernel level,
> > vfio_iommu_iova_dma_valid() check returns false on vfio_map_do_map().
> >
> > This is due to the fact the virtio-iommu currently unconditionally
> > exposes an IOVA range of 64b through its config input range fields.
> >
> > This series removes this assumption by retrieving the usable IOVA
> > regions through the VFIO_IOMMU_TYPE1_INFO_CAP_IOVA_RANGE UAPI when
> > a VFIO device is attached. This info is communicated to the
> > virtio-iommu memory region, transformed into the inversed info, ie.
> > the host reserved IOVA regions. Then those latter are combined with the
> > reserved IOVA regions set though the virtio-iommu reserved-regions
> > property. That way, the guest virtio-iommu driver, unchanged, is
> > able to probe the whole set of reserved regions and prevent any IOVA
> > belonging to those ranges from beeing used, achieving the original goal=
.
> >
> > Best Regards
> >
> > Eric
> >
> > This series can be found at:
> > https://github.com/eauger/qemu/tree/vfio-next-iommu_geometry-v3
> >
> > History:
> > v2 -> v3:
> > - rebase on top of vfio-next (including iommufd prereq)
> > - take into account IOVA range info capability may not be offered by
> >   old kernel and use nr_iovas =3D -1 to encode that [Alex]
> > - use GList * everywhere instead of arrays (in the range_inverse_array)
> >   with the benefice it sorts ranges retrieved from the kernel which are
> >   not garanteed to be sorted. Rework the tests accordingly [Alex]
> > - Make sure resv_regions GList is build before the probe() [Jean]
> >   per device list is first populated with prop resv regions on
> >   IOMMUDevice creation and then rebuilt on set_iova()
> > - Add a warning if set_iova builds a valid list after probe was
> >   called [Jean]
> > - Build host windows on top of IOVA valid ranges if this info can
> >   be retrieved from the kernel. As many windows are created as
> >   valid ranges
> > v1 -> v2:
> > - Remove "[PATCH 12/13] virtio-iommu: Resize memory region according
> >   to the max iova info" which causes way too much trouble: trigger
> >   a coredump in vhost, causes duplication of IOMMU notifiers causing
> >   EEXIST vfio_dma_map errors, ... This looks like a bad usage of the
> >   memory API so I prefer removing this from this series. So I was
> >   also obliged to remove the vfio_find_hostwin() check in the case
> >   of an IOMMU.
> > - Let range_inverse_array() take low/high args instead of hardcoding
> >   0, UINT64_MAX which both complexifies the algo and the tests.
> > - Move range function description in header.
> > - Check that if set_iova_ranges is called several times, new resv
> >   regions are included in previous ones
> >
> > Eric Auger (13):
> >   memory: Let ReservedRegion use Range
> >   memory: Introduce memory_region_iommu_set_iova_ranges
> >   vfio: Collect container iova range info
> >   virtio-iommu: Rename reserved_regions into prop_resv_regions
> >   range: Make range_compare() public
> >   util/reserved-region: Add new ReservedRegion helpers
> >   virtio-iommu: Introduce per IOMMUDevice reserved regions
> >   range: Introduce range_inverse_array()
> >   virtio-iommu: Record whether a probe request has been issued
> >   virtio-iommu: Implement set_iova_ranges() callback
> >   virtio-iommu: Consolidate host reserved regions and property set ones
> >   test: Add some tests for range and resv-mem helpers
> >   vfio: Remove 64-bit IOVA address space assumption
> >
> >  include/exec/memory.h            |  34 +++-
> >  include/hw/vfio/vfio-common.h    |   2 +
> >  include/hw/virtio/virtio-iommu.h |   7 +-
> >  include/qemu/range.h             |  14 ++
> >  include/qemu/reserved-region.h   |  32 ++++
> >  hw/core/qdev-properties-system.c |   9 +-
> >  hw/vfio/common.c                 |  23 ++-
> >  hw/vfio/container.c              |  67 ++++++-
> >  hw/virtio/virtio-iommu-pci.c     |   8 +-
> >  hw/virtio/virtio-iommu.c         | 155 +++++++++++++--
> >  system/memory.c                  |  13 ++
> >  tests/unit/test-resv-mem.c       | 318 +++++++++++++++++++++++++++++++
> >  util/range.c                     |  61 +++++-
> >  util/reserved-region.c           |  91 +++++++++
> >  hw/virtio/trace-events           |   1 +
> >  tests/unit/meson.build           |   1 +
> >  util/meson.build                 |   1 +
> >  17 files changed, 791 insertions(+), 46 deletions(-)
> >  create mode 100644 include/qemu/reserved-region.h
> >  create mode 100644 tests/unit/test-resv-mem.c
> >  create mode 100644 util/reserved-region.c
> >
> > --
> > 2.41.0
>
>

