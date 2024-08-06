Received: by 2002:a17:505:1e8b:b0:1be9:327d:8ee3 with SMTP id mw11csp1239055njb;
        Tue, 6 Aug 2024 07:32:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUTVtYRKXGordW48eHvq3BdTbJGjJPj8mHnmm9jsTHc1bA6yP95Vt5Ul1T+TPsMX9i8tn2b5tz+BSCWI6vhdnfebI5HEDfK
X-Google-Smtp-Source: AGHT+IGNZJZGyP79QhU4ro1uepsKeutOZtStcOQvrO5XtFlgvyM4gyhsXpDsGku8bx9vHQi76BKd
X-Received: by 2002:a05:6214:319b:b0:6b5:8015:d72d with SMTP id 6a1803df08f44-6bb986bf70bmr262546996d6.8.1722954725117;
        Tue, 06 Aug 2024 07:32:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722954725; cv=none;
        d=google.com; s=arc-20160816;
        b=dXN9oRFnmheWajDLSZAeNOfC9ZQYjvaXGphNX96QkIihLaA1llItlQ1EkhtpLzp9+w
         HUbDKm39XvX5qQdM62gqRyYFp1vdblI2Seoh9WLgaqaZBCrhZ/rMH43PCtTEX+8TYJJS
         +3yCzeDudyT4JPCjW3+aNiKpQp6MHG8zmPw8a7JcEwMRvSqHgfkOqX/hAOoQSWFfUZxO
         Re5EZB5ICicflHZHSjr7Ou5ueo3HuAK5BoL6ivrkC/mGzlE9eh/+AWOtm9aX5FZHxTNp
         Lir0dRRTnb51Lkm7dZJYPaCNqnQCDTnowSmpoYb3yLF6mAzNOOFYUsWBcFpn4iU5oxq8
         d/NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=EvF8Xylsgtl9CdwpW85ezra0SLl7EikGkhlaTaeGrqo=;
        fh=Aczq1KBWsUcElDpqFMaiuz6gqau+wdJcgsvR7Z3Dsd8=;
        b=a/CmFWe5JdpJ8R7yu9BxIXCfbwOdqR1QDSkACPDa3RQz7JPTmYklKYqx/PMd1GxmSE
         BjkJOOLsDj5VeGT4Hc/z7TaZUEZF007DdzDKu9d/zA0ughvl/9T8SZlgVhjT4TbmFoej
         0IeAPpf1WbBkG5noTEUAX46+DWedNylgo68lURTXgU6w0RFbqMSG+9ySBF+BLBU0pHh2
         4gSjAuLGgxCnMmZc/9yEYl0ou4WEsIxk29NYNUFyHklACj8r+e82K5s5h8gTG7yVkTXa
         pIrUHNrd3cQljpaWrktoXym5V5cDJbg3+3j8I1mw5ohM4Gu6zEYiWnsFa5Wu3gxi/yIX
         b6jw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZYXLdL0h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bb9c8e08d0si118488896d6.564.2024.08.06.07.32.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Aug 2024 07:32:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZYXLdL0h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sbLDk-0004Or-AJ; Tue, 06 Aug 2024 10:31:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sbLDf-0004MJ-Dp
 for qemu-arm@nongnu.org; Tue, 06 Aug 2024 10:31:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sbLDc-0006ki-9m
 for qemu-arm@nongnu.org; Tue, 06 Aug 2024 10:31:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1722954678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EvF8Xylsgtl9CdwpW85ezra0SLl7EikGkhlaTaeGrqo=;
 b=ZYXLdL0hIIQV67PawJzd4SIEOpdFWABZfmXJrcmrbnafubZmriyw1rMg4kPcrZQr4VtIQ3
 fM/suvpL2p+63nL4tctWGz9H/qUtIUom0ELLQwef4zoc7vj12/2Q2TkU7k6c/CTMMMEN/z
 UhuuneHjs8XLDl52UA1I1vmdQXPTukw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-352--l9fa9QLPry96IXdR_h1RQ-1; Tue, 06 Aug 2024 10:31:16 -0400
