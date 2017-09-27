Received: by 10.223.172.38 with SMTP id v35csp4465464wrc;
        Wed, 27 Sep 2017 01:55:41 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBWg1nnCZYDpyMjZLvC51yzvVEfoicnR04sAXbmiruwWVVEcIOXnvkDCu8q5uwSbjBBUrlb
X-Received: by 10.237.63.15 with SMTP id p15mr728799qtf.113.1506502541690;
        Wed, 27 Sep 2017 01:55:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506502541; cv=none;
        d=google.com; s=arc-20160816;
        b=FIm58YektZDV1EvpflBdriRCl8nXnwujeZTHV+0aVq+EZzxe9PwK/ylo93RBsTsu3S
         Sq1kWGe8nkaF98SqUuibwnXUNNtjEehAItLmXZDjy4D1zD4N9evQ+5wvYVF0Wbo/3blM
         X4DP7XI7br/QYeIcHjXUxk8zo+NOSar50ZIF9ISGwXY8ehYvn6UJFouL2PIW/BXItIsE
         JJv9yTf9YTR2DR+Zc05ZoBVAiG1Vt9s4g0wdDenJSAPURepBXyTn2x6CSnlg9tV3iFaL
         1JwSqOe5UknQQ1Px/wUBNZOGB5ubjn2GNwbH6moB/OhFih0R28YnlDq9IKGB3Wb4efEB
         ZDMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dmarc-filter
         :arc-authentication-results;
        bh=4nCsHT+MjE01xG8bDtoDXXRNBB9VYCx9lTzUK3su+dQ=;
        b=oF/M0jkv+GO01LEH5TvahO1eZQo9Bf/QHlen0yS1zllQiWzz5LIW7+d5Oiduorq+ew
         7yAA5ijvyIsrJx/mu9Ns+WvR/bU4eRP+nS4MAmjLx3mokupcmqfBmkxctZhff+j4LxnX
         oIrvwAdjZji/RQ4CXJGFiX5Mt9Q6XaoPxFGqx2/J+5cpRWwYGgDb2pQ9CRUn9KQDUrZ2
         jvTIPbAuq48j5J5td+AkYkDmP2ULFI9cIXJ6szDRFHKxljvm2wzc6AhnbaWUGgGeapog
         7MSu/eoVtKyaf5W859FiKgejh70Y5hRLdYJy3fikaqp+j6PN0mMY+2GswhMEuBYijW/K
         S0sQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r81si1377105qka.300.2017.09.27.01.55.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Sep 2017 01:55:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53463 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dx883-0001N8-GB
	for alex.bennee@linaro.org; Wed, 27 Sep 2017 04:55:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46738)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dx87s-0001Lq-R4
	for qemu-arm@nongnu.org; Wed, 27 Sep 2017 04:55:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dx87l-0001V7-My
	for qemu-arm@nongnu.org; Wed, 27 Sep 2017 04:55:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58580)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dx87l-0001UK-Ek; Wed, 27 Sep 2017 04:55:21 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C5E3081E02;
	Wed, 27 Sep 2017 08:55:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com C5E3081E02
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain (ovpn-116-163.ams2.redhat.com
	[10.36.116.163])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 85C9D7EBEF;
	Wed, 27 Sep 2017 08:55:09 +0000 (UTC)
To: Bharat Bhushan <bharat.bhushan@nxp.com>,
	Linu Cherian <linuc.decode@gmail.com>
References: <1506494000-31982-1-git-send-email-Bharat.Bhushan@nxp.com>
	<20170927074109.GA31587@virtx40>
	<AM5PR0401MB25450ACC804B20D93C4F2D9D9A780@AM5PR0401MB2545.eurprd04.prod.outlook.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <9700cf30-65ed-9c55-c1b9-14bb8deb669f@redhat.com>
Date: Wed, 27 Sep 2017 10:55:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <AM5PR0401MB25450ACC804B20D93C4F2D9D9A780@AM5PR0401MB2545.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Wed, 27 Sep 2017 08:55:19 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v4 0/5] virtio-iommu: VFIO integration
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"kevin.tian@intel.com" <kevin.tian@intel.com>,
	"drjones@redhat.com" <drjones@redhat.com>,
	"mst@redhat.com" <mst@redhat.com>,
	"marc.zyngier@arm.com" <marc.zyngier@arm.com>,
	"tn@semihalf.com" <tn@semihalf.com>,
	"will.deacon@arm.com" <will.deacon@arm.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"bharatb.yadav@gmail.com" <bharatb.yadav@gmail.com>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"christoffer.dall@linaro.org" <christoffer.dall@linaro.org>,
	"eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MOx+sBCNFP0m

