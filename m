Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp944594njc;
        Wed, 26 Jun 2024 05:44:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW2UuNFTnwbgjck2tPMKgr1sLNRwDrbN3H0YY1PNOqAxt2HgekQc9x0bWwLEMNkheQvoTZpDgND8naJdCKZvJq5B1QjItIY
X-Google-Smtp-Source: AGHT+IHFvnd6ljz09NVbRwsqPa/gtv7Bv4XwTTQvukhL+qnp3q+uyIX1zo9/e0dqfVkSWJ3X//08
X-Received: by 2002:a05:622a:8388:b0:441:592f:97a8 with SMTP id d75a77b69052e-444d92134e3mr170972771cf.41.1719405877619;
        Wed, 26 Jun 2024 05:44:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719405877; cv=none;
        d=google.com; s=arc-20160816;
        b=T2n48eC4GZ9jO0wquVMtiOZyVEYfQgowA7qnxQYuBB+UnnJvARiocaevJUP1mmoVAC
         BUQuHwuoBFWxdS9flqciMGyw3qEfMdr4DdFo212m0FFYhBO6iBi05BsLGwoc2wBD2Fbw
         KKmf5JWfQfVnMZhZSK5q/1tnOIdBaJgdRekZxIJFo5hcBMeKHuaIWLT4mXZyqJ/Su3xK
         QcoAMwIQRvx+OZewvcEFAkFajyL6YGOu4HZ1Nh92hAxU4FMzR4cwUyw/ZfKpl7MJulQq
         3W/zIFUPxktgz4npgWw7wY4Rjkl5qTBj9NzDX7nBQ9IYZBgAv30f+zv97ZmUoCVKRnmG
         UmPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=18VrglAW3/j+axokzwCmxHvnzRZtsIvQDdbWdooqZs8=;
        fh=BvecBBp0pN1sBrbcU5pQwikT/tmPRG2zdCEgz/5uLHI=;
        b=cEDEkAftTNzAxdSySdwOkYo1rCoujhj4gGR9R9loDAGYj0qLL7m/Dpo700KHFrq0v7
         O+5mR5T9cFme9iW8/zznQKZZLkYSpXV1SIVbjASHQP4tWdWWUVjvDfgoWQpKGEry5FfB
         KQ6GkhxfDvD8vbgbUsQON+BPkEM7CLNsweeG0RUbo5usPIEvs6i3HaEMITfB5EbYgVn0
         uCAz0iDQJRDyqJ6/uXArlO93Fi4ato0vGJlsMqRm2QBeBpVqtBC8hQZkzpHsCpHt/KUB
         XEnEAfwvY+nXJ7pum2f8EaTJpeanlGgLe6bQn9ermfn1nY9KOk60pd9ImvbWj9hgjUBK
         aRpQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=byThLi0e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-444c2b70f68si126561201cf.214.2024.06.26.05.44.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Jun 2024 05:44:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=byThLi0e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sMS0h-0003mj-SO; Wed, 26 Jun 2024 08:44:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sMS0e-0003ld-DB
 for qemu-arm@nongnu.org; Wed, 26 Jun 2024 08:44:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sMS0c-0000iC-PX
 for qemu-arm@nongnu.org; Wed, 26 Jun 2024 08:44:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719405862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=18VrglAW3/j+axokzwCmxHvnzRZtsIvQDdbWdooqZs8=;
 b=byThLi0eJQXIf0k9/AtFLV73b7GN2+4m6w7Oyjg8TSUzrgwSy1TsX5AtKG2y+xuP71RlWF
 P0u5ENe2kqLGUkrmkWu2crlGtuEAdLoARWlf5A2UjhQBfUr9SGONaerpqJ5mmjs48wE68/
 wY3HPZ4AZ2lJGXztcUDWz4eRz4e0bug=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-bmTa7Bm0NT-8PPsygAX5iw-1; Wed, 26 Jun 2024 08:44:20 -0400
