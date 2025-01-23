Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp275317njk;
        Thu, 23 Jan 2025 08:49:11 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCU9SIeJIfkOwUAwVbx1hGWzdMlDWLI4DEhglA2C1hS+0erkMnd76W5NeDaEPMOxjRyWWMyzCSAq27K52A==@linaro.org
X-Google-Smtp-Source: AGHT+IHL4UML603Vq69Xa7mO3PUa3L1BTT8hFbJ3F/YNwlzkikUvjtEAwuFoQ0FnrPZs4KONnvI1
X-Received: by 2002:a17:907:1ca8:b0:aaf:ab71:bf79 with SMTP id a640c23a62f3a-ab38b11281cmr2137643866b.19.1737650951738;
        Thu, 23 Jan 2025 08:49:11 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1737650951; cv=pass;
        d=google.com; s=arc-20240605;
        b=X88V7AFYkG5bx4gSjBPUa9EODX7e6HAD0sVV/K7lAb9eEwxjgIL3AYxf6IaJ1wNp2f
         PcU2IwQP3PN/5UHFw66Pu4mJ5QpgUa3iZMcRRArR/zlYf3jk1Q3cilIrmQGHRzHeaVRq
         blNdCfIdOfka558302IeBpSNx8qle/e4VS/gNGNCX4nAlN1CIHduGy4JY/jljdCBpIG8
         Z2j0LkXeuGiXtQ/1GRp/oACVCiHYobbcYS/4t/OYDyjiqAPCFqzBcO/Kb7SJOe/POlbh
         nsM9jpyCKxzAxY1svgjpQDJoZSYFezGwMWd+wzzweBuYjODzYx6d3Lg/749pMTzISfs4
         cA+A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=A846SSVAga0FWQgMotl7xTneOljhOi68gJqo2uPQmcI=;
        fh=JgrdfHEyV1O6fbIgQhghh8nGAE4UZS5OGABaVgyY3NI=;
        b=D6fLZX9MS5ffk4lz1F2+vJsPy0mzuhlF1wqkb6KSZ2Ted1x1lssntiG1EFyLD6e6Vr
         4OioObYA35sGq6jCSKXTO2qeolKfvYKj02ng3pt8HhSoC412vYNG0YgSFY9eHTAlsmiE
         UZPll7it9d96w6wTT32jgdqmMmEZ2nM4Wwu8riFD3KpbajjWWkKpRPVv9a3RdMZGEN7I
         Cto+kvzCRzjlq1dqWRZ8T1K7c77LAg7GUoIvBrvjCxUARFIg/VFmnXtHPEA/IarQli2i
         UQ8pzrYiZXYQrSpnIENiMtt9EZSnPLl2osMhMYIpNV82LRNZzemqzSVY/Jn7KvDyAIu1
         S+QQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=D4Ui1eMn;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-486912-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-486912-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <linux-kernel+bounces-486912-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [2604:1380:4601:e00::3])
        by mx.google.com with ESMTPS id a640c23a62f3a-ab384fb558fsi1120861066b.278.2025.01.23.08.49.11
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 08:49:11 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-486912-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) client-ip=2604:1380:4601:e00::3;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=D4Ui1eMn;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-486912-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-486912-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 71F3E188B71D
	for <alex.bennee@linaro.org>; Thu, 23 Jan 2025 16:49:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE61213FD83;
	Thu, 23 Jan 2025 16:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D4Ui1eMn"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A695A70817
	for <linux-kernel@vger.kernel.org>; Thu, 23 Jan 2025 16:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737650946; cv=none; b=lYxDBXeB5Sd1Kz/cYCwhoRumleYWyRXan3BzHKYdybZdJTVEjzN61PLIoTYuOKHaeu0Ul3Jp3hTEYHMuOMg4yTGJlmZcc7gneO/XO+ZjCFlZhM1dOmY/O+Xmn1FcpURrhEQzfz5YM9kgAn3XzhE+N/Ua5uM/kpyNsbDnze47jZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737650946; c=relaxed/simple;
	bh=vibYuZHL7rWRJH5KfV4aLYQQmaqK/kzM4PqGvlr0WZM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OWB3MiMAjinEuzTNNTZ92SWsi7epx3RuKWM/tu7sqfAd9C/QnVGJMcWTiV/q3uiXJ20lDhtbwCLYQeD4nYwGL7eU014NgDSBORKylOuPpZx3gDfAZD7OUNbfrmbOmrsCl+Qlbkuc114wtRiwwvX+biSWLmPpG314zLb9RaBiLvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D4Ui1eMn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737650943;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A846SSVAga0FWQgMotl7xTneOljhOi68gJqo2uPQmcI=;
	b=D4Ui1eMniN2jRGksWYi0mWqL7SWkSALcgqZcB/QlJmeelUSN12F3hxMmc7fMWqV8VwDIZF
	Ax+ivUJKS6O4JtJjkvFZ823imqaAmrRBR4N6Hr7rHwh8pdQCI9oPqC6OYuiM1Zc5aYJzjY
	OPSX9FHgjzXRzCXFh9mAAXQ1RJjCxlM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-315-aCB15IjePBipijrdCHvDgQ-1; Thu, 23 Jan 2025 11:49:00 -0500
