Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2074822lfi;
        Thu, 26 Mar 2020 09:06:30 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vs9QOBOC3z5AQw+5FUsOIq1hPl5PE8Y+5w7rtdhNTXZ7FrQUaZd/fmGAxZfga6Rt5X1Bfat
X-Received: by 2002:a37:aec3:: with SMTP id x186mr8610163qke.419.1585238790324;
        Thu, 26 Mar 2020 09:06:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585238790; cv=none;
        d=google.com; s=arc-20160816;
        b=xEOGZh9fNpwcQ3C/huQSpXK3ykWo+bmfa2vCMD6l52HWM1vTz6/nDFmg/6kO1+m7xp
         mEtQEAlFzRrHdSRVGZLFUrwE4PHEONu8Bg9D1w7chl6bXg5q7voVYTNtzhOsG5fbh/k7
         KWEcL+Ohi8PHR9Cj8DMoluuqDIE1T2J9DIxdkDUnoHdAAhtkBH7Dvdga/i1Bxid/WjQc
         2+0dXEyk2JjGgMLcnPsz7mAsEgzcWB6lNhZWh24e6AghFta0/59SKuf497Mk7sHphi7o
         SrC0mUIQGvaMpQkUI9/nxql0Ssg6hUkt1uINZZ8HAcfLe7LFzlhHonzT4wkI1PDgNSxv
         IiTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=fkauqUFsbMmEqiYvCJJrupw7dfDcZBEjmkwZVC2o2Es=;
        b=SqaCXK5vmIOGoUUhTcBJzxGsm1DL0uuHeKFhl1sneKyUl7PIF/VnlDipbL6R6vxA/b
         iRRTqGdoE8dFgyZYiAoWtNgLWX2tNA2VaTeewE7tY3+Pu8rW/BNLzdC5uDZpkFJRJc5G
         uC9jHov8x6yLIMLVs9m3KPA+dlUdQ+xadQfFGrFUJEJXX1BKLfbD7yratl8cMtJbWztL
         yAsbmb+0sN5G5GUAFZWs5DpyOQVplEn7YB5m6wSeylB2aXtyYtH+Y3KUJlN0/5v4W0bK
         3a7OL7H15+gZWv23bhydJ5f2Rr+nGgRKyww2fRjho6uwc+CSuYKb2ZkboJ24F++c/jDv
         BapA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NQAbu777;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u5si1571848qtj.200.2020.03.26.09.06.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Mar 2020 09:06:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NQAbu777;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jHV1Z-0002no-PV
	for alex.bennee@linaro.org; Thu, 26 Mar 2020 12:06:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58720)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1jHV1R-0002nX-R3
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 12:06:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1jHV1Q-00082F-Ih
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 12:06:21 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:31805)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1jHV1Q-00081n-Eb
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 12:06:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585238779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fkauqUFsbMmEqiYvCJJrupw7dfDcZBEjmkwZVC2o2Es=;
 b=NQAbu7774gpzGzTR7LYjyKa3PMPWlz5Rvb7yZZcN8IiqMtTyXVE7PLa6AZeQfigs6oTw45
 0ydh9m+dlt8oL23QwJTMZoJswnqXLyW3z8loOK53DtvDa+q0RM6XF2pmd5gD6QB0P8HZrp
 6q9tVAcobKSCQ+Q2TyHu9Wxc+b7WU1k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-BhYQ7c_tNey7j2mUTHdNQQ-1; Thu, 26 Mar 2020 12:06:18 -0400
X-MC-Unique: BhYQ7c_tNey7j2mUTHdNQQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B789A800D4E;
 Thu, 26 Mar 2020 16:06:16 +0000 (UTC)
