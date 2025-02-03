Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp2015502njb;
        Mon, 3 Feb 2025 02:42:39 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCXNK3yZFI9/tAEfa5r0ZiM+gEpDsOGGcVKATnPYKKkkjoVwXHoazkuzNly6wZjFl8ze7HGtBeuxeSsyNQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFHcVqi2gwhMxVOG1DbNJR66695OyHyMIw6BtN9XW4hwqqamWeLF3CRdU4J84xSCy3GA4by
X-Received: by 2002:a05:622a:14f:b0:461:253e:cb8b with SMTP id d75a77b69052e-46fd0b94f92mr351690341cf.35.1738579358836;
        Mon, 03 Feb 2025 02:42:38 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1738579358; cv=pass;
        d=google.com; s=arc-20240605;
        b=T7G5avnCvvcvOHrtEC6HYsuQYGwP8eZkb3GECfpFWQonvl+nzZTXVxcbBJs4Ysyeok
         kc0RxA68QfGWjuIN+aRW6fDVxdk25j5SWhjI8iWKF5oMpQ1H/B7rm40U33ZSpyk7Q2eU
         yoIXny4fhqNIN9o81V4UyJ2c1zym17j1fzAVDJnwhZGlagwFDWJSyaiLjp8cudm0vL/7
         Brm7WbWG6sehgD0rojM1I32HP3+OehmG6T2vGiffj8rFXIONNWuEGmzilr9Pttvjm+V+
         OnJUheMgXP9Ez/wPsM4FQ+hDn+X9BklpBKZ+9yECCsL0+I5k9BLgVjxT7Bm4+3BW9+tJ
         y5Lw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date;
        bh=OqZTBlbVXl858yHTcqKhy2qRxwjUz7ll3OARACIFgXI=;
        fh=DjfmP4GuGmv+HIZ6mSuNbs+OASAdIuzO7/WHsW02d/E=;
        b=Eu1+RuV8PkdvpkI8gDyEIWwtH1jp6mkw6Wff0n5QZSYv3toGFLuGLcOnYOQd8vr02Z
         8iix0ay9v1F7IQtZ+1Ro8a4e2ZTUF2SErjddC25OSkcOvszRqfTjXaSAszk6Iuzkbo2P
         /dk6CNWf7N4wbaSctA3WUY3yUHAR/uBFRwwPQAJU92JuAE5KUtu1ZLdy7OEh3IRPjvr0
         11Glaqm1kt82Tev2lmajzDvHhUQg3dajGgr/xLgEXyZ/QhXM2QmS7oyHB4GZBEeyb/oK
         SKfgTNraxFXBw/J2kK/UwGFIbrvTVOkzKoN4XnzkEpLe2FkevZwPxm8896qMxuMrczos
         fhjg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-496343-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="linux-kernel+bounces-496343-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <linux-kernel+bounces-496343-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [147.75.199.223])
        by mx.google.com with ESMTPS id d75a77b69052e-46fdf0ad616si91638751cf.48.2025.02.03.02.42.38
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 02:42:38 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-496343-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) client-ip=147.75.199.223;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-496343-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="linux-kernel+bounces-496343-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DCA8F166AD2
	for <alex.bennee@linaro.org>; Mon,  3 Feb 2025 10:42:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 515FF201009;
	Mon,  3 Feb 2025 10:42:35 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A6A1F9F70
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 10:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738579355; cv=none; b=mRWjTIWB32Z4dm0kpYqx3a0FMxVlwE7NLyPZSfE6kKMVJcHwATCW2IBbk4l5L6PVIBRVXjtTkmMhjQk+kJrdGj+evKw0VlwKXf3qkpqwFV6WQCFrTR0uWNsAVx204WFUhOgdiaLUIPOIPijptDW1KzRMdj7s5wSqEuCkgE/NMlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738579355; c=relaxed/simple;
	bh=8peq6PQjqHnQsFjb09RCVA7dFM9wPhi+D+2hsiXWgm4=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CEz4qe4USgIAqJ5ZbiV/dzkz40kR42ODXbKeNP7l4r50Mta0FtA54tFvms7vjQTPBBLNftVtrL3I3t0DTY1pHSVHg4aMULtK+cg/mz97+TDT9ybciTQQ8uwJQfV5x9EMvFHW1cZSq+UtEpoF+xlRSqyfHx8Ptxzc1aIgzcTtZMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YmjjJ0tb2z6K9C1;
	Mon,  3 Feb 2025 18:41:40 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 9AC40140155;
	Mon,  3 Feb 2025 18:42:29 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 3 Feb
 2025 11:42:29 +0100
