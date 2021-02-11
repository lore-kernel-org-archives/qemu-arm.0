Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp2591341lfc;
        Thu, 11 Feb 2021 12:22:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyjfp1+k8/+hxk+pILA3QoE1sK25Gh+6I46rpYTJF6pFLkJ+Q2om+vPsra+yPvHvUJZH9Ls
X-Received: by 2002:a25:943:: with SMTP id u3mr15724211ybm.244.1613074948406;
        Thu, 11 Feb 2021 12:22:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613074948; cv=none;
        d=google.com; s=arc-20160816;
        b=uQtxUiyFWBs8WkQ+vqa4++D/9Ua+tWtNqjyIbTulPMrtnUL0sBb2GwkmHMwEzShxCg
         fmT8w+RFip39VaIFSmr8PKghjlF5wPbvcVeDrn+OdX0sBQUQ7vYkZ3w83NZVnJ4KMzo0
         Q383p9h8qMevKFIf+HjM8jAF6fnWN/OgvuJrMePuPZqiFWIpJBeiufJddMCbKR1oyXQi
         i1bbXlUc836s9/bKA+qnYw+zHOyD1v5ZTT8SE6tAxt2yi4QsM3uFIRZpkZ0HTGbT0i09
         +TcBnsCvo+8Jv9Ovc5UW0qcg7RnQtm7Cospsu2EuK7jbN5codQD2WN+c0h5IkL5CiDQc
         rZmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=6XtdO2/+UuMCY/9BcmB/4eIg5RHULcDpAcE5xofvX7A=;
        b=kiza6xhWSYKE5rcor+u2wGSahOqQlhzNa0zJsX7QZ4EGHqwPfDDFxRm2W5+yBdtlRI
         LKp9HYCeuCCmHIwZ6UJhKOA3muwzf4o0qw+gU83WhDwKLKYbALrR11AJteu7gHDpmTnF
         pYUFQ6e2tbZdX3hftbQ6OxUM47KmNXJT0P58vaGNNTtuXE7jY9x2z3mMCbdzCNMPtq1f
         vyIBXDVSpHz9IOtSQdN70SxTnbETGuj6Nglm56IuutsHH7bva8DqzDQ7tdy2CKBF0nVX
         TmQ342qRSBqh6bPFpT6z6dQXJimsq2Mit7AfLqtib9ygMPln6rhRvEDXMzKbxceE6G/3
         CKlg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GRYrlu6L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k135si3599233ybf.249.2021.02.11.12.22.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Feb 2021 12:22:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GRYrlu6L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lAITr-0003eP-PW
	for alex.bennee@linaro.org; Thu, 11 Feb 2021 15:22:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1lAIRk-0002FJ-EA
 for qemu-arm@nongnu.org; Thu, 11 Feb 2021 15:20:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1lAIRh-0004AW-QJ
 for qemu-arm@nongnu.org; Thu, 11 Feb 2021 15:20:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613074812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6XtdO2/+UuMCY/9BcmB/4eIg5RHULcDpAcE5xofvX7A=;
 b=GRYrlu6L6d8OPTbje4iMj+Nw97yWyjuTdcOtQJk29AXfhBxiVSWHr0aB62+/U3qoq8mhct
 lSRJlO2F1tkiBKej+eIUL4/InMcUuMqZapKvCxc/O+QVjjeagoHbjIDtu0VlpdiEkfs19c
 +pHiJ4WQwV5OgzhRgGnWUTqIH/W51WM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-vd-wYUv7OSCH1Mcfwd2GTA-1; Thu, 11 Feb 2021 15:20:10 -0500
X-MC-Unique: vd-wYUv7OSCH1Mcfwd2GTA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 555371005501;
 Thu, 11 Feb 2021 20:20:08 +0000 (UTC)
Received: from omen.home.shazbot.org (ovpn-112-255.phx2.redhat.com
 [10.3.112.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 21F1A7086A;
 Thu, 11 Feb 2021 20:19:57 +0000 (UTC)
Date: Thu, 11 Feb 2021 13:19:56 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH 1/2] vfio: Do not register any
 IOMMU_NOTIFIER_DEVIOTLB_UNMAP notifier
Message-ID: <20210211131956.107537f7@omen.home.shazbot.org>
In-Reply-To: <20210209213233.40985-2-eric.auger@redhat.com>
References: <20210209213233.40985-1-eric.auger@redhat.com>
 <20210209213233.40985-2-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, mst@redhat.com, jasowang@redhat.com,
 qemu-devel@nongnu.org, peterx@redhat.com, groug@kaod.org, eperezma@redhat.com,
 qemu-arm@nongnu.org, jean-philippe@linaro.org, david@gibson.dropbear.id.au,
 eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OvHDhx1EO7y+

On Tue,  9 Feb 2021 22:32:32 +0100
Eric Auger <eric.auger@redhat.com> wrote:

> In an attempt to fix smmu/virtio-iommu - vhost regression, commit
> 958ec334bca3 ("vhost: Unbreak SMMU and virtio-iommu on dev-iotlb support")
> broke virtio-iommu integration. This is due to the fact VFIO registers
> IOMMU_NOTIFIER_ALL notifiers, which includes IOMMU_NOTIFIER_DEVIOTLB_UNMAP
> and this latter now is rejected by the virtio-iommu. As a consequence,
> the registration fails. VHOST behaves like a device with an ATC cache. The
> VFIO device does not support this scheme yet.
> 
> Let's register only legacy MAP and UNMAP notifiers.
> 
> Fixes: 958ec334bca3 ("vhost: Unbreak SMMU and virtio-iommu on dev-iotlb support")
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/vfio/common.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 6ff1daa763..a50b10c801 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -787,7 +787,7 @@ static void vfio_listener_region_add(MemoryListener *listener,
>          iommu_idx = memory_region_iommu_attrs_to_index(iommu_mr,
>                                                         MEMTXATTRS_UNSPECIFIED);
>          iommu_notifier_init(&giommu->n, vfio_iommu_map_notify,
> -                            IOMMU_NOTIFIER_ALL,
> +                            IOMMU_NOTIFIER_IOTLB_EVENTS,
>                              section->offset_within_region,
>                              int128_get64(llend),
>                              iommu_idx);

Acked-by: Alex Williamson <alex.williamson@redhat.com>

