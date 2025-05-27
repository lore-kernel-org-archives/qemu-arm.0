Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4804591njc;
        Tue, 27 May 2025 06:13:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUgdFA/kcOXblQNCBBct8Uc8KSF5GHsZf+i2SJYBR4S/aca8vX595Oa6lzXRQ1jZTXIijwQAF5uA9tO6g==@linaro.org
X-Google-Smtp-Source: AGHT+IHx4lrH8ZPdEb/+pQQS28gmW+mrn9CY7HCxFozQFn7k1GzQvbF2LI1gFndPaxgX6+vvWTvj
X-Received: by 2002:a05:6830:64c9:b0:72b:7cc8:422 with SMTP id 46e09a7af769-7355d0d346amr8476622a34.20.1748351551419;
        Tue, 27 May 2025 06:12:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748351551; cv=none;
        d=google.com; s=arc-20240605;
        b=h2BhJ4a4mc5bxWv6Ynvx400ySgamZcPHBCTdXZr5GL+N8t7OkNuFSIPUKmKal2T658
         un1UkCPqIZLr4kOdIy798/aGcm1bRmZs+ecNtPU1Ox6h2zWcuLzy/MKrAFCEspA3v1g1
         MKGifGqEht8q+naCVH1N+vatkqxiBPKBqRmKO7muy85Nbz4oS85GZahVDA4o/fSB0ODA
         /iOnQMTHuHQjlUvKjWAMhHgm35qOIPBS1jJ21LbMnYODGYcIv+MTYx1PBAi/cVf20IfU
         4uzBIvFVAuovP71K/HuMuMzJcVK3fELDyZxPfQrbXPmPRefQ144D18HVCjKauK1PnmsK
         WC1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=t0EGlLQOUrnPgaLzPYuuDb8X9EtxgT6a9liNWMqncXU=;
        fh=f7OergXOL9CNG2KayFnd/h4mHHiNSFs7zrCIcAaNjOA=;
        b=KndCadWElr0GlmMxH0A9YNhm01XlcXB8s8PXVmavKoYxmBvjp0DqsF81jlZ9Er3eRN
         3XJLwqNPTtS+I/zs27G+q6pCRnuWx903bair8VVUs+RPfKqkkFqappI2JXh3lGYei3Ia
         cScCY2CAmp3n5H1BpOdK3zzrrFDrKNSIHtLEjRXPDmHW5iXnFbvfRZ9jYvKIv4qFJdyp
         cj+v151rT/2wEYdS7saDxLj+HoooR23/XcsfPd9mwT4Jfd8LM/TLPKL++drkDkcLrFs8
         NYktBPI0pumFmr8gnApnExtUa4jOzYsdTF4M1kLuh1+GOatFPCJq2e2bO9LzUy2PfGQB
         9r0Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=e3QTfRn1;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 46e09a7af769-734f6b6e261si13520475a34.129.2025.05.27.06.12.31
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 06:12:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=e3QTfRn1;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748351550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t0EGlLQOUrnPgaLzPYuuDb8X9EtxgT6a9liNWMqncXU=;
	b=e3QTfRn16SHLZpdvVCMTz5kwMbCA97Jh/cHeXEf+AC0PgjXb23ywhhKe4HxkFE56g2rF7I
	+AU8TEZWI7dxcFe6iUBk7lXz/rUI2ygwFV5B/iHXon15DrwvlljTR7QsqEWYc0KfAbvIKH
	glYd+1TzzTZb+XVnrrKRUP5lXRh+4ZE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-58-jkdP7HqYP_uQDbLbTd2SJA-1; Tue, 27 May 2025 09:12:24 -0400
