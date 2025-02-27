Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp216493njb;
        Thu, 27 Feb 2025 05:25:45 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXFbe9VoReFLMxzmRmEPmk2bCtUMJsP3+x9holsNoE1BpPNTdw+wx/prgKnem9wXBquJo3G79sW7d0lEg==@linaro.org
X-Google-Smtp-Source: AGHT+IGr3RrhgROkPv42ChNCPkCXcpb2sozIzxun/0qO+nhGAe1Pc57dmZN0VR4Ro5gHmI38o13z
X-Received: by 2002:a05:6214:21a2:b0:6e6:6477:de09 with SMTP id 6a1803df08f44-6e886903089mr85397516d6.43.1740662745589;
        Thu, 27 Feb 2025 05:25:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740662745; cv=none;
        d=google.com; s=arc-20240605;
        b=Nf7Thekq2liLac/2tmIcjBWEc/ZBRhnFv+xJaT1z3T9oUexb3TJDZ+QcJPOivnT9+J
         TSYV2aCN5c3Ghlwn9NZYbp3JoKkZDe9d/eHQyfYwMeeoIXeauznXFPXIZX1sCcTSVlAg
         ZfW8a61do3vQz1/xRiCJd/I/Q4jFshNGy75oOHlHtYhhLmvjBmwCNrr73JUFf4lTR0+0
         w5gq5JFyTVujzm8qWhFdqwOPibVG533Jp9X9M7lK+fjLrLLCzV7444M6hmf1p/0If20Y
         OER3suQszoy2EMg1PRotBpEQq8jrBhmReHNKsx0v6XuBhBF1u+LxSfMD8D91PgmEPZmY
         CWlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=f51Tc1bxzTeBFM23W9emUsW0S9cYm+o+zyeX5lS8VVw=;
        fh=CJglCHOWFlRFWB6i5bDm0yQm+aLCLYvdH3r0JT6i5pE=;
        b=WP1jVLt/50bO4iqQFpkWdLHsEblWMkJMx5TdiZyPabw2HhJLl2NJLPajaITlur3yO5
         OviNuuBdLdp1uyJBT0drsyf/+yfRFLnsCqyF2jUUX/XVC/IShr7kTFIKOul+1AMtblaB
         VM1pMGPZwz/OAqmvs78pdaGBIqlDL8cc3Z8Gk2hV7IERoS+iHZnHdHNAMmpWpMA3Tymr
         g90or3Y2EmUeMQSNhgJWyLnnmgkFYXolPKcTyUuu71q9gEll/Eax2X6QM5Y83bHjqT5+
         vxlblGXof8gmaOHPFdMDnREthaQXfyv+Ml/qDdOjSlBIZhgueFJ9e2JwSfwg8QKlzeY7
         TU5g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ULoxHFdw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c378da4da0si121918885a.492.2025.02.27.05.25.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2025 05:25:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ULoxHFdw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tndtR-0007pF-Mt; Thu, 27 Feb 2025 08:25:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1tndtJ-0007kE-JK
 for qemu-arm@nongnu.org; Thu, 27 Feb 2025 08:25:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1tndtH-0001n9-Ij
 for qemu-arm@nongnu.org; Thu, 27 Feb 2025 08:25:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740662725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f51Tc1bxzTeBFM23W9emUsW0S9cYm+o+zyeX5lS8VVw=;
 b=ULoxHFdw6sjE0DGebiNK/hOO8vKnby7R9mtKa3pyS19nOfn3NAg+3z/3idYt6nqxjocTYM
 ErxKM/WO8ZHIrDoTQoYqy5avXsV/b2j+uM2PMmZIf0O6pUSZd2cu8ce+NpbkYDDAU2IFy1
 nMiI9KYFcRpUmwL8Xu19ePibVCCdm6E=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-500-BzH7wGBhM6OaHvjdL6c79Q-1; Thu, 27 Feb 2025 08:25:24 -0500
