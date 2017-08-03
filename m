Received: by 10.25.221.202 with SMTP id w71csp482577lfi;
        Thu, 3 Aug 2017 04:15:49 -0700 (PDT)
X-Received: by 10.200.48.49 with SMTP id f46mr1739385qte.88.1501758949734;
        Thu, 03 Aug 2017 04:15:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501758949; cv=none;
        d=google.com; s=arc-20160816;
        b=OYnrOAMrS4JtKCZNMioRo8dG6JVsHVy4UBd//YixLtNQqM2rjq0vSMlqrSmvrirBKa
         fZFN7cE6OmNhHOj977HPPDkEOfOIS3/+oxvzD83T9Wzs4SYs2XkfK6tuGmdtpFy87eBG
         EC2mE6zqPuwo7w7xeqDgznt3LwagEtstzcfTdAdmLq+8H39Cd+2jwPeIt4RxryRgPYfZ
         mF4kNmRwwhqbnoltRP5MNxvXlKASPGt42LiV3dT6/NCTwMdFbZ9eH+HbhPGEYQfG4c0c
         bXgpVKXYP/sc9EzgolJ2K77yPOmlSeVg9VqZxeBqEWT9viINYDqOiTs/Kvtq4+t6Rlb9
         haPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dmarc-filter
         :arc-authentication-results;
        bh=aWa/kEbaOL4PH0QmhOl9Y/wjgWkXdH3L8OyFCwaMujE=;
        b=xYCYlTLtl3SBwnFss4hF++I8UnUczvydKzjabdtCCBulPpmeaUwMVnovYNOOxRDsxd
         IgjZbzv989/1H414i6O2yktHRwOwGld4FoJJrwz/YIgjjIyAHkisM5kcm1g6zCrJG7EX
         nvmMaaHvvC5iQ7P+shpcjDsq90DY7HreAc7PtftLRObcPqU26ccucfXgO1ITcmJ/sR1z
         4mc4dKifiI0pjWE287ETOLArgm7f6fy+b0KXgugSji9JCC2Mxd8gwQ5Hv7YQViN+G9mU
         o3nOhmVuaN1OHWnW1mUo1eebIbKTwWyDj8LRYnnD3r/9Jf/zVIAReNSwnslyXOFwr2Gw
         mmSg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g8si31475186qtb.221.2017.08.03.04.15.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Aug 2017 04:15:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59502 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ddE6V-00058O-1V
	for alex.bennee@linaro.org; Thu, 03 Aug 2017 07:15:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50989)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ddE6Q-000580-OD
	for qemu-arm@nongnu.org; Thu, 03 Aug 2017 07:15:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ddE6M-0008EC-Qq
	for qemu-arm@nongnu.org; Thu, 03 Aug 2017 07:15:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55746)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1ddE6M-0008Ax-IL; Thu, 03 Aug 2017 07:15:38 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 391EAC058ECE;
	Thu,  3 Aug 2017 11:15:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 391EAC058ECE
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain (ovpn-116-181.ams2.redhat.com
	[10.36.116.181])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EDB787D53E;
	Thu,  3 Aug 2017 11:15:11 +0000 (UTC)
To: Tomasz Nowicki <tnowicki@caviumnetworks.com>, eric.auger.pro@gmail.com,
	peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	alex.williamson@redhat.com, prem.mallappa@gmail.com
References: <1499633493-19865-1-git-send-email-eric.auger@redhat.com>
	<a8fd7038-a840-8667-0db2-5765624903d3@caviumnetworks.com>
	<50d1685e-bfa6-02ac-2650-37637745431a@redhat.com>
	<35467208-4e8f-b944-c247-c049c2301878@caviumnetworks.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <8f2b1045-e7f5-a2e1-8a14-54c3d1054e0b@redhat.com>
Date: Thu, 3 Aug 2017 13:15:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <35467208-4e8f-b944-c247-c049c2301878@caviumnetworks.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Thu, 03 Aug 2017 11:15:35 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v5 0/8] ARM SMMUv3 Emulation
 Support
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
Cc: mohun106@gmail.com, drjones@redhat.com, tcain@qti.qualcomm.com,
	Radha.Chintakuntla@cavium.com, Sunil.Goutham@cavium.com,
	mst@redhat.com, jean-philippe.brucker@arm.com,
	bharat.bhushan@nxp.com, will.deacon@arm.com, "Nair,
	Jayachandran" <Jayachandran.Nair@cavium.com>, peterx@redhat.com,
	robin.murphy@arm.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1g4J1kcU7XcB

