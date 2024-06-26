Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp944237njc;
        Wed, 26 Jun 2024 05:43:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVynPLLwPlfVvoPpGALNVABNyyWuGOeqDEOtIvjtEbqyCGH5Mu7Ak8u0wvtAgoGo+fYZ23TowFM6suUV4FBGYeq9hyHWJDY
X-Google-Smtp-Source: AGHT+IHN+5c/u99JpEBEEq0wE4+t9N0vjDKr1ncvP+0t43s7E3fNOcsW32IDxiUEIw2wcFe78O46
X-Received: by 2002:a05:620a:430e:b0:795:5add:31fa with SMTP id af79cd13be357-79be701fe11mr1150748185a.67.1719405796322;
        Wed, 26 Jun 2024 05:43:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719405796; cv=none;
        d=google.com; s=arc-20160816;
        b=xm9qYUKlYiM0og0H94iF9Kz/KKr/Okj7uLu82jy6aGWC0W0PYbD9/PaAFOMtV2lUA8
         JRR3VK0xugtHiTEQUIgF1aBe/gx7JKzDC5ltwplRUPccRmQvp6j51ha7ZCDupMk0GTx2
         6KffkPe6uBVZLUnT1puZ4fZxUH9EkHyZ903QYpFxMUdp+X25B8u5WTvHC+Y8OJWRJFzX
         93qsj/obQEDi9SLIdshSjDYefEkf4d2BlZ+Fum1BCXsjr22G+iTPQqurJ1aFcvzNfAYH
         CnH3FvgmDsoet1IVRxTwK9N1CWJ1bCTeprhgyRIdbgKKzFsGmSriVZ2jUgU093rZpqU9
         e6Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=08m5ugK9T+OFvszkVn2IlOhibxzPIICM9l31TAR/N7E=;
        fh=M6Jqvp594ZvgaTyOTNttkTa8frr0BcdnWVHxYGDliI0=;
        b=ICpT7Ky8iOvg7X2sni0pNT2CwNADQBjqmV5DVZf1GyGEgsrYJIK8bN/k2yfe2GwN+P
         ribV4cMO22AoTZ+jlcgq8JUHK+XbTqCFRU4d1tKB65ElN9cNAFGfdVV/SFGNLI1/cjQ+
         mkvKJXp7m6GDDdTWUODCZxgjSOy30gu9HG9InnMv0Ihu/cb9rS03NPBtCUvdrCpLFcsQ
         XJWe2jhQSQaYw23ZdXsFCXVa/zw5r1kwAj8GkvCh+8X/Qg5GwTdkpO88ekL2rCBLIwpZ
         jMB4niGCG2q+EQBS8+/1ORwX6qzlkqNa9UfLhXsdH1Pm8ORg9A5SH2z4cASEkqsjhS2B
         qFXg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=B6+bIGkY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79bce94131dsi1290476485a.580.2024.06.26.05.43.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Jun 2024 05:43:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=B6+bIGkY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sMRzF-0002Ut-Nx; Wed, 26 Jun 2024 08:42:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sMRzE-0002Ue-Jd
 for qemu-arm@nongnu.org; Wed, 26 Jun 2024 08:42:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sMRzC-0000ZL-5G
 for qemu-arm@nongnu.org; Wed, 26 Jun 2024 08:42:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719405773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=08m5ugK9T+OFvszkVn2IlOhibxzPIICM9l31TAR/N7E=;
 b=B6+bIGkYgV7sK7QUXU5s/YuS4VJXSK11Uv6rWO5lQMpF8iOfmF2dkllB0ovlugoc2HJ9XN
 xhnLZ/6SQ7+TlzI26ID+RbkzJY8Cm+8vb6liInJFal/NJLPgrD4Vxnv04LosPzE3b+h820
 Tu1tu3wnIOeQuJeXEMXjZn2ZMovll0o=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-14-YSrzjCjFNR6ONAgGPealTQ-1; Wed, 26 Jun 2024 08:42:50 -0400
