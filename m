Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3658742wrx;
        Mon, 25 Mar 2019 03:01:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyFHHr95UED/d5awYhyLMs6Icqseyqk0KrHgSTV7JtqLnMJjVMIud0240yy9Vi1C+yMviUi
X-Received: by 2002:a25:d38c:: with SMTP id e134mr18852008ybf.192.1553508118728;
        Mon, 25 Mar 2019 03:01:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553508118; cv=none;
        d=google.com; s=arc-20160816;
        b=Iks9cmqI69QOswFZ37iHctjoodPWfph24D8MSdHDZFrOHlVyaUuDsxk7yM+AbMwBvY
         Cq3sIqQBcIzDoT+B+Ni9zSjcgKmU/DHbaaIwp3kkZGfSmfQw3w4LVEVOiZ6LB7WM4gGC
         ZV4FlF1ZCL/aS5dOtrkjjiXyAnvwdb9R0z4a6JEMVyNbadChF5tHtkmKMysqwmHGELpk
         aKyPHXlOLmmzfScuj5Ztj78RZvshItQ8L8wtlHbCN74/2xoisnGmw1uoArGguEhnCJxa
         K791U1PZawa/ubT6mlhzOSLQ1idQGjRMqdrMWVt+dxqmH1WH3MHPC8akwXf4AoUItq1/
         J+qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=h7qrVsv1Kby9UmgJmWeGB2RqDH+/tKdrGXDFpfD3m/c=;
        b=B5gzzCQZMWfKDWOOHwbUEPGdHI9S3HTgb3JWAEpYvKXhNQ+Tq51FwrFrG5uHnDZmcG
         Tsq6f0FhELwHaHbIuidiBX0HXJiqIi6Wjarb9OXoiEB7zqALYJWfpl/jmr0QSlJzDE4G
         dishkIzIh9t578UsByCW/X8loKJLsoiWCm76n0PzckoOdoiNlkfATpgzsuwJfbLH4yyq
         vGncmH5oi3lBEXI/Z4KvYc4sV+bp9aBDb4+H5rqS8k5Pta/tHmADqlnhfSnKXBxQHpI0
         F/g6aJy4Y0AXnwMj3Yod/9yOn2WCojOHKSJF/hCmQh99WNneNFguiSyUD3sPp0ZePgxV
         2Olw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m132si9403473ywc.124.2019.03.25.03.01.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Mar 2019 03:01:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:39600 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h8MQX-0003Tl-SD
	for alex.bennee@linaro.org; Mon, 25 Mar 2019 06:01:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46121)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h8MPq-0003HL-Jf
	for qemu-arm@nongnu.org; Mon, 25 Mar 2019 06:01:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h8MPm-0002re-9t
	for qemu-arm@nongnu.org; Mon, 25 Mar 2019 06:01:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54752)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1h8MPm-0002rI-0G; Mon, 25 Mar 2019 06:01:10 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 56DFC3086212;
	Mon, 25 Mar 2019 09:55:09 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 70A041001DC8;
	Mon, 25 Mar 2019 09:55:05 +0000 (UTC)
Date: Mon, 25 Mar 2019 10:55:04 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Message-ID: <20190325105504.171400e2@redhat.com>
In-Reply-To: <20190325055910.15449-1-richardw.yang@linux.intel.com>
References: <20190325055910.15449-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Mon, 25 Mar 2019 09:55:09 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v5] hw/acpi: extract acpi_add_rom_blob()
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
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, mst@redhat.com,
	qemu-devel@nongnu.org, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pvk3Ok3fkTV0

On Mon, 25 Mar 2019 13:59:10 +0800
Wei Yang <richardw.yang@linux.intel.com> wrote:

