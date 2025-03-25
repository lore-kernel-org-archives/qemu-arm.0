Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2816543njc;
        Tue, 25 Mar 2025 11:14:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW87vCk7IJ11TqF8GK8fNLqe3C0P1baPEnAcEGEaT8gwDlH1MhnMqauOtWeJfMSRrMvb4ebmdPBYH6Kfw==@linaro.org
X-Google-Smtp-Source: AGHT+IGGRgbNokDhXP+SguwGTo6eUu+O54URv++EWM07lIntOSwIUwhFbeAH0btigS86ICYbeZvP
X-Received: by 2002:a05:622a:8cb:b0:476:78a8:435c with SMTP id d75a77b69052e-4771dd88d84mr288357831cf.16.1742926457837;
        Tue, 25 Mar 2025 11:14:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742926457; cv=none;
        d=google.com; s=arc-20240605;
        b=FCDJHdnzLVPK3Peowat0p9UWI1G4rwc0Y+IcMdxE7wrEag95+IS4Rjo1/mbD/snje7
         gIR51nrwvyI1rpSE7ebQINAUrgQbE5EidROAe88BtgCLQuRG/TeRb+/1xZgHGECys8R3
         8d6ng5wgzgWPBBcmvQk7t1q5EYw8zQjLmgrN5fCsz6SiEh2XyhYv5cLUYloryDyFWLVv
         1Bkr9u34OtsiRy8246/EZEXdON7AOKs2UQzUQ/q1McJnGSlJ82rix+NUb/mWm7y2zpCR
         /7473dO5/KpHgwaR017RB3QLlc0GwNOFrJbfP6m5L0CSLLA2XdeoRol+muwCyRWxNQqr
         Ii3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=cnz5aAzqCbDu49ihoMjBaIrCPsQZ4jrPyT6C29wS+zg=;
        fh=LI+J6lxGpXOUBrLf8VTYMMsKfh0uu7oyCTaOe4dAaF8=;
        b=DIlZpZ/gzgXhqGlkdwzhKWWocuJbSKYuwEy+LJt1vUlZ4AAWdA14hgLtuLrh65oRxF
         NzGuwHyrx7TIZcfxNZU92agaReOUtHdhvmq1ZllO8/gILP6aAvGxk/IOfHBHxYpVB7xG
         MFowIr4wFjCmJ5t/zPT+m4dNZ0eune7a7oi9y/r9gRFMvIr00JTNzRGGyZEq9YVWQYKZ
         1FrRSZxay+GF80rYRA1i1aPzHojthb6Ljsvpe+hdd2HUVn7WB85kTOkBvOJMrTPZmtZa
         AoFZyVNPqHAWI7uBtdC0jyosUoKv7At1oYE/HdOI0nlllu3Y6m+7InihJl6+AaOcO/x/
         T+/A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=db+ZtLpY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4775da959f8si4769971cf.525.2025.03.25.11.14.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Mar 2025 11:14:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=db+ZtLpY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tx8mj-0001oe-EZ; Tue, 25 Mar 2025 14:13:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tx8mf-0001nB-CA
 for qemu-arm@nongnu.org; Tue, 25 Mar 2025 14:13:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tx8mb-0006Z8-QJ
 for qemu-arm@nongnu.org; Tue, 25 Mar 2025 14:13:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742926425;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cnz5aAzqCbDu49ihoMjBaIrCPsQZ4jrPyT6C29wS+zg=;
 b=db+ZtLpY1FKHOavy83j9hq7t/GIB+kl8iLlRqNkCFeRkSNWZbiBWDz9V6GV6njRiVq87La
 tncsKG37NLJWHq6huYI0x+byn6zCu3c5IzlsysVpwD4Bkdau/s9L4i9FDxWANCuLfjHRgw
 uoMCSatNO5feEZbpppn53YiQYt/BZxU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-424-R9Y1R_IuOli5NUmHrrIHjw-1; Tue, 25 Mar 2025 14:13:44 -0400
