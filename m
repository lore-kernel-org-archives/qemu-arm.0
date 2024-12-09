Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp2313384njn;
        Tue, 14 Jan 2025 02:26:39 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCX0OjutlZ1zlja6fsvfjNOu/UQYAgxZ/sQjacVkGdymTuNraFxAtqK27al60ncfs6Uz2TnG/ejl9riJ7g==@linaro.org
X-Google-Smtp-Source: AGHT+IGnp1/75aL/wwwRenb708gHoYFL+3ZvT7j85pgYoPmqXBR6Tzs8sU7P1b5i9KFVREsInzEB
X-Received: by 2002:a05:6a21:1088:b0:1e0:c3bf:7909 with SMTP id adf61e73a8af0-1e88d0ddc8dmr39236010637.41.1736850399763;
        Tue, 14 Jan 2025 02:26:39 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1736850399; cv=pass;
        d=google.com; s=arc-20240605;
        b=U0JaqpEhTf3PxGlZP3ytNCodsZmwxHLdi4qdFFgeFE4fWzbVNp4yzTZASt+ZtmAAkr
         sWN7Yl2JodqyzQOJ6vquAWf78R/7WaGtEcojuFRFei4U34i85AhN28Ps/nLxCTR7TLGo
         kS2dQWiOPkuxtDBB9B6HbeJRmCbf4oh/V0xFgqRBt+s4tgOTeI6GHD7lgN6LysL+b7zh
         1ix7zYwI5/ZlV1nWNL7D3xFCwbC9+U6lV4nGDVX73H3GOERNlRCeelYAFhI9qUxtXr+/
         aJo+ukvl0nTr0/U6/xKBmg0t0Sk6n98PArRevwigJXU8+TsuliKjpB1bRRrkoC3hhZzN
         8TSA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:list-unsubscribe:list-subscribe:list-id:precedence
         :content-transfer-encoding:references:in-reply-to:message-id:subject
         :cc:to:from:date;
        bh=R9neShIS27GW3AKci631qi0pFRxWgnARzpeEkz0kIXE=;
        fh=+feeONKKhfj4Xu3umI+ZvCmxCiaV8JYRivnFs1FxxQw=;
        b=HbeUjVfOU8SQ9QGTTAXW+cKMzWfuRLxFwRjlZQ3jrYjONSz+m1vUdvOc6tpQxiYoXz
         GVDKWYVz/hPCtuaWM9s0mlgx4qTqHVXKmMpXZP6xAhYndHtLpiZ+nZ0z7rIRhsqsvBES
         LRW4s9sDAJ0hNtvE4CHz+RzQMaCKvMqRtxZYY/oN++2cLTeMwpDBJnUZ1khTi+ziw8ep
         /pkvVsl3IFMAGMuG6XAh6iCbQ9ILV+nGNlJA/iK8Ba5z2DdV3Df4XmuajPf0T4sua+kA
         X1ks9nVqudyuAGpUXCC4zrlW2NOUKSL4QA3gkKzi6bXHSafk+McC0rBOMMg6kDV4QWLT
         B7cQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-475630-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-475630-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <linux-kernel+bounces-475630-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id 41be03b00d2f7-a319a30fa64si13962086a12.214.2025.01.14.02.26.39
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 02:26:39 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-475630-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-475630-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-475630-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45A3F3A3BFF
	for <alex.bennee@linaro.org>; Tue, 14 Jan 2025 10:26:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B6B7230D08;
	Tue, 14 Jan 2025 10:26:36 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4065B1ADC60
	for <linux-kernel@vger.kernel.org>; Tue, 14 Jan 2025 10:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736850396; cv=none; b=buiqTiC4P2kyu5BAudcNtwhULAuJSZyK7jJqOUlbFP/zhHQkiflQwJkfDJI9umMaApCT2zqsLXQwbul6SpmJrsWRaVurmrpNMpm8nwaF+8O3AC1syok2L9vsYIM5AcLOOn8XZsVYee1biFZJYYSabFDoUCUAltNTdYfJkdyz++0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736850396; c=relaxed/simple;
	bh=C/kUkHi7OZ7FFQV4m/urbnROenOvXwyJuTim9Wecb/Q=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=orLvnsy5tH0VVh2OP40VFELfY+JXNWYepGtMwZwEJ6xPB+DOwM5GpsrMzQjcRpiGk1gQrwvqjjwAlEutfDjzIMYzjL1o5uUCQkxXIjTxYSJoFcJ7mbqDJ6W1fE1/KSQ2UBB1HZoMMPDUEiuMSysNZ4vnoXZcz31fKaSFWV1xT4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YXQHM4jwtz6L5Jy;
	Tue, 14 Jan 2025 18:25:03 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 446931402C6;
	Tue, 14 Jan 2025 18:26:30 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 14 Jan
 2025 11:26:29 +0100
Date: Mon, 9 Dec 2024 11:45:34 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC: "Michael S . Tsirkin" <mst@redhat.com>, Shiju Jose
	<shiju.jose@huawei.com>, Ani Sinha <anisinha@redhat.com>, Dongjiu Geng
	<gengdongjiu1@gmail.com>, Igor Mammedov <imammedo@redhat.com>,
	<linux-kernel@vger.kernel.org>, <qemu-arm@nongnu.org>,
	<qemu-devel@nongnu.org>
Subject: Re: [PATCH v6 09/16] acpi/ghes: make the GHES record generation
 more generic
