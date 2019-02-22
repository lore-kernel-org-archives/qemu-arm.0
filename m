Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp6674260wrx;
        Fri, 22 Feb 2019 00:10:30 -0800 (PST)
X-Google-Smtp-Source: AHgI3Iaq/4ABQO+KrPt9GUXodlvz/lWwZwnIwOrWn10aa0k81+COj5e/bCS7ndkOUBU4XPB2hCUW
X-Received: by 2002:a25:258f:: with SMTP id l137mr2206947ybl.416.1550823030644;
        Fri, 22 Feb 2019 00:10:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550823030; cv=none;
        d=google.com; s=arc-20160816;
        b=acLnFFAF3PWtBsbhE46d5JKybVI+BRjN1M5KnM3pL1UBggNnYCZG3GazqZt7w0KFZr
         s4miIKT2Nx64sOLh4Q6hZ2diVtwsfbkTve51IPrIyJtKiCP9bb9ngWCkiOBPZSqmMQzy
         9A8cXCk09HWowEfiKyovGCq+xOG2tLwQemqRxA0C//k8BXokNXi/O/43lebgcmSnDbUm
         NcMO6QTSooCyJslv9AqGgKH8caHm6eCcWhsKG49eUR+JGauxe9aZjs1ZV5ww1yYofnGr
         bXRHySWWlLANKD3BlCrN0pBQU41ivRC3Ml9pI61syFpAXjGU+p/RXVnCciVyO+geaZaR
         aQFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=/aNUZDcaLztzxWFv0KOC0Jo7CP6csupL2t7SdZbYsTs=;
        b=u2HFZ7t59d0egL8X1jh2KisjkngLwha1RLUasEbc/5XBI07wPcdpsU+6UYS52kpzC5
         05owQ+XXUtXbDuEdoRiKV9+7yE7V98tyUAMjGOH9GyDlfHcDy7wMJYmWZs3VhHZzomUW
         V3L75al/0rCbV/SRTUuPvpPe6hvbIgDUwFJndcQ5YjDfNllNm9Xs96Hd5x8TGQQGnP2V
         K/J0YS+pfzR46mF9CDAWu2Y6YEJO28uo6iq2Hi7aP+7AmtLdQXl/moyusdbs+4FAwqbR
         AHVY31Hd9Uw9uLhlHTBAg28hpfeBDvhtDzKQ/fgyf/JINz09Gb7x9cnobGUlfW0vjSQy
         wABw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y13si436330ybm.13.2019.02.22.00.10.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Feb 2019 00:10:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:46133 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gx5ug-00024C-1e
	for alex.bennee@linaro.org; Fri, 22 Feb 2019 03:10:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40482)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gx5tA-0001SE-JH
	for qemu-devel@nongnu.org; Fri, 22 Feb 2019 03:08:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gx5t1-0004ZV-R9
	for qemu-devel@nongnu.org; Fri, 22 Feb 2019 03:08:49 -0500
Received: from mx1.redhat.com ([209.132.183.28]:40598)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gx5sw-0004Il-Cn; Fri, 22 Feb 2019 03:08:42 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A622058E24;
	Fri, 22 Feb 2019 08:08:25 +0000 (UTC)
Received: from [10.36.116.102] (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 958B11001E64;
	Fri, 22 Feb 2019 08:08:20 +0000 (UTC)
To: Heyi Guo <guoheyi@huawei.com>, eric.auger.pro@gmail.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
References: <20190220224003.4420-1-eric.auger@redhat.com>
	<20190220224003.4420-4-eric.auger@redhat.com>
	<fff2d35e-6aab-aed3-0088-f0c23e31bf76@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <495f3a2f-1250-5ea0-359d-b3ad525e1ebe@redhat.com>
Date: Fri, 22 Feb 2019 09:08:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <fff2d35e-6aab-aed3-0088-f0c23e31bf76@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 22 Feb 2019 08:08:26 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v7 03/17] hw/arm/virt: Split the memory map
 description
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: drjones@redhat.com, dgilbert@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: C342W3mwM0R3

Hi Heyi,

On 2/22/19 8:34 AM, Heyi Guo wrote:
> Hi Eric,
>=20
> Can't we still use one single memory map and update the base of every
> entry following VIRT_MEM? So that we don't need to split memory map or
> the enumeration definition, neither do we need to copy a15memmap into
> the extended memmap.

I made the decision to have 2 separate arrays since we have
- one array with static base address entries (which are initialized with
base address and size)
- and another array with floating base address entries (only the size is
initialized)

To me it makes things clearer with respect to what is static and what is
dynamically allocated (same for the enum).

Thanks

