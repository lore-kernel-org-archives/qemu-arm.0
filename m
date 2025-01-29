Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp3792049njk;
        Wed, 29 Jan 2025 06:15:08 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCXU6TynAoSSLnhjlC49vjnc4QP2YnKhPvYT7l63X6cZ5jFaGMhPtwFDvtNsuGetRHAEzUikS1zu1F2BCQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFEzt0Ne3W5pA3kk08zLPedeKohBHI1CDnS00r8XTzxHs3Dg5I2V25wBEq6EsodbfDrw1tq
X-Received: by 2002:a17:90b:2f46:b0:2f4:4431:51d4 with SMTP id 98e67ed59e1d1-2f82bff6fcdmr11323052a91.6.1738160108095;
        Wed, 29 Jan 2025 06:15:08 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1738160108; cv=pass;
        d=google.com; s=arc-20240605;
        b=CoDwSwjyuQsehf2gNDcE5NFfHuQTFs4u1kK1lpkFT+sYT8bryWtSKPEFtkPVDt4c0E
         VEA6QqWuX98QwA4/vGu9sGg1HNdqhGbpBo6yK3eCg3O2Ks/cgmTUlVrrv8fMKTNB6lLd
         W+qfBCg4kQSpvq8B4eUdTIZKqXE+bABGbMteJDsnAHvDoWQPWs7yUrH8LW/TnEIx+MPh
         FzgHigaT+NwcUgZPBZ5kv4Sz9Gl9HGIOZo0W/sS7494NMHDFwjzSYj++1K/sDI25wJLP
         QPLvGobldrLFlO8t4RTnmfUHmGodjDJutnzNtD/qHDRdXvUqkb2h7LvhzZGrClzikjx6
         JhaA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=fZm0yViyPaB4mjqdNpOSz1nhQ39D3mT/cQfmITx4EJw=;
        fh=ipUANwP31mYrzOaU50/dMI0YM7E1RoR0zKXqnGUuh/g=;
        b=MWBfeyyFhOh+Wu9QNvgVtoBvjjl6SOWbrWsGH5jp0eITPtIWwajNjTpvl0NRY18rRF
         kCT/lC25ZP2QpDC62FhzK9aBnbC9Mp6226qqG9NMr6PXYCkXuY3D/aeMgV2VuySr8Evd
         9ZnjW7X+7XBXTzU1PGCpbFAojEk0eKD34LUYZsoAmQgxqG/rmaDKwFmJHiF2ibpm74SL
         DfqtiURiCYvcNEt+H9K0Nd6IbKR1LVl+0WHiJEWOlT+8iW0eb1fhbJNG2WqtPVwNaO0z
         LEZLpJru7W30reux1Axu7yLbR7WKkv4SacmJX08ajuke0JHCFuDep9U1osSZXZ+9dk8E
         xIyg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Y3zJGTrc;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-492581-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-492581-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <linux-kernel+bounces-492581-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id 41be03b00d2f7-ace26322ce9si350463a12.17.2025.01.29.06.15.07
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 06:15:08 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-492581-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Y3zJGTrc;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-492581-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-492581-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 526F13A13D4
	for <alex.bennee@linaro.org>; Wed, 29 Jan 2025 14:14:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C71B714BFA2;
	Wed, 29 Jan 2025 14:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y3zJGTrc"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983D2DF49
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 14:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738160102; cv=none; b=jYlJ523I1Ayie0UAohXz/D7v4lHzgXTA6XwY+99lT2/EKTad2QJOZC+wbrGNBOpmwJLTB+3PEDuoO0CFB92In53EooW/G+3937Z0uRgUJ61PppdWbubec9mEkyIvhbS6X79wbJp0HPp2SCuHa33aDkTW9FwrqCOuqi3t3LI7kWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738160102; c=relaxed/simple;
	bh=Sy2TFbIA87CpM6emKAuUA8RRvpTZ8Re00icALGzY8hs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hTst0hbIhC+sKkQeajBkRUaaeuTLZgkkVfI9POUV14P/PnmLCUbKdU+BOofRFUTABdOybJU57q3TDQEgNa9vb8K3F+icVg7/+gV+iMzKAlum7biD68ZXepisEmV9EvBlRbCb/pW9pdoapMrTgYXn7umQGfScz8V7C+5zDcqoZuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y3zJGTrc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738160099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fZm0yViyPaB4mjqdNpOSz1nhQ39D3mT/cQfmITx4EJw=;
	b=Y3zJGTrcIQFTHKpDRnB4UvsxTc1l0IvaZz/+kz3v2441CDedhL1tRi7m6ZLsYu6OyWhnEC
	wN+zK1pgFJdO4oMm+Bj7W0Uf35I8CbbQ8qq10DFS+d2ll5POS02S1abdQhS/WhWNePJCIP
	i68oqdkUqjxj//msDI7JPPupDHowVTw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-449-_kzWSDqSNVW9WdGGCppm0Q-1; Wed, 29 Jan 2025 09:14:58 -0500
