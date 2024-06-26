Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp944329njc;
        Wed, 26 Jun 2024 05:43:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXA7YhEYhIm7xQbtoZRF+dXFJtOCVlfsZl8HG0St1DvSSpQffue5+MwD68c8xpS+WNPFhqWVrncEmgfD5b1uZ/qNVLSfr6j
X-Google-Smtp-Source: AGHT+IGWBtZQo+cW+fxphbxzI93RkaUVurnMNkp/IgfW1YWqnT8Ax2qyFhgvSZMX990ECSuWeCtt
X-Received: by 2002:ad4:5910:0:b0:6b2:b13c:5b03 with SMTP id 6a1803df08f44-6b540bf1a32mr85772916d6.56.1719405817588;
        Wed, 26 Jun 2024 05:43:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719405817; cv=none;
        d=google.com; s=arc-20160816;
        b=hYrrBWpXyoeuxwDIvra/mkClKL2f/uYyRVGPcM/+uwIF83oRPUY6LD8FBA5mkFt5QM
         TdOmaaI22v/JyKZz5Ge8cSdSvhIhKjfzojQzOx7OGgfZv0eGKR2YrOEZPl2JPTBYU7LH
         bxv+5WIzN6ZoVz02AneBVQMXUMnKt1/wJk8J5ljpAJoNf8hP/GXGx4HXXbI6cznKvnyM
         1bz38uGj/oRD4/2gS857YdHLXhBooCCsEms1gnM/lc8/mNfeX/F9xVvn5Mbd0pEOhVaC
         XQ9+/panEElY7NcHLmnB0so7DVgFl7GOKsoBuKEZe5ZrBxHdHudwqGLQY8nX7aQBg7Su
         m3bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=OOfnJ7jDzdU/A2Gk7+8IYysr5m9GuHyFj+n1x5ffO1s=;
        fh=ehK7n+u0HGowSfwfHyVRAGtzVIBNQ2GDKFSFC4PY9lo=;
        b=NMRdBU5j5zjl7FGjYUppgpKZfAxiL33B5ZsgCG+K35WrlxALj9n/3px+0g2F+TgF8y
         FrbQmKqoGtpdY2ClQdoVLwvUFBKmfpFPD96vY0ODEJHjXDvDUc3tYEbOi587rvlPxibC
         IO0t7Nvgalv2YNefwlV1PRZh74psNKpQYDaTVfqliB/hr0mRco6CeOL9DEmO34yvt43P
         uhYsA38oibppbCy6m1P+x3Hm/L/2zzRNGTZqp1q6JOQEkuYQn5aS+RNVEbYaaJEz1f5u
         EofEKlU54pUvyEqCj2gU5NXItoW6vZa+FrwviD+XG0fS2V5nM8fZOVurFAFoeD1msZRZ
         /tPA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Ab8U91/N";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b51ecec0a4si125029076d6.72.2024.06.26.05.43.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Jun 2024 05:43:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Ab8U91/N";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sMRza-0002Z2-I1; Wed, 26 Jun 2024 08:43:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sMRzY-0002YU-Gt
 for qemu-arm@nongnu.org; Wed, 26 Jun 2024 08:43:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sMRzW-0000aB-UB
 for qemu-arm@nongnu.org; Wed, 26 Jun 2024 08:43:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719405793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OOfnJ7jDzdU/A2Gk7+8IYysr5m9GuHyFj+n1x5ffO1s=;
 b=Ab8U91/N91yoM/Z/FV+P1kSW272KNoNlgoVEC8diSQ9IvPwmpFIPvRq3Jj+KzshYVG00Ex
 rnyP18XeoIifRUmcUe2z/TTKEmIC4/N3C6+slntqB4x2hiHGwb32d3WXAalmZsSnn7DyXc
 5l9Qi5rN3lNxbB8Gl2Q3kZEKBNdMi1c=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-439-efAeQ9LLPrSI5zNuGViH_Q-1; Wed, 26 Jun 2024 08:43:12 -0400
X-MC-Unique: efAeQ9LLPrSI5zNuGViH_Q-1
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4406476507cso114200291cf.3
 for <qemu-arm@nongnu.org>; Wed, 26 Jun 2024 05:43:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719405792; x=1720010592;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OOfnJ7jDzdU/A2Gk7+8IYysr5m9GuHyFj+n1x5ffO1s=;
 b=wTBNT+IijkEeTEk+aXZD1aQ3Pb7jZj8xTREBwb1iUNgkVHTcLKd+t5apgEHo5Xl7Aw
 IVZpwHy+tuJqZ4CpPJD2TwhcxIKKl8sLLQ00BTegzMxk01iXlMk2fjlWds38mpro325x
 iC54y6Qe2E6HSZEg26vZViT+xWTq9mWi9ZHEMB0Z+26WazZygn4V2wPs0GMLzCXl0kAw
 +YpopF65w2dKPXtE7wmIUcXyEiE1llq9SlAHWTNawd51JEDuqEPODtO5WNN+Y6yLwH4o
 kdl51YiiL93GgWTgyls5KVra+7GfdpAqrKpnZDrCdRgeUSBO3ypnBIYnnvcEXZt/A+2C
 Mgeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWdapDdgVyDKahEk/FaRRZOMSshDWZLi3iojYqh2u7bP7M95eIygSgZOYfCjlzlBJVa659Yz+1Nd47oCv7Wfa1Uj9W
