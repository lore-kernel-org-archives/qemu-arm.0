Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp2122629wrx;
        Mon, 18 Feb 2019 02:22:28 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYkzOSdJP3heDx7BH9Y6w9zQXJczGbKoinONhX+K2fCsvDT5ZvYj5VoYcu7O7KatG0TtQEI
X-Received: by 2002:a25:2342:: with SMTP id j63mr18284165ybj.51.1550485348597;
        Mon, 18 Feb 2019 02:22:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550485348; cv=none;
        d=google.com; s=arc-20160816;
        b=O9Vj0WUAgfM/IlbioIbLS8mLCaVEj8A7771001424LOlDC7WJtpBR4YvpbnZKIJUQD
         ZYM+Dc3BhDJsogsCOrT6ECLkGYCHGGzkSZ74pcNLwyCnAlNH4gIE4jw3MrroADGuga+S
         2DwxFGVFENzwecihjCQPGA05gkjeks+hK6Ehc8qU8raUB2WFo9QKWcopRmrJXFEKNwD5
         gAYpDFgHUaTtiInKvlAqXINw0D9Pzi0CaK4+gZk8nuZfacafJBb9Tmf3tDxpC43KeYlQ
         WAG/EbeU+ZqwJ39+g0mIweYoqYHDsyTbWaN0JT9dQ0gM8y3dADr31kDA3iZlJyiKI4vC
         5IUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=+y4pMYGayGoF0B8RYwVIpPhjmCKENBW1o3NrIkFqMcE=;
        b=H6FyLp7hwxkdSuZs5PQX5KikjsdDdnKxYnVmpqMK3q/Up+ROivpn95l5H7ROxK6ueb
         xSHU9iLANqbymWG4No3yA+SjEiBjz0p9jt4jWn97EwknoQ59IO4ABIO4tykMZqbacwkI
         2tdZssONsIhhPdySoQZqA+QRuJOy/wVTGTIkZvVMHwJMSJ3qwwdg6IBoXl7S3+N4MH4W
         C1qszr4fHyMufS0ZCF4lJIynL8+5NKJfxa/nWiuvJ2AYpQUA+AO4oh5+RNTiyywKi+WW
         Fac751/MWfJ3bXWXzxALw51LnH8X4ftOzbMzgMcCu3LFBHVkdRBWLVYQ02YJ+OKPsqiR
         d/0w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b203si7307685ybc.447.2019.02.18.02.22.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Feb 2019 02:22:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:55918 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gvg4C-0006mA-18
	for alex.bennee@linaro.org; Mon, 18 Feb 2019 05:22:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42055)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gvg43-0006ll-4f
	for qemu-arm@nongnu.org; Mon, 18 Feb 2019 05:22:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gvg3z-0002Gg-Qo
	for qemu-arm@nongnu.org; Mon, 18 Feb 2019 05:22:19 -0500
Received: from mx1.redhat.com ([209.132.183.28]:44888)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gvg3x-000299-S6; Mon, 18 Feb 2019 05:22:15 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E9ACF10F80;
	Mon, 18 Feb 2019 10:22:01 +0000 (UTC)
