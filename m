Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp3797484lfc;
        Thu, 14 Oct 2021 01:25:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyBiAteWyfAbB9lj0AXqJYnlVQRe+7lXUWO3/OV9ttGFVTrqX3QzzLv4YpgvbnJKjkSmTx1
X-Received: by 2002:a37:a191:: with SMTP id k139mr3462438qke.349.1634199907858;
        Thu, 14 Oct 2021 01:25:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634199907; cv=none;
        d=google.com; s=arc-20160816;
        b=f4kvHgSIZNWbITbyQtWmeXA9Xc6Kn7PlddxG5pjpODtIZ61psUOmHpGyVo26QRpriw
         IbI3XfVRl4aH4oNg8Tt+x6Mf9rQIs2CSNRqbV93UfoV21gVNY/GhrSJbGjciHgtrUfrQ
         k1M+5cRpWgrupgCHIaJNLkeYpdV2OB4NE5JT7cUwYLEAKkrxulvMHDn9hIPNUfJUfz5F
         JIfoCXjuJ79vpEoN7OP1t6h7EmbmKrJn/tPfRDMzNVn+fobcMiRtybHH2fh0xZamOTKY
         jIiDU4Hg0atQkmjZ53MYDuCDTd7MFXIu+05ZBsSai1uQpesYw3YswgZX7Enyw0VTKxLh
         EKHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=4V+SufKl8asIEgy49tSiPlKL6nxyP7MkUhygoewotm4=;
        b=afluFVeFDBGIS+5RphqDAA9KXdLHBBkeRkocQMrv3Fww4RoeFBru6HH08UE8SFTSmR
         ELBFJ8LuUY9XfaE5NJcrtTI5ArDjNtHfZD+U4bNCI+4kJ5rYEiROd4WOb8YEQfBa1ZLU
         JcrlJZRPiH7qvjijlKHDJeyvqUXTsBifITJCq/Roqd7KzQRQVFx08Thb/Q1Cw6ON7unJ
         CbOc+OKcdtRhGnxpFvDd8NkDhxsNkBLV/RPzaO4OvFpYX2S+6LMH47TRzxqzCOtpD5D6
         9pf+5hGfQfLiC1a3erUWaGRTQOZXtYJ2bvgAGsGhm+iib8eoC91MZEMwic9ExV7z6e3g
         86/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZuHyfn1T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t65si1545444qke.64.2021.10.14.01.25.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Oct 2021 01:25:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZuHyfn1T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1maw31-00086y-6Q
	for alex.bennee@linaro.org; Thu, 14 Oct 2021 04:25:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1maw2Y-000850-CQ
 for qemu-arm@nongnu.org; Thu, 14 Oct 2021 04:24:38 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:35690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1maw2T-0008SN-GB
 for qemu-arm@nongnu.org; Thu, 14 Oct 2021 04:24:38 -0400
Received: by mail-wr1-x434.google.com with SMTP id g25so16852907wrb.2
 for <qemu-arm@nongnu.org>; Thu, 14 Oct 2021 01:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=4V+SufKl8asIEgy49tSiPlKL6nxyP7MkUhygoewotm4=;
 b=ZuHyfn1TNHljiPNK5hejtohuTq9iMcij6YHkFIxzHWIUUCpLgh1wEl3dGndYS5f8/2
 /8yiY+O0kYcSG1GxEcFVxsRIv/0pTyZsonXeuX/bzUjBHg00DVebbTNtDA+3dziz807M
 fgHeGR4ErLnhuTmHgNGrpqQRY+lf8o9J/CInXR02Nyk8hmza8UCapwYGowWIu1F2xAJg
 XGIhvQ4SIamNnOiNHA45zStZ9QGCpwol8zi1qFkf4ibODFZ3keJhdIV4Q/ywe+NnhI21
 egSnn7hjV6Y4jh4qxxEhYrft1LhQ040KDgf+UE+eviYUzbt0G8CsDThp/Q7x06HoqTy1
 Exjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4V+SufKl8asIEgy49tSiPlKL6nxyP7MkUhygoewotm4=;
 b=qFenmI4JbSz0zyZ33pUYSZ62REIfwrZkjPPGWTKK246A+ylvej558UUWOmbnZdW05k
 sQuxjQj/UWWuyE16t2v+DxP3+4yLco2RGqoDhDGHZs3lZQuy1lSgFmFnfYyJGrCDnrwo
 w7mZohNmfi6Z1RQeyTKiuh5r3K/3Zy0/oOTWwPvp8r4iTQy7CqWfV38AaIgXGHqiMC7E
 sGvcTeqwikHkZ3yzPh6Lwx4tm6V7LDApy+hdzy7hKqxFtcr6Uthf/AjRcQvFVN3TO9ly
 Xe6EqGP0CtXJbTZsWHZYWxIzjE2s9Romqp86O378J4k22tdW0/Q/whAIl/vxDyuEtE0d
 J2yQ==
