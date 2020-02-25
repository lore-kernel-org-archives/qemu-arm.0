Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1733792lfg;
        Tue, 25 Feb 2020 06:11:49 -0800 (PST)
X-Google-Smtp-Source: APXvYqy/c4s6k+D6G1mhvgBaS5vB6OA6iFe5Rrxd/y1t1PFZYoCnrNuZhe+oooeBUwJSDFAjvR4H
X-Received: by 2002:a9d:116:: with SMTP id 22mr20840986otu.149.1582639909781;
        Tue, 25 Feb 2020 06:11:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582639909; cv=none;
        d=google.com; s=arc-20160816;
        b=dLj0oWx7MiceUhayFaeu1S+HTI3fr7YlS3ZSDLLK/jCCs7Swgk6nNzq+ETH5Yoj0WO
         6+ARkCfA81V3NU9vFuuV7wTaY0khdSRZgA7zOCN6B5qoxbD1Fbl0LLEpXbTFl2zlRkQl
         1Dd9z07llWYzUF1XBREqtBqXPSrHHBXqRpNM0uKNgKoOq65ZKjjVNJa8cjqF/5PNYeUz
         VsMzzDl6UV1jfBcKjDcRYihgQTslQdCLM7uyEMGdF8cQ5DiVOXlI9VFXY/PIttL8dmTN
         LZq2uyChaXawHemS12D9Sti2y4Df7cpFeZOU4gQvtjzNGdhW4cCJdglw7oYx4gwnERDH
         3xzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=GMUOFSvoynEkw0+tPUD1sT0XU9l8i9TQ3rKGSkx9Sj0=;
        b=FhlXeqRU8X3t2ga2Z+FQ5gUZP6H9p3PtWkWoNkmTh4ZPLgtMimqayfsXzxP9+jw6DE
         AbvbIdaX9nBlwSY55N/pcDU4AcvYcdXft1Nku0OYT/HR/OuHfG7ME4aBMPIVVfnD4/H5
         uWwPs0VGPZ0ZBxL8rBu5k8kZjE119OWvdcwGPgJFneMWpbcUB48uC4SgsYpuKJ4rxR2f
         Bp2hK71Dr5ui6ew6rh5PWs8h53ZoVJILmAiTHTNPgP8U5Y9ZObh40R1yRh7+ZdcqKouf
         yAzBzDQsEuXxvLRrw92CXVnj4QGmQUxeXv5iSY9QqQsi3YCIjNFEuUM1zpuAt7ZMNSOg
         HNeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XWk73wsu;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id z8si7993879otp.79.2020.02.25.06.11.49;
        Tue, 25 Feb 2020 06:11:49 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XWk73wsu;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730638AbgBYOLs (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Tue, 25 Feb 2020 09:11:48 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:55491 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730600AbgBYOLs (ORCPT
        <rfc822;kvm@vger.kernel.org>); Tue, 25 Feb 2020 09:11:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1582639906;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GMUOFSvoynEkw0+tPUD1sT0XU9l8i9TQ3rKGSkx9Sj0=;
        b=XWk73wsuWrXB7c2rOJvZIplr6i5EoxwMaLIxLjLUK9QjstvzPL76EmEwJoUdmhbumTypIF
        b7MiW5UdKhBFEOe+DqJfUaud1iU6REPW7ZOIE3QG6lcY8NXsRgLXnwKkJ+BkALbb6nf3iD
        Jofy/wd1Yp0iXzXPKPmN2Uss5S+inxs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-4ewP0dvAOkOoR-QExhingA-1; Tue, 25 Feb 2020 09:11:45 -0500
X-MC-Unique: 4ewP0dvAOkOoR-QExhingA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3351A1005512;
        Tue, 25 Feb 2020 14:11:43 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E26C260CD1;
        Tue, 25 Feb 2020 14:11:35 +0000 (UTC)
Date:   Tue, 25 Feb 2020 15:11:33 +0100
From:   Igor Mammedov <imammedo@redhat.com>
To:     Dongjiu Geng <gengdongjiu@huawei.com>
Cc:     <mst@redhat.com>, <xiaoguangrong.eric@gmail.com>,
        <shannon.zhaosl@gmail.com>, <peter.maydell@linaro.org>,
        <fam@euphon.net>, <rth@twiddle.net>, <ehabkost@redhat.com>,
        <mtosatti@redhat.com>, <qemu-devel@nongnu.org>,
        <kvm@vger.kernel.org>, <qemu-arm@nongnu.org>,
        <pbonzini@redhat.com>, <james.morse@arm.com>, <lersek@redhat.com>,
        <jonathan.cameron@huawei.com>,
        <shameerali.kolothum.thodi@huawei.com>, <zhengxiang9@huawei.com>
Subject: Re: [PATCH v24 06/10] ACPI: Record the Generic Error Status Block
 address
Message-ID: <20200225151133.3c75f611@redhat.com>
In-Reply-To: <20200217131248.28273-7-gengdongjiu@huawei.com>
References: <20200217131248.28273-1-gengdongjiu@huawei.com>
        <20200217131248.28273-7-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: ky2sqHazlqiX

On Mon, 17 Feb 2020 21:12:44 +0800
Dongjiu Geng <gengdongjiu@huawei.com> wrote:

> Record the GHEB address via fw_cfg file, when recording
> a error to CPER, it will use this address to find out
> Generic Error Data Entries and write the error.
> 
> In order to avoid migration failure, make hardware
> error table address to a part of GED device instead
> of global variable, then this address will be migrated
> to target QEMU.
> 
> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
> Acked-by: Xiang Zheng <zhengxiang9@huawei.com>
> ---
>  hw/acpi/generic_event_device.c         | 18 ++++++++++++++++++
>  hw/acpi/ghes.c                         | 17 +++++++++++++++++
>  hw/arm/virt-acpi-build.c               | 10 ++++++++++
>  include/hw/acpi/generic_event_device.h |  2 ++
>  include/hw/acpi/ghes.h                 |  6 ++++++
>  5 files changed, 53 insertions(+)
> 
> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> index 021ed2b..d59607c 100644
> --- a/hw/acpi/generic_event_device.c
> +++ b/hw/acpi/generic_event_device.c
> @@ -234,6 +234,23 @@ static const VMStateDescription vmstate_ged_state = {
>      }
>  };
>  
> +static bool ghes_needed(void *opaque)
> +{
> +    return object_property_get_bool(qdev_get_machine(), "ras", NULL);

Try not to use qdev_get_machine() unless it's the only option.

Following would do the job:

  AcpiGedState *s = opaque
  return s->ghes_state.ghes_addr_le

> +}
> +
> +static const VMStateDescription vmstate_ghes_state = {
> +    .name = "acpi-ged/ghes",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = ghes_needed,
> +    .fields      = (VMStateField[]) {
> +        VMSTATE_STRUCT(ghes_state, AcpiGedState, 1,
> +                       vmstate_ghes_state, AcpiGhesState),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>  static const VMStateDescription vmstate_acpi_ged = {
>      .name = "acpi-ged",
>      .version_id = 1,
> @@ -244,6 +261,7 @@ static const VMStateDescription vmstate_acpi_ged = {
>      },
>      .subsections = (const VMStateDescription * []) {
>          &vmstate_memhp_state,
> +        &vmstate_ghes_state,
>          NULL
>      }
>  };
> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> index 7a7381d..cea2bff 100644
> --- a/hw/acpi/ghes.c
> +++ b/hw/acpi/ghes.c
> @@ -24,6 +24,8 @@
>  #include "hw/acpi/ghes.h"
>  #include "hw/acpi/aml-build.h"
>  #include "qemu/error-report.h"
> +#include "hw/acpi/generic_event_device.h"
> +#include "hw/nvram/fw_cfg.h"
>  
>  #define ACPI_GHES_ERRORS_FW_CFG_FILE        "etc/hardware_errors"
>  #define ACPI_GHES_DATA_ADDR_FW_CFG_FILE     "etc/hardware_errors_addr"
> @@ -213,3 +215,18 @@ void acpi_build_hest(GArray *table_data, BIOSLinker *linker)
>      build_header(linker, table_data, (void *)(table_data->data + hest_start),
>          "HEST", table_data->len - hest_start, 1, NULL, "");
>  }
> +
> +void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
> +                          GArray *hardware_error)
> +{
> +    size_t size = 2 * sizeof(uint64_t) + ACPI_GHES_MAX_RAW_DATA_LENGTH;
> +    size_t request_block_size = ACPI_GHES_ERROR_SOURCE_COUNT * size;
> +
> +    /* Create a read-only fw_cfg file for GHES */
> +    fw_cfg_add_file(s, ACPI_GHES_ERRORS_FW_CFG_FILE, hardware_error->data,
> +                    request_block_size);
why do you calculate request_block_size instead of using hardware_error->len here

> +
> +    /* Create a read-write fw_cfg file for Address */
> +    fw_cfg_add_file_callback(s, ACPI_GHES_DATA_ADDR_FW_CFG_FILE, NULL, NULL,
> +        NULL, &(ags->ghes_addr_le), sizeof(ags->ghes_addr_le), false);
> +}
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 12a9a78..d6e7521 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -832,6 +832,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>      build_spcr(tables_blob, tables->linker, vms);
>  
>      if (vms->ras) {

> +        assert(vms->acpi_dev);
tables could be built without this device, so I'd drop this line so reader
won't wonder why it's here.


>          acpi_add_table(table_offsets, tables_blob);
>          build_ghes_error_table(tables->hardware_errors, tables->linker);
>          acpi_build_hest(tables_blob, tables->linker);
> @@ -924,6 +925,7 @@ void virt_acpi_setup(VirtMachineState *vms)
>  {
>      AcpiBuildTables tables;
>      AcpiBuildState *build_state;
> +    AcpiGedState *acpi_ged_state;
>  
>      if (!vms->fw_cfg) {
>          trace_virt_acpi_setup();
> @@ -954,6 +956,14 @@ void virt_acpi_setup(VirtMachineState *vms)
>      fw_cfg_add_file(vms->fw_cfg, ACPI_BUILD_TPMLOG_FILE, tables.tcpalog->data,
>                      acpi_data_len(tables.tcpalog));
>  
> +    if (vms->ras) {
> +        assert(vms->acpi_dev);
> +        acpi_ged_state = ACPI_GED(object_resolve_path_type("", TYPE_ACPI_GED,
> +                                                           NULL));
lookup is not necessary, just do

           AcpiGedState *acpi_ged_state = ACPI_GED(vms->acpi_dev)

> +        acpi_ghes_add_fw_cfg(&acpi_ged_state->ghes_state,
> +                             vms->fw_cfg, tables.hardware_errors);
> +    }
> +
>      build_state->rsdp_mr = acpi_add_rom_blob(virt_acpi_build_update,
>                                               build_state, tables.rsdp,
>                                               ACPI_BUILD_RSDP_FILE, 0);
> diff --git a/include/hw/acpi/generic_event_device.h b/include/hw/acpi/generic_event_device.h
> index d157eac..037d2b5 100644
> --- a/include/hw/acpi/generic_event_device.h
> +++ b/include/hw/acpi/generic_event_device.h
> @@ -61,6 +61,7 @@
>  
>  #include "hw/sysbus.h"
>  #include "hw/acpi/memory_hotplug.h"
> +#include "hw/acpi/ghes.h"
>  
>  #define ACPI_POWER_BUTTON_DEVICE "PWRB"
>  
> @@ -95,6 +96,7 @@ typedef struct AcpiGedState {
>      GEDState ged_state;
>      uint32_t ged_event_bitmap;
>      qemu_irq irq;
> +    AcpiGhesState ghes_state;
>  } AcpiGedState;
>  
>  void build_ged_aml(Aml *table, const char* name, HotplugHandler *hotplug_dev,
> diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
> index 18debd8..a3420fc 100644
> --- a/include/hw/acpi/ghes.h
> +++ b/include/hw/acpi/ghes.h
> @@ -62,6 +62,12 @@ enum {
>      ACPI_HEST_SRC_ID_RESERVED,
>  };
>  
> +typedef struct AcpiGhesState {
> +    uint64_t ghes_addr_le;
> +} AcpiGhesState;
> +
>  void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker);
>  void acpi_build_hest(GArray *table_data, BIOSLinker *linker);
> +void acpi_ghes_add_fw_cfg(AcpiGhesState *vms, FWCfgState *s,
> +                          GArray *hardware_errors);
>  #endif
