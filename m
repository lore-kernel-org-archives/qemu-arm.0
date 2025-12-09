Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E954D3B7EA
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Dec 2025 10:32:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vSv0r-0006RD-Vh; Tue, 09 Dec 2025 05:32:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vSv0k-0006Pa-Qk
 for qemu-arm@nongnu.org; Tue, 09 Dec 2025 05:32:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vSv0j-0003w5-6W
 for qemu-arm@nongnu.org; Tue, 09 Dec 2025 05:32:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765276320;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3r2Gn+GyRvWzhqDaIrIdZaO1hd9SIPPLg7tXHz6VxaI=;
 b=TWcL/R+gyPfQJ1Xsp+Exbl1jHBAnk37T2p+wfh15aLIXGrhpYeDMfx82Kvi5bwGnxELVRO
 2BVaNY6QuKy8dX3VOSnHoHDsornZD+IEc3wEF56QVup7NHQ0zzIyecFAEqJeSBZJ0TLjiX
 kszQIPYbS7vRq2k5DfPgKlp2K5/w950=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-398-7NHU-ExYO6qRW9fnfXA46A-1; Tue, 09 Dec 2025 05:31:59 -0500
X-MC-Unique: 7NHU-ExYO6qRW9fnfXA46A-1
X-Mimecast-MFC-AGG-ID: 7NHU-ExYO6qRW9fnfXA46A_1765276318
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-29e6b269686so28258215ad.1
 for <qemu-arm@nongnu.org>; Tue, 09 Dec 2025 02:31:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765276318; x=1765881118;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3r2Gn+GyRvWzhqDaIrIdZaO1hd9SIPPLg7tXHz6VxaI=;
 b=NxbvW0QoL/gDZa62ba5x1Jp2eRxpdbetDwHzlpIP5md3Rp2kjMTUYaYNuuocwQlHt1
 fUBWyzVaweeqCZahdptO7Pgx3MjvLNJJ/c1fzs4L2/unSiloDqOg4cXFO1Mg5tdQ9nM+
 X3IG57n9aHSo+IAvGRLqeo+lhaoQyLBXma5SDF/aqZWEqjpEgtxToKUBWrEeXjfMqigv
 W1xvUZ/LywNQJ/GkjISWLwqAcpjVkorcX+aCkFeDnvsHDXfSWpwkFP72Uz7agbavdxus
 zFGXRDbEXwWJ3fplFY51D9T85i3/a0ukVCnGVYnehsN/kA7TZvdmoMS4OKoUiivaMyta
 0Rbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3y/S5eLa+sPR92Fs1YibrgiFaOouGxRn3nWt8c2aRdQLBe7aRmiil43Bxhs+vPxNkmNanfHfCZA==@nongnu.org
X-Gm-Message-State: AOJu0Yzj8BC3emGWt0wjqPk4/I1Ynz0uE0J0s1O8RydgR84Lve6jJF0s
 TNApHB0Nb52UQvcVc6V3InsPIcNHU2bzNfaB5lQAewKb3jPtKP+WRabUQdzcohPmkDOfQ2X13+1
 Y+5ocIW2aQU/0b6Zp4eRuGCQEJmO9bKRGk35p+UKLDOoUAN95LL2Nlg==
X-Gm-Gg: ASbGnctx80Ic3+NymJXpNp092+apmF9tPJbsp5t1yQO1IjItehPb/oAYQJ85eY3Jk0I
 Qqa2OEVz8Zp1uMyPXAeDqlndZm3oixlMurFlGzlr6hy1VtXNsrR5adeMFnSErcGonuTXq3ZVji4
 SxdMge1//EB3itx/1L78ZG9pHeX3It8SNoUB/iW0gdm7f/0mQhz2z0WJvPJRZFF/+cPdRx3IPJK
 pRgLx1q1XiqIvMcsSuTBnMfEyVomj7rxXjuYCTVWi3juiiQ+e7HMwTD+17iYirenCrAklnv82Hd
 V0KOazcFYAIUyXzf8WSmnles0paiSdMnmkZ3TfYr/SDkajhkQcSIUJpCwRLiyamvu+bE9Hu1jKA
 bEqum3AzES/IWBMjajbMr2iglXacuJE2W8ANHOmGB0ZBp7Sx65wkw5JpXpA==
