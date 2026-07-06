Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0285EC44500
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Jul 2026 11:20:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wghMi-0003IP-4y; Mon, 06 Jul 2026 07:19:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1wghMh-0003IG-9P
 for qemu-arm@nongnu.org; Mon, 06 Jul 2026 07:19:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1wghMf-0005bq-Jk
 for qemu-arm@nongnu.org; Mon, 06 Jul 2026 07:19:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1783336792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=TOYYYHcW4HvlYkKCkWv3vdVD2qGByTWBx92mCzRFrw4=;
 b=RY4cS+i1UKCz00ibGbWrdgxgwQFAzxzOWFsB+yLGmPPetkx8AAimpTwhLW49p/YnWPkuoa
 jA48JQO6hPOkJEOM5M4qroK5TJzBJsPLwRp/G6WOSuhb+80lWO6vY8Y62yFHA+DmmSPBVQ
 Hzaiwvad8oCBjuZ79UZVypQy0m0Pebw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-135-cVK7y0qiMZ6MpnTq-VDIGw-1; Mon, 06 Jul 2026 07:19:50 -0400
X-MC-Unique: cVK7y0qiMZ6MpnTq-VDIGw-1
X-Mimecast-MFC-AGG-ID: cVK7y0qiMZ6MpnTq-VDIGw_1783336789
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4926596eebcso18792945e9.3
 for <qemu-arm@nongnu.org>; Mon, 06 Jul 2026 04:19:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783336789; x=1783941589;
 h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=TOYYYHcW4HvlYkKCkWv3vdVD2qGByTWBx92mCzRFrw4=;
 b=jKZLC3PdDOknwnRPQDg1hwf6A3CBuXKW0s5C0rudExFALEq4Imr2Xkrm1lyDEo0KsA
 9vWakgyi2o/EXEFDaKLzU4S+LaHCF9ibVHM7Z60/CRKHcbpkStHCstoEzAJJCFnrpm5t
 kqDVGbZBvx9SEF5hfSt/i0UOLYp9enWLUWlVQApKR2+fKTg6abTVRPxDOpXYQXmEU689
 WSbo3NjKbMuFVHJzFydKcORpHpUgiLCpcRCcmYUxo15dNNNByxoKI6NH5wK5S/yjGVvI
 X9FKx3Sv4WLLrbw19lcEoN/5WUJ/cYGAElJ66fWRFmqWKGE1/HNdH7RIPY6O145u0bdO
 l6Pg==
X-Forwarded-Encrypted: i=1;
 AHgh+RrJea//xNga0BAqvm9qYSFrnLQXONHPlNRI36TYI2ynUJhpLYQexQLXrM/0XKZULVvllHLJ+zBU6Q==@nongnu.org
X-Gm-Message-State: AOJu0Yx2bnWlvprxofiakWc00rBlqnLXn/jAOXcmO/15UmAc3ygd8Tl+
 lYj19Z1vx382c1DY52Tcv7OKzH26wSSsWkmn+4lF0HJ8FohA3OofI/rZVCTYeNVUcGQjMmc05t/
 2+gVPBv4cQo3DuIy8ktg7dWFbzHihMqek7nE2oiuirTZGEHoRNrSqOA==
X-Gm-Gg: AfdE7cno7F1gHFWJQayilrOHEdvr4vSGnN4KiRymy8YEQtqmeMhsJ42ICNCTXqe7Whw
 HsDxOnvdbzB9j0dAGEOAR49+MlBjAyXKTO/sgWOyv4wvld7eB//n6SZi+X8vzOLZhNZ+NoX7GZA
 VELf1H9A0alAcVfA8JFa4z3DKfEsK8Gc4g9Jf5mgE9jPt6sCLsRlf/ThUEgwgciPrBlzYA4HMtI
 xLTeLNkpouYqtc8NJzTn0Qb0XADcduNvEwqTDpdMZeUhzxiVSxourg3wAz/kXaxYGoXk8U+IBbn
 J3Il6e+DuDDiJDkA7/jia4ztiSGR34+2hAGbyR/yjYXWc5TmpGTiNPnc3/RhQc8tUTWXrL5Q1GJ
 7e44V4/mV2/e08/qF8ACmh8pwjmYUvChdEFYhpI/50YIUk7kmYA==
X-Received: by 2002:a05:600c:19d0:b0:493:b750:bd20 with SMTP id
 5b1f17b1804b1-493d11d7df8mr103487335e9.15.1783336789482; 
 Mon, 06 Jul 2026 04:19:49 -0700 (PDT)
