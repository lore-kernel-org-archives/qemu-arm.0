Received: by 10.80.163.71 with SMTP id 65csp706413edn;
        Sat, 24 Sep 2016 01:25:59 -0700 (PDT)
X-Received: by 10.55.20.155 with SMTP id 27mr936182qku.179.1474705559087;
        Sat, 24 Sep 2016 01:25:59 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m2si7862553qte.50.2016.09.24.01.25.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 24 Sep 2016 01:25:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57919 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bniHW-0003ct-GD
	for alex.bennee@linaro.org; Sat, 24 Sep 2016 04:25:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51418)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bniHQ-0003bf-I9
	for qemu-arm@nongnu.org; Sat, 24 Sep 2016 04:25:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bniHM-0002Nl-Cr
	for qemu-arm@nongnu.org; Sat, 24 Sep 2016 04:25:51 -0400
Received: from 8.mo4.mail-out.ovh.net ([188.165.33.112]:47451)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bniHM-0002Mw-6B
	for qemu-arm@nongnu.org; Sat, 24 Sep 2016 04:25:48 -0400
Received: from player691.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo4.mail-out.ovh.net (Postfix) with ESMTP id 737F2CCE4
	for <qemu-arm@nongnu.org>; Sat, 24 Sep 2016 10:25:45 +0200 (CEST)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player691.ha.ovh.net (Postfix) with ESMTPSA id CB40926006D;
	Sat, 24 Sep 2016 10:25:39 +0200 (CEST)
To: "mar.krzeminski" <mar.krzeminski@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>
References: <1467634738-28642-1-git-send-email-clg@kaod.org>
	<1467634738-28642-5-git-send-email-clg@kaod.org>
	<577AA388.3060100@gmail.com>
	<2c52c156-2a32-b437-acd2-af13faaef55d@kaod.org>
	<CAFEAcA_MOhS04HiAVWg5xB8xBQ=krfZC6OBnH+X7UBo2_rf1uA@mail.gmail.com>
	<673755bd-c971-eb34-99b6-ac874a0d9a98@kaod.org>
	<78e298ed-b182-0fdf-99b7-de0324665b33@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <723852a7-a5ab-9acb-cea9-4a5637b8eada@kaod.org>
Date: Sat, 24 Sep 2016 10:25:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <78e298ed-b182-0fdf-99b7-de0324665b33@gmail.com>
Content-Type: text/plain; charset=utf-8
X-Ovh-Tracer-Id: 4073787340566203307
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddruddtgddtvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 188.165.33.112
Subject: Re: [Qemu-arm] [PATCH 4/7] m25p80: add a m25p80_set_rom_storage()
 routine
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wJuorPwqGUdC

On 09/23/2016 08:26 PM, mar.krzeminski wrote:
> Hi Cedric,
>=20
> W dniu 23.09.2016 o 10:28, C=C3=A9dric Le Goater pisze:
>> On 09/23/2016 10:17 AM, Peter Maydell wrote:
>>> On 23 September 2016 at 08:19, C=C3=A9dric Le Goater <clg@kaod.org> w=
rote:
>>>> But the goal is to boot from the device, so I added a memory region =
alias
>>>> at 0 to trigger the flash module mmios at boot time, as this is wher=
e
>>>> u-boot expects to be.
>>>>
>>>> and I fell in this trap :/
>>>>
>>>>          aspeed_smc_flash_read: To 0x0 of size 1: 0xbe mode:0
>>>>          Bad ram pointer (nil)
>>>>          Aborted (core dumped)
>>>>
>>>> There is a failure in get_page_addr_code(), possibly because qemu us=
es
>>>> byte per byte reads of the code (cpu_ldub_code). But this is beyond =
my
>>>> understanding of qemu's internal.
>>> This is a bug in how we report the problem, but the underlying
>>> issue here is attempting to execute from something that's not RAM
>>> or ROM. You can't execute code out of something backed by MMIO.
>> OK. So I see two solutions. T
>>
>> The "brutal" one which is to copy the flash contents in a rom blob
>> at 0, but there is still an issue in getting access to the storage
>> anyhow, as it is internal to m25p80. Or we should get the name of the
>> backing file of the drive but I am not sure we are expected to do
>> that as I don't see any API for it.
>>
>> The other solution is something like this patch which lets the storage
>> of the flash device be assigned externally.
> Since I do not like dirty hacks in the code, I want just to suggest a=20
> workaround, that probably you will not like ;]

It's a feature ! :)=20

I am just trying to find a solution to this issue. So, we could also=20
introduce a routine :

+uint8_t *m25p80_get_storage(DeviceState *dev, uint32_t *size)
+{
+    Flash *s =3D M25P80(dev);
+
+    *size =3D s->size;
+    return s->storage;
+}

and use rom_add_blob_fixed() with the return values. Maybe this is less=20
intrusive in the m25p80 device model flow. Thoughts ?=20

> As Qemu expects that first running code will be in ROM or RAM memory,
> you can implement in your board -bios option that you will use to
> pass u-boot binary to rom memory, or even use generic loader functional=
ity
> when it reach master.

but if we use -bios <file> to have a ROM, we will need to pass a second=20
time <file> as a drive to have a CS0 flash slave:=20

	-bios "flash-palmetto-test"  \
	-drive file=3D"flash-palmetto-test",format=3Draw,if=3Dmtd \
	-drive file=3D"palmetto.pnor",format=3Draw,if=3Dmtd

This feels awkward. The virt platform and vexpress forbid that for=20
instance.

Are there any other platform with similar need ?=20

Thanks,
C.=20
