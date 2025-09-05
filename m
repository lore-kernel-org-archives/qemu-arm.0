Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 609FFCA1015
	for <qemu-arm@archiver.kernel.org>; Fri,  5 Sep 2025 08:50:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uuS8p-0007LX-0n; Fri, 05 Sep 2025 04:49:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uuS8i-0007Hb-Ik
 for qemu-arm@nongnu.org; Fri, 05 Sep 2025 04:49:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uuS8d-0001Lq-22
 for qemu-arm@nongnu.org; Fri, 05 Sep 2025 04:49:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757062179;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=66e5B7zvSFLQHnxFRBirIlHQsN7RL6vMUZZe+5Ont50=;
 b=gjhW3GqKr/8zow/qTWMxLHmR5l+nEVyMY1LD/zgGDgJvWjvh5ZDzGxLtGsP+FWBRWiqFYv
 fhDMSdyF5/R5R9L/e+SkrlFbdc2yRXfNWET56ZfjkiIq+R6u8dhW4/gpXAAfMEJZkSXXWV
 fQ8UXGyk/ShygffpLqVI95LghgU6qyU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-225-sqZtWATYMo2neawxwfQiPg-1; Fri, 05 Sep 2025 04:49:38 -0400
X-MC-Unique: sqZtWATYMo2neawxwfQiPg-1
X-Mimecast-MFC-AGG-ID: sqZtWATYMo2neawxwfQiPg_1757062177
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3e26b5e3f41so510387f8f.1
 for <qemu-arm@nongnu.org>; Fri, 05 Sep 2025 01:49:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757062177; x=1757666977;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=66e5B7zvSFLQHnxFRBirIlHQsN7RL6vMUZZe+5Ont50=;
 b=CrwaF82P0Wb8p0am3QWkr6YqO+ECN1oPhC2iv7ouyBZrS+wwxa5xtoE+JpfWsk1muf
 dHcESC9KGrDkZNUmc2ANrYdj2f1KZ7f6nTbLggEMskRtqvqOdEd+ff6xRn2j1/QhMfAh
 Lwr/Wahb7Tk33Vvhc4AeL+l+5ByrXy2RMueHPWUIRVs1nutq2k88wH4mYw7Rz3f4RbIn
 Ae36bRepsVeVwf3o44corDWEOiRFq2KRSxXvJm2HPhvWhuM9mHiZS+su/Fa1znqTPVCh
 yIt6Kkk08Fp9/ojRmyrqLX3/kZAA5pc8FgSpxYV/m9GJoG9Chyp8ir6NNplb5jfHJcTL
 PPCA==
X-Gm-Message-State: AOJu0Yz2QZjsrcf5dRFc7YsWXVG2ZnvIGogt07QmhCMj1sQvFnU0MfuN
 yQ50d/7T2lLal86GL4mTItDEz94TvFCqnaGZs+1gIIBfd90wCbRYo06RAEk1tE8jIt4ImvSCrmd
 fzbsAjvqVE65OGncvOvsFnV7iJD9vd8isWIxaKtJOslEu8mgPG+sFGN//OOeKclHtkNb4csmTIP
 Oa6I4nWI7gUckdXzx0O0d4fZ0S8KukWeECGb5GAijwB5w=
X-Gm-Gg: ASbGnct19x1oKG/Se1RZ0D0UhoOItHKJ/3Y0bydrj7YeJRZifQr01jDCpoirP0sIc5u
 7R3U3RM6u7sAdudQgl03MAT97LgHXGLJN3IRH9S2UuSCNDFRonl8iKxqA6dNow+cxRZcnXn37hD
 6mcakvaKN9POZhUn+1GhFuCnwGUIYJPdTHftDz/GAsYeugxPtu9NE4BYyCgw4j21eG/o7faODOF
 9In76mEyW19IgFZMxD2ktKbGmGmrIQKVyj2SIU7VPT5NUgn1i6CMVnk0Pa0o6HV8NEdOF3p7JJa
 DAfiCIqCD//5v6lUhzrCmrwLTgRXuS2aM8H6Goq7hJ+ZzIKIa0+xmOTT6SZQEvSojJ7P9gb7XKZ
 JudBTjZvm8uE=