X-Gm-Message-State: AOAM530/deQKO9dKmk+teeyZNp6svwQJwiqWnI9QoDa9IutL4HnErS8w
 m4lXTKBq0QolqWTRJeWytXrFwA==
X-Received: by 2002:a5d:42c2:: with SMTP id t2mr4892086wrr.409.1634199871721; 
 Thu, 14 Oct 2021 01:24:31 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id f6sm1462202wmj.28.2021.10.14.01.24.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 01:24:31 -0700 (PDT)
Date: Thu, 14 Oct 2021 09:24:10 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v3 2/2] virtio-iommu: Drop base_name and change
 generic_name
Message-ID: <YWfpKvS4HII26bY5@myrica>
References: <20211013191755.767468-1-eric.auger@redhat.com>
 <20211013191755.767468-3-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211013191755.767468-3-eric.auger@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, mst@redhat.com, cohuck@redhat.com,
 qemu-devel@nongnu.org, abologna@redhat.com, qemu-arm@nongnu.org,
 eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aEPvxpv4MjVT

On Wed, Oct 13, 2021 at 03:17:55PM -0400, Eric Auger wrote:
> Drop base_name and turn generic_name into
> "virtio-iommu-pci". This is more in line with
> other modern-only devices.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Suggested-by: Cornelia Huck <cohuck@redhat.com>
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

> ---
>  hw/virtio/virtio-iommu-pci.c     | 3 +--
>  include/hw/virtio/virtio-iommu.h | 2 +-
>  2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/virtio/virtio-iommu-pci.c b/hw/virtio/virtio-iommu-pci.c
> index 86fa4e6c28..a160ae6b41 100644
> --- a/hw/virtio/virtio-iommu-pci.c
> +++ b/hw/virtio/virtio-iommu-pci.c
> @@ -98,8 +98,7 @@ static void virtio_iommu_pci_instance_init(Object *obj)
>  }
>  
>  static const VirtioPCIDeviceTypeInfo virtio_iommu_pci_info = {
> -    .base_name             = TYPE_VIRTIO_IOMMU_PCI,
> -    .generic_name          = "virtio-iommu-pci",
> +    .generic_name          = TYPE_VIRTIO_IOMMU_PCI,
>      .instance_size = sizeof(VirtIOIOMMUPCI),
>      .instance_init = virtio_iommu_pci_instance_init,
>      .class_init    = virtio_iommu_pci_class_init,
> diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-iommu.h
> index 273e35c04b..e2339e5b72 100644
> --- a/include/hw/virtio/virtio-iommu.h
> +++ b/include/hw/virtio/virtio-iommu.h
> @@ -26,7 +26,7 @@
>  #include "qom/object.h"
>  
>  #define TYPE_VIRTIO_IOMMU "virtio-iommu-device"
> -#define TYPE_VIRTIO_IOMMU_PCI "virtio-iommu-device-base"
> +#define TYPE_VIRTIO_IOMMU_PCI "virtio-iommu-pci"
>  OBJECT_DECLARE_SIMPLE_TYPE(VirtIOIOMMU, VIRTIO_IOMMU)
>  
>  #define TYPE_VIRTIO_IOMMU_MEMORY_REGION "virtio-iommu-memory-region"
> -- 
> 2.27.0
> 
