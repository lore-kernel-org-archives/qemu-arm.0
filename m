Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 264EAEC1423
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Mar 2026 10:48:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vxNIr-00031z-HM; Tue, 03 Mar 2026 05:48:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vxNIq-00031g-4c
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 05:48:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vxNIh-0004C7-2y
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 05:48:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772534906;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nEHegAVxKlLHUxF47/TrSWe3AW8x3xWT9xEVTACOVdc=;
 b=hqkaaTG2DDeHTcarlT3Pzk9w17XJwZFWryXOX9hck4/fXGWA1KmsJlqrV0+xCzONAhVsof
 SzCs5c7gDWvmJEQKwpNyohasrRx3ncjSLanGaeMCpPqctt2k4RlMyrIwSjLn9vjla1vDOp
 B9MXeLv8VlTNi1mZFW9SR2pqLgKoNno=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-310-2m9uv2yMOxK7xHidDCB5xQ-1; Tue, 03 Mar 2026 05:48:25 -0500
X-MC-Unique: 2m9uv2yMOxK7xHidDCB5xQ-1
X-Mimecast-MFC-AGG-ID: 2m9uv2yMOxK7xHidDCB5xQ_1772534904
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-4398fed3552so4664302f8f.3
 for <qemu-arm@nongnu.org>; Tue, 03 Mar 2026 02:48:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772534904; x=1773139704;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nEHegAVxKlLHUxF47/TrSWe3AW8x3xWT9xEVTACOVdc=;
 b=PaGNwi542KTPVH1CpY1MV1A/GLkPS7YSKf0rptc3tZ6xsp4kt+9xMvh6iUShGO1yHG
 rNeNxAaqb1r88Jlvas9Eo12+v4Mu8LmaxNlzaFYiF46Gh1xk8WRUknS14C3Al+Sh2jBo
 gCj4gVb1IBFiOroIHIi5T29BgLPxHsa3C1zEX9JZB+CbPiQ541KXfRXSPQ8K59v4rJKN
 se4Ftv9wERIE34WrPUWnD6ishv0kis2xQ/BZrqVJ/a8IrXp/gi56Bh7gTcX+Bk9Yb+Pr
 trJK/3ewpz8MJipWHDU0Q5n5zUlJIsIXHLosG9qH4OBMXkaaDPz3/4Jy4pYOrmYgGGE6
 vVJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXg8UlI96btaIY69K0X8QsD1gRYG8S6xREvaptL4N2Jlp+0otOIpqwe6ghltn2TNaOljDyzXmJlPg==@nongnu.org
X-Gm-Message-State: AOJu0YwD1xFrvbFvb3nXCGpME8wlfiFEAFXsLLeuTBClykpILQrU2cJW
 o5ZjSQkJbNS8CG0m/dwJj9BcjgrrK04Iq0YTHQgOHz7Z0iYfzoZlFGj+QX2LJocMT2cIjlaCbLg
 EPVi4nliH4STcu9tuefGreUI4GBQyC2e+Wmkj5EIuK9wTPK59onpi6Q==
X-Gm-Gg: ATEYQzyM0t3/muIxbgRJrX5PxCHWihdum87EGi2F4zvX69C+3XbPx42Tu2w0/yWa6Rm
 MLOZThXNxysqsHgkJ5w2OareYzNwJYil4oukiKzzOUveAoOzveA1kpswVHPwmLpcU4jknFFmt7P
 mPM+K2MMwm3+eaZWZLUF08Zx8FFUHSbZ153XkYImHUSI6GVylIuAc55w4wCR+knOB5gu+AOwaiJ
 n7T1xMrY+CMJHk6UU3J0eKrJn52EJ/Pz9x8UhFi7XWmoVLv+R1vVURi0DzXMPL5CrpW7+gurZN8
 ZJobbBaB4dEO6tnPwHgayx46CXcBaVi7PXCJAsrqMIu3f3KucecsBneHesmb+fxpptczQfSJgLK
 mWjePVdxSJvy0s4uEIb6Dhp8rK+V35kdsRoOJn9sDT7NHv1G5BmBbA+tr3oQTTfFSCE7QeQ==
X-Received: by 2002:a05:6000:610:b0:439:ba4d:bf40 with SMTP id
 ffacd0b85a97d-439ba4dc256mr9757732f8f.43.1772534903735; 
 Tue, 03 Mar 2026 02:48:23 -0800 (PST)
X-Received: by 2002:a05:6000:610:b0:439:ba4d:bf40 with SMTP id
 ffacd0b85a97d-439ba4dc256mr9757689f8f.43.1772534903240; 
 Tue, 03 Mar 2026 02:48:23 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439b03db76bsm19148913f8f.18.2026.03.03.02.48.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Mar 2026 02:48:22 -0800 (PST)
