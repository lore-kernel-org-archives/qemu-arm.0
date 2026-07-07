Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCBFBC43458
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Jul 2026 07:49:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wh0Xt-0002gh-7M; Tue, 07 Jul 2026 03:48:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wh0Xs-0002gQ-Aa
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 03:48:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wh0Xq-00009D-Vk
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 03:48:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1783410520;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kA8OjJ6WUzoAxYW6xLIYHtXWSlL/HNAKv1DBHBQUfbY=;
 b=iDX3OQpmtg+gRXMPPFSo9x3offTIUkUQKi0ynajRw97rR8nO1zSajYFT8lBpuC4Q4Skjpq
 tudN8uzXiTIbFZmST5sE2FrgYFFeXyrhZGma/qvRJ+N+YA+ieFJ01qwM/zVA8XOBLdQFL2
 ZFcYq0HsdLob2/PE9Dulf6Fuq6A0sJ8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-34-8eGKikMSMsKjKVLK2VfWWA-1; Tue, 07 Jul 2026 03:48:39 -0400
X-MC-Unique: 8eGKikMSMsKjKVLK2VfWWA-1
X-Mimecast-MFC-AGG-ID: 8eGKikMSMsKjKVLK2VfWWA_1783410518
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-47345535410so3262466f8f.1
 for <qemu-arm@nongnu.org>; Tue, 07 Jul 2026 00:48:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783410518; x=1784015318;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kA8OjJ6WUzoAxYW6xLIYHtXWSlL/HNAKv1DBHBQUfbY=;
 b=d07wsOgtx5rw/jCpfmGt/RhmhEou26UP5c+wjX7rsSkXVntE5o9H0XX6FT3LWWU7I8
 KPBu6ZePRuqVeSWxoyTASjpbXlZ58DG1Im0u+IiM71tQVK5h+aFVNnGJzBhys0bHh97/
 8LsSj9YJ9tzG6ChXBiathNp8JGc5Wxhvu14E5wieKtjZ83AgtiypcUGR383VJ0X2YhSG
 bx+LbEFV28JNzM/uOKXYNhhAWIgNIx37P3npRQ/1CMemF4dOC5fceUTijoCXopPgx4uS
 StKr3teEPGxCK8gdrxLjCsUo+6VYU3hsREIvXkO2R4WPQ8BCwXY6BXH5pWSdTRF/K7Qm
 Z5Hw==
X-Forwarded-Encrypted: i=1;
 AHgh+RrmsRkXkCDWL/Y8PQUjaiBjevhq8BtaeqF0DNz1ah2sCGCDOPciIWG+TiFCjEWl/ARjgz2yRBUHeg==@nongnu.org
X-Gm-Message-State: AOJu0YxBq7JVPM2qolzjFcJ8zd2k1S64jj3H2ZeiyXGVYI2rbSGI/+bt
 Dr5b3IeYHs8bTWFNY8faFTUIFxTu0eVYWoTSOXsFSAumwAoV9Pvw3GKBrvx4Ah2tDmQHaye+TuZ
 4NYDy/n7dC+wdUaTMWfA5VPeFotzpj/7wyL+tQo7e73du8mcF1QEqjw==
X-Gm-Gg: AfdE7cm1A/xmh3kp1uKMrv4RUxdbj+3Dkcffk3Eio+yv21EpiH7fIsj12hixiUiz7iU
 gD1loCGuEpWjL7InTiPkr5rzHdgL+UgLqOsVZ85Ydo8SqO/3W9Hlb4K1axoKPTYvu3jK7vtkXFN
 WHjZd7xBw8QF/KUC8RbVMp/wkRxjA1OFl+kUOtIzK406s7t/4U2Fik5TdS7rrXHCzSYjjsWxGjz
 QawywaUr1sB0HexurUFh8lW2ndvzL/c1S8LExT4/tvzekIa3FBw62IfDV3WuqSfdl+GkpRhmP8r
 PujVZlOwUQ6cLBeLmT8p76ckxcAMqa30pUvAEVN7jly4zSwwNmw881aak4o2ZzvOGzah2tZa/73
 Zx8dDzL7x13eszzffNTpUsRbjXcfsRAKNI/IpO+Y8M04/No+3s2gKiUB8vpt6Qg==
X-Received: by 2002:adf:f04e:0:b0:472:8343:7f5e with SMTP id
 ffacd0b85a97d-47de660347emr3297067f8f.5.1783410518199; 
 Tue, 07 Jul 2026 00:48:38 -0700 (PDT)
