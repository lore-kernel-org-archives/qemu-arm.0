Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp5519176njc;
        Fri, 22 Nov 2024 08:20:54 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWi3L04xyDEAK5K2teaWWti/e2Der82RVCbgzs1aDhU+XuSBdZZF0NpvQg/otOzsQthlFd+lXTD7yLSvg==@linaro.org
X-Google-Smtp-Source: AGHT+IH+W0S/CgimBX1CTajZQrtbqcakdhDPzWRv+AqpkQsJHXGHucAucroDskAT7IGBlM7BFZK0
X-Received: by 2002:a05:622a:1f16:b0:463:eef:ba30 with SMTP id d75a77b69052e-4652f4755b1mr119269141cf.20.1732292454813;
        Fri, 22 Nov 2024 08:20:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732292454; cv=none;
        d=google.com; s=arc-20240605;
        b=YXMGSZVDHSfQAtnU7c6v1V5bfDXtzIaFlDzliMiPgBNaqC9aoIjjfwqDnGMttcjsNp
         C3govGUg576MAU6gIRC1QhqtYMyLX+4ylDIwIEmY+g0/VHMnNK8XBhJVhaE26yAKTfqe
         uearSI9X51NTLlS9LWsVOEkcB6UaXFp8lYbctJnbn68BxVDSAOJCe+xQLiqzSgH70B7o
         /5b/JT/TyOCbmP0OtAjTr003yqncMxNNoT9OeGcHWs/aQVLpbq3YFC/UHdzX4oVc1t+V
         ehi8Jnth0N4au6ZraC/SYDy5gRcOCsEplVeUOGk97uhb0KJxL2amLOTM9WyryJNmAP6h
         fURQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=aeBsoywq5pgh/XUprwXSGU0TjSDIfHvJFYAFD/VkyJs=;
        fh=MuEQKE6ierBm/otJkyah2i0+9/JEkJerfvvZobUZ7A8=;
        b=XXWl5tb5lSVCrwvPfTegyPD2h+zxLbmhhjj308x1zz7kNsHpRLzJOsP7xq6GsI++4U
         r8abj2JtTe5S6XRAPov5DQcZWcK8APONLDCmgp5TlCvOel79P77giDmUt6mOg/XAM4BT
         dN6wsU/kRrVVQ3UGG2s3X6IKLZW9DYfGL7cml4lhMV630ABvw4roBTZI46PJ/JKUH224
         4d4GoNuOgURaz9RW7kZ8Xev3sKy0gmGJEpuUBuC+99NVH0rWM69yBhNhsPOy1inn+zK8
         oJOsXxB6qWFEDkwxws4FACiIaDyXBozpt5GBPneSdu/iJu8x0mpgBCdK/EHyNAf8bSv/
         j9Tg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f2Qnlzt0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4666fe31487si4300641cf.474.2024.11.22.08.20.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Nov 2024 08:20:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f2Qnlzt0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tEWOi-0004Et-2D; Fri, 22 Nov 2024 11:20:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1tEWOV-0004Au-G8
 for qemu-arm@nongnu.org; Fri, 22 Nov 2024 11:20:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1tEWOT-0003fT-TU
 for qemu-arm@nongnu.org; Fri, 22 Nov 2024 11:20:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1732292429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aeBsoywq5pgh/XUprwXSGU0TjSDIfHvJFYAFD/VkyJs=;
 b=f2Qnlzt0Pt2kIi3ZK21nuccAe6gJNTvcZCIe3T4lLjUILUNcIyfrD35yq5AL7CVc7oki7C
 cNFrT7dHAlTVfy++Gx1Tefagw13+fWlYrIrr7idKaAW8fEMJabpjxUGVc/Nul1pBFrxaTs
 ghD2aLTt/Pu9nYCOSh8BfwrZcNoCxiQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-my0vEbeaMdqX7XgnfqdzoQ-1; Fri, 22 Nov 2024 11:20:27 -0500
X-MC-Unique: my0vEbeaMdqX7XgnfqdzoQ-1
X-Mimecast-MFC-AGG-ID: my0vEbeaMdqX7XgnfqdzoQ
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43159c07193so20222705e9.0
 for <qemu-arm@nongnu.org>; Fri, 22 Nov 2024 08:20:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732292426; x=1732897226;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aeBsoywq5pgh/XUprwXSGU0TjSDIfHvJFYAFD/VkyJs=;
 b=B9HsvNtRVebdUSVWxiMh8sifQIGCI9MpeQn0pNoc462c8tMkuJ99gYwCnrazQAXYje
 z0K9ZhCDfEXT79cdjvzSI23Ca9x5r3iaKWHG/QEFmbY7V+yzkJjLCNiFJub2bpC3RE86
 /Vt3eNPxv1lILb+IVVpSpU1Ms1hTdVSwf+8WnODvXBDwJ08v4XxFl7lFBfj4O7UYv9Wg
 QDTgb9viRsbDQ4R9PCTHtbmVIurbC46DYjx4wEDQ7QThK7ACYu2DJVjM5dJ6t6bok9Bn
 7xRWApPSQrgpBu+HO9lXhX3zIOdVlKylr0gGE4QXxGHMdlqx1SKjFU8nagdWcQOB3hoe
 yLJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCURkLsP8hpxkqDhDMoFxp26IWCqOKR6KFtClQSIW5D7BRiquznN8p51J/ysUREn4w6pN7FD+ZS7eA==@nongnu.org
X-Gm-Message-State: AOJu0YxQHweBIhoaOf5WMm4XBp4eD08jGUJOeQjQzWwIMnm4hFETcDNr
 7bZ+pOxNLhjCKRW34TWlgHXTIYxqxyDzlZugEukLqMHIL6JzqvS+P4RL8wEIz8f0uxsp1FtFxPm
 xOdxiPIdyfVH4yKse3Llbf3KsFsKt41Icg63GP8PJIekqeHoF3A==
