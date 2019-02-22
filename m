Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7091272wrx;
        Fri, 22 Feb 2019 07:43:15 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ia/hCCcKsO1q/HaRdiKURYz2MJ/TMmic/qQyxzmEy9pmDP03zPAl2uB/9WzfnBeaF9ijO5F
X-Received: by 2002:a25:ed07:: with SMTP id k7mr3912934ybh.215.1550850195730;
        Fri, 22 Feb 2019 07:43:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550850195; cv=none;
        d=google.com; s=arc-20160816;
        b=sSoex/YJtlA2R0P9d3b1r/m2oBHsXIVfzx+dZQGFh3ALmjSrEJSPczetzcT27+xhsY
         dIWGZ+y+qPjJzsamfDZFi+IS3G4YQyr5H302zlOmp+rzvQo1y9JTh83sJbE3weL7S4A8
         P0uZAKbDM2ZEKXhPz4dprFVNcvr0Y6Q+f0vGLbG3rmWI8ngMHGyneLIjzmtMZXSVIb7r
         DMFVFg8+9Gohpt8lROKLfgDKGdxD2IG3Nqtij+ZLs5+uOkdsPBbhn3+FgLALi9pvuF3E
         z7Tn/8Shxobop7L/jg8mDNL2F9Oy7oTsyg4mWvpu0D/IELekjIA/qUsCoThD0ZIuIuSq
         eY1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=BMb7PwjKYGJKo/lXzbdAC7SiO7oMC/V2F9ecRdM+k0o=;
        b=msxLIP0GaR9cONICMXRmtZMAeDKa9DGZNKHUff2WNAHWRoAANUjmot9oNE0TAoLfFG
         bFzzLGYXcJ1zOQEDqrEL/t8aNSy/E6enp1tB9dJdQLfQS9ZYW0jtudbKPhT9fUPHFQN/
         Xk2u/y7Qi7CdyuUxSPRPUehff6GGJ1ep/XnXfdQDpYORML5KdfCMrQ+vWPloXeZQHf/B
         yvfY19rgIMA7E02OCuzCdj0OERhiv9uHgqsBo+S5JOxGDUrU/C5NHkT33Y2ZyJAtSUNx
         y4kgMSiedXM9+kz8RSMnXP3ubd9RpSYbapUL7iuX3Bo2jJYVpXIjmFUcKB4je8x2GjVv
         L/sg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v82si1012754ywe.8.2019.02.22.07.43.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Feb 2019 07:43:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:53019 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gxCyp-0005yU-4d
	for alex.bennee@linaro.org; Fri, 22 Feb 2019 10:43:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50717)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gxClD-0000S7-P0
	for qemu-devel@nongnu.org; Fri, 22 Feb 2019 10:29:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gxClC-0006Vf-Fm
	for qemu-devel@nongnu.org; Fri, 22 Feb 2019 10:29:11 -0500
Received: from mx1.redhat.com ([209.132.183.28]:49898)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gxCl9-0006L7-FB; Fri, 22 Feb 2019 10:29:07 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A65D83003B34;
	Fri, 22 Feb 2019 15:29:06 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 560E666080;
	Fri, 22 Feb 2019 15:29:00 +0000 (UTC)
Date: Fri, 22 Feb 2019 16:28:58 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20190222162858.02480a1b@redhat.com>
In-Reply-To: <20190220224003.4420-15-eric.auger@redhat.com>
References: <20190220224003.4420-1-eric.auger@redhat.com>
	<20190220224003.4420-15-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Fri, 22 Feb 2019 15:29:06 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v7 14/17] nvdimm: use configurable ACPI IO
 base and size
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, david@redhat.com,
	qemu-devel@nongnu.org, shameerali.kolothum.thodi@huawei.com,
	dgilbert@redhat.com, qemu-arm@nongnu.org,
	david@gibson.dropbear.id.au, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eqypaqUQMAU9

On Wed, 20 Feb 2019 23:40:00 +0100
Eric Auger <eric.auger@redhat.com> wrote:

> From: Kwangwoo Lee <kwangwoo.lee@sk.com>
> 
> This patch uses configurable IO base and size to create NPIO AML for
s/uses ... /makes IO base and size configurable/

