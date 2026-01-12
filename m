Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC4A9C9EC90
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Jan 2026 13:30:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vfHyJ-0002Av-1a; Mon, 12 Jan 2026 08:28:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vfHxk-0001ir-Us
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 08:28:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vfHxd-0004PY-2L
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 08:28:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1768224471;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IkQLIYIMTVaiFwsNKy6GJzEudKYpIPfVHLm3IK7wXlQ=;
 b=JN+0ybS6lO4K0hJSaqi7zBsMp5ONpLT9XLAeMON+hyBXwHHkkQTe6sSeV4gxP5c5u4X+Lr
 12GHYlCuokDqgXaZlR5o1GVjMYrzJFpouP8ZasIzCV/eC5ka+HPhKYp67KAp9UkMkCtqob
 vjds3DtuuR+k2Cc4iVhk2nsczBYfYXI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558-xeejb-NIPoucjEXhPCTUlw-1; Mon, 12 Jan 2026 08:27:48 -0500
X-MC-Unique: xeejb-NIPoucjEXhPCTUlw-1
X-Mimecast-MFC-AGG-ID: xeejb-NIPoucjEXhPCTUlw_1768224467
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-430fdc1fff8so3774286f8f.3
 for <qemu-arm@nongnu.org>; Mon, 12 Jan 2026 05:27:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768224467; x=1768829267;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IkQLIYIMTVaiFwsNKy6GJzEudKYpIPfVHLm3IK7wXlQ=;
 b=IJyCzMOu18vWAdZGh2H+3rBbG1RkEWkLG5jmWPRPUYHSiGvfCzIsfkXBNg7QrJDX/F
 7X0VvCTbW7mdwVKCp7fAop3it/sdAA8UrsVfS0vSkRpxzsmvm9E1pJ/jmBVj9hSffFTO
 GtYh++3mFSeMDy5OmCCY+T+EYVPxDaMGI+ahV2PtuspOGlfp9DGBrPG6zQkxQfpn/C5B
 mOTOY94rvOSJEyLcbAcxm5e3dPSjdqVscJwcPRgNe0Iv8Yfca03M1wKJ/sRNIoTYqOfZ
 qG4h5GqYifoAWHF5O/imBVOvAFzu0OaiBIvZRU38RzdVj7hcTaon9st4YUnaeIsQSawO
 EGkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLhkI8jcd71GbAdbjNEz58/9aOaPr3ibhX1+SD1zzCuPaaNPDvBnxWxQ5qG7kop+tz2JMCdKUdug==@nongnu.org
X-Gm-Message-State: AOJu0YxwyrKFsilSNgBBWFnCHHe89hppT0bSCb1b+GMZyxhEge4yQf1i
 y6djilYEtLGX+wz1thy6nYpxUsxH2essNw2es7GaR5utBuum5+UeCr/t71aaXy6pNSPzQGG/IcL
 jCmL7N/AfvNJuaS12+Pqwqrfauf5mA/dSI71DpJwL2tC0pGRXjVhq8Q==
X-Gm-Gg: AY/fxX7vgcMSrO8ufVJ+SfnpAw/uHAvLnDUJv7qVUqX6CYUxAfzz05kW0pmpHx/EiAD
 FyEdRljn5ziCUVyMupztX54jpyfBdCdO9k1c/iiDN9NIChN1KyzH3zN7RH8xW6XwvkY/fONvjMC
 3rOlSObbzX0N9gzhNBFEgIDRNJoReIJOfs3pPuD3CuZ1f1Ger+3AlTfWxwXMmQ1+3lGnFS1F76r
 BrnhlsFcDTDYW1lglHhNMaVYIujqXpPrnP7p7hjsLUBMPApgQKDYSaYHU/xiagzk72K2uDAPIIH
 8m1zqpqKv6HqSE+76tWwc2qOZyGJruP225sMPtz4VL3YGHhT5cq10+QBTQu3nDa+pEkWIVE3Tnn
 wuDtKcLjvjO4prf5vJVuFXxrQei2cb+TNiEPVPj8E7ASh1+M3jrooDeOggg==
X-Received: by 2002:a5d:5f90:0:b0:430:fd84:317a with SMTP id
 ffacd0b85a97d-432c374ff3emr20064440f8f.38.1768224467337; 
 Mon, 12 Jan 2026 05:27:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGW/I+s/ftCE4oAIcqgBWEMpCNRSN4gh37UhmvzjQW8fIlll22Vcqk6sgS4i0ZLBpL7l+hmfg==
X-Received: by 2002:a5d:5f90:0:b0:430:fd84:317a with SMTP id
 ffacd0b85a97d-432c374ff3emr20064415f8f.38.1768224466903; 
 Mon, 12 Jan 2026 05:27:46 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0dacc5sm38550879f8f.5.2026.01.12.05.27.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jan 2026 05:27:46 -0800 (PST)
Message-ID: <8bfbd034-1798-46af-a549-c9c966ed09cf@redhat.com>
Date: Mon, 12 Jan 2026 14:27:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/16] backends/iommufd: Update
 iommufd_backend_get_device_info
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, nicolinc@nvidia.com, nathanc@nvidia.com,
 mochs@nvidia.com, jgg@nvidia.com, jonathan.cameron@huawei.com,
 zhangfei.gao@linaro.org, zhenzhong.duan@intel.com, kjaju@nvidia.com