X-MC-Unique: _kzWSDqSNVW9WdGGCppm0Q-1
X-Mimecast-MFC-AGG-ID: _kzWSDqSNVW9WdGGCppm0Q
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4388eee7073so3808535e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 06:14:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738160097; x=1738764897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fZm0yViyPaB4mjqdNpOSz1nhQ39D3mT/cQfmITx4EJw=;
        b=OUg6Hu0EU+9WDq+zpWwP0ctNrfA8xzI/LMWl+Ik9yoRF6a0xGNgmOfpwm0bFhlUY8E
         FoSG4ynYWfUiuEYN3/LwIp2QVptAaJMqzalwv3uvYL9GdbiGATYfxJTcvs4NECgR6oqd
         osT/i23fsTbM7pgT6/RLsirj/F7Xhgt1ImZCfOpVxHjwKe4d9lfYhMsmknt5KCRUf8wp
         6fJhrbZbi/w7CT3HX7S4p4wtdD122qyAQxcrUmha6v6H8yFJgFWTEyj0MxdjvFNEPrEZ
         sA5qPWenmQ4IDvGQWTZrWS6x8nPLjaw3l3ckq+5BoT4SDw024kePV4GH/cwxMtmV3GIt
         rAag==
X-Forwarded-Encrypted: i=1; AJvYcCUQ7y2/72P7qKn0VVVMAp9iU67A1+J0s07F2OvsBC25i62IG7nUvrD/Ebtv6qcuJJp2rsEvdWJtLqlpDTc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+BlkiAMBDkQfP0803paRbZI847rKMn9fdfGGw230MkFQABUYk
	0X24U3x/IU1051VWYRWqJLUJ2JBsYIYsx3fsxZ1FC1HOpIb3JG0Eo0czXiWrV4OqS2G70O08IDB
	aO7+mjt7gbbHEDZR4fkbF9Ql6+/Ubg2cJ1S8N2M6MKod8C6T93pBgB0yCF5J7xA==
X-Gm-Gg: ASbGnctl8jNYzs+6kYRMuBoxrZoNTCoWTOOMwCOvMSCvh28YdN/mCUIjlCtK18/tr8i
	/jii4ZIdnxUlXNC37m1LYEL8XVWE3sSKlDFX+baOOep5DpFYj2MJr7g2Lp00pFtQx9cCSyti+L/
	c7m+lMtRPaMimKFOxMdvXgBTBTOJW6562mgABdK3ZbH5sdLUO+bxhRL+jmvSc8BnND0lYAtA0mO
	IW/qkcd9W9vwDUGyKYQPXvRrBpKJiHxSH9avHOr4N65QO4Xt8UF3zpzLa9uk2g+bMy09LEwPCfA
	4CFcW5aKoSKve0mXOIG7+XWE/E7URmhFV6BUVWw7q5NIEycSnSXY
X-Received: by 2002:a05:600c:244:b0:436:1b77:b5aa with SMTP id 5b1f17b1804b1-438d5967dbfmr63834665e9.8.1738160096797;
        Wed, 29 Jan 2025 06:14:56 -0800 (PST)
X-Received: by 2002:a05:600c:244:b0:436:1b77:b5aa with SMTP id 5b1f17b1804b1-438d5967dbfmr63834465e9.8.1738160096402;
        Wed, 29 Jan 2025 06:14:56 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc2c4ddsm24216605e9.17.2025.01.29.06.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 06:14:55 -0800 (PST)
Date: Wed, 29 Jan 2025 15:14:54 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Shiju Jose <shiju.jose@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 04/13] acpi/ghes: Use HEST table offsets when
 preparing GHES records
Message-ID: <20250129151454.0f5293d7@imammedo.users.ipa.redhat.com>
In-Reply-To: <de81bd00f4b0b656bc0d191232610b86e157fcb8.1738137123.git.mchehab+huawei@kernel.org>
References: <cover.1738137123.git.mchehab+huawei@kernel.org>
	<de81bd00f4b0b656bc0d191232610b86e157fcb8.1738137123.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: FQ1mnTWo6Ur5