X-Received: by 2002:a05:600c:19d0:b0:493:b750:bd20 with SMTP id
 5b1f17b1804b1-493d11d7df8mr103486895e9.15.1783336789021; 
 Mon, 06 Jul 2026 04:19:49 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:576b:abc6:6396:ed4a?
 ([2a01:e0a:280:24f0:576b:abc6:6396:ed4a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493ccd9d620sm290252545e9.1.2026.07.06.04.19.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jul 2026 04:19:48 -0700 (PDT)
Message-ID: <948da227-22c5-4851-9584-433d5e6d5161@redhat.com>
Date: Mon, 6 Jul 2026 13:19:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] backends/iommufd: Fix dev_id and type order in viommu
 trace
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: eric.auger@redhat.com, peter.maydell@linaro.org, nicolinc@nvidia.com,
 nathanc@nvidia.com, mochs@nvidia.com, jan@nvidia.com
References: <20260706103653.84243-1-skolothumtho@nvidia.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <20260706103653.84243-1-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GXaibC9UQxLKvRS81g_l12FUNa6z4A2iDQsHZ9SL4LI_1783336789
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 7/6/26 12:36, Shameer Kolothum wrote:
> The trace event receives dev_id before type, but its format string prints
> them in the wrong order. Correct the order.
> 
> Fixes: f2d31df0d925 ("backends/iommufd: Introduce iommufd_backend_alloc_viommu")
> Reported-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>   backends/trace-events | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/backends/trace-events b/backends/trace-events
> index b63420b73e..009a25b0be 100644
> --- a/backends/trace-events
> +++ b/backends/trace-events
> @@ -21,7 +21,7 @@ iommufd_backend_free_id(int iommufd, uint32_t id, int ret) " iommufd=%d id=%d (%
>   iommufd_backend_set_dirty(int iommufd, uint32_t hwpt_id, bool start, int ret) " iommufd=%d hwpt=%u enable=%d (%d)"
>   iommufd_backend_get_dirty_bitmap(int iommufd, uint32_t hwpt_id, uint64_t iova, uint64_t size, uint64_t flags, uint64_t page_size, int ret) " iommufd=%d hwpt=%u iova=0x%"PRIx64" size=0x%"PRIx64" flags=0x%"PRIx64" page_size=0x%"PRIx64" (%d)"
>   iommufd_backend_invalidate_cache(int iommufd, uint32_t id, uint32_t data_type, uint32_t entry_len, uint32_t entry_num, uint32_t done_num, uint64_t data_ptr, int ret) " iommufd=%d id=%u data_type=%u entry_len=%u entry_num=%u done_num=%u data_ptr=0x%"PRIx64" (%d)"
> -iommufd_backend_alloc_viommu(int iommufd, uint32_t dev_id, uint32_t type, uint32_t hwpt_id, uint64_t data_ptr, uint32_t data_len, uint32_t viommu_id, int ret) " iommufd=%d type=%u dev_id=%u hwpt_id=%u data_ptr=0x%"PRIx64" data_len=0x%x viommu_id=%u (%d)"
> +iommufd_backend_alloc_viommu(int iommufd, uint32_t dev_id, uint32_t type, uint32_t hwpt_id, uint64_t data_ptr, uint32_t data_len, uint32_t viommu_id, int ret) " iommufd=%d dev_id=%u type=%u hwpt_id=%u data_ptr=0x%"PRIx64" data_len=0x%x viommu_id=%u (%d)"
>   iommufd_backend_alloc_vdev(int iommufd, uint32_t dev_id, uint32_t viommu_id, uint64_t virt_id, uint32_t vdev_id, int ret) " iommufd=%d dev_id=%u viommu_id=%u virt_id=0x%"PRIx64" vdev_id=%u (%d)"
>   iommufd_viommu_alloc_eventq(int iommufd, uint32_t viommu_id, uint32_t type, uint32_t veventq_id, uint32_t veventq_fd, int ret) " iommufd=%d viommu_id=%u type=%u veventq_id=%u veventq_fd=%u (%d)"
>   iommufd_backend_alloc_hw_queue(int iommufd, uint32_t viommu_id, uint32_t queue_type, uint32_t index, uint64_t addr, uint64_t size, uint32_t queue_id, int ret) " iommufd=%d viommu_id=%u queue_type=%u index=%u addr=0x%"PRIx64" size=0x%"PRIx64" queue_id=%u (%d)"

Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