X-MC-Unique: YSrzjCjFNR6ONAgGPealTQ-1
Received: by mail-ot1-f70.google.com with SMTP id
 46e09a7af769-6fe30728af8so8765552a34.1
 for <qemu-arm@nongnu.org>; Wed, 26 Jun 2024 05:42:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719405769; x=1720010569;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=08m5ugK9T+OFvszkVn2IlOhibxzPIICM9l31TAR/N7E=;
 b=uMXhwsWcnI+js6eFF98LTJYqRL1oSlwAGmDQMA+0ruKKPN/n1+PQitQ9yYWR2ZjrAI
 fFkR7+yzztXAKK0/Ihd3Rh73QtDp/WniYacXHsxtcbLMgObhs9Xr8JNQzDTUAzN0eS2H
 RG/BGtWJ4u0jTyD1xnUNSltQvd5pHtgzH2D6Mhg779c2dXP3ZDfsPBfwQVWB73gweOKZ
 ZCO8Xlh63HQfii0fFQySdj8rBRKCPGkHHs5jtAimeW6/6A2NAV2aLbr28Ock7M8oWi+A
 igzD85RiSbI8AqlwQ/8a70zWYigWv0fkulzXvQId+xKAyXelbnevvUF14oX+KEB7EBQG
 sPqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+/Q3bEdVze3TDTQVKW3SB1HvKBJ45TwHdGDD7faaQCbBeAfPIJb9ECxUD/33HHCBhBnXhg6D+u0TjbPnx3OoQ9rht
X-Gm-Message-State: AOJu0YyKfQdQi5DggLyzaDuGwOCoT+ZBObUubiwGH7voCqI2G/FFsWbG
 6jGtZRW9zXW5KQLYM/Rh4pwxDTYLtHD02KXZ6MoyPtCUPwBMClROppFfPQLAUSAIoGpbAtk5lpu
 WJ8up11JDCTXa7vCKDEZ29NrARKGsS3G4hdkqRhh1c9kviIw4ZQ==
X-Received: by 2002:a05:6830:161a:b0:700:d506:cfe9 with SMTP id
 46e09a7af769-700d506d7aamr887973a34.19.1719405769375; 
 Wed, 26 Jun 2024 05:42:49 -0700 (PDT)
X-Received: by 2002:a05:6830:161a:b0:700:d506:cfe9 with SMTP id
 46e09a7af769-700d506d7aamr887954a34.19.1719405769019; 
 Wed, 26 Jun 2024 05:42:49 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79c0afadd93sm124036085a.92.2024.06.26.05.42.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jun 2024 05:42:48 -0700 (PDT)
Message-ID: <ec68e91f-898f-418e-89bc-24c6223c262d@redhat.com>
Date: Wed, 26 Jun 2024 14:42:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] vfio-container-base: Introduce
 vfio_container_get_iova_ranges() helper
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, mst@redhat.com,
 jean-philippe@linaro.org, peter.maydell@linaro.org, yanghliu@redhat.com,
 zhenzhong.duan@intel.com, alex.williamson@redhat.com
References: <20240626082727.1278530-1-eric.auger@redhat.com>
 <20240626082727.1278530-3-eric.auger@redhat.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <20240626082727.1278530-3-eric.auger@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
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
X-TUID: tku0yTqzEfBw

