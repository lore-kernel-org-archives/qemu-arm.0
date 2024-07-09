Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp3163011njb;
        Tue, 9 Jul 2024 02:12:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUqFR8Vlz9HKyRwGusHw2vDSqp0b7e0nmK2ImrO5pqd6Usf2I03UL1HUROMPyCVPmbdts2Ixi+Re1CPcYmIYZG2VPfFbj+S
X-Google-Smtp-Source: AGHT+IHknl4EIzQGL1FCZ3rClPrMaDTOWMNkLkIyULtr1xvvFtf+T2Oh4b+HwgJiJ9LOhL4a7Rcw
X-Received: by 2002:a25:a04:0:b0:e03:b0aa:9993 with SMTP id 3f1490d57ef6-e041b12aaa7mr2221689276.46.1720516341962;
        Tue, 09 Jul 2024 02:12:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720516341; cv=none;
        d=google.com; s=arc-20160816;
        b=WZzhSbSlhU0le9/RNVOjpmLzba7dwsFCBfQEZUKZJc3iCqFRnTR2avfGUfZsvrghRn
         w0fWr0b3xsohlgJWPMAWAn9qwWF9mPf/Z04XNzAQXIJfbbLMHw8rXKtEdqBP7qcfgKmi
         CboqLtbRX7uitfuaW+EwJpq+oiQdydPVsmNbdBkswkXCKuPyrwcX51UukhJUH55DLz9m
         APRqMWkmq5G1OI/O/EgVMLjZuhgnb10fQu2KGvA/gG9QMnxFnIVDf33WqbYU+Ye8HIJg
         U5AQC9RvAk3CBdLE2KzsEhbg7a+Ua7ijLj2gB0oE8isPYpTpq8xPdvuMR90sGlxA74yB
         LNsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=G4fMyV9ACQGNSgQFmnS/ZcEPttYfp+M7vsy7ITSsO2c=;
        fh=Q4Vb8spkc95frJjoUYMijUN2ZUSDcnSseNUrkBKCgTk=;
        b=WYb53ocfjCLNgWYFo4gYbQk+LOadmmYQ2CvIaobYdzMDqU4uyBNMGFnhcvXR/yDhBk
         O+P7rRKDKZ+yt394IGptggr+vT7Sfbq1Yh7XiNlpLqu4c3b8rnpWpWCcwdDXE0ij3RdH
         2SW1mU0r5HgajBeQhG94lGQfkqW9mf59GJyGBiJT4/Jwckm/BH7XyFznKL1Nrw3mEkn6
         2nquXWqS/oVV2DKQ1Rn9IHsPEsKGhkh2tqZEgn7Hdh73a8iirHOjQYzJMV5w7uyYLasy
         sxc7dCQ2a+kwUdGgPoaJUl/WANhWyVV4FuaeeafV/XP2u3Wbb6rx2H2GEN933t/pdsi0
         0qKg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HepmUMaY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79f1909f2a0si186041085a.251.2024.07.09.02.12.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jul 2024 02:12:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HepmUMaY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sR6tR-0003Ff-O4; Tue, 09 Jul 2024 05:12:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sR6tO-00031t-Cr
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 05:12:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sR6tJ-0000Pw-Nq
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 05:12:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720516324;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G4fMyV9ACQGNSgQFmnS/ZcEPttYfp+M7vsy7ITSsO2c=;
 b=HepmUMaYys9Dq7U/vNK3SEzQ0di84xOrsaYbJq+wAh6EZ2l7PBRLcL+Nw2Q/EnsI17kti1
 P4CWOxrBYY4e4vqdp26S35HilyORrLZ2zd3PmuJBjmKcNPpnJ3rBjP9q6qo8Bcwqw2pROQ
 gMhGbNoUKE/ZTV8e0wzbrOshm/YLgKI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-137-QVRqE9kmPiKZAHVpX6mGmQ-1; Tue, 09 Jul 2024 05:12:00 -0400
X-MC-Unique: QVRqE9kmPiKZAHVpX6mGmQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-426624f4ce3so15195955e9.1
 for <qemu-arm@nongnu.org>; Tue, 09 Jul 2024 02:12:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720516319; x=1721121119;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=G4fMyV9ACQGNSgQFmnS/ZcEPttYfp+M7vsy7ITSsO2c=;
 b=V2ZRTCezDr5qDHgTPeHRYT3LXk3pjO6S5KBnzNaMl+0BmNQRHMsVLcOcLXH4UIYPZa
 SccFiXmqW9lKWX62+ZeZrbfZHo8X4Jt7kcficonzk/4O7DhvBPZrjv3i7aah3GmpeXJs
 JyFN9Ag4tQEAzC3rrcYuhID94bMHQgJDqdr1soNLB4hIc5OjKbU3NDE7DUrj2SHTodFF
 01354rp9kXxE7maH6AZk9dD8vgMuknpQFcrxEbh7OmKESPAwNKuvkpVKkzP+ighoC09r
 gmO7d0XFL7XgHCqlFZFQ+HKTbCbwQihjlBGEjps+44egwDH0cZXeW/D1CmrUMwNUh4Ga
 /l3w==
