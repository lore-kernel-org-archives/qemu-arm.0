Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp2986940njn;
        Wed, 15 Jan 2025 03:08:36 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCUO0zTx4X6ikZTrddr79txMnSVaoz17Kff1LgnJGr97BWiZwA91xnqvvsIF9zze1bIWaUtdOu5bFhjSYg==@linaro.org
X-Google-Smtp-Source: AGHT+IHZEW8U2cvTy89J01Oew2/BmfHnWm6JRgdb1hvD/2TPtKkETVVGXG5oUN4sjE/irsYzVAwt
X-Received: by 2002:a17:907:1c96:b0:aa6:6a52:970 with SMTP id a640c23a62f3a-ab2ab6a7603mr2887733066b.1.1736939316209;
        Wed, 15 Jan 2025 03:08:36 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1736939316; cv=pass;
        d=google.com; s=arc-20240605;
        b=aJqjAlqvRRfBaR8qdX94ZYDtgrOY/FinghNk4seTaSOpx8TP8jAVuGcDXxIcvqAvjZ
         3Ph8Zkw1lo3JMVXwJpC6A9W6du9Meykb0BmPQa47R7denr5SEGM5thEl7WnLtnrO9PW3
         hxyeq8MN+4bPXRjDPLRX8oD198BQZ2rE8KgipRsmJr0zTVQ8oZVS9k8BqJM7b0RCFSbD
         7RnS7z5OraJDAJnXCE4OQeVh+XkmWAo0P5j2KiIxe1y/x5nA8hh2i8fpOec/qefuk6Kh
         rvTWdaw8yUv4nSAE+tjFEQsZ/AADR/GnG8vY/S5wY+d2s2BZi/lssZkoRUQQt03KpCAI
         ynug==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-disposition:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=36rty/kDx74kZZDX2L37q27rV7ZfinX6KX5+TAfh894=;
        fh=ROe1E2tkJ3rII35f5g/me/OtUzIBKGlOVXM9zGd4mos=;
        b=eDjGtiBUe6ue6swpAG7n+uSOg32sCsNoT3VmWb3xr+rCe+IswWOo2fqrOHxYJ+uf0A
         7vRh5yIPXGonfO6DGJiYM2mM6+Saq/ucqISc+mIPftWwVQ3lfzb3zOuTNdGFhTPFKPz/
         /hR8MzILzUmZWgz2heeZBymDhoQo1qIlGDZEbFTmMD+ZaJERk9Bf3I/wU/yht9cHKpSo
         4JunAcHHzUIYSnxJWjB+MuYRJPhU6JRNZvKDaVF0xtjldJhYV4f+MB/Ru+ukLWiLJRgg
         KtHVSbHK4pTb/nMb/BvC7FpSjo5rHlhWpePqgTjmbavS8R8l1KV8J7jHKVy2ZYcq9XCT
         KrbQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=amRgsrOY;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-477771-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-477771-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <linux-kernel+bounces-477771-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [2604:1380:4601:e00::3])
        by mx.google.com with ESMTPS id a640c23a62f3a-ab2c958a921si971993666b.564.2025.01.15.03.08.35
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 03:08:36 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-477771-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) client-ip=2604:1380:4601:e00::3;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=amRgsrOY;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-477771-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-477771-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D8C01883A79
	for <alex.bennee@linaro.org>; Wed, 15 Jan 2025 11:08:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEB8D1E7C22;
	Wed, 15 Jan 2025 11:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="amRgsrOY"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65BE248BDF
	for <linux-kernel@vger.kernel.org>; Wed, 15 Jan 2025 11:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736939310; cv=none; b=MTEp5vXwzPyj3bMASc/TKRWfTw4hPliAxgY2W74dAdA7emkUFOG9wV6Xhk6a4NruONwR+Tkk7nYajxOx7fftQhyjqORhMP7h4QV3StS/V6LTgyZtSvG19ndgqv2SJLR4yuQidHchRfvTpf1rvjEHJe7cYwbNY+oysjYhywwhk8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736939310; c=relaxed/simple;
	bh=UhA+fmqU+xvlmRo5WGEUm/hNwzEL+cpNmV5JPiuQD4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uJ7orLIV+ByUOxe19gbJW1cHnNtVEz/ih+rHZ+blrcllaAk6bq5FUr/dvUKEFaFyw/n4u2BWd4G6Y6SbKhHg0ZA0LjAYVzkMQ6eWvjUP8FlYHrq848GciIe1hYP0aFOpwyDMqFVkAKClsDgrMI1CBmrLJr1TmH03lGwKWfe6M4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=amRgsrOY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736939307;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=36rty/kDx74kZZDX2L37q27rV7ZfinX6KX5+TAfh894=;
	b=amRgsrOYSVl4HeHgUIiyINzR7oKx16paN54xAUTFh+Nb4UY5nqUSNZtCYecmUS504NxlpB
	jTBCr5443FQyVtoIccHA7Tx0uuIER296ys+oMuYnXae9n0B8p7piE+LqHA0qTT2VS1PXEU
	HbpVXz8rdBKjuqfDS/vI+0spiexymmY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-310-U_FZleZvOMyoK14zfd4Orw-1; Wed, 15 Jan 2025 06:08:26 -0500
