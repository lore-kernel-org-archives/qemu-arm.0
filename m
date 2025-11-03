Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D627CCFA04
	for <qemu-arm@archiver.kernel.org>; Mon,  3 Nov 2025 16:56:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vFxqR-0004Js-MH; Mon, 03 Nov 2025 11:55:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vFxqQ-0004JJ-1j
 for qemu-arm@nongnu.org; Mon, 03 Nov 2025 11:55:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vFxpy-0004uz-V9
 for qemu-arm@nongnu.org; Mon, 03 Nov 2025 11:55:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762188918;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X2cAERQ/ID0qu6QDCSNNv+8p4SV0o7TWZjUbVHbwT8c=;
 b=fTMI6jt6t+SsSqh3zG1IFBtn9/WLsv9iuPTaGwn35qpM5NWyc/ItlUAh29tPovEYSsrW0i
 ypgRHF/xhV9dhtPrkiU6UovPm5hvd6ydH1wZPlMP9gRif51nFQL525ionG9zEJeh4QBy/L
 F1zRgtwInQ5fFxg6nkHCRQq16itc3+Y=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-358-VLlB8Mb4N0C1wouDk1XWvw-1; Mon, 03 Nov 2025 11:55:17 -0500
X-MC-Unique: VLlB8Mb4N0C1wouDk1XWvw-1
X-Mimecast-MFC-AGG-ID: VLlB8Mb4N0C1wouDk1XWvw_1762188917
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-47740c1442dso15293425e9.1
 for <qemu-arm@nongnu.org>; Mon, 03 Nov 2025 08:55:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762188916; x=1762793716;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X2cAERQ/ID0qu6QDCSNNv+8p4SV0o7TWZjUbVHbwT8c=;
 b=nJp+wLPKPZgi/sIkCeC1MjNbfsAkF7l7evFpDMV8Yd194AHovMFoPtDfdu+gpWQDfn
 utJTFq95m12aWAFX/zdleyrUCNRoMInzSrXh1yBf0PAXr6qYGFlTTy2RvLBC1CxU3DPA
 jvHD4LBFKkCZaKGJ64qgm7RmJkgQ+f/wNqfvhg6pLspnivy9xTvw1xwFRVTzEITb+Hrf
 hgFXl+WoB8VlPScG/AgdHbjJv15ZgQg4TY6y9XkI0cyfTCUw0Iq9dMV00Nho1xclYodw
 TZgAja7Q5dAq8sfGtt2OLEXLNiB9xhdvHMcJou7P+5cnxK0B64JkQVOcfPNgv5Tookrr
 BHrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXziRMb8uukHOhxhJuXe8BLMpSZI795bVRhTzKNXzuw8VRyv0iVdKmgdNnHm4OV1hb9Ml94SrKUqg==@nongnu.org
X-Gm-Message-State: AOJu0Yxkyo6gKcZFQnMTd3rf9zl46Hccxthmkd+KJMhgb3y48IN4gdTs
 g73UnDJD2fO/MJolAcCU0BLxhoPpIJWayu/PR6V7DM/3IWP7MeEBwwFT1xvdo7IzPLlXn+s7iN9
 CKzYGEbL7VzDVL0ag8pyXA1+2o+iwiJneNtq+AJp9vKKC/XlmrlwCsA==
X-Gm-Gg: ASbGncu05t7IQpLjInSjhTptQqmXEQIuz+4QJ8jJq9CM4JBqNBRbI2o+m6DOD5haV7l
 3yJ1cuFHTymszoReo4yfO5QFsd4ubdB6K2eLqvBmydmthkSIUGkRn1JCWxmkeCPk2nyqz+V6PDy
 L+TqzaBBN3C5mjlPR6fEQGX+A+iQ/AJjKb53gXR5rqyf7WSM3IiRRctIruRWRQnAZwAfe3FEsSM
 4o+WLoCwn72galhBAv/HPKXYRAI5l838SVRno1yJ88jKR2xLhinCS7SKBPCYgTyz6AnOwhW3HGP
 XzE3SxiUhJZ+hLd2SzoZ8J+B5aG/uMUf+QEdo+IA7JDs3ZZ8aTEpwC4a4MFguIPE5p1u5Z4YaB7
 CaCm9ilAPnz7xc/j/0/dDmMiD0nFSdZHjO65HlGM5p/jK3Q==
X-Received: by 2002:a05:600c:3b1f:b0:45d:d505:a1c3 with SMTP id
 5b1f17b1804b1-477308a8988mr125449795e9.37.1762188916521; 
 Mon, 03 Nov 2025 08:55:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGLkZKXJF91fq0KhnKiOtjkk4yg6GJ3EqFHSdGAzmmLnM1fzJTnZ+QK4fvUPTNFCqs1tT+LXg==
X-Received: by 2002:a05:600c:3b1f:b0:45d:d505:a1c3 with SMTP id
 5b1f17b1804b1-477308a8988mr125449515e9.37.1762188916094; 
 Mon, 03 Nov 2025 08:55:16 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4772fabe2fbsm96917235e9.0.2025.11.03.08.55.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Nov 2025 08:55:15 -0800 (PST)
Message-ID: <118d572b-e19d-4762-bcdc-f0e8204be4ea@redhat.com>
Date: Mon, 3 Nov 2025 17:55:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/32] hw/arm/smmuv3: Implement get_viommu_cap()
 callback
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, wangzhou1@hisilicon.com,
 jiangkunkun@huawei.com, jonathan.cameron@huawei.com,
 zhangfei.gao@linaro.org, zhenzhong.duan@intel.com, yi.l.liu@intel.com,
 kjaju@nvidia.com
References: <20251031105005.24618-1-skolothumtho@nvidia.com>
 <20251031105005.24618-12-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20251031105005.24618-12-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6y17TURfkYAhMa0-biJRa2SkBJlpl2xj0ZrkXp_ptAY_1762188917
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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



On 10/31/25 11:49 AM, Shameer Kolothum wrote:
> For accelerated SMMUv3, we need nested parent domain creation. Add the
> callback support so that VFIO can create a nested parent.
>
> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> Tested-by: Zhangfei Gao <zhangfei.gao@linaro.org>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  hw/arm/smmuv3-accel.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> index 550a0496fe..a1d672208f 100644
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
> @@ -119,9 +120,21 @@ static AddressSpace *smmuv3_accel_find_add_as(PCIBus *bus, void *opaque,
>      }
>  }
>  
> +static uint64_t smmuv3_accel_get_viommu_flags(void *opaque)
> +{
> +    /*
> +     * We return VIOMMU_FLAG_WANT_NESTING_PARENT to inform VFIO core to create a
> +     * nesting parent which is required for accelerated SMMUv3 support.
> +     * The real HW nested support should be reported from host SMMUv3 and if
> +     * it doesn't, the nesting parent allocation will fail anyway in VFIO core.
> +     */
> +    return VIOMMU_FLAG_WANT_NESTING_PARENT;
> +}
> +
>  static const PCIIOMMUOps smmuv3_accel_ops = {
>      .supports_address_space = smmuv3_accel_supports_as,
>      .get_address_space = smmuv3_accel_find_add_as,
> +    .get_viommu_flags = smmuv3_accel_get_viommu_flags,
>  };
>  
>  static void smmuv3_accel_as_init(SMMUv3State *s)


