Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp3614734njk;
        Tue, 3 Dec 2024 03:53:29 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVIylk8RoKIJuG94COKg4AdNZxhfn4AkNapqzn/DEjJqFWGFbz/CTRbVPyiVeHrFyG36ItPwJ/bFrxB5g==@linaro.org
X-Google-Smtp-Source: AGHT+IFa976oV+XrFd1b7xt4e0uOfRMmBeB8y1goHNm+EIaF2iH2rLOP90731FQ88Jbh4olnFHwZ
X-Received: by 2002:ad4:5aee:0:b0:6d8:8f3d:4d82 with SMTP id 6a1803df08f44-6d8b740ef3emr26842146d6.46.1733226808969;
        Tue, 03 Dec 2024 03:53:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733226808; cv=none;
        d=google.com; s=arc-20240605;
        b=NDaLzWYyaJE6NdIymh47+aQP/dX/4HFJgGO0UEjwlBD7ADoyWbwyfCKiwbOSQS61NY
         /hNR2qkiFSkcKPFkOtIKJAI0tU5STF32dUdfaBduwg1SGDUshf4xDfJ7tXPWL+mNPMGv
         blDvUgp5lfJRMDELRFWMYpAy7vQnVXxSEZ1dMGRe/6HYnTETGQbMGelJpTpIbZazS41b
         0j6o1x0YDOzSrgZNm1lcTHuuawrCTVXRVviWDFSgzZXTOCBTF4O6JMAizDVpbkhP7BaH
         XH60E4Vw36o1NWmMLkMokNI+ycbAo3sIivnh66jCDlYN/ZkDGQO+aVmTU++LYYQfuDug
         DWoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=if0eS42ic4FtOI54nNA13X1+b8OGQFDK6o4TLYIRToo=;
        fh=w2gV8+5PRhEt9x+3EAnklktjBrV2K0tClmjCb4fErjU=;
        b=ABY4Dc9wAgn/JaJcRuC168IEWbF8UiP+x32HD4lhZz/sYxBsNxaq8/d/3hD1m5cAye
         BICg6e2yaQHYOvQKBVMTwujHPho0yKpst2cdIZC1MlVyNd9uPHhlXMc2rWUI+Bwp6Ykf
         et4Pg1+NvasRV8zRal9i4mpw59FSyeSupyuPHZaNHjzBhQeaYagYkFK1KnCJJfvIiiDc
         oHBgGpcTG8fdsKUoQQzdXfYB3QXmRg4yeUXa8txlt3K/FyfIBxq+R6ymJXW9Nik+gSbP
         N4Wq3gZmDjdsw4/hi9+SRcYeLHVyb4Urs7OBFDWpKgZYiLJ7Orz8126w9Sh5EMYmUNlu
         GlYQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=STZ2qN2t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d8751aafe3si155443656d6.78.2024.12.03.03.53.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Dec 2024 03:53:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=STZ2qN2t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tIRSe-00053l-6k; Tue, 03 Dec 2024 06:53:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1tIRSd-00053V-Cp
 for qemu-arm@nongnu.org; Tue, 03 Dec 2024 06:52:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1tIRSb-0002ih-Sy
 for qemu-arm@nongnu.org; Tue, 03 Dec 2024 06:52:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733226777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=if0eS42ic4FtOI54nNA13X1+b8OGQFDK6o4TLYIRToo=;
 b=STZ2qN2tahBEJ/OXnAYJH/3YMGqE70EGmpy0e1XUmjdB35SHa6iNx9LMCUP30Kc7hAuwQo
 hWGwkQxL0U7BSWwf//3VRm6R9Q+GSJv/N0ZUfGc3LfpOdwEi/L6SCDzxWZeb5VD4O3ZgC0
 l/mJhc1T8PPTJd1URtHBs/q/o2FRkyw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-216-C0QfgkGsMa-BRFlCJIcsgg-1; Tue, 03 Dec 2024 06:52:56 -0500
X-MC-Unique: C0QfgkGsMa-BRFlCJIcsgg-1
X-Mimecast-MFC-AGG-ID: C0QfgkGsMa-BRFlCJIcsgg
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-434a0d30c06so32529695e9.1
 for <qemu-arm@nongnu.org>; Tue, 03 Dec 2024 03:52:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733226775; x=1733831575;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=if0eS42ic4FtOI54nNA13X1+b8OGQFDK6o4TLYIRToo=;
 b=lan7AvEElInOmAfpsWv4PABcN7QgePHsLILO7vgnX1FEFVLtAXLnWnTvedLMZ160TA
 JU9ekbKRiW0haNb1gJ48ezWdF3nsTN4KjO1sLzbZ/XYSbSIiKngf0unldiUbYnTRmNSQ
 gLHJSd5Bn2Q36S6ZzdXqLcNH8bzXyZzbKX2baTs338Ps0fM8vD4iDEAx+WLfFP0wBjM2
 v/X/RF2RmBaeYfy02y8k14BG7/5IxRUeA/X9yMclej//R12pqCc3aeyjkyuUmw8LVarn
 vbuMVGw2nWm/1Y612df5/ztniDEj7/w6tL4tERNs4J2R0Cn3V5ivXljphH8L+ERkR4i6
 +V9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7ccbttFtJAHssbL+zWcOUVQkrqRj+pKCuzxan7DxD0aUPOho4FhZel5geG+c5g+9mGnLFf/CxTQ==@nongnu.org
