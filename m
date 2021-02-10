Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp1070645lfc;
        Wed, 10 Feb 2021 00:11:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz6nx21KADAV16fqJxl5vFoUnnNrFB6Hb9h9BKvqg+sObGHaTr9y8dqb3xrbSQ+Lp5DCfhh
X-Received: by 2002:a25:f20b:: with SMTP id i11mr2658010ybe.273.1612944701858;
        Wed, 10 Feb 2021 00:11:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612944701; cv=none;
        d=google.com; s=arc-20160816;
        b=jfZcpJ9TSuqqLClODnalIcf25cCtAdU4J0Ys2bnaaLMgDap7IDO8ad9NU5ahxWvQzo
         wKgmFqGNFo+xPyioID0ez0PGvmCI+xphOf+bOYyMdIyJeh+jnBLJAzckwWsl1y6U7qCF
         OtZ3e3BbStzqp4BAzUAxCSGAMbxvjoOPzWVO2Yre9aUDlyN6hf7nmbnBBf4+AWcl9Q0t
         2Gu7qPes/FdCaxMRyvckAhsJbznCiZPbH6G0PYuJ1DLLulfZ+7dzQI52jqWM6+orGHVf
         aQkQobQ6DwOWt0U8Ab1GkUL6aoVWA8F2kdjMCuKnou7+IA26h78hvCPlUxF+87jqGn1t
         0PmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=tcsbE0qqBQawtHjLhHXAI98Ny2HDQeZwk9EAX3zBoy0=;
        b=qgCO9VDfYip0BGyZauuygoQAdyYRMdIZTs2NEf8HoK65ahv6aA8QEO7E9SnH1lE8CI
         0aeH2CNICW2z/4L621RpGiMBmpLxLotHpwdmEZ39ztXSff75a5/TwnetbDa2TUiRSKnv
         VKNIhpNn6U/9GlqsHp7VBBltRHSioRtSvKANHTMzJ13havlKW128qD2mZH48/grxhxdf
         NJXpkGxJ5bLET5nhe32v2IA2TfJhdATkpin/dy/ZcHG433Rcv1RvjMh3P75zN+hkubEe
         Cs44yrzGFeWPTOlMHOvBA3AC0F1DD7wQg6FO4y4LHXnvQedWvZLfk6IekG2hsd8M7KRt
         oqlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WMdDMcRH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z4si1337426ybz.80.2021.02.10.00.11.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Feb 2021 00:11:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WMdDMcRH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l9kb7-0001DH-6w
	for alex.bennee@linaro.org; Wed, 10 Feb 2021 03:11:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1l9kaz-0001DB-Qm
 for qemu-arm@nongnu.org; Wed, 10 Feb 2021 03:11:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1l9kan-0005dS-Ri
 for qemu-arm@nongnu.org; Wed, 10 Feb 2021 03:11:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612944680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tcsbE0qqBQawtHjLhHXAI98Ny2HDQeZwk9EAX3zBoy0=;
 b=WMdDMcRH97xXka1Zz/LSeltHANQKNgpI7FAwjTmhAj+dLVkXvE+DtEJyENA+XYQsnWbV6z
 7Xh0zp/E+rODEXhafKl4PaRPRBsLxLBrJ/OplNfkqJo/ZKw8frINSKHcyjZ+0jXs+cfHOE
 o2Kex+kaS0S1l32Tqjc86b8LI3fl45w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-530-ILApvVUbNzemJlHqHxpvHA-1; Wed, 10 Feb 2021 03:11:17 -0500
X-MC-Unique: ILApvVUbNzemJlHqHxpvHA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BECAD1005501;
 Wed, 10 Feb 2021 08:11:15 +0000 (UTC)
Received: from [10.72.12.223] (ovpn-12-223.pek2.redhat.com [10.72.12.223])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5235A6F7EE;
 Wed, 10 Feb 2021 08:10:52 +0000 (UTC)
Subject: Re: [PATCH 1/2] vfio: Do not register any
 IOMMU_NOTIFIER_DEVIOTLB_UNMAP notifier
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 mst@redhat.com, alex.williamson@redhat.com, eperezma@redhat.com,
 jean-philippe@linaro.org, david@gibson.dropbear.id.au, groug@kaod.org
References: <20210209213233.40985-1-eric.auger@redhat.com>
 <20210209213233.40985-2-eric.auger@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <09d20dd5-fa58-b34a-094d-2de89654fa37@redhat.com>
Date: Wed, 10 Feb 2021 16:10:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210209213233.40985-2-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.265, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peterx@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: T6WmpuY2yFa8


On 2021/2/10 上午5:32, Eric Auger wrote:
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
>   hw/vfio/common.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 6ff1daa763..a50b10c801 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -787,7 +787,7 @@ static void vfio_listener_region_add(MemoryListener *listener,
>           iommu_idx = memory_region_iommu_attrs_to_index(iommu_mr,
>                                                          MEMTXATTRS_UNSPECIFIED);
>           iommu_notifier_init(&giommu->n, vfio_iommu_map_notify,
> -                            IOMMU_NOTIFIER_ALL,
> +                            IOMMU_NOTIFIER_IOTLB_EVENTS,
>                               section->offset_within_region,
>                               int128_get64(llend),
>                               iommu_idx);


Acked-by: Jason Wang <jasowang@redhat.com>


