Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE47ECCA470
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Oct 2025 16:11:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3zQZ-000125-Gh; Wed, 01 Oct 2025 12:11:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1v3zQW-0000xs-9l
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 12:11:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1v3zQL-0004Cu-0h
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 12:11:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759335079;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2bm8nZkgQRRWW96fb3Oan/JNmjtAfHhBVULcb2tTdNY=;
 b=ChCOBfBJyBIhOMp12HltYAN1xXVZKYV/6+c6G0qRaxfn5UX9B6OO7tp4fyMridQTXD3mKD
 CEhOMGNbVOHj5ijtD7860IaBXCUHeMab/PTFqt6XrQGnRjYL1IlfKOXPSYu5Y2WGYqoeZr
 /zCB/3OOYI7AkDUEq3flo8V+P6Lrm5E=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-84-MsdWc68rOVaV-hCupoN64A-1; Wed, 01 Oct 2025 12:11:18 -0400
X-MC-Unique: MsdWc68rOVaV-hCupoN64A-1
X-Mimecast-MFC-AGG-ID: MsdWc68rOVaV-hCupoN64A_1759335077
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-46e32eb4798so38218385e9.2
 for <qemu-arm@nongnu.org>; Wed, 01 Oct 2025 09:11:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759335077; x=1759939877;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2bm8nZkgQRRWW96fb3Oan/JNmjtAfHhBVULcb2tTdNY=;
 b=kb+6VC1I0UW4gIt2h1gS7RrRkJlfhkIetcA5fn4LcIdwqn+s1zcXrwChhb3Rb9UuYF
 bXoR9VUb+accdkL1VtQ/MKA/04am7/a0UHMp0A70nHSZ4a1p2+hmaC0JzVsLXISrsNhS
 gijo7MtOHtrs9UjBSRNrqdUFLWV5J+/uamxUqkReHPxSX82KfN5gcWtQ5AftTgleRJJh
 nzoIApV+I9c/t8R3qT+LZANR322S9YPa6P6YH+v8jnlTfeTPByfSI39Tt6BQHxEQ+XnB
 QnbLvK0kyBq9PHYBKwR0DF1wAQgxEYPyMmUKRdUnzqZ8e/wii2EFfb2GrsKgen0ypiln
 HS+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMZk1zK6qlyk2ysypQGYm96Et9JzvWvjehhKBm4VbiRNbhy/cYg8pibwZJj6gX3UT1WfJkOiqOmg==@nongnu.org
X-Gm-Message-State: AOJu0Yx+Q1oUyMUaJQrLULuFCPQwEERBdoCDY1HstW49a+Au88U4MUbc
 ENM2egT15urxij/apL06ptZT5sYbt58OEN6cK9Re/VWuiODcm+wiylGJ+7QoRTVrO6JoIbcpLZ4
 KsczfZdAKs1cToPHr+ncw+Dw6JNz7Fw7vQY/kc65x+x9AdDOCvaWS2A==
X-Gm-Gg: ASbGncvPEH1e0bS3gyuL+Y/V6pXQTIQzDDO0C9aAETLliiYBSJ0e1CCBVPV56BQzQ+7
 Jzqiv+M+Cl6HILgk0InQPIlQv7ljxXSj6niK8wpvX7g1P7quDAG+SRqFVimpBf34paOdGzKw4dP
 sWWRgxV/utRY4VHgC65U6L3HwprpREFZ6P3VBonkMR0kH6ZY4aqEet1tOQWKTI1Q0ao/uJ0PlZR
 22U2xlOql7Ty/JqB4XtBz6UV4OnRvhyjJT3eqqFW3c/rP7YdrlMsqCMXvtorRGu8t1NkjNdiOFh
 VWtwVvsY4cb0qbD0rcQt7mZyu0DJEbN5eE4ZkFo9Up+Nup74oKuyQz3BVqVgCycO/axy4AYVKlh
 SzLDWlkjragM5GO17
X-Received: by 2002:a05:600c:8b71:b0:45b:868e:7f7f with SMTP id
 5b1f17b1804b1-46e612c2374mr40659285e9.17.1759335077172; 
 Wed, 01 Oct 2025 09:11:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgN3B+NF5BIWOsWWRI4QVZIyAuiQyr8UW/tcE/XX4myve12HKHYjK/EkEMdiXz2AUb6Kw8sA==
X-Received: by 2002:a05:600c:8b71:b0:45b:868e:7f7f with SMTP id
 5b1f17b1804b1-46e612c2374mr40659015e9.17.1759335076726; 
 Wed, 01 Oct 2025 09:11:16 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fc5602efdsm29306256f8f.34.2025.10.01.09.11.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Oct 2025 09:11:16 -0700 (PDT)
Message-ID: <6bc5a210-2c08-47a1-b7c6-f421d99505dc@redhat.com>
Date: Wed, 1 Oct 2025 18:11:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/27] hw/arm/smmu-common:Make iommu ops part of
 SMMUState
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, wangzhou1@hisilicon.com,
 jiangkunkun@huawei.com, jonathan.cameron@huawei.com,
 zhangfei.gao@linaro.org, zhenzhong.duan@intel.com, yi.l.liu@intel.com,
 shameerkolothum@gmail.com
References: <20250929133643.38961-1-skolothumtho@nvidia.com>
 <20250929133643.38961-5-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250929133643.38961-5-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _t9qKwcg3tPgI1Y-xlTh-VoTAPUuFzyjQYNwDpGXO98_1759335077
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.518,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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



On 9/29/25 3:36 PM, Shameer Kolothum wrote:
> And set to the current default smmu_ops. No functional change intended.
> This will allow SMMUv3 accel implementation to set a different iommu ops
> later.
>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  hw/arm/smmu-common.c         | 7 +++++--
>  include/hw/arm/smmu-common.h | 1 +
>  2 files changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 59d6147ec9..4d6516443e 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -952,6 +952,9 @@ static void smmu_base_realize(DeviceState *dev, Error **errp)
>          return;
>      }
>  
> +    if (!s->iommu_ops) {
> +        s->iommu_ops = &smmu_ops;
> +    }
>      /*
>       * We only allow default PCIe Root Complex(pcie.0) or pxb-pcie based extra
>       * root complexes to be associated with SMMU.
> @@ -971,9 +974,9 @@ static void smmu_base_realize(DeviceState *dev, Error **errp)
>          }
>  
>          if (s->smmu_per_bus) {
> -            pci_setup_iommu_per_bus(pci_bus, &smmu_ops, s);
> +            pci_setup_iommu_per_bus(pci_bus, s->iommu_ops, s);
>          } else {
> -            pci_setup_iommu(pci_bus, &smmu_ops, s);
> +            pci_setup_iommu(pci_bus, s->iommu_ops, s);
>          }
>          return;
>      }
> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> index c6f899e403..75b83b2b4a 100644
> --- a/include/hw/arm/smmu-common.h
> +++ b/include/hw/arm/smmu-common.h
> @@ -162,6 +162,7 @@ struct SMMUState {
>      uint8_t bus_num;
>      PCIBus *primary_bus;
>      bool smmu_per_bus; /* SMMU is specific to the primary_bus */
> +    const PCIIOMMUOps *iommu_ops;
>  };
>  
>  struct SMMUBaseClass {


