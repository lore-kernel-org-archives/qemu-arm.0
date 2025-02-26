Received: by 2002:a17:504:4644:b0:1be9:327d:8ee3 with SMTP id d4csp952086njg;
        Wed, 26 Feb 2025 06:49:00 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU8l0Ihu25GOe09HoH4SK66Wm347Pv+pRnVlaFvLx0qlgkUDtEHKDjxUbt6imB7GPtwrE4S1c7XD4jopQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEOa0Azccr1hiTLCvo3XoDDnDRqudbUQAumSOaKkjhMaS5SYU75cKuePOn2zHPILbmdJFZM
X-Received: by 2002:a05:620a:2445:b0:7c0:b2c4:f8cf with SMTP id af79cd13be357-7c247f257abmr435682885a.17.1740581339875;
        Wed, 26 Feb 2025 06:48:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740581339; cv=none;
        d=google.com; s=arc-20240605;
        b=UKrXAaatxvMKcGn3WCCb7H0OByZV31PA6oFWzJXSVlmqDYA+IIxlJx2G49qg7qSi7H
         wcuznCNp9i0JdOpIjgZ9UPJHwTD1OslQhH16WjPaX5y/L1NgCQt1eNoJTwTwgupLtrSO
         uvWXRQXRbQqswYF09i7RjAmbCOH1+FkrtoWPmfqkVhXx5DGWmvTCTPZiSfkcVnggud/J
         ASL8pZFMjaSuoZP08LQIEEUHYkbfA9O0XACNbyVhAYTOZyrywSU0YA6Eng8CXcz3GTjY
         H7BqXtECyiC/luciPQErVyMwRjCGBrlBUBUpUci3KRdwCP68Hc2Rjww3Yoqo67v4VOwV
         Ew/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=8vkoWrSDvFL6bPp2+SBWRgFUy47QB4e69nH0NyHiTjI=;
        fh=wjvFX6wTMOMcBfemYwtxq9Uezpa2EMwoDR+suMWd2Dc=;
        b=ZlfD7GigX+d3vsZVtAH8s/YVcrGr16M7dvs71SNHLuCJeE6oV1/n4Z/4TZrJJOrBVD
         nNHzfEdZ8abk+c5Lk1yvfs6dVo5q9FXT05mDy2wUiti1t44WXEcb4+v4u3qqettdVNPW
         QtcB4RdBNRCfdhcUIqepFLShN9wN0H5/8KZMkIFlldsZ2MOyr0o5pQwVuuSruQw0J6G9
         G6BK7MBrkRYVIxctlGpPeZaDDufbrzIPd/Hl2FgbKo608oYoVlEnID0WCXtOeVDgEEcx
         DqQVYKUcOsBkrDdYjqSV8tDHoccFrNrg3+v0Epiv1YwSoMPPTfXiEVUBIw9FWO7QSu1B
         s+kA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eNSAQejS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c23c236066si375927685a.130.2025.02.26.06.48.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Feb 2025 06:48:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eNSAQejS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tnIhn-0000rX-Vy; Wed, 26 Feb 2025 09:48:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1tnIhn-0000rD-3Y
 for qemu-arm@nongnu.org; Wed, 26 Feb 2025 09:48:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1tnIhk-00048M-Sn
 for qemu-arm@nongnu.org; Wed, 26 Feb 2025 09:48:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740581287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8vkoWrSDvFL6bPp2+SBWRgFUy47QB4e69nH0NyHiTjI=;
 b=eNSAQejS8YDpN0HZS2c487yHC/O1DzLsXq2aqPa5fd8npugBUiNiJ6S8+GEOaqaObti22C
 7UKKWYAldTatGfv046RDm0G6Nn4FKjikK4UpYM2v/FsFXlyX+K0UXgFmxn41L7EpeYR+As
 0+5Efl4BkkJpZyGlyvQl4gxN1IBlT1k=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-278-rg7H0-jIPB2rNjesSqRrtQ-1; Wed, 26 Feb 2025 09:48:05 -0500