X-MC-Unique: -l9fa9QLPry96IXdR_h1RQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-42820c29a76so5150895e9.2
 for <qemu-arm@nongnu.org>; Tue, 06 Aug 2024 07:31:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722954675; x=1723559475;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EvF8Xylsgtl9CdwpW85ezra0SLl7EikGkhlaTaeGrqo=;
 b=Tk+NDhk4IT4yLLDGLY3vEnU7/nKsGbjgWP1A7MroIVKh8RXEQdqHBqJnvpK4pt1NxE
 3SLDvypR7X1OA/64zeqAmTe4E1KK0YEmh6nb6YUkl5EK7d4XCLRpL3S0t+ZU4v91/Uff
 WnbF7UjAJT/U/AeCYGXlfAQeWYB7WgplqCZejoHMshKM1tNSKXC0GCLBaYNmFnmu5FLR
 3pmQH3B1Ul0SHlnd/JbeYYyT0hJ6jSQsySy6ynTKpcJ1uAg4MHO/HcuW3gGVfYkutIlr
 9zSV0OC+7EN3AquLfZTT2tu9UD77zMM/LyWTuhXw6gE6PnNNPoSXKUHQI74uKrPGnVgM
 TxCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPp+fFyDcCYn8PGl5ZZUyl/qkUNgVufU5aduHQFImozQgUMYTyiQKlmJorfN8CBDgTcLbXaCjKXiVzkoqh+xny4e2a
X-Gm-Message-State: AOJu0Yxl0cNVuoY8ZGGYicj40XxwFaZIeuZkBimmavw+IsZl+2Ua1DGN
 y4nvRbMlE8PFQAYY62nhPmkNAJOt8KsL7BcAXL0RyA0q48GOOw0YXcleNpvNmjVcPasPHq6OtLo
 n+hx38vZh0QaKL488rE+lSDvSdOzokprQFz5OXLlxQe6niP+xgg==
X-Received: by 2002:a05:600c:580a:b0:428:f1b4:3473 with SMTP id
 5b1f17b1804b1-428f1b4398bmr71197145e9.26.1722954674989; 
 Tue, 06 Aug 2024 07:31:14 -0700 (PDT)
X-Received: by 2002:a05:600c:580a:b0:428:f1b4:3473 with SMTP id
 5b1f17b1804b1-428f1b4398bmr71196805e9.26.1722954674364; 
 Tue, 06 Aug 2024 07:31:14 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-428ebbe18c0sm161469075e9.17.2024.08.06.07.31.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Aug 2024 07:31:13 -0700 (PDT)
Date: Tue, 6 Aug 2024 16:31:13 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Shiju Jose
 <shiju.jose@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 linux-kernel@vger.kernel.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v5 6/7] acpi/ghes: add support for generic error
 injection via QAPI
Message-ID: <20240806163113.3bdc260a@imammedo.users.ipa.redhat.com>
In-Reply-To: <20c491e357340e0062b6ff09867c1661ed4d2479.1722634602.git.mchehab+huawei@kernel.org>
References: <cover.1722634602.git.mchehab+huawei@kernel.org>
 <20c491e357340e0062b6ff09867c1661ed4d2479.1722634602.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.144,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: hMg4Ye4uLZKP

On Fri,  2 Aug 2024 23:44:01 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Provide a generic interface for error injection via GHESv2.
> 
> This patch is co-authored:
>     - original ghes logic to inject a simple ARM record by Shiju Jose;
>     - generic logic to handle block addresses by Jonathan Cameron;
>     - generic GHESv2 error inject by Mauro Carvalho Chehab;
> 
> Co-authored-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Co-authored-by: Shiju Jose <shiju.jose@huawei.com>
> Co-authored-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Cc: Shiju Jose <shiju.jose@huawei.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  hw/acpi/ghes.c         | 159 ++++++++++++++++++++++++++++++++++++++---
>  hw/acpi/ghes_cper.c    |   2 +-
>  include/hw/acpi/ghes.h |   3 +
>  3 files changed, 152 insertions(+), 12 deletions(-)
> 
> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> index a745dcc7be5e..e125c9475773 100644
> --- a/hw/acpi/ghes.c
> +++ b/hw/acpi/ghes.c
> @@ -395,23 +395,22 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
>      ags->present = true;
>  }
>  
> +static uint64_t ghes_get_state_start_address(void)