X-Received: by 2002:a05:7022:4394:b0:119:e56b:958c with SMTP id
 a92af1059eb24-11e0325ef0fmr7939806c88.17.1765276318248; 
 Tue, 09 Dec 2025 02:31:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFLPmiNGF8TBRnuHUE83sJD5OVTkWG7a/3mClSSRRWjj8Ry4RalpPAy9O0SlU08TxlCDzpIiA==
X-Received: by 2002:a05:7022:4394:b0:119:e56b:958c with SMTP id
 a92af1059eb24-11e0325ef0fmr7939785c88.17.1765276317708; 
 Tue, 09 Dec 2025 02:31:57 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-11df7552defsm69293603c88.2.2025.12.09.02.31.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Dec 2025 02:31:57 -0800 (PST)
Message-ID: <bf00d499-cbe9-4e14-a79c-a601fd19a558@redhat.com>
Date: Tue, 9 Dec 2025 11:31:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] backends/iommufd: Introduce
 iommufd_backend_alloc_veventq
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, nicolinc@nvidia.com, nathanc@nvidia.com,
 mochs@nvidia.com, jgg@nvidia.com, jonathan.cameron@huawei.com,
 zhangfei.gao@linaro.org, zhenzhong.duan@intel.com, kjaju@nvidia.com
References: <20251204092245.5157-1-skolothumtho@nvidia.com>
 <20251204092245.5157-2-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20251204092245.5157-2-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NPqoA_szkD5708VO1QXjtuL5-A3VJpf6oMPaT2Ok6n4_1765276318
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



