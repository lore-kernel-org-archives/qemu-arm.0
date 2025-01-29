Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp3766209njk;
        Wed, 29 Jan 2025 05:34:07 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCVEnShqwFwtf6qbOqWJiS/AE9EfRHuUQvc9NXoQwb3A84oBOP8javKkBYYid1X+RKTeMD3OyPqpz/0C/w==@linaro.org
X-Google-Smtp-Source: AGHT+IH0hOFeCvOc8GDXhS5bMaqUqNicc3/j0+lV8Hw7+R8/WODK9F9nqzYLrb4cT5LDO6ZYn4eD
X-Received: by 2002:a05:6102:3e15:b0:4b2:5d67:94c3 with SMTP id ada2fe7eead31-4b9a52345edmr2510579137.18.1738157647585;
        Wed, 29 Jan 2025 05:34:07 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1738157647; cv=pass;
        d=google.com; s=arc-20240605;
        b=d4TB42KJMXbrHl0eLz8Z6auTQgzFAPh4kNcD8QshZKcQ8LiTxWoAOj0nWivWIBEBJC
         XveAP0vPT9fNOwHNyHmDrSHkEB39dAZjh0xaHclzlCZXNoKOQRsUoLEQHW9erupnV1FB
         9krMwygZdw56LHjpg3L1z6NcUMkx8WGUo84h5rXT1OTmcORoZAByOGFX+3Qpl2ieosZP
         CCWPsHJl1IgxBPvKclrKPs2i0bObpFtQUJkH7K0ztmTVB/mYBGMPL4km0H0AVRaJyMHz
         qswPIJbDrjvJROxSuVonOPTbRzI+k2guQmITNk8E+rRTPzpg4I3OBAx/Tc9gji2Uwoa0
         coFw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=ZxJvLwmS7fyxaJl56jJBb8LhcmJcQI3meyr6E1SPMfw=;
        fh=k9Tc+gPuXVAr1DV7ASAUV197iCFBT+5yPdIw5pagU/Y=;
        b=HK15kmYUsH3VUX+o61LNAFNlJ53c1wQ8AyBYMtLXwfZ/TT5pJjRRFnSfdQbQaB6Iuf
         1Ovrv9ftLIy4soW+Ty/KUZkTUYKsxaJe0N1wwjq0QCqX3tzbTeDbLGOOp+m2A4aNyAhq
         xDGV2W/IxNio5jwBkrhiiSUJ7cq8KQsBDlnqC4dxGJcvw6v/7tdwi0vu/tUeSTf6WFYg
         jFtRa7flb+U7eItNQ+9JVZzyHH6MQ7FAUab70HCMesP8dcTThqxlOVh6SBChPa7A9u3I
         BB/1FXx/iqdGjgdRqyvqQYyYmAui4jleYg1iB/attFuI+++3dKYikSqjYJvf3jeTdF3y
         HbvA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VanC1klk;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-492508-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-492508-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <linux-kernel+bounces-492508-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id ada2fe7eead31-4b7099acee6si3679427137.409.2025.01.29.05.34.07
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 05:34:07 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-492508-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VanC1klk;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-492508-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-492508-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 67B86163A4B
	for <alex.bennee@linaro.org>; Wed, 29 Jan 2025 13:34:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AFF47EF09;
	Wed, 29 Jan 2025 13:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VanC1klk"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2DD4C80
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 13:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738157646; cv=none; b=u3SLE6oej0LlEO3WyZs8sBPYXu6gahO2fvyHluMnPCyohMKDdN7mz5UvgzhdvFnoz/yRv86D39PFJQxvn22G67sT/u5AMmFFVspn+atBa9QhY8pcNj1XLkOdQwptZEL5dahUwOZ57KU5aYwrz1Y38tYyFNgssSzvbYsvFg0/ihU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738157646; c=relaxed/simple;
	bh=XgtMsGWuyGCy6UbicFhgRDg010FTFIRZkSkhfxwBNSw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qXyRqak7bKtwzYAJkinOid9rHEXyXPJZ7mU34RZ597YX5YqPn0y5AaMVcwyZ0xjD6FngVlNyh+vqtGFh8t2HvKJzJTqNGyMSooKRDS884nXI+pWbTv14hB9PJKQOnyddRG0Z1NAkWOxvo6+QEyVbLzhuFX+LmUF8IOiafxf80ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VanC1klk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738157642;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZxJvLwmS7fyxaJl56jJBb8LhcmJcQI3meyr6E1SPMfw=;
	b=VanC1klkHBnjeQXvLCTiDQSiK7uk2fOzk8Sd9wEl+x28f7pgkKJAyYD4g6Q79Cxv/qvNdE
	bZqzt7HlJGy/DjamGEgDopNSQgnM69oDPU5Z7dH9j0+N/mlrPiJiNLfUo/kcBm3esKAY+k
	nT8NkYmx2OH4Lwd3s/SSbZc+EGPdExk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-22-cPyGvoEOPL-xgR_qMLTxyg-1; Wed, 29 Jan 2025 08:34:01 -0500
