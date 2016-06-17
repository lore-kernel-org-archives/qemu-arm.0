Received: by 10.25.21.96 with SMTP id l93csp240017lfi;
        Fri, 17 Jun 2016 05:32:39 -0700 (PDT)
X-Received: by 10.55.40.150 with SMTP id o22mr1852065qko.195.1466166759579;
        Fri, 17 Jun 2016 05:32:39 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b58si26847514qtc.7.2016.06.17.05.32.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 17 Jun 2016 05:32:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56505 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bDsww-0006NT-TF
	for alex.bennee@linaro.org; Fri, 17 Jun 2016 08:32:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44682)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bDsws-0006LL-NK
	for qemu-arm@nongnu.org; Fri, 17 Jun 2016 08:32:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bDswo-0006vg-Ht
	for qemu-arm@nongnu.org; Fri, 17 Jun 2016 08:32:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33691)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1bDswo-0006vY-9b; Fri, 17 Jun 2016 08:32:30 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9648F90E49;
	Fri, 17 Jun 2016 12:32:29 +0000 (UTC)
Received: from [10.36.112.68] (ovpn-112-68.ams2.redhat.com [10.36.112.68])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5HCWOak018223
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 17 Jun 2016 08:32:26 -0400
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
References: <1466165724-7620-1-git-send-email-clg@kaod.org>
	<1466165724-7620-2-git-send-email-clg@kaod.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <04090e71-2d6f-d157-4d7a-73d8bc8b0b3f@redhat.com>
Date: Fri, 17 Jun 2016 14:32:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.0
MIME-Version: 1.0
In-Reply-To: <1466165724-7620-2-git-send-email-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Fri, 17 Jun 2016 12:32:29 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
X-TUID: rrdVniOUzMst



On 17/06/2016 14:15, C=C3=A9dric Le Goater wrote:
> From: Paolo Bonzini <pbonzini@redhat.com>
>=20
> This allows specifying the property via -drive if=3Dnone and creating
> the flash device with -device.
>=20
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

You need to add your Signed-off-by line too.  You should have used "git
am -s" for that, but in this case just replace to my mail with the
signoff and the maintainer will collect it.

Thanks for picking up the patch. :)

Paolo

