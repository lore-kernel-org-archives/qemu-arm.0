Received: by 2002:a17:505:4c56:b0:1be9:327d:8ee3 with SMTP id do22csp1232548njc;
        Mon, 25 Nov 2024 04:08:50 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCWB7AD85a71IX/preW/xcs+5uID0Ms8yEmgkRNSxcAWZnzUzl1PFbAwRraOA8kpOX5sPfFrYxeJuk1TZw==@linaro.org
X-Google-Smtp-Source: AGHT+IHKzHGB33aTZTF3AYTX8+SxbedNwPfC8eU4duIMjkzPklMeFt83YlXW73a1y7Z98bD7xRTP
X-Received: by 2002:a05:6102:54ac:b0:4af:d80:bb5 with SMTP id ada2fe7eead31-4af0d800c85mr5600333137.24.1732536530000;
        Mon, 25 Nov 2024 04:08:50 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1732536529; cv=pass;
        d=google.com; s=arc-20240605;
        b=CVlYlpCUAitLrIMoZOh3Xkl/0i+DYHQjRoaLrjnJi4hfENDa+ofMJ7iQKrfoQElJQ8
         0En6Y7aD4/vDJqo/smjNnMyTE2ELYZTePomLzIWfpCRGtwUiWhvfFQyYrnuZDT7IreRW
         8TVTQgEIbxy+UiKtLmm9L4CCZHCYKdz7ldv9W7lTAJPuRzlURbZCiC4olWeGYhOQBp4P
         LgfOoX9zJzcL5zG69wu42LFEFFyVmRIjmoKuQQiUirfT6RIBFVrw8RTn5ZFT5nDcnwcF
         8YeHm5yNVkWT2XqBypeMAHBPfyx0mzSxW/xX79sQRq9w+n4UJby3t4uWctma2GkpLqmo
         tWiQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date;
        bh=mMio6s2UekdiYNOAHuk9fTvzXNuXfVG1UvUATju7Ai8=;
        fh=ZKLzVs5YJK+rT7PGZi/v0Xzje/bg3VtWDfiiYF3X5vE=;
        b=DxFFF1RMTrR4pg4jU+C0Uk9EueSn+VzIgAiYxUeHehlgq2IiHVunnyAPk0a3q1yom2
         IN6gS8TodFGsGGE0hEpqVsSmKo2X8XjB0Z+9BpnZS0XQsQIPqX/h0jPKPcdXClg+rnJX
         IS8UQV+B60frKmRuHDwCUQyFBScAAa7kNCszt9ezQ0Q5x3Oga0yIgH0EvJsB2+fjTyGl
         SARf8eu0yqw0zDowIwR5aWSJ0H0Q6iwLdnA593fbaMKX/EAp6a0vMnwDjAYoctZQRhV7
         MvCmuEnbUfdFT5HmqqEngzdNCuHqZYe3AtvT27E4hDVq717YI2qydLo6uMcCRhy7tKBX
         Ammg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-420979-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-420979-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=huawei.com
Return-Path: <linux-kernel+bounces-420979-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id ada2fe7eead31-4adda67d73fsi2392818137.232.2024.11.25.04.08.49
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 04:08:49 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-420979-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-420979-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-420979-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=huawei.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0989516661D
	for <alex.bennee@linaro.org>; Mon, 25 Nov 2024 12:08:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E6D217109B;
	Mon, 25 Nov 2024 12:08:46 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3CDA1993BA
	for <linux-kernel@vger.kernel.org>; Mon, 25 Nov 2024 12:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732536525; cv=none; b=mfkGyFwwcdtFDEAQKK6/uGMjAxE5tmkVsKcGj8N+zL8+XSJ3+IRG1TdnXpLKINFh9/l9THpKGoiNmIVqL2ZbnS8YUrSJHgwuD35TWSpXxfHKsbyvFOdUc+hGy/TFxsJxakEeeXRp56j/87yyjNbefNLGiUmrcif/zkO7MzWu3Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732536525; c=relaxed/simple;
	bh=/xkrXIaugRuuagmqTpESWaiNTsCNva75KK44uG78IHI=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hUq9rdbKYocLrMKb7FHxy4WmVLM5sRPKPoTUnx/0634EfATewfa5ANu3O79DC+xbEEuiGH6F6Us9j1RDS20y2kbjzvYVSmdzQP8Ho97f1BpyWQW4s+4eIse5K3BrbbOWZkVGpE14zWSvv+UYYcXj123lDS2bO+UvS30wOOKLS/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XxkxH0Jmyz6LDQq;
	Mon, 25 Nov 2024 20:08:03 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 2DDD7140C98;
	Mon, 25 Nov 2024 20:08:33 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 25 Nov
 2024 13:08:32 +0100