X-Gm-Message-State: AOJu0YwzCcMlQQ37rB5bKregcI1f+Wq1KOyDXolwcwCV25NetqRVe2fe
 WCZqoqwQh/oh819RUCRYmrPKw0h5GrzNDPCln7DU8LU2UsfBgW07wuKN37Sd+uByYDmIJIGjfJo
 OYrgxLmSDfyliku3FR8t4WEyZ51sHKoHKKBcnCBah3qDmavztJA==
X-Received: by 2002:a05:600c:6dc5:b0:426:5b84:86d2 with SMTP id
 5b1f17b1804b1-426707e32a0mr14183565e9.20.1720516319172; 
 Tue, 09 Jul 2024 02:11:59 -0700 (PDT)
X-Received: by 2002:a05:600c:6dc5:b0:426:5b84:86d2 with SMTP id
 5b1f17b1804b1-426707e32a0mr14183475e9.20.1720516318807; 
 Tue, 09 Jul 2024 02:11:58 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4266f6e0b19sm30907835e9.2.2024.07.09.02.11.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jul 2024 02:11:58 -0700 (PDT)
Message-ID: <efec2974-ce96-4cb1-a00c-30fe93c5fa7b@redhat.com>
Date: Tue, 9 Jul 2024 11:11:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFCv1 02/10] hw/arm/virt: Add iommufd link to virt-machine
To: Nicolin Chen <nicolinc@nvidia.com>, peter.maydell@linaro.org,
 shannon.zhaosl@gmail.com, mst@redhat.com, imammedo@redhat.com,
 anisinha@redhat.com, peterx@redhat.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, jgg@nvidia.com,
 shameerali.kolothum.thodi@huawei.com, jasowang@redhat.com
References: <cover.1719361174.git.nicolinc@nvidia.com>
 <df22fcd43e201fea97da8862b61614a2986ffa5e.1719361174.git.nicolinc@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <df22fcd43e201fea97da8862b61614a2986ffa5e.1719361174.git.nicolinc@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.142,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: E/GCSiRH9peP

Hi Nicolin,

On 6/26/24 02:28, Nicolin Chen wrote:
> A nested SMMU must use iommufd ioctls to communicate with the host-level
> SMMU instance for 2-stage translation support. Add an iommufd link to the
> ARM virt-machine, allowing QEMU command to pass in an iommufd object.
If I am not wrong vfio devices are allowed to use different iommufd's
(although there is no real benefice). So this command line wouldn't
match with that option.
Also while reading the commit msg it is not clear with the iommufd is
needed in the machine whereas the vfio iommufd BE generally calls those
ioctls.

Thanks

Eric
>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  hw/arm/virt.c         | 14 ++++++++++++++
>  include/hw/arm/virt.h |  2 ++
>  2 files changed, 16 insertions(+)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 78af2d2195..71093d7c60 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1404,6 +1404,13 @@ static void create_smmu(const VirtMachineState *vms,
>  
>      object_property_set_link(OBJECT(dev), "primary-bus", OBJECT(bus),
>                               &error_abort);
> +
> +    if (vms->iommu == VIRT_IOMMU_NESTED_SMMUV3) {
> +        g_assert(vms->iommufd);
> +        object_property_set_link(OBJECT(dev), "iommufd", OBJECT(vms->iommufd),
> +                                 &error_abort);
> +        object_property_set_bool(OBJECT(dev), "nested", true, &error_abort);

> +    }
>      sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>      sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
>      for (i = 0; i < NUM_SMMU_IRQS; i++) {
> @@ -3114,6 +3121,13 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>                                            "Set GIC version. "
>                                            "Valid values are 2, 3, 4, host and max");
>  
> +    object_class_property_add_link(oc, "iommufd", TYPE_IOMMUFD_BACKEND,
> +                                   offsetof(VirtMachineState, iommufd),
> +                                   object_property_allow_set_link,
> +                                   OBJ_PROP_LINK_STRONG);
> +    object_class_property_set_description(oc, "iommufd",
> +                                          "Set the IOMMUFD handler from \"-iommufd\"");
> +
>      object_class_property_add_str(oc, "iommu", virt_get_iommu, virt_set_iommu);
>      object_class_property_set_description(oc, "iommu",
>                                            "Set the IOMMU type. "
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 7df0813e28..d5cbce1a30 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -36,6 +36,7 @@
>  #include "hw/arm/boot.h"
>  #include "hw/arm/bsa.h"
>  #include "hw/block/flash.h"
> +#include "sysemu/iommufd.h"
>  #include "sysemu/kvm.h"
>  #include "hw/intc/arm_gicv3_common.h"
>  #include "qom/object.h"
> @@ -154,6 +155,7 @@ struct VirtMachineState {
>      bool dtb_randomness;
>      OnOffAuto acpi;
>      VirtGICType gic_version;
> +    IOMMUFDBackend *iommufd;
>      VirtIOMMUType iommu;
>      bool default_bus_bypass_iommu;
>      VirtMSIControllerType msi_controller;

