Received: by 10.25.159.131 with SMTP id i125csp1456683lfe;
        Mon, 5 Dec 2016 01:40:52 -0800 (PST)
X-Received: by 10.200.35.139 with SMTP id q11mr53880197qtq.274.1480930852854;
        Mon, 05 Dec 2016 01:40:52 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id n186si8510326qkd.140.2016.12.05.01.40.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Dec 2016 01:40:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38659 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cDplU-0003Wa-AR
	for alex.bennee@linaro.org; Mon, 05 Dec 2016 04:40:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60634)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cDphl-0001jh-1U
	for qemu-devel@nongnu.org; Mon, 05 Dec 2016 04:37:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cDphg-00024K-2y
	for qemu-devel@nongnu.org; Mon, 05 Dec 2016 04:37:01 -0500
Received: from 7.mo5.mail-out.ovh.net ([178.32.124.100]:47975)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1cDphf-00023p-S9
	for qemu-devel@nongnu.org; Mon, 05 Dec 2016 04:36:56 -0500
Received: from player773.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id A2F5952094
	for <qemu-devel@nongnu.org>; Mon,  5 Dec 2016 10:36:52 +0100 (CET)
Received: from hermes.kaod.org (alter.tetaneutral.net [91.224.149.189])
	(Authenticated sender: postmaster@kaod.org)
	by player773.ha.ovh.net (Postfix) with ESMTPSA id B2BA460006D;
	Mon,  5 Dec 2016 10:36:40 +0100 (CET)
To: "mar.krzeminski" <mar.krzeminski@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>
References: <1480434248-27138-1-git-send-email-clg@kaod.org>
	<1480434248-27138-25-git-send-email-clg@kaod.org>
	<4e2db842-7ff6-d7e7-c96c-26ce9c563c83@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <f28b693f-dade-b338-cc86-b5e85f8b1675@kaod.org>
Date: Mon, 5 Dec 2016 10:36:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <4e2db842-7ff6-d7e7-c96c-26ce9c563c83@gmail.com>
Content-Type: text/plain; charset=utf-8
X-Ovh-Tracer-Id: 3833689185063832496
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrgeekgddtudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 178.32.124.100
Subject: Re: [Qemu-devel] [PATCH for-2.9 24/30] aspeed: use first SPI flash
 as a boot ROM
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
	Marcin Krzeminski <marcin.krzeminski@nokia.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5ZErTBRuoCjD

Hello Marcin,

On 12/04/2016 06:00 PM, mar.krzeminski wrote:
> Hi Cedric,
>=20
> it looks like good idea for now to handle boot from flash.
> As I understand you are trying to omit bootrom code in Qemu model?

I suppose you mean handling a romd memory region under the m25p80=20
object ?=20

> This could lead you to some hacks in device models (eg SMC).