> ACPI NFIT. Since a different architecture like AArch64 does not use
> port-mapped IO, a configurable IO base is required to create correct
> mapping of ACPI IO address and size.
> 
> Signed-off-by: Kwangwoo Lee <kwangwoo.lee@sk.com>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> ---
> v6 -> v7:
> - Use NvdimmDsmIO constant
> - use AcpiGenericAddress instead of AcpiNVDIMMIOEntry
> 
> v2 -> v3:
> - s/size/len in pc_piix.c and pc_q35.c
> ---
>  hw/acpi/nvdimm.c        | 31 ++++++++++++++++++++++---------
>  hw/i386/pc_piix.c       |  6 +++++-
>  hw/i386/pc_q35.c        |  6 +++++-
>  include/hw/mem/nvdimm.h |  4 ++++
>  4 files changed, 36 insertions(+), 11 deletions(-)
> 
> diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
> index e53b2cb681..fddc790945 100644
> --- a/hw/acpi/nvdimm.c
> +++ b/hw/acpi/nvdimm.c
> @@ -33,6 +33,9 @@
>  #include "hw/nvram/fw_cfg.h"
>  #include "hw/mem/nvdimm.h"
>  
> +const struct AcpiGenericAddress NvdimmDsmIO = { .space_id = AML_AS_SYSTEM_IO,
> +        .bit_width = NVDIMM_ACPI_IO_LEN << 3, .address = NVDIMM_ACPI_IO_BASE};
it's target specific data, so I'd put this part in x86 specific place
hw/i386/acpi-build.[ch] or pc.[ch]
and initialize it like you don in the next patch for virt-arm

maybe add pc_/x86_ prefix to variable name and also we don't do CamelCase
with variable names if I recall correctly.