Received: from Igors-MacBook-Pro.local (ovpn-112-22.ams2.redhat.com
	[10.36.112.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CB4655F9C0;
	Mon, 18 Feb 2019 10:21:49 +0000 (UTC)
Date: Mon, 18 Feb 2019 11:21:44 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20190218112144.48ac3ebc@Igors-MacBook-Pro.local>
In-Reply-To: <20190205173306.20483-16-eric.auger@redhat.com>
References: <20190205173306.20483-1-eric.auger@redhat.com>
	<20190205173306.20483-16-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Mon, 18 Feb 2019 10:22:02 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v6 15/18] nvdimm: use configurable ACPI IO
 base and size
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, david@redhat.com,
	qemu-devel@nongnu.org, shameerali.kolothum.thodi@huawei.com,
	dgilbert@redhat.com, qemu-arm@nongnu.org,
	david@gibson.dropbear.id.au, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v5NPwDTZUvQT

On Tue,  5 Feb 2019 18:33:03 +0100
Eric Auger <eric.auger@redhat.com> wrote:

> From: Kwangwoo Lee <kwangwoo.lee@sk.com>
> 
> This patch uses configurable IO base and size to create NPIO AML for
> ACPI NFIT. Since a different architecture like AArch64 does not use
> port-mapped IO, a configurable IO base is required to create correct
> mapping of ACPI IO address and size.
> 
> Signed-off-by: Kwangwoo Lee <kwangwoo.lee@sk.com>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> ---
> 
> v2 -> v3:
> - s/size/len in pc_piix.c and pc_q35.c
> ---
>  hw/acpi/nvdimm.c        | 28 +++++++++++++++++++---------
>  hw/i386/pc_piix.c       |  8 +++++++-
>  hw/i386/pc_q35.c        |  8 +++++++-
>  include/hw/mem/nvdimm.h | 12 ++++++++++++
>  4 files changed, 45 insertions(+), 11 deletions(-)
> 
> diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
> index e53b2cb681..da68de5535 100644
> --- a/hw/acpi/nvdimm.c
> +++ b/hw/acpi/nvdimm.c
> @@ -929,8 +929,8 @@ void nvdimm_init_acpi_state(AcpiNVDIMMState *state, MemoryRegion *io,
>                              FWCfgState *fw_cfg, Object *owner)
>  {
>      memory_region_init_io(&state->io_mr, owner, &nvdimm_dsm_ops, state,
> -                          "nvdimm-acpi-io", NVDIMM_ACPI_IO_LEN);
> -    memory_region_add_subregion(io, NVDIMM_ACPI_IO_BASE, &state->io_mr);
> +                          "nvdimm-acpi-io", state->dsm_io.len);
> +    memory_region_add_subregion(io, state->dsm_io.base, &state->io_mr);
>  
>      state->dsm_mem = g_array_new(false, true /* clear */, 1);
>      acpi_data_push(state->dsm_mem, sizeof(NvdimmDsmIn));
> @@ -959,12 +959,14 @@ void nvdimm_init_acpi_state(AcpiNVDIMMState *state, MemoryRegion *io,
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
> @@ -975,9 +977,16 @@ static void nvdimm_build_common_dsm(Aml *dev)
>  
>      aml_append(method, aml_store(aml_name(NVDIMM_ACPI_MEM_ADDR), dsm_mem));
>  
> +    if (acpi_nvdimm_state->dsm_io.type == NVDIMM_ACPI_IO_PORT) {
> +        rs = AML_SYSTEM_IO;
> +    } else {
> +        rs = AML_SYSTEM_MEMORY;
> +    }
> +
>      /* map DSM memory and IO into ACPI namespace. */
> -    aml_append(method, aml_operation_region(NVDIMM_DSM_IOPORT, AML_SYSTEM_IO,
> -               aml_int(NVDIMM_ACPI_IO_BASE), NVDIMM_ACPI_IO_LEN));
> +    aml_append(method, aml_operation_region(NVDIMM_DSM_IOPORT, rs,
> +               aml_int(acpi_nvdimm_state->dsm_io.base),
> +               acpi_nvdimm_state->dsm_io.len));
>      aml_append(method, aml_operation_region(NVDIMM_DSM_MEMORY,
>                 AML_SYSTEM_MEMORY, dsm_mem, sizeof(NvdimmDsmIn)));
>  
> @@ -1260,7 +1269,8 @@ static void nvdimm_build_nvdimm_devices(Aml *root_dev, uint32_t ram_slots)
>  }
>  
>  static void nvdimm_build_ssdt(GArray *table_offsets, GArray *table_data,
> -                              BIOSLinker *linker, GArray *dsm_dma_arrea,
> +                              BIOSLinker *linker,
> +                              AcpiNVDIMMState *acpi_nvdimm_state,
>                                uint32_t ram_slots)
>  {
>      Aml *ssdt, *sb_scope, *dev;
> @@ -1288,7 +1298,7 @@ static void nvdimm_build_ssdt(GArray *table_offsets, GArray *table_data,
>       */
>      aml_append(dev, aml_name_decl("_HID", aml_string("ACPI0012")));
>  
> -    nvdimm_build_common_dsm(dev);
> +    nvdimm_build_common_dsm(dev, acpi_nvdimm_state);
>  
>      /* 0 is reserved for root device. */
>      nvdimm_build_device_dsm(dev, 0);
> @@ -1307,7 +1317,7 @@ static void nvdimm_build_ssdt(GArray *table_offsets, GArray *table_data,
>                                                 NVDIMM_ACPI_MEM_ADDR);
>  
>      bios_linker_loader_alloc(linker,
> -                             NVDIMM_DSM_MEM_FILE, dsm_dma_arrea,
> +                             NVDIMM_DSM_MEM_FILE, acpi_nvdimm_state->dsm_mem,
>                               sizeof(NvdimmDsmIn), false /* high memory */);
>      bios_linker_loader_add_pointer(linker,
>          ACPI_BUILD_TABLE_FILE, mem_addr_offset, sizeof(uint32_t),
> @@ -1329,7 +1339,7 @@ void nvdimm_build_acpi(GArray *table_offsets, GArray *table_data,
>          return;
>      }
>  
> -    nvdimm_build_ssdt(table_offsets, table_data, linker, state->dsm_mem,
> +    nvdimm_build_ssdt(table_offsets, table_data, linker, state,
>                        ram_slots);
>  
>      device_list = nvdimm_get_device_list();
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 63c84e3827..d9c81c9aa6 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -298,7 +298,13 @@ static void pc_init1(MachineState *machine,
>      }
>  
>      if (pcms->acpi_nvdimm_state.is_enabled) {
> -        nvdimm_init_acpi_state(&pcms->acpi_nvdimm_state, system_io,
> +        AcpiNVDIMMState *acpi_nvdimm_state = &pcms->acpi_nvdimm_state;
> +
> +        acpi_nvdimm_state->dsm_io.type = NVDIMM_ACPI_IO_PORT;

> +        acpi_nvdimm_state->dsm_io.base = NVDIMM_ACPI_IO_BASE;
> +        acpi_nvdimm_state->dsm_io.len = NVDIMM_ACPI_IO_LEN;
above constants probably should by moved to target a specific header

> +
> +        nvdimm_init_acpi_state(acpi_nvdimm_state, system_io,
>                                 pcms->fw_cfg, OBJECT(pcms));
>      }
>  }
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index b7b7959934..1110a26e34 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -330,7 +330,13 @@ static void pc_q35_init(MachineState *machine)
>      pc_nic_init(pcmc, isa_bus, host_bus);
>  
>      if (pcms->acpi_nvdimm_state.is_enabled) {
> -        nvdimm_init_acpi_state(&pcms->acpi_nvdimm_state, system_io,
> +        AcpiNVDIMMState *acpi_nvdimm_state = &pcms->acpi_nvdimm_state;
> +
> +        acpi_nvdimm_state->dsm_io.type = NVDIMM_ACPI_IO_PORT;
> +        acpi_nvdimm_state->dsm_io.base = NVDIMM_ACPI_IO_BASE;
> +        acpi_nvdimm_state->dsm_io.len = NVDIMM_ACPI_IO_LEN;
> +
> +        nvdimm_init_acpi_state(acpi_nvdimm_state, system_io,
>                                 pcms->fw_cfg, OBJECT(pcms));
>      }
>  }
> diff --git a/include/hw/mem/nvdimm.h b/include/hw/mem/nvdimm.h
> index c5c9b3c7f8..af8a5fd034 100644
> --- a/include/hw/mem/nvdimm.h
> +++ b/include/hw/mem/nvdimm.h
> @@ -123,6 +123,17 @@ struct NvdimmFitBuffer {
>  };
>  typedef struct NvdimmFitBuffer NvdimmFitBuffer;
>  

> +typedef enum {
> +    NVDIMM_ACPI_IO_PORT,
> +    NVDIMM_ACPI_IO_MEMORY,
> +} AcpiNVDIMMIOType;
> +
> +typedef struct AcpiNVDIMMIOEntry {
> +    AcpiNVDIMMIOType type;
> +    hwaddr base;
> +    hwaddr len;
> +} AcpiNVDIMMIOEntry;
This one very much resembles AcpiGenericAddress, 
why not to reuse it?

>  struct AcpiNVDIMMState {
>      /* detect if NVDIMM support is enabled. */
>      bool is_enabled;
> @@ -140,6 +151,7 @@ struct AcpiNVDIMMState {
>       */
>      int32_t persistence;
>      char    *persistence_string;
> +    AcpiNVDIMMIOEntry dsm_io;
>  };
>  typedef struct AcpiNVDIMMState AcpiNVDIMMState;
>  