X-MC-Unique: rg7H0-jIPB2rNjesSqRrtQ-1
X-Mimecast-MFC-AGG-ID: rg7H0-jIPB2rNjesSqRrtQ_1740581284
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-390d5f1e05cso338964f8f.3
 for <qemu-arm@nongnu.org>; Wed, 26 Feb 2025 06:48:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740581284; x=1741186084;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8vkoWrSDvFL6bPp2+SBWRgFUy47QB4e69nH0NyHiTjI=;
 b=qmDwwJyNarL0Bv8dwyMoRAXgBePjw4knhX8o4gaPHPlwVCEVEnO8CdO/cqzUp1HPZJ
 zIPXIlYdlIwR8YK3vhjVNCNjUqpenbEMb5tKq0IU5tQ0IA/GXFdnKAccNXKlxBU0Iy0L
 y5ffyqOvYqW61WX/zI+vQLavQy+xmyd0Yhhin+TuuIClRUfofD+Eet9Wg6oq5kB98TLX
 yBjlYtrFV8uVfmaYiLgZTukR36So+RqL4CjOb62jxUGdYJ6TW6gPeCFoTygMVnqp1dze
 A9F6lEHMecUnIdZzMsCUV+nEQZUd+jo098Oc/gxe/LJNKOOAKhHCv8YcOfB7vEbKN5uH
 fUnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUh7/gDpWq8wdMpC+J/gWhHNsSCUxOipZN4Uj6mEO3rbfJ70Y2WB7MwgEft96kPZpceMGvR75i1Dw==@nongnu.org
X-Gm-Message-State: AOJu0YwiZal9IZV6GDh9j/vtz/IswpXLCXdW9VC9tlMIQSdamwatv6kw
 7PT3vIqOqYtqYFGzrohcu2Tk08Dc11qEu/Vx2WGiQOrrdl6Sdd/a5mL6jUGJbw6dSDZvIq/v8+l
 T+8gS1fVsDa97d5mIz4l+Kody0ToY95yPtjYbmqtRTx2PPpI31A==
X-Gm-Gg: ASbGncuIMLgurAHw/B2hMLU2oIADeyBnOpbdSBo8QCzARslhuguvSOIvc4/Z3OkpjJA
 D0ordWq1vu1lbuHuQXnDscilrUSEdVSsf57+YTHobFeD+HdsIROJfh+G7E0hKYMCZbQgSTu07Hi
 b7rWAH+SmDtwgz38zIdQpucJ0aQpMJKu8YbSufgRRh+z3q6Zl8d3CuA5N5aOaWjfWLFIHA+HC/F
 nhQpW6YV2et9eXTJ2Q2aNbE07wVZF9r/P/cAIZPRb6NPnCgJXZ0xJwbaP3dfybvX9cnLY9v0n98
 q122fim/9pePTrL7UnAkHaKXhEm8tAG8kpzXzggVwLvXNgNEQKFM/XwzHZL5t/M=
X-Received: by 2002:a05:6000:1541:b0:38f:38eb:fcff with SMTP id
 ffacd0b85a97d-390cc60a682mr6467904f8f.29.1740581284325; 
 Wed, 26 Feb 2025 06:48:04 -0800 (PST)
X-Received: by 2002:a05:6000:1541:b0:38f:38eb:fcff with SMTP id
 ffacd0b85a97d-390cc60a682mr6467878f8f.29.1740581283918; 
 Wed, 26 Feb 2025 06:48:03 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390cd8e725dsm5991101f8f.63.2025.02.26.06.48.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 06:48:03 -0800 (PST)
Date: Wed, 26 Feb 2025 15:48:02 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Shiju Jose <shiju.jose@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 02/14] acpi/ghes: add a firmware file with HEST address
Message-ID: <20250226154802.58d865a8@imammedo.users.ipa.redhat.com>
In-Reply-To: <0866291724e8c276c5f7066991ce08250d7857d3.1740148260.git.mchehab+huawei@kernel.org>
References: <cover.1740148260.git.mchehab+huawei@kernel.org>
 <0866291724e8c276c5f7066991ce08250d7857d3.1740148260.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ks0wRJhLAhKrV9z12O1oIqMIMg_baEEb5r5FVQ9W6BE_1740581284
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.44,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
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
X-TUID: iSvmw9pV/+be