Date: Mon, 25 Nov 2024 12:08:30 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC: Shiju Jose <shiju.jose@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>, Ani Sinha
	<anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>, Eduardo Habkost
	<eduardo@habkost.net>, "Igor Mammedov" <imammedo@redhat.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Peter Maydell
	<peter.maydell@linaro.org>, Shannon Zhao <shannon.zhaosl@gmail.com>, Yanan
 Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
	<linux-kernel@vger.kernel.org>, <qemu-arm@nongnu.org>,
	<qemu-devel@nongnu.org>
Subject: Re: [PATCH v2 5/5] acpi/generic_event_device: add logic to detect
 if HEST addr is available
Message-ID: <20241125120830.000025bf@huawei.com>
In-Reply-To: <7505ad000ed66099bf443fd7769c83bd7d5d4136.1732281080.git.mchehab+huawei@kernel.org>
References: <cover.1732281080.git.mchehab+huawei@kernel.org>
	<7505ad000ed66099bf443fd7769c83bd7d5d4136.1732281080.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml100012.china.huawei.com (7.191.174.184) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: k9UKerPASXxT

On Fri, 22 Nov 2024 14:14:15 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Create a new property (x-has-hest-addr) and use it to detect if
> the GHES table offsets can be calculated from the HEST address
> (qemu 9.2 and upper) or via the legacy way via an offset obtained
> from the hardware_errors firmware file.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Hi Mauro,

I think we still have a few inconsistencies in here on what can be
NULL and what can't.  See inline.

With those tidied up.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>


> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> index b5e3e2891445..a10f7e266a6a 100644
> --- a/hw/acpi/ghes.c
> +++ b/hw/acpi/ghes.c
> @@ -359,6 +359,8 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
>  {
>      AcpiTable table = { .sig = "HEST", .rev = 1,
>                          .oem_id = oem_id, .oem_table_id = oem_table_id };
> +    AcpiGedState *acpi_ged_state;
> +    AcpiGhesState *ags = NULL;

I don't think you need to set this any more.

>      int i;
>  
>      build_ghes_error_table(hardware_errors, linker, num_sources);
> @@ -379,10 +381,20 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
>       * tell firmware to write into GPA the address of HEST via fw_cfg,
>       * once initialized.
>       */
> -    bios_linker_loader_write_pointer(linker,
> -                                     ACPI_HEST_ADDR_FW_CFG_FILE, 0,
> -                                     sizeof(uint64_t),
> -                                     ACPI_BUILD_TABLE_FILE, hest_offset);
> +
> +    acpi_ged_state = ACPI_GED(object_resolve_path_type("", TYPE_ACPI_GED,
> +                                                       NULL));
> +    if (!acpi_ged_state) {
> +        return;
> +    }
> +
> +    ags = &acpi_ged_state->ghes_state;
> +    if (ags->hest_lookup) {
> +        bios_linker_loader_write_pointer(linker,
> +                                         ACPI_HEST_ADDR_FW_CFG_FILE, 0,
> +                                         sizeof(uint64_t),
> +                                         ACPI_BUILD_TABLE_FILE, hest_offset);
> +    }
>  }
>  
>  void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
> @@ -396,8 +408,10 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
>      fw_cfg_add_file_callback(s, ACPI_HW_ERROR_ADDR_FW_CFG_FILE, NULL, NULL,
>          NULL, &(ags->hw_error_le), sizeof(ags->hw_error_le), false);
>  
> -    fw_cfg_add_file_callback(s, ACPI_HEST_ADDR_FW_CFG_FILE, NULL, NULL,
> -        NULL, &(ags->hest_addr_le), sizeof(ags->hest_addr_le), false);
> +    if (ags && ags->hest_lookup) {
> +        fw_cfg_add_file_callback(s, ACPI_HEST_ADDR_FW_CFG_FILE, NULL, NULL,
> +            NULL, &(ags->hest_addr_le), sizeof(ags->hest_addr_le), false);
> +    }
>  
>      ags->present = true;

