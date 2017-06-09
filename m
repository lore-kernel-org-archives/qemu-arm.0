Received: by 10.25.0.23 with SMTP id 23csp3023369lfa;
        Fri, 9 Jun 2017 05:15:38 -0700 (PDT)
X-Received: by 10.200.2.79 with SMTP id o15mr4059068qtg.26.1497010538817;
        Fri, 09 Jun 2017 05:15:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1497010538; cv=none;
        d=google.com; s=arc-20160816;
        b=KN1LToh0y+lySBEY8KiBmOTc1QNJ+IpsQxLvsgDpWu20XEzII7rQ235T02fVPsAoEu
         I3WtvP3ckru69GByijf7Qd44hlCId86ZsYez5TWyGuc8MmaUVOnzHjLqNaeCIOaiGOWf
         v+WONswr4VpaX1b9c8kBUGN8aMLXv0izsiMRCy6oRgLkytE4XnAKlZ8GK5OKQDNE6ebL
         FHEbYvTorFl9D8GcM+kGCkEX5JzYpeIVt0V9t4hl4zKPzip48vxk9aBUavvPjc+2a103
         BlesT+L9cA4WBV/FDRYAXR02cmw7RgWmre8EkHph3msxEVewSFioaEGvZmTvKXS+tPoE
         7t9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=ACf08NtXu48+9QQULPxZmT4Dl0i2y+XBpbwB2Zp/f8A=;
        b=EYIDTYcaHAvTXNBzr7YfxE8FvMfOA9DeIXqrrRoIZmt4l8RyuFG/FljaAIjqpCaIZ/
         WYItDfrY9B55XOtYcG15GpeLGdHkUooMrGcG8oyfdvEv2+rQRg72aSK5+wnjHeR60XRA
         H6TgCaEU6MB2SFX+1oZ2lCpCthHPrVhBzuHkvCw6Oz5CkYdEGXp6u4zLdw30FMsuV7Sm
         rjcaIzDfd/TPvFxkB/mhS9MdsBUxr5+GMr/GyD5tzLFm0viPgsLrU8YzK+fN0ciH6V+I
         Jmu0jQt/k623+dOnsy3F+xLoPfP/scWL9L/hhfIikvCIEXxDJD4DGpyGrmX2nQhleQOI
         +s7A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e19si832529qkj.23.2017.06.09.05.15.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Jun 2017 05:15:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54401 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dJIpE-0003Jq-7Y
	for alex.bennee@linaro.org; Fri, 09 Jun 2017 08:15:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44093)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dJIp8-0003Ja-UE
	for qemu-arm@nongnu.org; Fri, 09 Jun 2017 08:15:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dJIp5-0003HE-8m
	for qemu-arm@nongnu.org; Fri, 09 Jun 2017 08:15:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48988)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dJIp5-0003H8-0E; Fri, 09 Jun 2017 08:15:27 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9C21819CBE9;
	Fri,  9 Jun 2017 12:15:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 9C21819CBE9
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eric.auger@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 9C21819CBE9
Received: from localhost.localdomain (ovpn-116-222.ams2.redhat.com
	[10.36.116.222])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 813E37F775;
	Fri,  9 Jun 2017 12:15:11 +0000 (UTC)
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
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <445b60fe-a0da-ee93-fab3-be88fe269846@redhat.com>
Date: Fri, 9 Jun 2017 14:15:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <AM5PR0401MB2545C0E76C4BE6F82FE376D09ACE0@AM5PR0401MB2545.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 09 Jun 2017 12:15:26 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [RFC v2 0/8] VIRTIO-IOMMU device
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
	"drjones@redhat.com" <drjones@redhat.com>, Peter Xu <peterx@redhat.com>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"christoffer.dall@linaro.org" <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kvrUehhB4CBP

Hi,

