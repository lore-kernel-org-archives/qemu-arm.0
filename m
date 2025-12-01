Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6D25D116F8
	for <qemu-arm@archiver.kernel.org>; Mon,  1 Dec 2025 10:18:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vQ0t5-0006hK-26; Mon, 01 Dec 2025 05:12:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1vQ0s0-0005bG-QG
 for qemu-arm@nongnu.org; Mon, 01 Dec 2025 05:11:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1vQ0ru-0003uD-LT
 for qemu-arm@nongnu.org; Mon, 01 Dec 2025 05:10:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1764583853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fGWVhcC4zjG8nxxiobd1UE6Tl65JHRQxp9PlIbFY48Q=;
 b=AWt/g+ppA8jd4nGB861Jcq1IYSC00azSAWYZrxfUBVxdX8kUwMwnkLwI2DUMEx9pwdk9T5
 DlUH++wMjXH+z/ibCwPGnP98hTyocUdQmXvYIWelajuUs7xoKfMuW30y6jXARZf2Cd8FNB
 xoct515JUIgFZKn0BFMmW9+/a8IMdD8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-572-DGGY3yJEMvCIdowUVkbiqQ-1; Mon, 01 Dec 2025 05:10:51 -0500
X-MC-Unique: DGGY3yJEMvCIdowUVkbiqQ-1
X-Mimecast-MFC-AGG-ID: DGGY3yJEMvCIdowUVkbiqQ_1764583850
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-42e2d02b528so951423f8f.0
 for <qemu-arm@nongnu.org>; Mon, 01 Dec 2025 02:10:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764583850; x=1765188650;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fGWVhcC4zjG8nxxiobd1UE6Tl65JHRQxp9PlIbFY48Q=;
 b=klCObPp9aNG3d8wVlp2Lcu8PeRDvR3zP4cLS0DVc5naKjhu8Oy3djbgfWZRa+33YyL
 pK623Q3madCGIpQYqO+t5zV16iDVLjcTTLJTfrntadwgMuJWagmfM2YwyVYnMRtGBi/G
 St/4222jsDTm2rcIKWWIr9911AlJyM7U0JdGJVq/siBlpBcs+9qwnkfmJayuZ7hoKLu/
 v76LUo6VGqzKMbRestquF2zrXFt1MkZ5lcnHqco7JDATk45jBaudV9K0AHRYMdSu/A0e
 w4Dr2lyX2/dHIdcHmN2cXxtQKg8bjf/KkvFH06AX7lI1tadQSVnhis7tpwrWAow+tyeO
 v0Dg==
X-Gm-Message-State: AOJu0Yx3ynDw4xS2hr8cI1GdUBfw7H9O5oMR06un/pdOpUKQFWgZfyXz
 QLHMPX/Z9WIEbESXjibMUjhdysJ/hKvWYVdomywW/x4hRQg2IAp8yupCrxHvVpGn8EoxaCMUZT0
 jtrW5Xx/NxocVqhhParU4Pxae8YGHpA5TmSE4Bm+sLcVn3NMLnRs38Q==
X-Gm-Gg: ASbGncvUv6btA2obpaS7HPZE6eEdE80erJezAkXJHUl7opeEkP5AP/WmXreRFlLS19x
 wUDGv7XZ00P1lqafm7NBW65/e6f/X8qrsMmW+0TZD6rZWYFAwYUEPXwG2iTHjpSgQUfQAqAO4AB
 tLuTJ+6wM4aReSscu7wseBKCFnDmOzskulrR55aYtv6oWhd9g07rBRQ6SuNGLUbbgeEjJoQUJik
 HPX5mStgsINoZ/EtJIzN0wosS+Rjon01F7fIYE/U0T8vtK90M+eLp4ismFqBxPKX/0QtUXijFk6
 U8GQWunBAVqgzO/PyhktTMFpQqz4YHdC8BG3VpzD0VqLH2Q6Rkz1mVAjCJMjqMA5sdUzhg==
X-Received: by 2002:a05:6000:601:b0:427:454:43b4 with SMTP id
 ffacd0b85a97d-42cc1d19da6mr40484317f8f.48.1764583850401; 
 Mon, 01 Dec 2025 02:10:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGBV5IMyR0cwhfxH2M6pg+dma3BLC4zKbkSPle74dgZscLkwrBXQLYFZqmn0d5IzwKKSuY5Vw==
X-Received: by 2002:a05:6000:601:b0:427:454:43b4 with SMTP id
 ffacd0b85a97d-42cc1d19da6mr40484289f8f.48.1764583850014; 
 Mon, 01 Dec 2025 02:10:50 -0800 (PST)
