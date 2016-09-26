Received: by 10.80.163.71 with SMTP id 65csp1366481edn;
        Mon, 26 Sep 2016 01:57:15 -0700 (PDT)
X-Received: by 10.55.40.23 with SMTP id o23mr19708293qkh.212.1474880235880;
        Mon, 26 Sep 2016 01:57:15 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d194si13839297qkg.268.2016.09.26.01.57.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 26 Sep 2016 01:57:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42511 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1boRit-0005XX-CD
	for alex.bennee@linaro.org; Mon, 26 Sep 2016 04:57:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53343)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1boRiC-00052W-47
	for qemu-arm@nongnu.org; Mon, 26 Sep 2016 04:56:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1boRi8-0006th-Ue
	for qemu-arm@nongnu.org; Mon, 26 Sep 2016 04:56:32 -0400
Received: from 16.mo4.mail-out.ovh.net ([188.165.55.104]:48852)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1boRi8-0006tB-Lz
	for qemu-arm@nongnu.org; Mon, 26 Sep 2016 04:56:28 -0400
Received: from player691.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo4.mail-out.ovh.net (Postfix) with ESMTP id 2753310472
	for <qemu-arm@nongnu.org>; Mon, 26 Sep 2016 10:56:25 +0200 (CEST)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player691.ha.ovh.net (Postfix) with ESMTPSA id 2A74A26006D;
	Mon, 26 Sep 2016 10:56:17 +0200 (CEST)
To: KONRAD Frederic <fred.konrad@greensocs.com>
References: <1467634738-28642-1-git-send-email-clg@kaod.org>
	<1467634738-28642-5-git-send-email-clg@kaod.org>
	<577AA388.3060100@gmail.com>
	<2c52c156-2a32-b437-acd2-af13faaef55d@kaod.org>
	<CAFEAcA_MOhS04HiAVWg5xB8xBQ=krfZC6OBnH+X7UBo2_rf1uA@mail.gmail.com>
	<673755bd-c971-eb34-99b6-ac874a0d9a98@kaod.org>
	<78e298ed-b182-0fdf-99b7-de0324665b33@gmail.com>
	<723852a7-a5ab-9acb-cea9-4a5637b8eada@kaod.org>
	<20160924085505.GA5931@toto>
	<0e9974da-2523-25a0-7c66-fa178f84818b@greensocs.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <84c94d46-f40b-f19f-1505-ace622ae1f99@kaod.org>
Date: Mon, 26 Sep 2016 10:56:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <0e9974da-2523-25a0-7c66-fa178f84818b@greensocs.com>
Content-Type: text/plain; charset=windows-1252
X-Ovh-Tracer-Id: 16337089127182600972
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrudefgddtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 188.165.55.104
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 4/7] m25p80: add a
 m25p80_set_rom_storage() routine
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
	mark.burton@greensocs.com, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, "mar.krzeminski" <mar.krzeminski@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Rl9bs2FtUTl7

On 09/26/2016 10:25 AM, KONRAD Frederic wrote:
>=20
>=20
> Le 24/09/2016 =E0 10:55, Edgar E. Iglesias a =E9crit :
>> On Sat, Sep 24, 2016 at 10:25:39AM +0200, C=E9dric Le Goater wrote:
>>> On 09/23/2016 08:26 PM, mar.krzeminski wrote:
>>>> Hi Cedric,
>>>>
>>>> W dniu 23.09.2016 o 10:28, C=E9dric Le Goater pisze:
>>>>> On 09/23/2016 10:17 AM, Peter Maydell wrote:
>>>>>> On 23 September 2016 at 08:19, C=E9dric Le Goater <clg@kaod.org> w=
rote:
>>>>>>> But the goal is to boot from the device, so I added a memory regi=
on alias
>>>>>>> at 0 to trigger the flash module mmios at boot time, as this is w=
here
>>>>>>> u-boot expects to be.
>>>>>>>
>>>>>>> and I fell in this trap :/
>>>>>>>
>>>>>>>          aspeed_smc_flash_read: To 0x0 of size 1: 0xbe mode:0
>>>>>>>          Bad ram pointer (nil)
>>>>>>>          Aborted (core dumped)
>>>>>>>
>>>>>>> There is a failure in get_page_addr_code(), possibly because qemu=
 uses