Eric
>=20
> Thanks,
>=20
> Heyi
>=20
>=20
> On 2019/2/21 6:39, Eric Auger wrote:
>> In the prospect to introduce an extended memory map supporting more
>> RAM, let's split the memory map array into two parts:
>>
>> - the former a15memmap contains regions below and including the RAM
>> - extended_memmap, only initialized with entries located after the RAM=
.
>> =C2=A0=C2=A0 Only the size of the region is initialized there since th=
eir base
>> =C2=A0=C2=A0 address will be dynamically computed, depending on the to=
p of the
>> =C2=A0=C2=A0 RAM (initial RAM at the moment), with same alignment as t=
heir size.
>>
>> This new split will allow to grow the RAM size without changing the
>> description of the high regions.
>>
>> The patch also moves the memory map setup into machvirt_init().
>> The rationale is the memory map will be soon affected by the
>> kvm_type() call that happens after virt_instance_init() and
>> before machvirt_init().
>>
>> The memory map is unchanged (the top of the initial RAM still is
>> 256GiB). Then come the high IO regions with same layout as before.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>>
>> ---
>> v6 -> v7:
>> - s/a15memmap/base_memmap
>> - slight rewording of the commit message
>> - add "if there is less than 256GiB of RAM then the floating area
>> =C2=A0=C2=A0 starts at the 256GiB mark" in the comment associated to t=
he floating
>> =C2=A0=C2=A0 memory map
>> - Added Peter's R-b
>>
>> v5 -> v6
>> - removal of many macros in units.h
>> - introduce the virt_set_memmap helper
>> - new computation for offsets of high IO regions
>> - add comments
>> ---
>> =C2=A0 hw/arm/virt.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
 48 +++++++++++++++++++++++++++++++++++++------