Message-ID: <20241209114534.000079a6@huawei.com>
In-Reply-To: <a35a02028136f9d5445b41760c892de302801500.1733561462.git.mchehab+huawei@kernel.org>
References: <cover.1733561462.git.mchehab+huawei@kernel.org>
	<a35a02028136f9d5445b41760c892de302801500.1733561462.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: lhrpeml500009.china.huawei.com (7.191.174.84) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: chZaVAUXQ2lV

On Sat,  7 Dec 2024 09:54:15 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Split the code into separate functions to allow using the
> common CPER filling code by different error sources.
> 
> The generic code was moved to ghes_record_cper_errors(),
> and ghes_gen_err_data_uncorrectable_recoverable() now contains
> only a logic to fill the Generic Error Data part of the record,
> as described at:
> 
> 	ACPI 6.2: 18.3.2.7.1 Generic Error Data
> 
> The remaining code to generate a memory error now belongs to
> acpi_ghes_record_errors() function.
> 
> A further patch will give it a better name.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Igor tagged this in previous posting.  Any reason for dropping?

> 
> # Conflicts:
> #	roms/edk2
Should clear this out.

A few formatting things inline but beyond that looks good to me.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

>  /*
> @@ -383,15 +356,18 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
>      ags->present = true;
>  }
>  
> -int acpi_ghes_record_errors(uint16_t source_id, uint64_t physical_address)
> +void ghes_record_cper_errors(const void *cper, size_t len,
> +                             uint16_t source_id, Error **errp)
>  {
>      uint64_t error_block_addr, read_ack_register_addr, read_ack_register = 0;
>      uint64_t start_addr;
> -    bool ret = -1;
>      AcpiGedState *acpi_ged_state;
>      AcpiGhesState *ags;
>  
> -    assert(source_id < ACPI_GHES_ERROR_SOURCE_COUNT);
> +    if (len > ACPI_GHES_MAX_RAW_DATA_LENGTH) {
> +        error_setg(errp, "GHES CPER record is too big: %ld", len);
> +        return;
> +    }
>  
>      acpi_ged_state = ACPI_GED(object_resolve_path_type("", TYPE_ACPI_GED,
>                                                         NULL));
> @@ -406,6 +382,10 @@ int acpi_ghes_record_errors(uint16_t source_id, uint64_t physical_address)
>                               sizeof(error_block_addr));
>  
>      error_block_addr = le64_to_cpu(error_block_addr);
> +    if (!error_block_addr) {
> +        error_setg(errp, "can not find Generic Error Status Block");
> +        return;
> +    }
>  
>      read_ack_register_addr = start_addr +
>                               ACPI_GHES_ERROR_SOURCE_COUNT * sizeof(uint64_t);
> @@ -415,24 +395,63 @@ int acpi_ghes_record_errors(uint16_t source_id, uint64_t physical_address)
>  
>      /* zero means OSPM does not acknowledge the error */
>      if (!read_ack_register) {
> -        error_report("OSPM does not acknowledge previous error,"
> -                     " so can not record CPER for current error anymore");
> -    } else if (error_block_addr) {
> -        read_ack_register = cpu_to_le64(0);
> -        /*
> -         * Clear the Read Ack Register, OSPM will write it to 1 when
> -         * it acknowledges this error.
> -         */
> -        cpu_physical_memory_write(read_ack_register_addr,
> -                                  &read_ack_register, sizeof(uint64_t));
> -
> -        ret = acpi_ghes_record_mem_error(error_block_addr,
> -                                         physical_address);
> -    } else {
> -        error_report("can not find Generic Error Status Block");
> +        error_setg(errp,
> +                   "OSPM does not acknowledge previous error,"
> +                   " so can not record CPER for current error anymore");
> +        return;
>      }
>  
> -    return ret;
> +    read_ack_register = cpu_to_le64(0);
> +    /*
> +     * Clear the Read Ack Register, OSPM will write 1 to this register when
> +     * it acknowledges the error.
> +     */
> +    cpu_physical_memory_write(read_ack_register_addr,
> +        &read_ack_register, sizeof(uint64_t));

Maybe rewrap that line now it's indented less?

> +
> +    /* Write the generic error data entry into guest memory */
> +    cpu_physical_memory_write(error_block_addr, cper, len);
> +
> +    return;
> +}
> +
> +int acpi_ghes_record_errors(uint16_t source_id, uint64_t physical_address)
> +{
> +    /* Memory Error Section Type */
> +    const uint8_t guid[] =
> +          UUID_LE(0xA5BC1114, 0x6F64, 0x4EDE, 0xB8, 0x63, 0x3E, 0x83, \
> +                  0xED, 0x7C, 0x83, 0xB1);
> +    Error *errp = NULL;
> +    int data_length;
> +    GArray *block;
> +
> +    block = g_array_new(false, true /* clear */, 1);
> +
> +    data_length = ACPI_GHES_DATA_LENGTH + ACPI_GHES_MEM_CPER_LENGTH;
> +    /*
> +     * It should not run out of the preallocated memory if adding a new generic
> +     * error data entry
> +     */
> +    assert((data_length + ACPI_GHES_GESB_SIZE) <=
> +            ACPI_GHES_MAX_RAW_DATA_LENGTH);
> +
> +    ghes_gen_err_data_uncorrectable_recoverable(block, guid,
> +                                                data_length);

Trivial: That fits on one line under 80 chars.

> +
> +    /* Build the memory section CPER for above new generic error data entry */
> +    acpi_ghes_build_append_mem_cper(block, physical_address);
> +
> +    /* Report the error */
> +    ghes_record_cper_errors(block->data, block->len, source_id, &errp);
> +
> +    g_array_free(block, true);
> +
> +    if (errp) {
> +        error_report_err(errp);
> +        return -1;
> +    }
> +
> +    return 0;
>  }


