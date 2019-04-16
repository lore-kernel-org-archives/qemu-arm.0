Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3931045wrx;
        Tue, 16 Apr 2019 06:31:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzVoBVGSG9nauYXXcTfVR5k718Jjk/AdU4eksllZYxPs7y8M3pAR5nrSkrlHBpj+PLOk2l+
X-Received: by 2002:a1c:d1c5:: with SMTP id i188mr25704522wmg.8.1555421460875;
        Tue, 16 Apr 2019 06:31:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555421460; cv=none;
        d=google.com; s=arc-20160816;
        b=bUI8U8XUuj1IcUp6iBrTQcMftIWd9WKTZGYoBw/r8k3L0+mksrIIl5NfThEh4B+Gja
         jEgZ7FHzwEREu+sSsiljxz1uY1eLMjg2vZOdyIpGyY792FcXet8r83u7W3fh/QfSSeZx
         piELiayNMI1yaHKWLdFtXJgDHYHx+HpJbyyv1XMIwaKorGt0VJpit5rArSfrdnNoH1WI
         zF/uRceYrlbS0akpvOuB5mZ59xGMnuWSBa1DhWMpedoi8QinhNPSR3IGht9H3JJIs+fm
         rTQEliYXsntucNZBajpoIkyFP6MFDUzHAt0RkgY7fEdNcVmP99BeOA2pMHQXf96UrTjv
         YeWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=oRvux9FLpWRNe1b8NX/ljLICEroe0BXnjMIPaLoujdA=;
        b=m5OQk9q+d5XQK4Z+TkfsQB0KBq4RyHgBIYdp/7++1FiKTOZ2G+KJCVgA+mzpZO7jRd
         6Pf6zkrXdDCSZOTjGKIljk5QLGNuw1829C0auWvUSQI/jHvc1vTuHC9UP3SDaqFOEFpr
         hKtYGuLvwt50nlkD4AQoc+RQhEb2USUyVYBgV+EAo5wkfny/LT9Ftjyo8mBSKXDr4i5G
         Fj7hBhEd1SijYeSxENxZH/Nex9d+5Ly5tQUAv/1Ui7AoShdyhmHLKSoZGqRifALiN0Bv
         Ghx8H2yoFmh2EjvFKSBAF9CUqlMlcPftj51gxFLxzcTVu5j8axMFmh1qxaHS5W60Z9WM
         d7Ew==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l1si13105750wme.81.2019.04.16.06.31.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Apr 2019 06:31:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:36979 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hGOAt-0005cA-RW
	for alex.bennee@linaro.org; Tue, 16 Apr 2019 09:30:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42328)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1hGO6j-0002I4-Op
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 09:26:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1hGO6g-0007Rx-5r
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 09:26:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59876)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1hGO6f-0007RG-Qx; Tue, 16 Apr 2019 09:26:38 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 008DA309267B;
	Tue, 16 Apr 2019 13:26:37 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-171.rdu2.redhat.com
	[10.10.120.171])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8D3E2608C2;
	Tue, 16 Apr 2019 13:26:32 +0000 (UTC)
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20190416091348.26075-1-armbru@redhat.com>
	<20190416091348.26075-4-armbru@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <43811161-397d-0e3e-c618-516d54daa517@redhat.com>
Date: Tue, 16 Apr 2019 15:26:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190416091348.26075-4-armbru@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Tue, 16 Apr 2019 13:26:37 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 3/3] hw/arm/virt: Support firmware
 configuration with -blockdev
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-block@nongnu.org,
	mreitz@redhat.com, qemu-arm@nongnu.org, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ffxXyylseTnm

comparing this with v1...

