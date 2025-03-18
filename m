Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp3275360njb;
        Tue, 18 Mar 2025 16:30:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVmygzhN090Mj+sHWALzUNaLbkK6/boLA+ahOVLFeWrwvC/GlKwpybjYt2gJk0B9xFdRYoa3/IuXx50Gg==@linaro.org
X-Google-Smtp-Source: AGHT+IGYQE4ZJUDpJDlVNjpxyzr0CrySuuhr090IbZJ4dcmRWwCVOfIEratWZ3nXWORYfd9d8cDg
X-Received: by 2002:a05:622a:1149:b0:476:980c:10a4 with SMTP id d75a77b69052e-477082dee45mr15306781cf.23.1742340653363;
        Tue, 18 Mar 2025 16:30:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742340653; cv=none;
        d=google.com; s=arc-20240605;
        b=KfzmMN/vUCgFYu2OWYtKMrX0w5htOAiTO7cmpG3EopiegQ9cOJFzxfmHkLhU2HbB9F
         R7bjWUcL3AL3yb8/iLo8Iodo+S8E2xaRiTeUOjjRU9xViNzAwpiMPzm5maAxRS05B3oT
         Y6MvG0GElZKpePNcw02O69ArnGmgsVIVQaY1M1koYG0OLOvwX1KB6DetsE20HXjsq/zh
         omqxf5h83pjSBCO6Dhoc4lWmPuleKPfJhMH3LgsoolMn+i+A8foLxXgii0oUVTVtiWn0
         wwb61qDryXVblYZn5wz7K8+kZrXe32WoKF3K8QD2V1O5c0EPx1N7eWGzQDS1Q9iXCDJ7
         MX6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=FWEyUiMhkUO1RcyoRMQr+axDCrgSEbu+NVhtrKy8hDo=;
        fh=m9XXR45Qxrs+/60Aeo60HPKJ4Jctw4V/uVEUkyyuHaQ=;
        b=NsqK64VrLZjcbuRvpCLagyEEdSmQYFAUkm3NmayNGoITMpVFu+cL7Y0I+CNkROjDD6
         P9zBLu43VjI8g5F7FwogKo6mzCdKWyHkN/rthULA2e6Jb2ZWgaOOyuD0/BbSV060aSNZ
         juGwKy1yg1DCCI2bwB3Bc4VpSFf66/V3uGVsyomR1mEklj8QFWcnSF5uHz+u/upfd0qc
         iBp7Yhb/hxqINI6Ko/1tHPRVOvC2Pg19arrPVFZ3MFYmJlayItNcBnMUaeTfKnYI4+iL
         6Puv98QY6d1H4gLMNiXihph9Mb+IEXqm+9FAmZrHuVB1P0tVVVUoYcZlYazfFfIyUSTs
         AtaQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="W+i/2otE";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c573cb23a8si1283893985a.318.2025.03.18.16.30.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Mar 2025 16:30:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="W+i/2otE";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tugOS-0002AO-G6; Tue, 18 Mar 2025 19:30:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ddutile@redhat.com>)
 id 1tugOM-00029g-7K
 for qemu-arm@nongnu.org; Tue, 18 Mar 2025 19:30:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ddutile@redhat.com>)
 id 1tugOK-0000BY-6v
 for qemu-arm@nongnu.org; Tue, 18 Mar 2025 19:30:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742340633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FWEyUiMhkUO1RcyoRMQr+axDCrgSEbu+NVhtrKy8hDo=;
 b=W+i/2otEsPW+16b4ghzDi1IbOQiJMBfsuN41nUY06qKvCENjnrYPoPzE/8LB6nmBElft/c
 sYT/eHoXOpTxlr131Q8b9IrJAH4CaxBfT4Z+oUGQ2Oz2rvthBkkRgTlzOTlioMQDFc3CFc
 bLgJMMFjvwEXZrrJq8pLa86/jPuigl8=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-QIBSYCmePg6NDhJdk_B3mA-1; Tue, 18 Mar 2025 19:30:32 -0400
