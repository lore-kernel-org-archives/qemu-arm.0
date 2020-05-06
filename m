Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1320523lfb;
        Wed, 6 May 2020 13:22:52 -0700 (PDT)
X-Google-Smtp-Source: APiQypLB6NrM6IYL4z37gKjX8oiHElcD3+5U52Ss1Qsous/1/e2RhIwdxemd513ij7o6ohZAYqHj
X-Received: by 2002:aa7:c3d3:: with SMTP id l19mr8605243edr.14.1588796572784;
        Wed, 06 May 2020 13:22:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588796572; cv=none;
        d=google.com; s=arc-20160816;
        b=zEuaVWLcv9l9F9/iH8k3pN35mlvAxNUwluUwYRhVwD4twDTht0Vk8ZoZ9QUoBREU8M
         kMrBVwJT0QvbwAxS0mhQzIaQ2WctSd8qRGvJs2Ry0PrbdGgIK1AAW8nLKVhbMXlXI3JD
         pd2gYkzd9u+ittpMfvv8bbfH47udmIOD7YOG+42bplqqRZcf42kgAz7z82m6stCcFVio
         DLPDxyiYF5WSbB2yYxj3Xp6NgSD5obnJZ9rfBRxDgPg/iX2/vJWafDaHeOr44nFR3nVs
         AK9Hk0GbIWIhTu30Ma82TXCiPMIP0eekb+hihAH1zhFlNOGE2xj1ZGvYpcYAucpJUcuP
         GPiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=U+1bCSviFwcdpe08mjhiimwDdJ7yxmjwmBMzGnTCUCI=;
        b=HQS9YlI/+9kLtAAbk7Dsplh2kfNKyOb4bLwdN0X1BE/CVSn8POx66VRv/v61H69m8Y
         lPXAyOuOHefcogqx4Yl6mLWXcrIn/S8kdZimjn1Fjy/WfWk8QiPAnn1RTenVvrwMLSRi
         7UGa85tvd4/vInYZVbFMqb+yEDlPfI7RJDNSgCH8NjTGQMP+4ZMS7TtMlE5kVSSuGObt
         5CdkwLE2JHr5ocNlIkCvFjE9d9YNcriu/qz4DfaVrVyKQQVDcIneQUwLB3kanF603b9z
         dQg+/wePad2TxMQOf0KtVGt6yyPCKCFRGjPl1mdb30yhOXpLOZmN5Y8jxmrr+4cnQeOn
         APrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TwTotcpe;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id g22si1997710ejr.228.2020.05.06.13.22.52;
        Wed, 06 May 2020 13:22:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TwTotcpe;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728690AbgEFUWv (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Wed, 6 May 2020 16:22:51 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:60450 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726218AbgEFUWv (ORCPT <rfc822;kvm@vger.kernel.org>);
        Wed, 6 May 2020 16:22:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588796568;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=U+1bCSviFwcdpe08mjhiimwDdJ7yxmjwmBMzGnTCUCI=;
        b=TwTotcpeewytgBuFbQGjbgsQ3yUhH54/q/GQRcBJiNP9nHajD2zG4CxbwCh8s2POIKGESh
        BAY5gmtGk7hGioYkqoYh83Vz/OxyQAZCaeBKiHcHoEmh4ckh4L4k0rwH3unUstQgsBcdtX
        TZhj6LMGXFfoiuHsG2jmpmE/zl0/yw8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-n6GjPeGBNiSJxv1UFEEntA-1; Wed, 06 May 2020 16:22:44 -0400
X-MC-Unique: n6GjPeGBNiSJxv1UFEEntA-1
Received: by mail-wm1-f70.google.com with SMTP id n17so1312316wmi.3
        for <kvm@vger.kernel.org>; Wed, 06 May 2020 13:22:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=U+1bCSviFwcdpe08mjhiimwDdJ7yxmjwmBMzGnTCUCI=;
        b=dxMPpUpEsv0XLiKRu6GCOymW6hCZx7XTmJqO9QNRzycqdvgZLkejeZ8Bsobfg8GVwU
         pNurSJdNVlv/pbeI3RAceVkcWfWBfgvx9R2c9V2NiTZiIQPKhEl8m0/1hT4bey2TilQi
         wVd/JxCdoFoByITP6JlLvenHRB7YCeDn1RCOALfyjZEJiMlsKGjjD2vKVz7GeoqsdlNa
         Cm76xu6syVIXqLhEVPv1QEbflTzc6HwUuXmwW7sau05veWsHdBCKfQZLE3zygJ4LQrHX
         tSX7wz010Ihuyblc8MbqJwCaThMn7pomy9yztVqHAan4VmV5OOykdRiw3EtcvHg2X0G0
         dbwQ==
X-Gm-Message-State: AGi0PuZsx0jKVBPTNFCRQ7q4lST70FKRfRSn4cib0koVWAvRmgQSbons
        9HhZ5MENC3VM2rf+zKbQteMjv8ivOO75PqGM2Yvj7q2QTyNkzeSBTwyPxiXHLzuD6PygWZQytmB
        qVZ6XmTKGnvFE
X-Received: by 2002:adf:ab57:: with SMTP id r23mr12312809wrc.180.1588796563197;
        Wed, 06 May 2020 13:22:43 -0700 (PDT)
X-Received: by 2002:adf:ab57:: with SMTP id r23mr12312789wrc.180.1588796562842;
        Wed, 06 May 2020 13:22:42 -0700 (PDT)
Received: from redhat.com (bzq-109-66-7-121.red.bezeqint.net. [109.66.7.121])
        by smtp.gmail.com with ESMTPSA id z18sm4203551wrw.41.2020.05.06.13.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 13:22:42 -0700 (PDT)
Date:   Wed, 6 May 2020 16:22:39 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Dongjiu Geng <gengdongjiu@huawei.com>
Cc:     imammedo@redhat.com, xiaoguangrong.eric@gmail.com,
        peter.maydell@linaro.org, shannon.zhaosl@gmail.com, fam@euphon.net,
        rth@twiddle.net, ehabkost@redhat.com, mtosatti@redhat.com,
        qemu-devel@nongnu.org, kvm@vger.kernel.org, qemu-arm@nongnu.org,
        pbonzini@redhat.com, zhengxiang9@huawei.com,
        Jonathan.Cameron@huawei.com, linuxarm@huawei.com
Subject: Re: [PATCH v25 04/10] ACPI: Build related register address fields
 via hardware error fw_cfg blob
Message-ID: <20200506162234-mutt-send-email-mst@kernel.org>
References: <20200410114639.32844-1-gengdongjiu@huawei.com>
 <20200410114639.32844-5-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200410114639.32844-5-gengdongjiu@huawei.com>
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: aR2bdCngZ54m

On Fri, Apr 10, 2020 at 07:46:33PM +0800, Dongjiu Geng wrote:
> This patch builds error_block_address and read_ack_register fields
> in hardware errors table , the error_block_address points to Generic
> Error Status Block(GESB) via bios_linker. The max size for one GESB
> is 1kb, For more detailed information, please refer to
> document: docs/specs/acpi_hest_ghes.rst
> 
> Now we only support one Error source, if necessary, we can extend to
> support more.
> 
> Suggested-by: Laszlo Ersek <lersek@redhat.com>
> Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

> ---
> change since v24:
> 1.move acpi_add_table() to the patch that adds acpi_build_hest()
> ---
>  default-configs/arm-softmmu.mak |  1 +
>  hw/acpi/Kconfig                 |  4 ++
>  hw/acpi/Makefile.objs           |  1 +
>  hw/acpi/aml-build.c             |  2 +
>  hw/acpi/ghes.c                  | 89 +++++++++++++++++++++++++++++++++++++++++
>  hw/arm/virt-acpi-build.c        |  5 +++
>  include/hw/acpi/aml-build.h     |  1 +
>  include/hw/acpi/ghes.h          | 28 +++++++++++++
>  8 files changed, 131 insertions(+)
>  create mode 100644 hw/acpi/ghes.c
>  create mode 100644 include/hw/acpi/ghes.h
> 
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index 36a0e89..8fc09a4 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -42,3 +42,4 @@ CONFIG_FSL_IMX7=y
>  CONFIG_FSL_IMX6UL=y
>  CONFIG_SEMIHOSTING=y
>  CONFIG_ALLWINNER_H3=y
> +CONFIG_ACPI_APEI=y
> diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig
> index 54209c6..1932f66 100644
> --- a/hw/acpi/Kconfig
> +++ b/hw/acpi/Kconfig
> @@ -28,6 +28,10 @@ config ACPI_HMAT
>      bool
>      depends on ACPI
>  
> +config ACPI_APEI
> +    bool
> +    depends on ACPI
> +
>  config ACPI_PCI
>      bool
>      depends on ACPI && PCI
> diff --git a/hw/acpi/Makefile.objs b/hw/acpi/Makefile.objs
> index 777da07..28c5ddb 100644
> --- a/hw/acpi/Makefile.objs
> +++ b/hw/acpi/Makefile.objs
> @@ -8,6 +8,7 @@ common-obj-$(CONFIG_ACPI_NVDIMM) += nvdimm.o
>  common-obj-$(CONFIG_ACPI_VMGENID) += vmgenid.o
>  common-obj-$(CONFIG_ACPI_HW_REDUCED) += generic_event_device.o
>  common-obj-$(CONFIG_ACPI_HMAT) += hmat.o
> +common-obj-$(CONFIG_ACPI_APEI) += ghes.o
>  common-obj-$(call lnot,$(CONFIG_ACPI_X86)) += acpi-stub.o
>  common-obj-$(call lnot,$(CONFIG_PC)) += acpi-x86-stub.o
>  
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index 2c3702b..3681ec6 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -1578,6 +1578,7 @@ void acpi_build_tables_init(AcpiBuildTables *tables)
>      tables->table_data = g_array_new(false, true /* clear */, 1);
>      tables->tcpalog = g_array_new(false, true /* clear */, 1);
>      tables->vmgenid = g_array_new(false, true /* clear */, 1);
> +    tables->hardware_errors = g_array_new(false, true /* clear */, 1);
>      tables->linker = bios_linker_loader_init();
>  }
>  
> @@ -1588,6 +1589,7 @@ void acpi_build_tables_cleanup(AcpiBuildTables *tables, bool mfre)
>      g_array_free(tables->table_data, true);
>      g_array_free(tables->tcpalog, mfre);
>      g_array_free(tables->vmgenid, mfre);
> +    g_array_free(tables->hardware_errors, mfre);
>  }
>  
>  /*
> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> new file mode 100644
> index 0000000..e1b3f8f
> --- /dev/null
> +++ b/hw/acpi/ghes.c
> @@ -0,0 +1,89 @@
> +/*
> + * Support for generating APEI tables and recording CPER for Guests
> + *
> + * Copyright (c) 2020 HUAWEI TECHNOLOGIES CO., LTD.
> + *
> + * Author: Dongjiu Geng <gengdongjiu@huawei.com>
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
> + * You should have received a copy of the GNU General Public License along
> + * with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/units.h"
> +#include "hw/acpi/ghes.h"
> +#include "hw/acpi/aml-build.h"
> +
> +#define ACPI_GHES_ERRORS_FW_CFG_FILE        "etc/hardware_errors"
> +#define ACPI_GHES_DATA_ADDR_FW_CFG_FILE     "etc/hardware_errors_addr"
> +
> +/* The max size in bytes for one error block */
> +#define ACPI_GHES_MAX_RAW_DATA_LENGTH   (1 * KiB)
> +
> +/* Now only support ARMv8 SEA notification type error source */
> +#define ACPI_GHES_ERROR_SOURCE_COUNT        1
> +
> +/*
> + * Build table for the hardware error fw_cfg blob.
> + * Initialize "etc/hardware_errors" and "etc/hardware_errors_addr" fw_cfg blobs.
> + * See docs/specs/acpi_hest_ghes.rst for blobs format.
> + */
> +void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker)
> +{
> +    int i, error_status_block_offset;
> +
> +    /* Build error_block_address */
> +    for (i = 0; i < ACPI_GHES_ERROR_SOURCE_COUNT; i++) {
> +        build_append_int_noprefix(hardware_errors, 0, sizeof(uint64_t));
> +    }
> +
> +    /* Build read_ack_register */
> +    for (i = 0; i < ACPI_GHES_ERROR_SOURCE_COUNT; i++) {
> +        /*
> +         * Initialize the value of read_ack_register to 1, so GHES can be
> +         * writeable after (re)boot.
> +         * ACPI 6.2: 18.3.2.8 Generic Hardware Error Source version 2
> +         * (GHESv2 - Type 10)
> +         */
> +        build_append_int_noprefix(hardware_errors, 1, sizeof(uint64_t));
> +    }
> +
> +    /* Generic Error Status Block offset in the hardware error fw_cfg blob */
> +    error_status_block_offset = hardware_errors->len;
> +
> +    /* Reserve space for Error Status Data Block */
> +    acpi_data_push(hardware_errors,
> +        ACPI_GHES_MAX_RAW_DATA_LENGTH * ACPI_GHES_ERROR_SOURCE_COUNT);
> +
> +    /* Tell guest firmware to place hardware_errors blob into RAM */
> +    bios_linker_loader_alloc(linker, ACPI_GHES_ERRORS_FW_CFG_FILE,
> +                             hardware_errors, sizeof(uint64_t), false);
> +
> +    for (i = 0; i < ACPI_GHES_ERROR_SOURCE_COUNT; i++) {
> +        /*
> +         * Tell firmware to patch error_block_address entries to point to
> +         * corresponding "Generic Error Status Block"
> +         */
> +        bios_linker_loader_add_pointer(linker,
> +            ACPI_GHES_ERRORS_FW_CFG_FILE, sizeof(uint64_t) * i,
> +            sizeof(uint64_t), ACPI_GHES_ERRORS_FW_CFG_FILE,
> +            error_status_block_offset + i * ACPI_GHES_MAX_RAW_DATA_LENGTH);
> +    }
> +
> +    /*
> +     * tell firmware to write hardware_errors GPA into
> +     * hardware_errors_addr fw_cfg, once the former has been initialized.
> +     */
> +    bios_linker_loader_write_pointer(linker, ACPI_GHES_DATA_ADDR_FW_CFG_FILE,
> +        0, sizeof(uint64_t), ACPI_GHES_ERRORS_FW_CFG_FILE, 0);
> +}
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 7ef0733..cc6ffcd 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -48,6 +48,7 @@
>  #include "sysemu/reset.h"
>  #include "kvm_arm.h"
>  #include "migration/vmstate.h"
> +#include "hw/acpi/ghes.h"
>  
>  #define ARM_SPI_BASE 32
>  
> @@ -817,6 +818,10 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>      acpi_add_table(table_offsets, tables_blob);
>      build_spcr(tables_blob, tables->linker, vms);
>  
> +    if (vms->ras) {
> +        build_ghes_error_table(tables->hardware_errors, tables->linker);
> +    }
> +
>      if (ms->numa_state->num_nodes > 0) {
>          acpi_add_table(table_offsets, tables_blob);
>          build_srat(tables_blob, tables->linker, vms);
> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> index de4a406..8f13620 100644
> --- a/include/hw/acpi/aml-build.h
> +++ b/include/hw/acpi/aml-build.h
> @@ -220,6 +220,7 @@ struct AcpiBuildTables {
>      GArray *rsdp;
>      GArray *tcpalog;
>      GArray *vmgenid;
> +    GArray *hardware_errors;
>      BIOSLinker *linker;
>  } AcpiBuildTables;
>  
> diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
> new file mode 100644
> index 0000000..50379b0
> --- /dev/null
> +++ b/include/hw/acpi/ghes.h
> @@ -0,0 +1,28 @@
> +/*
> + * Support for generating APEI tables and recording CPER for Guests
> + *
> + * Copyright (c) 2020 HUAWEI TECHNOLOGIES CO., LTD.
> + *
> + * Author: Dongjiu Geng <gengdongjiu@huawei.com>
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
> + * You should have received a copy of the GNU General Public License along
> + * with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef ACPI_GHES_H
> +#define ACPI_GHES_H
> +
> +#include "hw/acpi/bios-linker-loader.h"
> +
> +void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker);
> +#endif
> -- 
> 1.8.3.1