Date: Mon, 3 Feb 2025 10:42:27 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC: Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin"
	<mst@redhat.com>, Shiju Jose <shiju.jose@huawei.com>, <qemu-arm@nongnu.org>,
	<qemu-devel@nongnu.org>, Ani Sinha <anisinha@redhat.com>, Dongjiu Geng
	<gengdongjiu1@gmail.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 03/14] acpi/ghes: Use HEST table offsets when
 preparing GHES records
Message-ID: <20250203104227.000047b3@huawei.com>
In-Reply-To: <9610ff88cf6fdc59cbfc8871d653fd890391be1e.1738345063.git.mchehab+huawei@kernel.org>
References: <cover.1738345063.git.mchehab+huawei@kernel.org>
	<9610ff88cf6fdc59cbfc8871d653fd890391be1e.1738345063.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml500002.china.huawei.com (7.191.160.78) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: EOvNWsX8QbqO

On Fri, 31 Jan 2025 18:42:44 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> There are two pointers that are needed during error injection:
> 
> 1. The start address of the CPER block to be stored;
> 2. The address of the ack.
> 
> It is preferable to calculate them from the HEST table.  This allows
> checking the source ID, the size of the table and the type of the
> HEST error block structures.
> 
> Yet, keep the old code, as this is needed for migration purposes.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Tiny niggle on patch split up inline.  Either way

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> @@ -212,14 +237,6 @@ static void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker,
>  {
>      int i, error_status_block_offset;
>  
> -    /*
> -     * TODO: Current version supports only one source.
> -     * A further patch will drop this check, after adding a proper migration
> -     * code, as, for the code to work, we need to store a bios pointer to the
> -     * HEST table.
> -     */
> -    assert(num_sources == 1);
> -
>      /* Build error_block_address */
>      for (i = 0; i < num_sources; i++) {
>          build_append_int_noprefix(hardware_errors, 0, sizeof(uint64_t));
> @@ -352,6 +369,14 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
>                          .oem_id = oem_id, .oem_table_id = oem_table_id };
>      uint32_t hest_offset;
>      int i;
> +    AcpiGedState *acpi_ged_state;
> +    AcpiGhesState *ags = NULL;
> +
> +    acpi_ged_state = ACPI_GED(object_resolve_path_type("", TYPE_ACPI_GED,
> +                                                       NULL));
> +    if (acpi_ged_state) {
> +        ags = &acpi_ged_state->ghes_state;
> +    }
>  
>      hest_offset = table_data->len;
>  
> @@ -371,10 +396,12 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
>       * Tell firmware to write into GPA the address of HEST via fw_cfg,
>       * once initialized.
>       */
> -    bios_linker_loader_write_pointer(linker,
> -                                     ACPI_HEST_ADDR_FW_CFG_FILE, 0,
> -                                     sizeof(uint64_t),
> -                                     ACPI_BUILD_TABLE_FILE, hest_offset);
> +    if (ags->use_hest_addr) {

Maybe move ags->use_hest_addr introduction to previous patch to avoid
churn here?  It's not set yet anyway.

> +        bios_linker_loader_write_pointer(linker,
> +                                         ACPI_HEST_ADDR_FW_CFG_FILE, 0,
> +                                         sizeof(uint64_t),
> +                                         ACPI_BUILD_TABLE_FILE, hest_offset);
> +    }
>  }
>  
>  void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
> @@ -420,6 +447,78 @@ static void get_hw_error_offsets(uint64_t ghes_addr,
>      *read_ack_register_addr = ghes_addr + sizeof(uint64_t);
>  }



