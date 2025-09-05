Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88149CA1013
	for <qemu-arm@archiver.kernel.org>; Fri,  5 Sep 2025 09:58:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uuTCw-0001fp-5E; Fri, 05 Sep 2025 05:58:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uuTCt-0001eu-N0
 for qemu-arm@nongnu.org; Fri, 05 Sep 2025 05:58:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uuTCq-0007bA-33
 for qemu-arm@nongnu.org; Fri, 05 Sep 2025 05:58:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757066283;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qsUQ1LMSridGG2fTjqZ7lAQ7dbV+z1PP8SvETu6DOIc=;
 b=T6B7cHhECDLirDKLyAMjmzCq05c0rNCUOmvmoIgYLoGnmAcT35AVAWFBIIqvFQ0WdwoXux
 t14KfSGRgMJnxeWfGLpiFCjUaKue+UjrcLEAwzg4etGwPO04mUwWgDcWWCQ7METJEufG+c
 ZpD1RA6n0m5ZBY4e1zIcVGQ4xhj68lw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-111-la50CuiXOvKiiQ4-GpeVFQ-1; Fri, 05 Sep 2025 05:58:02 -0400
X-MC-Unique: la50CuiXOvKiiQ4-GpeVFQ-1
X-Mimecast-MFC-AGG-ID: la50CuiXOvKiiQ4-GpeVFQ_1757066281
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3df9f185b82so923655f8f.1
 for <qemu-arm@nongnu.org>; Fri, 05 Sep 2025 02:58:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757066281; x=1757671081;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qsUQ1LMSridGG2fTjqZ7lAQ7dbV+z1PP8SvETu6DOIc=;
 b=u2Z4HUwp/OwfCXN9qaf9oLT8x1o7kfA0WxQqZJNIwgUDG9iKnF9BbMY/CsI4sYjy0G
 J5oYccFUSvTbUrt8NeYNuWVuQykiLRBG4UsrwZVe+ZqSryJTCxS+cwE1zvm0RO2VOKzi
 6axCnyBom0XAv7mBQ5eRlOyArwPteual3VlJMO5yNsmPPkzqsq38KGMYun6yCW6IU3rv
 2vQXnSkH82V2PWqTJctUZOOX2/9Em08VMhQOK/CNOetlXFDAVnrPLvO0zvuolKdp49BO
 YReUZiqvYsQKlAWb3RIacrBxV8vgqLk48aa0BTVHU7kQoiFcoUHyE7XyyARkmAwyKR64
 YVvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUo1Ym1jKbXeoQUMVQ99On/p17P0t47wwEYHtT/kLjWBQbzGcseC9aZBPp28zIopqFdo7KunGvAXQ==@nongnu.org
X-Gm-Message-State: AOJu0YwYmYbxbD+DfRS0kOnT1oeqyDBICIIrSE085y+HB6HY+guz8lD5
 CvvFDzS2Iow7+vX+HohGlJxThbUyWRgUF0EFeU8HCKrOJNsXS2eEne8z9Ceb9Nh1HhqXUIIpiEh
 ZzhXqCKrAhBBQ7/chAQDIT2Du/EKkLIbUuAnw0Jn/A1DqgRRuPYeaVg==
X-Gm-Gg: ASbGnctSax+vOqPq7qxwWVB42hEdx6jSQ749FrHl9s2ygh8JMBZYFZrBqe0GDGi9Ia0
 VkIhoJfQmFEAIgVq9WEOhOUFFw3+NF9Uzw60CUWXqSwp89qOmQlatrh3jXmlzT+9A8ewKKFEAcK
 DIBXd1Z/G7csyw5gasmd9O+YPBuNJmVCncVBcKR+HyESXSJoJAoSLQsxH7UaZgS7DuVq4ij2d4G
 QbQH9JmIV97xm0vBzKB4gF+SGa7Eau/hfI+c/2VTpCGCDEOCGsKd+ieVOQg/9CsqpLhc2onb7EP
 PZa6zIoviFHoTdGG5zZvs31rP+LMotCyAqljjfILOq6mCUUTsSiJ1oqQzPcCEmB2Us4yEmeFqEQ
 ZFXREy4k6mVU=
X-Received: by 2002:a05:600c:a47:b0:458:bc3f:6a7b with SMTP id
 5b1f17b1804b1-45b85571260mr174585125e9.18.1757066281313; 
 Fri, 05 Sep 2025 02:58:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/oQOw6D7kr5zPOJhs/mWByAYxEtGYy4q3TQfvcv9jKGWW7RGVIOjhfqD2NhE89631nD9H6w==
X-Received: by 2002:a05:600c:a47:b0:458:bc3f:6a7b with SMTP id
 5b1f17b1804b1-45b85571260mr174584795e9.18.1757066280887; 
 Fri, 05 Sep 2025 02:58:00 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b9a6ecfafsm164487515e9.21.2025.09.05.02.57.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Sep 2025 02:58:00 -0700 (PDT)
Message-ID: <2bc9b909-e25b-4b4d-b4db-0cf1d10a339b@redhat.com>
Date: Fri, 5 Sep 2025 11:57:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 10/15] hw/arm/smmuv3-accel: Allocate a vDEVICE
 object for device
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, linuxarm@huawei.com,
 wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, zhangfei.gao@linaro.org,
 zhenzhong.duan@intel.com, shameerkolothum@gmail.com
