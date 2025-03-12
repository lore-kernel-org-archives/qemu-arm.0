Received: by 2002:a17:505:840c:b0:1be9:327d:8ee3 with SMTP id lq12csp340395njc;
        Wed, 12 Mar 2025 08:25:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU9cIBoxBRyzwJgDMySNk4A0FxByuKebOsUwvOwLJ2TLsnG3gI0T/Gy34N8zcm8GD4NrPzQHOI6I1Eyzw==@linaro.org
X-Google-Smtp-Source: AGHT+IH5nv5lMmwVfi2eX/7rZoelhEjm+9OCe+Wz0oXEntVou5/kCdtXBR/JwHhfa0yPgSMNr+Ae
X-Received: by 2002:a05:620a:2b86:b0:7c5:47c6:b880 with SMTP id af79cd13be357-7c57110fe65mr15762685a.2.1741793150044;
        Wed, 12 Mar 2025 08:25:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741793150; cv=none;
        d=google.com; s=arc-20240605;
        b=ZEnZNur4iaUR75wa9POe7q0qTK9ImodEMYm5jmCx1PMmjW1Rx8KB1lenp+CV9NB0+1
         DJ1QUl5B9kCA6HMPWj08i/dCMNrulMYCCOdEK3qZQSs2Cm/I4x2+ue3M7ZfD2x0+ylEB
         U/4WzIwZAmMXTc74kK7GZHxXUmvCei5GUEC+2x+370ZWyx29DXOZMyVgZBep20G8Lyh7
         rFYgNC+sM/1lQHrm8MakLAH+FxCVmZ79XvBE/3rQ5ioaE8u/zhOUiULKctyHY/fp2tYE
         rSf93TQO0zEeENLnuH0I/NZBaPSbkzdsilvkqEwqcByVoNU4l1ZmiPIjfkSoKwYuwSD1
         bouA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=rW+zj2edgGhgvM5O8G2t42DNKGJdQnzrsKNbBJcSZtk=;
        fh=xAw67rB94bcGCRzyb85p8G4h/OVnemS8xL+su+v9Orc=;
        b=NT6x8J5Jf5mLH4sy3Jg3vDTJ6IVFQf4Spw3tUmCHSaAh17bP2x3Rkklqap5KQrl0Yr
         bnwb4Y1kID50vlndmMGTIdOvwbYtVH/mu0Qn44lOpFNiz8PWE3kAdHJQjCrO8Rhnw058
         9hqzqqzLqQUqufwT3F3qS4IYOH00pbyfD2cyOu707DwEXYKerW61ASXvwdW/G4wbnF0h
         hupyvFfSibHN3DKSobRkCbYSngyvz6K6XB7UO/U3Uz5xKDhG2FuPmLvID0C3ccCCSuAd
         BrgGoFYdNXc5SrwxqJoeR3NvQ/L4wE60PE07FzfPBrhaLJv+0HX+DuhLZO7IAw6Uba4z
         NkNg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="C/WkWPlO";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c54653385fsi894515585a.597.2025.03.12.08.25.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Mar 2025 08:25:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="C/WkWPlO";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tsNxk-0008JJ-OU; Wed, 12 Mar 2025 11:25:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tsNxi-0008FM-1W
 for qemu-arm@nongnu.org; Wed, 12 Mar 2025 11:25:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tsNxc-0001Bu-9M
 for qemu-arm@nongnu.org; Wed, 12 Mar 2025 11:25:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741793131;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rW+zj2edgGhgvM5O8G2t42DNKGJdQnzrsKNbBJcSZtk=;
 b=C/WkWPlOtIiL1k6+LZERPc6pn5zzj1fgfRwyITOfgShvLgSVIA/13giJjQcmaVLkRI/VCl
 IzKQ7zZQx1BQx02tmY2227+nGbKd5MiPdoPpj6Zi+pN7ymMp5DeZD4ivKDrb0/ZqLY13VW
 DkH2ZYNOJ+PQ/T0z0gvsf9VqrtcIb0M=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-193-KT9guMvpMfKIy5N29evvww-1; Wed, 12 Mar 2025 11:25:26 -0400
