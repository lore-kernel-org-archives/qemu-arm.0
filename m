Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C45EDF14D
	for <qemu-arm@archiver.kernel.org>; Fri, 13 Feb 2026 10:19:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vqqGl-0004Vc-JX; Fri, 13 Feb 2026 05:19:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vqqGj-0004Ui-F0
 for qemu-arm@nongnu.org; Fri, 13 Feb 2026 05:19:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vqqGh-0004T1-An
 for qemu-arm@nongnu.org; Fri, 13 Feb 2026 05:19:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770977961;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4sGkkhYe5e+/5k8OgsUcYJfgnNu70piCdcjSXzckr8U=;
 b=HjSchy0zU1EGhlu72xQq5JcS2nc+y0Mn4+9S6l2/EJohmP2828LU8Ad/RP6dJWBEEVQsQI
 +B0e2kaVgCl3bQvZVfmLPLte2+fnFTdb5EDOnKvBuC3X1U9Jv6esoO4hC1i33WEdVynF8x
 TxAA58P1QnzLh/BKokA+sqg4HhRY35w=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-581-ccqyNvtCMaqvJO7lkHHncQ-1; Fri, 13 Feb 2026 05:19:20 -0500
X-MC-Unique: ccqyNvtCMaqvJO7lkHHncQ-1
X-Mimecast-MFC-AGG-ID: ccqyNvtCMaqvJO7lkHHncQ_1770977959
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-48069a43217so6858205e9.1
 for <qemu-arm@nongnu.org>; Fri, 13 Feb 2026 02:19:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770977959; x=1771582759;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4sGkkhYe5e+/5k8OgsUcYJfgnNu70piCdcjSXzckr8U=;
 b=mQ2/tDyQGe9NpydN2WhDEQgTf9Vfx9sfmh6cPVig4Ruk3dD0iSEn+tE4tEETevbTOb
 bc+RS7lTBFDo/+AStdZEMXYJDZcq59v662lslNB9cCHcy8MRHR0+IWA6OgL/RWwi8jvC
 Au2M2wwKNp8wCBceJhkwynlsljJo6b/fE8WdHWstGv+Tc1DGsFhA54v8VZTsTtg0KisD
 BFn8HNDlhE2PiTnGM2+vMk78EkN04Br1X+woeIwHgSjDlvLuKCGxp4cmyshur8PD71ai
 eSkK9+Wn3b48wvVnt6Yu/oJCgPDenSyutMoe3Bx2q8B2jrfTVkteKiw34KV4u5mr4DbC
 Y5TQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfJTIJ1B/LuD9vNbe49t899g392dy/py414zcxMHhhKcP206v+nmaS/WzX1hgLbvthhcRrXA4cWA==@nongnu.org
X-Gm-Message-State: AOJu0YzNu9OXPAx/4j/TXlbchhrHAo+dRWb23wPKZf8BR+r/Uhd+NJUL
 zS8SFYIXw0bGzdJqOVCg3KoHWUNS9vAD/B69mnyPBbl4LLmgG9LE/KVLtf9aJ4Uyj+V4Sw/rwK1
 a9vPQK2BpR3QFj/c06Zm75vHZsalLLUXv1udVhbUfQ6IqyxLw0gCR8Q==
X-Gm-Gg: AZuq6aLbK3fkEigUb5DMtVhjc0rCx13nWVNkGWS7UTXCTn8+zq3ApZPh/e7DQbjQJVb
 ty/UFyZ3nCxEXQHFzKgJkeu0g6dre/Unz0atNdetWGlYzrzqi4qfiw1aBsrcha0bMJffV4CzQp+
 VhWQ/RTsuKK+6pWd9tb/aIp1N9/ncu+92farhQXncbUVTHk5f+51uXdbvki8+VDlw1iWjBhnART
 uGVjGtoGjXqj/vQF4gCcTZxTe+E61nkF7jRgHAv4kWMudv9ywTCoviuf+T1/Rt0Z4tHyy8bJ1Km
 krVZJv5jan818zwOh3V5/BHH2RGCkbrzj4n2F35Tmyetf82mHKQJkrVLptU6K0A0s1xSJW47kmh
 lwlWnY566pA0LuyZDADsFH6p3uJl1u4BoA5HSLJN53ZVUT05zVGRocRQnEt4zl8S0gc1Pzw==
X-Received: by 2002:a05:600c:4e0b:b0:476:d494:41d2 with SMTP id
 5b1f17b1804b1-48373a5977fmr18272345e9.29.1770977959259; 
 Fri, 13 Feb 2026 02:19:19 -0800 (PST)
X-Received: by 2002:a05:600c:4e0b:b0:476:d494:41d2 with SMTP id
 5b1f17b1804b1-48373a5977fmr18271965e9.29.1770977958815; 
 Fri, 13 Feb 2026 02:19:18 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483746d7e82sm21501295e9.3.2026.02.13.02.19.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Feb 2026 02:19:18 -0800 (PST)
Message-ID: <cf34ad79-1914-428c-8999-8a4faf337a15@redhat.com>
Date: Fri, 13 Feb 2026 11:19:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/24] backends/iommufd: Introduce
 iommufd_backend_viommu_mmap
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, clg@redhat.com, alex@shazbot.org,
 nicolinc@nvidia.com, nathanc@nvidia.com, mochs@nvidia.com, jan@nvidia.com,
 jgg@nvidia.com, jonathan.cameron@huawei.com, zhangfei.gao@linaro.org,
 zhenzhong.duan@intel.com, kjaju@nvidia.com
