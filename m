Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp217661njb;
        Thu, 27 Feb 2025 05:27:43 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUT82ddtBFAbGqU1kmy5mBh4pKyzA1awbf4z2x4IsMqpr56cjRv0oGlidvC2OeFnsNyiecGm4T2S/Gjow==@linaro.org
X-Google-Smtp-Source: AGHT+IGVTZXZPYsTwvyV5ooxeE9p3p/cxgk+bPQxFfizqjKHszvNmpvcq2oS6HkMo5A7ZK2CtwYN
X-Received: by 2002:a05:620a:2991:b0:7c0:bf29:4e28 with SMTP id af79cd13be357-7c0cf8eb0cdmr3119862885a.34.1740662863008;
        Thu, 27 Feb 2025 05:27:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740662862; cv=none;
        d=google.com; s=arc-20240605;
        b=B8eYwTGmvLx+yqlQ57j937C/wVORqVZCM0/04273MxHz+Z/NANyrV/i6RBii2/UZus
         14w8VS9wrwkA3EH7zMFURdqxM8/7uUvWxxuFjcy0SoSSInWNPgUj27RxELhw0MzwqR9g
         NS+ZcIYrRiXxBjuRHE1UL/vk5v7Eh+DXIutYOz9UdANhyCJ0vy+iw3nNpSGbOR8ZEuyZ
         RqjhL5QnfV/xe1/w7vL2jNR6iEM+mwz6xinBGEshhJSdfM/1WjqncVQCFNpv47gIIBV4
         07BpDHB72oB5K4dJ/09Vac9go2W+vM2KWyaHgesLSh4aFMIIRJGqj0Zw8CZupn9PeqI3
         W/5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=Az0axnx9GoNHmG1bRahpz+gTtatrJjB9FkHXDcLXTEU=;
        fh=QUnTGBd4wv0AHQPXzAkpSJqb+jFXN1p5FVt34GwTJrk=;
        b=fNYIPx0GhzcVZzNYtwaD/iR+S1JH3+Sejq/ImiUyhfABcLsHefeXUE/XuwlaA1Jw62
         1lpF927ckAemrGZIBY/Mnzk9fhYLM1I2b7Cu5UAKqRyryE+rweh8lX7DzeMqSDkOGJrt
         7aRrTMWUaycj1cjMhPSY2oHjVI2nExkcqJUsOuMqXA9z5nOztA7hnvTLGzoanpYgS6//
         atrx0eBuuZe3aFj8Q+UdQRbgOZAr9WPsKEJGQ9750AB8BpuUu1myycYWyUhhkNXUihqh
         UeiIdHuioMLkpz7eq/p7DvYHaYM3Dyl/SYiecS2c3TJvZR0s3GP0zKMagxhpWzQjgs1/
         aVxg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SfYAHXeJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8976c0852si12756216d6.203.2025.02.27.05.27.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2025 05:27:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SfYAHXeJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tndvE-0000rp-W6; Thu, 27 Feb 2025 08:27:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1tndvA-0000mW-PD
 for qemu-arm@nongnu.org; Thu, 27 Feb 2025 08:27:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1tndv7-00024Q-JO
 for qemu-arm@nongnu.org; Thu, 27 Feb 2025 08:27:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740662840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Az0axnx9GoNHmG1bRahpz+gTtatrJjB9FkHXDcLXTEU=;
 b=SfYAHXeJDWt2//MhBw2kNKYdGLMEZ9+LFHSZYTdcWohTvhA8lHMlTA2mg4Lp2PIiAdfCbz
 9XTz0xGHzbhkaaZ+N7TvWNiXTnGCQUUbK3kmYGrdGflzAYlzwS4QZMJGH0ezzYceTeMftH
 EELNzxK3N79vZz89AdK9fgfrICV4kbY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-53-Kyac8NVuMaa8HIQgL1Atng-1; Thu, 27 Feb 2025 08:27:18 -0500
X-MC-Unique: Kyac8NVuMaa8HIQgL1Atng-1
X-Mimecast-MFC-AGG-ID: Kyac8NVuMaa8HIQgL1Atng_1740662838
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-38f628ff78eso536441f8f.1
 for <qemu-arm@nongnu.org>; Thu, 27 Feb 2025 05:27:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740662837; x=1741267637;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Az0axnx9GoNHmG1bRahpz+gTtatrJjB9FkHXDcLXTEU=;
 b=sl9rTf2h+45/rBrqNCgxAWMkIUocLYqCoRKzAowiUVzIhVhkqoPveatLBkrVYcLdj5
 HJEUAqtPMwlaPiiRu+50VLz8HV9Lpcwj9X7LbOmRPrYmAaRXgecPPfS/rDo7RUmeVnr+
 zYgsvMgeXDZMkb206Eh6b3tV0aoFWcv9SzHAH5abyTEL7D0C1udw9b0sxDds9Keo/Izg
 kBmFPQF0jCi8t5nxWu537v1CE5c0g0/SAXdMGurfl7FT+rHsRNxX6pCTJ+A5MOEs9v+B
 m9pofT+Atok3ejx7QdhPqvrMSuEcaay/XAdLDovvdBtS8EGsbJUP3VmM8eHUWUz/o6pS
 wm7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXidQRC9vf5BkzHlez17vU6JwOa9/s6enWJ/3Iwmk4Y3rZS0j+ec1kAeubNsMXr0Zp/C4xrcWvmUw==@nongnu.org