On Wed, 29 Jan 2025 09:04:10 +0100
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
> ---
>  hw/acpi/ghes.c | 111 ++++++++++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 101 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> index db6bed010eb0..adf80945c6db 100644
> --- a/hw/acpi/ghes.c
> +++ b/hw/acpi/ghes.c
> @@ -61,6 +61,25 @@
>   */
>  #define ACPI_GHES_GESB_SIZE                 20
>  
> +/*
> + * Offsets with regards to the start of the HEST table stored at
> + * ags->hest_addr_le, according with the memory layout map at
> + * docs/specs/acpi_hest_ghes.rst.
> + */
> +
> +/*
> + * ACPI 6.2: 18.3.2.8 Generic Hardware Error Source version 2
> + * Table 18-382 Generic Hardware Error Source version 2 (GHESv2) Structure
> + */
> +#define HEST_GHES_V2_TABLE_SIZE  92
> +#define GHES_READ_ACK_ADDR_OFF          64
> +
> +/*
> + * ACPI 6.2: 18.3.2.7: Generic Hardware Error Source
> + * Table 18-380: 'Error Status Address' field
> + */
> +#define GHES_ERR_STATUS_ADDR_OFF  20
> +
>  /*
>   * Values for error_severity field
>   */
> @@ -212,14 +231,6 @@ static void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker,
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
> @@ -420,6 +431,81 @@ static void get_hw_error_offsets(uint64_t ghes_addr,
>      *read_ack_register_addr = ghes_addr + sizeof(uint64_t);
>  }
>  
> +static void get_ghes_source_offsets(uint16_t source_id,
> +                                    uint64_t hest_entry_addr,

now, confusion introduced in 3/13
(hest_addr_le not actually being start of the table but named as such)
continues here 

> +                                    uint64_t *cper_addr,
> +                                    uint64_t *read_ack_start_addr,
> +                                    Error **errp)
> +{
> +    uint64_t hest_err_block_addr, hest_read_ack_addr;
> +    uint64_t err_source_entry, error_block_addr;
> +    uint32_t num_sources, i;
> +
> +    if (!hest_entry_addr) {
> +        return;
> +    }
> +
> +    cpu_physical_memory_read(hest_entry_addr, &num_sources,
> +                             sizeof(num_sources));

hest_entry_addr implies to me error source entry, while what
you are reading here is a part of HEST but not a part of error source

suggest s/hest_entry_addr/hest_addr/ and then read from
  hest_addr + 'Error Source Count'_offset 

> +    num_sources = le32_to_cpu(num_sources);
> +
> +    err_source_entry = hest_entry_addr + sizeof(num_sources);

and amend this line to point to 1st error source entry 

> +
> +    /*
> +     * Currently, HEST Error source navigates only for GHESv2 tables
> +     */
> +
> +    for (i = 0; i < num_sources; i++) {
> +        uint64_t addr = err_source_entry;
> +        uint16_t type, src_id;
> +
> +        cpu_physical_memory_read(addr, &type, sizeof(type));
> +        type = le16_to_cpu(type);
> +
> +        /* For now, we only know the size of GHESv2 table */
> +        if (type != ACPI_GHES_SOURCE_GENERIC_ERROR_V2) {
> +            error_setg(errp, "HEST: type %d not supported.", type);
> +            return;
> +        }
> +
> +        /* Compare CPER source address at the GHESv2 structure */
> +        addr += sizeof(type);
> +        cpu_physical_memory_read(addr, &src_id, sizeof(src_id));

> +

I'd drop this new line

> +        if (le16_to_cpu(src_id) == source_id) {
> +            break;
> +        }
> +
> +        err_source_entry += HEST_GHES_V2_TABLE_SIZE;
> +    }
> +    if (i == num_sources) {
> +        error_setg(errp, "HEST: Source %d not found.", source_id);
> +        return;
> +    }
> +
> +    /* Navigate though table address pointers */
> +    hest_err_block_addr = err_source_entry + GHES_ERR_STATUS_ADDR_OFF +
> +                          GAS_ADDR_OFFSET;
> +
> +    cpu_physical_memory_read(hest_err_block_addr, &error_block_addr,
> +                             sizeof(error_block_addr));
> +
> +    error_block_addr = le64_to_cpu(error_block_addr);
> +
> +    cpu_physical_memory_read(error_block_addr, cper_addr,
> +                             sizeof(*cper_addr));
> +
> +    *cper_addr = le64_to_cpu(*cper_addr);
> +
> +    hest_read_ack_addr = err_source_entry + GHES_READ_ACK_ADDR_OFF +
> +                         GAS_ADDR_OFFSET;
> +
> +    cpu_physical_memory_read(hest_read_ack_addr, read_ack_start_addr,
> +                             sizeof(*read_ack_start_addr));
> +
> +    *read_ack_start_addr = le64_to_cpu(*read_ack_start_addr);
> +}
> +
>  void ghes_record_cper_errors(const void *cper, size_t len,
>                               uint16_t source_id, Error **errp)
>  {
> @@ -440,8 +526,13 @@ void ghes_record_cper_errors(const void *cper, size_t len,
>      }
>      ags = &acpi_ged_state->ghes_state;
>  
> -    get_hw_error_offsets(le64_to_cpu(ags->hw_error_le),
> -                         &cper_addr, &read_ack_register_addr);
> +    if (!ags->hest_addr_le) {
> +        get_hw_error_offsets(le64_to_cpu(ags->hw_error_le),
> +                             &cper_addr, &read_ack_register_addr);
> +    } else {
> +        get_ghes_source_offsets(source_id, le64_to_cpu(ags->hest_addr_le),
> +                                &cper_addr, &read_ack_register_addr, errp);
> +    }
>  
>      if (!cper_addr) {
>          error_setg(errp, "can not find Generic Error Status Block");

