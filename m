Received: by 10.25.15.197 with SMTP id 66csp1260619lfp;
        Mon, 26 Jun 2017 00:55:06 -0700 (PDT)
X-Received: by 10.237.51.6 with SMTP id u6mr5578552qtd.181.1498463706538;
        Mon, 26 Jun 2017 00:55:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498463706; cv=none;
        d=google.com; s=arc-20160816;
        b=rZFWO32YnX18pUiKZDDOZPsRLUDj8gelZ09Feb+knK2R6wi9lu1xuMPFzBjOky+tlq
         TlrVZM3sgPxqFaLB61Gb1k9/Hn8TrD3VLN34oPIUR9R9CDxC/Jr/vkNjwQcudHid+x4l
         XacTD7dQ943kAGYKMJ9si80M5cnRdF53f1mTwCzVuRL2xhLbf7GLHPt3fYdfilckHRjr
         ZfBuARzB5S1z1+l/y/JHurl0g51hNJxHWIgYAfmjTdpK29fOVEIdr3/g/dUPFCpBFBN9
         rSjQrgQIVaEOKkRn9ViEeVq0J8e6c+WN7anqCo/xCyi1xT363TSn8G2evgtz2hwYuF1i
         01Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=WQuRykMwwEzTd7NuGBS+4mG4JFHEWZYvO3ZkGzN6uNc=;
        b=UKsW7ctmPAl/9OEjWX1vBlEkpM/tEYhQ92U2CMlZr9QHev9roap2unhiqkCE5f0CDi
         fXaaC2+QW1EkZGoYax/hvhNl25xtgIEcgrW2fnEQQdgbpQfN+tDOPBGT4mtjkpxR0Qke
         jUUE5J752ENGJGOHIl0xzcdsWQby0U+glkT1473fQMED82szvTunfc8dmQnCL2HX8Jwk
         /EFdhvFObbBFHr0oNiEuqW9vh7vVMtZZWRX5hklsCjdoASv/CgOCEKiDc7QtqieUGzEI
         r57tN9luDalYYiLZFojw5Nj8VLc21qTV/e/darPD+LLb/KjN2bVtCudQ/pn1+guaRUsG
         on3g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u18si10866570qtu.232.2017.06.26.00.55.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 26 Jun 2017 00:55:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45114 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dPOrP-0006GP-KR
	for alex.bennee@linaro.org; Mon, 26 Jun 2017 03:55:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59835)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dPOrF-0006G8-Qe
	for qemu-arm@nongnu.org; Mon, 26 Jun 2017 03:54:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dPOrC-0004hm-M3
	for qemu-arm@nongnu.org; Mon, 26 Jun 2017 03:54:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:32900)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dPOrC-0004gt-Bl; Mon, 26 Jun 2017 03:54:50 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C538F81241;
	Mon, 26 Jun 2017 07:54:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com C538F81241
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eric.auger@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com C538F81241
Received: from localhost.localdomain (ovpn-116-31.ams2.redhat.com
	[10.36.116.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 10BC47FCDA;
	Mon, 26 Jun 2017 07:54:36 +0000 (UTC)
To: Bharat Bhushan <bharat.bhushan@nxp.com>,
	"eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	"mst@redhat.com" <mst@redhat.com>, "qemu-arm@nongnu.org"
	<qemu-arm@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
	"jean-philippe.brucker@arm.com" <jean-philippe.brucker@arm.com>
References: <1496851287-9428-1-git-send-email-eric.auger@redhat.com>
	<AM5PR0401MB2545AFD256A96420ACC44CD89ACE0@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<14c83c14-1e7e-f142-77b0-fa8c873e2d41@redhat.com>
	<AM5PR0401MB2545C0E76C4BE6F82FE376D09ACE0@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<6f22079e-4b4b-6476-77be-51ec83104c0d@redhat.com>
	<AM5PR0401MB25459FDAA8C9AFA52503AAE99AC40@AM5PR0401MB2545.eurprd04.prod.outlook.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <c80977c4-1955-4e9d-3fc8-4d884562fd28@redhat.com>
Date: Mon, 26 Jun 2017 09:54:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <AM5PR0401MB25459FDAA8C9AFA52503AAE99AC40@AM5PR0401MB2545.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 26 Jun 2017 07:54:48 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v2 0/8] VIRTIO-IOMMU device
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
Cc: "kevin.tian@intel.com" <kevin.tian@intel.com>,
	"marc.zyngier@arm.com" <marc.zyngier@arm.com>,
	"tn@semihalf.com" <tn@semihalf.com>,
	"will.deacon@arm.com" <will.deacon@arm.com>,
	"drjones@redhat.com" <drjones@redhat.com>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"christoffer.dall@linaro.org" <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7nrRml16+8kZ

Hi Bharat,

On 19/06/2017 09:54, Bharat Bhushan wrote:
> Hi Eric,
> 
> I started added replay in virtio-iommu and came across how MSI interrupts with work with VFIO. 
> I understand that on intel this works differently but vsmmu will have same requirement. 
> kvm-msi-irq-route are added using the msi-address to be translated by viommu and not the final translated address.
> While currently the irqfd framework does not know about emulated iommus (virtio-iommu, vsmmuv3/vintel-iommu).
> So in my view we have following options:
> - Programming with translated address when setting up kvm-msi-irq-route
> - Route the interrupts via QEMU, which is bad from performance
> - vhost-virtio-iommu may solve the problem in long term

Sorry for the delay. With regard to the vsmmuv3/vfio integration I think
we need to use the guest physical address otherwise the MSI address will
not be recognized as an MSI doorbell.

Also the fact on ARM we map the MSI doorbell causes an assert in
vfio_get_vaddr() as the vITS doorbell is not a RAM region. We will need
to handle this specifically.

Besides I have not looked specifically at the virtio-iommu/vfio
integration yet.

Thanks

Eric
> 
> Is there any other better option I am missing?
> 
> Thanks
> -Bharat
> 
>> -----Original Message-----
>> From: Auger Eric [mailto:eric.auger@redhat.com]
>> Sent: Friday, June 09, 2017 5:24 PM
>> To: Bharat Bhushan <bharat.bhushan@nxp.com>;
>> eric.auger.pro@gmail.com; peter.maydell@linaro.org;
>> alex.williamson@redhat.com; mst@redhat.com; qemu-arm@nongnu.org;
>> qemu-devel@nongnu.org; jean-philippe.brucker@arm.com
>> Cc: wei@redhat.com; kevin.tian@intel.com; marc.zyngier@arm.com;
>> tn@semihalf.com; will.deacon@arm.com; drjones@redhat.com;
>> robin.murphy@arm.com; christoffer.dall@linaro.org
>> Subject: Re: [Qemu-devel] [RFC v2 0/8] VIRTIO-IOMMU device
>>
>> Hi Bharat,
>>
>> On 09/06/2017 13:30, Bharat Bhushan wrote:
>>> Hi Eric,
>>>
>>>> -----Original Message-----
>>>> From: Auger Eric [mailto:eric.auger@redhat.com]
>>>> Sent: Friday, June 09, 2017 12:14 PM
>>>> To: Bharat Bhushan <bharat.bhushan@nxp.com>;
>>>> eric.auger.pro@gmail.com; peter.maydell@linaro.org;
>>>> alex.williamson@redhat.com; mst@redhat.com; qemu-arm@nongnu.org;
>>>> qemu-devel@nongnu.org; jean-philippe.brucker@arm.com
>>>> Cc: will.deacon@arm.com; robin.murphy@arm.com;
>> kevin.tian@intel.com;
>>>> marc.zyngier@arm.com; christoffer.dall@linaro.org;
>>>> drjones@redhat.com; wei@redhat.com; tn@semihalf.com
>>>> Subject: Re: [RFC v2 0/8] VIRTIO-IOMMU device
>>>>
>>>> Hi Bharat,
>>>>
>>>> On 09/06/2017 08:16, Bharat Bhushan wrote:
>>>>> Hi Eric,
>>>>>
>>>>>> -----Original Message-----
>>>>>> From: Eric Auger [mailto:eric.auger@redhat.com]
>>>>>> Sent: Wednesday, June 07, 2017 9:31 PM
>>>>>> To: eric.auger.pro@gmail.com; eric.auger@redhat.com;
>>>>>> peter.maydell@linaro.org; alex.williamson@redhat.com;
>>>> mst@redhat.com;
>>>>>> qemu-arm@nongnu.org; qemu-devel@nongnu.org; jean-
>>>>>> philippe.brucker@arm.com
>>>>>> Cc: will.deacon@arm.com; robin.murphy@arm.com;
>>>> kevin.tian@intel.com;
>>>>>> marc.zyngier@arm.com; christoffer.dall@linaro.org;
>>>>>> drjones@redhat.com; wei@redhat.com; tn@semihalf.com; Bharat
>>>> Bhushan
>>>>>> <bharat.bhushan@nxp.com>
>>>>>> Subject: [RFC v2 0/8] VIRTIO-IOMMU device
>>>>>>
>>>>>> This series implements the virtio-iommu device. This is a proof of
>>>>>> concept based on the virtio-iommu specification written by
>>>>>> Jean-Philippe
>>>> Brucker [1].
>>>>>> This was tested with a guest using the virtio-iommu driver [2] and
>>>>>> exposed with a virtio-net-pci using dma ops.
>>>>>>
>>>>>> The device gets instantiated using the "-device virtio-iommu-device"
>>>>>> option. It currently works with ARM virt machine only as the
>>>>>> machine must handle the dt binding between the virtio-mmio "iommu"
>>>>>> node and the PCI host bridge node. ACPI booting is not yet supported.
>>>>>>
>>>>>> This should allow to start some benchmarking activities against
>>>>>> pure emulated IOMMU (especially ARM SMMU).
>>>>>
>>>>> I am testing this on ARM64 and see below continuous error prints:
>>>>>
>>>>> 	virtio_iommu_translate sid=8 is not known!!
>>>>> 	virtio_iommu_translate sid=8 is not known!!
>>>>> 	virtio_iommu_translate sid=8 is not known!!
>>>>> 	virtio_iommu_translate sid=8 is not known!!
>>>>> 	virtio_iommu_translate sid=8 is not known!!
>>>>> 	virtio_iommu_translate sid=8 is not known!!
>>>>> 	virtio_iommu_translate sid=8 is not known!!
>>>>> 	virtio_iommu_translate sid=8 is not known!!
>>>>> 	virtio_iommu_translate sid=8 is not known!!
>>>>> 	virtio_iommu_translate sid=8 is not known!!
>>>>>
>>>>>
>>>>> Also in guest I do not see device-tree node with virtio-iommu.
>>>> do you mean the virtio-mmio with #iommu-cells property?
>>>>
>>>> This one is created statically by virt machine. I would be surprised
>>>> if it were not there. Are you using the virt = virt2.10 machine.
>>>> Machines before do not support its instantiation.
>>>>
>>>> Please can you add a printf in hw/arm/virt.c create_virtio_mmio() at
>>>> the moment when this node is created. Also you can add a printf in
>>>> bind_virtio_iommu_device() to make sure the binding with the PCI host
>>>> bridge is added on machine init done.
>>>>
>>>> Also worth to check, CONFIG_VIRTIO_IOMMU=y on guest side.
>>>
>>> It works on my side.
>> Great.
>>
>>  The driver config was disabled and also I was using guest kernel which was
>> not have deferred-probing.
>> Yes I did not mention in my cover letter the guest I have been using is based
>> on Jean-Philippe's branch, featuring deferred IOMMU probing. I I have not
>> tried yet with an upstream guest.
>>  Now after fixing it works on my side
>>> I placed some prints to see dma-map are mapping regions in virtio-iommu,
>> it uses emulated iommu.
>>>
>>> I will continue to add VFIO support now on this and more testing !!
>>
>> OK. I will do the VFIO integration first on the vsmmuv3 device as I already
>> prepared the VFIO replay and hopefully we will sync ;-)
>>
>> Thanks
>>
>> Eric
>>>
>>> Thanks
>>> -Bharat
>>>
>>>>
>>>> Thanks
>>>>
>>>> Eric
>>>>
>>>>> I am using qemu-tree you mentioned below and iommu-driver patches
>>>> published by Jean-P.
>>>>> Qemu command line have additional ""-device virtio-iommu-device".
>>>>> What
>>>> I am missing ?
>>>>
>>>>
>>>>>
>>>>> Thanks
>>>>> -Bharat
>>>>>
>>>>>>
>>>>>> Best Regards
>>>>>>
>>>>>> Eric
>>>>>>
>>>>>> This series can be found at:
>>>>>> https://github.com/eauger/qemu/tree/virtio-iommu-rfcv2
>>>>>>
>>>>>> References:
>>>>>> [1] [RFC 0/3] virtio-iommu: a paravirtualized IOMMU, [2] [RFC PATCH
>>>>>> linux]
>>>>>> iommu: Add virtio-iommu driver [3] [RFC PATCH kvmtool 00/15] Add
>>>>>> virtio- iommu
>>>>>>
>>>>>> History:
>>>>>> v1 -> v2:
>>>>>> - fix redifinition of viommu_as typedef
>>>>>>
>>>>>> Eric Auger (8):
>>>>>>   update-linux-headers: import virtio_iommu.h
>>>>>>   linux-headers: Update for virtio-iommu
>>>>>>   virtio_iommu: add skeleton
>>>>>>   virtio-iommu: Decode the command payload
>>>>>>   virtio_iommu: Add the iommu regions
>>>>>>   virtio-iommu: Implement the translation and commands
>>>>>>   hw/arm/virt: Add 2.10 machine type
>>>>>>   hw/arm/virt: Add virtio-iommu the virt board
>>>>>>
>>>>>>  hw/arm/virt.c                                 | 116 ++++-
>>>>>>  hw/virtio/Makefile.objs                       |   1 +
>>>>>>  hw/virtio/trace-events                        |  14 +
>>>>>>  hw/virtio/virtio-iommu.c                      | 623
>>>> ++++++++++++++++++++++++++
>>>>>>  include/hw/arm/virt.h                         |   5 +
>>>>>>  include/hw/virtio/virtio-iommu.h              |  60 +++
>>>>>>  include/standard-headers/linux/virtio_ids.h   |   1 +
>>>>>>  include/standard-headers/linux/virtio_iommu.h | 142 ++++++
>>>>>>  linux-headers/linux/virtio_iommu.h            |   1 +
>>>>>>  scripts/update-linux-headers.sh               |   3 +
>>>>>>  10 files changed, 957 insertions(+), 9 deletions(-)  create mode
>>>>>> 100644 hw/virtio/virtio-iommu.c  create mode 100644
>>>>>> include/hw/virtio/virtio- iommu.h  create mode 100644
>>>>>> include/standard- headers/linux/virtio_iommu.h  create mode 100644
>>>>>> linux-headers/linux/virtio_iommu.h
>>>>>>
>>>>>> --
>>>>>> 2.5.5
>>>>>
>>>
> 
