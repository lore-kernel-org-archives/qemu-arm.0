Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13224C9EC90
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Jan 2026 13:35:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vfI4Z-0003EB-F0; Mon, 12 Jan 2026 08:35:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vfI4B-0002xD-DP
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 08:34:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vfI47-0005dI-UR
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 08:34:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1768224876;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gASr85tXtUw0ZbEuWAy43A1tr8An/phnUQJzd0qzsU8=;
 b=fYA30H6IKClzl1e4HiOsoWFsmYlVZI39kzVAssvICTk0sXbAbUhN5UHOZtVhDi4LCP1czW
 YOGI+UxGHEiXqvaGuYjo4hunVi75QhxOTwIj88p7900t5e3yBkrWU8ZgLU/RWJcttP917u
 KxqzXv6k5rOWQZ57Kils/pDDQsnyFcQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-330-TNwlYopsOI6MgJdd6UMybw-1; Mon, 12 Jan 2026 08:34:35 -0500
X-MC-Unique: TNwlYopsOI6MgJdd6UMybw-1
X-Mimecast-MFC-AGG-ID: TNwlYopsOI6MgJdd6UMybw_1768224874
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-42fb1c2c403so4601501f8f.3
 for <qemu-arm@nongnu.org>; Mon, 12 Jan 2026 05:34:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768224873; x=1768829673;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gASr85tXtUw0ZbEuWAy43A1tr8An/phnUQJzd0qzsU8=;
 b=woxBFE183XWsRhLWqb9fT97d7wKvM5o1NywWWQGknRtadnTXZUucjN9XOWLC2O57Aj
 Bz/5fUbWE5ac+yNlXMkqjhexo0wH6DGBxCg8rynxYwz9lh7nVVd0X3uGTG1bjsDEk2sf
 D3AjKvQkNqH6UEYNM1gWC7j8mflFgcNdMubf2V3fgnZXmYxgp0ldFQzaL+U5cKW7TKG8
 DmV7bEh4RoHC1gQUoj3YfD1K/CuWFoeGQxf3zZQxFe4Yr2ip6vY/9IRVTkhKq/Rsf7mu
 nDeIC+yd/lVqNRKj71K97g36C1ZI9T2lPgO10RnHDOTl9CfBIodJF1nJM4F6SEoX0DGc
 fK5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQGLJ99aWHKrpf7Bl2eQJyFIbSCfzUgxs5l5QihNJFrMagbdjVPQD6kCwbxD5eLSlGryqUarhKuw==@nongnu.org
X-Gm-Message-State: AOJu0YyRNVvBLrtuBYidtxHu2kFAyxxi8VVirEDGNMvmbKL0ie/481Dh
 xaM+6ju6DxmCpvbPkO97ucJrCIfd99E/WO3nSnPMrptXHNaCT7/t+jq5AY+rTWwtIqFAoyea8BB
 a4AeHBoJ+le1htl1TRaGRl2CK5FEowHCBgf36Hqzhaiw9bXXOMDiTeA==
X-Gm-Gg: AY/fxX5PDqxH5DGfD3sO8+KjRgeQtgeaZSULN7sLDIac55q2OkPBCcJb+9ZoL+fXx9Q
 tgdl1l3oKq+lSPfEDW/oXXBOmKpbzf2lLgHuk2Jszq0zu/uc486YEjDtQECnGZta0rHcIeRa+wd
 QBKlyxnHfB4/4FgAk4gM+JjmxS10ZSAhZp0vulJTQ4G7tK/gT7wwO1vwkyd8+sKYn1gGWSIw15e
 Hes74X4ZdAFrDeHZHyXvD1In71lBitix/eW+MZqkKMifvu5S1acmBEzKkpBTU/iq3fwCI3pveLI
 d+TfcWaeohwhBfxkajIxrx62dv5/F+G7zVtpvvcc/jlsrLOwYNy+IZ5yo0b/QP8LAYbmWMcpPGs
 O+YaS9pnAim0AlS0dyXYNz/Lj58KnAsxg+Tu+bxVynsyVe8xJ7w0Bbms3BQ==
X-Received: by 2002:a05:6000:200d:b0:42f:b3b9:874d with SMTP id
 ffacd0b85a97d-432c37c86e0mr20046956f8f.37.1768224873437; 
 Mon, 12 Jan 2026 05:34:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVEL5jXm1jzEHDU9OimJxEF0XRmDm95g1xsdK96mX+Mp8upUKumrmqFjPCEcLsMm1Xst3/nQ==
