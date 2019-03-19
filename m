Received: by 2002:a5d:4d11:0:0:0:0:0 with SMTP id z17csp3292259wrt;
        Tue, 19 Mar 2019 02:01:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqymi2GmveiUYDPm2p656FL4WpdysrS8e4TD6U7mUOLE5PZBnMOtFefwmHCiC0mwAsyheeQI
X-Received: by 2002:adf:eed1:: with SMTP id a17mr4260994wrp.268.1552986060218;
        Tue, 19 Mar 2019 02:01:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552986060; cv=none;
        d=google.com; s=arc-20160816;
        b=dllnER+L2VL0t+ze4tYrOmrTIrFYsIiU3iAwZ3lEa0Dtd27qLMJR4Q95DkduWPQ/cp
         Uqk+pxuKIKSCxfdCgzRN0svlHqJJrLbmS7zPMTXsUX1q3K0wQmJ/yVrfhpf1nEcEYBMh
         n9TDlQWcmTuaxteV6h5lionz9Vs53VmHik6zrEgkg8sUtVXmgoVz5beBY7KC7/XFzQCl
         A1TO2uh0xVlGGtcd5mOZM8MJVXObEa5R7z8YEJwU+1IP64ovYFJ16KTF3KsxwOoaxEbZ
         ZBfJU4hWQuVHCG1sAaMgyeR5bZKBb95SFQFtwALYQq3veV87UAQ9YsnKKQqek2BZhN5e
         fAwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=FlSH6BfF5y+kv/fs5tJiIxuvN84wnrMe/X3tNQKZ75E=;
        b=koXxSrE3buLIxepaj0WfUJp5vvm9xT3EY8h4WDtSR0Cj4buKbkwg4kb2UcYGJyXGMZ
         9MhUhbH2DACoBXuYSGgDoOsZ6Le+fx0xIlM1BU8M0qMYZgfHXJxjrdb/6i5nSk1nO/mZ
         WyyoOu5NhvkRw86MOhVG+ygKDK9nRlPFwcjS4i6HqdUbbP06FRP0NezBXT6dkIkA+Q8H
         9nQWWdD16psk8+VEG+KNdyHZuOgy8bJn6w1askgnQXdAjHof/7hoeg0JRugvhxmplEpN
         Rba5ZEiNy5WnVZFZCrVpnXV8v8Y22/hjgNnmJzBEkSV81eZSwDvOGgpSTX9L1h60SA84
         2C/w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y14si7968967wrm.455.2019.03.19.02.01.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Mar 2019 02:01:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:53738 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h6AcF-00078Z-6K
	for alex.bennee@linaro.org; Tue, 19 Mar 2019 05:00:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52574)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h6Ac2-00078C-E6
	for qemu-arm@nongnu.org; Tue, 19 Mar 2019 05:00:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h6Ac0-0006P7-UF
	for qemu-arm@nongnu.org; Tue, 19 Mar 2019 05:00:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53792)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1h6Ac0-0006Mq-Ap; Tue, 19 Mar 2019 05:00:44 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 574C0308FEDE;
	Tue, 19 Mar 2019 09:00:43 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 845E118E2E;
	Tue, 19 Mar 2019 09:00:39 +0000 (UTC)
Date: Tue, 19 Mar 2019 10:00:38 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Message-ID: <20190319100038.6263905f@redhat.com>
In-Reply-To: <20190319004523.GA5032@richard>
References: <20190315004432.3445-1-richardw.yang@linux.intel.com>
	<20190318133912.1c67a304@redhat.com>
	<20190319004523.GA5032@richard>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Tue, 19 Mar 2019 09:00:43 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v3] hw/acpi: extract acpi_add_rom_blob()
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
X-TUID: nKTQuvSKmN8J

On Tue, 19 Mar 2019 08:45:23 +0800
Wei Yang <richardw.yang@linux.intel.com> wrote:

> On Mon, Mar 18, 2019 at 01:39:12PM +0100, Igor Mammedov wrote:
> >On Fri, 15 Mar 2019 08:44:32 +0800
> >Wei Yang <richardw.yang@linux.intel.com> wrote:
> >
> >in subject: s/extract/generalize/
> >  
> >> arm and i386 has almost the same function acpi_add_rom_blob(), except
> >> giving different FWCfgCallback function.
> >> 
> >> This patch extract acpi_add_rom_blob() to utils.c by passing  
> >             s/extract/moves/
> >  
> >> FWCfgCallback to it.
> >> 
> >> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>  
> >
> >otherwise patch looks fine to me,
> >but checkpatch complains about comment style so that needs to be fixed as well
> >  
> 
> BTW, the checkpatch also says
> 
>     WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> 
> Do I need to fix this?
yep, add me and Michael as maintainers for these new files.

> >> ---
> >> v3:
> >>   * put acpi_add_rom_blob() to hw/acpi/utils.c
> >> v2:
> >>   * remove unused header in original source file
> >> ---
> >>  hw/acpi/Makefile.objs    |  2 +-
> >>  hw/acpi/utils.c          | 35 +++++++++++++++++++++++++++++++++++
> >>  hw/arm/virt-acpi-build.c | 26 ++++++++++----------------
> >>  hw/i386/acpi-build.c     | 26 ++++++++++----------------
> >>  include/hw/acpi/utils.h  |  9 +++++++++
> >>  5 files changed, 65 insertions(+), 33 deletions(-)
> >>  create mode 100644 hw/acpi/utils.c
> >>  create mode 100644 include/hw/acpi/utils.h
> >> 
> >> diff --git a/hw/acpi/Makefile.objs b/hw/acpi/Makefile.objs
> >> index 2d46e3789a..ba93c5b64a 100644
> >> --- a/hw/acpi/Makefile.objs
> >> +++ b/hw/acpi/Makefile.objs
> >> @@ -10,7 +10,7 @@ common-obj-$(call lnot,$(CONFIG_ACPI_X86)) += acpi-stub.o
> >>  
> >>  common-obj-y += acpi_interface.o
> >>  common-obj-y += bios-linker-loader.o
> >> -common-obj-y += aml-build.o
> >> +common-obj-y += aml-build.o utils.o
> >>  common-obj-$(CONFIG_TPM) += tpm.o
> >>  
> >>  common-obj-$(CONFIG_IPMI) += ipmi.o
> >> diff --git a/hw/acpi/utils.c b/hw/acpi/utils.c
> >> new file mode 100644
> >> index 0000000000..ab0e064a0e
> >> --- /dev/null
> >> +++ b/hw/acpi/utils.c
> >> @@ -0,0 +1,35 @@
> >> +/* Utilities for generating ACPI tables and passing them to Guests
> >> + *
> >> + * Copyright (C) 2019 Intel Corporation
> >> + * Copyright (C) 2019 Red Hat Inc
> >> + *
> >> + * Author: Wei Yang <richardw.yang@linux.intel.com>
> >> + * Author: Igor Mammedov <imammedo@redhat.com>
> >> + *
> >> + * This program is free software; you can redistribute it and/or modify
> >> + * it under the terms of the GNU General Public License as published by
> >> + * the Free Software Foundation; either version 2 of the License, or
> >> + * (at your option) any later version.
> >> +
> >> + * This program is distributed in the hope that it will be useful,
> >> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> >> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> >> + * GNU General Public License for more details.
> >> +
> >> + * You should have received a copy of the GNU General Public License along
> >> + * with this program; if not, see <http://www.gnu.org/licenses/>.
> >> + */
> >> +
> >> +#include "qemu/osdep.h"
> >> +#include <glib/gprintf.h>
> >> +#include "hw/acpi/aml-build.h"
> >> +#include "hw/acpi/utils.h"
> >> +
> >> +MemoryRegion *acpi_add_rom_blob(FWCfgCallback update, void *opaque,
> >> +                                GArray *blob, const char *name,
> >> +                                uint64_t max_size)
> >> +{
> >> +    return rom_add_blob(name, blob->data, acpi_data_len(blob), max_size, -1,
> >> +                        name, update, opaque, NULL, true);
> >> +}
> >> +
> >> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> >> index 57679a89bf..a846f74a14 100644
> >> --- a/hw/arm/virt-acpi-build.c
> >> +++ b/hw/arm/virt-acpi-build.c
> >> @@ -37,9 +37,9 @@
> >>  #include "hw/acpi/acpi.h"
> >>  #include "hw/nvram/fw_cfg.h"
> >>  #include "hw/acpi/bios-linker-loader.h"
> >> -#include "hw/loader.h"
> >>  #include "hw/hw.h"
> >>  #include "hw/acpi/aml-build.h"
> >> +#include "hw/acpi/utils.h"
> >>  #include "hw/pci/pcie_host.h"
> >>  #include "hw/pci/pci.h"
> >>  #include "hw/arm/virt.h"
> >> @@ -881,14 +881,6 @@ static void virt_acpi_build_reset(void *build_opaque)
> >>      build_state->patched = false;
> >>  }
> >>  
> >> -static MemoryRegion *acpi_add_rom_blob(AcpiBuildState *build_state,
> >> -                                       GArray *blob, const char *name,
> >> -                                       uint64_t max_size)
> >> -{
> >> -    return rom_add_blob(name, blob->data, acpi_data_len(blob), max_size, -1,
> >> -                        name, virt_acpi_build_update, build_state, NULL, true);
> >> -}
> >> -
> >>  static const VMStateDescription vmstate_virt_acpi_build = {
> >>      .name = "virt_acpi_build",
> >>      .version_id = 1,
> >> @@ -920,20 +912,22 @@ void virt_acpi_setup(VirtMachineState *vms)
> >>      virt_acpi_build(vms, &tables);
> >>  
> >>      /* Now expose it all to Guest */
> >> -    build_state->table_mr = acpi_add_rom_blob(build_state, tables.table_data,
> >> -                                               ACPI_BUILD_TABLE_FILE,
> >> -                                               ACPI_BUILD_TABLE_MAX_SIZE);
> >> +    build_state->table_mr = acpi_add_rom_blob(virt_acpi_build_update,
> >> +                                              build_state, tables.table_data,
> >> +                                              ACPI_BUILD_TABLE_FILE,
> >> +                                              ACPI_BUILD_TABLE_MAX_SIZE);
> >>      assert(build_state->table_mr != NULL);
> >>  
> >>      build_state->linker_mr =
> >> -        acpi_add_rom_blob(build_state, tables.linker->cmd_blob,
> >> -                          "etc/table-loader", 0);
> >> +        acpi_add_rom_blob(virt_acpi_build_update, build_state,
> >> +                          tables.linker->cmd_blob, "etc/table-loader", 0);
> >>  
> >>      fw_cfg_add_file(vms->fw_cfg, ACPI_BUILD_TPMLOG_FILE, tables.tcpalog->data,
> >>                      acpi_data_len(tables.tcpalog));
> >>  
> >> -    build_state->rsdp_mr = acpi_add_rom_blob(build_state, tables.rsdp,
> >> -                                              ACPI_BUILD_RSDP_FILE, 0);
> >> +    build_state->rsdp_mr = acpi_add_rom_blob(virt_acpi_build_update,
> >> +                                             build_state, tables.rsdp,
> >> +                                             ACPI_BUILD_RSDP_FILE, 0);
> >>  
> >>      qemu_register_reset(virt_acpi_build_reset, build_state);
> >>      virt_acpi_build_reset(build_state);
> >> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> >> index 416da318ae..b17d4a711d 100644
> >> --- a/hw/i386/acpi-build.c
> >> +++ b/hw/i386/acpi-build.c
> >> @@ -37,7 +37,6 @@
> >>  #include "hw/acpi/cpu.h"
> >>  #include "hw/nvram/fw_cfg.h"
> >>  #include "hw/acpi/bios-linker-loader.h"
> >> -#include "hw/loader.h"
> >>  #include "hw/isa/isa.h"
> >>  #include "hw/block/fdc.h"
> >>  #include "hw/acpi/memory_hotplug.h"
> >> @@ -58,6 +57,7 @@
> >>  #include "hw/i386/x86-iommu.h"
> >>  
> >>  #include "hw/acpi/aml-build.h"
> >> +#include "hw/acpi/utils.h"
> >>  
> >>  #include "qom/qom-qobject.h"
> >>  #include "hw/i386/amd_iommu.h"
> >> @@ -2842,14 +2842,6 @@ static void acpi_build_reset(void *build_opaque)
> >>      build_state->patched = 0;
> >>  }
> >>  
> >> -static MemoryRegion *acpi_add_rom_blob(AcpiBuildState *build_state,
> >> -                                       GArray *blob, const char *name,
> >> -                                       uint64_t max_size)
> >> -{
> >> -    return rom_add_blob(name, blob->data, acpi_data_len(blob), max_size, -1,
> >> -                        name, acpi_build_update, build_state, NULL, true);
> >> -}
> >> -
> >>  static const VMStateDescription vmstate_acpi_build = {
> >>      .name = "acpi_build",
> >>      .version_id = 1,
> >> @@ -2891,14 +2883,15 @@ void acpi_setup(void)
> >>      acpi_build(&tables, MACHINE(pcms));
> >>  
> >>      /* Now expose it all to Guest */
> >> -    build_state->table_mr = acpi_add_rom_blob(build_state, tables.table_data,
> >> -                                               ACPI_BUILD_TABLE_FILE,
> >> -                                               ACPI_BUILD_TABLE_MAX_SIZE);
> >> +    build_state->table_mr = acpi_add_rom_blob(acpi_build_update,
> >> +                                              build_state, tables.table_data,
> >> +                                              ACPI_BUILD_TABLE_FILE,
> >> +                                              ACPI_BUILD_TABLE_MAX_SIZE);
> >>      assert(build_state->table_mr != NULL);
> >>  
> >>      build_state->linker_mr =
> >> -        acpi_add_rom_blob(build_state, tables.linker->cmd_blob,
> >> -                          "etc/table-loader", 0);
> >> +        acpi_add_rom_blob(acpi_build_update, build_state,
> >> +                          tables.linker->cmd_blob, "etc/table-loader", 0);
> >>  
> >>      fw_cfg_add_file(pcms->fw_cfg, ACPI_BUILD_TPMLOG_FILE,
> >>                      tables.tcpalog->data, acpi_data_len(tables.tcpalog));
> >> @@ -2935,8 +2928,9 @@ void acpi_setup(void)
> >>          build_state->rsdp_mr = NULL;
> >>      } else {
> >>          build_state->rsdp = NULL;
> >> -        build_state->rsdp_mr = acpi_add_rom_blob(build_state, tables.rsdp,
> >> -                                                  ACPI_BUILD_RSDP_FILE, 0);
> >> +        build_state->rsdp_mr = acpi_add_rom_blob(acpi_build_update,
> >> +                                                 build_state, tables.rsdp,
> >> +                                                 ACPI_BUILD_RSDP_FILE, 0);
> >>      }
> >>  
> >>      qemu_register_reset(acpi_build_reset, build_state);
> >> diff --git a/include/hw/acpi/utils.h b/include/hw/acpi/utils.h
> >> new file mode 100644
> >> index 0000000000..5212113b7d
> >> --- /dev/null
> >> +++ b/include/hw/acpi/utils.h
> >> @@ -0,0 +1,9 @@
> >> +#ifndef HW_ACPI_UTILS_H
> >> +#define HW_ACPI_UTILS_H
> >> +
> >> +#include "hw/loader.h"
> >> +
> >> +MemoryRegion *acpi_add_rom_blob(FWCfgCallback update, void *opaque,
> >> +                                GArray *blob, const char *name,
> >> +                                uint64_t max_size);
> >> +#endif  
> 