X-Gm-Message-State: AOJu0YzVSPbobjOJejnOinRmtc6uAb/ZJbDqcwbPdbiO19aDrdVBrn+H
 L5bTMXp6mmDZq1GPfBqt1dixsRQt5jP/SNrFJdWHBUkexYZe7lN6riuqUWRnwbBo3B6Kb70ggO1
 8HLDU+2NDtk04gUtOi5YOGfKQT1xrqpZgv6agjNV6xc8oHbzPzQ==
X-Gm-Gg: ASbGncttZn2tE53kxfO0J3yy0HTXa1g50fxvzbKxCOspB4W0FsGUc0dHoQEm/XtrSVG
 NDyoPz82M9bECiyjE3OnIkYisBj/j9M87cUcMmbAzmdFRbNkvi6VpknBT/P16uc7au+qbugoZzJ
 A7BX4FY21dfhkyrxiiOSE5Zf1aPFr7L1HLidDgomJlzF8zhZE/s/diQ9mlpSiGWNC8PC9wvIK1J
 JDUZg5Uvf6xPFgLhAqOPUsOF+JiLs2KO4vjZ1s2CJDzo3JNFd/5R7tUCnFpYPrcHxlhxVXxK5jz
 pvrAP0JwBYXi0JjO9olGykPPwbFL5DV2mst+UZcOBjO50g5uRHzj+I2Ie5I58hs=
X-Received: by 2002:a5d:5f93:0:b0:38b:f4e6:21aa with SMTP id
 ffacd0b85a97d-390e1648bd8mr2548340f8f.5.1740662837593; 
 Thu, 27 Feb 2025 05:27:17 -0800 (PST)
X-Received: by 2002:a5d:5f93:0:b0:38b:f4e6:21aa with SMTP id
 ffacd0b85a97d-390e1648bd8mr2548313f8f.5.1740662837146; 
 Thu, 27 Feb 2025 05:27:17 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e4795962sm2139257f8f.13.2025.02.27.05.27.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 05:27:16 -0800 (PST)
Date: Thu, 27 Feb 2025 14:27:15 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Shiju Jose <shiju.jose@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 07/21] acpi/ghes: Use HEST table offsets when
 preparing GHES records
Message-ID: <20250227142715.79984512@imammedo.users.ipa.redhat.com>
In-Reply-To: <bd544e003047996eaaebe10c11e13f1d30c2751d.1740653898.git.mchehab+huawei@kernel.org>
References: <cover.1740653898.git.mchehab+huawei@kernel.org>
 <bd544e003047996eaaebe10c11e13f1d30c2751d.1740653898.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _xKs3jTpLaB4Llr_TlQlJ9Le82Dw7s2KkY_A7BjjdZQ_1740662838
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.438,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: rhUadY8WGw+Q