X-Received: by 2002:adf:f04e:0:b0:472:8343:7f5e with SMTP id
 ffacd0b85a97d-47de660347emr3297042f8f.5.1783410517764; 
 Tue, 07 Jul 2026 00:48:37 -0700 (PDT)
Received: from ?IPV6:2a01:cb1c:263:8800:8714:9136:d3b4:25b3?
 ([2a01:cb1c:263:8800:8714:9136:d3b4:25b3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47a9de1e785sm31313077f8f.8.2026.07.07.00.48.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jul 2026 00:48:37 -0700 (PDT)
Message-ID: <07fad629-3ae4-446f-8227-9c45eada5023@redhat.com>
Date: Tue, 7 Jul 2026 09:48:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] backends/iommufd: Fix dev_id and type order in viommu
 trace
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, clg@redhat.com, nicolinc@nvidia.com,
 nathanc@nvidia.com, mochs@nvidia.com, jan@nvidia.com
References: <20260706103653.84243-1-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260706103653.84243-1-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IrZOYdI0JQK4byOp7DcvOewA2v-68yggn_R7JXXP4_U_1783410518
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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



On 7/6/26 12:36 PM, Shameer Kolothum wrote:
> The trace event receives dev_id before type, but its format string prints
> them in the wrong order. Correct the order.
>
> Fixes: f2d31df0d925 ("backends/iommufd: Introduce iommufd_backend_alloc_viommu")
> Reported-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric

> ---
>  backends/trace-events | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/backends/trace-events b/backends/trace-events
> index b63420b73e..009a25b0be 100644
> --- a/backends/trace-events
> +++ b/backends/trace-events
> @@ -21,7 +21,7 @@ iommufd_backend_free_id(int iommufd, uint32_t id, int ret) " iommufd=%d id=%d (%
>  iommufd_backend_set_dirty(int iommufd, uint32_t hwpt_id, bool start, int ret) " iommufd=%d hwpt=%u enable=%d (%d)"
>  iommufd_backend_get_dirty_bitmap(int iommufd, uint32_t hwpt_id, uint64_t iova, uint64_t size, uint64_t flags, uint64_t page_size, int ret) " iommufd=%d hwpt=%u iova=0x%"PRIx64" size=0x%"PRIx64" flags=0x%"PRIx64" page_size=0x%"PRIx64" (%d)"
>  iommufd_backend_invalidate_cache(int iommufd, uint32_t id, uint32_t data_type, uint32_t entry_len, uint32_t entry_num, uint32_t done_num, uint64_t data_ptr, int ret) " iommufd=%d id=%u data_type=%u entry_len=%u entry_num=%u done_num=%u data_ptr=0x%"PRIx64" (%d)"
> -iommufd_backend_alloc_viommu(int iommufd, uint32_t dev_id, uint32_t type, uint32_t hwpt_id, uint64_t data_ptr, uint32_t data_len, uint32_t viommu_id, int ret) " iommufd=%d type=%u dev_id=%u hwpt_id=%u data_ptr=0x%"PRIx64" data_len=0x%x viommu_id=%u (%d)"
> +iommufd_backend_alloc_viommu(int iommufd, uint32_t dev_id, uint32_t type, uint32_t hwpt_id, uint64_t data_ptr, uint32_t data_len, uint32_t viommu_id, int ret) " iommufd=%d dev_id=%u type=%u hwpt_id=%u data_ptr=0x%"PRIx64" data_len=0x%x viommu_id=%u (%d)"
>  iommufd_backend_alloc_vdev(int iommufd, uint32_t dev_id, uint32_t viommu_id, uint64_t virt_id, uint32_t vdev_id, int ret) " iommufd=%d dev_id=%u viommu_id=%u virt_id=0x%"PRIx64" vdev_id=%u (%d)"
>  iommufd_viommu_alloc_eventq(int iommufd, uint32_t viommu_id, uint32_t type, uint32_t veventq_id, uint32_t veventq_fd, int ret) " iommufd=%d viommu_id=%u type=%u veventq_id=%u veventq_fd=%u (%d)"
>  iommufd_backend_alloc_hw_queue(int iommufd, uint32_t viommu_id, uint32_t queue_type, uint32_t index, uint64_t addr, uint64_t size, uint32_t queue_id, int ret) " iommufd=%d viommu_id=%u queue_type=%u index=%u addr=0x%"PRIx64" size=0x%"PRIx64" queue_id=%u (%d)"