Hi Linu,

On 27/09/2017 10:30, Bharat Bhushan wrote:
> Hi,
> 
>> -----Original Message-----
>> From: Linu Cherian [mailto:linuc.decode@gmail.com]
>> Sent: Wednesday, September 27, 2017 1:11 PM
>> To: Bharat Bhushan <bharat.bhushan@nxp.com>
>> Cc: eric.auger@redhat.com; eric.auger.pro@gmail.com;
>> peter.maydell@linaro.org; alex.williamson@redhat.com; mst@redhat.com;
>> qemu-arm@nongnu.org; qemu-devel@nongnu.org; kevin.tian@intel.com;
>> marc.zyngier@arm.com; tn@semihalf.com; will.deacon@arm.com;
>> drjones@redhat.com; robin.murphy@arm.com; christoffer.dall@linaro.org;
>> bharatb.yadav@gmail.com
>> Subject: Re: [Qemu-arm] [PATCH v4 0/5] virtio-iommu: VFIO integration
>>
>> Hi,
>>
>> On Wed Sep 27, 2017 at 12:03:15PM +0530, Bharat Bhushan wrote:
>>> This patch series integrates VFIO/VHOST with virtio-iommu.
>>>
>>> This version is mainly about rebasing on v4 version on virtio-iommu
>>> device framework from Eric Augur and addresing review comments.
>>>
>>> This patch series allows PCI pass-through using virtio-iommu.
>>>
>>> This series is based on:
>>>  - virtio-iommu kernel driver by Jean-Philippe Brucker
>>>     [1] [RFC] virtio-iommu version 0.4
>>>     git://linux-arm.org/virtio-iommu.git branch viommu/v0.4

Just to make sure, do you use the v0.4 virtio-iommu driver from above
branch?

Thanks

Eric
>>>
>>>  - virtio-iommu device emulation by Eric Augur.
>>>    [RFC v4 00/16] VIRTIO-IOMMU device
>>>    https://github.com/eauger/qemu/tree/v2.10.0-virtio-iommu-v4
>>>
>>> Changes are available at : https://github.com/bharaty/qemu.git
>>> virtio-iommu-vfio-integration-v4
>>>
>>
>> # With the above sources, was trying to test the vfio-pci device assigned to
>>   guest using Qemu.
>> # Both guest and host kernels are configured with 4k as page size.
>> # releavant qemu command snippet,
>>   -device virtio-iommu-device -device virtio-blk-device,drive=hd0 \
>>   -net none -device vfio-pci,host=xxx
>>
>>
>> On guest booting, observed mutliple messages as below,
>>
>> qemu-system-aarch64: iommu has granularity incompatible with target AS
>>
>> # On adding necessary prints, 0x5000 is len, 0x4fff is address mask
>>   and the code expects the address mask to be 0xfff.
> 
> I have not seen these errors, I am also using 4K page-size on both host and guest. Can you share compete qemu command and log. 
> 
> Thanks
> -Bharat
> 
>>
>> if (len & iotlb->addr_mask) {
>>         error_report
>>
>> # vfio_dma_map is failing due to this error.
>>
>> Any pointers ?
>>
>>
>>> v3->v4:
>>>  - Rebase to v4 version from Eric
>>>  - Fixes from Eric with DPDK in VM
>>>  - Logical division in multiple patches
>>>
>>> v2->v3:
>>>  - This series is based on "[RFC v3 0/8] VIRTIO-IOMMU device"
>>>    Which is based on top of v2.10-rc0 that
>>>  - Fixed issue with two PCI devices
>>>  - Addressed review comments
>>>
>>> v1->v2:
>>>   - Added trace events
>>>   - removed vSMMU3 link in patch description
>>>
>>> Bharat Bhushan (5):
>>>   target/arm/kvm: Translate the MSI doorbell in
>> kvm_arch_fixup_msi_route
>>>   virtio-iommu: Add iommu notifier for map/unmap
>>>   virtio-iommu: Call iommu notifier for attach/detach
>>>   virtio-iommu: add iommu replay
>>>   virtio-iommu: add iommu notifier memory-region
>>>
>>>  hw/virtio/trace-events           |   5 ++
>>>  hw/virtio/virtio-iommu.c         | 181
>> ++++++++++++++++++++++++++++++++++++++-
>>>  include/hw/virtio/virtio-iommu.h |   6 ++
>>>  target/arm/kvm.c                 |  27 ++++++
>>>  target/arm/trace-events          |   3 +
>>>  5 files changed, 219 insertions(+), 3 deletions(-)
>>>
>>> --
>>> 1.9.3
>>>
>>>
>>
>> --
>> Linu cherian
