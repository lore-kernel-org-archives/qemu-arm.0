Received: by 2002:a17:504:d692:b0:1be9:327d:8ee3 with SMTP id na18csp341924njb;
        Wed, 4 Dec 2024 08:42:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXV78n6teQMxQ7Qfx8YaZQVMK0pXRjTMqEE3C9u2I2U+efmFoOYhHSsqOLCK/mTKSPtbjGeULwAUe0upg==@linaro.org
X-Google-Smtp-Source: AGHT+IExXxSgNDpAJCfCQJdIVJuOu3zRZwsdHPxqkVCBUFUB5mP7sKHfh0+NSwXrphMLIAiBFBpc
X-Received: by 2002:a05:620a:2409:b0:7b6:6e7c:8f00 with SMTP id af79cd13be357-7b6a619adc3mr853651085a.36.1733330569623;
        Wed, 04 Dec 2024 08:42:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733330569; cv=none;
        d=google.com; s=arc-20240605;
        b=lTJzllz2CeEKeP+XoelUYwv2dJR94LHlPEB3Ej2iCi2jFP1YiVRgDsR3p6tyVxY1GE
         GXK32r/xgM83mPqF8YHyx4kkbjuWRHaReWt1CgLfi7xVaO2i+xv0RxTQ5PP7grvLBV1p
         H2nXvENHHwB/KWqiPxxgqM86Ml7/s4Q/1zHRw00sK1VTuUTrC3vEBoN+LCs1zsadgPmx
         fWDfP4C1r3TNVeXiU/cYXwxUOEK3bQPGp/7GmyBPbnIHfydh9nh8ByPHGnnlf9lkVvIl
         lhUyH+geCxGxKkhN3h7UczjX360JWp5rNDVz/MNtCpbtvIvk8MSj57+AeoljWSlKn98O
         a8xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=aTboGuxBsv1/D7jYDtP1EAK+nV/89N3aSEIGaAgBjps=;
        fh=FbGPB6baxl35THH6lIxLzFSKd1pP3UHm68mKwH0PG1M=;
        b=FwtFded1KZw29WVl1WgU5RRfSm6wBqGEh1CNz0ospeKPKBgMG+SKmToiiDftlvziMP
         AMjQzrpSDtfPxeOB+BdV43mKtjjQfKAx87T3OUAtANccSgp6o0V9B2MMIHzbWWZzcRqb
         O3Q16pkJKiHd2m5iUe5F39aUwmm2cPrcl70ISz0OG+BExLXkGovORKr26b0Iw909hFhe
         /3Z0KvqpHsLugrSNY8bERi9CXNpV7zZGz1i4uh/KqA0rPBn75VC0EPMOJ5dwLE+I4Vd5
         3yCN68E6eu/yXsQVL+Z5GNR6NQI76VavBJ9ONulyUVmO2KBB0ZVQnyNbRQLt48ZDIQOP
         YrZA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="K/XRXq1C";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6849db237si1761737185a.540.2024.12.04.08.42.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Dec 2024 08:42:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="K/XRXq1C";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tIsSN-0004sJ-6y; Wed, 04 Dec 2024 11:42:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1tIsSG-0004rU-7k
 for qemu-arm@nongnu.org; Wed, 04 Dec 2024 11:42:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1tIsSA-00051H-NG
 for qemu-arm@nongnu.org; Wed, 04 Dec 2024 11:42:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733330536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aTboGuxBsv1/D7jYDtP1EAK+nV/89N3aSEIGaAgBjps=;
 b=K/XRXq1CEW7VoqhFknXXzL5h7ow1yTOsw9q47I5xrmO1vZj9dsWcvJZes1F8EwT++219At
 Ox5m98ntQl3HfqF1Jw+NuzKVvLanASCt15rsWYIfMBpCagz9tk53wuOvy5ekiDxmmQByIB
 0yspIOkYe1x+SWgzfUlnr8kYQF44qT4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-395-1i3i552AN2ez240T-pBBvQ-1; Wed, 04 Dec 2024 11:42:15 -0500
