Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70BBCEC1423
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Mar 2026 10:48:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vxNIO-0002z4-1U; Tue, 03 Mar 2026 05:48:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vxNIF-0002y3-Fs
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 05:47:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vxNIC-000439-1u
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 05:47:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772534874;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nEHegAVxKlLHUxF47/TrSWe3AW8x3xWT9xEVTACOVdc=;
 b=Z0Dw01H9QoT0jN097N0gjzLi81tasNe+32wHxa8rGpGNkoeoyflMlX84IiKWz8EW7jtYw8
 ixoGV/GKy3rTVqiXd9kvq5ahjn1We4FGwm922dl7+8BYSkH2mer3vgg3p9g6P9nZxsqKr5
 fVcVbKqf1MI23z/N6FWFmW8V9iOufqQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-5uMbvtLrPm6K22nk1tdMCw-1; Tue, 03 Mar 2026 05:47:51 -0500
X-MC-Unique: 5uMbvtLrPm6K22nk1tdMCw-1
X-Mimecast-MFC-AGG-ID: 5uMbvtLrPm6K22nk1tdMCw_1772534870
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-43993fea282so5729920f8f.0
 for <qemu-arm@nongnu.org>; Tue, 03 Mar 2026 02:47:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772534870; x=1773139670;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nEHegAVxKlLHUxF47/TrSWe3AW8x3xWT9xEVTACOVdc=;
 b=v3UWxZ8UHr2/JEvJWP9GaDR0J8rsdTzXOvWP44UAfaW5I2ASrL0ukaVzwKd899vCrX
 kPQtx6ieLyl75s/VXnvlWp/8QAqO5QoYoGegLfSQbzSmM5q0b4ZpoOmgIBe2kMFWcEky
 ZEdU0Hw93RcybNxUezAdD5rQlX3WP13b4Qnk03H86y3SEz/BRSr8KsnNd9vPmBA4dG0V
 T3kSIhQWKudlCmKgSTBau/wFgIz/7NAWFhQnEzZQlcckQtRKBVQW4cwGOCLbyMiVPBgJ
 VXuniYUsSktlO7ero9BcVRpz6l+Wxg6T+qwOPTRU1i4mAYq6a0GHTe0vvYgUBx7v0GN4
 TRbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUi0db009wM5waY/J8BtxlFATBrN6aGR5gckoMXJNFAnjsifVS54SlrKbBGtG5omwN2rlMtoe/QTg==@nongnu.org
X-Gm-Message-State: AOJu0YxkbQ4PViVZNKqjp+bszv3CO8py0dXGQxHvPR3Pou3lqBIkQ/W7
 5ThHbR5Ge/ipYEdZZHQzctQBRpZtlZlb5an8ubmd5Sq94haeMgUJPS2LcEZ7zUJY9xU2hP86TdI
 isGHn0HcdHiNCZzH8Tx5VFXQKrpKGmMiNS2d9t+lZaM28d+3BgQCgLQ==
X-Gm-Gg: ATEYQzzwYe1renxJJYpJA5tPTXHwFSrmj4AkEa52RR3spWmz0Qi3QkcJ8C4gzJDIyZ4
 2hn5P5k2jSw2Ir6cGWl09yTQnWT3WNy7XH1ZswN/Qbb3lNph5w2vKf+au/+QLRtqbQ8phi1BflD
 uCAQZxrFmJ6oecJr3oUZdK6ltzK4dpepeMi1m80hIGSi9vmHvVa/UmgTmTAxYjpuKCdumnKH+0e
 39joRF8BzMw5w/f4PSSIYDs65ZEK664x0bJWmG5dz74kt4H5E8IYkVo86wXZAW/CrG9oOw+Xq80
 6BBYern7GfFBasG+TtxMNW3VZL0xGYUGk9vZe8niDSralTemIErU8AG/Nb7RSmgh6cKQ983zYlD
 9dxoi6E0URt3mVSqp9R+aqDGk4OukFI+sRBBADbwv36yGp1CE9Fdn6yS3QJALdlVl+i0QYA==
X-Received: by 2002:a05:6000:2007:b0:437:6dc8:c372 with SMTP id
 ffacd0b85a97d-4399de194e5mr28550858f8f.38.1772534870210; 
 Tue, 03 Mar 2026 02:47:50 -0800 (PST)
X-Received: by 2002:a05:6000:2007:b0:437:6dc8:c372 with SMTP id
 ffacd0b85a97d-4399de194e5mr28550806f8f.38.1772534869692; 
 Tue, 03 Mar 2026 02:47:49 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4399c75a25dsm33428257f8f.21.2026.03.03.02.47.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Mar 2026 02:47:49 -0800 (PST)
Message-ID: <ac35d3e8-c1a6-4f2b-9a96-88f802299bae@redhat.com>
Date: Tue, 3 Mar 2026 11:47:47 +0100
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
X-Mimecast-MFC-PROC-ID: HfDc3IX727-pVlzgtZG3-bUCNyT6gWN0oH0sByWmrgc_1772534870
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