X-Received: by 2002:a05:6000:200d:b0:42f:b3b9:874d with SMTP id
 ffacd0b85a97d-432c37c86e0mr20046913f8f.37.1768224872905; 
 Mon, 12 Jan 2026 05:34:32 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0dadcfsm38139391f8f.3.2026.01.12.05.34.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jan 2026 05:34:32 -0800 (PST)
Message-ID: <3e5becf1-d7cf-435c-b45e-0ca1371f50d7@redhat.com>
Date: Mon, 12 Jan 2026 14:34:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 02/16] backends/iommufd: Update
 iommufd_backend_alloc_viommu to allow user ptr
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, nicolinc@nvidia.com, nathanc@nvidia.com,
 mochs@nvidia.com, jgg@nvidia.com, jonathan.cameron@huawei.com,
 zhangfei.gao@linaro.org, zhenzhong.duan@intel.com, kjaju@nvidia.com
References: <20251210133737.78257-1-skolothumtho@nvidia.com>
 <20251210133737.78257-3-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20251210133737.78257-3-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Jf3IB060_DB6l98ndGIiVeMn02fzy9ufGOsAI-Z0n0E_1768224874
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



On 12/10/25 2:37 PM, Shameer Kolothum wrote:
> From: Nicolin Chen <nicolinc@nvidia.com>
>
> The updated IOMMUFD VIOMMU_ALLOC uAPI allows userspace to provide a data
> buffer when creating a vIOMMU (e.g. for Tegra241 CMDQV). Extend
> iommufd_backend_alloc_viommu() to pass a user pointer and size to the
> kernel.
>
> Update the caller accordingly.
>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
with or without trace update:
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric



> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  backends/iommufd.c       | 3 +++
>  hw/arm/smmuv3-accel.c    | 4 ++--
>  include/system/iommufd.h | 1 +
>  3 files changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/backends/iommufd.c b/backends/iommufd.c
> index 938c8fe669..2f6fa832a7 100644
> --- a/backends/iommufd.c
> +++ b/backends/iommufd.c
> @@ -459,6 +459,7 @@ bool iommufd_backend_invalidate_cache(IOMMUFDBackend *be, uint32_t id,
>  
>  bool iommufd_backend_alloc_viommu(IOMMUFDBackend *be, uint32_t dev_id,
>                                    uint32_t viommu_type, uint32_t hwpt_id,
> +                                  void *data_ptr, uint32_t len,
>                                    uint32_t *out_viommu_id, Error **errp)
>  {
>      int ret;
> @@ -467,6 +468,8 @@ bool iommufd_backend_alloc_viommu(IOMMUFDBackend *be, uint32_t dev_id,
>          .type = viommu_type,
>          .dev_id = dev_id,
>          .hwpt_id = hwpt_id,
> +        .data_len = len,
> +        .data_uptr = (uintptr_t)data_ptr,
>      };
>  
>      ret = ioctl(be->fd, IOMMU_VIOMMU_ALLOC, &alloc_viommu);
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> index 300c35ccb5..939898c9b0 100644
> --- a/hw/arm/smmuv3-accel.c
> +++ b/hw/arm/smmuv3-accel.c
> @@ -503,8 +503,8 @@ smmuv3_accel_alloc_viommu(SMMUv3State *s, HostIOMMUDeviceIOMMUFD *idev,
>      SMMUv3AccelState *accel;
>  
>      if (!iommufd_backend_alloc_viommu(idev->iommufd, idev->devid,
> -                                      IOMMU_VIOMMU_TYPE_ARM_SMMUV3,
> -                                      s2_hwpt_id, &viommu_id, errp)) {
> +                                      IOMMU_VIOMMU_TYPE_ARM_SMMUV3, s2_hwpt_id,
> +                                      NULL, 0, &viommu_id, errp)) {
>          return false;
>      }
>  
> diff --git a/include/system/iommufd.h b/include/system/iommufd.h
> index 9770ff1484..a3e8087b3a 100644
> --- a/include/system/iommufd.h
> +++ b/include/system/iommufd.h
> @@ -87,6 +87,7 @@ bool iommufd_backend_alloc_hwpt(IOMMUFDBackend *be, uint32_t dev_id,
>                                  Error **errp);
>  bool iommufd_backend_alloc_viommu(IOMMUFDBackend *be, uint32_t dev_id,
>                                    uint32_t viommu_type, uint32_t hwpt_id,
> +                                  void *data_ptr, uint32_t len,
>                                    uint32_t *out_hwpt, Error **errp);
>  
>  bool iommufd_backend_alloc_vdev(IOMMUFDBackend *be, uint32_t dev_id,