On 04/16/19 11:13, Markus Armbruster wrote:
> The ARM virt machines put firmware in flash memory.  To configure it,
> you use -drive if=3Dpflash,unit=3D0,... and optionally -drive
> if=3Dpflash,unit=3D1,...
>=20
> Why two -drive?  This permits setting up one part of the flash memory
> read-only, and the other part read/write.  It also makes upgrading
> firmware on the host easier.  Below the hood, we get two separate
> flash devices, because we were too lazy to improve our flash device
> models to support sector protection.
>=20
> The problem at hand is to do the same with -blockdev somehow, as one
> more step towards deprecating -drive.
>=20
> We recently solved this problem for x86 PC machines, in commit
> ebc29e1beab.  See the commit message for design rationale.
>=20
> This commit solves it for ARM virt basically the same way: new machine
> properties pflash0, pflash1 forward to the onboard flash devices'
> properties.  Requires creating the onboard devices in the
> .instance_init() method virt_instance_init().  The existing code to
> pick up drives defined with -drive if=3Dpflash is replaced by code to
> desugar into the machine properties.
>=20
> There are a few behavioral differences, though:
>=20
> * The flash devices are always present (x86: only present if
>   configured)
>=20
> * Flash base addresses and sizes are fixed (x86: sizes depend on
>   images, mapped back to back below a fixed address)
>=20
> * -bios configures contents of first pflash (x86: -bios configures ROM
>    contents)
>=20
> * -bios is rejected when first pflash is also configured with -machine
>    pflash0=3D... (x86: bios is silently ignored then)
>=20
> * -machine pflash1=3D... does not require -machine pflash0=3D... (x86: =
it
>    does).
>=20
> The actual code is a bit simpler than for x86 mostly due to the first
> two differences.
>=20
> Before the patch, all the action is in create_flash(), called from the
> machine's .init() method machvirt_init():
>=20
>     main()
>         machine_run_board_init()
>             machvirt_init()
>                 create_flash()
>                     create_one_flash() for flash[0]
>                         create
>                         configure
>                             includes obeying -drive if=3Dpflash,unit=3D=
0
>                         realize
>                         map
>                         fall back to -bios
>                     create_one_flash() for flash[1]
>                         create
>                         configure
>                             includes obeying -drive if=3Dpflash,unit=3D=
1
>                         realize
>                         map
>                     update FDT
>=20
> To make the machine properties work, we need to move device creation
> to its .instance_init() method virt_instance_init().
>=20
> Another complication is machvirt_init()'s computation of
> @firmware_loaded: it predicts what create_flash() will do.  Instead of
> predicting what create_flash()'s replacement virt_firmware_init() will
> do, I decided to have virt_firmware_init() return what it did.
> Requires calling it a bit earlier.
>=20
> Resulting call tree:
>=20
>     main()
>         current_machine =3D object_new()
>             ...
>                 virt_instance_init()
>                     virt_flash_create()
>                         virt_flash_create1() for flash[0]
>                             create
>                             configure: set defaults
>                             become child of machine [NEW]
>                             add machine prop pflash0 as alias for drive=
 [NEW]
>                         virt_flash_create1() for flash[1]
>                             create
>                             configure: set defaults
>                             become child of machine [NEW]
>                             add machine prop pflash1 as alias for drive=
 [NEW]
>         for all machine props from the command line: machine_set_proper=
ty()
>             ...
>                 property_set_alias() for machine props pflash0, pflash1
>                     ...
>                         set_drive() for cfi.pflash01 prop drive
>                             this is how -machine pflash0=3D... etc set
>         machine_run_board_init(current_machine);
>             virt_firmware_init()
>                 pflash_cfi01_legacy_drive()
>                     legacy -drive if=3Dpflash,unit=3D0 and =3D1 [NEW]
>                 virt_flash_map()
>                     virt_flash_map1() for flash[0]
>                         configure: num-blocks
>                         realize
>                         map
>                     virt_flash_map1() for flash[1]
>                         configure: num-blocks
>                         realize
>                         map
>                 fall back to -bios
>             virt_flash_fdt()
>                 update FDT

Thanks for elaborating the call tree in even more detail :)

>=20
> You have L=C3=A1szl=C3=B3 to thank for making me explain this in detail=
.

... as long as it's not s/thank/curse/ ;)