On 09/06/2017 13:30, Bharat Bhushan wrote:
> Hi Eric,
> 
>> -----Original Message-----
>> From: Auger Eric [mailto:eric.auger@redhat.com]
>> Sent: Friday, June 09, 2017 12:14 PM
>> To: Bharat Bhushan <bharat.bhushan@nxp.com>;
>> eric.auger.pro@gmail.com; peter.maydell@linaro.org;
>> alex.williamson@redhat.com; mst@redhat.com; qemu-arm@nongnu.org;
>> qemu-devel@nongnu.org; jean-philippe.brucker@arm.com
>> Cc: will.deacon@arm.com; robin.murphy@arm.com; kevin.tian@intel.com;
>> marc.zyngier@arm.com; christoffer.dall@linaro.org; drjones@redhat.com;
>> wei@redhat.com; tn@semihalf.com
>> Subject: Re: [RFC v2 0/8] VIRTIO-IOMMU device
>>
>> Hi Bharat,
>>
>> On 09/06/2017 08:16, Bharat Bhushan wrote:
>>> Hi Eric,
>>>
>>>> -----Original Message-----
>>>> From: Eric Auger [mailto:eric.auger@redhat.com]
>>>> Sent: Wednesday, June 07, 2017 9:31 PM
>>>> To: eric.auger.pro@gmail.com; eric.auger@redhat.com;
>>>> peter.maydell@linaro.org; alex.williamson@redhat.com;
>> mst@redhat.com;
>>>> qemu-arm@nongnu.org; qemu-devel@nongnu.org; jean-
>>>> philippe.brucker@arm.com
>>>> Cc: will.deacon@arm.com; robin.murphy@arm.com;
>> kevin.tian@intel.com;
>>>> marc.zyngier@arm.com; christoffer.dall@linaro.org;
>>>> drjones@redhat.com; wei@redhat.com; tn@semihalf.com; Bharat
>> Bhushan
>>>> <bharat.bhushan@nxp.com>
>>>> Subject: [RFC v2 0/8] VIRTIO-IOMMU device
>>>>
>>>> This series implements the virtio-iommu device. This is a proof of
>>>> concept based on the virtio-iommu specification written by Jean-Philippe
>> Brucker [1].
>>>> This was tested with a guest using the virtio-iommu driver [2] and
>>>> exposed with a virtio-net-pci using dma ops.
>>>>
>>>> The device gets instantiated using the "-device virtio-iommu-device"
>>>> option. It currently works with ARM virt machine only as the machine
>>>> must handle the dt binding between the virtio-mmio "iommu" node and
>>>> the PCI host bridge node. ACPI booting is not yet supported.

For those who may play with the device, this was tested with a
virtio-net-pci device using the following command:

-device
virtio-net-pci,netdev=tap0,mac=<MAC>,iommu_platform,disable-modern=off,disable-legacy=on
\

I tried to run the guest using a virtio-blk-pci device using
-device
virtio-blk-pci,scsi=off,drive=<>,iommu_platform=off,disable-modern=off,disable-legacy=on,werror=stop,rerror=stop
\

and the guest does *not* boot whereas it does without any iommu.

However I am not sure the issue is related to the actual virtual iommu
device as I have the exact same issue with vsmmuv3 emulated device (This
was originally reported by Tomasz). So the issue may come from the
infrastructure around. To be further investigated ...

Thanks

Eric

