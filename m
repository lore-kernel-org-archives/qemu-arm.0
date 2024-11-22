Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp5518805njc;
        Fri, 22 Nov 2024 08:20:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVpZpIW76jeIVagW8RY63Wbm2Tvlvzl/lNbQgjUDstnVqVizjQk/nv+y2gbfTG4kbBDB0M4lMyPKHgfEw==@linaro.org
X-Google-Smtp-Source: AGHT+IHgAVjlZOewy2m+zUXOXQTgbuW7crdqP8aDEcKAOP6A4jouKu/EQgmy8OQ5xQVmPjzTD5aB
X-Received: by 2002:a05:6870:46a2:b0:296:cdee:f7de with SMTP id 586e51a60fabf-29720c33a6fmr3948495fac.21.1732292427618;
        Fri, 22 Nov 2024 08:20:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732292427; cv=none;
        d=google.com; s=arc-20240605;
        b=Y7AISLd9fUEMgK8GgLQp0mQtMV/e3A2e2xQhXlHQLHqQnGeqKhEUlYu17qgJOAIfTd
         62L9rfpiXr5FwHuTL5/atEYgykQ29nbZH1eeg8y4PjC3azOTtlRzH12tDsu9YLhA5iL0
         p/tqlPABGaRveq4xpWtWDF5fRujuY9E8nJ7NdzuFQuhGPfHHLOf0FBAafFyYjR6LA+9m
         zSN3TPki45JYdMqviRGbAnWB1FHRwcjJLIY4fYLs48igcwLPb923VQBP8OXCLkih+HoV
         4cD2fwuWvIMG3Kw2Aq/Ir442zIb883Uo10heRfx2qPqNJ8+h+4BwpQyRUhZPZ+tyd93m
         Af7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=qCg2yuM5W+19EEUOO4BPnlKZkKEAq+aS7UcMcDWPQ+8=;
        fh=WuskrFKLM3NGLXFVaNFqyI+A4foZceFKFBpEUQaIClI=;
        b=PbjkBDz9DlsqOgrAaDy0LjXkLhVAK+BU5y1KIqDQu19eMerbtQEFQzL7E3JPQJ2LZF
         v2gkK5gV9drEsvQXSFCzHFoq9k80VUiLVY2+aeuRaIWSHS8bvBGzQUZvtGF25PwMash7
         Y4JWreV7cSIFSAaZTkVVsSCY7rESj1kuzjg0Ku0RInjrDxpGZxztkQC5G+XVe0Gp22RC
         UXiSxpDxphitQGynYmbABaOIOFo4qnhuK3E2Br0RZEm/OzWOQ3q0YR2t9mvf3UP5LH6M
         A2ZT7Tavae5lHfEJTV5uSinHlb5hzxeaUiMfa8D5D674NKZbhbHhTQo1Gpq8366QgcCe
         okNA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gvt12Z9j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4666fe01512si5099401cf.316.2024.11.22.08.20.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Nov 2024 08:20:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gvt12Z9j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tEWNy-0003b4-C9; Fri, 22 Nov 2024 11:19:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1tEWNv-0003PS-Gz
 for qemu-arm@nongnu.org; Fri, 22 Nov 2024 11:19:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1tEWNt-0003Mv-Iq
 for qemu-arm@nongnu.org; Fri, 22 Nov 2024 11:19:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1732292390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qCg2yuM5W+19EEUOO4BPnlKZkKEAq+aS7UcMcDWPQ+8=;
 b=gvt12Z9jYBKA+bPsbRoXkiYn0aMBJB1vW7KfAL0tFbvwWL89wtMJlN47Sy8rG1fyW4sGgH
 sgOAoK4w5I6TqDWG2VcqgKCReAjEzERcPXqyA71FzkC10byvIgtZFc0mH5dM7Yhx1mfJPO
 GTHTqxPrHO/cWkJ5LHhUTFwZxKm5jGA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-540-9hPst1KuOOOYF-QLyeQlNQ-1; Fri, 22 Nov 2024 11:19:48 -0500
X-MC-Unique: 9hPst1KuOOOYF-QLyeQlNQ-1
X-Mimecast-MFC-AGG-ID: 9hPst1KuOOOYF-QLyeQlNQ
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4316e350d6aso17061805e9.3
 for <qemu-arm@nongnu.org>; Fri, 22 Nov 2024 08:19:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732292387; x=1732897187;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qCg2yuM5W+19EEUOO4BPnlKZkKEAq+aS7UcMcDWPQ+8=;
 b=F+gcJGDSjqlhG8NpdX/nxRZJx20Y4RENHqiZ0tnc4gAQe1jHXAP+PZPREYEyHU7cn2
 uwzxnr+ECwRvHW03VdxvqRmJEfYAiw44pE6aBy2RfHB+deVP8Lb01Qf+r0k9LjCluimZ
 /qKs/JoJY7+6/fPFzG/DtJ1c58sAYlWTf0KQPMjLFYr8EKju6e5OZ0xuDBbPghWC8i3W
 m8LhWsHAgcJwfmqDC4/l+JpFUhfjusn+Wu+e5D9xYcgCcW3yGNa/c7V+dcex2+To8vAH
 qVs/ct2G/2IRCtNQdPNGV1HHH3uH9FVkUvyKYYnkNO25/09M5106C3puyogbsRiDSD9i
 j3Yw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfBAcySppzBlpj+11iGRbkjG7fg8zlObi6iTl0w/3gCZjyF+wM+nGr6CYxtmWZso4BNUL2ughafQ==@nongnu.org