> arm and i386 has almost the same function acpi_add_rom_blob(), except
> giving different FWCfgCallback function.
>=20
> This patch moves acpi_add_rom_blob() to utils.c by passing
> FWCfgCallback to it.
>=20
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
>=20
> ---
> v5:
>   * remove unnecessary header glib/gprintf.h
>   * rearrange include header to make it more suitable
> v4:
>   * extract -> moves
>   * adjust comment in source to make checkpatch happy
> v3:
>   * put acpi_add_rom_blob() to hw/acpi/utils.c
> v2:
>   * remove unused header in original source file
> ---
>  hw/acpi/Makefile.objs    |  2 +-
>  hw/acpi/utils.c          | 36 ++++++++++++++++++++++++++++++++++++
>  hw/arm/virt-acpi-build.c | 26 ++++++++++----------------
>  hw/i386/acpi-build.c     | 26 ++++++++++----------------
>  include/hw/acpi/utils.h  |  9 +++++++++
>  5 files changed, 66 insertions(+), 33 deletions(-)
>  create mode 100644 hw/acpi/utils.c
>  create mode 100644 include/hw/acpi/utils.h
>=20
> diff --git a/hw/acpi/Makefile.objs b/hw/acpi/Makefile.objs
> index 2d46e3789a..ba93c5b64a 100644
> --- a/hw/acpi/Makefile.objs
> +++ b/hw/acpi/Makefile.objs
> @@ -10,7 +10,7 @@ common-obj-$(call lnot,$(CONFIG_ACPI_X86)) +=3D acpi-st=
ub.o
> =20
>  common-obj-y +=3D acpi_interface.o
>  common-obj-y +=3D bios-linker-loader.o
> -common-obj-y +=3D aml-build.o
> +common-obj-y +=3D aml-build.o utils.o
>  common-obj-$(CONFIG_TPM) +=3D tpm.o
> =20
>  common-obj-$(CONFIG_IPMI) +=3D ipmi.o
> diff --git a/hw/acpi/utils.c b/hw/acpi/utils.c
> new file mode 100644
> index 0000000000..7a890cca06
> --- /dev/null
> +++ b/hw/acpi/utils.c
> @@ -0,0 +1,36 @@
> +/*
> + * Utilities for generating ACPI tables and passing them to Guests
> + *
> + * Copyright (C) 2019 Intel Corporation
> + * Copyright (C) 2019 Red Hat Inc
> + *
> + * Author: Wei Yang <richardw.yang@linux.intel.com>
> + * Author: Igor Mammedov <imammedo@redhat.com>

=46rom history it looks like Michael was an original author and
then Shanon copied approach for ARM.
So put Michael instead of me.

with that fixed up

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> +
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> +
> + * You should have received a copy of the GNU General Public License alo=
ng
> + * with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/acpi/aml-build.h"
> +#include "hw/acpi/utils.h"
> +#include "hw/loader.h"
> +
> +MemoryRegion *acpi_add_rom_blob(FWCfgCallback update, void *opaque,
> +                                GArray *blob, const char *name,
> +                                uint64_t max_size)
> +{
> +    return rom_add_blob(name, blob->data, acpi_data_len(blob), max_size,=
 -1,
> +                        name, update, opaque, NULL, true);
> +}
> +
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 57679a89bf..a846f74a14 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -37,9 +37,9 @@
>  #include "hw/acpi/acpi.h"
>  #include "hw/nvram/fw_cfg.h"
>  #include "hw/acpi/bios-linker-loader.h"
> -#include "hw/loader.h"
>  #include "hw/hw.h"
>  #include "hw/acpi/aml-build.h"
> +#include "hw/acpi/utils.h"
>  #include "hw/pci/pcie_host.h"
>  #include "hw/pci/pci.h"
>  #include "hw/arm/virt.h"
> @@ -881,14 +881,6 @@ static void virt_acpi_build_reset(void *build_opaque)
>      build_state->patched =3D false;
>  }
> =20
> -static MemoryRegion *acpi_add_rom_blob(AcpiBuildState *build_state,
> -                                       GArray *blob, const char *name,
> -                                       uint64_t max_size)
> -{
> -    return rom_add_blob(name, blob->data, acpi_data_len(blob), max_size,=
 -1,
> -                        name, virt_acpi_build_update, build_state, NULL,=
 true);
> -}
> -
>  static const VMStateDescription vmstate_virt_acpi_build =3D {
>      .name =3D "virt_acpi_build",
>      .version_id =3D 1,
> @@ -920,20 +912,22 @@ void virt_acpi_setup(VirtMachineState *vms)
>      virt_acpi_build(vms, &tables);
> =20
>      /* Now expose it all to Guest */
> -    build_state->table_mr =3D acpi_add_rom_blob(build_state, tables.tabl=
e_data,
> -                                               ACPI_BUILD_TABLE_FILE,
> -                                               ACPI_BUILD_TABLE_MAX_SIZE=
);
> +    build_state->table_mr =3D acpi_add_rom_blob(virt_acpi_build_update,
> +                                              build_state, tables.table_=
data,
> +                                              ACPI_BUILD_TABLE_FILE,
> +                                              ACPI_BUILD_TABLE_MAX_SIZE);
>      assert(build_state->table_mr !=3D NULL);
> =20
>      build_state->linker_mr =3D
> -        acpi_add_rom_blob(build_state, tables.linker->cmd_blob,
> -                          "etc/table-loader", 0);
> +        acpi_add_rom_blob(virt_acpi_build_update, build_state,
> +                          tables.linker->cmd_blob, "etc/table-loader", 0=
);
> =20
>      fw_cfg_add_file(vms->fw_cfg, ACPI_BUILD_TPMLOG_FILE, tables.tcpalog-=
>data,
>                      acpi_data_len(tables.tcpalog));
> =20
> -    build_state->rsdp_mr =3D acpi_add_rom_blob(build_state, tables.rsdp,
> -                                              ACPI_BUILD_RSDP_FILE, 0);
> +    build_state->rsdp_mr =3D acpi_add_rom_blob(virt_acpi_build_update,
> +                                             build_state, tables.rsdp,
> +                                             ACPI_BUILD_RSDP_FILE, 0);
> =20
>      qemu_register_reset(virt_acpi_build_reset, build_state);
>      virt_acpi_build_reset(build_state);
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 416da318ae..b17d4a711d 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -37,7 +37,6 @@
>  #include "hw/acpi/cpu.h"
>  #include "hw/nvram/fw_cfg.h"
>  #include "hw/acpi/bios-linker-loader.h"
> -#include "hw/loader.h"
>  #include "hw/isa/isa.h"
>  #include "hw/block/fdc.h"
>  #include "hw/acpi/memory_hotplug.h"
> @@ -58,6 +57,7 @@
>  #include "hw/i386/x86-iommu.h"
> =20
>  #include "hw/acpi/aml-build.h"
> +#include "hw/acpi/utils.h"
> =20
>  #include "qom/qom-qobject.h"
>  #include "hw/i386/amd_iommu.h"
> @@ -2842,14 +2842,6 @@ static void acpi_build_reset(void *build_opaque)
>      build_state->patched =3D 0;
>  }
> =20
> -static MemoryRegion *acpi_add_rom_blob(AcpiBuildState *build_state,
> -                                       GArray *blob, const char *name,
> -                                       uint64_t max_size)
> -{
> -    return rom_add_blob(name, blob->data, acpi_data_len(blob), max_size,=
 -1,
> -                        name, acpi_build_update, build_state, NULL, true=
);
> -}
> -
>  static const VMStateDescription vmstate_acpi_build =3D {
>      .name =3D "acpi_build",
>      .version_id =3D 1,
> @@ -2891,14 +2883,15 @@ void acpi_setup(void)
>      acpi_build(&tables, MACHINE(pcms));
> =20
>      /* Now expose it all to Guest */
> -    build_state->table_mr =3D acpi_add_rom_blob(build_state, tables.tabl=
e_data,
> -                                               ACPI_BUILD_TABLE_FILE,
> -                                               ACPI_BUILD_TABLE_MAX_SIZE=
);
> +    build_state->table_mr =3D acpi_add_rom_blob(acpi_build_update,
> +                                              build_state, tables.table_=
data,
> +                                              ACPI_BUILD_TABLE_FILE,
> +                                              ACPI_BUILD_TABLE_MAX_SIZE);
>      assert(build_state->table_mr !=3D NULL);
> =20
>      build_state->linker_mr =3D
> -        acpi_add_rom_blob(build_state, tables.linker->cmd_blob,
> -                          "etc/table-loader", 0);
> +        acpi_add_rom_blob(acpi_build_update, build_state,
> +                          tables.linker->cmd_blob, "etc/table-loader", 0=
);
> =20
>      fw_cfg_add_file(pcms->fw_cfg, ACPI_BUILD_TPMLOG_FILE,
>                      tables.tcpalog->data, acpi_data_len(tables.tcpalog));
> @@ -2935,8 +2928,9 @@ void acpi_setup(void)
>          build_state->rsdp_mr =3D NULL;
>      } else {
>          build_state->rsdp =3D NULL;
> -        build_state->rsdp_mr =3D acpi_add_rom_blob(build_state, tables.r=
sdp,
> -                                                  ACPI_BUILD_RSDP_FILE, =
0);
> +        build_state->rsdp_mr =3D acpi_add_rom_blob(acpi_build_update,
> +                                                 build_state, tables.rsd=
p,
> +                                                 ACPI_BUILD_RSDP_FILE, 0=
);
>      }
> =20
>      qemu_register_reset(acpi_build_reset, build_state);
> diff --git a/include/hw/acpi/utils.h b/include/hw/acpi/utils.h
> new file mode 100644
> index 0000000000..140b4de603
> --- /dev/null
> +++ b/include/hw/acpi/utils.h
> @@ -0,0 +1,9 @@
> +#ifndef HW_ACPI_UTILS_H
> +#define HW_ACPI_UTILS_H
> +
> +#include "hw/nvram/fw_cfg.h"
> +
> +MemoryRegion *acpi_add_rom_blob(FWCfgCallback update, void *opaque,
> +                                GArray *blob, const char *name,
> +                                uint64_t max_size);
> +#endif

