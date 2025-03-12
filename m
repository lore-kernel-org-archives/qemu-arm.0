Received: by 2002:a17:505:840c:b0:1be9:327d:8ee3 with SMTP id lq12csp337345njc;
        Wed, 12 Mar 2025 08:21:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWgbVOoQIaF5hQvBFXhjWimJI4oNfR6jmL7yi5djJL6TFE8fNOm0O7sjT9HGc/6YbGjOTDHix/6Zw1ibw==@linaro.org
X-Google-Smtp-Source: AGHT+IEHE9LeOt4tKxEc9ZBYtJTOYPfUaaY8mfT4fRW6Ucoxxkcbigmqq2CnSx76tCzskn4xP4T4
X-Received: by 2002:a05:620a:1b98:b0:7c5:4711:dc51 with SMTP id af79cd13be357-7c54711dd60mr1949915485a.2.1741792874935;
        Wed, 12 Mar 2025 08:21:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741792874; cv=none;
        d=google.com; s=arc-20240605;
        b=BbpXXubNK9AUiyODy3/YURI5pPRUYItIAAsg09zRPZf8yXUSBayp1fytc3Q+qCnnqu
         VtyV9hJYH3vxjFymCHcA0GZS8/dnQvghYz5ELBds7/GWNUlfHfz9mXFRf85TdjdM0fl3
         w+HFk4kBD27szgwYT8lq2+Ktmq4zFQ8mYeP3fRnvTQkjGTbYcZV94klWIBbj4pMWrv2y
         ZgMRsPJJyGeclaCE4+fxfFuy7IzlR62A05NozVhS9oWrJqqmPclKoTQynqYSlTjnhrI1
         6Vk/YtBC5DpaeqyxPh/U9vta236kx/Ncs9t5caLdt7UWKHlmfeDVKn7JMvE4ckbf1dRI
         L49w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=EndKC3E+5tKj8bcm2j4ez5mYagnB+Ve5EldOVX32vo4=;
        fh=fKal282qB8hg/SHVKO/8sZ+KR3OfC2n9RWYQDYoUzCc=;
        b=Mm+US/piPer1XdPspYXimllzY6HCODu3JUMzHupHLpXgCzCl0BVPvjC/pHFqUxgEcq
         NptKGVIqjdEV+lt7aurhAjwgOUP2IYzMJmuNeglwrZdORY+4QlxKEHbnj+uCGt9ktBMy
         sTs/45M8rOZHnrBbROo6ZnC/a9Eomk1Ny0t5DQqS2D3c2nOBIpebpcn8S51tttHEz3kG
         3pmuVTZc8LhxRP/3DjGShsL1xUHiqZJeeoQZDXyDGchAPRfa524SnnTAtIPq+But3vF7
         qewh/5gfaVnhLzuBE5OsE7cyrQ6vFYEbZlYjuCYPnMnF9Uptr5RVSdogGVAxWVXqucsI
         ZOYQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CtO1W+8H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c53b1540ffsi1013391285a.328.2025.03.12.08.21.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Mar 2025 08:21:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CtO1W+8H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tsNtP-0004V0-MR; Wed, 12 Mar 2025 11:21:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tsNtG-0004U4-2w
 for qemu-arm@nongnu.org; Wed, 12 Mar 2025 11:21:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tsNtB-0000O9-R0
 for qemu-arm@nongnu.org; Wed, 12 Mar 2025 11:21:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741792853;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EndKC3E+5tKj8bcm2j4ez5mYagnB+Ve5EldOVX32vo4=;
 b=CtO1W+8HnyjzNDLtEYR3+oQ82QbmA5vLoRQ7R1z7STy+tW0POsWg//iGdEfsfzl4FNxbla
 5yvVganHitgZaOopv+hU5CbWnI3saHGXbhChYWOCw90T7f5C5p49oGr3L7udZcX+Ius5gI
 Nd5V5NiY3J2iDVdoJ2sttbK7s60eZw0=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-154-IP1ZbhU8MACSnWiXMdDB_g-1; Wed, 12 Mar 2025 11:20:50 -0400