> +
>  static int nvdimm_device_list(Object *obj, void *opaque)
>  {
>      GSList **list = opaque;
> @@ -929,8 +932,8 @@ void nvdimm_init_acpi_state(AcpiNVDIMMState *state, MemoryRegion *io,
>                              FWCfgState *fw_cfg, Object *owner)
>  {
>      memory_region_init_io(&state->io_mr, owner, &nvdimm_dsm_ops, state,
> -                          "nvdimm-acpi-io", NVDIMM_ACPI_IO_LEN);
> -    memory_region_add_subregion(io, NVDIMM_ACPI_IO_BASE, &state->io_mr);
> +                          "nvdimm-acpi-io", state->dsm_io.bit_width >> 3);
> +    memory_region_add_subregion(io, state->dsm_io.address, &state->io_mr);
>  
>      state->dsm_mem = g_array_new(false, true /* clear */, 1);
>      acpi_data_push(state->dsm_mem, sizeof(NvdimmDsmIn));
> @@ -959,12 +962,14 @@ void nvdimm_init_acpi_state(AcpiNVDIMMState *state, MemoryRegion *io,
>  
>  #define NVDIMM_QEMU_RSVD_UUID   "648B9CF2-CDA1-4312-8AD9-49C4AF32BD62"
>  
> -static void nvdimm_build_common_dsm(Aml *dev)
> +static void nvdimm_build_common_dsm(Aml *dev,
> +                                    AcpiNVDIMMState *acpi_nvdimm_state)
>  {
>      Aml *method, *ifctx, *function, *handle, *uuid, *dsm_mem, *elsectx2;
>      Aml *elsectx, *unsupport, *unpatched, *expected_uuid, *uuid_invalid;
>      Aml *pckg, *pckg_index, *pckg_buf, *field, *dsm_out_buf, *dsm_out_buf_size;
>      uint8_t byte_list[1];
> +    AmlRegionSpace rs;
>  
>      method = aml_method(NVDIMM_COMMON_DSM, 5, AML_SERIALIZED);
>      uuid = aml_arg(0);
> @@ -975,9 +980,16 @@ static void nvdimm_build_common_dsm(Aml *dev)
>  
>      aml_append(method, aml_store(aml_name(NVDIMM_ACPI_MEM_ADDR), dsm_mem));
>  
> +    if (acpi_nvdimm_state->dsm_io.space_id == AML_AS_SYSTEM_IO) {
> +        rs = AML_SYSTEM_IO;
> +    } else {
> +        rs = AML_SYSTEM_MEMORY;
> +    }
> +
>      /* map DSM memory and IO into ACPI namespace. */
> -    aml_append(method, aml_operation_region(NVDIMM_DSM_IOPORT, AML_SYSTEM_IO,
> -               aml_int(NVDIMM_ACPI_IO_BASE), NVDIMM_ACPI_IO_LEN));
> +    aml_append(method, aml_operation_region(NVDIMM_DSM_IOPORT, rs,
> +               aml_int(acpi_nvdimm_state->dsm_io.address),
> +               acpi_nvdimm_state->dsm_io.bit_width >> 3));
>      aml_append(method, aml_operation_region(NVDIMM_DSM_MEMORY,
>                 AML_SYSTEM_MEMORY, dsm_mem, sizeof(NvdimmDsmIn)));
>  
> @@ -1260,7 +1272,8 @@ static void nvdimm_build_nvdimm_devices(Aml *root_dev, uint32_t ram_slots)
>  }
>  
>  static void nvdimm_build_ssdt(GArray *table_offsets, GArray *table_data,
> -                              BIOSLinker *linker, GArray *dsm_dma_arrea,
> +                              BIOSLinker *linker,
> +                              AcpiNVDIMMState *acpi_nvdimm_state,
>                                uint32_t ram_slots)
>  {
>      Aml *ssdt, *sb_scope, *dev;
> @@ -1288,7 +1301,7 @@ static void nvdimm_build_ssdt(GArray *table_offsets, GArray *table_data,
>       */
>      aml_append(dev, aml_name_decl("_HID", aml_string("ACPI0012")));
>  
> -    nvdimm_build_common_dsm(dev);
> +    nvdimm_build_common_dsm(dev, acpi_nvdimm_state);
>  
>      /* 0 is reserved for root device. */
>      nvdimm_build_device_dsm(dev, 0);
> @@ -1307,7 +1320,7 @@ static void nvdimm_build_ssdt(GArray *table_offsets, GArray *table_data,
>                                                 NVDIMM_ACPI_MEM_ADDR);
>  
>      bios_linker_loader_alloc(linker,
> -                             NVDIMM_DSM_MEM_FILE, dsm_dma_arrea,
> +                             NVDIMM_DSM_MEM_FILE, acpi_nvdimm_state->dsm_mem,
>                               sizeof(NvdimmDsmIn), false /* high memory */);
>      bios_linker_loader_add_pointer(linker,
>          ACPI_BUILD_TABLE_FILE, mem_addr_offset, sizeof(uint32_t),
> @@ -1329,7 +1342,7 @@ void nvdimm_build_acpi(GArray *table_offsets, GArray *table_data,
>          return;
>      }
>  
> -    nvdimm_build_ssdt(table_offsets, table_data, linker, state->dsm_mem,
> +    nvdimm_build_ssdt(table_offsets, table_data, linker, state,
>                        ram_slots);
>  
>      device_list = nvdimm_get_device_list();
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index fd0f2c268f..d0a262d106 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -298,7 +298,11 @@ static void pc_init1(MachineState *machine,
>      }
>  
>      if (pcms->acpi_nvdimm_state.is_enabled) {
> -        nvdimm_init_acpi_state(&pcms->acpi_nvdimm_state, system_io,
> +        AcpiNVDIMMState *acpi_nvdimm_state = &pcms->acpi_nvdimm_state;
> +
> +        acpi_nvdimm_state->dsm_io = NvdimmDsmIO;
> +
> +        nvdimm_init_acpi_state(acpi_nvdimm_state, system_io, 
>                                 pcms->fw_cfg, OBJECT(pcms));
I dislike split initialization, suggest to pass AcpiGenericAddress
as an argument to nvdimm_init_acpi_state() and assign it to
acpi_nvdimm_state inside, so we could see acpi_nvdimm_state
initialization in one place (almost all).

>      }
>  }
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index 4a175ea50e..21f594001f 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -330,7 +330,11 @@ static void pc_q35_init(MachineState *machine)
>      pc_nic_init(pcmc, isa_bus, host_bus);
>  
>      if (pcms->acpi_nvdimm_state.is_enabled) {
> -        nvdimm_init_acpi_state(&pcms->acpi_nvdimm_state, system_io,
> +        AcpiNVDIMMState *acpi_nvdimm_state = &pcms->acpi_nvdimm_state;
> +
> +        acpi_nvdimm_state->dsm_io = NvdimmDsmIO;
> +
> +        nvdimm_init_acpi_state(acpi_nvdimm_state, system_io,
>                                 pcms->fw_cfg, OBJECT(pcms));
>      }
>  }
> diff --git a/include/hw/mem/nvdimm.h b/include/hw/mem/nvdimm.h
> index c5c9b3c7f8..ead51d958d 100644
> --- a/include/hw/mem/nvdimm.h
> +++ b/include/hw/mem/nvdimm.h
> @@ -25,6 +25,7 @@
>  
>  #include "hw/mem/pc-dimm.h"
>  #include "hw/acpi/bios-linker-loader.h"
> +#include "hw/acpi/aml-build.h"
>  
>  #define NVDIMM_DEBUG 0
>  #define nvdimm_debug(fmt, ...)                                \
> @@ -123,6 +124,8 @@ struct NvdimmFitBuffer {
>  };
>  typedef struct NvdimmFitBuffer NvdimmFitBuffer;
>  
> +extern const struct AcpiGenericAddress NvdimmDsmIO;
> +
>  struct AcpiNVDIMMState {
>      /* detect if NVDIMM support is enabled. */
>      bool is_enabled;
> @@ -140,6 +143,7 @@ struct AcpiNVDIMMState {
>       */
>      int32_t persistence;
>      char    *persistence_string;
> +    struct AcpiGenericAddress dsm_io;
>  };
>  typedef struct AcpiNVDIMMState AcpiNVDIMMState;
>  