X-MC-Unique: 1i3i552AN2ez240T-pBBvQ-1
X-Mimecast-MFC-AGG-ID: 1i3i552AN2ez240T-pBBvQ
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4349c5e58a3so57465565e9.2
 for <qemu-arm@nongnu.org>; Wed, 04 Dec 2024 08:42:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733330534; x=1733935334;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aTboGuxBsv1/D7jYDtP1EAK+nV/89N3aSEIGaAgBjps=;
 b=ePNhhAEDw3jAIwO4OilgWtKqk5AjQWpvUCo9uXRoK7UeT2ks62dGgqpDcxRIqV44US
 TdhWWdyqFFy8KTUzZb9dO4ll6DMUlNNlr9A7HMMxG4dYbIuDO3lRvXQxo8hQzCSLul7Z
 Qfb4hA9u0pSmddx+f3m103nb5Jb/3fpLLHolDJUjifBEFvh78rQsABQcLTG8I4+DuuUY
 EWj6xSx6xlwICZ9git80i7sYhvllFIOKO0Ir0N7A9uX8j10M32BbXHViPNLTHqktQGLs
 pxCpgXaKWG2ZSZK5RJf2ZmD4tNM7GDCUivGskDDKaXDpTgM5U4lU9qRIGf2zA1+EAw/+
 R9GA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkDHC08lbvDun9hLHnoaX51lb+G7BMPtFqk6d2tGSGDYkE2a2ZnE5fBw6sAknUie4DsGyDXlZYkw==@nongnu.org
X-Gm-Message-State: AOJu0Yy6ERXifLlWPj7H7lw+xzWcqWvoCYoGHGbXQ4XZprUlVwSBV60m
 A4wqBn9seFNz7QUKmW/a0XwFSSwYT6Gfrp2HpFn0Uayn01Qv0smwKJYBt66BzxgbSN8IhbWRv/7
 N+qY0MNuOGoWW+8+uSJpBsCKb9YywijaZtC6Kde3CoX87fuItDQ==
X-Gm-Gg: ASbGnctVAvdVI4gXS1wM5OdLv33rUX7xbQG6FZsIgnNreQ96tI/U4zV+4UVWOLHuLSj
 N/bf0mKM7xFv1bujS+IP92zEfeF6K82BhiRXUkqg4WcBHmKiOdibsF1HIJ69hJo4LPHzpGC6jPm
 Lm/ClAL7Eh7deVXtRdqD8A8WgN/H07WRukaTPRlaKVBqGaxW0mvklpMu2Oz2+/Sa00BfmoYC0HS
 mDxwa1p+tsogvyj4XcKt4o9yb7AVOwoY+g4r5e0EysYeE5pYTKZeFPP85e1msrnTGNuJOaONN4h
 Ax8t7DNhJJw32hF1ELPERQ==
X-Received: by 2002:a05:600c:3c9b:b0:434:a706:c0f0 with SMTP id
 5b1f17b1804b1-434d09b5fbdmr65866605e9.14.1733330534037; 
 Wed, 04 Dec 2024 08:42:14 -0800 (PST)
X-Received: by 2002:a05:600c:3c9b:b0:434:a706:c0f0 with SMTP id
 5b1f17b1804b1-434d09b5fbdmr65866395e9.14.1733330533682; 
 Wed, 04 Dec 2024 08:42:13 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434d52cbd5asm29512655e9.40.2024.12.04.08.42.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2024 08:42:13 -0800 (PST)
Date: Wed, 4 Dec 2024 17:42:12 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Shiju Jose
 <shiju.jose@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 linux-kernel@vger.kernel.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v5 14/16] acpi/ghes: move offset calculus to a separate
 function
