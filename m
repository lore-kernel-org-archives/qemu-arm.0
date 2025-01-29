Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp3837563njk;
        Wed, 29 Jan 2025 07:23:42 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCUqSanYKnSmOlFB6QIjGH5fjjpiSjO3gnM7rltZklKaPkazyRkB4N8dU9eEP0oYd7ZaarqSryfU9b2aWg==@linaro.org
X-Google-Smtp-Source: AGHT+IHTlWe793L2SqqfhJ4jquatTQ/4qVBcx3vqfWGpw1qx/zKSmcSAW0HOQJGF8wZhvisHvaSR
X-Received: by 2002:a17:907:7619:b0:ab6:de32:da61 with SMTP id a640c23a62f3a-ab6de32db9fmr30081366b.5.1738164222055;
        Wed, 29 Jan 2025 07:23:42 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1738164222; cv=pass;
        d=google.com; s=arc-20240605;
        b=XS1PdsaxZ9xxluuSJzm+dc81ONjXXXk4ucrKphgM6h1zGS461rrvX7rAOeVmr3ucTw
         Va1BE7Bmb81FavJAU1uiTyia+noi/9hETiKfu8x2GuYmpf1PBwwd+dJXERZofCVuFkHM
         k2dPu1RB5QNWc+KtIB6nQ7cucHGXs1lR8v+avPKa7/nyOXLqpUd3ya5j8QPspOWkrn7w
         mhiENlHoj3zoaVpFkRK5gGfFZhRYGemOKpfuoA6CdYni+5QV4xgAJCB0s+YIuAn+WKo5
         7GRXIIP/8BejD/Sp5ljlcYGjGK61rbHc/ZOxHTSBIid5NGWfTngWp/8rrhbUwyt2E9WM
         6DBQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=oA3yWs7c8bDIgIX82kAPNrS7GmCTA2Npsse3oH3dhbs=;
        fh=ODBMgfWfGFTuBzYQmgMvxPrymH52q1lu4Ee/wh2lnhg=;
        b=FIDfpn4IraAUrtiPobDMQ5VJMWT1Gvr/gOFf1lvfYR6T5Mr2j2JotQrF+2IoobN1zq
         oUI2i9YOGMqs3slzWrMwU4ZKlH7jdufQYfiW2VBTsnWRcgS6tHo4Okmenc/TkynkjFSm
         /eIj0ApEwY6SJnPDuGooaoCUyP5At8Bmii3M/vGTSv82a629MFByhMJCrMPm9+Aao4jg
         wdHDCZHcEFbgB5f7gumkvp6NRdpRJHCjUy7aCqGxe60vVT40moTx9E6jfZIevXA63jvY
         dTc8RhKpoKjkIjyQa5qJU6RK8DH17K/sagyQaHJmbUaSbDYSbludI2mTtYKN7VHeXdVC
         Ro1Q==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Lj2qC21w;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-492665-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-492665-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <linux-kernel+bounces-492665-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [2604:1380:4601:e00::3])
        by mx.google.com with ESMTPS id a640c23a62f3a-ab67626dbccsi905199066b.438.2025.01.29.07.23.41
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 07:23:42 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-492665-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) client-ip=2604:1380:4601:e00::3;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Lj2qC21w;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-492665-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-492665-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4708D1887A76
	for <alex.bennee@linaro.org>; Wed, 29 Jan 2025 15:23:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42B811BEF78;
	Wed, 29 Jan 2025 15:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Lj2qC21w"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FD115B102
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 15:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738164216; cv=none; b=Y06coP5s/yKaFsRooXNLmR5SRarLUNeHGSv/E0vfIJMD0nyzUEFrqeQ61zWjhxIqWNliW1srCguNTy8PMuRB/ylAvDKpfWa6M2fgo2yjw8RiuRNuSmkwQrjvhKGIil6vac0MLiKhzEX2/JkC8xwYDEKBlfBxjHFJI1xduySjTZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738164216; c=relaxed/simple;
	bh=WuswXIPTDC3/ZopJ6Vg4t25zU1CNcj9La4lg9zfuVMM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ho+L9DBchTVwes6upH4hx4GVDlYoZBgjyXDdsZ42loTfA5IQtkbqs5BnTrw17ekQ+U26uDyPmkvulmVQtSlSGDchKdsavsFosWK8FBKOYTjCGM+Zx7hqkN+8Z9oIdFCnC+2qnCKiWAcv46CjQuKRpzTCuxzeDpcpnsMHYT3ZWE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Lj2qC21w; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738164213;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oA3yWs7c8bDIgIX82kAPNrS7GmCTA2Npsse3oH3dhbs=;
	b=Lj2qC21wGHuGts3xMF6tbahTLDeoU53QV2W5+CCeuG1P2eXKbInq37mjEMV2wCrpVFuFlR
	pMUIYDVeAWjWss5qM2Q+7TzqgUBq73P+a4GN/X+kR+A/pp/IZsrUVpWCrXKgLJ7mHXNp0D
	SkemtVY4YLHE1DHzDm44DUoL+Ww1S80=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-185-FK6oLwHXNvuUB_RCH0dhUw-1; Wed, 29 Jan 2025 10:23:31 -0500