>=20
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Acked-by: Laszlo Ersek <lersek@redhat.com>
> ---
>  hw/arm/virt.c         | 198 +++++++++++++++++++++++++++---------------
>  include/hw/arm/virt.h |   2 +
>  2 files changed, 130 insertions(+), 70 deletions(-)
>=20
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index ce2664a30b..3b7b5eb429 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -30,6 +30,7 @@
> =20
>  #include "qemu/osdep.h"
>  #include "qemu/units.h"
> +#include "qemu/option.h"
>  #include "qapi/error.h"
>  #include "hw/sysbus.h"
>  #include "hw/arm/arm.h"
> @@ -871,25 +872,19 @@ static void create_virtio_devices(const VirtMachi=
neState *vms, qemu_irq *pic)
>      }
>  }
> =20
> -static void create_one_flash(const char *name, hwaddr flashbase,
> -                             hwaddr flashsize, const char *file,
> -                             MemoryRegion *sysmem)
> +#define VIRT_FLASH_SECTOR_SIZE (256 * KiB)
> +
> +static PFlashCFI01 *virt_flash_create1(VirtMachineState *vms,

OK, I'm noticing the rename from "virt_pflash_create1".

> +                                        const char *name,
> +                                        const char *alias_prop_name)
>  {
> -    /* Create and map a single flash device. We use the same
> -     * parameters as the flash devices on the Versatile Express board.
> +    /*
> +     * Create a single flash device.  We use the same parameters as
> +     * the flash devices on the Versatile Express board.
>       */
> -    DriveInfo *dinfo =3D drive_get_next(IF_PFLASH);
>      DeviceState *dev =3D qdev_create(NULL, TYPE_PFLASH_CFI01);
> -    SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
> -    const uint64_t sectorlength =3D 256 * 1024;
> =20
> -    if (dinfo) {
> -        qdev_prop_set_drive(dev, "drive", blk_by_legacy_dinfo(dinfo),
> -                            &error_abort);
> -    }
> -
> -    qdev_prop_set_uint32(dev, "num-blocks", flashsize / sectorlength);
> -    qdev_prop_set_uint64(dev, "sector-length", sectorlength);
> +    qdev_prop_set_uint64(dev, "sector-length", VIRT_FLASH_SECTOR_SIZE)=
;
>      qdev_prop_set_uint8(dev, "width", 4);
>      qdev_prop_set_uint8(dev, "device-width", 2);
>      qdev_prop_set_bit(dev, "big-endian", false);
> @@ -898,41 +893,41 @@ static void create_one_flash(const char *name, hw=
addr flashbase,
>      qdev_prop_set_uint16(dev, "id2", 0x00);
>      qdev_prop_set_uint16(dev, "id3", 0x00);
>      qdev_prop_set_string(dev, "name", name);
> +    object_property_add_child(OBJECT(vms), name, OBJECT(dev),
> +                              &error_abort);
> +    object_property_add_alias(OBJECT(vms), alias_prop_name,
> +                              OBJECT(dev), "drive", &error_abort);
> +    return PFLASH_CFI01(dev);
> +}
> +
> +static void virt_flash_create(VirtMachineState *vms)
> +{
> +    vms->flash[0] =3D virt_flash_create1(vms, "virt.flash0", "pflash0"=
);
> +    vms->flash[1] =3D virt_flash_create1(vms, "virt.flash1", "pflash1"=
);
> +}
> +
> +static void virt_flash_map1(PFlashCFI01 *flash,
> +                            hwaddr base, hwaddr size,
> +                            MemoryRegion *sysmem)
> +{
> +    DeviceState *dev =3D DEVICE(flash);
> +
> +    assert(size % VIRT_FLASH_SECTOR_SIZE =3D=3D 0);
> +    assert(size / VIRT_FLASH_SECTOR_SIZE <=3D UINT32_MAX);
> +    qdev_prop_set_uint32(dev, "num-blocks", size / VIRT_FLASH_SECTOR_S=
IZE);
>      qdev_init_nofail(dev);
> =20
> -    memory_region_add_subregion(sysmem, flashbase,
> -                                sysbus_mmio_get_region(SYS_BUS_DEVICE(=
dev), 0));
> -
> -    if (file) {
> -        char *fn;
> -        int image_size;
> -
> -        if (drive_get(IF_PFLASH, 0, 0)) {
> -            error_report("The contents of the first flash device may b=
e "
> -                         "specified with -bios or with -drive if=3Dpfl=
ash... "
> -                         "but you cannot use both options at once");
> -            exit(1);
> -        }
> -        fn =3D qemu_find_file(QEMU_FILE_TYPE_BIOS, file);
> -        if (!fn) {
> -            error_report("Could not find ROM image '%s'", file);
> -            exit(1);
> -        }
> -        image_size =3D load_image_mr(fn, sysbus_mmio_get_region(sbd, 0=
));
> -        g_free(fn);
> -        if (image_size < 0) {
> -            error_report("Could not load ROM image '%s'", file);
> -            exit(1);
> -        }
> -    }
> +    memory_region_add_subregion(sysmem, base,
> +                                sysbus_mmio_get_region(SYS_BUS_DEVICE(=
dev),
> +                                                       0));
>  }
> =20
> -static void create_flash(const VirtMachineState *vms,
> -                         MemoryRegion *sysmem,
> -                         MemoryRegion *secure_sysmem)
> +static void virt_flash_map(VirtMachineState *vms,
> +                           MemoryRegion *sysmem,
> +                           MemoryRegion *secure_sysmem)
>  {
> -    /* Create two flash devices to fill the VIRT_FLASH space in the me=
mmap.
> -     * Any file passed via -bios goes in the first of these.
> +    /*
> +     * Map two flash devices to fill the VIRT_FLASH space in the memma=
p.
>       * sysmem is the system memory space. secure_sysmem is the secure =
view
>       * of the system, and the first flash device should be made visibl=
e only
>       * there. The second flash device is visible to both secure and no=
nsecure.
> @@ -941,13 +936,21 @@ static void create_flash(const VirtMachineState *=
vms,
>       */
>      hwaddr flashsize =3D vms->memmap[VIRT_FLASH].size / 2;
>      hwaddr flashbase =3D vms->memmap[VIRT_FLASH].base;
> +
> +    virt_flash_map1(vms->flash[0], flashbase, flashsize,
> +                    secure_sysmem);
> +    virt_flash_map1(vms->flash[1], flashbase + flashsize, flashsize,
> +                    sysmem);
> +}
> +
> +static void virt_flash_fdt(VirtMachineState *vms,
> +                           MemoryRegion *sysmem,
> +                           MemoryRegion *secure_sysmem)
> +{
> +    hwaddr flashsize =3D vms->memmap[VIRT_FLASH].size / 2;
> +    hwaddr flashbase =3D vms->memmap[VIRT_FLASH].base;
>      char *nodename;
> =20
> -    create_one_flash("virt.flash0", flashbase, flashsize,
> -                     bios_name, secure_sysmem);
> -    create_one_flash("virt.flash1", flashbase + flashsize, flashsize,
> -                     NULL, sysmem);
> -
>      if (sysmem =3D=3D secure_sysmem) {
>          /* Report both flash devices as a single node in the DT */
>          nodename =3D g_strdup_printf("/flash@%" PRIx64, flashbase);
> @@ -959,7 +962,8 @@ static void create_flash(const VirtMachineState *vm=
s,
>          qemu_fdt_setprop_cell(vms->fdt, nodename, "bank-width", 4);
>          g_free(nodename);
>      } else {
> -        /* Report the devices as separate nodes so we can mark one as
> +        /*
> +         * Report the devices as separate nodes so we can mark one as
>           * only visible to the secure world.
>           */
>          nodename =3D g_strdup_printf("/secflash@%" PRIx64, flashbase);
> @@ -982,6 +986,54 @@ static void create_flash(const VirtMachineState *v=
ms,
>      }
>  }
> =20
> +static bool virt_firmware_init(VirtMachineState *vms,
> +                               MemoryRegion *sysmem,
> +                               MemoryRegion *secure_sysmem)
> +{
> +    int i;
> +    BlockBackend *pflash_blk0;
> +
> +    /* Map legacy -drive if=3Dpflash to machine properties */
> +    for (i =3D 0; i < ARRAY_SIZE(vms->flash); i++) {
> +        pflash_cfi01_legacy_drive(vms->flash[i],
> +                                  drive_get(IF_PFLASH, 0, i));
> +    }

And this v1->v2 update is due to the pflash_cfi01_legacy_drive()
contract change in v2 (i.e. the last two patches in this series).

No other changes that I can see. My ACK stands.

Thank you!
Laszlo

> +
> +    virt_flash_map(vms, sysmem, secure_sysmem);
> +
> +    pflash_blk0 =3D pflash_cfi01_get_blk(vms->flash[0]);
> +
> +    if (bios_name) {
> +        char *fname;
> +        MemoryRegion *mr;
> +        int image_size;
> +
> +        if (pflash_blk0) {
> +            error_report("The contents of the first flash device may b=
e "
> +                         "specified with -bios or with -drive if=3Dpfl=
ash... "
> +                         "but you cannot use both options at once");
> +            exit(1);
> +        }
> +
> +        /* Fall back to -bios */
> +
> +        fname =3D qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
> +        if (!fname) {
> +            error_report("Could not find ROM image '%s'", bios_name);
> +            exit(1);
> +        }
> +        mr =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(vms->flash[0]), 0=
);
> +        image_size =3D load_image_mr(fname, mr);
> +        g_free(fname);
> +        if (image_size < 0) {
> +            error_report("Could not load ROM image '%s'", bios_name);
> +            exit(1);
> +        }
> +    }
> +
> +    return pflash_blk0 || bios_name;
> +}
> +
>  static FWCfgState *create_fw_cfg(const VirtMachineState *vms, AddressS=
pace *as)
>  {
>      hwaddr base =3D vms->memmap[VIRT_FW_CFG].base;
> @@ -1421,7 +1473,7 @@ static void machvirt_init(MachineState *machine)
>      MemoryRegion *secure_sysmem =3D NULL;
>      int n, virt_max_cpus;
>      MemoryRegion *ram =3D g_new(MemoryRegion, 1);
> -    bool firmware_loaded =3D bios_name || drive_get(IF_PFLASH, 0, 0);
> +    bool firmware_loaded;
>      bool aarch64 =3D true;
> =20
>      /*
> @@ -1460,6 +1512,27 @@ static void machvirt_init(MachineState *machine)
>          exit(1);
>      }
> =20
> +    if (vms->secure) {
> +        if (kvm_enabled()) {
> +            error_report("mach-virt: KVM does not support Security ext=
ensions");
> +            exit(1);
> +        }
> +
> +        /*
> +         * The Secure view of the world is the same as the NonSecure,
> +         * but with a few extra devices. Create it as a container regi=
on
> +         * containing the system memory at low priority; any secure-on=
ly
> +         * devices go in at higher priority and take precedence.
> +         */
> +        secure_sysmem =3D g_new(MemoryRegion, 1);
> +        memory_region_init(secure_sysmem, OBJECT(machine), "secure-mem=
ory",
> +                           UINT64_MAX);
> +        memory_region_add_subregion_overlap(secure_sysmem, 0, sysmem, =
-1);
> +    }
> +
> +    firmware_loaded =3D virt_firmware_init(vms, sysmem,
> +                                         secure_sysmem ?: sysmem);
> +
>      /* If we have an EL3 boot ROM then the assumption is that it will
>       * implement PSCI itself, so disable QEMU's internal implementatio=
n
>       * so it doesn't get in the way. Instead of starting secondary
> @@ -1505,23 +1578,6 @@ static void machvirt_init(MachineState *machine)
>          exit(1);
>      }
> =20
> -    if (vms->secure) {
> -        if (kvm_enabled()) {
> -            error_report("mach-virt: KVM does not support Security ext=
ensions");
> -            exit(1);
> -        }
> -
> -        /* The Secure view of the world is the same as the NonSecure,
> -         * but with a few extra devices. Create it as a container regi=
on
> -         * containing the system memory at low priority; any secure-on=
ly
> -         * devices go in at higher priority and take precedence.
> -         */
> -        secure_sysmem =3D g_new(MemoryRegion, 1);
> -        memory_region_init(secure_sysmem, OBJECT(machine), "secure-mem=
ory",
> -                           UINT64_MAX);
> -        memory_region_add_subregion_overlap(secure_sysmem, 0, sysmem, =
-1);
> -    }
> -
>      create_fdt(vms);
> =20
>      possible_cpus =3D mc->possible_cpu_arch_ids(machine);
> @@ -1610,7 +1666,7 @@ static void machvirt_init(MachineState *machine)
>                                      &machine->device_memory->mr);
>      }
> =20
> -    create_flash(vms, sysmem, secure_sysmem ? secure_sysmem : sysmem);
> +    virt_flash_fdt(vms, sysmem, secure_sysmem);
> =20
>      create_gic(vms, pic);
> =20
> @@ -1956,6 +2012,8 @@ static void virt_instance_init(Object *obj)
>                                      NULL);
> =20
>      vms->irqmap =3D a15irqmap;
> +
> +    virt_flash_create(vms);
>  }
> =20
>  static const TypeInfo virt_machine_info =3D {
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 507517c603..424070924e 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -35,6 +35,7 @@
>  #include "qemu/notify.h"
>  #include "hw/boards.h"
>  #include "hw/arm/arm.h"
> +#include "hw/block/flash.h"
>  #include "sysemu/kvm.h"
>  #include "hw/intc/arm_gicv3_common.h"
> =20
> @@ -113,6 +114,7 @@ typedef struct {
>      Notifier machine_done;
>      DeviceState *platform_bus_dev;
>      FWCfgState *fw_cfg;
> +    PFlashCFI01 *flash[2];
>      bool secure;
>      bool highmem;
>      bool highmem_ecam;
>=20

