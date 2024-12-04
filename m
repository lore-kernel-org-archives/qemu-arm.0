Received: by 2002:a17:504:d692:b0:1be9:327d:8ee3 with SMTP id na18csp339377njb;
        Wed, 4 Dec 2024 08:38:56 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCX/X6faAAs2JYyPhqhneBG5sv7DsaYRJ0LPpeTJdzwDI3e+RXdd8acEXCnEEjrU9Jj0XScIhyflk9ve3Q==@linaro.org
X-Google-Smtp-Source: AGHT+IE9IyF2hz5Y/WDDGm3iTE+5FU6bka43TSGoVZGQ7Hqqti0fx5ER/llDT9txlTnqdc1dc1W+
X-Received: by 2002:a17:90b:3890:b0:2ee:4982:e59f with SMTP id 98e67ed59e1d1-2ef0120f3acmr10462221a91.17.1733330335812;
        Wed, 04 Dec 2024 08:38:55 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1733330335; cv=pass;
        d=google.com; s=arc-20240605;
        b=RsDHGKSBaFZU75ljnbapeIjccigj+SspADaaPkeSDr2GXMiaWEH024ONb9EEWN7Yve
         H2EyOwgDM0+gz6Mo817WiRE68/cgel+KhCOZFMByWPA64Sdg3KIZ2resgPETAKXSuYrO
         OKYJ0S2qrUHWto5EBDHrB7IlcfBk8D713fHQBrMYU18QyEZkocwWkBud5BXQAG2BYnP6
         sIHGhgz0nuqVQ71M20QTxuWnZ9LtICIFD0PnOgeY1q+iq7BabB3y1j4t/91PFPDvMYde
         UtmNIwTlsIyAtJaf4fQq2aAZiaXkphiHY8Bn3ghOt4CpNaB6pFtmEuyddy8eupSv+ve8
         rkfw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=m7FHAZNgtIO2mya219lJtrQUxVa6TSIG1yUsoSpK1nk=;
        fh=lMH4nBt77cTnbnjPFpWmEVsp/sxIgGBEsLReqLxh5c4=;
        b=Vcbley2WTORpWpjWds28s5UJ+X5lJ7tfGZIunXEm3ZBFd46kF/AsfAyDtM6nYWv4RP
         /WSWG15HUqNwvt9iDxNwMCL+2AoPM8AY/DlA2AwPT4L95WFPtgv0TKAqvB+9i/2blpyH
         hO7WphFY8Gfiwdn9ZjuvA1IMkfbctudNZUqrdAsewmXioG323vOCAJB02mPJ/mKYl+zf
         ctDyldUIyAvFMBdwLP6SjCe124H623G11z5ANqHaseQBTCvzKfIpKUrT3w24DzB0gkx0
         A1dMWybSVNUggzWnYDM4Y0egu1j+d5vgNpFaqoL+e228kYleEWrIk4a3KC2jIR1x47wu
         QN7w==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ah4caY1S;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-431643-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-431643-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <linux-kernel+bounces-431643-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id 98e67ed59e1d1-2ef2702ce38si2208368a91.58.2024.12.04.08.38.55
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 08:38:55 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-431643-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ah4caY1S;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-431643-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-431643-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53F5C28164D
	for <alex.bennee@linaro.org>; Wed,  4 Dec 2024 16:38:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E84DA20C02E;
	Wed,  4 Dec 2024 16:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ah4caY1S"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C0A182D9
	for <linux-kernel@vger.kernel.org>; Wed,  4 Dec 2024 16:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733330330; cv=none; b=QnESExSsBBB8yrH/3wIVa4eBGwEBLy1uDKBX3bHEHE7Fxozee9Ra/P87XhffbZvUUrJ4CiHrytAqZFG8yp2wSMNVU4vH4OGagWpyBlTt/++0AjjMZChCe1ilQweKvDTthp/GzoLjRY8OTrrGpsUt3B1ruPp7YxI4TS6nvyeNpdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733330330; c=relaxed/simple;
	bh=f8U4iGJbRi7PhpEfBx6oqnBhy1Hwq3b+Sd1pGGbG6+8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PfVUEGqfjFydWzK5uzYRXVTdLtK3m3ycKJ2ICqC4QHkxnKORQd9Zd6si9ho/cH/s+6E5XHE23jcji2So5XpR26zjraxWhO3sv9+IH/+a5rqFIoxipgZGsbnsRYTmykI0qDCDYwovMj0xOz89Ek90rJvPCJVgFahwayFZMH+s5dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ah4caY1S; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733330327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m7FHAZNgtIO2mya219lJtrQUxVa6TSIG1yUsoSpK1nk=;
	b=ah4caY1Se57koN38AVZIuIuzOq7li5watAGQbaKylvFYQlUHVTYjhxwFdYV6Ix18ZxVJss
	+D1rBjkeGKUjS8A8VVw1/rjYZ9OR4ASan72a/uTflcCj8AoW4ijWzD9p2mHEE1BJC97vTD
	C2EP1FEv9QmuUaPkvXCDVynnHLlQoaA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-359-SSuoTx1nPEKEQN7b9KgOmw-1; Wed, 04 Dec 2024 11:38:46 -0500
