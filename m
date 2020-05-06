Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1320767lfb;
        Wed, 6 May 2020 13:23:18 -0700 (PDT)
X-Google-Smtp-Source: APiQypIDnGD8+Dx9CESZd5pM+JSjc67D8a6867SjimTuC2aCJMKNAfw7n2DsdbXfwSqipuV7Ebgs
X-Received: by 2002:a17:906:2604:: with SMTP id h4mr8642904ejc.307.1588796598338;
        Wed, 06 May 2020 13:23:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588796598; cv=none;
        d=google.com; s=arc-20160816;
        b=wX6qsH+c0IKWvUUPQO8HNHTVpNtIqO3i5j1tjwnP88BkSIyNjOq9gZ9H0yUC8crz7G
         VoeToHN+n7Tn7XoaixCzUA9bp3mt9+dnjQQ77BI6v3nE/7a95PjtClfV+6PsHIxHf1lY
         10ayKhqKA9fzeidkyVizBW+f5emZ713RK2vmsKkys2cAfNCd1EJYBepimR82OlxqIMlI
         4vltZpnvSngiyO1YN6Z8BZXE868PgT27J3qq8SIckJPRM1mr0paj1XFGgl0bBR+Ewf3u
         iY7H1lY9EjPhdUCAOvlQ9UCQbJ1WtAbnUH0Z2kucMvTZOftzrz8XjqBHEzK7C5imtKTZ
         s3+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=p7xZNZC8Ssyf0SVCF5n0DEWEmiE42mwIr6yKi7/p/fU=;
        b=pyp2oNV0WLqPuC/B9qOU91xFjoWAit0EfUAwpT337nJx+/ExAIbEnLcAp3UfZysUao
         ZlJnrTUON/Ozd0+F9qp7bovGbmAWNz9MFUePmX4VaYcDHo/naR8xBH2EG1XqgdmVDrUV
         vntB/M1QG1iBe5VVEg/PWHbFq8yeDix01dSl0/0hnCMdh0Y0esagusGmSpU/KP0ZFGoI
         GJYJi/NTBUhMo7doToUgEr+cgo08Umbt0mFAf1uc9b2P2iZ7TRi251oljJosUseNyA3T
         TCth/i05Hl8CedPTkJ4SbDzvv1SQo1dIxYtXjug9ZICnXbxZRk2x5th5Fh0ZpNv8r7kP
         lPhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bA8aoMdc;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id n8si150567edo.572.2020.05.06.13.23.18;
        Wed, 06 May 2020 13:23:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bA8aoMdc;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728963AbgEFUXP (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Wed, 6 May 2020 16:23:15 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:58035 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728803AbgEFUXP (ORCPT
        <rfc822;kvm@vger.kernel.org>); Wed, 6 May 2020 16:23:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588796592;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=p7xZNZC8Ssyf0SVCF5n0DEWEmiE42mwIr6yKi7/p/fU=;
        b=bA8aoMdcfeRZm0eWbfkMMbZzAok80U1sLx59axJTr0+qdEWG8e4zMYo+D0qosijKyyGLZB
        h3wA+yi1DmgsbrfJhB6ueiM0W76JDI4pXWGjNh4FRhgbaNaYJsu6+GRz5EiAdAM1LceuSx
        +vViy/aY2dIOofKJLRIlMDIlhIoq4OE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-XB-vz50-PpK-nUuo6xqR-w-1; Wed, 06 May 2020 16:23:11 -0400
X-MC-Unique: XB-vz50-PpK-nUuo6xqR-w-1
Received: by mail-wr1-f70.google.com with SMTP id z5so1899294wrt.17
        for <kvm@vger.kernel.org>; Wed, 06 May 2020 13:23:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=p7xZNZC8Ssyf0SVCF5n0DEWEmiE42mwIr6yKi7/p/fU=;
        b=A7kJcVU70F+ezp6z6i0gTeHh5tzR9i93s9OzmUTkbDYp8DP7m/ugMp0yyn/DbmpQT/
         BVAHaCYprZbQXR+C0vSJP9kbg4PUMLaaqsKdvlsyMibw+cV/KLkqzJMbawCnpGt/ROuv
         ieHRhxHsj0Y86OulyMZjXtr38vzAl3e65ej0GvpN0NJrjr8AAGw80umZ8KhljnoWE4MR
         inilWVHT2avFBb+BX3KimVk6MB+86oWZNEayjbMJQ302nEfXFzLv6cleC2uJgPaN0VDr
         4aXBBxLEUrWxFX9h4mZIJfYdAOPM2qqew3nebcYTrGt0zdTuYdFhc2lwb4Kkh4GoP5eE
         Uqyg==
X-Gm-Message-State: AGi0PuZNphZaadMqNXa55Z9h9XPJxlwoqc1qlBs8Tr+SpbC7RILkaIzy
        dR0qHM6xXu0clIvw3iF0+sPE4xOhtWyDz/BOlc6CrwAd0+akIozLczRreVjZfROK8oNKyVo/JRD
        mfh5Dmfwa2H7+
X-Received: by 2002:a5d:6904:: with SMTP id t4mr6593847wru.234.1588796590121;
        Wed, 06 May 2020 13:23:10 -0700 (PDT)
X-Received: by 2002:a5d:6904:: with SMTP id t4mr6593832wru.234.1588796589831;
        Wed, 06 May 2020 13:23:09 -0700 (PDT)
Received: from redhat.com (bzq-109-66-7-121.red.bezeqint.net. [109.66.7.121])
        by smtp.gmail.com with ESMTPSA id c83sm4831275wmd.23.2020.05.06.13.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 13:23:09 -0700 (PDT)
Date:   Wed, 6 May 2020 16:23:06 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Dongjiu Geng <gengdongjiu@huawei.com>
Cc:     imammedo@redhat.com, xiaoguangrong.eric@gmail.com,
        peter.maydell@linaro.org, shannon.zhaosl@gmail.com, fam@euphon.net,
        rth@twiddle.net, ehabkost@redhat.com, mtosatti@redhat.com,
        qemu-devel@nongnu.org, kvm@vger.kernel.org, qemu-arm@nongnu.org,
        pbonzini@redhat.com, zhengxiang9@huawei.com,
        Jonathan.Cameron@huawei.com, linuxarm@huawei.com
Subject: Re: [PATCH v25 06/10] ACPI: Record the Generic Error Status Block
 address
Message-ID: <20200506162301-mutt-send-email-mst@kernel.org>
References: <20200410114639.32844-1-gengdongjiu@huawei.com>
 <20200410114639.32844-7-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200410114639.32844-7-gengdongjiu@huawei.com>
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: f//yhaDfkphk

On Fri, Apr 10, 2020 at 07:46:35PM +0800, Dongjiu Geng wrote:
> Record the GHEB address via fw_cfg file, when recording
> a error to CPER, it will use this address to find out
> Generic Error Data Entries and write the error.
> 
> In order to avoid migration failure, make hardware
> error table address to a part of GED device instead
> of global variable, then this address will be migrated
> to target QEMU.
> 
> Acked-by: Xiang Zheng <zhengxiang9@huawei.com>
> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

> ---
> change since v24:
> 1. Use s->ghes_state.ghes_addr_le to check in ghes_needed()
> 2. Using hardware_error->len instead of request_block_size to calculate in acpi_ghes_add_fw_cfg()
> 3. Remove assert(vms->acpi_dev) be build APEI table
> 4. Directly use ACPI_GED(vms->acpi_dev) instead of ACPI_GED(vms->acpi_dev)
> ---
>  hw/acpi/generic_event_device.c         | 19 +++++++++++++++++++
>  hw/acpi/ghes.c                         | 14 ++++++++++++++
>  hw/arm/virt-acpi-build.c               |  8 ++++++++
>  include/hw/acpi/generic_event_device.h |  2 ++
>  include/hw/acpi/ghes.h                 |  6 ++++++
>  5 files changed, 49 insertions(+)
> 
> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> index 021ed2b..1491291 100644
> --- a/hw/acpi/generic_event_device.c
> +++ b/hw/acpi/generic_event_device.c
> @@ -234,6 +234,24 @@ static const VMStateDescription vmstate_ged_state = {
>      }
>  };
>  
> +static bool ghes_needed(void *opaque)
> +{
> +    AcpiGedState *s = opaque;
> +    return s->ghes_state.ghes_addr_le;
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
> @@ -244,6 +262,7 @@ static const VMStateDescription vmstate_acpi_ged = {
>      },
>      .subsections = (const VMStateDescription * []) {
>          &vmstate_memhp_state,
> +        &vmstate_ghes_state,
>          NULL
>      }
>  };
> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> index 091fd87..e74af23 100644
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
> @@ -213,3 +215,15 @@ void acpi_build_hest(GArray *table_data, BIOSLinker *linker)
>      build_header(linker, table_data, (void *)(table_data->data + hest_start),
>          "HEST", table_data->len - hest_start, 1, NULL, NULL);
>  }
> +
> +void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
> +                          GArray *hardware_error)
> +{
> +    /* Create a read-only fw_cfg file for GHES */
> +    fw_cfg_add_file(s, ACPI_GHES_ERRORS_FW_CFG_FILE, hardware_error->data,
> +                    hardware_error->len);
> +
> +    /* Create a read-write fw_cfg file for Address */
> +    fw_cfg_add_file_callback(s, ACPI_GHES_DATA_ADDR_FW_CFG_FILE, NULL, NULL,
> +        NULL, &(ags->ghes_addr_le), sizeof(ags->ghes_addr_le), false);
> +}
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index f611bce..2726aac 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -911,6 +911,7 @@ void virt_acpi_setup(VirtMachineState *vms)
>  {
>      AcpiBuildTables tables;
>      AcpiBuildState *build_state;
> +    AcpiGedState *acpi_ged_state;
>  
>      if (!vms->fw_cfg) {
>          trace_virt_acpi_setup();
> @@ -941,6 +942,13 @@ void virt_acpi_setup(VirtMachineState *vms)
>      fw_cfg_add_file(vms->fw_cfg, ACPI_BUILD_TPMLOG_FILE, tables.tcpalog->data,
>                      acpi_data_len(tables.tcpalog));
>  
> +    if (vms->ras) {
> +        assert(vms->acpi_dev);
> +        acpi_ged_state = ACPI_GED(vms->acpi_dev);
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
> -- 
> 1.8.3.1