X-MC-Unique: R9Y1R_IuOli5NUmHrrIHjw-1
X-Mimecast-MFC-AGG-ID: R9Y1R_IuOli5NUmHrrIHjw_1742926423
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3912e4e2033so2793528f8f.0
 for <qemu-arm@nongnu.org>; Tue, 25 Mar 2025 11:13:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742926422; x=1743531222;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cnz5aAzqCbDu49ihoMjBaIrCPsQZ4jrPyT6C29wS+zg=;
 b=FC1c0TVoEOJXoKiTbg9IkYhdg91TU7e0z1YI4h49fte03d8M4JUrzTQDb6vKTXkUQ3
 9kx3yT+EXkeH1XHzimm6LrmeIgE1Z3gxbiZu6gXoiW8Lx+ssJqJ1JEbPsxig7pMhlepK
 jRDDstU6MOi+PDALsCj107hMIAJNigdl0MEzeU9Fc/CUHN0azYqUec7rFOo27RWKSdyd
 86BV6HpOr97f36PVpHo9guylIyGcCLPuoZwiaGJlRpkDR09BEMkhi3HggNTfbkRnGXRo
 FQfv1PrsldjH0/EZhTeqqX8GBSkC4fwf2uxiY0ckq8znHshFOq2MXx+3W83Eh4IxjK/f
 w9jw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnwaYkdSVpmjSXs1gXdW9JMHXf2Gv147BpRknTdviCJarL7SgoRowatrdfbcfgQZo0wupaQf+UFg==@nongnu.org
X-Gm-Message-State: AOJu0YyGUO35ZBTfynVGatecp7PiUX5y1DgY6vhJ0sO3ZSkFU2nUIP1M
 lCYd/wyfOupNi2ZQV5WaBbTdA1v3S1Nhif1WJc+ITC3xE/gxe/LD46U8FOgqHKI7bGT9pdY8Pp4
 YCAyZS/eVE9fSR1smLbwM4frHYuAJsEr4haJU58h0OdASuKKVIpRPWr9P3Q==
X-Gm-Gg: ASbGncszMME4aziDidCjhu7NJF0XuJMtTzhA8s7unXBn2M0zDoRrgU2w5VbDnUx6Iif
 +qOYgmUwXPH/MwPle7j597p3Hffu9dIuu84V53uxIIKpn+CDxJLLNXahgM6pKZwpPSQjXI6viWe
 qePvKsL8jAqTvyXuzfuUGkFSbmggnLPNBDricKSzFqRBp8fVJiOXwc6o6UxIX2Va8TqRhvdOdI/
 D2/FMIIo16EKmfuUh50T8SDFvkNr0k94h/8j7jNyCcIcJqoOWC6qY27jFxPr/h4dagJqHgrgFSx
 gxLF+E/WnKUIuel0xm28g8GLzn6qNwd9XxQzlQfUKZX4dmpI/E/Vl0nk6wg5lSM=
X-Received: by 2002:a05:6000:4014:b0:38d:e401:fd61 with SMTP id
 ffacd0b85a97d-3997f959577mr13572500f8f.49.1742926422198; 
 Tue, 25 Mar 2025 11:13:42 -0700 (PDT)
X-Received: by 2002:a05:6000:4014:b0:38d:e401:fd61 with SMTP id
 ffacd0b85a97d-3997f959577mr13572464f8f.49.1742926421723; 
 Tue, 25 Mar 2025 11:13:41 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9957efsm14592800f8f.14.2025.03.25.11.13.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Mar 2025 11:13:40 -0700 (PDT)
Message-ID: <34b9caa1-d4cc-4183-971a-a4c54bb76bde@redhat.com>
Date: Tue, 25 Mar 2025 19:13:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 11/20] hw/arm/smmuv3-accel: Allocate a vDEVICE
 object for device
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, linuxarm@huawei.com,
 wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, zhangfei.gao@linaro.org