Received: from [10.36.113.142] (ovpn-113-142.ams2.redhat.com [10.36.113.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A20C100EBBD;
 Thu, 26 Mar 2020 16:06:04 +0000 (UTC)
Subject: Re: [PATCH v9 2/9] memory: Add interface to set iommu page size mask
To: Bharat Bhushan <bbhushan2@marvell.com>, peter.maydell@linaro.org,
 peterx@redhat.com, eric.auger.pro@gmail.com, alex.williamson@redhat.com,
 kevin.tian@intel.com, mst@redhat.com, tnowicki@marvell.com,
 drjones@redhat.com, linuc.decode@gmail.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, bharatb.linux@gmail.com, jean-philippe@linaro.org,
 yang.zhong@intel.com
References: <20200323084617.1782-1-bbhushan2@marvell.com>
 <20200323084617.1782-3-bbhushan2@marvell.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <325b9322-54b9-e0ea-a67c-52fa91082173@redhat.com>
Date: Thu, 26 Mar 2020 17:06:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20200323084617.1782-3-bbhushan2@marvell.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oM9DszYRPNmK

Hi Bharat,
On 3/23/20 9:46 AM, Bharat Bhushan wrote:
> Allow to set page size mask to be supported by iommu.
by iommu memory region. I mean this is not global to the IOMMU.
> This is required to expose page size mask compatible with
> host with virtio-iommu.
> 
> Signed-off-by: Bharat Bhushan <bbhushan2@marvell.com>
> ---
>  include/exec/memory.h | 20 ++++++++++++++++++++
>  memory.c              | 10 ++++++++++
>  2 files changed, 30 insertions(+)
> 
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index e85b7de99a..063c424854 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -355,6 +355,16 @@ typedef struct IOMMUMemoryRegionClass {
>       * @iommu: the IOMMUMemoryRegion
>       */
>      int (*num_indexes)(IOMMUMemoryRegion *iommu);
> +
> +    /*
> +     * Set supported IOMMU page size
> +     *
> +     * Optional method: if this is supported then set page size that
> +     * can be supported by IOMMU. This is called to set supported page
> +     * size as per host Linux.
What about: If supported, allows to restrict the page size mask that can
be supported with a given IOMMU memory region. For example, this allows
to propagate host physical IOMMU page size mask limitations to the
virtual IOMMU (vfio assignment with virtual iommu).
> +     */
> +     void (*iommu_set_page_size_mask)(IOMMUMemoryRegion *iommu,
> +                                      uint64_t page_size_mask);
>  } IOMMUMemoryRegionClass;
>  
>  typedef struct CoalescedMemoryRange CoalescedMemoryRange;
> @@ -1363,6 +1373,16 @@ int memory_region_iommu_attrs_to_index(IOMMUMemoryRegion *iommu_mr,
>   */
>  int memory_region_iommu_num_indexes(IOMMUMemoryRegion *iommu_mr);
>  
> +/**
> + * memory_region_iommu_set_page_size_mask: set the supported pages
> + * size by iommu.
supported page sizes for a given IOMMU memory region
> + *
> + * @iommu_mr: the memory region
IOMMU memory region
> + * @page_size_mask: supported page size mask
> + */
> +void memory_region_iommu_set_page_size_mask(IOMMUMemoryRegion *iommu_mr,
> +                                            uint64_t page_size_mask);
> +
>  /**
>   * memory_region_name: get a memory region's name
>   *
> diff --git a/memory.c b/memory.c
> index aeaa8dcc9e..14c8783084 100644
> --- a/memory.c
> +++ b/memory.c
> @@ -1833,6 +1833,16 @@ static int memory_region_update_iommu_notify_flags(IOMMUMemoryRegion *iommu_mr,
>      return ret;
>  }
>  
> +void memory_region_iommu_set_page_size_mask(IOMMUMemoryRegion *iommu_mr,
> +                                            uint64_t page_size_mask)
> +{
> +    IOMMUMemoryRegionClass *imrc = IOMMU_MEMORY_REGION_GET_CLASS(iommu_mr);
> +
> +    if (imrc->iommu_set_page_size_mask) {
> +        imrc->iommu_set_page_size_mask(iommu_mr, page_size_mask);
Shouldn't it return an int in case the setting cannot be applied?
> +    }
> +}
> +
>  int memory_region_register_iommu_notifier(MemoryRegion *mr,
>                                            IOMMUNotifier *n, Error **errp)
>  {
> 
Thanks
Eric