Message-ID: <f2bb8d0c-5498-4dfb-ac35-8526d8014b26@redhat.com>
Date: Tue, 3 Mar 2026 11:48:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v4 28/31] hw/arm/smmuv3: Select sec-sid from PCI property
 and validate SECURE_IMPL
To: Tao Tang <tangtao1634@phytium.com.cn>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mostafa Saleh <smostafa@google.com>, Chao Liu <chao.liu.zevorn@gmail.com>
References: <20260221100250.2976287-1-tangtao1634@phytium.com.cn>
 <20260221101907.2997408-1-tangtao1634@phytium.com.cn>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260221101907.2997408-1-tangtao1634@phytium.com.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: w4Ci-2pQPO1oWQ6t9fYtW3p-l1wXbYdrlc5kjWiYhlo_1772534904
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.968, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.495,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



On 2/21/26 11:19 AM, Tao Tang wrote:
> Parse each PCI device's sec-sid property during SMMU device initialization
> and cache it in SMMUDevice::sec_sid. Support "non-secure" and "secure",
> default to non-secure when unspecified, and reject invalid values with an
> explicit error. Use sdev->sec_sid in smmuv3_translate() to select the
> register bank instead of hardcoding the non-secure context.
>
> Keep sec-sid parsing in smmu-common, and add a SMMUv3-specific validation
> hook to enforce architectural constraints: fail fast when sec-sid=secure
> while SMMU_S_IDR1.SECURE_IMPL is 0 or secure AS is not available.
>
> Typically, SEC_SID is a system-defined attribute (e.g. sideband or tied-off)
> rather than something a PCIe endpoint can freely toggle in pre-RME scenario.
> So this PCI sec-sid property is used as a static platform/testing knob to
> drive the SMMU bank selection.
>
> For future RME-DA + TDISP, this will need to become dynamic: the effective
> state for PCIe requests is derived from PCIe IDE/TDISP T/XT
> (e.g. SEC_SID = (XT || T) ? Realm : Non-secure), so we'll switch from a
> static property to a runtime per-device state update when that plumbing
> is added.

When a translation is triggered, address_space_translate_iommu passes attrs.
MemTxAttrs.secure bit should tell you whether the translation is
requested in secure mode. 
Shouldn't we pass that information the smmuv3 translate function()?

In address_space_translate_iommu I see:
if (imrc->attrs_to_index) {
   iommu_idx = imrc->attrs_to_index(iommu_mr, attrs);
}

iotlb = imrc->translate(iommu_mr, addr, is_write ?
                          IOMMU_WO : IOMMU_RO, iommu_idx);


Thanks

Eric