Received: from imammedo ([213.175.46.86]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42e1c5d618csm25086474f8f.14.2025.12.01.02.10.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Dec 2025 02:10:49 -0800 (PST)
Date: Mon, 1 Dec 2025 11:10:48 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, mchehab+huawei@kernel.org,
 jonathan.cameron@huawei.com, armbru@redhat.com, mst@redhat.com,
 anisinha@redhat.com, gengdongjiu1@gmail.com, peter.maydell@linaro.org,
 pbonzini@redhat.com, shan.gavin@gmail.com
Subject: Re: [PATCH 4/5] acpi/ghes: Bail early on error from
 get_ghes_source_offsets()
Message-ID: <20251201111048.17551273@imammedo>
In-Reply-To: <20251127004435.2098335-5-gshan@redhat.com>
References: <20251127004435.2098335-1-gshan@redhat.com>
 <20251127004435.2098335-5-gshan@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: A3_yoCMn8ktl5cKTaU87RDASAEtvP2sY8jCiKTAJLlQ_1764583850
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, 27 Nov 2025 10:44:34 +1000
Gavin Shan <gshan@redhat.com> wrote:

> For one particular error (Error), we can't call error_setg() for twice.
      ^^^^^^^^^^^^^^^^^^^^^^^^^^^
I can't really parse that
maybe rephrase it to make some sense?

> Otherwise, the assert(*errp == NULL) will be triggered unexpectedly in
> error_setv(). In ghes_record_cper_errors(), get_ghes_source_offsets()
> can return a error initialized by error_setg(). Without bailing on
> this error, it can call into the second error_setg() due to the
> unexpected value from the read acknowledgement register.
> 
> Bail early in ghes_record_cper_errors() when error is received from
> get_ghes_source_offsets() to avoid the exception.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

patch itself LGTM
and with commit message fixed
  Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/acpi/ghes.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> index 6366c74248..c35883dfa9 100644
> --- a/hw/acpi/ghes.c
> +++ b/hw/acpi/ghes.c
> @@ -443,7 +443,7 @@ static void get_hw_error_offsets(uint64_t ghes_addr,
>      *read_ack_register_addr = ghes_addr + sizeof(uint64_t);
>  }
>  
> -static void get_ghes_source_offsets(uint16_t source_id,
> +static bool get_ghes_source_offsets(uint16_t source_id,
>                                      uint64_t hest_addr,
>                                      uint64_t *cper_addr,
>                                      uint64_t *read_ack_start_addr,
> @@ -474,7 +474,7 @@ static void get_ghes_source_offsets(uint16_t source_id,
>          /* For now, we only know the size of GHESv2 table */
>          if (type != ACPI_GHES_SOURCE_GENERIC_ERROR_V2) {
>              error_setg(errp, "HEST: type %d not supported.", type);
> -            return;
> +            return false;
>          }
>  
>          /* Compare CPER source ID at the GHESv2 structure */
> @@ -488,7 +488,7 @@ static void get_ghes_source_offsets(uint16_t source_id,
>      }
>      if (i == num_sources) {
>          error_setg(errp, "HEST: Source %d not found.", source_id);
> -        return;
> +        return false;
>      }
>  
>      /* Navigate through table address pointers */
> @@ -508,6 +508,8 @@ static void get_ghes_source_offsets(uint16_t source_id,
>      cpu_physical_memory_read(hest_read_ack_addr, read_ack_start_addr,
>                               sizeof(*read_ack_start_addr));
>      *read_ack_start_addr = le64_to_cpu(*read_ack_start_addr);
> +
> +    return true;
>  }
>  
>  NotifierList acpi_generic_error_notifiers =
> @@ -526,9 +528,10 @@ void ghes_record_cper_errors(AcpiGhesState *ags, const void *cper, size_t len,
>      if (!ags->use_hest_addr) {
>          get_hw_error_offsets(le64_to_cpu(ags->hw_error_le),
>                               &cper_addr, &read_ack_register_addr);
> -    } else {
> -        get_ghes_source_offsets(source_id, le64_to_cpu(ags->hest_addr_le),
> -                                &cper_addr, &read_ack_register_addr, errp);
> +    } else if (!get_ghes_source_offsets(source_id,
> +                    le64_to_cpu(ags->hest_addr_le),
> +                    &cper_addr, &read_ack_register_addr, errp)) {
> +            return;
>      }
>  
>      cpu_physical_memory_read(read_ack_register_addr,


