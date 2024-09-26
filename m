Received: by 2002:a17:505:5b18:b0:1be9:327d:8ee3 with SMTP id ox24csp895082njb;
        Thu, 26 Sep 2024 05:11:25 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCWW02hrQdCch3f1gt0I8CaNFiq4A2Tf1v4i8SzjHNEq/4llY41PyEkRt+3OpCPiJhVdrNjP+erp1nAQwg==@linaro.org
X-Google-Smtp-Source: AGHT+IG2/c7UkSN97WXYrpfOiPTV+oV5e3p4vVjajsN+QyG89xfr2zoGMIUinliiXWiWMX9RlHWz
X-Received: by 2002:a17:907:2d92:b0:a8d:6261:23ff with SMTP id a640c23a62f3a-a93a035da14mr565594366b.17.1727352685540;
        Thu, 26 Sep 2024 05:11:25 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1727352685; cv=pass;
        d=google.com; s=arc-20240605;
        b=JdE2r1n2sWPov6WTsJgAIeoXPkMqgx8FjmQmJyI6W43Yam5tHyuGJSYsNAi+BZ7yDa
         SZoOiqMG+Ym69I6AcxXpxtdbhLZ8nL57fvcG3j7MD/rJP3K/39fLmaKTLR2k7AWN09uk
         2nBjW8OpbzXPWmngGMKvk0uzAQtifC7BNjRNFK5KPuqctoHOhUqGBW4sntEUQUqiWDjK
         aqqgWbXxMOb2QCC+mqguoGp2TeNJ7qNDtn1fc39cu4EEQP58Tq2cBIXqwapxRAhOIR0j
         N+sCrwwAsidqik08ZgA1oiq7cfu3sT0iZ4Tx0l+cmfxrRScEXSP3H2ak+Kav4n26YB8v
         bC+A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date;
        bh=8stS4yWnGT64Y09x3RpJMCQloL0l5nsKgIUT3NuQdZM=;
        fh=sk20niJjP+LyGcAC6rY5I61AlgNCIPpR6UIhxIWLYTI=;
        b=VSNHqdK0Ofe+QeDyJ0zHB/PkX1Sst1WbRsN/noT9rehxZBjC93hjrixm+BQgxV7xE1
         NXb9UAdgxaMAOot0QRDjZFOEaWAEEYuYQ2SCoPnB4qhwFfaXHASd6VYINFGHgNPVYyHk
         vOf49SpjR5xc8kmmeA+yLsTAumK7DxS9yiGdvolcxvmM4hT3FABZhWY7FYs8jK4ABirE
         L0VcR82h1qf4aWmZuoh9/9TyDivLk0flcG1qbJSwk2Q2aMus0zMk1y06XMC4Ru+Ai0ir
         FQN1anetUg9z2gvE2iTIU5sLlxqPvs+PdryKWk4Js87U6mvaZbqxkn3yLbdItILrV+Gh
         oezg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-340430-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="linux-kernel+bounces-340430-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <linux-kernel+bounces-340430-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [147.75.80.249])
        by mx.google.com with ESMTPS id a640c23a62f3a-a93930ed68fsi388464766b.630.2024.09.26.05.11.25
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 05:11:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-340430-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) client-ip=147.75.80.249;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-340430-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="linux-kernel+bounces-340430-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C9A111F27ACC
	for <alex.bennee@linaro.org>; Thu, 26 Sep 2024 12:11:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 276A616DEDF;
	Thu, 26 Sep 2024 12:11:19 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6FD78C90
	for <linux-kernel@vger.kernel.org>; Thu, 26 Sep 2024 12:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727352679; cv=none; b=YP5dJ20Z+2OB79ZlbwtgIdtRIQLv+yxaVzi64OCiQbl/isij6TQIw9Y6Sl9XxxZikRJA9ADIi6ppZjG3vcLQNs8BrXP2RMCisaOxgbrfZUoxPbIsMAiel7x4NHVoFnR8vHd1nMEy7ttgXe8Fol5weEdx0y+4nf+eqZH3DdLySxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727352679; c=relaxed/simple;
	bh=42jNMJtcub2E6yRtX49iSRoZvJtTTF0+lG4Ns0keyjQ=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dj37Jrtan0Id+mCOgq+vi3vC/vUm51g6s5NahGOh/P/QTDimWv3+MZNVsV9lnsYnny8JIQt0DHeLJBgii4lNwVNnK7cCth1b+1iq5mCvPiScsGy0ZyT+xdYlDn6fPMO2mWqYSt3JOFPGoT1I85eRihJC6rVAoLs6iFMRlkYqfJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XDsqz3xGYz6J73k;
	Thu, 26 Sep 2024 20:10:39 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 9A8BC1401F3;
	Thu, 26 Sep 2024 20:11:14 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 26 Sep
 2024 14:11:14 +0200