X-MC-Unique: jkdP7HqYP_uQDbLbTd2SJA-1
X-Mimecast-MFC-AGG-ID: jkdP7HqYP_uQDbLbTd2SJA_1748351542
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-44b1f5b91c1so25659105e9.1
        for <alex.bennee@linaro.org>; Tue, 27 May 2025 06:12:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748351542; x=1748956342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t0EGlLQOUrnPgaLzPYuuDb8X9EtxgT6a9liNWMqncXU=;
        b=m/IwezB8RhV5gZC8Ragd1XM8cD6XOwrmct3ypeRJN6MYk38OFMAV02TMYzNZefTkOq
         Nsa6MZqifwx0wURSjPQ+5k0aDoTI4K+bNFbym8YdEJKanA1XtI9Ji90FRvrTri/es5Bc
         Ti+4WjL46h9Ykf5+CttT3xuCg990Y1rCVzf4Ja/6IXkgQzsSxHFlUTD9rxCBcKK2Rqm4
         AFHfpKrQcH04GOQ6LSiuSUrbJLaNgLevyFFdHAEhFrcf8W9ORi0gxXwZSD7bSfrXE3bI
         AWBqGpHKhkMmyFRmreba3gEjvJSI/RMVGVN7ECFL6D6xkLDQnH5TK9uFz73wLOMMhaKX
         qGaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvyRO9wNIJuF5fYVNyZWOyOh09qpL4fJi7+yclpdM53jN9yckXwIhjNC6XpNiyEsyKIdaXnBb43qcNMg==@linaro.org
X-Gm-Message-State: AOJu0Yz9B9nDnYl49hCuxaG+5ksyMDRb3BwEjeaaycbYfrq8jh5Ax0qe
	UYtUq1XJuny5C0xHIm63gwAurRu17yYJ1dJvlvfRZUCElp5C428iEcsPk04ayB7U4gsLc/IzYby
	bv43PceCEBK3BgccUWP29g9ADfAPS9ESB+bRWPLMn97k9mIKpljRzHtquqQ==
X-Gm-Gg: ASbGncsVgG0MMQxXQqMyhjV4osr4zsVp+epTThZIZXoKZyGtemT3oUj40QrzqY8C42f
	12QmM+9WJuAtrqvrwvC72EnJO2LExqwS6emEdOCVUAwVrM5khtmTtaiy3vBzbFYM9acieT1wrxD
	5Ni/VzTwZVYr7jRfGN072KJx0v0GkEuH/lBxM0ejwD4trI14H4j6WqumDIW8XKnf9OHuVR/wtBi
	yURezOL/T9TxbJbK6q2ZOIfp655plxC0r/AvIua8fOA891n0IjTYTF896iVwlRmrCtvIiqSYJwP
	0wQAXwsE7H9+U260giOqtNquff5lG957
X-Received: by 2002:a05:600c:6285:b0:43c:ea1a:720c with SMTP id 5b1f17b1804b1-44c91dd127bmr118895125e9.18.1748351542414;
        Tue, 27 May 2025 06:12:22 -0700 (PDT)
X-Received: by 2002:a05:600c:6285:b0:43c:ea1a:720c with SMTP id 5b1f17b1804b1-44c91dd127bmr118894665e9.18.1748351541958;
        Tue, 27 May 2025 06:12:21 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4d8d945e0sm6246509f8f.94.2025.05.27.06.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 06:12:21 -0700 (PDT)
Date: Tue, 27 May 2025 15:12:19 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, gustavo.romero@linaro.org, anisinha@redhat.com,
 mst@redhat.com, shannon.zhaosl@gmail.com, pbonzini@redhat.com,
 Jonathan.Cameron@huawei.com, philmd@linaro.org, alex.bennee@linaro.org
Subject: Re: [PATCH v2 12/25] hw/acpi/pcihp: Add an AmlRegionSpace arg to
 build_acpi_pci_hotplug
Message-ID: <20250527151219.7957b7a8@imammedo.users.ipa.redhat.com>
In-Reply-To: <20250527074224.1197793-13-eric.auger@redhat.com>
References: <20250527074224.1197793-1-eric.auger@redhat.com>
	<20250527074224.1197793-13-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WZUFfz0_sk4MOQb-3tM3YBqjVuaZIBtzgTnWcF1E2rM_1748351542
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: E1yyNGKQpNLI