References: <20250311141045.66620-1-shameerali.kolothum.thodi@huawei.com>
 <20250311141045.66620-12-shameerali.kolothum.thodi@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250311141045.66620-12-shameerali.kolothum.thodi@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dGmPwOGdbEGbYh6-wtT9ASOaR1Tdx9n6rqup7WohuXA_1742926423
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: o0qhxJm9ozsx

Hi,

On 3/11/25 3:10 PM, Shameer Kolothum wrote:
> From: Nicolin Chen <nicolinc@nvidia.com>
>
> Allocate and associate a vDEVICE object for the Guest device
> with the vIOMMU. This will help the kernel to do the
> vSID --> sid translation whenever required (eg: device specific
s/sid/SID
> invalidations).
>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>  hw/arm/smmuv3-accel.c         | 22 ++++++++++++++++++++++
>  include/hw/arm/smmuv3-accel.h |  6 ++++++
>  2 files changed, 28 insertions(+)
>
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> index d3a5cf9551..056bd23b2e 100644
> --- a/hw/arm/smmuv3-accel.c
> +++ b/hw/arm/smmuv3-accel.c
> @@ -109,6 +109,20 @@ void smmuv3_accel_install_nested_ste(SMMUDevice *sdev, int sid)
>          return;
>      }
>  
> +    if (!accel_dev->vdev && accel_dev->idev) {
> +        SMMUVdev *vdev;
> +        uint32_t vdev_id;
> +        SMMUViommu *viommu = accel_dev->viommu;
> +
> +        iommufd_backend_alloc_vdev(viommu->core.iommufd, accel_dev->idev->devid,
> +                                   viommu->core.viommu_id, sid, &vdev_id,
> +                                   &error_abort);
> +        vdev = g_new0(SMMUVdev, 1);
nit: no need to use 0 variant if you set all fields
> +        vdev->vdev_id = vdev_id;
> +        vdev->sid = sid;
> +        accel_dev->vdev = vdev;
> +    }
> +
>      ret = smmu_find_ste(sdev->smmu, sid, &ste, &event);
>      if (ret) {
>          /*
> @@ -283,6 +297,7 @@ static bool smmuv3_accel_set_iommu_device(PCIBus *bus, void *opaque, int devfn,
>  static void smmuv3_accel_unset_iommu_device(PCIBus *bus, void *opaque,
>                                              int devfn)
>  {
> +    SMMUVdev *vdev;
>      SMMUDevice *sdev;
>      SMMUv3AccelDevice *accel_dev;
>      SMMUViommu *viommu;
> @@ -312,6 +327,13 @@ static void smmuv3_accel_unset_iommu_device(PCIBus *bus, void *opaque,
>      trace_smmuv3_accel_unset_iommu_device(devfn, smmu_get_sid(sdev));
>  
>      viommu = s_accel->viommu;
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
> diff --git a/include/hw/arm/smmuv3-accel.h b/include/hw/arm/smmuv3-accel.h
> index d6b0b1ca30..54b217ab4f 100644
> --- a/include/hw/arm/smmuv3-accel.h
> +++ b/include/hw/arm/smmuv3-accel.h
> @@ -35,6 +35,11 @@ typedef struct SMMUViommu {
>      QLIST_ENTRY(SMMUViommu) next;
>  } SMMUViommu;
>  
> +typedef struct SMMUVdev {
> +    uint32_t vdev_id;
> +    uint32_t sid;
> +} SMMUVdev;
> +
>  typedef struct SMMUS1Hwpt {
>      IOMMUFDBackend *iommufd;
>      uint32_t hwpt_id;
> @@ -45,6 +50,7 @@ typedef struct SMMUv3AccelDevice {
>      HostIOMMUDeviceIOMMUFD *idev;
>      SMMUS1Hwpt  *s1_hwpt;
>      SMMUViommu *viommu;
> +    SMMUVdev   *vdev;
>      QLIST_ENTRY(SMMUv3AccelDevice) next;
>  } SMMUv3AccelDevice;
>  

