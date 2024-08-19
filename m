Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp2058526njf;
        Mon, 19 Aug 2024 05:57:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUFo20PYQ+71j0QRxoAHQdfwPe4VbP520cNTzsOFjQ8UDpi/T17ePyMEV5Z1merAyFVHVzmScmYYYJnXOSbhMkRjNaHGa11
X-Google-Smtp-Source: AGHT+IFTsPyM4ghTa9BUgkE1SBg8xvpEE0gLOwgWQ6ptiUXWwYIAv7m1jUB1J8HPDTmRF6pONudp
X-Received: by 2002:a05:690c:5887:b0:632:c690:d991 with SMTP id 00721157ae682-6b452d81a8amr59602397b3.29.1724072271572;
        Mon, 19 Aug 2024 05:57:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724072271; cv=none;
        d=google.com; s=arc-20160816;
        b=OcayMHUufQiL7C6JcnpmO5B8i+zR3M5HCeLv7bOTeY0/qbShZewmQYq+A3C1JxzMOZ
         G6y09TD1RxaqFG4HrTL8zMadmkzmsmpHJ6sak2JmVOeoUJZ1dNb6Z7MqCeWAPmJs4Alq
         M6WmLvdn31MC8wcDHLpCitKz0fyDsMkxfVbxENFiTgt90KBDeBD1Xqz33AgXyZi0T1rD
         5vZiaaEexl7ohQReKQKzUyKq198Ezv8EGoVLoj1SLTxWPcnQsbUwcID/fBYUxQDktmkJ
         W/lvFCZdYsMuuT3n5zOSRp/93+u0aaa3t3CMib7AcEyrO/3Rx8QLvjyp2435gnRVbE2z
         VxBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=bQq04umgaGGIU/uyNF6ouiRkFMTZ4eoaEDjVqBV4xoQ=;
        fh=Tt797El9jFAcBoTaa7SpBE5Hky2z9SSooDZ6eje9x1U=;
        b=ewoIcYuCcgP4VC3uyqWIeeDP6OdFYnQK6SQDXYbK0nitjJVO0BM1C7E1uk5P5zQhZQ
         ioYCcSVmbXvV2EGXqMAf8lrfOnfUaHyxecgZpGkBMfrJqt6Ng4iyaIE8uBUCkNUoktJl
         aSle9ZO3H9/GuaDt5Sm7zX025a+0B9hqiN5G5Beay1eJavmtNWqp8XXuPC0Gjc8Xnj1h
         o3k9FRuT3N5stiVuHf1mjinIePgUiwqiMPqCvd/Rl2qSW2RXAn4YKWhGFfQ6Y9qv6XXQ
         UXmpDCSLpgyBPQOhvKJJAkghytBTzq1BgfHeZECOtZfYykh8zbysEJ4XdPb/4vK56uag
         /GbA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=L+HdzufI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a4ff03567bsi1022620685a.198.2024.08.19.05.57.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Aug 2024 05:57:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=L+HdzufI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sg1xC-0002pY-M1; Mon, 19 Aug 2024 08:57:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sg1x8-0002oV-N3
 for qemu-arm@nongnu.org; Mon, 19 Aug 2024 08:57:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sg1x6-0005Gh-Vo
 for qemu-arm@nongnu.org; Mon, 19 Aug 2024 08:57:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724072259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bQq04umgaGGIU/uyNF6ouiRkFMTZ4eoaEDjVqBV4xoQ=;
 b=L+HdzufIZx3ptFtlVd/+jsYjfLa9AFMLC4kRpF/Cw+6XOIJA4yRhpBXG4Yf2s5tAX+tnkj
 B0tc2bM9SudAsJzl6ULSxl0wglPsccVke0Et7bM3S/+ce0tGj5+WIUlimB/wx0cdp5g3Gl
 /s9hw9Jpr1ZCRGoG8Qv6Jx5bPpoL+2I=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-177-wRNGsX9APe6DFlViGRhxsg-1; Mon, 19 Aug 2024 08:57:37 -0400
X-MC-Unique: wRNGsX9APe6DFlViGRhxsg-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3718c9cd84fso2013806f8f.1
 for <qemu-arm@nongnu.org>; Mon, 19 Aug 2024 05:57:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724072256; x=1724677056;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bQq04umgaGGIU/uyNF6ouiRkFMTZ4eoaEDjVqBV4xoQ=;
 b=J+lGbJE9e7+vF1AlNYq4VjEjQB+N1+s7s+UdQesFrQWAGVZeTKsAVCSWhRxrtcqQGl
 7zxLulIA2YkBRlo/IiQcR1ZBtzdvU495LnMlLDlLxQgvDNGeb0IBAYvEVgUTF7GDTNfh
 e7Av7mS61SS1t7dicUSuhc/TLB9gVfcDg6QBcPNtg/vwSK6rTXoiWT56nZ7gVmd1777f
 cofAfHfZMCYVplvntD9PA29sG71b4BYzA13aV84vEcrs1lmH1PwRcC3x6nARMh3cy1in
 Y/AgijWv4b9XcGp+sJIh8OyAmdf7iA79dK9l1fWMYj2vTWJ+P/sHlY6i6BOZqfsNXhlb
 FeOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGi5yA6ev8edlR3rdGizNCpucGuEhVxwgCv8eOqhrJYQJSVTLS7LpgbfexHYsxGTDBtWrfGMWUFj1AVzeGZ7LhhW2z