I haven't had to, yet.=20
=20
> W dniu 29.11.2016 o 16:44, C=C3=A9dric Le Goater pisze:
>> Fill a ROM region with the flash content to support U-Boot. This is a
>> little hacky but until we can boot from a MMIO region, it seems
>> difficult to do anything else.
>>
>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>> Reviewed-by: Joel Stanley <joel@jms.id.au>
>> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
>> ---
>>  hw/arm/aspeed.c | 41 +++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 41 insertions(+)
>>
>> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
>> index 40c13838fb2d..a92c2f1c362b 100644
>> --- a/hw/arm/aspeed.c
>> +++ b/hw/arm/aspeed.c
>> @@ -20,6 +20,8 @@
>>  #include "qemu/log.h"
>>  #include "sysemu/block-backend.h"
>>  #include "sysemu/blockdev.h"
>> +#include "hw/loader.h"
>> +#include "qemu/error-report.h"
>> =20
>>  static struct arm_boot_info aspeed_board_binfo =3D {
>>      .board_id =3D -1, /* device-tree-only board */
>> @@ -104,6 +106,28 @@ static const AspeedBoardConfig aspeed_boards[] =3D=
 {
>>      },
>>  };
>> =20
>> +#define FIRMWARE_ADDR 0x0
>> +
>> +static void write_boot_rom(DriveInfo *dinfo, hwaddr addr, size_t rom_=
size,
>> +                           Error **errp)
>> +{
>> +    BlockBackend *blk =3D blk_by_legacy_dinfo(dinfo);
>> +    uint8_t *storage;
>> +
>> +    if (rom_size > blk_getlength(blk)) {
>> +        rom_size =3D blk_getlength(blk);
>> +    }
> I was not able to attach smaller file as m25p80 storage.

yes that's most probably because m25p80_realize() does :=20

       if (blk_pread(s->blk, 0, s->storage, s->size) !=3D s->size) {
            error_setg(errp, "failed to read the initial flash content");
            return;
        }

my bad. May be, we could relax a bit the test and allow smaller block=20
backends ?=20


>> +
>> +    storage =3D g_new0(uint8_t, rom_size);
>> +    if (blk_pread(blk, 0, storage, rom_size) < 0) {
>> +        error_setg(errp, "failed to read the initial flash content");
>> +        return;
>> +    }
>> +
>> +    rom_add_blob_fixed("aspeed.boot_rom", storage, rom_size, addr);
>> +    g_free(storage);
>> +}
>> +
>>  static void aspeed_board_init_flashes(AspeedSMCState *s, const char *=
flashtype,
>>                                        Error **errp)
>>  {
>> @@ -135,6 +159,7 @@ static void aspeed_board_init(MachineState *machin=
e,
>>  {
>>      AspeedBoardState *bmc;
>>      AspeedSoCClass *sc;
>> +    DriveInfo *drive0 =3D drive_get(IF_MTD, 0, 0);
>> =20
>>      bmc =3D g_new0(AspeedBoardState, 1);
>>      object_initialize(&bmc->soc, (sizeof(bmc->soc)), cfg->soc_name);
>> @@ -168,6 +193,22 @@ static void aspeed_board_init(MachineState *machi=
ne,
>>      aspeed_board_init_flashes(&bmc->soc.fmc, cfg->fmc_model, &error_a=
bort);
>>      aspeed_board_init_flashes(&bmc->soc.spi[0], cfg->spi_model, &erro=
r_abort);
>> =20
>> +    /* Install first FMC flash content as a boot rom. */
>> +    if (drive0) {
>> +        AspeedSMCFlash *fl =3D &bmc->soc.fmc.flashes[0];
>> +        MemoryRegion *boot_rom =3D g_new(MemoryRegion, 1);
>> +
>> +        /*
>> +         * create a ROM region using the default mapping window size =
of
>> +         * the flash module.
>> +         */
>> +        memory_region_init_rom(boot_rom, OBJECT(bmc), "aspeed.boot_ro=
m",
>> +                               fl->size, &error_abort);
>> +        memory_region_add_subregion(get_system_memory(), FIRMWARE_ADD=
R,
>> +                                    boot_rom);
>> +        write_boot_rom(drive0, FIRMWARE_ADDR, fl->size, &error_abort)=
;
>
> Is it possible that fl->size will be bigger than segment size?
>
> I think max_size here should be segment size in smc.

I am not sure what you mean by "segment" ?=20

fl->size holds the default mapping window size on the AHB bus of the=20
flash chip CS0. The size can be changed by the guest using the segment=20
address registers but for CS0 this should be "autoconfigured" by HW.

Here, we are just using the default from the specs but we could go a=20
little further in the model and setup the mapping window size of CS0=20
using the block backend size, and set up the segment registers accordingl=
y.
There are some checks to be done. It might be a little complex.

Thanks,

C.=20


> Thanks,
> Marcin
>> +    }
>> +
>>      aspeed_board_binfo.kernel_filename =3D machine->kernel_filename;
>>      aspeed_board_binfo.initrd_filename =3D machine->initrd_filename;
>>      aspeed_board_binfo.kernel_cmdline =3D machine->kernel_cmdline;
>=20