On 6/26/24 10:26 AM, Eric Auger wrote:
> Introduce vfio_container_get_iova_ranges() to retrieve the usable
> IOVA regions of the base container and use it in the Host IOMMU
> device implementations of get_iova_ranges() callback.
> 
> We also fix a UAF bug as the list was shallow copied while
> g_list_free_full() was used both on the single call site, in
> virtio_iommu_set_iommu_device() but also in
> vfio_container_instance_finalize(). Instead use g_list_copy_deep.
> 
> Fixes: cf2647a76e ("virtio-iommu: Compute host reserved regions")
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Suggested-by: Cédric Le Goater <clg@redhat.com>


Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> ---
>   include/hw/vfio/vfio-container-base.h |  2 ++
>   hw/vfio/container-base.c              | 15 +++++++++++++++
>   hw/vfio/container.c                   |  8 +-------
>   hw/vfio/iommufd.c                     |  8 +-------
>   4 files changed, 19 insertions(+), 14 deletions(-)
> 
> diff --git a/include/hw/vfio/vfio-container-base.h b/include/hw/vfio/vfio-container-base.h
> index 419e45ee7a..45d7c40fce 100644
> --- a/include/hw/vfio/vfio-container-base.h
> +++ b/include/hw/vfio/vfio-container-base.h
> @@ -86,6 +86,8 @@ int vfio_container_set_dirty_page_tracking(VFIOContainerBase *bcontainer,
>   int vfio_container_query_dirty_bitmap(const VFIOContainerBase *bcontainer,
>                      VFIOBitmap *vbmap, hwaddr iova, hwaddr size, Error **errp);
>   
> +GList *vfio_container_get_iova_ranges(const VFIOContainerBase *bcontainer);
> +
>   #define TYPE_VFIO_IOMMU "vfio-iommu"
>   #define TYPE_VFIO_IOMMU_LEGACY TYPE_VFIO_IOMMU "-legacy"
>   #define TYPE_VFIO_IOMMU_SPAPR TYPE_VFIO_IOMMU "-spapr"
> diff --git a/hw/vfio/container-base.c b/hw/vfio/container-base.c
> index 50b1664f89..809b157674 100644
> --- a/hw/vfio/container-base.c
> +++ b/hw/vfio/container-base.c
> @@ -83,6 +83,21 @@ int vfio_container_query_dirty_bitmap(const VFIOContainerBase *bcontainer,
>                                                  errp);
>   }
>   
> +static gpointer copy_iova_range(gconstpointer src, gpointer data)
> +{
> +     Range *source = (Range *)src;
> +     Range *dest = g_new(Range, 1);
> +
> +     range_set_bounds(dest, range_lob(source), range_upb(source));
> +     return dest;
> +}
> +
> +GList *vfio_container_get_iova_ranges(const VFIOContainerBase *bcontainer)
> +{
> +    assert(bcontainer);
> +    return g_list_copy_deep(bcontainer->iova_ranges, copy_iova_range, NULL);
> +}
> +
>   static void vfio_container_instance_finalize(Object *obj)
>   {
>       VFIOContainerBase *bcontainer = VFIO_IOMMU(obj);
> diff --git a/hw/vfio/container.c b/hw/vfio/container.c
> index 2e7ecdf10e..2ad57cd845 100644
> --- a/hw/vfio/container.c
> +++ b/hw/vfio/container.c
> @@ -1169,15 +1169,9 @@ static GList *
>   hiod_legacy_vfio_get_iova_ranges(HostIOMMUDevice *hiod, Error **errp)
>   {
>       VFIODevice *vdev = hiod->agent;
> -    GList *l = NULL;
>   
>       g_assert(vdev);
> -
> -    if (vdev->bcontainer) {
> -        l = g_list_copy(vdev->bcontainer->iova_ranges);
> -    }
> -
> -    return l;
> +    return vfio_container_get_iova_ranges(vdev->bcontainer);
>   }
>   
>   static void vfio_iommu_legacy_instance_init(Object *obj)
> diff --git a/hw/vfio/iommufd.c b/hw/vfio/iommufd.c
> index c2f158e603..890d8d6a38 100644
> --- a/hw/vfio/iommufd.c
> +++ b/hw/vfio/iommufd.c
> @@ -647,15 +647,9 @@ static GList *
>   hiod_iommufd_vfio_get_iova_ranges(HostIOMMUDevice *hiod, Error **errp)
>   {
>       VFIODevice *vdev = hiod->agent;
> -    GList *l = NULL;
>   
>       g_assert(vdev);
> -
> -    if (vdev->bcontainer) {
> -        l = g_list_copy(vdev->bcontainer->iova_ranges);
> -    }
> -
> -    return l;
> +    return vfio_container_get_iova_ranges(vdev->bcontainer);
>   }
>   
>   static void hiod_iommufd_vfio_class_init(ObjectClass *oc, void *data)