> ---
>  hw/arm/xilinx_zynq.c                |  8 +++++++-
>  hw/arm/xlnx-ep108.c                 |  9 ++++++++-
>  hw/block/m25p80.c                   | 10 ++--------
>  hw/microblaze/petalogix_ml605_mmu.c |  9 ++++++++-
>  4 files changed, 25 insertions(+), 11 deletions(-)
>=20
> diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
> index aefebcfa6d8f..b0cabe2e4a67 100644
> --- a/hw/arm/xilinx_zynq.c
> +++ b/hw/arm/xilinx_zynq.c
> @@ -138,7 +138,13 @@ static inline void zynq_init_spi_flashes(uint32_t =
base_addr, qemu_irq irq,
>          spi =3D (SSIBus *)qdev_get_child_bus(dev, bus_name);
> =20
>          for (j =3D 0; j < num_ss; ++j) {
> -            flash_dev =3D ssi_create_slave(spi, "n25q128");
> +            DriveInfo *dinfo =3D drive_get_next(IF_MTD);
> +            flash_dev =3D ssi_create_slave_no_init(spi, "n25q128");
> +            if (dinfo) {
> +                qdev_prop_set_drive(flash_dev, "drive",
> +                                    blk_by_legacy_dinfo(dinfo), &error=
_fatal);
> +            }
> +            qdev_init_nofail(flash_dev);
> =20
>              cs_line =3D qdev_get_gpio_in_named(flash_dev, SSI_GPIO_CS,=
 0);
>              sysbus_connect_irq(busdev, i * num_ss + j + 1, cs_line);
> diff --git a/hw/arm/xlnx-ep108.c b/hw/arm/xlnx-ep108.c
> index 34b464171266..4ec590a25db5 100644
> --- a/hw/arm/xlnx-ep108.c
> +++ b/hw/arm/xlnx-ep108.c
> @@ -88,12 +88,19 @@ static void xlnx_ep108_init(MachineState *machine)
>          SSIBus *spi_bus;
>          DeviceState *flash_dev;
>          qemu_irq cs_line;
> +        DriveInfo *dinfo =3D drive_get_next(IF_MTD);
>          gchar *bus_name =3D g_strdup_printf("spi%d", i);
> =20
>          spi_bus =3D (SSIBus *)qdev_get_child_bus(DEVICE(&s->soc), bus_=
name);
>          g_free(bus_name);
> =20
> -        flash_dev =3D ssi_create_slave(spi_bus, "sst25wf080");
> +        flash_dev =3D ssi_create_slave_no_init(spi_bus, "sst25wf080");
> +        if (dinfo) {
> +            qdev_prop_set_drive(flash_dev, "drive", blk_by_legacy_dinf=
o(dinfo),
> +                                &error_fatal);
> +        }
> +        qdev_init_nofail(flash_dev);
> +
>          cs_line =3D qdev_get_gpio_in_named(flash_dev, SSI_GPIO_CS, 0);
> =20
>          sysbus_connect_irq(SYS_BUS_DEVICE(&s->soc.spi[i]), 1, cs_line)=
;
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index e6f6e23fb71d..7d1c34a1a2d1 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -881,7 +881,6 @@ static uint32_t m25p80_transfer8(SSISlave *ss, uint=
32_t tx)
> =20
>  static void m25p80_realize(SSISlave *ss, Error **errp)
>  {
> -    DriveInfo *dinfo;
>      Flash *s =3D M25P80(ss);
>      M25P80Class *mc =3D M25P80_GET_CLASS(s);
> =20
> @@ -890,14 +889,8 @@ static void m25p80_realize(SSISlave *ss, Error **e=
rrp)
>      s->size =3D s->pi->sector_size * s->pi->n_sectors;
>      s->dirty_page =3D -1;
> =20
> -    /* FIXME use a qdev drive property instead of drive_get_next() */
> -    dinfo =3D drive_get_next(IF_MTD);
> -
> -    if (dinfo) {
> +    if (s->blk) {
>          DB_PRINT_L(0, "Binding to IF_MTD drive\n");
> -        s->blk =3D blk_by_legacy_dinfo(dinfo);
> -        blk_attach_dev_nofail(s->blk, s);
> -
>          s->storage =3D blk_blockalign(s->blk, s->size);
> =20
>          if (blk_pread(s->blk, 0, s->storage, s->size) !=3D s->size) {
> @@ -925,6 +918,7 @@ static void m25p80_pre_save(void *opaque)
> =20
>  static Property m25p80_properties[] =3D {
>      DEFINE_PROP_UINT32("nonvolatile-cfg", Flash, nonvolatile_cfg, 0x8F=
FF),
> +    DEFINE_PROP_DRIVE("drive", Flash, blk),
>      DEFINE_PROP_END_OF_LIST(),
>  };
> =20
> diff --git a/hw/microblaze/petalogix_ml605_mmu.c b/hw/microblaze/petalo=
gix_ml605_mmu.c
> index 07527b677b37..4968bdbb2821 100644
> --- a/hw/microblaze/petalogix_ml605_mmu.c
> +++ b/hw/microblaze/petalogix_ml605_mmu.c
> @@ -191,9 +191,16 @@ petalogix_ml605_init(MachineState *machine)
>          spi =3D (SSIBus *)qdev_get_child_bus(dev, "spi");
> =20
>          for (i =3D 0; i < NUM_SPI_FLASHES; i++) {
> +            DriveInfo *dinfo =3D drive_get_next(IF_MTD);
>              qemu_irq cs_line;
> =20
> -            dev =3D ssi_create_slave(spi, "n25q128");
> +            dev =3D ssi_create_slave_no_init(spi, "n25q128");
> +            if (dinfo) {
> +                qdev_prop_set_drive(dev, "drive", blk_by_legacy_dinfo(=
dinfo),
> +                                    &error_fatal);
> +            }
> +            qdev_init_nofail(dev);
> +
>              cs_line =3D qdev_get_gpio_in_named(dev, SSI_GPIO_CS, 0);
>              sysbus_connect_irq(busdev, i+1, cs_line);
>          }
>=20