On Thu, 27 Feb 2025 12:03:37 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> There are two pointers that are needed during error injection:
> 
> 1. The start address of the CPER block to be stored;
> 2. The address of the read ack.
> 
> It is preferable to calculate them from the HEST table.  This allows
> checking the source ID, the size of the table and the type of the
> HEST error block structures.
> 
> Yet, keep the old code, as this is needed for migration purposes
> from older QEMU versions.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/acpi/ghes.c         | 100 +++++++++++++++++++++++++++++++++++++++++
>  include/hw/acpi/ghes.h |   2 +-
>  2 files changed, 101 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> index 8ec423726b3f..5158418f93cb 100644
> --- a/hw/acpi/ghes.c
> +++ b/hw/acpi/ghes.c
> @@ -41,6 +41,12 @@
>  /* Address offset in Generic Address Structure(GAS) */
>  #define GAS_ADDR_OFFSET 4
>  
> +/*
> + * ACPI spec 1.0b
> + * 5.2.3 System Description Table Header
> + */
> +#define ACPI_DESC_HEADER_OFFSET     36
> +
>  /*
>   * The total size of Generic Error Data Entry
>   * ACPI 6.1/6.2: 18.3.2.7.1 Generic Error Data,
> @@ -61,6 +67,30 @@
>   */
>  #define ACPI_GHES_GESB_SIZE                 20
>  
> +/*
> + * See the memory layout map at docs/specs/acpi_hest_ghes.rst.
> + */
> +
> +/*
> + * ACPI 6.1: 18.3.2.8 Generic Hardware Error Source version 2
> + * Table 18-344 Generic Hardware Error Source version 2 (GHESv2) Structure
> + */
> +#define HEST_GHES_V2_ENTRY_SIZE  92
> +
> +/*
> + * ACPI 6.1: 18.3.2.8 Generic Hardware Error Source version 2
> + * Table 18-344 Generic Hardware Error Source version 2 (GHESv2) Structure
> + * Read Ack Register
> + */
> +#define GHES_READ_ACK_ADDR_OFF          64
> +
> +/*
> + * ACPI 6.1: 18.3.2.7: Generic Hardware Error Source
> + * Table 18-341 Generic Hardware Error Source Structure
> + * Error Status Address
> + */
> +#define GHES_ERR_STATUS_ADDR_OFF  20
> +
>  /*
>   * Values for error_severity field
>   */
> @@ -408,6 +438,73 @@ static void get_hw_error_offsets(uint64_t ghes_addr,
>      *read_ack_register_addr = ghes_addr + sizeof(uint64_t);
>  }
>  
> +static void get_ghes_source_offsets(uint16_t source_id,
> +                                    uint64_t hest_addr,
> +                                    uint64_t *cper_addr,
> +                                    uint64_t *read_ack_start_addr,
> +                                    Error **errp)
> +{
> +    uint64_t hest_err_block_addr, hest_read_ack_addr;
> +    uint64_t err_source_entry, error_block_addr;
> +    uint32_t num_sources, i;
> +
> +    hest_addr += ACPI_DESC_HEADER_OFFSET;
> +
> +    cpu_physical_memory_read(hest_addr, &num_sources,
> +                             sizeof(num_sources));
> +    num_sources = le32_to_cpu(num_sources);
> +
> +    err_source_entry = hest_addr + sizeof(num_sources);
> +
> +    /*
> +     * Currently, HEST Error source navigates only for GHESv2 tables
> +     */
> +    for (i = 0; i < num_sources; i++) {
> +        uint64_t addr = err_source_entry;
> +        uint16_t type, src_id;
> +
> +        cpu_physical_memory_read(addr, &type, sizeof(type));
> +        type = le16_to_cpu(type);
> +
> +        /* For now, we only know the size of GHESv2 table */
> +        if (type != ACPI_GHES_SOURCE_GENERIC_ERROR_V2) {
> +            error_setg(errp, "HEST: type %d not supported.", type);
> +            return;
> +        }
> +
> +        /* Compare CPER source ID at the GHESv2 structure */
> +        addr += sizeof(type);
> +        cpu_physical_memory_read(addr, &src_id, sizeof(src_id));
> +        if (le16_to_cpu(src_id) == source_id) {
> +            break;
> +        }
> +
> +        err_source_entry += HEST_GHES_V2_ENTRY_SIZE;
> +    }
> +    if (i == num_sources) {
> +        error_setg(errp, "HEST: Source %d not found.", source_id);
> +        return;
> +    }
> +
> +    /* Navigate through table address pointers */
> +    hest_err_block_addr = err_source_entry + GHES_ERR_STATUS_ADDR_OFF +
> +                          GAS_ADDR_OFFSET;
> +
> +    cpu_physical_memory_read(hest_err_block_addr, &error_block_addr,
> +                             sizeof(error_block_addr));
> +    error_block_addr = le64_to_cpu(error_block_addr);
> +
> +    cpu_physical_memory_read(error_block_addr, cper_addr,
> +                             sizeof(*cper_addr));
> +    *cper_addr = le64_to_cpu(*cper_addr);
> +
> +    hest_read_ack_addr = err_source_entry + GHES_READ_ACK_ADDR_OFF +
> +                         GAS_ADDR_OFFSET;
> +    cpu_physical_memory_read(hest_read_ack_addr, read_ack_start_addr,
> +                             sizeof(*read_ack_start_addr));
> +    *read_ack_start_addr = le64_to_cpu(*read_ack_start_addr);
> +}
> +
>  void ghes_record_cper_errors(AcpiGhesState *ags, const void *cper, size_t len,
>                               uint16_t source_id, Error **errp)
>  {
> @@ -423,6 +520,9 @@ void ghes_record_cper_errors(AcpiGhesState *ags, const void *cper, size_t len,
>      if (!ags->use_hest_addr) {
>          get_hw_error_offsets(le64_to_cpu(ags->hw_error_le),
>                               &cper_addr, &read_ack_register_addr);
> +    } else {
> +        get_ghes_source_offsets(source_id, le64_to_cpu(ags->hest_addr_le),
> +                                &cper_addr, &read_ack_register_addr, errp);
>      }
>  
>      cpu_physical_memory_read(read_ack_register_addr,
> diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
> index 38abe6e3db52..dcc7288ffba5 100644
> --- a/include/hw/acpi/ghes.h
> +++ b/include/hw/acpi/ghes.h
> @@ -79,7 +79,7 @@ enum {
>  typedef struct AcpiGhesState {
>      uint64_t hest_addr_le;
>      uint64_t hw_error_le;
> -    bool use_hest_addr;         /* Currently, always false */
> +    bool use_hest_addr; /* True if HEST address is present */
>  } AcpiGhesState;
>  
>  void acpi_build_hest(AcpiGhesState *ags, GArray *table_data,

