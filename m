Received: by 10.25.21.96 with SMTP id l93csp262323lfi;
        Fri, 17 Jun 2016 06:23:17 -0700 (PDT)
X-Received: by 10.55.192.203 with SMTP id v72mr2228663qkv.122.1466169797132;
        Fri, 17 Jun 2016 06:23:17 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id 6si31441631qkh.47.2016.06.17.06.23.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 17 Jun 2016 06:23:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57454 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bDtjw-0008Ss-Fg
	for alex.bennee@linaro.org; Fri, 17 Jun 2016 09:23:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56326)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bDtVI-0008JJ-UZ
	for qemu-arm@nongnu.org; Fri, 17 Jun 2016 09:08:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bDtVE-0008IW-FI
	for qemu-arm@nongnu.org; Fri, 17 Jun 2016 09:08:08 -0400
Received: from 3.mo53.mail-out.ovh.net ([178.33.44.239]:59355)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bDtVE-0008IK-5A
	for qemu-arm@nongnu.org; Fri, 17 Jun 2016 09:08:04 -0400
Received: from player158.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo53.mail-out.ovh.net (Postfix) with ESMTP id 4320EFF95ED
	for <qemu-arm@nongnu.org>; Fri, 17 Jun 2016 15:08:03 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player158.ha.ovh.net (Postfix) with ESMTPSA id 7AE316200A0;
	Fri, 17 Jun 2016 15:07:54 +0200 (CEST)
To: Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
References: <1466165724-7620-1-git-send-email-clg@kaod.org>
	<1466165724-7620-2-git-send-email-clg@kaod.org>
	<04090e71-2d6f-d157-4d7a-73d8bc8b0b3f@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <2beb3e5d-033a-d9d5-7b28-4a0e3a6565a5@kaod.org>
Date: Fri, 17 Jun 2016 15:07:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <04090e71-2d6f-d157-4d7a-73d8bc8b0b3f@redhat.com>
Content-Type: text/plain; charset=utf-8
X-Ovh-Tracer-Id: 17740523359917870035
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeekledrledtgdehlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 178.33.44.239
Subject: Re: [Qemu-arm] [PATCH v2 1/5] m25p80: qdev-ify drive property
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
Cc: kwolf@redhat.com, Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
	armbru@redhat.com, qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: It9Xt6VdMQur

On 06/17/2016 02:32 PM, Paolo Bonzini wrote:
>=20
>=20
> On 17/06/2016 14:15, C=C3=A9dric Le Goater wrote:
>> From: Paolo Bonzini <pbonzini@redhat.com>
>>
>> This allows specifying the property via -drive if=3Dnone and creating
>> the flash device with -device.
>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>=20
> You need to add your Signed-off-by line too. =20

Yes. Sorry about that :/

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>=20

I will next round.=20

> You should have used "git
> am -s" for that, but in this case just replace to my mail with the
> signoff and the maintainer will collect it.
>=20
> Thanks for picking up the patch. :)

That was needed and it should help us for the next item we want=20
to work on. We need more control on the flash storage as we
should be mapping it in memory.

Thanks,

C.