X-MC-Unique: KT9guMvpMfKIy5N29evvww-1
X-Mimecast-MFC-AGG-ID: KT9guMvpMfKIy5N29evvww_1741793126
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6e90788e2a7so357516d6.0
 for <qemu-arm@nongnu.org>; Wed, 12 Mar 2025 08:25:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741793126; x=1742397926;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rW+zj2edgGhgvM5O8G2t42DNKGJdQnzrsKNbBJcSZtk=;
 b=LZFMj4yhfHOAZQ6O62BbEZN/dlH1V1aYI9z9zr/Nm2EeTiNuaTF0ycsVzNvbG5bJ2W
 PTLtWiccSLgPiD3wvCU8fcCupR7gRH3l748LCTPYgYHlJFz0ORh9E43b3/fHDz5OqwHo
 4tGBpGlDBF4QF6mQstbJh7bpqZRhD55H8AiO7RxEBH4asawHnkpX0JgU+VQq8aJOcD+Z
 Q4SI7o/PSJl6IoWoik511ZuxRKlssgC2M6QRPVAgVAFxhfdpfTSJlo7iZ3nMmfFbQmXR
 3Llj+aF7hSnMoBYH6A5A/PDrmFs7FKaQY8KIiO2+o53KW/qh5ZpdhcqMOt1ajCXbX3Mx
 TOwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXK0FYgjVPy+LqL4y/lWHlHLew1v/GjrKLT4j78STicN0NBe9qoXSFkG3gWL5N3cPpNlArs1RL9Zw==@nongnu.org
X-Gm-Message-State: AOJu0Yxo3f+KB5yegSq9Ey3vr/MDaXniaspZ7vrye8DsRzNearTSFheW
 IxXHLC3VG6IulfZMVLkXF6HhFE6ptFKgpNNlt2lCJWNTK9oQG+xCfJxcyGmGwojDzD8ts8E48Hl
 kA+3Yg5nEpdhCVOzg/QWcub6WEho/2WIbXS4F7gRUTJVy/P/b5w==
X-Gm-Gg: ASbGncvr4ZhxmKg+hZ0e6PldCwjmhCSQa6Fa/DIuR233Cf8umWs+kYbE22ZRreZEUy5
 ZVCIaDszB47IjqovQwJzZ7b3lXafQejOnGsXzy+Hoz5ueLtQRlmgrlEnMLqDgF4Kwluv9QCQyrg
 /AT5kvwNP9BOeh0ecOb6YzEQZQzZS0jJ0I9GKNnmLyFVvKFQJ3LSirx2dacqLJxeto1p/Fxuw68
 F9cv/DzL9LSFmzyMsj+Pq6UJyEzXMwC/lVd01PdZj50YCSR0Pwd25OZrQvF/rAGsfqNBViCn72u
 VVeoRXRn9nyASHYmqc4HjorscWDc9VHcxmSrPzMO044kEhI1SuhRsa/ZosYCIXs=
X-Received: by 2002:a05:6214:224e:b0:6e8:9053:825e with SMTP id
 6a1803df08f44-6eadb56a10bmr662426d6.17.1741793125877; 
 Wed, 12 Mar 2025 08:25:25 -0700 (PDT)
X-Received: by 2002:a05:6214:224e:b0:6e8:9053:825e with SMTP id
 6a1803df08f44-6eadb56a10bmr661996d6.17.1741793125574; 
 Wed, 12 Mar 2025 08:25:25 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6e8f707c3dfsm85973996d6.7.2025.03.12.08.25.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Mar 2025 08:25:24 -0700 (PDT)
Message-ID: <0574747f-7fee-4657-9a74-2d6f6f46c2c0@redhat.com>
Date: Wed, 12 Mar 2025 16:25:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 02/20] backends/iommufd: Introduce
 iommufd_vdev_alloc
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, linuxarm@huawei.com,
 wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, zhangfei.gao@linaro.org
References: <20250311141045.66620-1-shameerali.kolothum.thodi@huawei.com>
 <20250311141045.66620-3-shameerali.kolothum.thodi@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250311141045.66620-3-shameerali.kolothum.thodi@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: d4nohsn3NfCyeCkNVqCX4DhVrtL37h1p8yExek4F2tY_1741793126
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: ECBPmx//fiFS


Hi Shameer,