X-Received: by 2002:a05:6000:1887:b0:3e2:4a3e:d3cf with SMTP id
 ffacd0b85a97d-3e24a3ef8a9mr3609690f8f.5.1757062176686; 
 Fri, 05 Sep 2025 01:49:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjfSgfUWunXZYrQGkFKNoLx5I9ZoNnZfHKUCbzmpIxoKVO6QZE0MCAg8LAK2Uss/T2uYGKJg==
X-Received: by 2002:a05:6000:1887:b0:3e2:4a3e:d3cf with SMTP id
 ffacd0b85a97d-3e24a3ef8a9mr3609656f8f.5.1757062176154; 
 Fri, 05 Sep 2025 01:49:36 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3d701622b92sm19391101f8f.58.2025.09.05.01.49.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Sep 2025 01:49:34 -0700 (PDT)
Message-ID: <b13d3596-1498-462d-ab2c-1a626f050dbe@redhat.com>
Date: Fri, 5 Sep 2025 10:49:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 07/15] hw/arm/smmuv3: Implement get_viommu_cap()
 callback
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org, skolothumtho@nvidia.com
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, linuxarm@huawei.com,
 wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, zhangfei.gao@linaro.org,
 zhenzhong.duan@intel.com, shameerkolothum@gmail.com
References: <20250714155941.22176-1-shameerali.kolothum.thodi@huawei.com>
 <20250714155941.22176-8-shameerali.kolothum.thodi@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250714155941.22176-8-shameerali.kolothum.thodi@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HervNLE_sw5PtaTcoKi47Y-N8goi0R4O5ar6DebrYro_1757062177
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



On 7/14/25 5:59 PM, Shameer Kolothum wrote:
> For accelerated SMMUv3, we need nested parent domain creation. Add the
> callback support so that VFIO can create a nested parent.
>
> Since 'accel=on' for SMMUv3 requires the guest SMMUv3 to be configured
> in Stage 1 mode, ensure that the 'stage' property is explicitly set to
> Stage 1.
nit: strictly speaking couldn't we have a stage2 being used at guest
level implemented by a stage1 at physical level?
but it is totally fair to restrict the support.
>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>  hw/arm/smmuv3-accel.c | 15 +++++++++++++++
>  hw/arm/virt.c         | 12 ++++++++++++
>  2 files changed, 27 insertions(+)
>
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> index 0b0ddb03e2..66cd4f5ece 100644
> --- a/hw/arm/smmuv3-accel.c
> +++ b/hw/arm/smmuv3-accel.c
> @@ -10,6 +10,7 @@
>  #include "qemu/error-report.h"
>  
>  #include "hw/arm/smmuv3.h"
> +#include "hw/iommu.h"
>  #include "hw/pci/pci_bridge.h"
>  #include "hw/pci-host/gpex.h"
>  #include "hw/vfio/pci.h"
> @@ -81,8 +82,22 @@ static AddressSpace *smmuv3_accel_find_add_as(PCIBus *bus, void *opaque,
>      }
>  }
>  
> +static uint64_t smmuv3_accel_get_viommu_cap(void *opaque)
> +{
> +    /*
> +     * Accelerated smmuv3 support only allowes Guest S1
> +     * configuration. Hence report VIOMMU_CAP_STAGE1
> +     * so that VFIO can create nested parent domain.
> +     * The real nested support should be reported from host
the actual nested support at host level will be queried from the host
later on?
> +     * SMMUv3 and if it doesn't, the nested parent allocation
> +     * will fail anyway.
> +     */
> +    return VIOMMU_CAP_STAGE1;
> +}
> +
>  static const PCIIOMMUOps smmuv3_accel_ops = {
>      .get_address_space = smmuv3_accel_find_add_as,
> +    .get_viommu_cap = smmuv3_accel_get_viommu_cap,
>  };
>  
>  void smmuv3_accel_init(SMMUv3State *s)
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 22393cf39e..fdb47eda6a 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -3053,6 +3053,18 @@ static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
>                  return;
>              }
>  
> +            if (object_property_get_bool(OBJECT(dev), "accel", &error_abort)) {
> +                char *stage;
> +
> +                stage = object_property_get_str(OBJECT(dev), "stage",
> +                                                &error_fatal);
> +                if (*stage && strcmp("1", stage)) {
I am not sure you need to check *stage
> +                    error_setg(errp, "Only stage1 is supported for SMMUV3 with "
> +                               "accel=on");
> +                    return;
> +                }
> +            }
> +
>              create_smmuv3_dev_dtb(vms, dev, bus);
>          }
>      }
Thanks

Eric