>> =C2=A0 include/hw/arm/virt.h | 14 +++++++++----
>> =C2=A0 2 files changed, 52 insertions(+), 10 deletions(-)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index a1955e7764..12039a0367 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -29,6 +29,7 @@
>> =C2=A0=C2=A0 */
>> =C2=A0 =C2=A0 #include "qemu/osdep.h"
>> +#include "qemu/units.h"
>> =C2=A0 #include "qapi/error.h"
>> =C2=A0 #include "hw/sysbus.h"
>> =C2=A0 #include "hw/arm/arm.h"
>> @@ -121,7 +122,7 @@
>> =C2=A0=C2=A0 * Note that devices should generally be placed at multipl=
es of
>> 0x10000,
>> =C2=A0=C2=A0 * to accommodate guests using 64K pages.
>> =C2=A0=C2=A0 */
>> -static const MemMapEntry a15memmap[] =3D {
>> +static const MemMapEntry base_memmap[] =3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Space up to 0x8000000 is reserved fo=
r a boot ROM */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [VIRT_FLASH] =3D=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0, 0x08000000 },
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [VIRT_CPUPERIPHS] =3D=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { 0x08000000, 0x00020000 },
>> @@ -149,11 +150,21 @@ static const MemMapEntry a15memmap[] =3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [VIRT_PCIE_PIO] =3D=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { 0x3eff0000, 0x00010000 },
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [VIRT_PCIE_ECAM] =3D=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { 0x3f000000, 0x01000000 },
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [VIRT_MEM] =3D=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { 0x40000=
000, RAMLIMIT_BYTES },
>> +};
>> +
>> +/*
>> + * Highmem IO Regions: This memory map is floating, located after the
>> RAM.
>> + * Each IO region offset will be dynamically computed, depending on t=
he
>> + * top of the RAM, so that its base get the same alignment as the siz=
e,
>> + * ie. a 512GiB region will be aligned on a 512GiB boundary. If there=
 is
>> + * less than 256GiB of RAM, the floating area starts at the 256GiB ma=
rk.
>> + */
>> +static MemMapEntry extended_memmap[] =3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Additional 64 MB redist region (can =
contain up to 512
>> redistributors) */
>> -=C2=A0=C2=A0=C2=A0 [VIRT_HIGH_GIC_REDIST2] =3D=C2=A0=C2=A0 { 0x400000=
0000ULL, 0x4000000 },
>> -=C2=A0=C2=A0=C2=A0 [VIRT_HIGH_PCIE_ECAM] =3D=C2=A0=C2=A0=C2=A0=C2=A0 =
{ 0x4010000000ULL, 0x10000000 },
>> -=C2=A0=C2=A0=C2=A0 /* Second PCIe window, 512GB wide at the 512GB bou=
ndary */
>> -=C2=A0=C2=A0=C2=A0 [VIRT_HIGH_PCIE_MMIO] =3D=C2=A0=C2=A0=C2=A0=C2=A0 =
{ 0x8000000000ULL, 0x8000000000ULL },
>> +=C2=A0=C2=A0=C2=A0 [VIRT_HIGH_GIC_REDIST2] =3D=C2=A0=C2=A0 { 0x0, 64 =
* MiB },
>> +=C2=A0=C2=A0=C2=A0 [VIRT_HIGH_PCIE_ECAM] =3D=C2=A0=C2=A0=C2=A0=C2=A0 =
{ 0x0, 256 * MiB },
>> +=C2=A0=C2=A0=C2=A0 /* Second PCIe window */
>> +=C2=A0=C2=A0=C2=A0 [VIRT_HIGH_PCIE_MMIO] =3D=C2=A0=C2=A0=C2=A0=C2=A0 =
{ 0x0, 512 * GiB },
>> =C2=A0 };
>> =C2=A0 =C2=A0 static const int a15irqmap[] =3D {
>> @@ -1354,6 +1365,30 @@ static uint64_t
>> virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return arm_cpu_mp_affinity(idx, cluster=
sz);
>> =C2=A0 }
>> =C2=A0 +static void virt_set_memmap(VirtMachineState *vms)
>> +{
>> +=C2=A0=C2=A0=C2=A0 hwaddr base;
>> +=C2=A0=C2=A0=C2=A0 int i;
>> +
>> +=C2=A0=C2=A0=C2=A0 vms->memmap =3D extended_memmap;
>> +
>> +=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < ARRAY_SIZE(base_memmap); i++) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vms->memmap[i] =3D base_me=
mmap[i];
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 vms->high_io_base =3D 256 * GiB; /* Top of the leg=
acy initial RAM
>> region */
>> +=C2=A0=C2=A0=C2=A0 base =3D vms->high_io_base;
>> +
>> +=C2=A0=C2=A0=C2=A0 for (i =3D VIRT_LOWMEMMAP_LAST; i < ARRAY_SIZE(ext=
ended_memmap);
>> i++) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hwaddr size =3D extended_m=
emmap[i].size;
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 base =3D ROUND_UP(base, si=
ze);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vms->memmap[i].base =3D ba=
se;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vms->memmap[i].size =3D si=
ze;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 base +=3D size;
>> +=C2=A0=C2=A0=C2=A0 }
>> +}
>> +
>> =C2=A0 static void machvirt_init(MachineState *machine)
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VirtMachineState *vms =3D VIRT_MACHINE(=
machine);
>> @@ -1368,6 +1403,8 @@ static void machvirt_init(MachineState *machine)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool firmware_loaded =3D bios_name || d=
rive_get(IF_PFLASH, 0, 0);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool aarch64 =3D true;
>> =C2=A0 +=C2=A0=C2=A0=C2=A0 virt_set_memmap(vms);
>> +
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* We can probe only here because durin=
g property set
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * KVM is not available yet
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>> @@ -1843,7 +1880,6 @@ static void virt_instance_init(Object *obj)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 "Valid values are none and smmuv3",
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 NULL);
>> =C2=A0 -=C2=A0=C2=A0=C2=A0 vms->memmap =3D a15memmap;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vms->irqmap =3D a15irqmap;
>> =C2=A0 }
>> =C2=A0 diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
>> index a27086d524..3dc7a6c5d5 100644
>> --- a/include/hw/arm/virt.h
>> +++ b/include/hw/arm/virt.h
>> @@ -64,7 +64,6 @@ enum {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VIRT_GIC_VCPU,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VIRT_GIC_ITS,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VIRT_GIC_REDIST,
>> -=C2=A0=C2=A0=C2=A0 VIRT_HIGH_GIC_REDIST2,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VIRT_SMMU,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VIRT_UART,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VIRT_MMIO,
>> @@ -74,12 +73,18 @@ enum {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VIRT_PCIE_MMIO,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VIRT_PCIE_PIO,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VIRT_PCIE_ECAM,
>> -=C2=A0=C2=A0=C2=A0 VIRT_HIGH_PCIE_ECAM,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VIRT_PLATFORM_BUS,
>> -=C2=A0=C2=A0=C2=A0 VIRT_HIGH_PCIE_MMIO,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VIRT_GPIO,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VIRT_SECURE_UART,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VIRT_SECURE_MEM,
>> +=C2=A0=C2=A0=C2=A0 VIRT_LOWMEMMAP_LAST,
>> +};
>> +
>> +/* indices of IO regions located after the RAM */
>> +enum {
>> +=C2=A0=C2=A0=C2=A0 VIRT_HIGH_GIC_REDIST2 =3D=C2=A0 VIRT_LOWMEMMAP_LAS=
T,
>> +=C2=A0=C2=A0=C2=A0 VIRT_HIGH_PCIE_ECAM,
>> +=C2=A0=C2=A0=C2=A0 VIRT_HIGH_PCIE_MMIO,
>> =C2=A0 };
>> =C2=A0 =C2=A0 typedef enum VirtIOMMUType {
>> @@ -116,7 +121,7 @@ typedef struct {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int32_t gic_version;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VirtIOMMUType iommu;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct arm_boot_info bootinfo;
>> -=C2=A0=C2=A0=C2=A0 const MemMapEntry *memmap;
>> +=C2=A0=C2=A0=C2=A0 MemMapEntry *memmap;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const int *irqmap;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int smp_cpus;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void *fdt;
>> @@ -126,6 +131,7 @@ typedef struct {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t msi_phandle;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t iommu_phandle;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int psci_conduit;
>> +=C2=A0=C2=A0=C2=A0 hwaddr high_io_base;
>> =C2=A0 } VirtMachineState;
>> =C2=A0 =C2=A0 #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM :
>> VIRT_PCIE_ECAM)
>=20
>=20
