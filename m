Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82EDBCCD199
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Oct 2025 13:18:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v9kD2-0003Nc-Uz; Fri, 17 Oct 2025 09:09:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1v9kCd-00033P-SL
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 09:09:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1v9kCY-0004VL-3C
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 09:09:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760706532;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wD9m0MqNs8AycWDX567nhwaXGPoa/Fxx7YOxRbdO0Og=;
 b=FSxm1ahb239ehB2gZT2/rsu5utJEvM6UJAfhl9t2h1wAhqAI4iLyVAl9xllgbsdSJMwdRi
 pP7OuAIRjZl/0gdscF1Ik+1NVMno9b0OYLBI0wb2te8z+QduoubUTK5JeekpQ7dzm1t8WG
 RukuxWyABFTxzs5n6ZUZps4sLd+eEcc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-78JWpx1wMS6rKdWA5nWH9A-1; Fri, 17 Oct 2025 09:08:50 -0400
X-MC-Unique: 78JWpx1wMS6rKdWA5nWH9A-1
X-Mimecast-MFC-AGG-ID: 78JWpx1wMS6rKdWA5nWH9A_1760706529
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-40cfb98eddbso1614485f8f.0
 for <qemu-arm@nongnu.org>; Fri, 17 Oct 2025 06:08:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760706529; x=1761311329;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wD9m0MqNs8AycWDX567nhwaXGPoa/Fxx7YOxRbdO0Og=;
 b=NbURyqHSDS6JaFJtBtU+uDMib3f2zWcEcNXADi8Iw2nKw3uiGLewiUw3/o19ge8igj
 xpmq56lmxd0uGKkZqDNXGwbtM4+F4f3WGvB09GZ/Fxs5AoRlSAjpFGGdSKsy3FbaZYiC
 0k6jgKUosWrtirE/HHW9Fa35FfMmOf1MJgq5CNFHybHGDuCb1Ha1nYls/Nq/21R1Vret
 Pv6YtquJZSfeatUQFrF2RHo1ymTKJoz/mjCHirIyRn+s3r1Zm6i4p25ENzAeQYeRnxxx
 uP32JnYWuSy1PTIPJSn9yBzqPh0qT9pkofe1SEc6KXDYFHWoUZgSUhmj0/3GXYkpTV16
 yFDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWhIn8oLjlKaZK3NJ0GFPR0sAfGrd5lT74KvxHeC/8TmUm9aGyM11hB7FPu56KY3LJzTq8aVnNjQ==@nongnu.org
X-Gm-Message-State: AOJu0YziJMTqBJkK/VQZVIZAFTXvCwvv4821ndHFIFaR99aaP0zdg9jk
 2juMmQaCX9TGk1nlW/ACSYdtiPRbCmX1oywlyJQIrS1eC5RX0kVtrzh6QGrsgEc/ByKmeXYPX4R
 IqfkmKzV+hKMB8gd7XsoBAr02i9p8ygEtcmQwVCzo4uwU1goK3FBqvA==
X-Gm-Gg: ASbGncvTZLpl+ldgLEf8OSyuFydx8XVMdh8ZZRVbnHFAAl4MN4K81r8dOYPUameWdU+
 mrJ0M/1FZYQ2pZFkz6SY4cOvpyQGcEspndTAz2b9oiPWEGi8wkWQUidJ28ncjideyk2wRrwwPHF
 5WkIiuDTmxl3Z6mHGEEHPHoa6egqMA7mS3jLiBkBY0kNRC9gdQHYM0BP/Tz9zLpV5+n/pYZTqJ/
 s31AZk0BTBwJO1CcaRvlA0T5romGfSacNjFx/eoc5+x/TsqweTchckYY6c99q3aE/qKqLWk/qQA
 INm4It+XQeFAFrHXRMsmpwWJCMqMCvqE/veveg3cdnI7MG978DkjbybtthwSXmfWiKBTVL3nLX/
 IK9d+XzRlhYhqbHdxeJF2ADdTxyEuqpZvMjiRe+ZSqMFJgQ==
X-Received: by 2002:a05:6000:1a86:b0:407:d776:4434 with SMTP id
 ffacd0b85a97d-426fb9b5505mr5525764f8f.30.1760706529188; 
 Fri, 17 Oct 2025 06:08:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfhyNSH5Mts8E+f/30Tt84/ASyBY4InO89LVZDJTHBNGIQJdd7WB8bfad3ImzEINxGpX/Bwg==
X-Received: by 2002:a05:6000:1a86:b0:407:d776:4434 with SMTP id
 ffacd0b85a97d-426fb9b5505mr5525725f8f.30.1760706528741; 
 Fri, 17 Oct 2025 06:08:48 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5e0a03sm40993368f8f.37.2025.10.17.06.08.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Oct 2025 06:08:48 -0700 (PDT)
Message-ID: <95d5e2a0-4907-47c2-96f8-ed6d31faee9b@redhat.com>
Date: Fri, 17 Oct 2025 15:08:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/27] hw/arm/smmuv3-accel: Allocate a vDEVICE object
 for device
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, wangzhou1@hisilicon.com,
 jiangkunkun@huawei.com, jonathan.cameron@huawei.com,
 zhangfei.gao@linaro.org, zhenzhong.duan@intel.com, yi.l.liu@intel.com,
 shameerkolothum@gmail.com
