Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp3755413njk;
        Wed, 29 Jan 2025 05:16:10 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCWuzMRrCfbof9VOGkTKAR0ucIp5BsY9dvY77wgYc2XPAgRlVxf5WNphdqgM13yd3B+7f3VGtZcnnCQp1g==@linaro.org
X-Google-Smtp-Source: AGHT+IHvE0/E/wgXpuvVjmSoRMhYkwNkgXjJjX34FgXdZum4acRldo08f2UcpPt/fjNgTvvNqcLe
X-Received: by 2002:ad4:4eae:0:b0:6d8:7e03:c427 with SMTP id 6a1803df08f44-6e243c35b33mr55128026d6.20.1738156570098;
        Wed, 29 Jan 2025 05:16:10 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1738156570; cv=pass;
        d=google.com; s=arc-20240605;
        b=YG4HsyYhEVcG+DSfoE8JIrlF9/YGCEVs6I1wigMksOBO3TnYVVpHRd7eOyityroMGc
         uE4TtrpTT66pgzUtUklPFtanAOv/dJKBur0JS8JMBzuj+78ayGCcMr+bt3kGiKgrBB5H
         3IszaZLH7fdCsxnH/QlWIVILT6YqCio19TOmNjeLjtvPUxNCiCiiiA+I+u6DojeEf8GM
         XGV8qrtHCTQVyiws+3IaXe3NgLlaahSyqrAZrzazEgsRybEtXjeocMNyYDvjKbrYXTSF
         SuA2l7nz+/SbIZMzq9DXnLAke2QZjKuV8yVvDDoFkUueqH8ICXawBngdCzSe+kqDwU42
         xuUQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=lXI2+Zoyfv46KfKjj+36x3banSuEK0iJ46ZIMkLItVc=;
        fh=TsA5C/AZ77FjhEjq9nwOnpto+8bADexzhznKSd2ntlU=;
        b=SQ5sY1GNA3YSblmKuhYIWFDY4D55RTF1TDcaJerVBZEhdin9kFo6K+hLrMzua9z8a5
         /Z3fYwiUJiHtfTqHHooOckLk/rwjOBzDUiKF62m8iuLmXpAHdg/a+EWWW3CeR1o4sCGU
         iR8IxFU/96jKZhSMuHJM4KVz5qwfPxKgdWVyYqmTBoaNmpWDdHev+ciIks1aaHvX37n4
         3aF5u9zorfrg6gfjdggdfszu6TgEX6568LmfAm6UAeDDSwjpFc8YRxdegA4H0W5pszN0
         Q8f089hRKjOpsHP6vnaHRctPcjRJ4NzPjJzJ6NFuh2EGszQPJIlOBArD5UecCIfn5hDo
         liOg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Cde51jQM;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-492492-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="linux-kernel+bounces-492492-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <linux-kernel+bounces-492492-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [147.75.199.223])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e2053651c3si146981246d6.132.2025.01.29.05.16.09
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 05:16:10 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-492492-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) client-ip=147.75.199.223;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Cde51jQM;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-492492-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="linux-kernel+bounces-492492-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F1C09167B80
	for <alex.bennee@linaro.org>; Wed, 29 Jan 2025 13:16:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E808FB661;
	Wed, 29 Jan 2025 13:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Cde51jQM"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E181C79DC
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 13:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738156565; cv=none; b=fLpU0c10RrGa5C21I8ucplOW2x3jRRMIhdXx0eQ+5EmqDlM4/iUvNT3eJQODM7CjCeqQZkTyXWMa42B8MublR4cTSyxtqmijZeG99V40jJQenD6jlKxK/WhGUhtmhTWvHQXRQjyYcW1PQt5+f7KwwekGAN8nQwVnepUQ3xGtvuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738156565; c=relaxed/simple;
	bh=4iJUP5Dy2dQgFB6JyPT0053k8zmMM8FHsxjK8tnzV3I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mtIe+G3e2HAM7ei0OGUQCymNO3fATRCb1Mk6Fb9yxtw+SlFOa3ZjrCZrmwM8YfRUvbg1B0spYvlvxXwT1TokRfc3xlUD4jy9fF6JHM49/9sODZ6AGaBdctWA3QXxJLjuEh3G+UiEsEawMnnoFMGITMGBhm1NApqG+Y/dAkPrB+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Cde51jQM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738156562;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lXI2+Zoyfv46KfKjj+36x3banSuEK0iJ46ZIMkLItVc=;
	b=Cde51jQM2+4MdCGmrnacFCBBigVIeyBBjCX9cZ2BlrhBTOaAzapWaamwQarVgiJcNUNu6X
	ITbS6X9uE8jw/KVX1W6sPSTiJI7cv7+CEmA3ubQFINFPzIsVSEUGbaYBV/2kKHVTQP+z2A
	9mdNbpP2wGvJoI1rUSKS+sbYl+haaRA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-511-oO-YDVmHPb-K4lxU_AQfcg-1; Wed, 29 Jan 2025 08:16:01 -0500