X-Gm-Message-State: AOJu0Yxh/ycpTibDOej2NYXLIW+6kYx2UMv2LGIIMZOWK6O7ULH9e16O
 KWnElE7SmH3yLxDGbI4z+woJx5KtD3//clcIv1sZ/XBuKjr4fEIH1vppqsVZrBgGRNPv5AQkETg
 orZ56KKhyXue4QOVkkEw0cmXNW0GFIOZVvSpTOAFlAQBwbv/9xQ==
X-Gm-Gg: ASbGncvA4IIeDey7gFZKA26EzonW6/51GSw2xi0255izE+Qd5XYURbygcOQdx41xH/8
 v8s9nG30bHetCnOQBT8EqesIBls2Qr3wSOij0q487DYPxVz9rsdl4Silt8kVM7/1EEhn5JjLVse
 LeouTMNi4CdeX0FyuTOKq+Y2I/tLPrTMTiWO0uzjOWdjuNIgeHjxt3PCVKfI3lum+eHC3l5I4zK
 QTxicpRuChjjOH1wrYuxYtxT6W8ChowFIRd92K/uU08SLFLiAv4bOeWaR0u6oqMMMqFgPfQD0vH
 PX/6sejIKRPZM6d4q3GFAg==
X-Received: by 2002:a05:600c:5249:b0:431:5aea:95f with SMTP id
 5b1f17b1804b1-433ce430fecmr35261905e9.16.1732292386743; 
 Fri, 22 Nov 2024 08:19:46 -0800 (PST)
X-Received: by 2002:a05:600c:5249:b0:431:5aea:95f with SMTP id
 5b1f17b1804b1-433ce430fecmr35261725e9.16.1732292386365; 
 Fri, 22 Nov 2024 08:19:46 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fd04ec7sm2780626f8f.110.2024.11.22.08.19.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2024 08:19:45 -0800 (PST)
Date: Fri, 22 Nov 2024 17:19:44 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Shiju Jose
 <shiju.jose@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 linux-kernel@vger.kernel.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v4 08/15] acpi/ghes: make the GHES record generation
 more generic
Message-ID: <20241122171944.4b5ac367@imammedo.users.ipa.redhat.com>
In-Reply-To: <b3845a8c78ef36c633d5e20af868de4ed16650a4.1732266152.git.mchehab+huawei@kernel.org>
References: <cover.1732266152.git.mchehab+huawei@kernel.org>
 <b3845a8c78ef36c633d5e20af868de4ed16650a4.1732266152.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5zAhJjgpz2beKLVsTzEItP0zEWGvKUM3whZYbEIDZ9A_1732292387
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.143,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: RQ4RHASqpzaR

On Fri, 22 Nov 2024 10:11:25 +0100
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
> ---
>  hw/acpi/ghes.c         | 131 ++++++++++++++++++++++++-----------------
>  include/hw/acpi/ghes.h |   3 +
>  2 files changed, 79 insertions(+), 55 deletions(-)
> 
> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> index edc74c38bf8a..a96856d5110b 100644
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
> @@ -400,16 +376,16 @@ int acpi_ghes_record_errors(uint16_t source_id, uint64_t physical_address)
>  
>      start_addr = le64_to_cpu(ags->ghes_addr_le);
>  
> -    if (!physical_address) {
> -        return -1;
> -    }
> -
>      start_addr += source_id * sizeof(uint64_t);
>  
>      cpu_physical_memory_read(start_addr, &error_block_addr,
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
> @@ -419,24 +395,69 @@ int acpi_ghes_record_errors(uint16_t source_id, uint64_t physical_address)
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
> +     * Clear the Read Ack Register, OSPM will write it to 1 when
> +     * it acknowledges this error.
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
> +    if (!physical_address) {
> +        error_report("can not find Generic Error Status Block for source id %d",
> +                     source_id);

isn't it a copy paste error from somewhere, perhaps it's mixed up with something else?
Granted, the check was there before patches but error message seems bogus.

Also 'physical_address' is a faulty page here, and 0 is as valid as any other value.
I'd say we should drop the check, and if from ARM/KVM pov 0 addr shouldn't exist
then it should be up to caller to filter it out and not call  acpi_ghes_record_errors()
in the 1st place.


> +        return -1;
> +    }
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