References: <20260206144823.80655-1-skolothumtho@nvidia.com>
 <20260206144823.80655-5-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260206144823.80655-5-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LnB1yzhkIPX2Wgt7eFYgtShM0Exn4IRtmsJI1VoqSgE_1770977959
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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



On 2/6/26 3:48 PM, Shameer Kolothum wrote:
> From: Nicolin Chen <nicolinc@nvidia.com>
>
> Add a backend helper to mmap hardware MMIO regions exposed via iommufd for
> a vIOMMU instance. This allows user space to access HW-accelerated MMIO
> pages provided by the vIOMMU.
>
> The caller is responsible for unmapping the returned region.
>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  backends/iommufd.c       | 22 ++++++++++++++++++++++
>  backends/trace-events    |  1 +
>  include/system/iommufd.h |  4 ++++
>  3 files changed, 27 insertions(+)
>
> diff --git a/backends/iommufd.c b/backends/iommufd.c
> index c6b79da0d4..9e30501d38 100644
> --- a/backends/iommufd.c
> +++ b/backends/iommufd.c
> @@ -578,6 +578,28 @@ bool iommufd_backend_alloc_hw_queue(IOMMUFDBackend *be, uint32_t viommu_id,
>      return true;
>  }
>  
> +/*
> + * Helper to mmap HW MMIO regions exposed via iommufd for a vIOMMU instance.
> + * The caller is responsible for unmapping the mapped region.
> + */
> +bool iommufd_backend_viommu_mmap(IOMMUFDBackend *be, uint32_t viommu_id,
> +                                 uint64_t size, off_t offset, void **out_ptr,
> +                                 Error **errp)
Looking at this again, there is nothing really related to iommufd. This
could simply end up as a static helper in tegra241-cmdqv.c

Eric
> +{
> +    g_assert(viommu_id);
> +    g_assert(out_ptr);
> +
> +    *out_ptr = mmap(NULL, size, PROT_READ | PROT_WRITE, MAP_SHARED, be->fd,
> +                   offset);
> +    trace_iommufd_backend_viommu_mmap(be->fd, viommu_id, size, offset);
> +    if (*out_ptr == MAP_FAILED) {
> +        error_setg_errno(errp, errno, "IOMMUFD vIOMMU mmap failed");
> +        return false;
> +    }
> +
> +    return true;
> +}
> +
>  bool host_iommu_device_iommufd_attach_hwpt(HostIOMMUDeviceIOMMUFD *idev,
>                                             uint32_t hwpt_id, Error **errp)
>  {
> diff --git a/backends/trace-events b/backends/trace-events
> index 3e70338750..f824a8d197 100644
> --- a/backends/trace-events
> +++ b/backends/trace-events
> @@ -25,6 +25,7 @@ iommufd_backend_alloc_viommu(int iommufd, uint32_t dev_id, uint32_t type, uint32
>  iommufd_backend_alloc_vdev(int iommufd, uint32_t dev_id, uint32_t viommu_id, uint64_t virt_id, uint32_t vdev_id, int ret) " iommufd=%d dev_id=%u viommu_id=%u virt_id=0x%"PRIx64" vdev_id=%u (%d)"
>  iommufd_viommu_alloc_eventq(int iommufd, uint32_t viommu_id, uint32_t type, uint32_t veventq_id, uint32_t veventq_fd, int ret) " iommufd=%d viommu_id=%u type=%u veventq_id=%u veventq_fd=%u (%d)"
>  iommufd_backend_alloc_hw_queue(int iommufd, uint32_t viommu_id, uint32_t queue_type, uint32_t index, uint64_t addr, uint64_t size, uint32_t queue_id, int ret) " iommufd=%d viommu_id=%u queue_type=%u index=%u addr=0x%"PRIx64" size=0x%"PRIx64" queue_id=%u (%d)"
> +iommufd_backend_viommu_mmap(int iommufd, uint32_t viommu_id, uint64_t size, uint64_t offset) " iommufd=%d viommu_id=%u size=0x%"PRIx64" offset=0x%"PRIx64
>  
>  # igvm-cfg.c
>  igvm_reset_enter(int type) "type=%u"
> diff --git a/include/system/iommufd.h b/include/system/iommufd.h
> index f72ad545f8..87ddc39041 100644
> --- a/include/system/iommufd.h
> +++ b/include/system/iommufd.h
> @@ -111,6 +111,10 @@ bool iommufd_backend_alloc_hw_queue(IOMMUFDBackend *be, uint32_t viommu_id,
>                                      uint64_t length, uint32_t *out_hw_queue_id,
>                                      Error **errp);
>  
> +bool iommufd_backend_viommu_mmap(IOMMUFDBackend *be, uint32_t viommu_id,
> +                                 uint64_t size, off_t offset, void **out_ptr,
> +                                 Error **errp);
> +
>  bool iommufd_backend_set_dirty_tracking(IOMMUFDBackend *be, uint32_t hwpt_id,
>                                          bool start, Error **errp);
>  bool iommufd_backend_get_dirty_bitmap(IOMMUFDBackend *be, uint32_t hwpt_id,