X-MC-Unique: SSuoTx1nPEKEQN7b9KgOmw-1
X-Mimecast-MFC-AGG-ID: SSuoTx1nPEKEQN7b9KgOmw
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-434a9861222so57165825e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Dec 2024 08:38:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733330325; x=1733935125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m7FHAZNgtIO2mya219lJtrQUxVa6TSIG1yUsoSpK1nk=;
        b=CUKkS9WRGn1+Hsy+yBY6No1WGlT8yw7lNgIVeDFLMrE9CICjuHiq264190tezB03Bj
         BNNAeep9YUzSWNes+28MutJs0JVgOSiCQrk7XPUyYmQmFzjliJ4RvmoFf9r0cVKjxG2J
         zdLf9EXoC5LB0I1dLf8uOusEESs7zK3RBdRs0NRtGgAt17Q4iBPPanEjdcJt5j+bED0k
         xLJRhxpy71/6GCppKd/KkvT9IZtB7uRetIsBgh/OQT08diHiXfr10UBEWKVKRrLpoctY
         8zkeQGotdBDNMgLWr6E2m/LqocxY0bAzLcoTwGhHkxeE/2kbzctLYAn5PSD9kYUvzaqM
         ZjjA==
X-Forwarded-Encrypted: i=1; AJvYcCUAEUEjA1ay5pdhaDCt5zHixAhd6yAj/uM4T4RYVyIoiPksvIG7IcBdX8Yt91utkmG02R+2ifzoQCVzTkw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWZrbvMF+LkYy6CfQY1pn6RXgTY5rboesJSCryZj/BPVKW0nSn
	U3owIhP7QV+xrW/63ErS12SH7NHz2BvVrOJwB/KCX4QGqj2lZvsTls1Sm6d0CC5ciwWiJSmH3hq
	RZFdB2ypCP8ASpb63+010x2ALyMDNyYumfBevyFYYU8uGN3mt8U7gPgJVcrl0/w==
X-Gm-Gg: ASbGncv/LfmoQvGOODgRb9C9DXBfX5YfKyVsix7KmkjucbhsIhULK3WWUSvngYgMAN6
	ETzh8DmPDR93Dlkt+Pj94Os6McS7txTSb2dSV/vCe6zvSx7RSruVosmryZVhARGlRb8Dcf5I4DE
	k2g9/GN+dlyncnxCPs6UnSNg3E6ZVpoeSdrZyDDQ/Clt2t29r+8iq0XEynVFOiAZJuuJQ+F+jHD
	siTn1rbCdVP3Jk5Y+p4s+w5vb7W6qIV2e+aYqd35LQI3UMgRMIuROmiHuZGaFXUq/QUXRmWc3Yu
	5pLIuzUvInyCwTKxnhm3QQ==
X-Received: by 2002:a05:600c:19cc:b0:434:9f0d:3823 with SMTP id 5b1f17b1804b1-434d09b65cdmr65110315e9.9.1733330325119;
        Wed, 04 Dec 2024 08:38:45 -0800 (PST)
X-Received: by 2002:a05:600c:19cc:b0:434:9f0d:3823 with SMTP id 5b1f17b1804b1-434d09b65cdmr65109995e9.9.1733330324699;
        Wed, 04 Dec 2024 08:38:44 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d527395csm29851305e9.17.2024.12.04.08.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 08:38:44 -0800 (PST)
Date: Wed, 4 Dec 2024 17:38:43 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Shiju Jose
 <shiju.jose@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 linux-kernel@vger.kernel.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v5 09/16] acpi/ghes: make the GHES record generation
 more generic
Message-ID: <20241204173843.7ddd2c0a@imammedo.users.ipa.redhat.com>
In-Reply-To: <a35a02028136f9d5445b41760c892de302801500.1733297707.git.mchehab+huawei@kernel.org>
References: <cover.1733297707.git.mchehab+huawei@kernel.org>
	<a35a02028136f9d5445b41760c892de302801500.1733297707.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: jLKA2VhPJIJm

On Wed,  4 Dec 2024 08:41:17 +0100
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

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

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