ghes_get_hardware_errors_address() might better reflect what address it will return

> +{
> +    AcpiGedState *acpi_ged_state =
> +        ACPI_GED(object_resolve_path_type("", TYPE_ACPI_GED, NULL));
> +    AcpiGhesState *ags = &acpi_ged_state->ghes_state;
> +
> +    return le64_to_cpu(ags->ghes_addr_le);
> +}
> +
>  int acpi_ghes_record_errors(uint8_t source_id, uint64_t physical_address)
>  {
>      uint64_t error_block_addr, read_ack_register_addr, read_ack_register = 0;
> -    uint64_t start_addr;
> +    uint64_t start_addr = ghes_get_state_start_address();
>      bool ret = -1;
> -    AcpiGedState *acpi_ged_state;
> -    AcpiGhesState *ags;
> -
>      assert(source_id < ACPI_HEST_SRC_ID_RESERVED);
>  
> -    acpi_ged_state = ACPI_GED(object_resolve_path_type("", TYPE_ACPI_GED,
> -                                                       NULL));
> -    g_assert(acpi_ged_state);
> -    ags = &acpi_ged_state->ghes_state;
> -
> -    start_addr = le64_to_cpu(ags->ghes_addr_le);
> -
>      if (physical_address) {
>          start_addr += source_id * sizeof(uint64_t);

above should be a separate patch

>  
> @@ -448,9 +447,147 @@ int acpi_ghes_record_errors(uint8_t source_id, uint64_t physical_address)
>      return ret;
>  }
>  
> +/*
> + * Error register block data layout
> + *
> + * | +---------------------+ ges.ghes_addr_le
> + * | |error_block_address0 |
> + * | +---------------------+
> + * | |error_block_address1 |
> + * | +---------------------+ --+--
> + * | |    .............    | GHES_ADDRESS_SIZE
> + * | +---------------------+ --+--
> + * | |error_block_addressN |
> + * | +---------------------+
> + * | | read_ack0           |
> + * | +---------------------+ --+--
> + * | | read_ack1           | GHES_ADDRESS_SIZE
> + * | +---------------------+ --+--
> + * | |   .............     |
> + * | +---------------------+
> + * | | read_ackN           |
> + * | +---------------------+ --+--
> + * | |      CPER           |   |
> + * | |      ....           | GHES_MAX_RAW_DATA_LENGT
> + * | |      CPER           |   |
> + * | +---------------------+ --+--
> + * | |    ..........       |
> + * | +---------------------+
> + * | |      CPER           |
> + * | |      ....           |
> + * | |      CPER           |
> + * | +---------------------+
> + */

no need to duplicate docs/specs/acpi_hest_ghes.rst,
I'd just reffer to it and maybe add short comment as to why it's mentioned.

> +/* Map from uint32_t notify to entry offset in GHES */
> +static const uint8_t error_source_to_index[] = { 0xff, 0xff, 0xff, 0xff,
> +                                                 0xff, 0xff, 0xff, 1, 0};
> +
> +static bool ghes_get_addr(uint32_t notify, uint64_t *error_block_addr,
> +                          uint64_t *read_ack_addr)
> +{
> +    uint64_t base;
> +
> +    if (notify >= ACPI_GHES_NOTIFY_RESERVED) {
> +        return false;
> +    }
> +
> +    /* Find and check the source id for this new CPER */
> +    if (error_source_to_index[notify] == 0xff) {
> +        return false;
> +    }
> +
> +    base = ghes_get_state_start_address();
> +
> +    *read_ack_addr = base +
> +        ACPI_GHES_ERROR_SOURCE_COUNT * sizeof(uint64_t) +
> +        error_source_to_index[notify] * sizeof(uint64_t);
> +
> +    /* Could also be read back from the error_block_address register */
> +    *error_block_addr = base +
> +        ACPI_GHES_ERROR_SOURCE_COUNT * sizeof(uint64_t) +
> +        ACPI_GHES_ERROR_SOURCE_COUNT * sizeof(uint64_t) +
> +        error_source_to_index[notify] * ACPI_GHES_MAX_RAW_DATA_LENGTH;
> +
> +    return true;
> +}

I don't like all this pointer math, which is basically a reverse engineered
QEMU actions on startup + guest provided etc/hardware_errors address.

For once, it assumes error_source_to_index[] matches order in which HEST
error sources were described, which is fragile.

2nd: migration-wive it's disaster, since old/new HEST/hardware_errors tables
in RAM migrated from older version might not match above assumptions
of target QEMU. 

I see 2 ways to rectify it:
  1st: preferred/cleanest would be to tell QEMU (via fw_cfg) address of HEST table
       in guest RAM, like we do with etc/hardware_errors, see
            build_ghes_error_table()
               ...
               tell firmware to write hardware_errors GPA into
       and then fetch from HEST table in RAM, the guest patched error/ack addresses
       for given source_id

       code-wise: relatively simple once one wraps their own head over
                 how this whole APEI thing works in QEMU
                 workflow  is described in docs/specs/acpi_hest_ghes.rst
                 look to me as sufficient to grasp it.
                 (but my view is very biased given my prior knowledge,
                  aka: docs/comments/examples wrt acpi patching are good enough)
                 (if it's not clear how to do it, ask me for pointers)

  2nd:  sort of hack based on build_ghes_v2() Error Status Address/Read Ack Register
        patching instructions
               bios_linker_loader_add_pointer(linker, ACPI_BUILD_TABLE_FILE,                
                   address_offset + GAS_ADDR_OFFSET, sizeof(uint64_t),                      
                   ACPI_GHES_ERRORS_FW_CFG_FILE, source_id * sizeof(uint64_t));
                                                 ^^^^^^^^^^^^^^^^^^^^^^^^^
        during build_ghes_v2() also store on a side mapping
             source_id -> error address offset : read ack address

        so when you are injecting error, you'd at least use offsets
        used at start time, to get rid of risk where injection code
        diverge from HEST:etc/hardware_errors layout at start time.

        However to make migration safe, one would need to add a fat
        comment not to change order ghest error sources in HEST _and_
        a dedicated unit test to make sure we catch it when that happens.
        bios_tables_test should be able to catch the change, but it won't
        say what's wrong, hence a test case that explicitly checks order
        and loudly & clear complains when we will break order assumptions.

        downside:
           * we are are limiting ways HEST could be composed/reshuffled in future
           * consumption of extra CI resources
           * and well, it relies on above duct tape holding all pieces together

>  NotifierList generic_error_notifiers =
>      NOTIFIER_LIST_INITIALIZER(error_device_notifiers);
>  
> +void ghes_record_cper_errors(AcpiGhesCper *cper, Error **errp,
> +                             uint32_t notify)
> +{
> +    int read_ack = 0;
       ^^^
[...]
> +    cpu_physical_memory_read(read_ack_addr,
> +                             &read_ack, sizeof(uint64_t));
                                                  ^^^^
it looks like possible stack corruption, isn't it?

> +    /* zero means OSPM does not acknowledge the error */
> +    if (!read_ack) {
> +        error_setg(errp,
> +                   "Last CPER record was not acknowledged yet");
> +        read_ack = 1;
> +        cpu_physical_memory_write(read_ack_addr,
> +                                  &read_ack, sizeof(uint64_t));
                                                        ^^^^^
and then who knows what we are writing back here

> +        return;
> +    }
> +
> +    read_ack = cpu_to_le64(0);
> +    cpu_physical_memory_write(read_ack_addr,
> +                              &read_ack, sizeof(uint64_t));
> +
> +    /* Build CPER record */
> +
> +    /*
> +     * Invalid fru id: ACPI 4.0: 17.3.2.6.1 Generic Error Data,
> +     * Table 17-13 Generic Error Data Entry
> +     */
> +    QemuUUID fru_id = {};
> +
> +    block = g_array_new(false, true /* clear */, 1);
> +    data_length = ACPI_GHES_DATA_LENGTH + cper->data_len;
> +
> +    /*
> +        * It should not run out of the preallocated memory if
> +        * adding a new generic error data entry
> +        */
> +    assert((data_length + ACPI_GHES_GESB_SIZE) <=
> +            ACPI_GHES_MAX_RAW_DATA_LENGTH);
it's better to error out gracefully here instead of crash
in case script generated too long record,
not the end of the world, but it's annoying to restart guest
on external mistake.

PS:
looking at the code, ACPI_GHES_MAX_RAW_DATA_LENGTH is 1K
and it is the total size of a error block for a error source.

However acpi_hest_ghes.rst (3) says it should be 4K,
am I mistaken? 


> +    /* Build the new generic error status block header */
> +    acpi_ghes_generic_error_status(block, ACPI_GEBS_UNCORRECTABLE,
> +                                    0, 0, data_length,
> +                                    ACPI_CPER_SEV_RECOVERABLE);
> +
> +    /* Build this new generic error data entry header */
> +    acpi_ghes_generic_error_data(block, cper->guid,
> +                                ACPI_CPER_SEV_RECOVERABLE, 0, 0,
> +                                cper->data_len, fru_id, 0);
> +

not that I mind, but I'd ax above calls with their hardcoded
assumptions and make script generate whole error block,
it's more flexible wrt ACPI_CPER_SEV_RECOVERABLE/ACPI_GEBS_UNCORRECTABLE
and then one can ditch from QAPI interface cper->guid.

basically inject whatever user provided via QAPI without any other assumptions.

> +    /* Add CPER data */
> +    for (i = 0; i < cper->data_len; i++) {
> +        build_append_int_noprefix(block, cper->data[i], 1);
> +    }
> +
> +    /* Write the generic error data entry into guest memory */
> +    cpu_physical_memory_write(error_block_addr, block->data, block->len);
> +
> +    g_array_free(block, true);
> +
> +    notifier_list_notify(&generic_error_notifiers, NULL);
> +}
> +
>  bool acpi_ghes_present(void)
>  {
>      AcpiGedState *acpi_ged_state;
> diff --git a/hw/acpi/ghes_cper.c b/hw/acpi/ghes_cper.c
> index 7aa7e71e90dc..d7ff7debee74 100644
> --- a/hw/acpi/ghes_cper.c
> +++ b/hw/acpi/ghes_cper.c
> @@ -39,7 +39,7 @@ void qmp_ghes_cper(CommonPlatformErrorRecord *qmp_cper,
>          return;
>      }
>  
> -    /* TODO: call a function at ghes */
> +    ghes_record_cper_errors(&cper, errp, ACPI_GHES_NOTIFY_GPIO);
>  
>      g_free(cper.data);
>  }
> diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
> index 06a5b8820cd5..ee6f6cd96911 100644
> --- a/include/hw/acpi/ghes.h
> +++ b/include/hw/acpi/ghes.h
> @@ -85,6 +85,9 @@ typedef struct AcpiGhesCper {
>      size_t data_len;
>  } AcpiGhesCper;
>  
> +void ghes_record_cper_errors(AcpiGhesCper *cper, Error **errp,
> +                             uint32_t notify);

maybe rename it to acpi_ghes_inject_error_block()

> +
>  /**
>   * acpi_ghes_present: Report whether ACPI GHES table is present
>   *