Hi Tomasz,

On 03/08/2017 12:11, Tomasz Nowicki wrote:
> Hi Eric,
> 
> On 01.08.2017 15:07, Auger Eric wrote:
>> Hi Tomasz,
>> On 01/08/2017 13:01, Tomasz Nowicki wrote:
>>> Hi Eric,
>>>
>>> Just letting you know that I am facing another issue with the following
>>> setup:
>>> 1. host (4.12 kernel & 64K page) and VM (4.12 kernel & 64K page)
>>> 2. QEMU + -netdev type=tap,ifname=tap,id=net0 -device
>>> virtio-net-pci,netdev=net0,iommu_platform,disable-modern=off,disable-legacy=on
>>>
>>>
>>> 2. On VM, I allocate some huge pages and run DPDK testpmd app:
>>> # echo 4 > /sys/kernel/mm/hugepages/hugepages-524288kB/nr_hugepages
>>> # ./dpdk/usertools/dpdk-devbind.py -b vfio-pci  0000:00:02.0
>>> # ./dpdk/build/app/testpmd -l 0-13 -n 4 -w 0000:00:02.0 --
>>> --disable-hw-vlan-filter --disable-rss -i
>>> EAL: Detected 14 lcore(s)
>>> EAL: Probing VFIO support...
>>> EAL: VFIO support initialized
>>> EAL: PCI device 0000:00:02.0 on NUMA socket -1
>>> EAL:   probe driver: 1af4:1041 net_virtio
>>> EAL:   using IOMMU type 1 (Type 1)
>>> EAL: iommu_map_dma vaddr ffff20000000 size 80000000 iova 120000000
>>> EAL: Can't write to PCI bar (0) : offset (12)
>>> EAL: Can't read from PCI bar (0) : offset (12)
>>> EAL: Can't read from PCI bar (0) : offset (12)
>>> EAL: Can't write to PCI bar (0) : offset (12)
>>> EAL: Can't read from PCI bar (0) : offset (12)
>>> EAL: Can't write to PCI bar (0) : offset (12)
>>> EAL: Can't read from PCI bar (0) : offset (0)
>>> EAL: Can't write to PCI bar (0) : offset (4)
>>> EAL: Can't write to PCI bar (0) : offset (14)
>>> EAL: Can't write to PCI bar (0) : offset (e)
>>> EAL: Can't read from PCI bar (0) : offset (c)
>>> EAL: Requested device 0000:00:02.0 cannot be used
>>> EAL: No probed ethernet devices
>>> Interactive-mode selected
>>> USER1: create a new mbuf pool <mbuf_pool_socket_0>: n=251456, size=2176,
>>> socket=0
>>>
>>> When VM uses *4K pages* the same setup works fine. I will work on this
>>> but please let me know in case you already know what is going on.
>>
>> No I did not face that one. I was able to launch testpmd without such
>> early message. However I assigned an igbvf device to the guest and then
>> to DPDK. I've never tested your config.
>>
>> However as stated in my cover letter at the moment DPDK is not working
>> for me because of storms of tlbi-on-maps. I intend to work on this as
>> soon as get some bandwidth, sorry.
> 
> I found what was the reason of failure.
> 
> QEMU creates BARs for VIRTIO PCI device. The size of it depends on what
> is necessary for VIRTIO protocol. In my case the BAR is 16K size which
> is too small to be mmapable for kernel with 64K pages:
> vfio_pci_enable() -> vfio_pci_probe_mmaps() ->
> here guest kernel checks that BAR size is smaller than current PAGE_SIZE
> and clears VFIO_REGION_INFO_FLAG_MMAP flag which prevents BAR from being
> mmapped later on. I added -device virtio-net-pci,...,page-per-vq=on to
> enlarge BAR size to 8M and now testpmd works fine. I wonder how the same
> setup is working with e.g. Intel or AMD IOMMU.
Hum OK. Yet another thing to investigate! thank you for your efforts and
excellent news overall. Preparing a rebase ...

Thanks

Eric
> 
> Thanks,
> Tomasz
> 