X-MC-Unique: IP1ZbhU8MACSnWiXMdDB_g-1
X-Mimecast-MFC-AGG-ID: IP1ZbhU8MACSnWiXMdDB_g_1741792850
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c0a3ff7e81so1054407385a.3
 for <qemu-arm@nongnu.org>; Wed, 12 Mar 2025 08:20:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741792850; x=1742397650;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EndKC3E+5tKj8bcm2j4ez5mYagnB+Ve5EldOVX32vo4=;
 b=lFska9DkpPDnWP5ey3Chu/dy3myPrnvxXQI+B8KCUwCR9hTRSxJXcA7FTKj7aiF2sq
 9DqunAggL+xKcsbBopJJ56cqV/HGSfINeB7hk1/LE4CizIVkdgLbrt3X7keB2OGM8+jP
 fCLnpCGaqx/KvJz3frTAd7gV2rb4ub4vFxUEiCiW/nnu0wV+C2O3qf4uGJlYH2qD/tHP
 oroyoekUGnLy+oQuyBXG7ZtTskBlcstnkItKJ0CVoJS0WC4VOIYWAxz7hOs0jRhYA7/K
 NV7nV8mocn/4uBx0EovjjbkP44dhagbY/r2HWwbChY+UUXkrA9V8TUoKxdfpKDPlf2bp
 6kFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVn+J33sB6ONOGIMn1faOMgLjeT6JLEdjZVbMaMpRlAmBZogx3McaBWBZjxzpj1LZvQAJALj3i1Ig==@nongnu.org
X-Gm-Message-State: AOJu0YwpbwSVyIfLxVZVkOPRetK9amAbhDbBOohlI3ZJL9OjqGaKT84U
 ANQEmUYAN5QtPR5knewD1P/U4ZAl++Ip1TVtS0FpvPEbESDrsXuNVOABll0pWI69rRLmaTe53zX
 F83MFvh2NRwaHWUhrfMywrjlW3q0WTUF0SjGs40h/lZW8uvx2/Q==
X-Gm-Gg: ASbGnctvUgAa7hFlZkoH44CYyJBlYexkr4hZe/tlAvTIl8XxCTWMRmlH5eUT7avA0VL
 CcX5CPzXL+8C1lAvdFe1LwqsF4ePQP67WroHHJnxNbWI09z30XN+rpDUgqlGpdWS5B0nkFIL/JV
 chvJibTA2To9Og4obArvXjCuTaxz0yjC+Oydbzv2QuQqobT++W0VMVpM6eHP9tYGiqCEAYRDnbQ
 7LHeF/Or0CuexbNyPYrRa1xpX1qjz/+ai5T6GelrVp6e2er47ZlBwwFGhACjf9/lwRIPJEKKJgy
 4DTqsFSBC/kjcCCmriFLtaxT89Ohlf5o69gvk5rUrathUqKwmJUYk5s1+NG8udI=
X-Received: by 2002:a05:620a:6288:b0:7c5:4caa:21b6 with SMTP id
 af79cd13be357-7c54caa3459mr1996128285a.57.1741792850352; 
 Wed, 12 Mar 2025 08:20:50 -0700 (PDT)
X-Received: by 2002:a05:620a:6288:b0:7c5:4caa:21b6 with SMTP id
 af79cd13be357-7c54caa3459mr1996125485a.57.1741792850114; 
 Wed, 12 Mar 2025 08:20:50 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7c566e847a5sm171161385a.80.2025.03.12.08.20.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Mar 2025 08:20:49 -0700 (PDT)
Message-ID: <266823f4-5b98-48e3-8414-ce27b4ede087@redhat.com>
Date: Wed, 12 Mar 2025 16:20:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 01/20] backends/iommufd: Introduce
 iommufd_backend_alloc_viommu
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, linuxarm@huawei.com,
 wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, zhangfei.gao@linaro.org
References: <20250311141045.66620-1-shameerali.kolothum.thodi@huawei.com>
 <20250311141045.66620-2-shameerali.kolothum.thodi@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250311141045.66620-2-shameerali.kolothum.thodi@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vTZ1Y4rTABQg1-V58uhUuFjJcpOHY5BQdOCiZLdvWio_1741792850
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: BgWbZKwJdPT+

Hi,


