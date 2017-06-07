Received: by 10.25.0.23 with SMTP id 23csp1989986lfa;
        Wed, 7 Jun 2017 02:17:40 -0700 (PDT)
X-Received: by 10.55.217.156 with SMTP id q28mr38059347qkl.177.1496827060434;
        Wed, 07 Jun 2017 02:17:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496827060; cv=none;
        d=google.com; s=arc-20160816;
        b=ftHpfEz30psj7Ea7C1Wi7j2uFMmXzQNinNRitTJVZBHRG1wZtFev0IkNE8kOgOt65B
         rWqfL/svvgrlrRC+ysme22QoVm2qxgREqZQkA+hDgKwig2yxbxBPbZ7ptrv4aJVlWZ0J
         lavu7IzrIGZX8/iJwOgIacfWG5krkn1e8xLR5tOLYuQ5xNT5qXKBjXtIj1l7UQ9zGrnB
         Xt1T0OgaSZ7buZ4maFJHhvHNbhF3gWGtcM4d5YjXYKgVKvCy/Tb4Uss5gNfE/D7aXsde
         vCzRxfJxfmUOVfwVqugUVSdiKOz6hAtrJ2I55t0BZnwvM5IGlAdnzIJPhgiyG9SpkP9O
         r/0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-filter
         :dmarc-filter:arc-authentication-results;
        bh=oN17TM9e8jAiXMvGxV2W9BRo+GVFc6fSJ4Luc/G51Mc=;
        b=pqxisrLJlW7RoPpHArnVupb7+AR74LoVdy9TjfGhTL4PLxHXemNqomsGk4Ura4JSSZ
         XdIk5w7i/fwAH7utvAF9d7ALf/K470Q9BIQBTZvOAwxiSu3GefNp6vArDWYc27+lgsNy
         YE8RMAbqL+klVfHPvjo2PIJ6T2VFwYTOmdlwxRWSxP58gTi6qKUTnLP/AnYlD8LyN2fb
         oTe2VDplX6HBSPFuEQNOEXop5BQOnxClCosnGCKf+WIbelHx4L42Nde5iSe4FO/OAoFR
         C5ndDqnRNl8X2G7jNbjlWrG8YbfBA1AryKqGn7Lqorsh7z9tfH1UGSxysCwccSooLq4h
         0wFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g35si1346712qtg.213.2017.06.07.02.17.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Jun 2017 02:17:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42190 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dIX5t-0005tb-NN
	for alex.bennee@linaro.org; Wed, 07 Jun 2017 05:17:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50808)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jasowang@redhat.com>) id 1dIX5p-0005rm-9p
	for qemu-arm@nongnu.org; Wed, 07 Jun 2017 05:17:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jasowang@redhat.com>) id 1dIX5m-0006Uv-2t
	for qemu-arm@nongnu.org; Wed, 07 Jun 2017 05:17:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54292)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jasowang@redhat.com>)
	id 1dIX5l-0006U7-Q3; Wed, 07 Jun 2017 05:17:29 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7848C91FD5;
	Wed,  7 Jun 2017 09:17:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 7848C91FD5
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=jasowang@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 7848C91FD5
Received: from [10.72.12.111] (ovpn-12-111.pek2.redhat.com [10.72.12.111])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4ECC317A6B;
	Wed,  7 Jun 2017 09:17:16 +0000 (UTC)
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
	peter.maydell@linaro.org, alex.williamson@redhat.com, mst@redhat.com,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
References: <1496824556-1883-1-git-send-email-eric.auger@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <03f4d3b6-a678-56b8-4320-ac002dfeeb8d@redhat.com>
Date: Wed, 7 Jun 2017 17:17:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <1496824556-1883-1-git-send-email-eric.auger@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Wed, 07 Jun 2017 09:17:28 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC 0/8] VIRTIO-IOMMU device
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: kevin.tian@intel.com, marc.zyngier@arm.com, tn@semihalf.com,
	will.deacon@arm.com, drjones@redhat.com, bharat.bhushan@nxp.com,
	christoffer.dall@linaro.org, robin.murphy@arm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YbaMUy7o6iP5



On 2017=E5=B9=B406=E6=9C=8807=E6=97=A5 16:35, Eric Auger wrote:
> This series implements the virtio-iommu device. This is a proof
> of concept based on the virtio-iommu specification written by
> Jean-Philippe Brucker [1]. This was tested with a guest using
> the virtio-iommu driver [2] and exposed with a virtio-net-pci
> using dma ops.
>
> The device gets instantiated using the "-device virtio-iommu-device"
> option. It currently works with ARM virt machine only as the machine
> must handle the dt binding between the virtio-mmio "iommu" node and
> the PCI host bridge node. ACPI booting is not yet supported.
>
> This should allow to start some benchmarking activities against
> pure emulated IOMMU (especially ARM SMMU).

Yes, it would be also interesting to compare it with intel IOMMU.=20
Actually the core function is similar to the subset of intel one with CM=20
enabled. Since each map and unmap requires a command, it would be very=20
slow for dynamic mappings. I wonder whether or not we can do any=20
optimization on this.

Thanks

>
> Best Regards
>
> Eric
>
> This series can be found at:
> https://github.com/eauger/qemu/tree/virtio-iommu-rfcv1
>
> References:
> [1] [RFC 0/3] virtio-iommu: a paravirtualized IOMMU,
> [2] [RFC PATCH linux] iommu: Add virtio-iommu driver
> [3] [RFC PATCH kvmtool 00/15] Add virtio-iommu
>
> Eric Auger (8):
>    update-linux-headers: import virtio_iommu.h
>    linux-headers: Update for virtio-iommu
>    virtio_iommu: add skeleton
>    virtio-iommu: Decode the command payload
>    virtio_iommu: Add the iommu regions
>    virtio-iommu: Implement the translation and commands
>    hw/arm/virt: Add 2.10 machine type
>    hw/arm/virt: Add virtio-iommu the virt board
>
>   hw/arm/virt.c                                 | 116 ++++-
>   hw/virtio/Makefile.objs                       |   1 +
>   hw/virtio/trace-events                        |  14 +
>   hw/virtio/virtio-iommu.c                      | 623 +++++++++++++++++=
+++++++++
>   include/hw/arm/virt.h                         |   5 +
>   include/hw/virtio/virtio-iommu.h              |  60 +++
>   include/standard-headers/linux/virtio_ids.h   |   1 +
>   include/standard-headers/linux/virtio_iommu.h | 142 ++++++
>   linux-headers/linux/virtio_iommu.h            |   1 +
>   scripts/update-linux-headers.sh               |   3 +
>   10 files changed, 957 insertions(+), 9 deletions(-)
>   create mode 100644 hw/virtio/virtio-iommu.c
>   create mode 100644 include/hw/virtio/virtio-iommu.h
>   create mode 100644 include/standard-headers/linux/virtio_iommu.h
>   create mode 100644 linux-headers/linux/virtio_iommu.h
>