X-MC-Unique: FK6oLwHXNvuUB_RCH0dhUw-1
X-Mimecast-MFC-AGG-ID: FK6oLwHXNvuUB_RCH0dhUw
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43631d8d9c7so4579925e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 07:23:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738164210; x=1738769010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oA3yWs7c8bDIgIX82kAPNrS7GmCTA2Npsse3oH3dhbs=;
        b=AEX3d/8FyfQh2+42QE0kj3e+9MVKzD19usWptTYXSx5BjzotoEL75keP3cfpOO45Tx
         wOjKXcpUB/qcGmgHKxpE6M/TlXXGXOcTfHEI9NUzUJ2TSuK5c1Xqx8cqTfEtGOg8gA/N
         xuV0g1qq5YeSjUbFlOlx4lw78//naM2sJ+AP+9lu/iyZVrvFLTC3PkAewyy3+bQ3hlnr
         X3AYQBrjor8JcT2AiGmG2sM9f/3cMGm6e23ikDgmUMi0Hb1giagmjghu9R6B9UWL3wKM
         eIQ6KjDyxhOgIyUqnHCx2ZJE9pQMLrjwMflTRdHqb7I8IKAhKaK4d3R1BypOuxOAPVHg
         4k6w==
X-Forwarded-Encrypted: i=1; AJvYcCV5WFPfklrlu0pn0j8mJyf2IpyJjXA6XR8C9TZgWlk6hnP3OruwWGjyES3FdLp2G+hEs44xrdxLoC9JNas=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMFLqPCwYbwl+80j0T12cDxw0rlQ5EcBkmIkpMrS0XirMoA4F/
	nXouyQ3tjOGMXGi2ZQR8l7tTXmjr4iL0AzxlCqH7HWr7LSgTYBZhc6VPN3PqqhKAz77zkhnD/Lu
	6WhpzEYR8B3lywlio7nf3SjzP7zkyWaSh6Mfk/oAhIPC3tv6Pm9HZhnTF8QbXWA==
X-Gm-Gg: ASbGncv/fc8BmnTLnaTUkJmerpKOE6KouGptBQUuo/HY4DrJSiAewV4Z5VVcIQO0t6p
	VcRPSRjgAMMXIpHhtC39gHqImxW0WEsw7jVg2VUMNRTg2Fgmz4YhHf7tQlGyFRXs5rKXync8lQE
	ltqemprH4BJSJ4LjXnSRx48QjzEVKw6LfE/3IlKhp+kxDMXJh1V5gMhJMOGQkO6gbcDSMDhwOOL
	dkHuiZyjr7Piz4KNoMMQzlJoRSMJstfegQSwrSCojhTKxJuNptuGUml6j9evrG+ERPA5apsWiu3
	jxajgdtGib4WeamLTQindN3rHSxPSROdOK91oudXkmCBPoayEDqy
X-Received: by 2002:a05:600c:6c92:b0:437:c453:ff19 with SMTP id 5b1f17b1804b1-438d59b566dmr69106725e9.14.1738164210177;
        Wed, 29 Jan 2025 07:23:30 -0800 (PST)
X-Received: by 2002:a05:600c:6c92:b0:437:c453:ff19 with SMTP id 5b1f17b1804b1-438d59b566dmr69106535e9.14.1738164209749;
        Wed, 29 Jan 2025 07:23:29 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc2f17dsm26180725e9.23.2025.01.29.07.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 07:23:29 -0800 (PST)
Date: Wed, 29 Jan 2025 16:23:28 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Shiju Jose <shiju.jose@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 03/13] acpi/ghes: add a firmware file with HEST
 address