X-MC-Unique: oO-YDVmHPb-K4lxU_AQfcg-1
X-Mimecast-MFC-AGG-ID: oO-YDVmHPb-K4lxU_AQfcg
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3862e986d17so2927868f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 05:16:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738156560; x=1738761360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lXI2+Zoyfv46KfKjj+36x3banSuEK0iJ46ZIMkLItVc=;
        b=fB5J/pOXKrnzrhmUJMqGaa5hVfMVMBDFAHOeC/facl7oHMaB0ZD2Q/vGNl97Exns6r
         Z9NEAGWVUbIWQzFBeq+JbyUg1dTj5dUenm0XaWpsFqlTyC5ZtkOlrstrDYfV+PcBzRrt
         peqVFEtGMbukxW7rQi9AXV8d5EqFWNJ76AsQs4w9naSbh5CXOFlmkyQqiQwXnuknBkkX
         fLLKxuy1hC8eGCw0WUmDP4+9roYztUy97ZIF2Iy/OsTq0jOm6xtRhagldt5pwWyyWQ0/
         du3oVTFM0+p355nTjBocUjkYn1JG9hiDe2vjFUQoe54Fg3PL4XNiNMGCMd7hQmJH4aoH
         yBHg==
X-Forwarded-Encrypted: i=1; AJvYcCU5djov1UdD5S4c3Jp0C9+jSmXpeDCN1KE89/ATSpmjZMnfEKfpPg1GJZLiBRYGuGzHBEtdUL6fkazU+V4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5KVF9Ww8wsscmjQrMg9HmY16c/Fy2Fq973RUPFnqVFx/GkAM1
	7jFdWyKBx+irvUibZQpczOePUWYKvN9/sknY4Tm1uCQn2ONR2CSwboQpwmTId6xFgnlbS1kT65u
	qJkArdXtSis8StrUdw+HI3GGQtROygXMo5KVbHEHKkk024oGWCjYV79Vc7e+tUA==
X-Gm-Gg: ASbGncvB5jZOs55lS4A8DujAZAY6UufUnCewla3d2T+R7fpxyDRgqRd3wi4pLnQGRh8
	CiFLjVs34hba6xqD/KS4ky28f4YcnOk3i4BoSTgyNaRP1ntj5eAFKkI9ZR+9/irzZ40mHLkkSsJ
	eo4Kia+COwG20XuzvkQ2Zi6aWVqDeCZnw4zHHDR6wXRAPBTmoQqUDZWIPyO9g7h784saGPx+D1b
	yO5qBArPIYPrO1M6owdXcWuUgADn0wv61x7pCoxB6Mv7VJTgpcjsOYSFxnjVjdyULRNal7SH/03
	yWBD+ngQsz05ApqqMWd66ruBaMOMo+jHTA5tn2i15o8X248vH72k
X-Received: by 2002:a05:6000:1acc:b0:38a:418e:bee with SMTP id ffacd0b85a97d-38c51e919b6mr2593625f8f.42.1738156560426;
        Wed, 29 Jan 2025 05:16:00 -0800 (PST)
X-Received: by 2002:a05:6000:1acc:b0:38a:418e:bee with SMTP id ffacd0b85a97d-38c51e919b6mr2593580f8f.42.1738156559938;
        Wed, 29 Jan 2025 05:15:59 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a188a61sm17261298f8f.52.2025.01.29.05.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 05:15:59 -0800 (PST)
Date: Wed, 29 Jan 2025 14:15:58 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Shiju Jose <shiju.jose@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/13] acpi/ghes: Prepare to support multiple sources
 on ghes
Message-ID: <20250129141558.1e3c8e0c@imammedo.users.ipa.redhat.com>
In-Reply-To: <b1ae283c63e66c128387ffcad37fc91744f56981.1738137123.git.mchehab+huawei@kernel.org>
References: <cover.1738137123.git.mchehab+huawei@kernel.org>
	<b1ae283c63e66c128387ffcad37fc91744f56981.1738137123.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: GQlsQcWvgBDu