X-Gm-Message-State: AOJu0YwSxIxKPNNGdywYNXjdr+Nlr8qZQPKvfK2PsvJ+GFc87/E0r5Bb
 o/u2IMls+X8LIMEMOEZkB5MxW0X3KmVLH6PozyxSeZW9ubVjn/gafezMpoSubwkGaJbd0Hk0Nhq
 mtELYPNewK+Km1KOuKyqODpk8r/IC2ZreLq0msvJuwVQI7OJ+uQ==
X-Gm-Gg: ASbGnctg/x2NC5U0IdaP6JPonZf4Ox5dQ3mNUqVY5dDmLWBBUG1TUZ26mYwim+R8CUs
 +mDtlZVWpfbXZuCR0tB3vNQ5qfnyqQsKffPkLtrz8k59kNAflvuzx4AoAG2X3/rBxi5Me+RpxBp
 IPoq7kNElQkOiwBBCwoHSnxkcVzMBKpfhVlGllkwwmBQFvuUJI+kuHTiDAaNb7B4ceqUPcYzubU
 eJBEtonYiwjBVZmw5g+TkPM1aHpKuycUZz7Gq8hVDmE+q5nuFdXB9SYmVMBO75Kgfrq9C6uHVc0
 LZ89i3+Hk1nwgf2KIpnP5g==
X-Received: by 2002:a05:600c:198e:b0:434:9cf6:a2a5 with SMTP id
 5b1f17b1804b1-434afb9ecc7mr192833235e9.8.1733226774922; 
 Tue, 03 Dec 2024 03:52:54 -0800 (PST)
X-Received: by 2002:a05:600c:198e:b0:434:9cf6:a2a5 with SMTP id
 5b1f17b1804b1-434afb9ecc7mr192833055e9.8.1733226774600; 
 Tue, 03 Dec 2024 03:52:54 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434aa7804fbsm223249265e9.21.2024.12.03.03.52.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2024 03:52:54 -0800 (PST)
Date: Tue, 3 Dec 2024 12:52:53 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Shiju Jose
 <shiju.jose@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 linux-kernel@vger.kernel.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v4 14/15] acpi/ghes: Change ghes fill logic to work with
 only one source
Message-ID: <20241203125253.5a11194b@imammedo.users.ipa.redhat.com>
In-Reply-To: <cf16e0900e10c5a39e11b590f5267a4b9c228060.1732266152.git.mchehab+huawei@kernel.org>
References: <cover.1732266152.git.mchehab+huawei@kernel.org>
 <cf16e0900e10c5a39e11b590f5267a4b9c228060.1732266152.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JZvJZqqCEZ0z-npHi3ZA5BMxp1mQ-6LOSiafusLW5SI_1733226775
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: oLT+m1Xb8Kk3

On Fri, 22 Nov 2024 10:11:31 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Extending to multiple sources require a BIOS pointer to the
> beginning of the HEST table, which in turn requires a backward-compatible
> code.
> 
> So, the current code supports only one source. Ensure that and simplify
> the code.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/acpi/ghes.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> index d99697b20164..b0b1865dc8d3 100644
> --- a/hw/acpi/ghes.c
> +++ b/hw/acpi/ghes.c
> @@ -387,15 +387,13 @@ static void get_hw_error_offsets(uint64_t ghes_addr,
>       * As the current version supports only one source, the ack offset is
>       * just sizeof(uint64_t).
>       */
> -    *read_ack_register_addr = ghes_addr +
> -			      ACPI_GHES_ERROR_SOURCE_COUNT * sizeof(uint64_t);
> +    *read_ack_register_addr = ghes_addr + sizeof(uint64_t);
>  }
>  
>  void ghes_record_cper_errors(const void *cper, size_t len,
>                               uint16_t source_id, Error **errp)
>  {
>      uint64_t cper_addr = 0, read_ack_register_addr = 0, read_ack_register;
> -    uint64_t start_addr;
>      AcpiGedState *acpi_ged_state;
>      AcpiGhesState *ags;
>  
> @@ -412,11 +410,9 @@ void ghes_record_cper_errors(const void *cper, size_t len,
>      }
>      ags = &acpi_ged_state->ghes_state;
>  
> -    start_addr = le64_to_cpu(ags->hw_error_le);
> -
> -    start_addr += source_id * sizeof(uint64_t);
> -
> -    get_hw_error_offsets(start_addr, &cper_addr, &read_ack_register_addr);
> +    assert(ACPI_GHES_ERROR_SOURCE_COUNT == 1);
> +    get_hw_error_offsets(le64_to_cpu(ags->hw_error_le),
> +                         &cper_addr, &read_ack_register_addr);
>  
>      cper_addr = le64_to_cpu(cper_addr);
>      if (!cper_addr) {