References: <20250714155941.22176-1-shameerali.kolothum.thodi@huawei.com>
 <20250714155941.22176-11-shameerali.kolothum.thodi@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250714155941.22176-11-shameerali.kolothum.thodi@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Z4Dr53cNTaextrJM6gKYRDrDX0n7Y80n33usnppIfdo_1757066281
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

Hi Shameer,

On 7/14/25 5:59 PM, Shameer Kolothum wrote:
> From: Nicolin Chen <nicolinc@nvidia.com>
>
> Allocate and associate a vDEVICE object for the Guest device
> with the vIOMMU. This will help the kernel to do the
> vSID --> sid translation whenever required (eg: device specific
I am not sure I get this. Do you mean translation between the vSID and
the pSID?

> invalidations).
>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>  hw/arm/smmuv3-accel.c    | 25 +++++++++++++++++++++++++
>  hw/arm/smmuv3-accel.h    |  1 +
>  include/system/iommufd.h |  5 +++++
>  3 files changed, 31 insertions(+)
>
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> index 74bf20cfaf..f1584dd775 100644
> --- a/hw/arm/smmuv3-accel.c
> +++ b/hw/arm/smmuv3-accel.c
> @@ -93,6 +93,23 @@ void smmuv3_accel_install_nested_ste(SMMUState *bs, SMMUDevice *sdev, int sid)
>          return;
>      }
>  
> +    if (!accel_dev->vdev && accel_dev->idev) {
> +        IOMMUFDVdev *vdev;
> +        uint32_t vdev_id;
> +        SMMUViommu *viommu = accel_dev->viommu;
> +
> +        iommufd_backend_alloc_vdev(viommu->core.iommufd, accel_dev->idev->devid,
> +                                   viommu->core.viommu_id, sid, &vdev_id,
> +                                   &error_abort);
error_abort vs error handling
> +        vdev = g_new(IOMMUFDVdev, 1);
> +        vdev->vdev_id = vdev_id;
> +        vdev->dev_id = sid;
> +        accel_dev->vdev = vdev;
> +        host_iommu_device_iommufd_attach_hwpt(accel_dev->idev,
> +                                              accel_dev->viommu->bypass_hwpt_id,
> +                                              &error_abort);
> +    }
> +
>      ret = smmu_find_ste(sdev->smmu, sid, &ste, &event);
>      if (ret) {
>          error_report("failed to find STE for sid 0x%x", sid);
> @@ -287,6 +304,7 @@ static void smmuv3_accel_unset_iommu_device(PCIBus *bus, void *opaque,
>      SMMUPciBus *sbus = g_hash_table_lookup(bs->smmu_pcibus_by_busptr, bus);
>      SMMUv3AccelDevice *accel_dev;
>      SMMUViommu *viommu;
> +    IOMMUFDVdev *vdev;
>      SMMUDevice *sdev;
>  
>      if (!sbus) {
> @@ -310,6 +328,13 @@ static void smmuv3_accel_unset_iommu_device(PCIBus *bus, void *opaque,
>      trace_smmuv3_accel_unset_iommu_device(devfn, smmu_get_sid(sdev));
>  
>      viommu = s->s_accel->viommu;
> +    vdev = accel_dev->vdev;
> +    if (vdev) {
> +        iommufd_backend_free_id(viommu->iommufd, vdev->vdev_id);
> +        g_free(vdev);
> +        accel_dev->vdev = NULL;
> +    }
> +
>      if (QLIST_EMPTY(&viommu->device_list)) {
>          iommufd_backend_free_id(viommu->iommufd, viommu->bypass_hwpt_id);
>          iommufd_backend_free_id(viommu->iommufd, viommu->abort_hwpt_id);
> diff --git a/hw/arm/smmuv3-accel.h b/hw/arm/smmuv3-accel.h
> index 06e81b630d..21028e60c8 100644
> --- a/hw/arm/smmuv3-accel.h
> +++ b/hw/arm/smmuv3-accel.h
> @@ -40,6 +40,7 @@ typedef struct SMMUv3AccelDevice {
>      HostIOMMUDeviceIOMMUFD *idev;
>      SMMUS1Hwpt  *s1_hwpt;
>      SMMUViommu *viommu;
> +    IOMMUFDVdev  *vdev;
>      QLIST_ENTRY(SMMUv3AccelDevice) next;
>  } SMMUv3AccelDevice;
>  
> diff --git a/include/system/iommufd.h b/include/system/iommufd.h
> index b7ad2cf10c..8de559d448 100644
> --- a/include/system/iommufd.h
> +++ b/include/system/iommufd.h
> @@ -44,6 +44,11 @@ typedef struct IOMMUFDViommu {
>      uint32_t viommu_id;
>  } IOMMUFDViommu;
>  
> +typedef struct IOMMUFDVdev {
> +    uint32_t vdev_id;
> +    uint32_t dev_id;
> +} IOMMUFDVdev;
Given the jungle of devices and dev_ids we have, I think we need to have
either proper doc comments explaining what the objects abstracts and role

Thanks

Eric
> +
>  bool iommufd_backend_connect(IOMMUFDBackend *be, Error **errp);
>  void iommufd_backend_disconnect(IOMMUFDBackend *be);
>  


