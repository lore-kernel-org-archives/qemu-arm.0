Received: by 10.25.21.156 with SMTP id 28csp1254353lfv;
        Mon, 25 Jul 2016 09:13:02 -0700 (PDT)
X-Received: by 10.237.44.66 with SMTP id f60mr31535811qtd.11.1469463182631;
        Mon, 25 Jul 2016 09:13:02 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t13si18323393qkt.322.2016.07.25.09.13.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Jul 2016 09:13:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33409 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bRiV3-0002ZR-V7
	for alex.bennee@linaro.org; Mon, 25 Jul 2016 12:13:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46615)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bRiUz-0002Z7-6M
	for qemu-arm@nongnu.org; Mon, 25 Jul 2016 12:12:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bRiUx-0001CK-Ln
	for qemu-arm@nongnu.org; Mon, 25 Jul 2016 12:12:57 -0400
Received: from mail-vk0-x22c.google.com ([2607:f8b0:400c:c05::22c]:34955)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bRiUx-0001C0-5I
	for qemu-arm@nongnu.org; Mon, 25 Jul 2016 12:12:55 -0400
Received: by mail-vk0-x22c.google.com with SMTP id w127so250548173vkh.2
	for <qemu-arm@nongnu.org>; Mon, 25 Jul 2016 09:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/qGYJbREpWkDqkfzyNQZ/mGZFLuZ5fxfgxQGGnqqy1g=;
	b=DEoYVlq5GGVUzT6/T4R7yTvG24GbMzyH8bNqEQsoT/ti54R44LyDzmUJJ4VajOuBfl
	+A27hlBCfPWyQ0TRMBZEbl6Is0EUnApkENYppuAa0otoGhYesQ80BJdwOHnfXeVCzov5
	6dFSuNc1C3sVZ7/+jrj2HvkkXreHn+iYoOpqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/qGYJbREpWkDqkfzyNQZ/mGZFLuZ5fxfgxQGGnqqy1g=;
	b=ba/Aj+tQJovnLkJ6wUDqkBE75TZHqUqzPJFrkSCoUyJxN9VjacTfHHMwGtDaPzQNbF
	mBVb+lVcTiE59ZmPJlz9+OLaDMvKbmgPVoeLaSVrVccSXix6W7FgpwxTOgoJGnpiafJ/
	9bBnpgHyYCVM0dQDhDDSxX93r584SDgWWpoljiBT2/V4nPlJ6T1iQ1cId6BlGbZmsnJ2
	cSv2Efz0/Yj8fLMcg/eHT2rFC1Yz3Yw2MORECzLpxsljhSkuFs6sIw+uE0AtZqweFE0g
	n7f7snbkix5O/r0J1s2iytsBxsscMi5f5PsQc4rPkWU5veww3uhmk/ntYe2LEqP1a/IL
	FgEA==
X-Gm-Message-State: AEkooutJMrTxbFbjdNJZhSGffbJ64SYza3vRmEnFcSjlOBmLpRDi21S0tUkpU/eZtCkqBkqdbWrfZJ0LmKFD5Vmq
X-Received: by 10.31.88.70 with SMTP id m67mr8542590vkb.108.1469463174735;
	Mon, 25 Jul 2016 09:12:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.137.136 with HTTP; Mon, 25 Jul 2016 09:12:35 -0700 (PDT)
In-Reply-To: <1468975744-12587-3-git-send-email-kwangwoo.lee@sk.com>
References: <1468975744-12587-1-git-send-email-kwangwoo.lee@sk.com>
	<1468975744-12587-3-git-send-email-kwangwoo.lee@sk.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Jul 2016 17:12:35 +0100