On Tue, 27 May 2025 09:40:14 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> On ARM we will put the operation regions in AML_SYSTEM_MEMORY.
> So let's allow this configuration.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  include/hw/acpi/pcihp.h | 3 ++-
>  hw/acpi/pcihp.c         | 8 ++++----
>  hw/i386/acpi-build.c    | 4 ++--
>  3 files changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/include/hw/acpi/pcihp.h b/include/hw/acpi/pcihp.h
> index 8a46a414cc..253ac6e483 100644
> --- a/include/hw/acpi/pcihp.h
> +++ b/include/hw/acpi/pcihp.h
> @@ -28,6 +28,7 @@
>  #define HW_ACPI_PCIHP_H
>  
>  #include "hw/acpi/acpi.h"
> +#include "hw/acpi/aml-build.h"
>  #include "hw/hotplug.h"
>  
>  #define ACPI_PCIHP_IO_BASE_PROP "acpi-pcihp-io-base"
> @@ -73,7 +74,7 @@ void acpi_pcihp_device_unplug_request_cb(HotplugHandler *hotplug_dev,
>                                           AcpiPciHpState *s, DeviceState *dev,
>                                           Error **errp);
>  
> -void build_acpi_pci_hotplug(Aml *table, uint64_t pcihp_addr);
> +void build_acpi_pci_hotplug(Aml *table, AmlRegionSpace rs, uint64_t pcihp_addr);
>  void build_append_pci_dsm_func0_common(Aml *ctx, Aml *retvar);
>  void build_append_pcihp_resources(Aml *table,
>                                    uint64_t io_addr, uint64_t io_len);
> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> index fb54c31f77..310a5c54bd 100644
> --- a/hw/acpi/pcihp.c
> +++ b/hw/acpi/pcihp.c
> @@ -629,7 +629,7 @@ static Aml *aml_pci_pdsm(void)
>      return method;
>  }
>  
> -void build_acpi_pci_hotplug(Aml *table, uint64_t pcihp_addr)
> +void build_acpi_pci_hotplug(Aml *table, AmlRegionSpace rs, uint64_t pcihp_addr)
>  {
>      Aml *scope;
>      Aml *field;
> @@ -638,21 +638,21 @@ void build_acpi_pci_hotplug(Aml *table, uint64_t pcihp_addr)
>      scope =  aml_scope("_SB.PCI0");
>  
>      aml_append(scope,
> -        aml_operation_region("PCST", AML_SYSTEM_IO, aml_int(pcihp_addr), 0x08));
> +        aml_operation_region("PCST", rs, aml_int(pcihp_addr), 0x08));
>      field = aml_field("PCST", AML_DWORD_ACC, AML_NOLOCK, AML_WRITE_AS_ZEROS);
>      aml_append(field, aml_named_field("PCIU", 32));
>      aml_append(field, aml_named_field("PCID", 32));
>      aml_append(scope, field);
>  
>      aml_append(scope,
> -        aml_operation_region("SEJ", AML_SYSTEM_IO,
> +        aml_operation_region("SEJ", rs,
>                               aml_int(pcihp_addr + ACPI_PCIHP_SEJ_BASE), 0x04));
>      field = aml_field("SEJ", AML_DWORD_ACC, AML_NOLOCK, AML_WRITE_AS_ZEROS);
>      aml_append(field, aml_named_field("B0EJ", 32));
>      aml_append(scope, field);
>  
>      aml_append(scope,
> -        aml_operation_region("BNMR", AML_SYSTEM_IO,
> +        aml_operation_region("BNMR", rs,
>                               aml_int(pcihp_addr + ACPI_PCIHP_BNMR_BASE), 0x08));
>      field = aml_field("BNMR", AML_DWORD_ACC, AML_NOLOCK, AML_WRITE_AS_ZEROS);
>      aml_append(field, aml_named_field("BNUM", 32));
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 52cef834ed..6ca2b34ef8 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -1172,7 +1172,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>          aml_append(dsdt, sb_scope);
>  
>          if (pm->pcihp_bridge_en || pm->pcihp_root_en) {
> -            build_acpi_pci_hotplug(dsdt, pm->pcihp_io_base);
> +            build_acpi_pci_hotplug(dsdt, AML_SYSTEM_IO, pm->pcihp_io_base);
>          }
>          build_piix4_pci0_int(dsdt);
>      } else if (q35) {
> @@ -1216,7 +1216,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>          aml_append(dsdt, sb_scope);
>  
>          if (pm->pcihp_bridge_en) {
> -            build_acpi_pci_hotplug(dsdt, pm->pcihp_io_base);
> +            build_acpi_pci_hotplug(dsdt, AML_SYSTEM_IO, pm->pcihp_io_base);
>          }
>          build_q35_pci0_int(dsdt);
>      }
