Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp44486njk;
        Thu, 23 Jan 2025 02:02:28 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCWQH5tStPcnPJZa/fDPBLrspUjh37aqx5G4s9vLghfDVdfd/Kz0MuabunmDBGuSnfbqXkl3DesfFhF8qQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGLq+OqGMVd6i0X765Xv2linFJbGTEAOpV6sWdwWfd1Wp1gtP0dcBIhUOpecyCq9nSNaOVC
X-Received: by 2002:a05:6214:2aa8:b0:6d8:aeda:dd93 with SMTP id 6a1803df08f44-6e1b2235d20mr392775576d6.39.1737626548177;
        Thu, 23 Jan 2025 02:02:28 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1737626548; cv=pass;
        d=google.com; s=arc-20240605;
        b=FCnzWZCK1ZIxjJo7RWNutYE/O9RG1/ppxo4lpb8r/pPktYW66Fb8ZaJv+88bNX+btl
         jtDhq28/VzEZsgx2djg7JWJoA8gVFI2ydwVEsyQaYl/Y2NfQtNapCOvEkJdN88fLF2M+
         q3ItQnRahv0bQ/xYve0drqgZA+TEwitOTc6XYKiP1vFjq2YCo0RqrmpaJ3nEZqU20l74
         YbScDDQ6E2bbCciK+jZEzomZU/a3bx9HrTpkaQxWkJmv5wIsxosUpnRCYSoUSUJx15j0
         KOeODx/PhsiAyPachT4vND6XcLoIIyKjXOAhnFOSezIxkBPw4li/Xn4EJ18H44+h6Jdl
         BjQA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date;
        bh=ph93JSHciP1KnCgRKDtvxSIl2KnE0NqWZFnc25Nolug=;
        fh=DjfmP4GuGmv+HIZ6mSuNbs+OASAdIuzO7/WHsW02d/E=;
        b=dOPYAC6QWo6QGszXdUZqsD6Mbau+5QwaS9Y+iwSNgx1TtkVP8KwKFMwArvxoppVq2m
         oaTxa8TwjTIxdSi3PCQZcoYFQ8Z6SB3NWfsB8L8NYBVWJCikkP3xAoYTUoAfUyGET8XF
         b/436JOuUjlenfjmihr166YnwiqNABEPZ38A4J1RTV39QhvwzOnZwP3+ihCABsLPi3Cs
         ktsmwa6hUz+ds9gM68RN7uVbQRJu6yHgf7NBJ3PuqIBf+ecprxexCnH40/dAcXx2Jorm
         SkyJkidiEbl5j4sNF2AT3sRR5VGS5REmCKZSWaqD3fiwx7buOP8bm1IAqg+/ejSrNrsr
         V73A==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-486485-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-486485-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <linux-kernel+bounces-486485-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e1afd0e389si178049016d6.400.2025.01.23.02.02.28
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 02:02:28 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-486485-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-486485-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-486485-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF7C01616CD
	for <alex.bennee@linaro.org>; Thu, 23 Jan 2025 10:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A377E20C014;
	Thu, 23 Jan 2025 10:02:24 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F7C5234
	for <linux-kernel@vger.kernel.org>; Thu, 23 Jan 2025 10:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737626544; cv=none; b=O5VNMwNSz9suBl2RzT/6wv52vgFh8oFiWABqsA884n88U6/fuzU385vgVHv/2H1pkAJ1FOfHKzKmsW/fkGlRCm3mGliFd+t2g8+UDY4FR9CxB+14Q3UHNBOHObMS75UlPHMBEHG4xoDW/K3r1dh655qYuEBMRz4K/N7uJYH/7uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737626544; c=relaxed/simple;
	bh=L0rI13b1uIbygdnGMg3jmdtIfRBlRC8KGruQqDcMyKM=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PPLd0E8ZY8SVwKY02ItNHwEnXzCvCWYzfofWBRfErwKlHk1OoxMmly2ULRzWF/iJ4GLo6TUxb2v7+w4+ETAvREuYOMYplWFWaPcKhyBF0Bcg2rufRDXEpholXQl1sdG+rl/yfJdZQK+B6NvhbjQ/27RTuDFk1fdABZUDGGU3Zeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YdxJk5yGhz6M4Ng;
	Thu, 23 Jan 2025 18:00:22 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id BDFF4140393;
	Thu, 23 Jan 2025 18:02:19 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 23 Jan
 2025 11:02:19 +0100
Date: Thu, 23 Jan 2025 10:02:17 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC: Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin"
	<mst@redhat.com>, Shiju Jose <shiju.jose@huawei.com>, <qemu-arm@nongnu.org>,
	<qemu-devel@nongnu.org>, Ani Sinha <anisinha@redhat.com>, Dongjiu Geng
	<gengdongjiu1@gmail.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 02/11] acpi/ghes: add a firmware file with HEST address
Message-ID: <20250123100217.00007373@huawei.com>
In-Reply-To: <a3579f6c2c24e764e544f83b6e1b2dbef730e3e3.1737560101.git.mchehab+huawei@kernel.org>
References: <cover.1737560101.git.mchehab+huawei@kernel.org>
	<a3579f6c2c24e764e544f83b6e1b2dbef730e3e3.1737560101.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml100004.china.huawei.com (7.191.162.219) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: JxGlqE+ycxLr

On Wed, 22 Jan 2025 16:46:19 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Store HEST table address at GPA, placing its content at
> hest_addr_le variable.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
A few trivial things inline.

Jonathan

> ---
> 
> Change from v8:
> - hest_addr_lr is now pointing to the error source size and data.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Bonus.  I guess you really like this patch :)
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

Sneaky tidy up.  No problem with it in general but adding noise here, so if there
are others in the series maybe gather them up in a cleanup patch.

>       * hardware_errors_addr fw_cfg, once the former has been initialized.
>       */
>      bios_linker_loader_write_pointer(linker, ACPI_HW_ERROR_ADDR_FW_CFG_FILE, 0,
> @@ -355,6 +356,8 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
>  
>      acpi_table_begin(&table, table_data);
>  
> +    int hest_offset = table_data->len;

Local style looks to be traditional C with definitions at top.  Maybe define
hest_offset up a few lines and just set it here?

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

Given the tidy up above, fix this one to have a capital T, or was this
where you meant to change it?

> +     * once initialized.
> +     */
> +    bios_linker_loader_write_pointer(linker,
> +                                     ACPI_HEST_ADDR_FW_CFG_FILE, 0,

Could wrap less and stay under 80 chars as both lines above add up to 70 something

> +                                     sizeof(uint64_t),
> +                                     ACPI_BUILD_TABLE_FILE, hest_offset);
>  }

