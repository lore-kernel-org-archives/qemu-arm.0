Received: by 10.25.77.65 with SMTP id a62csp107148lfb;
        Thu, 9 Feb 2017 10:27:27 -0800 (PST)
X-Received: by 10.200.40.45 with SMTP id 42mr4040597qtq.89.1486664847445;
        Thu, 09 Feb 2017 10:27:27 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 61si8591150qtg.298.2017.02.09.10.27.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Feb 2017 10:27:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39647 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cbtRE-0007NO-VX
	for alex.bennee@linaro.org; Thu, 09 Feb 2017 13:27:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59364)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1cbtRC-0007NI-3U
	for qemu-arm@nongnu.org; Thu, 09 Feb 2017 13:27:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1cbtR8-0006Gl-OB
	for qemu-arm@nongnu.org; Thu, 09 Feb 2017 13:27:22 -0500
Received: from mx2.suse.de ([195.135.220.15]:59103)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <agraf@suse.de>)
	id 1cbtR8-0006Gb-I2; Thu, 09 Feb 2017 13:27:18 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id BC43EAC5B;
	Thu,  9 Feb 2017 18:27:16 +0000 (UTC)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (1.0)
From: Alexander Graf <agraf@suse.de>
X-Mailer: iPhone Mail (14D27)
In-Reply-To: <20170209201301-mutt-send-email-mst@kernel.org>
Date: Thu, 9 Feb 2017 19:27:15 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <B93CA3EA-D7F6-4395-BFBD-6362FAAE2822@suse.de>
References: <1486644810-33181-1-git-send-email-agraf@suse.de>
	<70829774-a0c4-79ae-2eaf-cfac19e9dd7d@redhat.com>
	<20170209201301-mutt-send-email-mst@kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic] [fuzzy]
X-Received-From: 195.135.220.15
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
	Laszlo Ersek <lersek@redhat.com>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhao@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AB9Ht+AYukPD



> Am 09.02.2017 um 19:13 schrieb Michael S. Tsirkin <mst@redhat.com>:
>=20
>> On Thu, Feb 09, 2017 at 02:15:36PM +0100, Laszlo Ersek wrote:
>>> On 02/09/17 13:53, Alexander Graf wrote:
>>> ARM is amazing when it comes to cache coherency and VMs. While any sane
>>> architecture allows the host to override the guest's caching attributes,=

>>> that's very hard to do on ARM.
>>>=20
>>> That means that the guest may directly access guest memory bypassing the=

>>> cache while QEMU happily writes to / reads from cache. The end result is=

>>> very nasty, because both sides see very different views of the world.
>>>=20
>>> That means that we need to be very cautious to tell guests that devices
>>> that QEMU emulates are going to use data in the cache rather than direct=
ly
>>> on memory.
>>>=20
>>> We added this to PCI a while back for DT (5d636e21 "hw/arm/virt: mark th=
e PCIe
>>> host controller as DMA coherent in the DT") and ACPI (bc64b96 "hw/arm/vi=
rt-
>>> acpi-build: _CCA attribute is compulsory") but never updated virtio-mmio=
 or
>>> fw-cfg in DT or ACPI tables.
>>>=20
>>> This patch set adds the respective cache coherency flags for them in bot=
h DT and
>>> ACPI.
>>>=20
>>> Fortunately, no guests except for Linux 4.9.7 and 4.9.8 are broken becau=
se of
>>> this. Upstream realized quickly enough that every user of virtio-mmio ou=
t there
>>> describes its cache coherency incorrectly and reverted the patch that wo=
uld
>>> require said dma coherency flag. But we should be safe for the future an=
d "do
>>> the right thing".
>>>=20
>>> Alexander Graf (4):
>>>  target-arm: Declare virtio-mmio as dma-coherent in dt
>>>  hw/arm/virt: Declare virtio-mmio as dma cache coherent in ACPI
>>>  hw/arm/virt: Declare fwcfg as dma cache coherent in ACPI
>>>  hw/arm/virt: Declare fwcfg as dma cache coherent in dt
>>>=20
>>> hw/arm/vexpress.c        | 1 +
>>> hw/arm/virt-acpi-build.c | 2 ++
>>> hw/arm/virt.c            | 2 ++
>>> 3 files changed, 5 insertions(+)
>>>=20
>>=20
>> Famous last words:
>> series
>> Reviewed-by: Laszlo Ersek <lersek@redhat.com>
>>=20
>> Should we replicate patch #3 to QEMU0002 / FWCF in
>> "hw/i386/acpi-build.c" too? Or is it that we couldn't care less about
>> _CCA on x86? :) (Can't really muster the energy right now to look it up
>> in the ACPI spec, sorry!)
>>=20
>> Thanks
>> Laszlo
>=20
> ACPI spec says:
> On platforms for which existing default cache-coherency behavior of the OS=
 is not adequate, _CCA
> enables the OS to adapt to the differences
>=20
> So I think we don't need it on x86.

According to acpi 6.1, x86 explicitly defaults to dma coherent if _CCA is om=
itted. It's only illegal for ARM.

Alex


