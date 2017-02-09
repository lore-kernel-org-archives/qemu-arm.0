Received: by 10.25.77.65 with SMTP id a62csp157184lfb;
        Thu, 9 Feb 2017 12:28:23 -0800 (PST)
X-Received: by 10.55.26.42 with SMTP id a42mr4650220qka.312.1486672103379;
        Thu, 09 Feb 2017 12:28:23 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b132si8846606qka.270.2017.02.09.12.28.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Feb 2017 12:28:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40100 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cbvKG-0003hH-Uw
	for alex.bennee@linaro.org; Thu, 09 Feb 2017 15:28:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34589)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1cbvKD-0003gc-Cg
	for qemu-arm@nongnu.org; Thu, 09 Feb 2017 15:28:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1cbvK9-0000E0-Fg
	for qemu-arm@nongnu.org; Thu, 09 Feb 2017 15:28:17 -0500
Received: from mx1.redhat.com ([209.132.183.28]:37230)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1cbvK9-0000Df-6e; Thu, 09 Feb 2017 15:28:13 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4F5B7C009DE6;
	Thu,  9 Feb 2017 20:28:13 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-116-51.phx2.redhat.com
	[10.3.116.51])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v19KSAm0030632; Thu, 9 Feb 2017 15:28:10 -0500
To: Alexander Graf <agraf@suse.de>, "Michael S. Tsirkin" <mst@redhat.com>
References: <1486644810-33181-1-git-send-email-agraf@suse.de>
	<70829774-a0c4-79ae-2eaf-cfac19e9dd7d@redhat.com>
	<20170209201301-mutt-send-email-mst@kernel.org>
	<B93CA3EA-D7F6-4395-BFBD-6362FAAE2822@suse.de>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <a01f5eaf-eed6-ad49-2ba1-e63b2d61b082@redhat.com>
Date: Thu, 9 Feb 2017 21:28:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <B93CA3EA-D7F6-4395-BFBD-6362FAAE2822@suse.de>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Thu, 09 Feb 2017 20:28:13 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 0/4] target-arm: Add some omitted dma
 cache coherency flags
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, Shannon Zhao <shannon.zhao@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9QYXLo4w1Dr+

On 02/09/17 19:27, Alexander Graf wrote:
> 
> 
>> Am 09.02.2017 um 19:13 schrieb Michael S. Tsirkin <mst@redhat.com>:
>>
>>> On Thu, Feb 09, 2017 at 02:15:36PM +0100, Laszlo Ersek wrote:
>>>> On 02/09/17 13:53, Alexander Graf wrote:
>>>> ARM is amazing when it comes to cache coherency and VMs. While any sane
>>>> architecture allows the host to override the guest's caching attributes,
>>>> that's very hard to do on ARM.
>>>>
>>>> That means that the guest may directly access guest memory bypassing the
>>>> cache while QEMU happily writes to / reads from cache. The end result is
>>>> very nasty, because both sides see very different views of the world.
>>>>
>>>> That means that we need to be very cautious to tell guests that devices
>>>> that QEMU emulates are going to use data in the cache rather than directly
>>>> on memory.
>>>>
>>>> We added this to PCI a while back for DT (5d636e21 "hw/arm/virt: mark the PCIe
>>>> host controller as DMA coherent in the DT") and ACPI (bc64b96 "hw/arm/virt-
>>>> acpi-build: _CCA attribute is compulsory") but never updated virtio-mmio or
>>>> fw-cfg in DT or ACPI tables.
>>>>
>>>> This patch set adds the respective cache coherency flags for them in both DT and
>>>> ACPI.
>>>>
>>>> Fortunately, no guests except for Linux 4.9.7 and 4.9.8 are broken because of
>>>> this. Upstream realized quickly enough that every user of virtio-mmio out there
>>>> describes its cache coherency incorrectly and reverted the patch that would
>>>> require said dma coherency flag. But we should be safe for the future and "do
>>>> the right thing".
>>>>
>>>> Alexander Graf (4):
>>>>  target-arm: Declare virtio-mmio as dma-coherent in dt
>>>>  hw/arm/virt: Declare virtio-mmio as dma cache coherent in ACPI
>>>>  hw/arm/virt: Declare fwcfg as dma cache coherent in ACPI
>>>>  hw/arm/virt: Declare fwcfg as dma cache coherent in dt
>>>>
>>>> hw/arm/vexpress.c        | 1 +
>>>> hw/arm/virt-acpi-build.c | 2 ++
>>>> hw/arm/virt.c            | 2 ++
>>>> 3 files changed, 5 insertions(+)
>>>>
>>>
>>> Famous last words:
>>> series
>>> Reviewed-by: Laszlo Ersek <lersek@redhat.com>
>>>
>>> Should we replicate patch #3 to QEMU0002 / FWCF in
>>> "hw/i386/acpi-build.c" too? Or is it that we couldn't care less about
>>> _CCA on x86? :) (Can't really muster the energy right now to look it up
>>> in the ACPI spec, sorry!)
>>>
>>> Thanks
>>> Laszlo
>>
>> ACPI spec says:
>> On platforms for which existing default cache-coherency behavior of the OS is not adequate, _CCA
>> enables the OS to adapt to the differences
>>
>> So I think we don't need it on x86.
> 
> According to acpi 6.1, x86 explicitly defaults to dma coherent if _CCA is omitted. It's only illegal for ARM.

Incredible; a finding that, for a change, does not create more work.

Thanks.
Laszlo