On 3/11/25 3:10 PM, Shameer Kolothum wrote:
> From: Nicolin Chen <nicolinc@nvidia.com>
>
> Add a helper to allocate a viommu object.
>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  backends/iommufd.c       | 25 +++++++++++++++++++++++++
>  backends/trace-events    |  1 +
>  include/system/iommufd.h |  4 ++++
>  3 files changed, 30 insertions(+)
>
> diff --git a/backends/iommufd.c b/backends/iommufd.c
> index 3c23caef96..3fac08c96e 100644
> --- a/backends/iommufd.c
> +++ b/backends/iommufd.c
> @@ -341,6 +341,31 @@ int iommufd_backend_invalidate_cache(IOMMUFDBackend *be, uint32_t hwpt_id,
>      return ret;
>  }
>  
> +bool iommufd_backend_alloc_viommu(IOMMUFDBackend *be, uint32_t dev_id,
> +                                  uint32_t viommu_type, uint32_t hwpt_id,
> +                                  uint32_t *out_viommu_id, Error **errp)
> +{
> +    int ret, fd = be->fd;
> +    struct iommu_viommu_alloc alloc_viommu = {
> +        .size = sizeof(alloc_viommu),
> +        .type = viommu_type,
> +        .dev_id = dev_id,
> +        .hwpt_id = hwpt_id,
> +    };
> +
> +    ret = ioctl(fd, IOMMU_VIOMMU_ALLOC, &alloc_viommu);
> +
> +    trace_iommufd_backend_alloc_viommu(fd, viommu_type, dev_id, hwpt_id,
> +                                       alloc_viommu.out_viommu_id, ret);
> +    if (ret) {
> +        error_setg_errno(errp, errno, "IOMMU_VIOMMU_ALLOC failed");
> +        return false;
> +    }
> +
> +    *out_viommu_id = alloc_viommu.out_viommu_id;
> +    return true;
> +}
> +
>  bool host_iommu_device_iommufd_attach_hwpt(HostIOMMUDeviceIOMMUFD *idev,
>                                             uint32_t hwpt_id, Error **errp)
>  {
> diff --git a/backends/trace-events b/backends/trace-events
> index 5a23db6c8a..a835827540 100644
> --- a/backends/trace-events
> +++ b/backends/trace-events
> @@ -19,3 +19,4 @@ iommufd_backend_free_id(int iommufd, uint32_t id, int ret) " iommufd=%d id=%d (%
>  iommufd_backend_set_dirty(int iommufd, uint32_t hwpt_id, bool start, int ret) " iommufd=%d hwpt=%u enable=%d (%d)"
>  iommufd_backend_get_dirty_bitmap(int iommufd, uint32_t hwpt_id, uint64_t iova, uint64_t size, uint64_t page_size, int ret) " iommufd=%d hwpt=%u iova=0x%"PRIx64" size=0x%"PRIx64" page_size=0x%"PRIx64" (%d)"
>  iommufd_backend_invalidate_cache(int iommufd, uint32_t hwpt_id, uint32_t data_type, uint32_t entry_len, uint32_t entry_num, uint32_t done_num, uint64_t data_ptr, int ret) " iommufd=%d hwpt_id=%u data_type=%u entry_len=%u entry_num=%u done_num=%u data_ptr=0x%"PRIx64" (%d)"
> +iommufd_backend_alloc_viommu(int iommufd, uint32_t type, uint32_t dev_id, uint32_t hwpt_id, uint32_t viommu_id, int ret) " iommufd=%d type=%u dev_id=%u hwpt_id=%u viommu_id=%u (%d)"
> diff --git a/include/system/iommufd.h b/include/system/iommufd.h
> index b93421ac7c..7e5507f2db 100644
> --- a/include/system/iommufd.h
> +++ b/include/system/iommufd.h
> @@ -55,6 +55,10 @@ bool iommufd_backend_alloc_hwpt(IOMMUFDBackend *be, uint32_t dev_id,
>                                  uint32_t data_type, uint32_t data_len,
>                                  void *data_ptr, uint32_t *out_hwpt,
>                                  Error **errp);
> +bool iommufd_backend_alloc_viommu(IOMMUFDBackend *be, uint32_t dev_id,
> +                                  uint32_t viommu_type, uint32_t hwpt_id,
> +                                  uint32_t *out_hwpt, Error **errp);
> +
>  bool iommufd_backend_set_dirty_tracking(IOMMUFDBackend *be, uint32_t hwpt_id,
>                                          bool start, Error **errp);
>  bool iommufd_backend_get_dirty_bitmap(IOMMUFDBackend *be, uint32_t hwpt_id,