X-MC-Unique: bmTa7Bm0NT-8PPsygAX5iw-1
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-79d58cde738so8135985a.3
 for <qemu-arm@nongnu.org>; Wed, 26 Jun 2024 05:44:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719405860; x=1720010660;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=18VrglAW3/j+axokzwCmxHvnzRZtsIvQDdbWdooqZs8=;
 b=HBiqNT/39Q1svHm0Hl4sEUGBej2QACSbuYa++IWwz7AXKT62/fiiBgLB4CVzqsHqZW
 mkZOv0dhoSkZg5nTxTss1YAu5pUqQ4yrTu0H99yxgt75BT6fVc1kq3byT1HQ7c5WG/+w
 pBxUv6fCxKcQfDl8qCOnGc50QxGyVCneV8AejXl8A5yjE0FefSuYEYtJIukYm40qvLhZ
 mElWVZliTIG0nL8hUCFlbc6/t28j6L+ZZNXHykHEKXkE8UWOuo04Q1s0Se4P61TnKGNq
 z1z1zsgaD7NnWee2GZ5XHc8Cq4YdeyMxHDGy0lBv0TrRqFhmUvsmWhmtr1dHvyIwuFTT
 R+XQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3nls75nPjWJ5fAGEb75i1aW6cj1Y4dO+4jR49voAbdY22mrlqlFJo2JiTBPsJOe8/m2e+wNOApVdaRxWGjN4uTUQg
X-Gm-Message-State: AOJu0YxSh73VNW7BF8nJX1L2eX/JV5QnNX4CC98rdbhA20l0LpfvjR+j
 GrphGoOdeXqmEiI+Bze5+5EpP6xuaB3Cn3gbjh85NhBrkS6OZ15fVPBqd/l36mVtGlTtQ0RQvFU
 /W7b1Oq5Rl5j0tIBAzktn+W4KXMANCQeyZnoE9+w3bAhIKxzBkw==
X-Received: by 2002:a05:620a:2903:b0:79d:55f0:d09a with SMTP id
 af79cd13be357-79d55f0d424mr73787685a.25.1719405860276; 
 Wed, 26 Jun 2024 05:44:20 -0700 (PDT)
X-Received: by 2002:a05:620a:2903:b0:79d:55f0:d09a with SMTP id
 af79cd13be357-79d55f0d424mr73785985a.25.1719405859877; 
 Wed, 26 Jun 2024 05:44:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79c1117638bsm89513285a.3.2024.06.26.05.44.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jun 2024 05:44:19 -0700 (PDT)
Message-ID: <975410b5-40e4-4f9a-8611-980b5beabd21@redhat.com>
Date: Wed, 26 Jun 2024 14:44:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] HostIOMMUDevice: Introduce get_page_size_mask()
 callback
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, mst@redhat.com,
 jean-philippe@linaro.org, peter.maydell@linaro.org, yanghliu@redhat.com,
 zhenzhong.duan@intel.com, alex.williamson@redhat.com
References: <20240626082727.1278530-1-eric.auger@redhat.com>
 <20240626082727.1278530-5-eric.auger@redhat.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <20240626082727.1278530-5-eric.auger@redhat.com>
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
X-TUID: JNRN8jkWaG08