Message-ID: <CAFEAcA9Dce1qQS6QHjxYWMykX6wycusPQM3UDquifTr38oOd=Q@mail.gmail.com>
To: Kwangwoo Lee <kwangwoo.lee@sk.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22c
Subject: Re: [Qemu-arm] [RFC PATCH 2/3] nvdimm: use configurable ACPI IO
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
Cc: Xiao Guangrong <guangrong.xiao@linux.intel.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Woosuk Chung <woosuk.chung@sk.com>, qemu-arm <qemu-arm@nongnu.org>,
	Shannon Zhao <shannon.zhao@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Hyunchul Kim <hyunchul3.kim@sk.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Cm4ZZewd19eo

On 20 July 2016 at 01:49, Kwangwoo Lee <kwangwoo.lee@sk.com> wrote:
> This patch uses configurable IO base and size to create NPIO AML for
> ACPI NFIT. Since a different architecture like AArch64 does not use
> port-mapped IO, a configurable IO base is required to create correct
> mapping of ACPI IO address and size.
>
> Signed-off-by: Kwangwoo Lee <kwangwoo.lee@sk.com>
> ---
>  hw/acpi/nvdimm.c        | 23 +++++++++++++++--------
>  hw/i386/acpi-build.c    |  2 +-
>  hw/i386/pc_piix.c       |  8 +++++++-
>  hw/i386/pc_q35.c        |  8 +++++++-
>  include/hw/mem/nvdimm.h | 17 ++++++++++++++++-
>  5 files changed, 46 insertions(+), 12 deletions(-)
>
> diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
> index e486128..57e03ee 100644
> --- a/hw/acpi/nvdimm.c
> +++ b/hw/acpi/nvdimm.c
> @@ -765,8 +765,8 @@ void nvdimm_init_acpi_state(AcpiNVDIMMState *state, MemoryRegion *io,
>                              FWCfgState *fw_cfg, Object *owner)
>  {
>      memory_region_init_io(&state->io_mr, owner, &nvdimm_dsm_ops, state,
> -                          "nvdimm-acpi-io", NVDIMM_ACPI_IO_LEN);
> -    memory_region_add_subregion(io, NVDIMM_ACPI_IO_BASE, &state->io_mr);
> +                          "nvdimm-acpi-io", state->dsm_io.size);
> +    memory_region_add_subregion(io, state->dsm_io.base, &state->io_mr);
>
>      state->dsm_mem = g_array_new(false, true /* clear */, 1);
>      acpi_data_push(state->dsm_mem, sizeof(NvdimmDsmIn));

Why does this function take a MemoryRegion to insert itself into,
rather than returning a MemoryRegion for the caller to map into
wherever is appropriate, or even being a DeviceState which has
mappable memory regions via the sysbus API ?

I guess the answer is "that's the way it happens to be at the moment",
so I'm not really asking for a change here necessarily.

