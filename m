Received: by 2002:a17:907:60c:b0:a6f:8e2c:4d9d with SMTP id wp12csp226118ejb;
        Mon, 17 Jun 2024 06:24:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXUnKUFirBNUVMw95sz1yyIEEqB8791rjlT5At/KcfkZz/DV7XlNsix4XVxrs5R8dgKa1Ug9WfoEWy5v4T06TpdmzvukCEw
X-Google-Smtp-Source: AGHT+IEdjnHlA/5A9mUptwHqotQyPCsIY61GliLivUMHOvxmKsVl1xZf+rorN0GcQJGGrcyA487P
X-Received: by 2002:a05:6808:1911:b0:3d2:21a5:d3bd with SMTP id 5614622812f47-3d24e9d88edmr12114986b6e.52.1718630655821;
        Mon, 17 Jun 2024 06:24:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718630655; cv=none;
        d=google.com; s=arc-20160816;
        b=AVhqjA5RG+v2zYkIfa+ZpR3JLYCiag/WV+OlRPn2zb4j5LWLbS2Nj6rk39QFpaiDH7
         6Ovt5ocwDeUQLimxqpFWgVQoGlhE4OnLj74LXMcTubSuQcj1iwf1vxezXu1d5H/ZJDD5
         KDmFPmP9G0XjB3/7Ew12Nxd5CJPQX4A2QOezKL9gAZIJNTpOlraECAgNjAd5xXqFk/51
         dLkCRQF9ZkyAOzKeFwwIh32LmSwbdTVl0FhTg0x+9aYWEweysSa4uX6J2pn+R4YGcksb
         GVZXhjnxKq5dzpuvcsk3R59mDxYG6yRLmLj3Csd9cOZSnKF/P6k/gbZrBswlOGr04JYX
         w8tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=b313t8QGbzWNmuRQH1B7TpBmfxi6fefKIpZa+ZnqFTM=;
        fh=hWCSFiU+pnmxzw+bvhj+rEcsz3pMlWQpIgy4EwwYsQs=;
        b=vn78JuR6aVTO3tO6DUMrjBOTjOrjzYx52Y6VNxLsbPhcOYSTKTO9wEKOReXq9LkQNn
         AgoKAQ7p+LdPuvZKujyMAkrVHm8dvy+scme+TOGqvKvTM5wpQGxY1e2yS9yTTrmHgnak
         0zixsFPCNfRIPTBmtAr4Tokhvm6wm9vmGHstGIEEmleNlRp3VVHC6/qhA5X3a4TYwDqi
         NhTX1pGaAtKhK4ikeuAda2imsbb411HOSIJNROu+/cDk6GQUntwOMdreKu7j/5fvj4A5
         Gr55rUxSyIURKoAsK1AXM1MDuGbmX0xhCYU36jnzpmxd6aW4FNPEaRaytFQH08N75SdS
         bIEw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="EHrM/odi";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-798ab9f879dsi981188985a.260.2024.06.17.06.24.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Jun 2024 06:24:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="EHrM/odi";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sJCL5-0008VK-Vx; Mon, 17 Jun 2024 09:24:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sJCL3-0008UV-NG
 for qemu-arm@nongnu.org; Mon, 17 Jun 2024 09:24:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sJCL1-000089-MO
 for qemu-arm@nongnu.org; Mon, 17 Jun 2024 09:24:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718630638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b313t8QGbzWNmuRQH1B7TpBmfxi6fefKIpZa+ZnqFTM=;
 b=EHrM/odigOKMh4P8rZNU0cD4ECqxCLH4biwo5TbseiOJEaatZgIaQ/NdWqabDhRCRaOHPV
 S/ix7XekZQpReOPdt3qe4qLjMzi+LALUs0hVz6NX2QnMOK9FeuRz0tIwlMqDA/FimvFDJg
 6WylCHynzxUcob1t0NxHC4QRIiSFdNU=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-164-EqcHRUJmOBGoi9xVRQt40A-1; Mon, 17 Jun 2024 09:23:57 -0400