Date: Thu, 26 Sep 2024 13:11:12 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC: Igor Mammedov <imammedo@redhat.com>, Shiju Jose <shiju.jose@huawei.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>, <linux-kernel@vger.kernel.org>,
	<qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: Re: [PATCH 13/15] acpi/ghes: rename etc/hardware_error file macros
Message-ID: <20240926131112.00002c49@Huawei.com>
In-Reply-To: <fb795e722d0b7baf9b1d3c328d7a3b917470194e.1727236561.git.mchehab+huawei@kernel.org>
References: <cover.1727236561.git.mchehab+huawei@kernel.org>
	<fb795e722d0b7baf9b1d3c328d7a3b917470194e.1727236561.git.mchehab+huawei@kernel.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml500004.china.huawei.com (7.191.163.9) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: +ntTwL/TsLK5

On Wed, 25 Sep 2024 06:04:18 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Now that we have also have a file to store HEST data location,
> which is part of GHES, better name the file where CPER records
> are stored.
> 
> No functional changes.
> 
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
In general fine, but I'd have preferred if you'd avoided
code realignment where possible so the changes are more minimal
and easier to spot.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>  hw/acpi/ghes.c | 32 +++++++++++++++++++-------------
>  1 file changed, 19 insertions(+), 13 deletions(-)
> 
> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> index 209095f67e9a..3d03506fdaf8 100644
> --- a/hw/acpi/ghes.c
> +++ b/hw/acpi/ghes.c
> @@ -28,8 +28,8 @@
>  #include "hw/nvram/fw_cfg.h"
>  #include "qemu/uuid.h"
>  
> -#define ACPI_GHES_ERRORS_FW_CFG_FILE        "etc/hardware_errors"
> -#define ACPI_GHES_DATA_ADDR_FW_CFG_FILE     "etc/hardware_errors_addr"
> +#define ACPI_HW_ERROR_FW_CFG_FILE           "etc/hardware_errors"
> +#define ACPI_HW_ERROR_ADDR_FW_CFG_FILE      "etc/hardware_errors_addr"
>  
>  /* The max size in bytes for one error block */
>  #define ACPI_GHES_MAX_RAW_DATA_LENGTH   (1 * KiB)
> @@ -249,7 +249,7 @@ static void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker,
>          ACPI_GHES_MAX_RAW_DATA_LENGTH * num_sources);
>  
>      /* Tell guest firmware to place hardware_errors blob into RAM */
> -    bios_linker_loader_alloc(linker, ACPI_GHES_ERRORS_FW_CFG_FILE,
> +    bios_linker_loader_alloc(linker, ACPI_HW_ERROR_FW_CFG_FILE,
>                               hardware_errors, sizeof(uint64_t), false);
>  
>      for (i = 0; i < num_sources; i++) {
> @@ -258,17 +258,21 @@ static void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker,
>           * corresponding "Generic Error Status Block"
>           */
>          bios_linker_loader_add_pointer(linker,
> -            ACPI_GHES_ERRORS_FW_CFG_FILE, sizeof(uint64_t) * i,
> -            sizeof(uint64_t), ACPI_GHES_ERRORS_FW_CFG_FILE,
> -            error_status_block_offset + i * ACPI_GHES_MAX_RAW_DATA_LENGTH);
> +                                       ACPI_HW_ERROR_FW_CFG_FILE,
> +                                       sizeof(uint64_t) * i,
> +                                       sizeof(uint64_t),
> +                                       ACPI_HW_ERROR_FW_CFG_FILE,
> +                                       error_status_block_offset +
> +                                       i * ACPI_GHES_MAX_RAW_DATA_LENGTH);

I'd rather it kept closer to original formatting so the changes are more obvious.

>      }
>  
>      /*
>       * tell firmware to write hardware_errors GPA into
>       * hardware_errors_addr fw_cfg, once the former has been initialized.
>       */
> -    bios_linker_loader_write_pointer(linker, ACPI_GHES_DATA_ADDR_FW_CFG_FILE,
> -        0, sizeof(uint64_t), ACPI_GHES_ERRORS_FW_CFG_FILE, 0);
> +    bios_linker_loader_write_pointer(linker, ACPI_HW_ERROR_ADDR_FW_CFG_FILE, 0,
> +                                     sizeof(uint64_t),
> +                                     ACPI_HW_ERROR_FW_CFG_FILE, 0);
>  }
>  
>  /* Build Generic Hardware Error Source version 2 (GHESv2) */
> @@ -307,8 +311,10 @@ static void build_ghes_v2(GArray *table_data,
>      build_append_gas(table_data, AML_AS_SYSTEM_MEMORY, 0x40, 0,
>                       4 /* QWord access */, 0);
>      bios_linker_loader_add_pointer(linker, ACPI_BUILD_TABLE_FILE,
> -        address_offset + GAS_ADDR_OFFSET, sizeof(uint64_t),
> -        ACPI_GHES_ERRORS_FW_CFG_FILE, index * sizeof(uint64_t));
> +                                   address_offset + GAS_ADDR_OFFSET,
> +                                   sizeof(uint64_t),
> +                                   ACPI_HW_ERROR_FW_CFG_FILE,
> +                                   index * sizeof(uint64_t));
As above. Closer to original code alignment and this would be easier to
review.