On 3/11/25 3:10 PM, Shameer Kolothum wrote:
> From: Nicolin Chen <nicolinc@nvidia.com>
>
> Add a helper to allocate an iommufd device's virtual device (in the user
> space) per a viommu instance.
>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  backends/iommufd.c       | 26 ++++++++++++++++++++++++++
>  backends/trace-events    |  1 +
>  include/system/iommufd.h |  4 ++++
>  3 files changed, 31 insertions(+)
>
> diff --git a/backends/iommufd.c b/backends/iommufd.c
> index 3fac08c96e..3511dd32ab 100644
> --- a/backends/iommufd.c
> +++ b/backends/iommufd.c
> @@ -366,6 +366,32 @@ bool iommufd_backend_alloc_viommu(IOMMUFDBackend *be, uint32_t dev_id,
>      return true;
>  }
>  
> +bool iommufd_backend_alloc_vdev(IOMMUFDBackend *be, uint32_t dev_id,
> +                                uint32_t viommu_id, uint64_t virt_id,
> +                                uint32_t *out_vdev_id, Error **errp)
> +{
> +    int ret, fd = be->fd;
> +    struct iommu_vdevice_alloc alloc_vdev = {
> +        .size = sizeof(alloc_vdev),
> +        .viommu_id = viommu_id,
> +        .dev_id = dev_id,
> +        .virt_id = virt_id,
> +    };
> +
> +    ret = ioctl(fd, IOMMU_VDEVICE_ALLOC, &alloc_vdev);
> +
> +    trace_iommufd_backend_alloc_vdev(fd, dev_id, viommu_id, virt_id,
> +                                     alloc_vdev.out_vdevice_id, ret);
> +
> +    if (ret) {
> +        error_setg_errno(errp, errno, "IOMMU_VDEVICE_ALLOC failed");
> +        return false;
> +    }
> +
> +    *out_vdev_id = alloc_vdev.out_vdevice_id;
> +    return true;
> +}
> +
>  bool host_iommu_device_iommufd_attach_hwpt(HostIOMMUDeviceIOMMUFD *idev,
>                                             uint32_t hwpt_id, Error **errp)
>  {
> diff --git a/backends/trace-events b/backends/trace-events
> index a835827540..86c8f89e8a 100644
> --- a/backends/trace-events
> +++ b/backends/trace-events
> @@ -20,3 +20,4 @@ iommufd_backend_set_dirty(int iommufd, uint32_t hwpt_id, bool start, int ret) "
>  iommufd_backend_get_dirty_bitmap(int iommufd, uint32_t hwpt_id, uint64_t iova, uint64_t size, uint64_t page_size, int ret) " iommufd=%d hwpt=%u iova=0x%"PRIx64" size=0x%"PRIx64" page_size=0x%"PRIx64" (%d)"
>  iommufd_backend_invalidate_cache(int iommufd, uint32_t hwpt_id, uint32_t data_type, uint32_t entry_len, uint32_t entry_num, uint32_t done_num, uint64_t data_ptr, int ret) " iommufd=%d hwpt_id=%u data_type=%u entry_len=%u entry_num=%u done_num=%u data_ptr=0x%"PRIx64" (%d)"
>  iommufd_backend_alloc_viommu(int iommufd, uint32_t type, uint32_t dev_id, uint32_t hwpt_id, uint32_t viommu_id, int ret) " iommufd=%d type=%u dev_id=%u hwpt_id=%u viommu_id=%u (%d)"
> +iommufd_backend_alloc_vdev(int iommufd, uint32_t dev_id, uint32_t viommu_id, uint64_t virt_id, uint32_t vdev_id, int ret) " iommufd=%d dev_id=%u viommu_id=%u virt_id=0x%"PRIx64" vdev_id=%u (%d)"
> diff --git a/include/system/iommufd.h b/include/system/iommufd.h
> index 7e5507f2db..53920bae5b 100644
> --- a/include/system/iommufd.h
> +++ b/include/system/iommufd.h
> @@ -59,6 +59,10 @@ bool iommufd_backend_alloc_viommu(IOMMUFDBackend *be, uint32_t dev_id,
>                                    uint32_t viommu_type, uint32_t hwpt_id,
>                                    uint32_t *out_hwpt, Error **errp);
>  
> +bool iommufd_backend_alloc_vdev(IOMMUFDBackend *be, uint32_t dev_id,
> +                                uint32_t viommu_id, uint64_t virt_id,
> +                                uint32_t *out_vdev_id, Error **errp);
> +
>  bool iommufd_backend_set_dirty_tracking(IOMMUFDBackend *be, uint32_t hwpt_id,
>                                          bool start, Error **errp);
>  bool iommufd_backend_get_dirty_bitmap(IOMMUFDBackend *be, uint32_t hwpt_id,