X-MC-Unique: EqcHRUJmOBGoi9xVRQt40A-1
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-52c944cf9b5so3372252e87.0
 for <qemu-arm@nongnu.org>; Mon, 17 Jun 2024 06:23:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718630636; x=1719235436;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=b313t8QGbzWNmuRQH1B7TpBmfxi6fefKIpZa+ZnqFTM=;
 b=BsRDCWCrRr21eSNfkcnbrgVUwl9pB+6j501ZtH4JcD8oCk6jF62bAsCDVWLR/BMr7E
 H46cgVH/pSppY/RUsikva1iXGrxPH5IltRMkPyhYM4LyM1C2xhnCHCums3z0TfZOov/j
 jj0Xqgu+tq2Y5SwWexwdrNm10bygFOpxgzrZb86zV6rkJrZCXLT6rvNc/GbhAHwes6A8
 47wg8PWAKy9WgaF82x46Vh++SA3+6cHLbDqQym0H8gam4+3IE7cXXhiPeI7YE8ZvumNS
 hwO1Q58c+vPWiDpvcTa7/CA+rIlL6ZPiZgzwS20plszW7eJRvEXieqV9u/d005VY2ofn
 N5qA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMtN88TszmLLCQKlYIREgK9skdxfrmM7XSK/cdjYN82IwvVRX2YRA7KZn5JMtsjz48eYcFmfZ1BJgrJDrC5D1iHEzp
X-Gm-Message-State: AOJu0Yxqhtq9Nnt4wurnUvwI3dVX1Txgg9F01GxS+dX510pbdN2W6AId
 hQczSdph1DYNhugPBXc36vildRjrf1zB8z80TzZag7ZGc8hO57lXuYLM6zALPEvwQnprc+BdODo
 J/n/9NzQCd+mHWqFnU988UcxeRVE3s/RBbc084ypb9TDp1A3RoQ==
X-Received: by 2002:ac2:560a:0:b0:52c:8abe:5204 with SMTP id
 2adb3069b0e04-52ca6e6d562mr6347064e87.32.1718630636218; 
 Mon, 17 Jun 2024 06:23:56 -0700 (PDT)
X-Received: by 2002:ac2:560a:0:b0:52c:8abe:5204 with SMTP id
 2adb3069b0e04-52ca6e6d562mr6347045e87.32.1718630635793; 
 Mon, 17 Jun 2024 06:23:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422870e9193sm196065245e9.21.2024.06.17.06.23.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jun 2024 06:23:55 -0700 (PDT)
Message-ID: <8b8ac158-ffc4-4d2e-aaf5-2893f1b680f7@redhat.com>
Date: Mon, 17 Jun 2024 15:23:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/8] HostIOMMUDevice: Introduce get_iova_ranges callback
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, mst@redhat.com,
 jean-philippe@linaro.org, peter.maydell@linaro.org, yanghliu@redhat.com,
 zhenzhong.duan@intel.com
Cc: alex.williamson@redhat.com, jasowang@redhat.com, pbonzini@redhat.com,
 berrange@redhat.com
References: <20240614095402.904691-1-eric.auger@redhat.com>
 <20240614095402.904691-4-eric.auger@redhat.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <20240614095402.904691-4-eric.auger@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.148,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: h0maOgaYbkBr

