Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F2E9CCF9E0
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Oct 2025 10:46:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDKkT-0003qn-G1; Mon, 27 Oct 2025 06:46:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vDKkO-0003ne-Ul
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 06:46:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vDKkL-0002OQ-Fj
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 06:46:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761561999;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FmCI4CFlIlpO5XbDp8FpQdT99z9xtBk9MdxOfGMxWDQ=;
 b=O1LSS1LE14M2HTsHeDeZEiQFArjjwPUlIBIjofCdfmZNa930+tnp3yIL8lhxzmfGAhZja+
 N+WSc/SQvwXGToBGJ2B4gXh8gZP4PkKvcWYvQVb6bEH5UwQDUHF3KVU306yxSy7jcIHDhL
 Y6p2KqgK5BHR2D82w8wuAqZUqygyTEA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-241-yDLh7x5TMBG3yOOMdMIRDg-1; Mon, 27 Oct 2025 06:46:36 -0400
X-MC-Unique: yDLh7x5TMBG3yOOMdMIRDg-1
X-Mimecast-MFC-AGG-ID: yDLh7x5TMBG3yOOMdMIRDg_1761561995
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-47105bfcf15so25554875e9.2
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 03:46:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761561995; x=1762166795;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FmCI4CFlIlpO5XbDp8FpQdT99z9xtBk9MdxOfGMxWDQ=;
 b=HrhwO1hH217mumljyrOXgJmJw0ktgKVKciziBCRCQVFxVlUz9ZiMjbeoJzHr3IZsxk
 1ZjmRrf8T0noI3a/Rc1Kp54ZmxPMIWV18tkoue+Rhq8sQ7VS0CQ4aXIT4wKqjFkfU6no
 EnMSvzUjda6dpu74ds99jUxFcc7JSu2Q5sGiTDXsahBkgQneelM10PStH39AU6wjwKJ6
 gOERnGPbOBlqFR4Ul74N7PURlR6hxOXEy2cTulnJ30t3B/8DoEB5ObJ5gNmQVk/tRs8M
 SMlD9jiHBMUchq7xFjGBsxBn7IOEyvPCKU7GAWOpXXynLv9bXgbQEzYQh9OpFCOYkeyT
 FAcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8D5qw8NqIbY8D1cjwKwdQ9kIak2PwTI2s4n1ynSaXhpWumz3QSElx+8wGHFlta+F64mgOYJ/gtw==@nongnu.org
X-Gm-Message-State: AOJu0Yx01qauzo3VwhBxG6DJFODjErbHvGijUK7sNVuQzLi46VuBsvRz
 56InQRdkr7fut4zClwikLjeMXqMhzECPsClvNImb0aBhXN7BwsT/NLjAtk4E9is5VefUh6Rt0sq
 5vOt09SgANeVQbrRpLgpnkczSKU2x8kIbrZdJV9eaqSAvXLIOqTa+fw==
X-Gm-Gg: ASbGncvxRV2t4ZZ8k+VyJErN49PKfoK72WsgbSSS5mdP8hYdetuRRjXmxJlbEyqFyQh
 tz79jzT+F5k5NwqR19TGxRO0lgweHKWgY58OeyDcG776njaaq+Z8R57seCIzqcgL58fN34+Iv/t
 qfHsR6vEFOBt3LvGNGLHYMP/ndR7KzQnxENUP89RZJOoXzZzHz3tSv4/smra1TfERArsyBuyRut
 RpSST/ux6Yz5QV6LP0YT1M2DyokDqp+w7DDY3qmv4HyUW0UwHraeYML1nyDwyv/ECHQzuO8ZSZo
 brklZ8lcr476RvegxhsMU3ocPCUZPOM+mDsrzJ2DXvKNwobsJ9pUw0ZvWSuKZ9CuIxlyPz9gQtQ
 4CoZJAOA1P6Os1qLwibBGel7yfAPt0HnXlThuf6nn9RbPRw==
X-Received: by 2002:a05:600c:3b8d:b0:45d:f81d:eae7 with SMTP id
 5b1f17b1804b1-471179176b9mr325877945e9.28.1761561995326; 
 Mon, 27 Oct 2025 03:46:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5dRTaE6QJAVnzFty1GjXpeTc/xnv2a0oHeAoTrpETA0dawahkIRzTlpgo9g7HOPmIRHqhzA==