X-MC-Unique: QIBSYCmePg6NDhJdk_B3mA-1
X-Mimecast-MFC-AGG-ID: QIBSYCmePg6NDhJdk_B3mA_1742340632
Received: by mail-io1-f70.google.com with SMTP id
 ca18e2360f4ac-85db3356bafso1506709439f.3
 for <qemu-arm@nongnu.org>; Tue, 18 Mar 2025 16:30:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742340631; x=1742945431;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FWEyUiMhkUO1RcyoRMQr+axDCrgSEbu+NVhtrKy8hDo=;
 b=QxqHkFoGi7Qf4Ig4QLBxQdtA6Q8z6uKX8zxPCSBcY1l7YWKcyGwgRL7aeA7xNSHuuG
 BkL5OhCVOEp2v0R4jUMNtNLNY8RZ54xuvUjxsv0qMUpTmxzeb5+2EmMALqmgs7R+MH7J
 vif0DU6t/Edp3NRNSBW9ep1ek4EbUGqFXv/8Gnd9SkLqlZ/yMkNFWJXj1HsqqEzTNSY5
 wFWawGC1FQrqkeoAVDAaHerLShye8/3FcIOqPqVC6vRnBhD5N6n7tFPBRFJwMdJxQovG
 Gmp/Aj5mMp3gp6rjQXNa2K1ezl7AgWx6/+VPmG1dNqIHPrWG5JWa5N541HtIkB+lK3Bh
 knvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsjHPHR8K4KwPWrCUIp1wTgjKod/AZj3x3vmd7f1cKyPyB2ZvB0GkA7ekMwGkyrdpZOo/lM8R94A==@nongnu.org
X-Gm-Message-State: AOJu0YxRXHcZTq6W08SzlgI6miF2Jzx2pltc5lIU4o5wDP/PMfp9IjoH
 Z5L8yuZ72FEXvNYdFHiQOrpCxy5/Xx9K+QeuXVOHna4i9rjvFJ+AlHR+6muaRA+NaJP66nxClDx
 IaY1OljXFArXuu0lR0oKdK/OMGN7GWCVOu0abiFthPEZyfaX/cw==
X-Gm-Gg: ASbGnct9r26iNKgxwpKJBKfHIfcWw1YnBcLbphy94jx3UDfQSXZU3Oy6oTnmnOoCKuZ
 Sdl98qacGDK+Z+wG1oZbqPlrGE6yaOnGJoH1AR+yoBsqlkrr+ZT5b9jqimgg5Gnu8Jwp4jUagoO
 s9AWf+ey34z9erLWOzB4FabI8UeWTJoQQJtdDnvJtXMaDCbNc410SpLrlZfJ8G40/lGqy2ULPl8
 VHrXV1tlFdEmquuMVE0X70HSeORMM3pu2u1h3Wd+R3IpM4XxqE88z+9YrMw+FCA2bDoFdKkTRnv
 mmI1Iq5+aSkJWq/x
X-Received: by 2002:a05:6e02:4504:b0:3d4:2ea4:6b8a with SMTP id
 e9e14a558f8ab-3d586bfec4fmr6530505ab.22.1742340631726; 
 Tue, 18 Mar 2025 16:30:31 -0700 (PDT)
X-Received: by 2002:a05:6e02:4504:b0:3d4:2ea4:6b8a with SMTP id
 e9e14a558f8ab-3d586bfec4fmr6530345ab.22.1742340631433; 
 Tue, 18 Mar 2025 16:30:31 -0700 (PDT)
Received: from [192.168.40.164] ([70.105.235.240])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4f263719718sm2962023173.38.2025.03.18.16.30.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Mar 2025 16:30:30 -0700 (PDT)
Message-ID: <06d916e0-d127-4425-8972-4f7dd8a7898c@redhat.com>
Date: Tue, 18 Mar 2025 19:30:29 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 11/20] hw/arm/smmuv3-accel: Allocate a vDEVICE
 object for device
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: eric.auger@redhat.com, peter.maydell@linaro.org, jgg@nvidia.com,
 nicolinc@nvidia.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, linuxarm@huawei.com,
 wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, zhangfei.gao@linaro.org
References: <20250311141045.66620-1-shameerali.kolothum.thodi@huawei.com>
 <20250311141045.66620-12-shameerali.kolothum.thodi@huawei.com>
