Received: by 10.25.21.156 with SMTP id 28csp200681lfv;
        Fri, 12 Aug 2016 08:00:59 -0700 (PDT)
X-Received: by 10.55.221.131 with SMTP id u3mr17064620qku.243.1471014059019;
        Fri, 12 Aug 2016 08:00:59 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m35si4836014qtd.115.2016.08.12.08.00.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Aug 2016 08:00:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52639 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bYDxC-0003qD-Dh
	for alex.bennee@linaro.org; Fri, 12 Aug 2016 11:00:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48793)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bYDSM-00038h-EG
	for qemu-devel@nongnu.org; Fri, 12 Aug 2016 10:29:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bYDSI-0000qu-77
	for qemu-devel@nongnu.org; Fri, 12 Aug 2016 10:29:05 -0400
Received: from mo6.mail-out.ovh.net ([178.32.228.6]:36318)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bYDSH-0000qV-SU
	for qemu-devel@nongnu.org; Fri, 12 Aug 2016 10:29:02 -0400
Received: from player738.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo6.mail-out.ovh.net (Postfix) with ESMTP id 69C30FFA777
	for <qemu-devel@nongnu.org>; Fri, 12 Aug 2016 10:33:16 +0200 (CEST)
Received: from [192.168.1.11] (ARennes-257-1-62-53.w81-53.abo.wanadoo.fr
	[81.53.141.53]) (Authenticated sender: clg@kaod.org)
	by player738.ha.ovh.net (Postfix) with ESMTPSA id EA5FC684;
	Fri, 12 Aug 2016 10:33:11 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1470158147-16378-1-git-send-email-clg@kaod.org>
	<1470158147-16378-4-git-send-email-clg@kaod.org>
	<CAFEAcA9xrwghN6FMRsbHAMrTfSLv3K+iVAJEA-8p-NQ+s-bfxw@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <d2c9a78f-ace2-0538-ea4e-91d10b7dbe7f@kaod.org>
Date: Fri, 12 Aug 2016 10:33:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9xrwghN6FMRsbHAMrTfSLv3K+iVAJEA-8p-NQ+s-bfxw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
X-Ovh-Tracer-Id: 9929311279477394347
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeluddruddtgddtgeculddtuddrfeeltddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 178.32.228.6
Subject: Re: [Qemu-devel] [PATCH v3 03/10] aspeed-soc: provide a framework
 to add new SoCs
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dkkRbU61OMwd

On 08/11/2016 12:14 PM, Peter Maydell wrote:
> On 2 August 2016 at 18:15, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>> Let's define an object class for each Aspeed SoC we support. A
>> AspeedSoCInfo struct gathers the SoC specifications which can later be
>> used by an instance of the class or by a board using the SoC.
>>
>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>=20
>> diff --git a/hw/arm/palmetto-bmc.c b/hw/arm/palmetto-bmc.c
>> index 4d11905cfb18..531c266d9449 100644
>> --- a/hw/arm/palmetto-bmc.c
>> +++ b/hw/arm/palmetto-bmc.c
>> @@ -22,8 +22,6 @@
>>  #include "sysemu/blockdev.h"
>>
>>  static struct arm_boot_info palmetto_bmc_binfo =3D {
>> -    .loader_start =3D AST2400_SDRAM_BASE,
>> -    .board_id =3D 0,
>>      .nb_cpus =3D 1,
>>  };
>>
>> @@ -61,14 +59,17 @@ static void palmetto_bmc_init_flashes(AspeedSMCSta=
te *s, const char *flashtype,
>>  static void palmetto_bmc_init(MachineState *machine)
>>  {
>>      PalmettoBMCState *bmc;
>> +    AspeedSoCClass *sc;
>>
>>      bmc =3D g_new0(PalmettoBMCState, 1);
>> -    object_initialize(&bmc->soc, (sizeof(bmc->soc)), TYPE_ASPEED_SOC)=
;
>> +    object_initialize(&bmc->soc, (sizeof(bmc->soc)), "ast2400-a0");
>>      object_property_add_child(OBJECT(machine), "soc", OBJECT(&bmc->so=
c),
>>                                &error_abort);
>>
>> +    sc =3D ASPEED_SOC_GET_CLASS(&bmc->soc);
>> +
>>      memory_region_allocate_system_memory(&bmc->ram, NULL, "ram", ram_=
size);
>> -    memory_region_add_subregion(get_system_memory(), AST2400_SDRAM_BA=
SE,
>> +    memory_region_add_subregion(get_system_memory(), sc->info->sdram_=
base,
>>                                  &bmc->ram);
>>      object_property_add_const_link(OBJECT(&bmc->soc), "ram", OBJECT(&=
bmc->ram),
>>                                     &error_abort);
>> @@ -84,6 +85,9 @@ static void palmetto_bmc_init(MachineState *machine)
>>      palmetto_bmc_binfo.initrd_filename =3D machine->initrd_filename;
>>      palmetto_bmc_binfo.kernel_cmdline =3D machine->kernel_cmdline;
>>      palmetto_bmc_binfo.ram_size =3D ram_size;
>> +    palmetto_bmc_binfo.board_id =3D sc->info->silicon_rev;
>> +    palmetto_bmc_binfo.loader_start =3D sc->info->sdram_base;
>> +
>=20
> This changes the behaviour from passing in the board_id
> as 0 to passing in the silicon rev. Neither of those
> things is actually a valid board ID value, which must
> be one of:
> (a) for legacy pre-device-tree boards, a value listed in
> the official database at:
> http://www.arm.linux.org.uk/developer/machines/download.php
> (b) for device-tree-only boards, -1
>=20
> board_id 0 means "I am an EBSA110", which this isn't,
> and your silicon rev values are completely out of range.

OK. I was not aware of this. I will request new board ids for=20
the ast2400 and ast2500

Thanks,

C.
=20
> thanks
> -- PMM
>=20