X-MC-Unique: aCB15IjePBipijrdCHvDgQ-1
X-Mimecast-MFC-AGG-ID: aCB15IjePBipijrdCHvDgQ
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3862a49fbdaso514632f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 23 Jan 2025 08:48:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737650939; x=1738255739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A846SSVAga0FWQgMotl7xTneOljhOi68gJqo2uPQmcI=;
        b=hkL47uTiYdU1rPkb3PjFJ9WCvL/FBAorvq2IV+mHeSnE/J+zmmonUkVLBC1MBPGAHM
         X72UusKqrnZHC8LfcxSEjJb5EZdevaTtMb1FlXSm0JxVmvhp50hUzvJ4uDmj01JgRYJE
         VLbLFbpX4z5bqUPZRuosNB0QUHUlM/f1izyIrLFYcdP5ehvw4v85Ah8sdjhmk4Ms5vjY
         6LOve3/Qa41fecrAdDWU0UvcCmrgDirQIXCnOS4GAGhCuquV0KLxmFqa2pjc4A5QgnPd
         B2dwfxk6D7bv3dLJ/5RWEF/poUNGU/Z9txJA4VHteEcXbDD3+BAJXHqzqXxrQFlgw1SH
         q+Ug==
X-Forwarded-Encrypted: i=1; AJvYcCXv5c63+IKUaIorXpPfcQY/CHGCzk9Kf22Dm346xzdONq5SXF++rXbvGXU8ZiIxsyY9KQsRmlJtIQHwyIg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnK6RBUrAY+SCSuNgegzVpsxOI8MTb1rQDYQpXNKKU4foyuHfy
	GR+6kTh/T9F6ILGzElPST9JXDpmlrUmILgcHI2Jgr9SSf49AEGCBbNQ+z69jAaoPTF5AIGrUC/P
	S9yEWqIXnySFQeam1uWXG4sl7SjWcRs38W5nwBT79Lx7Sqz6REAjMxSLPVF0vig==
X-Gm-Gg: ASbGncuspnwsmR/DgofLL3tIxd4QdeypFROyBAap1q19SQ6OW7pO88BPZaYibBoDb4i
	0k0Ki4VWGLBx2zp7o7VHllnqfXfYAJoDZEX1or5m5Vm/zsfUGCY6mOUtNskX9qGJWZm3cI20SUq
	opV3tLIxRERW1nnAnEt9OS75CWTqvt69+fqUUMOzxeb/5IrxSQfY3VPOyLwq6RFxidKFz5b0W+C
	03aGrgsBkluP/VXzoxsrzg9V5eNHTYKuIQqv6cmvaeOUhC77ODjuuiVPnCAMocTpY3LY22z7QGw
	iXSifEU0ZdprQvGw39TPlOwouCastrD8ZwZsv27HzQ==
X-Received: by 2002:a5d:5f50:0:b0:382:49f9:74bb with SMTP id ffacd0b85a97d-38bf57a9a6bmr26916124f8f.35.1737650938710;
        Thu, 23 Jan 2025 08:48:58 -0800 (PST)
X-Received: by 2002:a5d:5f50:0:b0:382:49f9:74bb with SMTP id ffacd0b85a97d-38bf57a9a6bmr26916096f8f.35.1737650938266;
        Thu, 23 Jan 2025 08:48:58 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1bb0d4sm161394f8f.69.2025.01.23.08.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 08:48:57 -0800 (PST)
Date: Thu, 23 Jan 2025 17:48:56 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Shiju Jose <shiju.jose@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/11] acpi/ghes: Prepare to support multiple sources on
 ghes
Message-ID: <20250123174856.7ea8be71@imammedo.users.ipa.redhat.com>
In-Reply-To: <781c65c9188c4649821885a62b6f6370ff7874d2.1737560101.git.mchehab+huawei@kernel.org>
References: <cover.1737560101.git.mchehab+huawei@kernel.org>
	<781c65c9188c4649821885a62b6f6370ff7874d2.1737560101.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: Fdm9Y+D+agNP

On Wed, 22 Jan 2025 16:46:18 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> The current code is actually dependent on having just one error
> structure with a single source.
> 
> As the number of sources should be arch-dependent, as it will depend on
> what kind of synchronous/assynchronous notifications will exist, change

I 'd drop 'synchronous/assynchronous' and just leave broader 'notifications'

> the logic to dynamically build the table.
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
> ---
>  hw/acpi/ghes.c           | 43 ++++++++++++++++++++++++++--------------
>  hw/arm/virt-acpi-build.c |  5 +++++
>  include/hw/acpi/ghes.h   | 21 +++++++++++++-------
>  3 files changed, 47 insertions(+), 22 deletions(-)
> 
> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> index b709c177cdea..3f519ccab90d 100644
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
> @@ -263,10 +272,12 @@ static void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker)
>  /* Build Generic Hardware Error Source version 2 (GHESv2) */
>  static void build_ghes_v2(GArray *table_data,
               ^^^^^^^^^^^^^

it's a bit unclear what name implies, maybe s/build_ghes_v2/build_ghes_v2_entry/

>                            BIOSLinker *linker,
> -                          enum AcpiGhesNotifyType notify,
> -                          uint16_t source_id)
> +                          const AcpiNotificationSourceId *notif_src,
> +                          uint16_t index, int num_sources)
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
> +                     const AcpiNotificationSourceId * const notif_source,
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
> +        build_ghes_v2(table_data, linker, &notif_source[i], i, num_sources);
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
                                                         ^^^ is this intentional?

> +                     int num_sources,
>                       const char *oem_id, const char *oem_table_id);
>  void acpi_ghes_add_fw_cfg(AcpiGhesState *vms, FWCfgState *s,
>                            GArray *hardware_errors);