>>>>
>>>> This should allow to start some benchmarking activities against pure
>>>> emulated IOMMU (especially ARM SMMU).
>>>
>>> I am testing this on ARM64 and see below continuous error prints:
>>>
>>> 	virtio_iommu_translate sid=8 is not known!!
>>> 	virtio_iommu_translate sid=8 is not known!!
>>> 	virtio_iommu_translate sid=8 is not known!!
>>> 	virtio_iommu_translate sid=8 is not known!!
>>> 	virtio_iommu_translate sid=8 is not known!!
>>> 	virtio_iommu_translate sid=8 is not known!!
>>> 	virtio_iommu_translate sid=8 is not known!!
>>> 	virtio_iommu_translate sid=8 is not known!!
>>> 	virtio_iommu_translate sid=8 is not known!!
>>> 	virtio_iommu_translate sid=8 is not known!!
>>>
>>>
>>> Also in guest I do not see device-tree node with virtio-iommu.
>> do you mean the virtio-mmio with #iommu-cells property?
>>
>> This one is created statically by virt machine. I would be surprised if it were
>> not there. Are you using the virt = virt2.10 machine. Machines before do not
>> support its instantiation.
>>
>> Please can you add a printf in hw/arm/virt.c create_virtio_mmio() at the
>> moment when this node is created. Also you can add a printf in
>> bind_virtio_iommu_device() to make sure the binding with the PCI host
>> bridge is added on machine init done.
>>
>> Also worth to check, CONFIG_VIRTIO_IOMMU=y on guest side.
> 
> It works on my side. The driver config was disabled and also I was using guest kernel which was not have deferred-probing. Now after fixing it works on my side
> I placed some prints to see dma-map are mapping regions in virtio-iommu, it uses emulated iommu.
> 
> I will continue to add VFIO support now on this and more testing !!
> 
> Thanks
> -Bharat
> 
>>
>> Thanks
>>
>> Eric
>>
>>> I am using qemu-tree you mentioned below and iommu-driver patches
>> published by Jean-P.
>>> Qemu command line have additional ""-device virtio-iommu-device". What
>> I am missing ?
>>
>>
>>>
>>> Thanks
>>> -Bharat
>>>
>>>>
>>>> Best Regards
>>>>
>>>> Eric
>>>>
>>>> This series can be found at:
>>>> https://github.com/eauger/qemu/tree/virtio-iommu-rfcv2
>>>>
>>>> References:
>>>> [1] [RFC 0/3] virtio-iommu: a paravirtualized IOMMU, [2] [RFC PATCH
>>>> linux]
>>>> iommu: Add virtio-iommu driver [3] [RFC PATCH kvmtool 00/15] Add
>>>> virtio- iommu
>>>>
>>>> History:
>>>> v1 -> v2:
>>>> - fix redifinition of viommu_as typedef
>>>>
>>>> Eric Auger (8):
>>>>   update-linux-headers: import virtio_iommu.h
>>>>   linux-headers: Update for virtio-iommu
>>>>   virtio_iommu: add skeleton
>>>>   virtio-iommu: Decode the command payload
>>>>   virtio_iommu: Add the iommu regions
>>>>   virtio-iommu: Implement the translation and commands
>>>>   hw/arm/virt: Add 2.10 machine type
>>>>   hw/arm/virt: Add virtio-iommu the virt board
>>>>
>>>>  hw/arm/virt.c                                 | 116 ++++-
>>>>  hw/virtio/Makefile.objs                       |   1 +
>>>>  hw/virtio/trace-events                        |  14 +
>>>>  hw/virtio/virtio-iommu.c                      | 623
>> ++++++++++++++++++++++++++
>>>>  include/hw/arm/virt.h                         |   5 +
>>>>  include/hw/virtio/virtio-iommu.h              |  60 +++
>>>>  include/standard-headers/linux/virtio_ids.h   |   1 +
>>>>  include/standard-headers/linux/virtio_iommu.h | 142 ++++++
>>>>  linux-headers/linux/virtio_iommu.h            |   1 +
>>>>  scripts/update-linux-headers.sh               |   3 +
>>>>  10 files changed, 957 insertions(+), 9 deletions(-)  create mode
>>>> 100644 hw/virtio/virtio-iommu.c  create mode 100644
>>>> include/hw/virtio/virtio- iommu.h  create mode 100644
>>>> include/standard- headers/linux/virtio_iommu.h  create mode 100644
>>>> linux-headers/linux/virtio_iommu.h
>>>>
>>>> --
>>>> 2.5.5
>>>