On 12/4/25 10:22 AM, Shameer Kolothum wrote:
> From: Nicolin Chen <nicolinc@nvidia.com>
>
> Add a new helper for IOMMU_VEVENTQ_ALLOC ioctl to allocate a virtual event
> queue (vEVENTQ) for a vIOMMU object.
>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  backends/iommufd.c       | 31 +++++++++++++++++++++++++++++++
>  backends/trace-events    |  1 +
>  include/system/iommufd.h | 12 ++++++++++++
>  3 files changed, 44 insertions(+)
>
> diff --git a/backends/iommufd.c b/backends/iommufd.c
> index 718d63f5cf..633aecd525 100644
> --- a/backends/iommufd.c
> +++ b/backends/iommufd.c
> @@ -503,6 +503,37 @@ bool iommufd_backend_alloc_vdev(IOMMUFDBackend *be, uint32_t dev_id,
>      return true;
>  }
>  
> +bool iommufd_backend_alloc_veventq(IOMMUFDBackend *be, uint32_t viommu_id,
> +                                   uint32_t type, uint32_t depth,
> +                                   uint32_t *out_veventq_id,
> +                                   uint32_t *out_veventq_fd, Error **errp)
> +{
> +    int ret;
> +    struct iommu_veventq_alloc alloc_veventq = {
> +        .size = sizeof(alloc_veventq),
> +        .flags = 0,
> +        .type = type,
> +        .veventq_depth = depth,
> +        .viommu_id = viommu_id,
> +    };
> +
> +    ret = ioctl(be->fd, IOMMU_VEVENTQ_ALLOC, &alloc_veventq);
> +
> +    trace_iommufd_viommu_alloc_eventq(be->fd, viommu_id, type,
> +                                      alloc_veventq.out_veventq_id,
> +                                      alloc_veventq.out_veventq_fd, ret);
> +    if (ret) {
> +        error_setg_errno(errp, errno, "IOMMU_VEVENTQ_ALLOC failed");
> +        return false;
> +    }
> +
> +    g_assert(out_veventq_id);
> +    g_assert(out_veventq_fd);
can it happen if the ioctl succeeds?
> +    *out_veventq_id = alloc_veventq.out_veventq_id;
> +    *out_veventq_fd = alloc_veventq.out_veventq_fd;
> +    return true;
> +}
> +
>  bool host_iommu_device_iommufd_attach_hwpt(HostIOMMUDeviceIOMMUFD *idev,
>                                             uint32_t hwpt_id, Error **errp)
>  {
> diff --git a/backends/trace-events b/backends/trace-events
> index 8408dc8701..5afa7a40be 100644
> --- a/backends/trace-events
> +++ b/backends/trace-events
> @@ -23,3 +23,4 @@ iommufd_backend_get_dirty_bitmap(int iommufd, uint32_t hwpt_id, uint64_t iova, u
>  iommufd_backend_invalidate_cache(int iommufd, uint32_t id, uint32_t data_type, uint32_t entry_len, uint32_t entry_num, uint32_t done_num, uint64_t data_ptr, int ret) " iommufd=%d id=%u data_type=%u entry_len=%u entry_num=%u done_num=%u data_ptr=0x%"PRIx64" (%d)"
>  iommufd_backend_alloc_viommu(int iommufd, uint32_t dev_id, uint32_t type, uint32_t hwpt_id, uint32_t viommu_id, int ret) " iommufd=%d type=%u dev_id=%u hwpt_id=%u viommu_id=%u (%d)"
>  iommufd_backend_alloc_vdev(int iommufd, uint32_t dev_id, uint32_t viommu_id, uint64_t virt_id, uint32_t vdev_id, int ret) " iommufd=%d dev_id=%u viommu_id=%u virt_id=0x%"PRIx64" vdev_id=%u (%d)"
> +iommufd_viommu_alloc_eventq(int iommufd, uint32_t viommu_id, uint32_t type, uint32_t veventq_id, uint32_t veventq_fd, int ret) " iommufd=%d viommu_id=%u type=%u veventq_id=%u veventq_fd=%u (%d)"
> diff --git a/include/system/iommufd.h b/include/system/iommufd.h
> index aa78bf1e1d..9770ff1484 100644
> --- a/include/system/iommufd.h
> +++ b/include/system/iommufd.h
> @@ -56,6 +56,13 @@ typedef struct IOMMUFDVdev {
>      uint32_t virt_id;  /* virtual device ID */
>  } IOMMUFDVdev;
>  
> +/* Virtual event queue interface for a vIOMMU */
> +typedef struct IOMMUFDVeventq {
> +    IOMMUFDViommu *viommu;
> +    uint32_t veventq_id;
> +    uint32_t veventq_fd;
> +} IOMMUFDVeventq;
> +
>  bool iommufd_backend_connect(IOMMUFDBackend *be, Error **errp);
>  void iommufd_backend_disconnect(IOMMUFDBackend *be);
>  
> @@ -86,6 +93,11 @@ bool iommufd_backend_alloc_vdev(IOMMUFDBackend *be, uint32_t dev_id,
>                                  uint32_t viommu_id, uint64_t virt_id,
>                                  uint32_t *out_vdev_id, Error **errp);
>  
> +bool iommufd_backend_alloc_veventq(IOMMUFDBackend *be, uint32_t viommu_id,
> +                                   uint32_t type, uint32_t depth,
> +                                   uint32_t *out_veventq_id,
> +                                   uint32_t *out_veventq_fd, Error **errp);
> +
>  bool iommufd_backend_set_dirty_tracking(IOMMUFDBackend *be, uint32_t hwpt_id,
>                                          bool start, Error **errp);
>  bool iommufd_backend_get_dirty_bitmap(IOMMUFDBackend *be, uint32_t hwpt_id,
Eric