> @@ -912,9 +912,10 @@ static void nvdimm_build_nvdimm_devices(GSList *device_list, Aml *root_dev)
>
>  static void nvdimm_build_ssdt(GSList *device_list, GArray *table_offsets,
>                                GArray *table_data, BIOSLinker *linker,
> -                              GArray *dsm_dma_arrea)
> +                              AcpiNVDIMMState *acpi_nvdimm_state)
>  {
>      Aml *ssdt, *sb_scope, *dev, *field;
> +    AmlRegionSpace rs;
>      int mem_addr_offset, nvdimm_ssdt;
>
>      acpi_add_table(table_offsets, table_data);
> @@ -940,8 +941,14 @@ static void nvdimm_build_ssdt(GSList *device_list, GArray *table_offsets,
>      aml_append(dev, aml_name_decl("_HID", aml_string("ACPI0012")));
>
>      /* map DSM memory and IO into ACPI namespace. */
> -    aml_append(dev, aml_operation_region("NPIO", AML_SYSTEM_IO,
> -               aml_int(NVDIMM_ACPI_IO_BASE), NVDIMM_ACPI_IO_LEN));
> +    if (acpi_nvdimm_state->dsm_io.type == NVDIMM_ACPI_IO_PORT) {
> +        rs = AML_SYSTEM_IO;
> +    } else {
> +        rs = AML_SYSTEM_MEMORY;
> +    }
> +    aml_append(dev, aml_operation_region("NPIO", rs,
> +               aml_int(acpi_nvdimm_state->dsm_io.base),
> +               acpi_nvdimm_state->dsm_io.size));
>      aml_append(dev, aml_operation_region("NRAM", AML_SYSTEM_MEMORY,
>                 aml_name(NVDIMM_ACPI_MEM_ADDR), sizeof(NvdimmDsmIn)));
>
> @@ -1014,7 +1021,7 @@ static void nvdimm_build_ssdt(GSList *device_list, GArray *table_offsets,
>                                                 NVDIMM_ACPI_MEM_ADDR);
>
>      bios_linker_loader_alloc(linker,
> -                             NVDIMM_DSM_MEM_FILE, dsm_dma_arrea,
> +                             NVDIMM_DSM_MEM_FILE, acpi_nvdimm_state->dsm_mem,
>                               sizeof(NvdimmDsmIn), false /* high memory */);
>      bios_linker_loader_add_pointer(linker,
>          ACPI_BUILD_TABLE_FILE, mem_addr_offset, sizeof(uint32_t),
> @@ -1026,7 +1033,7 @@ static void nvdimm_build_ssdt(GSList *device_list, GArray *table_offsets,
>  }
>
>  void nvdimm_build_acpi(GArray *table_offsets, GArray *table_data,
> -                       BIOSLinker *linker, GArray *dsm_dma_arrea)
> +                       BIOSLinker *linker, AcpiNVDIMMState *acpi_nvdimm_state)
>  {
>      GSList *device_list;
>
> @@ -1037,6 +1044,6 @@ void nvdimm_build_acpi(GArray *table_offsets, GArray *table_data,
>      }
>      nvdimm_build_nfit(device_list, table_offsets, table_data, linker);
>      nvdimm_build_ssdt(device_list, table_offsets, table_data, linker,
> -                      dsm_dma_arrea);
> +                      acpi_nvdimm_state);
>      g_slist_free(device_list);
>  }
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index fbba461..54b09a9 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -2632,7 +2632,7 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>      }
>      if (pcms->acpi_nvdimm_state.is_enabled) {
>          nvdimm_build_acpi(table_offsets, tables_blob, tables->linker,
> -                          pcms->acpi_nvdimm_state.dsm_mem);
> +                          &pcms->acpi_nvdimm_state);
>      }
>
>      /* Add tables supplied by user (if any) */
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index a07dc81..b624f59 100644
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
> +        acpi_nvdimm_state->dsm_io.size = NVDIMM_ACPI_IO_LEN;
> +
> +        nvdimm_init_acpi_state(acpi_nvdimm_state, system_io,
>                                 pcms->fw_cfg, OBJECT(pcms));
>      }
>  }
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index c0b9961..779ac32 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -263,7 +263,13 @@ static void pc_q35_init(MachineState *machine)
>      }
>
>      if (pcms->acpi_nvdimm_state.is_enabled) {
> -        nvdimm_init_acpi_state(&pcms->acpi_nvdimm_state, system_io,
> +        AcpiNVDIMMState *acpi_nvdimm_state = &pcms->acpi_nvdimm_state;
> +
> +        acpi_nvdimm_state->dsm_io.type = NVDIMM_ACPI_IO_PORT;
> +        acpi_nvdimm_state->dsm_io.base = NVDIMM_ACPI_IO_BASE;
> +        acpi_nvdimm_state->dsm_io.size = NVDIMM_ACPI_IO_LEN;
> +
> +        nvdimm_init_acpi_state(acpi_nvdimm_state, system_io,
>                                 pcms->fw_cfg, OBJECT(pcms));
>      }
>  }

Ideally this would be a QOM object with QOM properties, rather
than an ad-hoc init function.

thanks
-- PMM
