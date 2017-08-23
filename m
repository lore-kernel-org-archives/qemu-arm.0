Received: by 10.223.188.70 with SMTP id a6csp941085wrh;
        Wed, 23 Aug 2017 09:45:15 -0700 (PDT)
X-Received: by 10.233.239.11 with SMTP id d11mr4260976qkg.266.1503506715663;
        Wed, 23 Aug 2017 09:45:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503506715; cv=none;
        d=google.com; s=arc-20160816;
        b=xja2Wn5Ymmc7IFaBdzs1kjXpK0LP8HntIY8jj8HTuE79IhV7HGg9VSkWwsSsv8FvzX
         WSr+sDOy7SKOVc7CdZqUGqlSvhP2Kj7Hhble6KcYrxo5Iz0LsphcAT3zkhLd67PaO93O
         5hOqvJm5SGTm434N8PzENCS65sQnflEXh33xpmnA6VSqAO6OmAHZmfBoTBdZDZ6n6d++
         uVcP27eM3MHBdUF5uGtX56w+v3lOrvSCbh4cqSsL5vhJiemb+8RjWqZTvH9GsyL8rns2
         093azcWFesO0qc9RbvZ5tBO3ik3cECmxAnS/8XSFXZNi/kzxnOjesOonGJR5mobvDHEs
         EdOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dmarc-filter
         :arc-authentication-results;
        bh=cjfAnvYwK4aYJtMOkcY0xuJxynDxpaCufxXq6koSlV0=;
        b=w2tzuVDlPqYJrWJR1DkV5BKR/F0FT56T3PXxfaF1of0GrbWjoIAdnQbI/JNRQF13BX
         2HvHW+O4PhpRoJFb4XQskrAFGGtVnxlrKCNK5jPEb32zP0SigCrZoVtdzgs4wFoc1aOS
         GzKAGQtFmO/Tv96DvYCcW1SbGcxP83+HUll9la52CX0zzpNejPutC6A1JdQJx2mpeAHO
         sGyUFIrzlQ2Nkm1Zpx0X+s4BUGm43yUDmsgh/iCGsxvmUojNj3BV5mhh2fWQ1WkQo23+
         L7h60P7f9pzae2IAIsx6UsPSc69+4xx5en34g2aNeiGtBoLot4tp1w4sfnTjUS4Gb9j9
         McdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r30si1792016qtk.286.2017.08.23.09.45.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Aug 2017 09:45:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44778 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dkYmH-0002sI-2q
	for alex.bennee@linaro.org; Wed, 23 Aug 2017 12:45:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50495)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dkYjN-00089x-Tw
	for qemu-arm@nongnu.org; Wed, 23 Aug 2017 12:42:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dkYjM-0000zn-VU
	for qemu-arm@nongnu.org; Wed, 23 Aug 2017 12:42:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52868)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dkYjM-0000zZ-Oa; Wed, 23 Aug 2017 12:42:12 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4FD816197E;
	Wed, 23 Aug 2017 16:42:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 4FD816197E
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain (ovpn-116-92.ams2.redhat.com
	[10.36.116.92])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F006493BB6;
	Wed, 23 Aug 2017 16:41:36 +0000 (UTC)
To: Bharat Bhushan <Bharat.Bhushan@nxp.com>, eric.auger.pro@gmail.com,
	peter.maydell@linaro.org, alex.williamson@redhat.com, mst@redhat.com,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <1503312534-6642-1-git-send-email-Bharat.Bhushan@nxp.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <2e23327a-3e5e-abaf-387f-d23462d8aba7@redhat.com>
Date: Wed, 23 Aug 2017 18:41:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1503312534-6642-1-git-send-email-Bharat.Bhushan@nxp.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 23 Aug 2017 16:42:11 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v3 0/2] virtio-iommu: VFIO integration
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
	will.deacon@arm.com, drjones@redhat.com, robin.murphy@arm.com,
	christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tDSRr6vxkV3r

Hi Bharat,

On 21/08/2017 12:48, Bharat Bhushan wrote:
> This V3 version is mainly about rebasing on v3 version on Virtio-iommu device
> framework from Eric Augur and addresing review comments.
s/Augur/Auger ;-)
> 
> This patch series allows PCI pass-through using virtio-iommu.
>   
> This series is based on:
>  - virtio-iommu specification written by Jean-Philippe Brucker
>    [RFC 0/3] virtio-iommu: a paravirtualized IOMMU,
>  
>  - virtio-iommu driver by Jean-Philippe Brucker
>    [RFC PATCH linux] iommu: Add virtio-iommu driver
>  
>  - virtio-iommu device emulation by Eric Augur.
>    [RFC v3 0/8] VIRTIO-IOMMU device
> 
> PCI device pass-through and virtio-net-pci is tested with these changes using dma-ops

I confirm it works fine now with 2 assigned VFs.

However at the moment DPDK testpmd using those 2 VFs does not work for me:
1: [/home/augere/UPSTREAM/dpdk/install/bin/testpmd(rte_dump_stack+0x24)
[0x4a8a78]]

I haven't investigated yet...

Thanks

Eric
> 
> This patch series does not implement RESV_MEM changes proposal by Jean-Philippe "https://lists.gnu.org/archive/html/qemu-devel/2017-07/msg01796.html"
> 
> v2->v3:
>  - This series is based on "[RFC v3 0/8] VIRTIO-IOMMU device"
>    Which is based on top of v2.10-rc0 that 
>  - Fixed issue with two PCI devices
>  - Addressed review comments
> 
> v1->v2:
>   - Added trace events
>   - removed vSMMU3 link in patch description
> 
> Bharat Bhushan (2):
>   target/arm/kvm: Translate the MSI doorbell in kvm_arch_fixup_msi_route
>   virtio-iommu: vfio integration with virtio-iommu
> 
>  hw/virtio/trace-events           |   5 ++
>  hw/virtio/virtio-iommu.c         | 163 +++++++++++++++++++++++++++++++++++++++
>  include/hw/virtio/virtio-iommu.h |   6 ++
>  target/arm/kvm.c                 |  27 +++++++
>  target/arm/trace-events          |   3 +
>  5 files changed, 204 insertions(+)
> 
