Received: by 2002:a17:504:959a:b0:1be9:327d:8ee3 with SMTP id e26csp779567njl;
        Wed, 2 Oct 2024 05:28:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXcHi0YrR7LszvRxOxb2RdanaoP/RrZDY6OXOpnf05yF3+u0dEIQYqASIHWdK04Oph/1rFpzucssFsMjg==@linaro.org
X-Google-Smtp-Source: AGHT+IGsWvFJXHpNIy2t/4I9Y4hd5g5QlPNeiN3+zq8VDtt2MrJARIGWZfvftt5Gu7sdoco58XSW
X-Received: by 2002:a05:6214:5683:b0:6c5:bc40:9bdb with SMTP id 6a1803df08f44-6cb819f5fbamr45476406d6.22.1727872116956;
        Wed, 02 Oct 2024 05:28:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727872116; cv=none;
        d=google.com; s=arc-20240605;
        b=k8u1hom+ezyPbrMbN4S0wEWyBm+sVrEImgcFPmhHKzHIRmgck4qpOhjsrTCSR/Tt9j
         aIluSsWTbJPy4z8QlggIshPWS3GFK9OUSAg2dBXm/Va0XOWokypEzXh7Wc8KfR6fpKzf
         RYhgmUyrNLGF/6IXtR08i+3oIlZ98lFpqbnZQXfDhn7DxlypTyPAJyjW5VxcVl/N2Vxe
         mQ2qTw9h5VJ0hNMDFV6LX9XYlA5CIPJXoDnbFyJkEsva9FSkNn9DGYQotTM7gcu+nwCT
         VhdimiLQN108TgPRp93i1suyf1ZRa6agKOJy6JIJYeEYFK1+OfyPVYZ6a/OApDZYg0ip
         Kacw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=zy/ZYXezD/7SwVnrR76iPCG2vx+uv4epmVmeCMiNdC0=;
        fh=ZEa0Uw9Oc9wnIj+ha8TFpblLFdCPn/7JpTvJGFuzFxw=;
        b=hD4bVVGvJPY4ZQ4D1VKS10nxx6MBqC4mTlGBEF81qChvh2RcSHwx6qQlxO4l0/P30L
         xkATeeCmgjK4Du7laDK6jjExNEyy+e8LpLVudvmF/0si3NqcHOevKisKwX+0198jMIrW
         7v1TuJR5LjEaUQWybhOjjZgYyCrSGJUTUoY9rFt9WNZBYduiLbAKPX6W9cWDuvKlY/6G
         eLkqI/mESXtP75uRrkX28+KnMD0Zay24Sarv0rCOxQZbfE8jxMN15x1hTITGfka4gGJ+
         ybrhlUaL/fnED+MO+BZPz+vp+3+VagHze6HWrUXmPBo9PSgZ6oO1SAz7TVDXxHTGRr5l
         CdIw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EvjrdBnS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cb3b602de9si132296506d6.58.2024.10.02.05.28.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Oct 2024 05:28:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EvjrdBnS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1svySa-0007kN-St; Wed, 02 Oct 2024 08:28:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1svySZ-0007k1-Ll
 for qemu-arm@nongnu.org; Wed, 02 Oct 2024 08:28:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1svySW-0008JK-KU
 for qemu-arm@nongnu.org; Wed, 02 Oct 2024 08:28:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1727872078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zy/ZYXezD/7SwVnrR76iPCG2vx+uv4epmVmeCMiNdC0=;
 b=EvjrdBnSh7x6Wzc/RP6jE8rJ7Fe+SUnQL9tXzd9T7uAH8E22sCvO0QlvTlv0uGCVxUot7l
 Xu0FbDiYRW+mWbgj0z/ERP3AHyTGFp3yhgXp+bHhB9/JnCEtmrUjz7lBugcp0eaFd+2GxG
 BQZfbsz0i31kmwObN69NdGcXvTLSzJE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-mtasYCtsPEONHVqVmPIwuA-1; Wed, 02 Oct 2024 08:27:57 -0400
X-MC-Unique: mtasYCtsPEONHVqVmPIwuA-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-37cd1fb9497so417262f8f.1
 for <qemu-arm@nongnu.org>; Wed, 02 Oct 2024 05:27:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727872076; x=1728476876;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zy/ZYXezD/7SwVnrR76iPCG2vx+uv4epmVmeCMiNdC0=;
 b=F61NoqTNzw/5wLTJ1G1akfACU/0oSSNRsqtP0BYyFtqC9k4MfexPfEfgeyMZnC+G+k
 RD4UIZtocNdyOYSC3pFmYwAxrPII0ZE6O1QI1zgaF3LIgYgSAIsYb6Lpg6T0GNlEylPf
 pu8T5jt/aFaax/Ej4CCefS6GAqQKvUy4KSLF6Hu1BEpSWIN4/IleDyHbp8HJ4IHjjwwt
 ++xsyiqU4bts+hu9W11ALFnzuWQw7J5Vl/YnL9EwcgMS1Saq1yIPCiPwu0clrLXPacyg
 8gvPW8cSeuVbT5fokD9Ejys91bNYLHtFDNmVJ8BY8YBk4ywFyKPXB/OQ6mE6OssQdg2Z
 M8fA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQ1YuSwhSJHs4r49w00zBSJQO1bnOMeHnvQMJUO79DaAxbOZdep4WQTJ4azFnVBn3AysN8IB1nVw==@nongnu.org