Message-ID: <20250129162328.17680ee7@imammedo.users.ipa.redhat.com>
In-Reply-To: <294577300217e4f7a606f3cb17382fd108c8c021.1738137123.git.mchehab+huawei@kernel.org>
References: <cover.1738137123.git.mchehab+huawei@kernel.org>
	<294577300217e4f7a606f3cb17382fd108c8c021.1738137123.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: atpF+KspNSQO

On Wed, 29 Jan 2025 09:04:09 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Store HEST table address at GPA, placing its content at
> hest_addr_le variable.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
> While here, capitalize first letter on a comment about hardware_error
> address.
> 
> ---
> 
> Change from v8:
> - hest_addr_lr is now pointing to the error source size and data.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  hw/acpi/ghes.c         | 18 +++++++++++++++++-
>  include/hw/acpi/ghes.h |  1 +
>  2 files changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> index 4cabb177ad47..db6bed010eb0 100644
> --- a/hw/acpi/ghes.c
> +++ b/hw/acpi/ghes.c
> @@ -30,6 +30,7 @@
>  
>  #define ACPI_HW_ERROR_FW_CFG_FILE           "etc/hardware_errors"
>  #define ACPI_HW_ERROR_ADDR_FW_CFG_FILE      "etc/hardware_errors_addr"
> +#define ACPI_HEST_ADDR_FW_CFG_FILE          "etc/acpi_table_hest_addr"
>  
>  /* The max size in bytes for one error block */
>  #define ACPI_GHES_MAX_RAW_DATA_LENGTH   (1 * KiB)
> @@ -261,7 +262,7 @@ static void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker,
>      }
>  
>      /*
> -     * tell firmware to write hardware_errors GPA into
> +     * Tell firmware to write hardware_errors GPA into
>       * hardware_errors_addr fw_cfg, once the former has been initialized.
>       */

please, drop non relevant hunk, or move it out into a separate path

>      bios_linker_loader_write_pointer(linker, ACPI_HW_ERROR_ADDR_FW_CFG_FILE, 0,
> @@ -349,12 +350,15 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
>  {
>      AcpiTable table = { .sig = "HEST", .rev = 1,
>                          .oem_id = oem_id, .oem_table_id = oem_table_id };
> +    uint32_t hest_offset;
>      int i;
>  
>      build_ghes_error_table(hardware_errors, linker, num_sources);
>  
>      acpi_table_begin(&table, table_data);
>  
> +    hest_offset = table_data->len;
move it before acpi_table_begin() so that name would match with what actually happens
and adjust 4/13 to account for that

> +
>      /* Error Source Count */
>      build_append_int_noprefix(table_data, num_sources, 4);
>      for (i = 0; i < num_sources; i++) {
> @@ -362,6 +366,15 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
>      }
>  
>      acpi_table_end(linker, &table);
> +
> +    /*
> +     * Tell firmware to write into GPA the address of HEST via fw_cfg,
> +     * once initialized.
> +     */
> +    bios_linker_loader_write_pointer(linker,
> +                                     ACPI_HEST_ADDR_FW_CFG_FILE, 0,
> +                                     sizeof(uint64_t),
> +                                     ACPI_BUILD_TABLE_FILE, hest_offset);

it's not safe to add this without compat logic, as it changes size of linker
table and possibly layout.

I'd suggest to  partially combine this with use_hest_addr patch.
One way to do it cleanly would be to move part introducing
use_hest_addr here and set it to false to start with,
and flip default to true one all hest_addr_le code in place.
see related comment 6/13 

>  }
>  
>  void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
> @@ -375,6 +388,9 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
>      fw_cfg_add_file_callback(s, ACPI_HW_ERROR_ADDR_FW_CFG_FILE, NULL, NULL,
>          NULL, &(ags->hw_error_le), sizeof(ags->hw_error_le), false);
>  
> +    fw_cfg_add_file_callback(s, ACPI_HEST_ADDR_FW_CFG_FILE, NULL, NULL,
> +        NULL, &(ags->hest_addr_le), sizeof(ags->hest_addr_le), false);
see 6/13 comments

> +
>      ags->present = true;
>  }
>  
> diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
> index 9f0120d0d596..237721fec0a2 100644
> --- a/include/hw/acpi/ghes.h
> +++ b/include/hw/acpi/ghes.h
> @@ -58,6 +58,7 @@ enum AcpiGhesNotifyType {
>  };
>  
>  typedef struct AcpiGhesState {
> +    uint64_t hest_addr_le;
>      uint64_t hw_error_le;
>      bool present; /* True if GHES is present at all on this board */
>  } AcpiGhesState;