On Wed, 29 Jan 2025 09:04:07 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> The current code is actually dependent on having just one error
> structure with a single source.
> 
> As the number of sources should be arch-dependent, as it will depend on
> what kind of notifications will exist, change the logic to dynamically
> build the table.
> 
> Yet, for a proper support, we need to get the number of sources by
> reading the number from the HEST table. However, bios currently doesn't
> store a pointer to it.
> 
> For now just change the logic at table build time, while enforcing that
> it will behave like before with a single source ID.
> 
> A future patch will add a HEST table bios pointer and change the logic
> at acpi_ghes_record_errors() to dynamically use the new size.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/acpi/ghes.c           | 47 +++++++++++++++++++++++++---------------
>  hw/arm/virt-acpi-build.c |  5 +++++
>  include/hw/acpi/ghes.h   | 21 ++++++++++++------
>  3 files changed, 49 insertions(+), 24 deletions(-)
> 
> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> index b709c177cdea..4cabb177ad47 100644
> --- a/hw/acpi/ghes.c
> +++ b/hw/acpi/ghes.c
> @@ -206,17 +206,26 @@ ghes_gen_err_data_uncorrectable_recoverable(GArray *block,
>   * Initialize "etc/hardware_errors" and "etc/hardware_errors_addr" fw_cfg blobs.
>   * See docs/specs/acpi_hest_ghes.rst for blobs format.
>   */
> -static void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker)
> +static void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker,
> +                                   int num_sources)
>  {
>      int i, error_status_block_offset;
>  
> +    /*
> +     * TODO: Current version supports only one source.
> +     * A further patch will drop this check, after adding a proper migration
> +     * code, as, for the code to work, we need to store a bios pointer to the
> +     * HEST table.
> +     */
> +    assert(num_sources == 1);
> +
>      /* Build error_block_address */
> -    for (i = 0; i < ACPI_GHES_ERROR_SOURCE_COUNT; i++) {
> +    for (i = 0; i < num_sources; i++) {
>          build_append_int_noprefix(hardware_errors, 0, sizeof(uint64_t));
>      }
>  
>      /* Build read_ack_register */
> -    for (i = 0; i < ACPI_GHES_ERROR_SOURCE_COUNT; i++) {
> +    for (i = 0; i < num_sources; i++) {
>          /*
>           * Initialize the value of read_ack_register to 1, so GHES can be
>           * writable after (re)boot.
> @@ -231,13 +240,13 @@ static void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker)
>  
>      /* Reserve space for Error Status Data Block */
>      acpi_data_push(hardware_errors,
> -        ACPI_GHES_MAX_RAW_DATA_LENGTH * ACPI_GHES_ERROR_SOURCE_COUNT);
> +        ACPI_GHES_MAX_RAW_DATA_LENGTH * num_sources);
>  
>      /* Tell guest firmware to place hardware_errors blob into RAM */
>      bios_linker_loader_alloc(linker, ACPI_HW_ERROR_FW_CFG_FILE,
>                               hardware_errors, sizeof(uint64_t), false);
>  
> -    for (i = 0; i < ACPI_GHES_ERROR_SOURCE_COUNT; i++) {
> +    for (i = 0; i < num_sources; i++) {
>          /*
>           * Tell firmware to patch error_block_address entries to point to
>           * corresponding "Generic Error Status Block"
> @@ -261,12 +270,14 @@ static void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker)
>  }
>  
>  /* Build Generic Hardware Error Source version 2 (GHESv2) */
> -static void build_ghes_v2(GArray *table_data,
> -                          BIOSLinker *linker,
> -                          enum AcpiGhesNotifyType notify,
> -                          uint16_t source_id)
> +static void build_ghes_v2_entry(GArray *table_data,
> +                                BIOSLinker *linker,
> +                                const AcpiNotificationSourceId *notif_src,
> +                                uint16_t index, int num_sources)
>  {
>      uint64_t address_offset;
> +    const uint16_t notify = notif_src->notify;
> +    const uint16_t source_id = notif_src->source_id;
>  
>      /*
>       * Type:
> @@ -297,7 +308,7 @@ static void build_ghes_v2(GArray *table_data,
>                                     address_offset + GAS_ADDR_OFFSET,
>                                     sizeof(uint64_t),
>                                     ACPI_HW_ERROR_FW_CFG_FILE,
> -                                   source_id * sizeof(uint64_t));
> +                                   index * sizeof(uint64_t));
>  
>      /* Notification Structure */
>      build_ghes_hw_error_notification(table_data, notify);
> @@ -317,8 +328,7 @@ static void build_ghes_v2(GArray *table_data,
>                                     address_offset + GAS_ADDR_OFFSET,
>                                     sizeof(uint64_t),
>                                     ACPI_HW_ERROR_FW_CFG_FILE,
> -                                   (ACPI_GHES_ERROR_SOURCE_COUNT + source_id)
> -                                   * sizeof(uint64_t));
> +                                   (num_sources + index) * sizeof(uint64_t));
>  
>      /*
>       * Read Ack Preserve field
> @@ -333,19 +343,23 @@ static void build_ghes_v2(GArray *table_data,
>  /* Build Hardware Error Source Table */
>  void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
>                       BIOSLinker *linker,
> +                     const AcpiNotificationSourceId *notif_source,
> +                     int num_sources,
>                       const char *oem_id, const char *oem_table_id)
>  {
>      AcpiTable table = { .sig = "HEST", .rev = 1,
>                          .oem_id = oem_id, .oem_table_id = oem_table_id };
> +    int i;
>  
> -    build_ghes_error_table(hardware_errors, linker);
> +    build_ghes_error_table(hardware_errors, linker, num_sources);
>  
>      acpi_table_begin(&table, table_data);
>  
>      /* Error Source Count */
> -    build_append_int_noprefix(table_data, ACPI_GHES_ERROR_SOURCE_COUNT, 4);
> -    build_ghes_v2(table_data, linker,
> -                  ACPI_GHES_NOTIFY_SEA, ACPI_HEST_SRC_ID_SEA);
> +    build_append_int_noprefix(table_data, num_sources, 4);
> +    for (i = 0; i < num_sources; i++) {
> +        build_ghes_v2_entry(table_data, linker, &notif_source[i], i, num_sources);
> +    }
>  
>      acpi_table_end(linker, &table);
>  }
> @@ -410,7 +424,6 @@ void ghes_record_cper_errors(const void *cper, size_t len,
>      }
>      ags = &acpi_ged_state->ghes_state;
>  
> -    assert(ACPI_GHES_ERROR_SOURCE_COUNT == 1);
>      get_hw_error_offsets(le64_to_cpu(ags->hw_error_le),
>                           &cper_addr, &read_ack_register_addr);
>  
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 3ac8f8e17861..3d411787fc37 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -893,6 +893,10 @@ static void acpi_align_size(GArray *blob, unsigned align)
>      g_array_set_size(blob, ROUND_UP(acpi_data_len(blob), align));
>  }
>  
> +static const AcpiNotificationSourceId hest_ghes_notify[] = {
> +    { ACPI_HEST_SRC_ID_SYNC, ACPI_GHES_NOTIFY_SEA },
> +};
> +
>  static
>  void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>  {
> @@ -948,6 +952,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>      if (vms->ras) {
>          acpi_add_table(table_offsets, tables_blob);
>          acpi_build_hest(tables_blob, tables->hardware_errors, tables->linker,
> +                        hest_ghes_notify, ARRAY_SIZE(hest_ghes_notify),
>                          vms->oem_id, vms->oem_table_id);
>      }
>  
> diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
> index 39619a2457cb..9f0120d0d596 100644
> --- a/include/hw/acpi/ghes.h
> +++ b/include/hw/acpi/ghes.h
> @@ -57,20 +57,27 @@ enum AcpiGhesNotifyType {
>      ACPI_GHES_NOTIFY_RESERVED = 12
>  };
>  
> -enum {
> -    ACPI_HEST_SRC_ID_SEA = 0,
> -    /* future ids go here */
> -
> -    ACPI_GHES_ERROR_SOURCE_COUNT
> -};
> -
>  typedef struct AcpiGhesState {
>      uint64_t hw_error_le;
>      bool present; /* True if GHES is present at all on this board */
>  } AcpiGhesState;
>  
> +/*
> + * ID numbers used to fill HEST source ID field
> + */
> +enum AcpiGhesSourceID {
> +    ACPI_HEST_SRC_ID_SYNC,
> +};
> +
> +typedef struct AcpiNotificationSourceId {
> +    enum AcpiGhesSourceID source_id;
> +    enum AcpiGhesNotifyType notify;
> +} AcpiNotificationSourceId;
> +
>  void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
>                       BIOSLinker *linker,
> +                     const AcpiNotificationSourceId * const notif_source,
> +                     int num_sources,
>                       const char *oem_id, const char *oem_table_id);
>  void acpi_ghes_add_fw_cfg(AcpiGhesState *vms, FWCfgState *s,
>                            GArray *hardware_errors);