X-Gm-Message-State: AOJu0YwOcx93rhAha7dbB/zSrXATnGazsFmc1HBgmP91aUKWQe6m2I6M
 IMfijwn6xJ3SnqmF6dWLYygkcn66CcZ2pfBHOy3z5IvrVaZH7z961+2SJCS63cevqj4MUP65wp0
 EDhAJfied4uaGx1RjmZRZaq3Ws6mUrIc1exMVFzTpeYSfDQKQtw==
X-Received: by 2002:a5d:6049:0:b0:374:cd3c:db6d with SMTP id
 ffacd0b85a97d-37cf289c5damr4197393f8f.6.1727872076194; 
 Wed, 02 Oct 2024 05:27:56 -0700 (PDT)
X-Received: by 2002:a5d:6049:0:b0:374:cd3c:db6d with SMTP id
 ffacd0b85a97d-37cf289c5damr4197374f8f.6.1727872075824; 
 Wed, 02 Oct 2024 05:27:55 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42f7a02ef4bsm17283085e9.47.2024.10.02.05.27.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2024 05:27:55 -0700 (PDT)
Date: Wed, 2 Oct 2024 14:27:54 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Dongjiu Geng <gengdongjiu1@gmail.com>, linux-kernel@vger.kernel.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v2 07/15] acpi/ghes: Change the type for source_id
Message-ID: <20241002142754.086a2cd8@imammedo.users.ipa.redhat.com>
In-Reply-To: <4149830f15bcad19f6e32981754d437493f3aeba.1727766088.git.mchehab+huawei@kernel.org>
References: <cover.1727766088.git.mchehab+huawei@kernel.org>
 <4149830f15bcad19f6e32981754d437493f3aeba.1727766088.git.mchehab+huawei@kernel.org>
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
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.144,
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
X-TUID: 1UPNZRm24Jg2

On Tue,  1 Oct 2024 09:03:44 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> HEST source ID is actually a 16-bit value

add here spec/ver/chapter/table reference as a confirmation
of above statement.

> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>  hw/acpi/ghes-stub.c    | 2 +-
>  hw/acpi/ghes.c         | 2 +-
>  include/hw/acpi/ghes.h | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/acpi/ghes-stub.c b/hw/acpi/ghes-stub.c
> index c315de1802d6..2b64cbd2819a 100644
> --- a/hw/acpi/ghes-stub.c
> +++ b/hw/acpi/ghes-stub.c
> @@ -11,7 +11,7 @@
>  #include "qemu/osdep.h"
>  #include "hw/acpi/ghes.h"
>  
> -int acpi_ghes_record_errors(uint8_t source_id, uint64_t physical_address)
> +int acpi_ghes_record_errors(uint16_t source_id, uint64_t physical_address)
>  {
>      return -1;
>  }
> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> index 5f67322bf0f2..edc74c38bf8a 100644
> --- a/hw/acpi/ghes.c
> +++ b/hw/acpi/ghes.c
> @@ -383,7 +383,7 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
>      ags->present = true;
>  }
>  
> -int acpi_ghes_record_errors(uint8_t source_id, uint64_t physical_address)
> +int acpi_ghes_record_errors(uint16_t source_id, uint64_t physical_address)
>  {
>      uint64_t error_block_addr, read_ack_register_addr, read_ack_register = 0;
>      uint64_t start_addr;
> diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
> index 50e3a25ea384..9295e46be25e 100644
> --- a/include/hw/acpi/ghes.h
> +++ b/include/hw/acpi/ghes.h
> @@ -73,7 +73,7 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
>                       const char *oem_id, const char *oem_table_id);
>  void acpi_ghes_add_fw_cfg(AcpiGhesState *vms, FWCfgState *s,
>                            GArray *hardware_errors);
> -int acpi_ghes_record_errors(uint8_t source_id, uint64_t error_physical_addr);
> +int acpi_ghes_record_errors(uint16_t source_id, uint64_t error_physical_addr);
>  
>  /**
>   * acpi_ghes_present: Report whether ACPI GHES table is present