X-Gm-Message-State: AOJu0YxY7cEI79YzLqG9j/PpUqaiyvAsNW9HRJ0xxJuvXxi6XtE3+TNl
 GPzIAuH//aXpBD38PoGlerl2F3cN5ZTk/gxfSc9YDy0kkt8dV3MGu4hs95ZUQkYYAeyukJCCZvT
 VAvyqBYMw4IlXtNlYNjCJdDxtY6ZyIG+3kuZikEiy6dTb+nEv1Q==
X-Received: by 2002:a05:6000:e4e:b0:367:8f29:f7b6 with SMTP id
 ffacd0b85a97d-371946ae685mr7234178f8f.51.1724072256294; 
 Mon, 19 Aug 2024 05:57:36 -0700 (PDT)
X-Received: by 2002:a05:6000:e4e:b0:367:8f29:f7b6 with SMTP id
 ffacd0b85a97d-371946ae685mr7234159f8f.51.1724072255728; 
 Mon, 19 Aug 2024 05:57:35 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3718984c0d0sm10471874f8f.38.2024.08.19.05.57.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2024 05:57:35 -0700 (PDT)
Date: Mon, 19 Aug 2024 14:57:34 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Shiju Jose
 <shiju.jose@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 linux-kernel@vger.kernel.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v8 12/13] acpi/ghes: cleanup generic error data logic
Message-ID: <20240819145734.03977654@imammedo.users.ipa.redhat.com>
In-Reply-To: <d91565e9ac1c59bd2bb22b06256f5fefcb43a973.1723793768.git.mchehab+huawei@kernel.org>
References: <cover.1723793768.git.mchehab+huawei@kernel.org>
 <d91565e9ac1c59bd2bb22b06256f5fefcb43a973.1723793768.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.134,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: KA8CHljCvJYL

On Fri, 16 Aug 2024 09:37:44 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Remove comments that are obvious.
> 
> No functional changes.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
these comments help if you don't have spec side by side with code
to compare. I'd even say such comments are preferable than no comments
when composing an ACPI table.

pls, drop the patch

> ---
>  hw/acpi/ghes.c | 38 +++++++++++++++-----------------------
>  1 file changed, 15 insertions(+), 23 deletions(-)
> 
> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> index 4f7b6c5ad2b6..a822a5eafaa0 100644
> --- a/hw/acpi/ghes.c
> +++ b/hw/acpi/ghes.c
> @@ -130,34 +130,28 @@ static void build_ghes_hw_error_notification(GArray *table, const uint8_t type)
>   * ACPI 6.1: 18.3.2.7.1 Generic Error Data
>   */
>  static void acpi_ghes_generic_error_data(GArray *table,
> -                const uint8_t *section_type, uint32_t error_severity,
> -                uint8_t validation_bits, uint8_t flags,
> -                uint32_t error_data_length, QemuUUID fru_id,
> -                uint64_t time_stamp)
> +                                         const uint8_t *section_type,
> +                                         uint32_t error_severity,
> +                                         uint8_t validation_bits,
> +                                         uint8_t flags,
> +                                         uint32_t error_data_length,
> +                                         QemuUUID fru_id,
> +                                         uint64_t time_stamp)
>  {
>      const uint8_t fru_text[20] = {0};
>  
> -    /* Section Type */
>      g_array_append_vals(table, section_type, 16);
> -
> -    /* Error Severity */
>      build_append_int_noprefix(table, error_severity, 4);
> +
>      /* Revision */
>      build_append_int_noprefix(table, 0x300, 2);
> -    /* Validation Bits */
> +
>      build_append_int_noprefix(table, validation_bits, 1);
> -    /* Flags */
>      build_append_int_noprefix(table, flags, 1);
> -    /* Error Data Length */
>      build_append_int_noprefix(table, error_data_length, 4);
>  
> -    /* FRU Id */
>      g_array_append_vals(table, fru_id.data, ARRAY_SIZE(fru_id.data));
> -
> -    /* FRU Text */
>      g_array_append_vals(table, fru_text, sizeof(fru_text));
> -
> -    /* Timestamp */
>      build_append_int_noprefix(table, time_stamp, 8);
>  }
>  
> @@ -165,19 +159,17 @@ static void acpi_ghes_generic_error_data(GArray *table,
>   * Generic Error Status Block
>   * ACPI 6.1: 18.3.2.7.1 Generic Error Data
>   */
> -static void acpi_ghes_generic_error_status(GArray *table, uint32_t block_status,
> -                uint32_t raw_data_offset, uint32_t raw_data_length,
> -                uint32_t data_length, uint32_t error_severity)
> +static void acpi_ghes_generic_error_status(GArray *table,
> +                                           uint32_t block_status,
> +                                           uint32_t raw_data_offset,
> +                                           uint32_t raw_data_length,
> +                                           uint32_t data_length,
> +                                           uint32_t error_severity)
>  {
> -    /* Block Status */
>      build_append_int_noprefix(table, block_status, 4);
> -    /* Raw Data Offset */
>      build_append_int_noprefix(table, raw_data_offset, 4);
> -    /* Raw Data Length */
>      build_append_int_noprefix(table, raw_data_length, 4);
> -    /* Data Length */
>      build_append_int_noprefix(table, data_length, 4);
> -    /* Error Severity */
>      build_append_int_noprefix(table, error_severity, 4);
>  }
>  