On 6/26/24 10:26 AM, Eric Auger wrote:
> This callback will be used to retrieve the page size mask supported
> along a given Host IOMMU device.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>


Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> ---
>   include/hw/vfio/vfio-container-base.h |  7 +++++++
>   include/sysemu/host_iommu_device.h    |  8 ++++++++
>   hw/vfio/container.c                   | 10 ++++++++++
>   hw/vfio/iommufd.c                     | 11 +++++++++++
>   4 files changed, 36 insertions(+)
> 
> diff --git a/include/hw/vfio/vfio-container-base.h b/include/hw/vfio/vfio-container-base.h
> index 45d7c40fce..62a8b60d87 100644
> --- a/include/hw/vfio/vfio-container-base.h
> +++ b/include/hw/vfio/vfio-container-base.h
> @@ -88,6 +88,13 @@ int vfio_container_query_dirty_bitmap(const VFIOContainerBase *bcontainer,
>   
>   GList *vfio_container_get_iova_ranges(const VFIOContainerBase *bcontainer);
>   
> +static inline uint64_t
> +vfio_container_get_page_size_mask(const VFIOContainerBase *bcontainer)
> +{
> +    assert(bcontainer);
> +    return bcontainer->pgsizes;
> +}
> +
>   #define TYPE_VFIO_IOMMU "vfio-iommu"
>   #define TYPE_VFIO_IOMMU_LEGACY TYPE_VFIO_IOMMU "-legacy"
>   #define TYPE_VFIO_IOMMU_SPAPR TYPE_VFIO_IOMMU "-spapr"
> diff --git a/include/sysemu/host_iommu_device.h b/include/sysemu/host_iommu_device.h
> index 05c7324a0d..c1bf74ae2c 100644
> --- a/include/sysemu/host_iommu_device.h
> +++ b/include/sysemu/host_iommu_device.h
> @@ -89,6 +89,14 @@ struct HostIOMMUDeviceClass {
>        * @hiod: handle to the host IOMMU device
>        */
>       GList* (*get_iova_ranges)(HostIOMMUDevice *hiod);
> +    /**
> +     *
> +     * @get_page_size_mask: Return the page size mask supported along this
> +     * @hiod Host IOMMU device
> +     *
> +     * @hiod: handle to the host IOMMU device
> +     */
> +    uint64_t (*get_page_size_mask)(HostIOMMUDevice *hiod);
>   };
>   
>   /*
> diff --git a/hw/vfio/container.c b/hw/vfio/container.c
> index adeab1ac89..b5ce559a0d 100644
> --- a/hw/vfio/container.c
> +++ b/hw/vfio/container.c
> @@ -1174,6 +1174,15 @@ hiod_legacy_vfio_get_iova_ranges(HostIOMMUDevice *hiod)
>       return vfio_container_get_iova_ranges(vdev->bcontainer);
>   }
>   
> +static uint64_t
> +hiod_legacy_vfio_get_page_size_mask(HostIOMMUDevice *hiod)
> +{
> +    VFIODevice *vdev = hiod->agent;
> +
> +    g_assert(vdev);
> +    return vfio_container_get_page_size_mask(vdev->bcontainer);
> +}
> +
>   static void vfio_iommu_legacy_instance_init(Object *obj)
>   {
>       VFIOContainer *container = VFIO_IOMMU_LEGACY(obj);
> @@ -1188,6 +1197,7 @@ static void hiod_legacy_vfio_class_init(ObjectClass *oc, void *data)
>       hioc->realize = hiod_legacy_vfio_realize;
>       hioc->get_cap = hiod_legacy_vfio_get_cap;
>       hioc->get_iova_ranges = hiod_legacy_vfio_get_iova_ranges;
> +    hioc->get_page_size_mask = hiod_legacy_vfio_get_page_size_mask;
>   };
>   
>   static const TypeInfo types[] = {
> diff --git a/hw/vfio/iommufd.c b/hw/vfio/iommufd.c
> index 211e7223f1..7b5f87a148 100644
> --- a/hw/vfio/iommufd.c
> +++ b/hw/vfio/iommufd.c
> @@ -652,12 +652,23 @@ hiod_iommufd_vfio_get_iova_ranges(HostIOMMUDevice *hiod)
>       return vfio_container_get_iova_ranges(vdev->bcontainer);
>   }
>   
> +static uint64_t
> +hiod_iommufd_vfio_get_page_size_mask(HostIOMMUDevice *hiod)
> +{
> +    VFIODevice *vdev = hiod->agent;
> +
> +    g_assert(vdev);
> +    return vfio_container_get_page_size_mask(vdev->bcontainer);
> +}
> +
> +
>   static void hiod_iommufd_vfio_class_init(ObjectClass *oc, void *data)
>   {
>       HostIOMMUDeviceClass *hiodc = HOST_IOMMU_DEVICE_CLASS(oc);
>   
>       hiodc->realize = hiod_iommufd_vfio_realize;
>       hiodc->get_iova_ranges = hiod_iommufd_vfio_get_iova_ranges;
> +    hiodc->get_page_size_mask = hiod_iommufd_vfio_get_page_size_mask;
>   };
>   
>   static const TypeInfo types[] = {