References: <20251210133737.78257-1-skolothumtho@nvidia.com>
 <20251210133737.78257-2-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20251210133737.78257-2-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: expILDNVtr0FiI1mc0UV0yEUU4IS7YsM2DYWGl7ZBPg_1768224467
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 12/10/25 2:37 PM, Shameer Kolothum wrote:
> From: Nicolin Chen <nicolinc@nvidia.com>

I would suggest to be more explicit in the commit title like:
Convey input type in iommufd_backend_get_device_info()

>
> The updated IOMMUFD uAPI introduces the ability for userspace to request
> a specific hardware info data type via IOMMU_GET_HW_INFO. Update
> iommufd_backend_get_device_info() to set IOMMU_HW_INFO_FLAG_INPUT_TYPE
> when a non-zero type is supplied, and adjust all callers to pass an
> explicitly initialised type value.
>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  backends/iommufd.c    | 7 +++++++
>  hw/arm/smmuv3-accel.c | 2 +-
>  hw/vfio/iommufd.c     | 6 ++----
>  3 files changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/backends/iommufd.c b/backends/iommufd.c
> index 633aecd525..938c8fe669 100644
> --- a/backends/iommufd.c
> +++ b/backends/iommufd.c
> @@ -386,16 +386,23 @@ bool iommufd_backend_get_dirty_bitmap(IOMMUFDBackend *be,
>      return true;
>  }
>  
> +/*
> + * @type can carry a desired HW info type defined in the uapi headers. If caller
> + * doesn't have one, indicating it wants the default type, then @type should be
> + * zeroed (i.e. IOMMU_HW_INFO_TYPE_DEFAULT).
the kernel uapi doc is a bit ambiguous as it is said:
 * @flags: Must be 0
while a flag value does exist. 
> + */
>  bool iommufd_backend_get_device_info(IOMMUFDBackend *be, uint32_t devid,
>                                       uint32_t *type, void *data, uint32_t len,
>                                       uint64_t *caps, uint8_t *max_pasid_log2,
>                                       Error **errp)
>  {
>      struct iommu_hw_info info = {
> +        .flags = (*type) ? IOMMU_HW_INFO_FLAG_INPUT_TYPE : 0,
>          .size = sizeof(info),
>          .dev_id = devid,
>          .data_len = len,
>          .data_uptr = (uintptr_t)data,
> +        .in_data_type = *type,
>      };
>  
>      if (ioctl(be->fd, IOMMU_GET_HW_INFO, &info)) {
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> index d320c62b04..300c35ccb5 100644
> --- a/hw/arm/smmuv3-accel.c
> +++ b/hw/arm/smmuv3-accel.c
> @@ -115,7 +115,7 @@ smmuv3_accel_hw_compatible(SMMUv3State *s, HostIOMMUDeviceIOMMUFD *idev,
>                             Error **errp)
>  {
>      struct iommu_hw_info_arm_smmuv3 info;
> -    uint32_t data_type;
> +    uint32_t data_type = 0;
>      uint64_t caps;
>  
>      if (!iommufd_backend_get_device_info(idev->iommufd, idev->devid, &data_type,
> diff --git a/hw/vfio/iommufd.c b/hw/vfio/iommufd.c
> index bbe944d7cc..670bdfc53b 100644
> --- a/hw/vfio/iommufd.c
> +++ b/hw/vfio/iommufd.c
> @@ -306,7 +306,7 @@ static bool iommufd_cdev_autodomains_get(VFIODevice *vbasedev,
>      ERRP_GUARD();
>      IOMMUFDBackend *iommufd = vbasedev->iommufd;
>      VFIOContainer *bcontainer = VFIO_IOMMU(container);
> -    uint32_t type, flags = 0;
> +    uint32_t type = 0, flags = 0;
>      uint64_t hw_caps;
>      VFIOIOASHwpt *hwpt;
>      uint32_t hwpt_id;
> @@ -631,8 +631,6 @@ skip_ioas_alloc:
>      bcontainer->initialized = true;
>  
>  found_container:
> -    vbasedev->cpr.ioas_id = container->ioas_id;
> -
indeed looks unrelated to that patch
>      ret = ioctl(devfd, VFIO_DEVICE_GET_INFO, &dev_info);
>      if (ret) {
>          error_setg_errno(errp, errno, "error getting device info");
> @@ -889,7 +887,7 @@ static bool hiod_iommufd_vfio_realize(HostIOMMUDevice *hiod, void *opaque,
>      HostIOMMUDeviceIOMMUFD *idev;
>      HostIOMMUDeviceCaps *caps = &hiod->caps;
>      VendorCaps *vendor_caps = &caps->vendor_caps;
> -    enum iommu_hw_info_type type;
> +    enum iommu_hw_info_type type = 0;
>      uint8_t max_pasid_log2;
>      uint64_t hw_caps;
>  
Besides
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Thanks

Eric