>
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> ---
>  hw/arm/smmu-common.c         | 37 ++++++++++++++++++++++++++++++++++++
>  hw/arm/smmuv3.c              | 34 ++++++++++++++++++++++++++++++++-
>  include/hw/arm/smmu-common.h |  2 ++
>  3 files changed, 72 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 5dece2024a4..b0a238abe93 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -21,6 +21,7 @@
>  #include "exec/target_page.h"
>  #include "hw/core/cpu.h"
>  #include "hw/pci/pci_bridge.h"
> +#include "hw/pci/pci_device.h"
>  #include "hw/core/qdev-properties.h"
>  #include "qapi/error.h"
>  #include "qemu/jhash.h"
> @@ -1071,14 +1072,50 @@ SMMUPciBus *smmu_find_smmu_pcibus(SMMUState *s, uint8_t bus_num)
>      return NULL;
>  }
>  
> +static SMMUSecSID smmu_parse_pci_sec_sid(PCIDevice *pdev, int bus_num,
> +                                         int devfn)
> +{
> +    const char *sec_sid;
> +
> +    if (!pdev || !pdev->sec_sid) {
> +        return SMMU_SEC_SID_NS;
> +    }
> +
> +    sec_sid = pdev->sec_sid;
> +    if (!strcmp(sec_sid, "non-secure")) {
> +        return SMMU_SEC_SID_NS;
> +    }
> +    if (!strcmp(sec_sid, "secure")) {
> +        return SMMU_SEC_SID_S;
> +    }
> +
> +    error_report("Invalid sec-sid value '%s' for PCI device %02x:%02x.%x; "
> +                 "allowed values: non-secure or secure (case-sensitive)",
> +                 sec_sid, bus_num, PCI_SLOT(devfn), PCI_FUNC(devfn));
> +    exit(EXIT_FAILURE);
> +}
> +
>  void smmu_init_sdev(SMMUState *s, SMMUDevice *sdev, PCIBus *bus, int devfn)
>  {
>      static unsigned int index;
>      g_autofree char *name = g_strdup_printf("%s-%d-%d", s->mrtypename, devfn,
>                                              index++);
> +    SMMUBaseClass *sbc = ARM_SMMU_GET_CLASS(s);
> +    PCIDevice *pdev;
> +    int bus_num;
> +
>      sdev->smmu = s;
>      sdev->bus = bus;
>      sdev->devfn = devfn;
> +    sdev->sec_sid = SMMU_SEC_SID_NS;
> +
> +    bus_num = pci_bus_num(bus);
> +    pdev = pci_find_device(bus, bus_num, devfn);
> +    sdev->sec_sid = smmu_parse_pci_sec_sid(pdev, bus_num, devfn);
> +    if (sbc->validate_sec_sid &&
> +        !sbc->validate_sec_sid(s, sdev, bus_num)) {
> +        exit(EXIT_FAILURE);
> +    }
>  
>      memory_region_init_iommu(&sdev->iommu, sizeof(sdev->iommu),
>                               s->mrtypename, OBJECT(s), name, UINT64_MAX);
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 0b8ea922851..57a063b5e5d 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -1116,7 +1116,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>      SMMUDevice *sdev = container_of(mr, SMMUDevice, iommu);
>      SMMUv3State *s = sdev->smmu;
>      uint32_t sid = smmu_get_sid(sdev);
> -    SMMUSecSID sec_sid = SMMU_SEC_SID_NS;
> +    SMMUSecSID sec_sid = sdev->sec_sid;
>      SMMUv3RegBank *bank = smmuv3_bank(s, sec_sid);
>      SMMUEventInfo event = {.type = SMMU_EVT_NONE,
>                             .sid = sid,
> @@ -1509,6 +1509,36 @@ static inline bool smmu_hw_secure_implemented(SMMUv3State *s)
>      return FIELD_EX32(s->bank[SMMU_SEC_SID_S].idr[1], S_IDR1, SECURE_IMPL);
>  }
>  
> +static bool smmuv3_validate_sec_sid(SMMUState *bs, SMMUDevice *sdev,
> +                                    int bus_num)
> +{
> +    SMMUv3State *s = ARM_SMMUV3(bs);
> +    bool secure_as_available = bs->secure_memory &&
> +                               bs->secure_memory_as.root != NULL;
> +
> +    if (sdev->sec_sid != SMMU_SEC_SID_S) {
> +        return true;
> +    }
> +
> +    if (!smmu_hw_secure_implemented(s)) {
> +        error_report("Invalid sec-sid value 'secure' for PCI device "
> +                     "%02x:%02x.%x: S_IDR1.SECURE_IMPL is 0, so only "
> +                     "non-secure is allowed",
> +                     bus_num, PCI_SLOT(sdev->devfn), PCI_FUNC(sdev->devfn));
> +        return false;
> +    }
> +
> +    if (!secure_as_available) {
> +        error_report("Invalid sec-sid value 'secure' for PCI device "
> +                     "%02x:%02x.%x: secure-memory address space is not "
> +                     "configured",
> +                     bus_num, PCI_SLOT(sdev->devfn), PCI_FUNC(sdev->devfn));
> +        return false;
> +    }
> +
> +    return true;
> +}
> +
>  static int smmuv3_cmdq_consume(SMMUv3State *s, Error **errp, SMMUSecSID sec_sid)
>  {
>      SMMUState *bs = ARM_SMMU(s);
> @@ -2664,6 +2694,7 @@ static void smmuv3_class_init(ObjectClass *klass, const void *data)
>      DeviceClass *dc = DEVICE_CLASS(klass);
>      ResettableClass *rc = RESETTABLE_CLASS(klass);
>      SMMUv3Class *c = ARM_SMMUV3_CLASS(klass);
> +    SMMUBaseClass *sbc = ARM_SMMU_CLASS(klass);
>  
>      dc->vmsd = &vmstate_smmuv3;
>      resettable_class_set_parent_phases(rc, NULL, NULL, smmu_reset_exit,
> @@ -2673,6 +2704,7 @@ static void smmuv3_class_init(ObjectClass *klass, const void *data)
>      device_class_set_props(dc, smmuv3_properties);
>      dc->hotpluggable = false;
>      dc->user_creatable = true;
> +    sbc->validate_sec_sid = smmuv3_validate_sec_sid;
>  
>      object_class_property_set_description(klass, "accel",
>          "Enable SMMUv3 accelerator support. Allows host SMMUv3 to be "
> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> index d05cf6ae53b..c74f66a1bb9 100644
> --- a/include/hw/arm/smmu-common.h
> +++ b/include/hw/arm/smmu-common.h
> @@ -144,6 +144,7 @@ typedef struct SMMUDevice {
>      void               *smmu;
>      PCIBus             *bus;
>      int                devfn;
> +    SMMUSecSID         sec_sid;
>      IOMMUMemoryRegion  iommu;
>      AddressSpace       as;
>      uint32_t           cfg_cache_hits;
> @@ -204,6 +205,7 @@ struct SMMUBaseClass {
>      /*< public >*/
>  
>      DeviceRealize parent_realize;
> +    bool (*validate_sec_sid)(struct SMMUState *s, SMMUDevice *sdev, int bus_num);
>  
>  };
>  