X-MC-Unique: cPyGvoEOPL-xgR_qMLTxyg-1
X-Mimecast-MFC-AGG-ID: cPyGvoEOPL-xgR_qMLTxyg
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4359206e1e4so53457975e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 05:34:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738157640; x=1738762440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZxJvLwmS7fyxaJl56jJBb8LhcmJcQI3meyr6E1SPMfw=;
        b=b/N92GVtKpmhVGlRPLNyk5W3vBbL/CDMwngIWB5StX7cVSg6btlyRAQf3eavdejqoT
         7fMBC2h3GKkY92FV8KU3QYSaql8fwr+UuHVSGoAw7pzFCA7u8XZknCaGglSBRVlaH9dG
         5UgamQBw1Vov3iSDyd7LwtaF1RReKGagv+c+EU+LpAGjs+/ZE4H8HJURIN/hoz+IBgrU
         IWDOnoS3SPLZHX43NrPetaHdfyVlcOfe5iUnDdRvUM0YyKuc7NFq2cQPPC90dHh8BxQ/
         w7xM7aJB30Lf1vxuMsb6iLrQNLjYKwz6MrSjLn+cJoDQcMjpG60iR3ONLDcH515WDPhj
         yN3w==
X-Forwarded-Encrypted: i=1; AJvYcCWdr7dzKOkoaU4f2RNZqhNqus2Stlilj7/Vtkqz0bwaHLwSRGuDFsAf+3LMr1ewA/OFI4n2jgHtLB0aowg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvG0sZoCPuCKeS2f3jSWdCBVLUlFZebAbFPHxbldRMLHxhyU/c
	stKH4K7x3cyl2ivi+poQWz7XPDv82Ro2eYQ/fgUxWHUvUm58DH0CtoP4oOOq+HyNflNH33fG6G4
	PGvu16XqUyAnIgn0FF4YvkMS9ibXO3b6lOT3CdDhSYNRVbErlRe0AeB1+eCIgYA==
X-Gm-Gg: ASbGnctvarmjtEAxc09EJiCW0OwuC8nsCxmM2+a1mExZ+Ja+p//jAJsQYL0ZUbBn/sy
	uaoqKSjGzbsSpQVlzau/BQj0JSqsdEPNR+8eqofeBn9ydL64hExwjruKdtfqaT/TyiUXqf8YLlK
	fSebUm0c1ZgveKVGcrIXjyfmgBNAqxFtp05VUm+Gakn1KcEYguDsMG4jYuii7SB9TNSNMQDRXIx
	ZppAUAiaZraajunjLNy4dD87s/s1QVi04ocbRCoix/DM7qQOi/ALurB6SsmVDCjOb6k+mnXeBBc
	54gPpAA8A/pbNIef4EJkPBQ41VQezCtIZiSJH20gEPIIgC83TZpZ
X-Received: by 2002:a05:600c:444c:b0:434:a734:d279 with SMTP id 5b1f17b1804b1-438dc3caef4mr31783905e9.16.1738157640334;
        Wed, 29 Jan 2025 05:34:00 -0800 (PST)
X-Received: by 2002:a05:600c:444c:b0:434:a734:d279 with SMTP id 5b1f17b1804b1-438dc3caef4mr31783435e9.16.1738157639796;
        Wed, 29 Jan 2025 05:33:59 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc11bc1sm24211015e9.3.2025.01.29.05.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 05:33:59 -0800 (PST)
Date: Wed, 29 Jan 2025 14:33:58 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Shiju Jose <shiju.jose@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/11] acpi/ghes: add a firmware file with HEST address
Message-ID: <20250129143358.1dc9ddff@imammedo.users.ipa.redhat.com>
In-Reply-To: <a3579f6c2c24e764e544f83b6e1b2dbef730e3e3.1737560101.git.mchehab+huawei@kernel.org>
References: <cover.1737560101.git.mchehab+huawei@kernel.org>
	<a3579f6c2c24e764e544f83b6e1b2dbef730e3e3.1737560101.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: EInfbGFGfao4

On Wed, 22 Jan 2025 16:46:19 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Store HEST table address at GPA, placing its content at
> hest_addr_le variable.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
> ---
> 
> Change from v8:
> - hest_addr_lr is now pointing to the error source size and data.

that's confusing, variable name say it's HEST table address,
while in practice it's (that + offset).

I'd very much prefer it being table start and then you'd add
offset later on where it's going to be used.  

> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  hw/acpi/ghes.c         | 17 ++++++++++++++++-
>  include/hw/acpi/ghes.h |  1 +
>  2 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> index 3f519ccab90d..34e3364d3fd8 100644
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

drop this hunk as it's not related to  the patch

>       * hardware_errors_addr fw_cfg, once the former has been initialized.
>       */
>      bios_linker_loader_write_pointer(linker, ACPI_HW_ERROR_ADDR_FW_CFG_FILE, 0,
> @@ -355,6 +356,8 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
>  
>      acpi_table_begin(&table, table_data);
>  
> +    int hest_offset = table_data->len;
> +
>      /* Error Source Count */
>      build_append_int_noprefix(table_data, num_sources, 4);
>      for (i = 0; i < num_sources; i++) {
> @@ -362,6 +365,15 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
>      }
>  
>      acpi_table_end(linker, &table);
> +
> +    /*
> +     * tell firmware to write into GPA the address of HEST via fw_cfg,
> +     * once initialized.
> +     */
> +    bios_linker_loader_write_pointer(linker,
> +                                     ACPI_HEST_ADDR_FW_CFG_FILE, 0,
> +                                     sizeof(uint64_t),
> +                                     ACPI_BUILD_TABLE_FILE, hest_offset);
>  }
>  
>  void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
> @@ -375,6 +387,9 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
>      fw_cfg_add_file_callback(s, ACPI_HW_ERROR_ADDR_FW_CFG_FILE, NULL, NULL,
>          NULL, &(ags->hw_error_le), sizeof(ags->hw_error_le), false);
>  
> +    fw_cfg_add_file_callback(s, ACPI_HEST_ADDR_FW_CFG_FILE, NULL, NULL,
> +        NULL, &(ags->hest_addr_le), sizeof(ags->hest_addr_le), false);
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