X-MC-Unique: U_FZleZvOMyoK14zfd4Orw-1
X-Mimecast-MFC-AGG-ID: U_FZleZvOMyoK14zfd4Orw
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4361efc9dc6so35157095e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 15 Jan 2025 03:08:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736939305; x=1737544105;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=36rty/kDx74kZZDX2L37q27rV7ZfinX6KX5+TAfh894=;
        b=WklHyUI9qHf4oOhYzP/rTxhZR8HVEYUxhgV58TFY5Enp1xMM+PwMLJoaapRawrEb/S
         7IFgrfd2RczPl1mVWk4/TVMxQCGXDhnry1XMIrLlavfqKLOd3hMef3XEXKoSCmwZSWfg
         6Ltz6aSaYZNiAQMF3Ap5Mz2MylGp9tU85p43609TiKX4sUCI5TqUz5TbtD/wvEE/U7az
         yG+m6+sq3cmsnteF/1szZxQat8qoNnqqwppMEbcj5fH63MxeGpcY85abzSMqsVMAB/L5
         FVZJwjnJJ4SA35ld1hnqFs7712j/eW1eR4xa3cxmVaETed7cohfO+i1leLSuBx2J4fp8
         a0xQ==
X-Forwarded-Encrypted: i=1; AJvYcCVd5SVUAUjnaVq9iC3/P36nuN3BzmqVof9K69zTA9jEfOnWUbwMc13R/tuBgThpM4uvEjEhjcqgFLHcueg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkUnYt35T5ZHEXQAvUBXPZt0hk9hJY/pTLsP7VrS/N8whYBhns
	4UDqifYbAeEFDbNwoJsDc8xPPweyIWdHxKtqCujgVy+l1Cq4JOabhZAWFc706XX9Kbdh3fMlTWl
	z8g+Qp3UGgaM3GNgbt77zxrRc/e2EhquxOX+bCW6k0s/ETcyqwRLg9ecJnGwIlw==
X-Gm-Gg: ASbGncvOFrLjsvehP1wOM8/Mpy1zkz8TY9NmcbCKg2JnEaEZrkPiLIfqUwb7pEiLuhW
	9n3e8c5g7fWLWVeGDRf++6atFv73rC56pv5riTWsQs89Ui5mPMXe/uAo6ASY0pBMcadw0Z9YNHN
	5uan0dXexAD8M+Wky6BohoKvH/3rjuRJUjMHHXVpK0YKHdtCDPHSl/hLWfRCv9rZBSbs2q5pq11
	bvz/ZspF4xeneG15MF2t1ob9jAGHuZIRJXDhjVlzthqfZy8cg==
X-Received: by 2002:a5d:5f52:0:b0:38a:8647:3dac with SMTP id ffacd0b85a97d-38a8731fac1mr24457014f8f.34.1736939305023;
        Wed, 15 Jan 2025 03:08:25 -0800 (PST)
X-Received: by 2002:a5d:5f52:0:b0:38a:8647:3dac with SMTP id ffacd0b85a97d-38a8731fac1mr24456985f8f.34.1736939304628;
        Wed, 15 Jan 2025 03:08:24 -0800 (PST)