References: <20250929133643.38961-1-skolothumtho@nvidia.com>
 <20250929133643.38961-11-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250929133643.38961-11-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NcRmjZRxKsgJue4BAKmZuxwpdPnOkXqbyYAzvYrFD9U_1760706529
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

On 9/29/25 3:36 PM, Shameer Kolothum wrote:
> From: Nicolin Chen <nicolinc@nvidia.com>
>
> Allocate and associate a vDEVICE object for the Guest device with the
> vIOMMU. This will help the host kernel to make a virtual SID --> physical
> SID mapping. Since we pass the raw invalidation commands(eg: CMD_CFGI_CD)
> from Guest directly to host kernel, this provides a way to retrieve the
> correct physical SID.
>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  hw/arm/smmuv3-accel.c | 41 +++++++++++++++++++++++++++++++++++++++++
>  hw/arm/smmuv3-accel.h |  1 +
>  2 files changed, 42 insertions(+)
>
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> index 5c3825cecd..790887ac31 100644
> --- a/hw/arm/smmuv3-accel.c
> +++ b/hw/arm/smmuv3-accel.c
> @@ -39,6 +39,35 @@
>  #define STE1_MASK     (STE1_ETS | STE1_S1STALLD | STE1_S1CSH | STE1_S1COR | \
>                         STE1_S1CIR | STE1_S1DSS)
>  
> +static bool
> +smmuv3_accel_alloc_vdev(SMMUv3AccelDevice *accel_dev, int sid, Error **errp)
> +{
> +    SMMUViommu *viommu = accel_dev->viommu;
> +    IOMMUFDVdev *vdev;
> +    uint32_t vdev_id;
> +
> +    if (!accel_dev->idev || accel_dev->vdev) {
> +        return true;
> +    }
> +
> +    if (!iommufd_backend_alloc_vdev(viommu->iommufd, accel_dev->idev->devid,
> +                                   viommu->core.viommu_id, sid,
> +                                   &vdev_id, errp)) {
> +            return false;
> +    }
> +    if (!host_iommu_device_iommufd_attach_hwpt(accel_dev->idev,
> +                                               viommu->bypass_hwpt_id, errp)) {
> +        iommufd_backend_free_id(viommu->iommufd, vdev_id);
> +        return false;
> +    }
> +
> +    vdev = g_new(IOMMUFDVdev, 1);
> +    vdev->vdev_id = vdev_id;
> +    vdev->dev_id = sid;
That's confusing to me it should be virt_id and not dev_id which usually
refers to an iommu object id.

Would be nice in general to stick to the kernel uapi terminology. For
instance vdev_id shall rather vdevice_id although in that case it is
understandable.

+bool iommufd_backend_alloc_vdev(IOMMUFDBackend *be, uint32_t dev_id,
+                                uint32_t viommu_id, uint64_t virt_id,
+                                uint32_t *out_vdev_id, Error **errp)

 * struct iommu_vdevice_alloc - ioctl(IOMMU_VDEVICE_ALLOC)
 * @size: sizeof(struct iommu_vdevice_alloc)
 * @viommu_id: vIOMMU ID to associate with the virtual device
 * @dev_id: The physical device to allocate a virtual instance on the vIOMMU
 * @out_vdevice_id: Object handle for the vDevice. Pass to IOMMU_DESTORY
 * @virt_id: Virtual device ID per vIOMMU, e.g. vSID of ARM SMMUv3,
vDeviceID
 *           of AMD IOMMU, and vRID of Intel VT-d



> +    accel_dev->vdev = vdev;
> +    return true;
> +}
> +
>  static bool
>  smmuv3_accel_dev_uninstall_nested_ste(SMMUv3AccelDevice *accel_dev, bool abort,
>                                        Error **errp)
> @@ -127,6 +156,10 @@ smmuv3_accel_install_nested_ste(SMMUv3State *s, SMMUDevice *sdev, int sid,
>          return true;
>      }
>  
> +    if (!smmuv3_accel_alloc_vdev(accel_dev, sid, errp)) {
> +        return false;
> +    }
> +
>      ret = smmu_find_ste(sdev->smmu, sid, &ste, &event);
>      if (ret) {
>          error_setg(errp, "Failed to find STE for Device 0x%x", sid);
> @@ -311,6 +344,7 @@ static void smmuv3_accel_unset_iommu_device(PCIBus *bus, void *opaque,
>      SMMUPciBus *sbus = g_hash_table_lookup(bs->smmu_pcibus_by_busptr, bus);
>      SMMUv3AccelDevice *accel_dev;
>      SMMUViommu *viommu;
> +    IOMMUFDVdev *vdev;
>      SMMUDevice *sdev;
>      uint16_t sid;
>  
> @@ -337,6 +371,13 @@ static void smmuv3_accel_unset_iommu_device(PCIBus *bus, void *opaque,
>      trace_smmuv3_accel_unset_iommu_device(devfn, sid);
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
> index f631443b09..6242614c00 100644
> --- a/hw/arm/smmuv3-accel.h
> +++ b/hw/arm/smmuv3-accel.h
> @@ -31,6 +31,7 @@ typedef struct SMMUv3AccelDevice {
>      SMMUDevice  sdev;
>      HostIOMMUDeviceIOMMUFD *idev;
>      SMMUS1Hwpt *s1_hwpt;
> +    IOMMUFDVdev *vdev;
>      SMMUViommu *viommu;
>      QLIST_ENTRY(SMMUv3AccelDevice) next;
>  } SMMUv3AccelDevice;
Thanks

Eric