X-MC-Unique: BzH7wGBhM6OaHvjdL6c79Q-1
X-Mimecast-MFC-AGG-ID: BzH7wGBhM6OaHvjdL6c79Q_1740662723
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-390e5996058so263687f8f.0
 for <qemu-arm@nongnu.org>; Thu, 27 Feb 2025 05:25:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740662723; x=1741267523;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f51Tc1bxzTeBFM23W9emUsW0S9cYm+o+zyeX5lS8VVw=;
 b=MAd4cNM59G68Okinipx1L5UVempmIoIEkmtblErgbbHpT0kS6a9aVVt+ehilBxAZqF
 uCfF2K5M8yAmdZUYFV/q1iMEejU0TxiItbj+CGHJFCQ5tLfRmDN1Km+EDr4Bt5gJh+Fa
 NSIyTxpBTYDddfYvbo64SFCY+sTKlQGoGcLgsTh28oNRZiTkr5zSRCMoCLri8aionWRK
 0TSA2bZ6w92Wb4SzFstC78Xi8cS0G0Q/1jYr31GQg1f1fnOKeyoweHJiqboO4qMPr0aX
 5cqJzgXYrG8Q5Q2PA3q+cE6nqAMe17L3nvpK7s1E6IpxR1ABlCXA/vi+6Wv8vbvUp/uf
 HUiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdaYD93ptI1TihxWcNly0S2M2azBs6H3XKzuJ9r8TwEUyTDraywGpBdE2QSK+HV0J3g20gjkV+mw==@nongnu.org
X-Gm-Message-State: AOJu0YzjdPOou/Yz69pUb5fM6tIYG+/5yVzW2jbxUA9fN2MamFf5IdCv
 2x4xhroUXOwx3p2nJcm9J13HYvW08A11UdphP909c+gTP8Jl6Xa1U8V7w7AhFD3d3Q3yQtD3qt+
 i/FLdwJysJuaoiil3ggJfgW+JzlbRKqPRbHU9AHkcvH2/Gaqjfg==
X-Gm-Gg: ASbGncumxfyWbX9iVtFiMcdOf9lkWWPT8bUw8V1WordNyJeMwfghvRWViR7P7Vn8F/n
 ux7dcl70Koh/VGYCDanUSsO3YwvlBYgark7NytRqaUMCrTiKXvudp8SNZyouJW08IMLXULLnx9E
 KytFSIZ5zkLBKwRysG7lo4++GMxh3bqRnyrmSd5bneByZbQEqYHU7lXI32IbOBGcFf+BPOpcZfN
 Itxd0fTZM8EVJsnye9wkzSHpAE6j9uhtqk/B908ZfaCiWpUNLmv/iNDRPjWAuzQtgy4GFzljyuw
 BS7vV+YViTNBK8mWed4muAN+TJj8sH5BBKs3vQfdQLpcZlyxbe0AStxAu7LcL8Y=
X-Received: by 2002:a5d:5989:0:b0:38f:2856:7d96 with SMTP id
 ffacd0b85a97d-390d4f3685fmr5296716f8f.1.1740662723261; 
 Thu, 27 Feb 2025 05:25:23 -0800 (PST)
X-Received: by 2002:a5d:5989:0:b0:38f:2856:7d96 with SMTP id
 ffacd0b85a97d-390d4f3685fmr5296695f8f.1.1740662722887; 
 Thu, 27 Feb 2025 05:25:22 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e47b7c4fsm2061408f8f.52.2025.02.27.05.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 05:25:22 -0800 (PST)
Date: Thu, 27 Feb 2025 14:25:21 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Shiju Jose <shiju.jose@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 05/21] acpi/ghes: prepare to change the way HEST
 offsets are calculated