if (!ags) which the above check implies can happen, then
boom.  So I think you can just drop the check on ags above.

The current caller can never pass that in as NULL anyway and it would
make no sense to call this function with it as NULL.


>  }
> @@ -512,7 +526,7 @@ void ghes_record_cper_errors(const void *cper, size_t len,
>      }
>      ags = &acpi_ged_state->ghes_state;
>  
> -    if (!ags->hest_addr_le) {
> +    if (!ags->hest_lookup) {
>          get_hw_error_offsets(le64_to_cpu(ags->hw_error_le),
>                               &cper_addr, &read_ack_register_addr);
>      } else {
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index bd5582bc75f8..46ce3f3bb07a 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -893,6 +893,10 @@ static const AcpiNotificationSourceId hest_ghes_notify[] = {
>      { ACPI_HEST_SRC_ID_SYNC, ACPI_GHES_NOTIFY_SEA },
>  };
>  
> +static const AcpiNotificationSourceId hest_ghes_notify_9_1[] = {
> +    { ACPI_HEST_SRC_ID_SYNC, ACPI_GHES_NOTIFY_SEA },
> +};
> +
>  static
>  void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>  {
> @@ -946,10 +950,28 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>      build_dbg2(tables_blob, tables->linker, vms);
>  
>      if (vms->ras) {
> -        acpi_add_table(table_offsets, tables_blob);
> -        acpi_build_hest(tables_blob, tables->hardware_errors, tables->linker,
> -                        hest_ghes_notify, ARRAY_SIZE(hest_ghes_notify),
> -                        vms->oem_id, vms->oem_table_id);
> +        AcpiGhesState *ags;

Could push down to the scope of if (acpi_ged_state)
I don't think it really matters though.


> +        AcpiGedState *acpi_ged_state;
> +
> +        acpi_ged_state = ACPI_GED(object_resolve_path_type("", TYPE_ACPI_GED,
> +                                                       NULL));
> +        if (acpi_ged_state) {
> +            ags = &acpi_ged_state->ghes_state;
> +
> +            acpi_add_table(table_offsets, tables_blob);
> +
> +            if (!ags->hest_lookup) {
> +                acpi_build_hest(tables_blob, tables->hardware_errors,
> +                                tables->linker, hest_ghes_notify_9_1,
> +                                ARRAY_SIZE(hest_ghes_notify_9_1),
> +                                vms->oem_id, vms->oem_table_id);
> +            } else {
> +                acpi_build_hest(tables_blob, tables->hardware_errors,
> +                                tables->linker, hest_ghes_notify,
> +                                ARRAY_SIZE(hest_ghes_notify),
> +                                vms->oem_id, vms->oem_table_id);
> +            }
> +        }
>      }
>  
>      if (ms->numa_state->num_nodes > 0) {
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index a35c4a8faecb..00521a1963ba 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -34,10 +34,12 @@
>  #include "hw/virtio/virtio-pci.h"
>  #include "hw/virtio/virtio-net.h"
>  #include "hw/virtio/virtio-iommu.h"
> +#include "hw/acpi/generic_event_device.h"
>  #include "audio/audio.h"
>  
>  GlobalProperty hw_compat_9_1[] = {
>      { TYPE_PCI_DEVICE, "x-pcie-ext-tag", "false" },
> +    { TYPE_ACPI_GED, "x-has-hest-addr", "false" },
>  };
>  const size_t hw_compat_9_1_len = G_N_ELEMENTS(hw_compat_9_1);
>  
> diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
> index 237721fec0a2..164ed8b0f9a3 100644
> --- a/include/hw/acpi/ghes.h
> +++ b/include/hw/acpi/ghes.h
> @@ -61,6 +61,7 @@ typedef struct AcpiGhesState {
>      uint64_t hest_addr_le;
>      uint64_t hw_error_le;
>      bool present; /* True if GHES is present at all on this board */
> +    bool hest_lookup; /* True if HEST address is present */
>  } AcpiGhesState;
>  
>  /*