> Paolo
>=20
>> ---
>>  hw/arm/xilinx_zynq.c                |  8 +++++++-
>>  hw/arm/xlnx-ep108.c                 |  9 ++++++++-
>>  hw/block/m25p80.c                   | 10 ++--------
>>  hw/microblaze/petalogix_ml605_mmu.c |  9 ++++++++-
>>  4 files changed, 25 insertions(+), 11 deletions(-)
>>
>> diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
>> index aefebcfa6d8f..b0cabe2e4a67 100644
>> --- a/hw/arm/xilinx_zynq.c
>> +++ b/hw/arm/xilinx_zynq.c
>> @@ -138,7 +138,13 @@ static inline void zynq_init_spi_flashes(uint32_t=
 base_addr, qemu_irq irq,
>>          spi =3D (SSIBus *)qdev_get_child_bus(dev, bus_name);
>> =20
>>          for (j =3D 0; j < num_ss; ++j) {
>> -            flash_dev =3D ssi_create_slave(spi, "n25q128");
>> +            DriveInfo *dinfo =3D drive_get_next(IF_MTD);
>> +            flash_dev =3D ssi_create_slave_no_init(spi, "n25q128");
>> +            if (dinfo) {
>> +                qdev_prop_set_drive(flash_dev, "drive",
>> +                                    blk_by_legacy_dinfo(dinfo), &erro=
r_fatal);
>> +            }
>> +            qdev_init_nofail(flash_dev);
>> =20
>>              cs_line =3D qdev_get_gpio_in_named(flash_dev, SSI_GPIO_CS=
, 0);
>>              sysbus_connect_irq(busdev, i * num_ss + j + 1, cs_line);
>> diff --git a/hw/arm/xlnx-ep108.c b/hw/arm/xlnx-ep108.c
>> index 34b464171266..4ec590a25db5 100644
>> --- a/hw/arm/xlnx-ep108.c
>> +++ b/hw/arm/xlnx-ep108.c
>> @@ -88,12 +88,19 @@ static void xlnx_ep108_init(MachineState *machine)
>>          SSIBus *spi_bus;
>>          DeviceState *flash_dev;
>>          qemu_irq cs_line;
>> +        DriveInfo *dinfo =3D drive_get_next(IF_MTD);
>>          gchar *bus_name =3D g_strdup_printf("spi%d", i);
>> =20
>>          spi_bus =3D (SSIBus *)qdev_get_child_bus(DEVICE(&s->soc), bus=
_name);
>>          g_free(bus_name);
>> =20
>> -        flash_dev =3D ssi_create_slave(spi_bus, "sst25wf080");
>> +        flash_dev =3D ssi_create_slave_no_init(spi_bus, "sst25wf080")=
;
>> +        if (dinfo) {
>> +            qdev_prop_set_drive(flash_dev, "drive", blk_by_legacy_din=
fo(dinfo),
>> +                                &error_fatal);
>> +        }
>> +        qdev_init_nofail(flash_dev);
>> +
>>          cs_line =3D qdev_get_gpio_in_named(flash_dev, SSI_GPIO_CS, 0)=
;
>> =20
>>          sysbus_connect_irq(SYS_BUS_DEVICE(&s->soc.spi[i]), 1, cs_line=
);
>> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
>> index e6f6e23fb71d..7d1c34a1a2d1 100644
>> --- a/hw/block/m25p80.c
>> +++ b/hw/block/m25p80.c
>> @@ -881,7 +881,6 @@ static uint32_t m25p80_transfer8(SSISlave *ss, uin=
t32_t tx)
>> =20
>>  static void m25p80_realize(SSISlave *ss, Error **errp)
>>  {
>> -    DriveInfo *dinfo;
>>      Flash *s =3D M25P80(ss);
>>      M25P80Class *mc =3D M25P80_GET_CLASS(s);
>> =20
>> @@ -890,14 +889,8 @@ static void m25p80_realize(SSISlave *ss, Error **=
errp)
>>      s->size =3D s->pi->sector_size * s->pi->n_sectors;
>>      s->dirty_page =3D -1;
>> =20
>> -    /* FIXME use a qdev drive property instead of drive_get_next() */
>> -    dinfo =3D drive_get_next(IF_MTD);
>> -
>> -    if (dinfo) {
>> +    if (s->blk) {
>>          DB_PRINT_L(0, "Binding to IF_MTD drive\n");
>> -        s->blk =3D blk_by_legacy_dinfo(dinfo);
>> -        blk_attach_dev_nofail(s->blk, s);
>> -
>>          s->storage =3D blk_blockalign(s->blk, s->size);
>> =20
>>          if (blk_pread(s->blk, 0, s->storage, s->size) !=3D s->size) {
>> @@ -925,6 +918,7 @@ static void m25p80_pre_save(void *opaque)
>> =20
>>  static Property m25p80_properties[] =3D {
>>      DEFINE_PROP_UINT32("nonvolatile-cfg", Flash, nonvolatile_cfg, 0x8=
FFF),
>> +    DEFINE_PROP_DRIVE("drive", Flash, blk),
>>      DEFINE_PROP_END_OF_LIST(),
>>  };
>> =20
>> diff --git a/hw/microblaze/petalogix_ml605_mmu.c b/hw/microblaze/petal=
ogix_ml605_mmu.c
>> index 07527b677b37..4968bdbb2821 100644
>> --- a/hw/microblaze/petalogix_ml605_mmu.c
>> +++ b/hw/microblaze/petalogix_ml605_mmu.c
>> @@ -191,9 +191,16 @@ petalogix_ml605_init(MachineState *machine)
>>          spi =3D (SSIBus *)qdev_get_child_bus(dev, "spi");
>> =20
>>          for (i =3D 0; i < NUM_SPI_FLASHES; i++) {
>> +            DriveInfo *dinfo =3D drive_get_next(IF_MTD);
>>              qemu_irq cs_line;
>> =20
>> -            dev =3D ssi_create_slave(spi, "n25q128");
>> +            dev =3D ssi_create_slave_no_init(spi, "n25q128");
>> +            if (dinfo) {
>> +                qdev_prop_set_drive(dev, "drive", blk_by_legacy_dinfo=
(dinfo),
>> +                                    &error_fatal);
>> +            }
>> +            qdev_init_nofail(dev);
>> +
>>              cs_line =3D qdev_get_gpio_in_named(dev, SSI_GPIO_CS, 0);
>>              sysbus_connect_irq(busdev, i+1, cs_line);
>>          }
>>