>>>>>>> byte per byte reads of the code (cpu_ldub_code). But this is beyo=
nd my
>>>>>>> understanding of qemu's internal.
>>>>>> This is a bug in how we report the problem, but the underlying
>>>>>> issue here is attempting to execute from something that's not RAM
>>>>>> or ROM. You can't execute code out of something backed by MMIO.
>>>>> OK. So I see two solutions. T
>>>>>
>>>>> The "brutal" one which is to copy the flash contents in a rom blob
>>>>> at 0, but there is still an issue in getting access to the storage
>>>>> anyhow, as it is internal to m25p80. Or we should get the name of t=
he
>>>>> backing file of the drive but I am not sure we are expected to do
>>>>> that as I don't see any API for it.
>>>>>
>>>>> The other solution is something like this patch which lets the stor=
age
>>>>> of the flash device be assigned externally.
>>>> Since I do not like dirty hacks in the code, I want just to suggest =
a
>>>> workaround, that probably you will not like ;]
>>>
>>> It's a feature ! :)
>>
>> CC: Mark and Fred
>>
>> I agree, I think these are fair attempts to try to solve a real proble=
m.
>>
>>
>>> I am just trying to find a solution to this issue. So, we could also
>>> introduce a routine :
>>>
>>> +uint8_t *m25p80_get_storage(DeviceState *dev, uint32_t *size)
>>> +{
>>> +    Flash *s =3D M25P80(dev);
>>> +
>>> +    *size =3D s->size;
>>> +    return s->storage;
>>> +}
>>>
>>> and use rom_add_blob_fixed() with the return values. Maybe this is le=
ss
>>> intrusive in the m25p80 device model flow. Thoughts ?
>>>
>>>> As Qemu expects that first running code will be in ROM or RAM memory=
,
>>>> you can implement in your board -bios option that you will use to
>>>> pass u-boot binary to rom memory, or even use generic loader functio=
nality
>>>> when it reach master.
>>>
>>> but if we use -bios <file> to have a ROM, we will need to pass a seco=
nd
>>> time <file> as a drive to have a CS0 flash slave:
>>>
>>>     -bios "flash-palmetto-test"  \
>>>     -drive file=3D"flash-palmetto-test",format=3Draw,if=3Dmtd \
>>>     -drive file=3D"palmetto.pnor",format=3Draw,if=3Dmtd
>>>
>>> This feels awkward. The virt platform and vexpress forbid that for
>>> instance.
>>>
>>> Are there any other platform with similar need ?
>>
>> Yes, ZynqMP has a linear memory mapping of SPI memory contents. It get=
s
>> slightly more complicated there as the mapping supports various modes
>> including parallel SPIs with striping done by the controller (i.e
>> bytes as seen via the linearly mapped area are interleaved from multip=
le
>> SPI memories).
>>
>> So a plain RAM mapping of m25p80_get_storage won't work.
>>
>> A ROM version of the linear data might work at controller level. The c=
ontroller
>> would have to populate the ROM area at startup (slow) and keep it in s=
ync for all
>> writes. We would also need to signal write events so that TCG can flus=
h it's
>> caches. TCG only keeps track of modifications being made to cached cod=
e if changes
>> are done with writes to RAM area (not if they happen indirectly via ot=
her registers).
>>
>> Another solution is to implement support in TCG to execute from MMIO m=
apped areas.
>> We'd also need to solve the problem of signalling content changes to T=
CG.
>>
>> I think these approaches have some overlap. Personally, I think TCG ex=
ecuting from
>> MMIO areas would be quite useful. It's also useful for QEMU & SystemC =
integration.
>=20
> Hi,
>=20
> The solution we are preparing for this is to allow a MMIO region to exe=
cute code=20
> as Edgar just suggested by adding two callbacks:

Yes it seems the best option to boot.=20

The SPI controller I am working on maintains a set of mapping windows for=
=20
each flash slave. But it's up to software to make sure the window size an=
d=20
the flash size are in sync. So, in a qemu world, we will need some flexib=
ility=20
if we want to access directly the flash storage. I don't think this patch=
 is=20
the right approach though. Let's boot first.=20

>   - one which allows to get a pointer from an MMIO region nothing if
>     execution is not possible from it and some hint to know if it's
>     readable, writable.
>   - one function to "invalidate" the pointer which will flush the tb,
>     etc.

I don't know enough about TCG to comment, I am very willing to give it=20
a try when ever you have something ready.

Thanks,

C.

> We have fixed a second issue fairly linked to this: if we do a DMA acce=
ss to the=20
> MMIO areas it is split in 1,2,4 bytes transaction which is really slow.