Received: from redhat.com ([2a02:14f:1f5:8f43:2a76:9f8c:65e8:ce7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4c1c01sm17586269f8f.97.2025.01.15.03.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 03:08:23 -0800 (PST)
Date: Wed, 15 Jan 2025 06:08:20 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>, Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>, linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v6 09/16] acpi/ghes: make the GHES record generation more
 generic
Message-ID: <20250115060757-mutt-send-email-mst@kernel.org>
References: <cover.1733561462.git.mchehab+huawei@kernel.org>
 <a35a02028136f9d5445b41760c892de302801500.1733561462.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a35a02028136f9d5445b41760c892de302801500.1733561462.git.mchehab+huawei@kernel.org>
X-TUID: EN51aRWCsar4

On Sat, Dec 07, 2024 at 09:54:15AM +0100, Mauro Carvalho Chehab wrote:
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
> 
> # Conflicts:
> #	roms/edk2
> ---
>  hw/acpi/ghes.c         | 121 ++++++++++++++++++++++++-----------------
>  include/hw/acpi/ghes.h |   3 +
>  2 files changed, 73 insertions(+), 51 deletions(-)
> 
> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> index a3dffd78b012..4b5332f8c667 100644
> --- a/hw/acpi/ghes.c
> +++ b/hw/acpi/ghes.c
> @@ -181,51 +181,24 @@ static void acpi_ghes_build_append_mem_cper(GArray *table,
>      build_append_int_noprefix(table, 0, 7);
>  }
>  
> -static int acpi_ghes_record_mem_error(uint64_t error_block_address,
> -                                      uint64_t error_physical_addr)
> +static void
> +ghes_gen_err_data_uncorrectable_recoverable(GArray *block,
> +                                            const uint8_t *section_type,
> +                                            int data_length)
>  {
> -    GArray *block;
> -
> -    /* Memory Error Section Type */
> -    const uint8_t uefi_cper_mem_sec[] =
> -          UUID_LE(0xA5BC1114, 0x6F64, 0x4EDE, 0xB8, 0x63, 0x3E, 0x83, \
> -                  0xED, 0x7C, 0x83, 0xB1);
> -
>      /* invalid fru id: ACPI 4.0: 17.3.2.6.1 Generic Error Data,
>       * Table 17-13 Generic Error Data Entry
>       */
>      QemuUUID fru_id = {};
> -    uint32_t data_length;
> -
> -    block = g_array_new(false, true /* clear */, 1);
> -
> -    /* This is the length if adding a new generic error data entry*/
> -    data_length = ACPI_GHES_DATA_LENGTH + ACPI_GHES_MEM_CPER_LENGTH;
> -    /*
> -     * It should not run out of the preallocated memory if adding a new generic
> -     * error data entry
> -     */
> -    assert((data_length + ACPI_GHES_GESB_SIZE) <=
> -            ACPI_GHES_MAX_RAW_DATA_LENGTH);
>  
>      /* Build the new generic error status block header */
>      acpi_ghes_generic_error_status(block, ACPI_GEBS_UNCORRECTABLE,
>          0, 0, data_length, ACPI_CPER_SEV_RECOVERABLE);
>  
>      /* Build this new generic error data entry header */
> -    acpi_ghes_generic_error_data(block, uefi_cper_mem_sec,
> +    acpi_ghes_generic_error_data(block, section_type,
>          ACPI_CPER_SEV_RECOVERABLE, 0, 0,
>          ACPI_GHES_MEM_CPER_LENGTH, fru_id, 0);
> -
> -    /* Build the memory section CPER for above new generic error data entry */
> -    acpi_ghes_build_append_mem_cper(block, error_physical_addr);
> -
> -    /* Write the generic error data entry into guest memory */
> -    cpu_physical_memory_write(error_block_address, block->data, block->len);
> -
> -    g_array_free(block, true);
> -
> -    return 0;
>  }
>  
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


size_t should be printed with %zd not %ld.

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
>  
>  bool acpi_ghes_present(void)
> diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
> index 9295e46be25e..8859346af51a 100644
> --- a/include/hw/acpi/ghes.h
> +++ b/include/hw/acpi/ghes.h
> @@ -23,6 +23,7 @@
>  #define ACPI_GHES_H
>  
>  #include "hw/acpi/bios-linker-loader.h"
> +#include "qapi/error.h"
>  
>  /*
>   * Values for Hardware Error Notification Type field
> @@ -73,6 +74,8 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
>                       const char *oem_id, const char *oem_table_id);
>  void acpi_ghes_add_fw_cfg(AcpiGhesState *vms, FWCfgState *s,
>                            GArray *hardware_errors);
> +void ghes_record_cper_errors(const void *cper, size_t len,
> +                             uint16_t source_id, Error **errp);
>  int acpi_ghes_record_errors(uint16_t source_id, uint64_t error_physical_addr);
>  
>  /**
> -- 
> 2.47.1