On Fri, 21 Feb 2025 15:35:11 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Store HEST table address at GPA, placing its the start of the table at
> hest_addr_le variable.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  hw/acpi/ghes.c         | 22 ++++++++++++++++++++--
>  include/hw/acpi/ghes.h |  7 ++++++-
>  2 files changed, 26 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> index e49a03fdb94e..ba37be9e7022 100644
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
> @@ -341,6 +342,9 @@ void acpi_build_hest(AcpiGhesState *ags, GArray *table_data,
>  {
>      AcpiTable table = { .sig = "HEST", .rev = 1,
>                          .oem_id = oem_id, .oem_table_id = oem_table_id };
> +    uint32_t hest_offset;
> +
> +    hest_offset = table_data->len;
>  
>      build_ghes_error_table(ags, hardware_errors, linker);
>  
> @@ -352,6 +356,17 @@ void acpi_build_hest(AcpiGhesState *ags, GArray *table_data,
>                    ACPI_GHES_NOTIFY_SEA, ACPI_HEST_SRC_ID_SEA);
>  
>      acpi_table_end(linker, &table);
> +
> +    if (ags->use_hest_addr) {
> +        /*
> +         * Tell firmware to write into GPA the address of HEST via fw_cfg,
> +         * once initialized.
> +         */
> +        bios_linker_loader_write_pointer(linker,
> +                                         ACPI_HEST_ADDR_FW_CFG_FILE, 0,
> +                                         sizeof(uint64_t),
> +                                         ACPI_BUILD_TABLE_FILE, hest_offset);
> +    }
>  }
>  
>  void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
> @@ -361,7 +376,10 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
>      fw_cfg_add_file(s, ACPI_HW_ERROR_FW_CFG_FILE, hardware_error->data,
>                      hardware_error->len);
>  
> -    if (!ags->use_hest_addr) {
> +    if (ags->use_hest_addr) {
> +        fw_cfg_add_file_callback(s, ACPI_HEST_ADDR_FW_CFG_FILE, NULL, NULL,
> +            NULL, &(ags->hest_addr_le), sizeof(ags->hest_addr_le), false);
> +    } else {
>          /* Create a read-write fw_cfg file for Address */
>          fw_cfg_add_file_callback(s, ACPI_HW_ERROR_ADDR_FW_CFG_FILE, NULL, NULL,
>              NULL, &(ags->hw_error_le), sizeof(ags->hw_error_le), false);
> @@ -501,7 +519,7 @@ bool acpi_ghes_present(void)
>          return false;
>      }
>      ags = &acpi_ged_state->ghes_state;
> -    if (!ags->hw_error_le)
> +    if (!ags->hw_error_le && !ags->hest_addr_le)
>          return false;
>  
>      return true;
> diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
> index a3d62b96584f..454e97b5341c 100644
> --- a/include/hw/acpi/ghes.h
> +++ b/include/hw/acpi/ghes.h
> @@ -71,9 +71,14 @@ enum {
>   * meaning an offset from the etc/hardware_errors firmware address. This
>   * is the default on QEMU 9.x.
>   *
> - * An offset value equal to zero means that GHES is not present.

> + * When use_hest_addr is true, the stored offset is placed at hest_addr_le,
> + * meaning an offset from theHEST table address from etc/acpi/tables firmware.
                             ^^^^^^ missing whitespace

'offset' language is confusing here, is asks for explanation offset from what?

what is kept in hest_addr_le is GPA of HEST table, it would be better to address
wording here.
The same applies to similar comment in previous patch

> + * This is the default for QEMU 10.x and above.
> + *
> + * If both offset values are equal to zero, it means that GHES is not present
>   */
>  typedef struct AcpiGhesState {
> +    uint64_t hest_addr_le;
>      uint64_t hw_error_le;
>      bool use_hest_addr;         /* Currently, always false */
>  } AcpiGhesState;