Message-ID: <20241204174212.4c6558aa@imammedo.users.ipa.redhat.com>
In-Reply-To: <5a2bda4722e2d45839a75f3a193f6b8f4841c773.1733297707.git.mchehab+huawei@kernel.org>
References: <cover.1733297707.git.mchehab+huawei@kernel.org>
 <5a2bda4722e2d45839a75f3a193f6b8f4841c773.1733297707.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DnXV5u1HWp5uPzQuPad8qKIjf3fLSYjM3vxuff1mBWM_1733330534
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-TUID: /3EcUl2g6V8+

On Wed,  4 Dec 2024 08:41:22 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Currently, CPER address location is calculated as an offset of
> the hardware_errors table. It is also badly named, as the
> offset actually used is the address where the CPER data starts,
> and not the beginning of the error source.
> 
> Move the logic which calculates such offset to a separate
> function, in preparation for a patch that will be changing the
> logic to calculate it from the HEST table.
> 
> While here, properly name the variable which stores the cper
> address.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/acpi/ghes.c | 40 +++++++++++++++++++++++++++++++---------
>  1 file changed, 31 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> index 90d76b9c2d8c..a4453ee357bc 100644
> --- a/hw/acpi/ghes.c
> +++ b/hw/acpi/ghes.c
> @@ -364,10 +364,37 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
>      ags->present = true;
>  }
>  
> +static void get_hw_error_offsets(uint64_t ghes_addr,
> +                                 uint64_t *cper_addr,
> +                                 uint64_t *read_ack_register_addr)
> +{
> +    if (!ghes_addr) {
> +        return;
> +    }
> +
> +    /*
> +     * non-HEST version supports only one source, so no need to change
> +     * the start offset based on the source ID. Also, we can't validate
> +     * the source ID, as it is stored inside the HEST table.
> +     */
> +
> +    cpu_physical_memory_read(ghes_addr, cper_addr,
> +                             sizeof(*cper_addr));
> +
> +    *cper_addr = le64_to_cpu(*cper_addr);
> +
> +    /*
> +     * As the current version supports only one source, the ack offset is
> +     * just sizeof(uint64_t).
> +     */
> +    *read_ack_register_addr = ghes_addr +
> +			      ACPI_GHES_ERROR_SOURCE_COUNT * sizeof(uint64_t);
> +}
> +
>  void ghes_record_cper_errors(const void *cper, size_t len,
>                               uint16_t source_id, Error **errp)
>  {
> -    uint64_t error_block_addr, read_ack_register_addr, read_ack_register = 0;
> +    uint64_t cper_addr = 0, read_ack_register_addr = 0, read_ack_register;
>      uint64_t start_addr;
>      AcpiGedState *acpi_ged_state;
>      AcpiGhesState *ags;
> @@ -389,18 +416,13 @@ void ghes_record_cper_errors(const void *cper, size_t len,
>  
>      start_addr += source_id * sizeof(uint64_t);
>  
> -    cpu_physical_memory_read(start_addr, &error_block_addr,
> -                             sizeof(error_block_addr));
> +    get_hw_error_offsets(start_addr, &cper_addr, &read_ack_register_addr);
>  
> -    error_block_addr = le64_to_cpu(error_block_addr);
> -    if (!error_block_addr) {
> +    if (!cper_addr) {
>          error_setg(errp, "can not find Generic Error Status Block");
>          return;
>      }
>  
> -    read_ack_register_addr = start_addr +
> -                             ACPI_GHES_ERROR_SOURCE_COUNT * sizeof(uint64_t);
> -
>      cpu_physical_memory_read(read_ack_register_addr,
>                               &read_ack_register, sizeof(read_ack_register));
>  
> @@ -421,7 +443,7 @@ void ghes_record_cper_errors(const void *cper, size_t len,
>          &read_ack_register, sizeof(uint64_t));
>  
>      /* Write the generic error data entry into guest memory */
> -    cpu_physical_memory_write(error_block_addr, cper, len);
> +    cpu_physical_memory_write(cper_addr, cper, len);
>  
>      return;
>  }