>  
>      /* Notification Structure */
>      build_ghes_hw_error_notification(table_data, notify);
> @@ -327,7 +333,7 @@ static void build_ghes_v2(GArray *table_data,
>      bios_linker_loader_add_pointer(linker, ACPI_BUILD_TABLE_FILE,
>                                     address_offset + GAS_ADDR_OFFSET,
>                                     sizeof(uint64_t),
> -                                   ACPI_GHES_ERRORS_FW_CFG_FILE,
> +                                   ACPI_HW_ERROR_FW_CFG_FILE,
>                                     (num_sources + index) * sizeof(uint64_t));
>  
>      /*
> @@ -368,11 +374,11 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
>                            GArray *hardware_error)
>  {
>      /* Create a read-only fw_cfg file for GHES */
> -    fw_cfg_add_file(s, ACPI_GHES_ERRORS_FW_CFG_FILE, hardware_error->data,
> +    fw_cfg_add_file(s, ACPI_HW_ERROR_FW_CFG_FILE, hardware_error->data,
>                      hardware_error->len);
>  
>      /* Create a read-write fw_cfg file for Address */
> -    fw_cfg_add_file_callback(s, ACPI_GHES_DATA_ADDR_FW_CFG_FILE, NULL, NULL,
> +    fw_cfg_add_file_callback(s, ACPI_HW_ERROR_ADDR_FW_CFG_FILE, NULL, NULL,
>          NULL, &(ags->ghes_addr_le), sizeof(ags->ghes_addr_le), false);
>  
>      ags->present = true;