From: Donald Dutile <ddutile@redhat.com>
In-Reply-To: <20250311141045.66620-12-shameerali.kolothum.thodi@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: eSK9394ywWb4qqcMswp6Tn-e5mbkJwwUqS9sJJKt0C8_1742340632
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ddutile@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.332,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: pyTvzCM1qYVL

Shameer,

Hi,

On 3/11/25 10:10 AM, Shameer Kolothum wrote:
> From: Nicolin Chen <nicolinc@nvidia.com>
> 
> Allocate and associate a vDEVICE object for the Guest device
> with the vIOMMU. This will help the kernel to do the
> vSID --> sid translation whenever required (eg: device specific
> invalidations).
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>   hw/arm/smmuv3-accel.c         | 22 ++++++++++++++++++++++
>   include/hw/arm/smmuv3-accel.h |  6 ++++++
>   2 files changed, 28 insertions(+)
> 
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> index d3a5cf9551..056bd23b2e 100644
> --- a/hw/arm/smmuv3-accel.c
> +++ b/hw/arm/smmuv3-accel.c
> @@ -109,6 +109,20 @@ void smmuv3_accel_install_nested_ste(SMMUDevice *sdev, int sid)
>           return;
>       }
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
> +        vdev->vdev_id = vdev_id;
> +        vdev->sid = sid;
> +        accel_dev->vdev = vdev;
> +    }
> +
>       ret = smmu_find_ste(sdev->smmu, sid, &ste, &event);
>       if (ret) {
>           /*
> @@ -283,6 +297,7 @@ static bool smmuv3_accel_set_iommu_device(PCIBus *bus, void *opaque, int devfn,
>   static void smmuv3_accel_unset_iommu_device(PCIBus *bus, void *opaque,
>                                               int devfn)
>   {
> +    SMMUVdev *vdev;
>       SMMUDevice *sdev;
>       SMMUv3AccelDevice *accel_dev;
>       SMMUViommu *viommu;
> @@ -312,6 +327,13 @@ static void smmuv3_accel_unset_iommu_device(PCIBus *bus, void *opaque,
>       trace_smmuv3_accel_unset_iommu_device(devfn, smmu_get_sid(sdev));
>   
>       viommu = s_accel->viommu;
> +    vdev = accel_dev->vdev;
> +    if (vdev) {
> +        iommufd_backend_free_id(viommu->iommufd, vdev->vdev_id);
> +        g_free(vdev);
> +        accel_dev->vdev = NULL;
> +    }
> +
>       if (QLIST_EMPTY(&viommu->device_list)) {
>           iommufd_backend_free_id(viommu->iommufd, viommu->bypass_hwpt_id);
>           iommufd_backend_free_id(viommu->iommufd, viommu->abort_hwpt_id);
> diff --git a/include/hw/arm/smmuv3-accel.h b/include/hw/arm/smmuv3-accel.h
> index d6b0b1ca30..54b217ab4f 100644
> --- a/include/hw/arm/smmuv3-accel.h
> +++ b/include/hw/arm/smmuv3-accel.h
> @@ -35,6 +35,11 @@ typedef struct SMMUViommu {
>       QLIST_ENTRY(SMMUViommu) next;
>   } SMMUViommu;
>   
> +typedef struct SMMUVdev {
> +    uint32_t vdev_id;
> +    uint32_t sid;
> +} SMMUVdev;
> +
Shouldn't this be 'IOMMUFDVdev' ... it's not an SMMU (v)dev , it's an IOMMUFD/vIOMMU vDEVICE for this SMMU


>   typedef struct SMMUS1Hwpt {
>       IOMMUFDBackend *iommufd;
>       uint32_t hwpt_id;
> @@ -45,6 +50,7 @@ typedef struct SMMUv3AccelDevice {
>       HostIOMMUDeviceIOMMUFD *idev;
>       SMMUS1Hwpt  *s1_hwpt;
>       SMMUViommu *viommu;
> +    SMMUVdev   *vdev;
>       QLIST_ENTRY(SMMUv3AccelDevice) next;
>   } SMMUv3AccelDevice;
>   