X-Gm-Message-State: AOJu0Yzp5ExXK9BA62mMb8NDWpTQOTM58RO+KItljoJuKRWF1u53Lj1i
 c+WvYzV8ZAW7Cvp+z3COcqQMJVXe/WuozTbcp5r9RiInCsfQRpxPjDMR8+Q/WnIEh/3pRB+9g7Y
 +coDqXHujONrzBo8GEk+sRdC6ovcZlOjYHp/KD/W1W7M4oDiGyg==
X-Received: by 2002:a05:622a:104:b0:444:f877:18aa with SMTP id
 d75a77b69052e-444f8771ebamr51492421cf.60.1719405791856; 
 Wed, 26 Jun 2024 05:43:11 -0700 (PDT)
X-Received: by 2002:a05:622a:104:b0:444:f877:18aa with SMTP id
 d75a77b69052e-444f8771ebamr51492221cf.60.1719405791498; 
 Wed, 26 Jun 2024 05:43:11 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-444c2b83fc8sm66951111cf.43.2024.06.26.05.43.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jun 2024 05:43:11 -0700 (PDT)
Message-ID: <f4849fe4-1f6a-42a9-96e5-f7179c52d05d@redhat.com>
Date: Wed, 26 Jun 2024 14:43:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] HostIOMMUDevice : remove Error handle from
 get_iova_ranges callback
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, mst@redhat.com,
 jean-philippe@linaro.org, peter.maydell@linaro.org, yanghliu@redhat.com,
 zhenzhong.duan@intel.com, alex.williamson@redhat.com
References: <20240626082727.1278530-1-eric.auger@redhat.com>
 <20240626082727.1278530-4-eric.auger@redhat.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <20240626082727.1278530-4-eric.auger@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.207,
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
X-TUID: hHz6ZgChXY1Q

On 6/26/24 10:26 AM, Eric Auger wrote:
> The error handle argument is not used anywhere. let's remove it.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>


Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> ---
>   include/sysemu/host_iommu_device.h | 3 +--
>   hw/vfio/container.c                | 2 +-
>   hw/vfio/iommufd.c                  | 2 +-
>   hw/virtio/virtio-iommu.c           | 2 +-
>   4 files changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/include/sysemu/host_iommu_device.h b/include/sysemu/host_iommu_device.h
> index ee6c813c8b..05c7324a0d 100644
> --- a/include/sysemu/host_iommu_device.h
> +++ b/include/sysemu/host_iommu_device.h
> @@ -87,9 +87,8 @@ struct HostIOMMUDeviceClass {
>        * @hiod Host IOMMU device
>        *
>        * @hiod: handle to the host IOMMU device
> -     * @errp: error handle
>        */
> -    GList* (*get_iova_ranges)(HostIOMMUDevice *hiod, Error **errp);
> +    GList* (*get_iova_ranges)(HostIOMMUDevice *hiod);
>   };
>   
>   /*
> diff --git a/hw/vfio/container.c b/hw/vfio/container.c
> index 2ad57cd845..adeab1ac89 100644
> --- a/hw/vfio/container.c
> +++ b/hw/vfio/container.c
> @@ -1166,7 +1166,7 @@ static int hiod_legacy_vfio_get_cap(HostIOMMUDevice *hiod, int cap,
>   }
>   
>   static GList *
> -hiod_legacy_vfio_get_iova_ranges(HostIOMMUDevice *hiod, Error **errp)
> +hiod_legacy_vfio_get_iova_ranges(HostIOMMUDevice *hiod)
>   {
>       VFIODevice *vdev = hiod->agent;
>   
> diff --git a/hw/vfio/iommufd.c b/hw/vfio/iommufd.c
> index 890d8d6a38..211e7223f1 100644
> --- a/hw/vfio/iommufd.c
> +++ b/hw/vfio/iommufd.c
> @@ -644,7 +644,7 @@ static bool hiod_iommufd_vfio_realize(HostIOMMUDevice *hiod, void *opaque,
>   }
>   
>   static GList *
> -hiod_iommufd_vfio_get_iova_ranges(HostIOMMUDevice *hiod, Error **errp)
> +hiod_iommufd_vfio_get_iova_ranges(HostIOMMUDevice *hiod)
>   {
>       VFIODevice *vdev = hiod->agent;
>   
> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> index b708fb96fd..b8f75d2b1a 100644
> --- a/hw/virtio/virtio-iommu.c
> +++ b/hw/virtio/virtio-iommu.c
> @@ -615,7 +615,7 @@ static bool virtio_iommu_set_iommu_device(PCIBus *bus, void *opaque, int devfn,
>   
>       if (hiodc->get_iova_ranges) {
>           int ret;
> -        host_iova_ranges = hiodc->get_iova_ranges(hiod, errp);
> +        host_iova_ranges = hiodc->get_iova_ranges(hiod);
>           if (!host_iova_ranges) {
>               return true; /* some old kernels may not support that capability */
>           }