X-Gm-Gg: ASbGncsvNoV5ong6YjhYxSKMUEndQ0X+kw2TdbJi7c855rhELONcutYyVSz0XEH0R/s
 pR+ngCVbjk5H3imTn2On5/fUtdFoooGTTvgxAKKhaaS10uMFnyXW92UHKLljZZqD5NTB502qXK1
 arFShZuSgktzfEZGCuYDq7bQD/EW7DTn0tWRPoqprJdxa2j9F/tN6036NemyMeqPguHBjAHANAN
 ulIVym7i/+zpPSbyuWqpCD7xwfuqab6AE+5knOWJ2ADtGwdzxZR5KWIxHzrbsibO1gmIsPGSIaS
 +u9gOwTdtxprj6U/rtMuWQ==
X-Received: by 2002:a05:600c:4fcc:b0:42c:ba83:3f00 with SMTP id
 5b1f17b1804b1-433ce410337mr29781485e9.1.1732292426642; 
 Fri, 22 Nov 2024 08:20:26 -0800 (PST)
X-Received: by 2002:a05:600c:4fcc:b0:42c:ba83:3f00 with SMTP id
 5b1f17b1804b1-433ce410337mr29781235e9.1.1732292426254; 
 Fri, 22 Nov 2024 08:20:26 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-433b4643217sm95331535e9.44.2024.11.22.08.20.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2024 08:20:24 -0800 (PST)
Date: Fri, 22 Nov 2024 17:20:22 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Shiju Jose
 <shiju.jose@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 linux-kernel@vger.kernel.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v4 04/15] acpi/ghes: better handle source_id and
 notification
Message-ID: <20241122172022.64fddb52@imammedo.users.ipa.redhat.com>
In-Reply-To: <0ad66ed39b357d5fbf2e4a6d1fa47d310796cc1c.1732266152.git.mchehab+huawei@kernel.org>
References: <cover.1732266152.git.mchehab+huawei@kernel.org>
 <0ad66ed39b357d5fbf2e4a6d1fa47d310796cc1c.1732266152.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gKjcgDeEs1BV1G7TbdDG4BjUGLNQZXRnJ7UBtGcVTLk_1732292427
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
X-TUID: pCO8xSGkviX5

On Fri, 22 Nov 2024 10:11:21 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> GHES has two fields that are stored on HEST error source
> blocks associated with notifications:
> 
> - notification type, which is a number defined at the ACPI spec
>   containing several arch-specific synchronous and assynchronous
>   types;
> - source id, which is a HW/FW defined number, used to distinguish
>   between different implemented sources.
> 
> There could be several sources with the same notification type,
> which is dependent of the way each architecture maps notifications.
> 
> Right now, build_ghes_v2() hardcodes a 1:1 mapping between such
> fields. Move it to two independent parameters, allowing the
> caller function to fill both.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> 
> ---
> 
> Chenges from v10:
> 
> - Some changes got moved to the previous patch.
> 
> Changes from v8:
> - Non-rename/cleanup changes merged altogether;
> - source ID is now more generic, defined per guest target.
>   That should make easier to add support for 86.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  hw/acpi/ghes.c | 23 +++++++++--------------
>  1 file changed, 9 insertions(+), 14 deletions(-)
> 
> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> index 4a6c45bcb4be..29cd7e4d8171 100644
> --- a/hw/acpi/ghes.c
> +++ b/hw/acpi/ghes.c
> @@ -284,9 +284,13 @@ static void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker)
>  }
>  
>  /* Build Generic Hardware Error Source version 2 (GHESv2) */
> -static void build_ghes_v2(GArray *table_data, int source_id, BIOSLinker *linker)
> +static void build_ghes_v2(GArray *table_data,
> +                          BIOSLinker *linker,
> +                          enum AcpiGhesNotifyType notify,
> +                          uint16_t source_id)
>  {
>      uint64_t address_offset;
> +
>      /*
>       * Type:
>       * Generic Hardware Error Source version 2(GHESv2 - Type 10)
> @@ -316,18 +320,8 @@ static void build_ghes_v2(GArray *table_data, int source_id, BIOSLinker *linker)
>          address_offset + GAS_ADDR_OFFSET, sizeof(uint64_t),
>          ACPI_GHES_ERRORS_FW_CFG_FILE, source_id * sizeof(uint64_t));
>  
> -    switch (source_id) {
> -    case ACPI_HEST_SRC_ID_SEA:
> -        /*
> -         * Notification Structure
> -         * Now only enable ARMv8 SEA notification type
> -         */
> -        build_ghes_hw_error_notification(table_data, ACPI_GHES_NOTIFY_SEA);
> -        break;
> -    default:
> -        error_report("Not support this error source");
> -        abort();
> -    }
> +    /* Notification Structure */
> +    build_ghes_hw_error_notification(table_data, notify);
>  
>      /* Error Status Block Length */
>      build_append_int_noprefix(table_data, ACPI_GHES_MAX_RAW_DATA_LENGTH, 4);
> @@ -369,7 +363,8 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
>  
>      /* Error Source Count */
>      build_append_int_noprefix(table_data, ACPI_GHES_ERROR_SOURCE_COUNT, 4);
> -    build_ghes_v2(table_data, ACPI_HEST_SRC_ID_SEA, linker);
> +    build_ghes_v2(table_data, linker,
> +                  ACPI_GHES_NOTIFY_SEA, ACPI_HEST_SRC_ID_SEA);
>  
>      acpi_table_end(linker, &table);
>  }

