Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp396077lfg;
        Wed, 10 Mar 2021 02:31:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyfu9Scef61LY5OnmF21SlFfqClmPbYZGNmKQhVc4XFD4VeKSx0Vh2mgksqHWvxJ+W360NX
X-Received: by 2002:a25:7455:: with SMTP id p82mr1111236ybc.382.1615372276126;
        Wed, 10 Mar 2021 02:31:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615372276; cv=none;
        d=google.com; s=arc-20160816;
        b=V46BiYvsWhoPturJnH5ZugUp/cmMjfG0GYigxPqN1dPbuJVCyOfVEPlT2smuOSj1aY
         i0lu5gHQNVyn+EdDp7HWgPZG3GhQszrzjlRqW5DBWwy0x//S0kFJdtT09/hKce8gX/ob
         ejLA2FbK9K1QEPSikTyCOQQaYxff0CoRzHTsfyjcFNJTqtYX2CbNukD713xQtix7aq0c
         Ym7Z9uYbV/pPJRRAD5YK2yXmgcmJQY2o8etGqpHz1WE/W0LED+fzG4rZJUUDA51eSoWC
         c9ZcFazd+o9ACVuVPmTSgsJ3z4dogDT+8PRUBzI3ElS/RpT0RkmjzpbklTTPiB9+NSK3
         eBQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=BzdffRFxK2hppij1guBaf8GlKkSOwJ/exPxR7oiuGNE=;
        b=uG5iZOUtDWioH9nhCAYRjWg+vp8O4+BVA055tb4pODLKpq29UBSyMwalloAvAYyj83
         If74NwSQHfJpKoxXURr2Qli2VwMa2TnQyms7aHdVbQN5l33WofOxAgtc+L+Vr+YYjliu
         Lz8KZLTqs5rbC5FbK1TrVoLJlZ3ulBbyHTbnwyR7fJqMGyAUBzU9unKdEoYsrsF8hMAA
         CB+DpH2uqmn5iqsDFqZpRpZLYrY+l+5IJX+LAueMs9oe4/3uriejHlbxRWfvcWgzEoRV
         TazRZGEw5tcpcHpXcB9KW9/RbatC+2jJ4F6y9R5FPvadCIN5okfI0zBfOZTm5LkZcWjn
         QEzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FrsewYic;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d12si20581427ybc.366.2021.03.10.02.31.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Mar 2021 02:31:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FrsewYic;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lJw7X-0004e0-E5
	for alex.bennee@linaro.org; Wed, 10 Mar 2021 05:31:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lJw2L-0006Q0-NO
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 05:25:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lJw2G-0006UE-1T
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 05:25:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615371947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BzdffRFxK2hppij1guBaf8GlKkSOwJ/exPxR7oiuGNE=;
 b=FrsewYicsnZ7IJIAC/xmtL2OK+0htkhcOUwASP7idTMB+UI9uUClRXmsUpeKdgHf9WuIrN
 B4izl6kqxRphKOelB5n1vvCQ0Z0ZGxjiCko/S15/rx4i4vd/oGM+yMakwQd6izANK4r1s2
 vyXbWbOV9MfqsXJ9fLoDwhFqAxMb1mw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-fkHiIrIDPGGKxNH8oIbIKg-1; Wed, 10 Mar 2021 05:25:45 -0500
X-MC-Unique: fkHiIrIDPGGKxNH8oIbIKg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D49F2881D41;
 Wed, 10 Mar 2021 10:25:43 +0000 (UTC)
Received: from [10.36.112.254] (ovpn-112-254.ams2.redhat.com [10.36.112.254])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AEEED60CCB;
 Wed, 10 Mar 2021 10:25:38 +0000 (UTC)
Subject: Re: [RFC RESEND PATCH 1/4] pci: Add PCI_BUS_IOMMU property
To: Wang Xingang <wangxingang5@huawei.com>, qemu-devel@nongnu.org
References: <1614414831-39712-1-git-send-email-wangxingang5@huawei.com>
 <1614414831-39712-2-git-send-email-wangxingang5@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <e5774084-5934-48ce-d902-f3be2070ec6e@redhat.com>
Date: Wed, 10 Mar 2021 11:25:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1614414831-39712-2-git-send-email-wangxingang5@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: xieyingtai@huawei.com, peter.maydell@linaro.org, cenjiahui@huawei.com,
 mst@redhat.com, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
 imammedo@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vzf+vy8EiDFW

Hi Xingang,

On 2/27/21 9:33 AM, Wang Xingang wrote:
> From: Xingang Wang <wangxingang5@huawei.com>
> 
> This Property can be useful to check whether this bus is attached to iommu.

Strictly speaking this is not a Property (QEMU property) but a flag
> 
> Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
> Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
> ---
>  include/hw/pci/pci_bus.h | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/include/hw/pci/pci_bus.h b/include/hw/pci/pci_bus.h
> index 347440d42c..42109e8a06 100644
> --- a/include/hw/pci/pci_bus.h
> +++ b/include/hw/pci/pci_bus.h
> @@ -24,6 +24,8 @@ enum PCIBusFlags {
>      PCI_BUS_IS_ROOT                                         = 0x0001,
>      /* PCIe extended configuration space is accessible on this bus */
>      PCI_BUS_EXTENDED_CONFIG_SPACE                           = 0x0002,
> +    /* Iommu is enabled on this bus */
s/Iommu/IOMMU here and elsewhere
> +    PCI_BUS_IOMMU                                           = 0x0004,
>  };
>  
>  struct PCIBus {
> @@ -63,4 +65,15 @@ static inline bool pci_bus_allows_extended_config_space(PCIBus *bus)
>      return !!(bus->flags & PCI_BUS_EXTENDED_CONFIG_SPACE);
>  }
>  
> +static inline bool pci_bus_has_iommu(PCIBus *bus)
> +{
> +    PCIBus *root_bus = bus;
> +
> +    while (root_bus && !pci_bus_is_root(root_bus)) {
> +        root_bus = pci_get_bus(root_bus->parent_dev);
> +    }
> +
> +    return !!(root_bus->flags & PCI_BUS_IOMMU);
> +}
> +
>  #endif /* QEMU_PCI_BUS_H */
> 
Eric