X-Received: by 2002:a05:600c:3b8d:b0:45d:f81d:eae7 with SMTP id
 5b1f17b1804b1-471179176b9mr325877455e9.28.1761561994803; 
 Mon, 27 Oct 2025 03:46:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dd489e6dsm128426165e9.6.2025.10.27.03.46.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 03:46:34 -0700 (PDT)
Message-ID: <46292ce1-e930-4ae8-97fe-626ed2e4d3c4@redhat.com>
Date: Mon, 27 Oct 2025 11:46:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 14/27] hw/arm/smmuv3-accel: Get host SMMUv3 hw info and
 validate
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, wangzhou1@hisilicon.com,
 jiangkunkun@huawei.com, jonathan.cameron@huawei.com,
 zhangfei.gao@linaro.org, zhenzhong.duan@intel.com, yi.l.liu@intel.com,
 shameerkolothum@gmail.com
References: <20250929133643.38961-1-skolothumtho@nvidia.com>
 <20250929133643.38961-15-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250929133643.38961-15-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CE6c8gyNzSSnwnwGkoOMVYqzPlfpwsVvNb0GdQP6d0w_1761561995
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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



On 9/29/25 3:36 PM, Shameer Kolothum wrote:
> Just before the device gets attached to the SMMUv3, make sure QEMU SMMUv3
> features are compatible with the host SMMUv3.
>
> Not all fields in the host SMMUv3 IDR registers are meaningful for userspace.
> Only the following fields can be used:
>
>   - IDR0: ST_LEVEL, TERM_MODEL, STALL_MODEL, TTENDIAN, CD2L, ASID16, TTF
>   - IDR1: SIDSIZE, SSIDSIZE
>   - IDR3: BBML, RIL
>   - IDR5: VAX, GRAN64K, GRAN16K, GRAN4K
>
> For now, the check is to make sure the features are in sync to enable
> basic accelerated SMMUv3 support.
>
> One other related change is, move the smmuv3_init_regs() to smmu_realize()
> so that we do have that early enough for the check mentioned above.
>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  hw/arm/smmuv3-accel.c | 98 +++++++++++++++++++++++++++++++++++++++++++
>  hw/arm/smmuv3.c       |  4 +-
>  2 files changed, 100 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> index 9ad8595ce2..defeddbd8c 100644
> --- a/hw/arm/smmuv3-accel.c
> +++ b/hw/arm/smmuv3-accel.c
> @@ -39,6 +39,96 @@
>  #define STE1_MASK     (STE1_ETS | STE1_S1STALLD | STE1_S1CSH | STE1_S1COR | \
>                         STE1_S1CIR | STE1_S1DSS)
>  
> +static bool
> +smmuv3_accel_check_hw_compatible(SMMUv3State *s,
> +                                 struct iommu_hw_info_arm_smmuv3 *info,
> +                                 Error **errp)
> +{
> +    uint32_t val;
> +
> +    /*
> +     * QEMU SMMUv3 supports both linear and 2-level stream tables.
> +     */
> +    val = FIELD_EX32(info->idr[0], IDR0, STLEVEL);
> +    if (val != FIELD_EX32(s->idr[0], IDR0, STLEVEL)) {
> +        s->idr[0] = FIELD_DP32(s->idr[0], IDR0, STLEVEL, val);
> +        error_setg(errp, "Host SUMMUv3 differs in Stream Table format");
> +        return false;
> +    }
> +
> +    /* QEMU SMMUv3 supports only little-endian translation table walks */
> +    val = FIELD_EX32(info->idr[0], IDR0, TTENDIAN);
> +    if (!val && val > FIELD_EX32(s->idr[0], IDR0, TTENDIAN)) {
> +        error_setg(errp, "Host SUMMUv3 doesn't support Little-endian "
> +                   "translation table");
> +        return false;
> +    }
> +
> +    /* QEMU SMMUv3 supports only AArch64 translation table format */
> +    val = FIELD_EX32(info->idr[0], IDR0, TTF);
> +    if (val < FIELD_EX32(s->idr[0], IDR0, TTF)) {
> +        error_setg(errp, "Host SUMMUv3 deosn't support Arch64 Translation "
> +                   "table format");
> +        return false;
> +    }
> +
> +    /* QEMU SMMUv3 supports SIDSIZE 16 */
> +    val = FIELD_EX32(info->idr[1], IDR1, SIDSIZE);
> +    if (val < FIELD_EX32(s->idr[1], IDR1, SIDSIZE)) {
> +        error_setg(errp, "Host SUMMUv3 SIDSIZE not compatible");
> +        return false;
> +    }
> +
> +    /* QEMU SMMUv3 supports Range Invalidation by default */
> +    val = FIELD_EX32(info->idr[3], IDR3, RIL);
> +    if (val != FIELD_EX32(s->idr[3], IDR3, RIL)) {
> +        error_setg(errp, "Host SUMMUv3 deosn't support Range Invalidation");
> +        return false;
> +    }
> +
> +    val = FIELD_EX32(info->idr[5], IDR5, GRAN4K);
> +    if (val != FIELD_EX32(s->idr[5], IDR5, GRAN4K)) {
> +        error_setg(errp, "Host SMMUv3 doesn't support 64K translation granule");
> +        return false;
> +    }
> +    val = FIELD_EX32(info->idr[5], IDR5, GRAN16K);
> +    if (val != FIELD_EX32(s->idr[5], IDR5, GRAN16K)) {
> +        error_setg(errp, "Host SMMUv3 doesn't support 16K translation granule");
> +        return false;
> +    }
> +    val = FIELD_EX32(info->idr[5], IDR5, GRAN64K);
> +    if (val != FIELD_EX32(s->idr[5], IDR5, GRAN64K)) {
> +        error_setg(errp, "Host SMMUv3 doesn't support 16K translation granule");
> +        return false;
> +    }
> +    return true;
> +}
> +
> +static bool
> +smmuv3_accel_hw_compatible(SMMUv3State *s, HostIOMMUDeviceIOMMUFD *idev,
> +                           Error **errp)
> +{
> +    struct iommu_hw_info_arm_smmuv3 info;
> +    uint32_t data_type;
> +    uint64_t caps;
> +
> +    if (!iommufd_backend_get_device_info(idev->iommufd, idev->devid, &data_type,
> +                                         &info, sizeof(info), &caps, errp)) {
> +        return false;
> +    }
> +
> +    if (data_type != IOMMU_HW_INFO_TYPE_ARM_SMMUV3) {
> +        error_setg(errp, "Wrong data type (%d) for Host SMMUv3 device info",
> +                     data_type);
> +        return false;
> +    }
> +
> +    if (!smmuv3_accel_check_hw_compatible(s, &info, errp)) {
> +        return false;
> +    }
> +    return true;
> +}
> +
>  static bool
>  smmuv3_accel_alloc_vdev(SMMUv3AccelDevice *accel_dev, int sid, Error **errp)
>  {
> @@ -363,6 +453,14 @@ static bool smmuv3_accel_set_iommu_device(PCIBus *bus, void *opaque, int devfn,
>          return true;
>      }
>  
> +    /*
> +     * Check the host SMMUv3 associated with the dev is compatible with the
> +     * QEMU SMMUv3 accel.
> +     */
> +    if (!smmuv3_accel_hw_compatible(s, idev, errp)) {
> +        return false;
> +    }
> +
>      if (!smmuv3_accel_dev_alloc_viommu(accel_dev, idev, errp)) {
>          error_setg(errp, "Device 0x%x: Unable to alloc viommu", sid);
>          return false;
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 3963bdc87f..5830cf5a03 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -1913,8 +1913,6 @@ static void smmu_reset_exit(Object *obj, ResetType type)
>      if (c->parent_phases.exit) {
>          c->parent_phases.exit(obj, type);
>      }
> -
> -    smmuv3_init_regs(s);
does that work on reset()? Besides setting idr regs, smmuv3_init_regs() also
resets the cmdq and eventq plus a bunch of dynamic registers. That needs
to happen on reset I think.

Eric
>  }
>  
>  static void smmu_realize(DeviceState *d, Error **errp)
> @@ -1945,6 +1943,8 @@ static void smmu_realize(DeviceState *d, Error **errp)
>      sysbus_init_mmio(dev, &sys->iomem);
>  
>      smmu_init_irq(s, dev);
> +
> +    smmuv3_init_regs(s);
>  }
>  
>  static const VMStateDescription vmstate_smmuv3_queue = {