On 6/14/24 11:52 AM, Eric Auger wrote:
> Introduce a new HostIOMMUDevice callback that allows to
> retrieve the usable IOVA ranges.
> 
> Implement this callback in the legacy VFIO and IOMMUFD VFIO
> host iommu devices. This relies on the VFIODevice agent's
> base container iova_ranges resource.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
> 
> ---
> 
> v2 -> v3:
> - add g_assert(vdev)
> ---
>   include/sysemu/host_iommu_device.h |  8 ++++++++
>   hw/vfio/container.c                | 16 ++++++++++++++++
>   hw/vfio/iommufd.c                  | 16 ++++++++++++++++
>   3 files changed, 40 insertions(+)
> 
> diff --git a/include/sysemu/host_iommu_device.h b/include/sysemu/host_iommu_device.h
> index 3e5f058e7b..40e0fa13ef 100644
> --- a/include/sysemu/host_iommu_device.h
> +++ b/include/sysemu/host_iommu_device.h
> @@ -80,6 +80,14 @@ struct HostIOMMUDeviceClass {
>        * i.e., HOST_IOMMU_DEVICE_CAP_AW_BITS.
>        */
>       int (*get_cap)(HostIOMMUDevice *hiod, int cap, Error **errp);
> +    /**
> +     * @get_iova_ranges: Return the list of usable iova_ranges along with
> +     * @hiod Host IOMMU device
> +     *
> +     * @hiod: handle to the host IOMMU device
> +     * @errp: error handle
> +     */
> +    GList* (*get_iova_ranges)(HostIOMMUDevice *hiod, Error **errp);
>   };
>   
>   /*
> diff --git a/hw/vfio/container.c b/hw/vfio/container.c
> index b728b978a2..c48749c089 100644
> --- a/hw/vfio/container.c
> +++ b/hw/vfio/container.c
> @@ -1164,12 +1164,28 @@ static int hiod_legacy_vfio_get_cap(HostIOMMUDevice *hiod, int cap,
>       }
>   }
>   
> +static GList *
> +hiod_legacy_vfio_get_iova_ranges(HostIOMMUDevice *hiod, Error **errp)
> +{
> +    VFIODevice *vdev = hiod->agent;
> +    GList *l = NULL;
> +
> +    g_assert(vdev);
> +
> +    if (vdev->bcontainer) {
> +        l = g_list_copy(vdev->bcontainer->iova_ranges);
> +    }
> +
> +    return l;
> +}
> +
>   static void hiod_legacy_vfio_class_init(ObjectClass *oc, void *data)
>   {
>       HostIOMMUDeviceClass *hioc = HOST_IOMMU_DEVICE_CLASS(oc);
>   
>       hioc->realize = hiod_legacy_vfio_realize;
>       hioc->get_cap = hiod_legacy_vfio_get_cap;
> +    hioc->get_iova_ranges = hiod_legacy_vfio_get_iova_ranges;
>   };
>   
>   static const TypeInfo types[] = {
> diff --git a/hw/vfio/iommufd.c b/hw/vfio/iommufd.c
> index dbdae1adbb..e502081c2a 100644
> --- a/hw/vfio/iommufd.c
> +++ b/hw/vfio/iommufd.c
> @@ -645,11 +645,27 @@ static bool hiod_iommufd_vfio_realize(HostIOMMUDevice *hiod, void *opaque,
>       return true;
>   }
>   
> +static GList *
> +hiod_iommufd_vfio_get_iova_ranges(HostIOMMUDevice *hiod, Error **errp)
> +{
> +    VFIODevice *vdev = hiod->agent;
> +    GList *l = NULL;
> +
> +    g_assert(vdev);
> +
> +    if (vdev->bcontainer) {
> +        l = g_list_copy(vdev->bcontainer->iova_ranges);
> +    }
> +
> +    return l;
> +}

May be introduce a common vfio_container_get_iova_ranges() to be called from
the get_iova_ranges() handlers ?


Thanks,

C.


>   static void hiod_iommufd_vfio_class_init(ObjectClass *oc, void *data)
>   {
>       HostIOMMUDeviceClass *hiodc = HOST_IOMMU_DEVICE_CLASS(oc);
>   
>       hiodc->realize = hiod_iommufd_vfio_realize;
> +    hiodc->get_iova_ranges = hiod_iommufd_vfio_get_iova_ranges;
>   };
>   
>   static const TypeInfo types[] = {