Message-ID: <20250227142521.278015ee@imammedo.users.ipa.redhat.com>
In-Reply-To: <d1b8873b680b1b56ec798d25b71a1622cf1eb3ab.1740653898.git.mchehab+huawei@kernel.org>
References: <cover.1740653898.git.mchehab+huawei@kernel.org>
 <d1b8873b680b1b56ec798d25b71a1622cf1eb3ab.1740653898.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8E8WUSjcAQgsZi37MZs7X9YkQouKyEJU5gdFLZ3JTDo_1740662723
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.438,
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
X-TUID: 5W6ZLKYcnD6x

On Thu, 27 Feb 2025 12:03:35 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Add a new ags flag to change the way HEST offsets are calculated.
> Currently, offsets needed to store ACPI HEST offsets and read ack
> are calculated based on a previous knowledge from the logic
> which creates the HEST table.
> 
> Such logic is not generic, not allowing to easily add more HEST
> entries nor replicates what OSPM does.
> 
> As the next patches will be adding a more generic logic, add a
> new use_hest_addr, set to false, in preparation for such changes.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  hw/acpi/ghes.c           | 39 ++++++++++++++++++++++++---------------
>  hw/arm/virt-acpi-build.c | 14 +++++++++++---
>  include/hw/acpi/ghes.h   | 12 +++++++++++-
>  3 files changed, 46 insertions(+), 19 deletions(-)
> 
> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> index 84b891fd3dcf..9243b5ad4acb 100644
> --- a/hw/acpi/ghes.c
> +++ b/hw/acpi/ghes.c
> @@ -206,7 +206,8 @@ ghes_gen_err_data_uncorrectable_recoverable(GArray *block,
>   * Initialize "etc/hardware_errors" and "etc/hardware_errors_addr" fw_cfg blobs.
>   * See docs/specs/acpi_hest_ghes.rst for blobs format.
>   */
> -static void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker)
> +static void build_ghes_error_table(AcpiGhesState *ags, GArray *hardware_errors,
> +                                   BIOSLinker *linker)
>  {
>      int i, error_status_block_offset;
>  
> @@ -251,13 +252,15 @@ static void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker)
>                                         i * ACPI_GHES_MAX_RAW_DATA_LENGTH);
>      }
>  
> -    /*
> -     * tell firmware to write hardware_errors GPA into
> -     * hardware_errors_addr fw_cfg, once the former has been initialized.
> -     */
> -    bios_linker_loader_write_pointer(linker, ACPI_HW_ERROR_ADDR_FW_CFG_FILE, 0,
> -                                     sizeof(uint64_t),
> -                                     ACPI_HW_ERROR_FW_CFG_FILE, 0);
> +    if (!ags->use_hest_addr) {
> +        /*
> +         * Tell firmware to write hardware_errors GPA into
> +         * hardware_errors_addr fw_cfg, once the former has been initialized.
> +         */
> +        bios_linker_loader_write_pointer(linker, ACPI_HW_ERROR_ADDR_FW_CFG_FILE,
> +                                         0, sizeof(uint64_t),
> +                                         ACPI_HW_ERROR_FW_CFG_FILE, 0);
> +    }
>  }
>  
>  /* Build Generic Hardware Error Source version 2 (GHESv2) */
> @@ -331,14 +334,15 @@ static void build_ghes_v2(GArray *table_data,
>  }
>  
>  /* Build Hardware Error Source Table */
> -void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
> +void acpi_build_hest(AcpiGhesState *ags, GArray *table_data,
> +                     GArray *hardware_errors,
>                       BIOSLinker *linker,
>                       const char *oem_id, const char *oem_table_id)
>  {
>      AcpiTable table = { .sig = "HEST", .rev = 1,
>                          .oem_id = oem_id, .oem_table_id = oem_table_id };
>  
> -    build_ghes_error_table(hardware_errors, linker);
> +    build_ghes_error_table(ags, hardware_errors, linker);
>  
>      acpi_table_begin(&table, table_data);
>  
> @@ -357,9 +361,11 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
>      fw_cfg_add_file(s, ACPI_HW_ERROR_FW_CFG_FILE, hardware_error->data,
>                      hardware_error->len);
>  
> -    /* Create a read-write fw_cfg file for Address */
> -    fw_cfg_add_file_callback(s, ACPI_HW_ERROR_ADDR_FW_CFG_FILE, NULL, NULL,
> -        NULL, &(ags->hw_error_le), sizeof(ags->hw_error_le), false);
> +    if (!ags->use_hest_addr) {
> +        /* Create a read-write fw_cfg file for Address */
> +        fw_cfg_add_file_callback(s, ACPI_HW_ERROR_ADDR_FW_CFG_FILE, NULL, NULL,
> +            NULL, &(ags->hw_error_le), sizeof(ags->hw_error_le), false);
> +    }
>  }
>  
>  static void get_hw_error_offsets(uint64_t ghes_addr,
> @@ -395,8 +401,11 @@ void ghes_record_cper_errors(AcpiGhesState *ags, const void *cper, size_t len,
>      }
>  
>      assert(ACPI_GHES_ERROR_SOURCE_COUNT == 1);
> -    get_hw_error_offsets(le64_to_cpu(ags->hw_error_le),
> -                         &cper_addr, &read_ack_register_addr);
> +
> +    if (!ags->use_hest_addr) {
> +        get_hw_error_offsets(le64_to_cpu(ags->hw_error_le),
> +                             &cper_addr, &read_ack_register_addr);
> +    }
>  
>      cpu_physical_memory_read(read_ack_register_addr,
>                               &read_ack_register, sizeof(read_ack_register));
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 3ac8f8e17861..e6328af5d238 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -946,9 +946,17 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>      build_dbg2(tables_blob, tables->linker, vms);
>  
>      if (vms->ras) {
> -        acpi_add_table(table_offsets, tables_blob);
> -        acpi_build_hest(tables_blob, tables->hardware_errors, tables->linker,
> -                        vms->oem_id, vms->oem_table_id);
> +        AcpiGedState *acpi_ged_state;
> +        AcpiGhesState *ags;
> +
> +        acpi_ged_state = ACPI_GED(object_resolve_path_type("", TYPE_ACPI_GED,
> +                                                       NULL));
> +        ags = &acpi_ged_state->ghes_state;
> +        if (ags) {
> +            acpi_add_table(table_offsets, tables_blob);
> +            acpi_build_hest(ags, tables_blob, tables->hardware_errors,
> +                            tables->linker, vms->oem_id, vms->oem_table_id);
> +        }
>      }
>  
>      if (ms->numa_state->num_nodes > 0) {
> diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
> index f96ac3e85ca2..5000891f163f 100644
> --- a/include/hw/acpi/ghes.h
> +++ b/include/hw/acpi/ghes.h
> @@ -64,11 +64,21 @@ enum {
>      ACPI_GHES_ERROR_SOURCE_COUNT
>  };
>  
> +/*
> + * AcpiGhesState stores an offset that will be used to fill HEST entries.
                              s/^^^^/GPA/

> + *
> + * When use_hest_addr is false, the GPA of the etc/hardware_errors firmware
> + * is stored at hw_error_le. This is the default on QEMU 9.x.
> + *
> + * An GPA value equal to zero means that GHES is not present.
> + */
>  typedef struct AcpiGhesState {
>      uint64_t hw_error_le;
> +    bool use_hest_addr;         /* Currently, always false */
>  } AcpiGhesState;
>  
> -void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
> +void acpi_build_hest(AcpiGhesState *ags, GArray *table_data,
> +                     GArray *hardware_errors,
>                       BIOSLinker *linker,
>                       const char *oem_id, const char *oem_table_id);
>  void acpi_ghes_add_fw_cfg(AcpiGhesState *vms, FWCfgState *s,

