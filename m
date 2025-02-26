Received: by 2002:a17:504:4644:b0:1be9:327d:8ee3 with SMTP id d4csp980095njg;
        Wed, 26 Feb 2025 07:27:55 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX03ZzDcG7GfSwIC34BLweIDCTPjQ9O2mn+WqgoVRUiXVDN0fq5K/ahsVXR1FbNTK3+vsKrT8czOFq0rA==@linaro.org
X-Google-Smtp-Source: AGHT+IFnrU+eOx3u2tZawZ3EPCtjIR+/LEEv8UXxDgaLBaScFSExl5u5xNw5rB2TkfUy2f133RP1
X-Received: by 2002:a05:6214:e85:b0:6e6:6a82:4989 with SMTP id 6a1803df08f44-6e87abafd62mr75007866d6.44.1740583675363;
        Wed, 26 Feb 2025 07:27:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740583675; cv=none;
        d=google.com; s=arc-20240605;
        b=hRXkiV4cq6nn9Er+C7n+pMoHXLjAvlEXzQo+8OX0evoH5IA1iYJ8Ty1jbNAaM8xvB2
         OsFwyF0XaGIUW8crtZpDdS9w9NjINPscVn6kOTmZKpNjTWDxtVkvl+zcKl65XscGDBgh
         BfbOXu3fLi6Kb2fabPjze3e/z/HYQ8MASV4Nd3zUos1UxE+W7jGTBZ50qx8yI7B3dTvX
         dhlphoPK43fYx8WmRG8Bv84Ntz1tEUyp0LvYGT1qGdkOsYEyyKzKTmz0Ume9vNr26Eil
         rAz483kkylhuF+8aBnzdzpqvRaYJ1aWJItWI1OvuF9JL12pMopG4/3fRcE5E2EVmWfmv
         bvbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=opCox9KVcehhy1NQGp4HS1lXiyGpPcoip0UbMOR0ICE=;
        fh=MFVmcuD3cwmKz1hpql9TFtaMy2XNI/0pNg1/ZDiwjMA=;
        b=KaS8AMNloxaYowI5JyelRDICXgBEhbxeXRldYEySqwkLPHFcdhSNCiZQzatpJuElgj
         y3Jk9qv2P7E20Au0dw7j8fbxRuXYXbsnffljK2DpMsvZfYLN+KTX2h87G1dbMQm3zTme
         ocAu2TYqYcG1WYJ5iKIgNAFtAAx90Qn4i65jljtj9er/vbF4bG9z8JYplXDefGiwulQW
         TZRe9fsnmbgNA2wcfOWStvjDESbTScWD8FWI9phg9c422uv4kAVNo7NqHbcG5ZdjSJPo
         syJbygbY3uSqDqq3tXWz41W8sNnFWA0QKxLo9Yu2ZOsRGZPDR0oZ92Uc1pcqLKCFyqd8
         drFQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aE5hCH2w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e87b0c5002si37896916d6.177.2025.02.26.07.27.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Feb 2025 07:27:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aE5hCH2w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tnJJf-0005sd-W9; Wed, 26 Feb 2025 10:27:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1tnJJe-0005o4-1v
 for qemu-arm@nongnu.org; Wed, 26 Feb 2025 10:27:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1tnJJb-0001Aa-UJ
 for qemu-arm@nongnu.org; Wed, 26 Feb 2025 10:27:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740583633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=opCox9KVcehhy1NQGp4HS1lXiyGpPcoip0UbMOR0ICE=;
 b=aE5hCH2wWLoRLNLq1e385g8taw2gN2p0380RiVbSENYbfRmF6W8LNKtatPYjVGrbxhqkgU
 AY/pICM2rHaKTidzIbh1edt1230KnAA1lYzGYosL6WKueffm6P/2OedJ0GFMR1X/oZG2jW
 TqdLf7dZgYP/Fh63eGlxTb8518+pikU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-396-SOITgGr0OiC9Zb1ByOnimw-1; Wed, 26 Feb 2025 10:27:08 -0500
X-MC-Unique: SOITgGr0OiC9Zb1ByOnimw-1
X-Mimecast-MFC-AGG-ID: SOITgGr0OiC9Zb1ByOnimw_1740583627
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-38f4c0c1738so5408251f8f.1
 for <qemu-arm@nongnu.org>; Wed, 26 Feb 2025 07:27:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740583627; x=1741188427;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=opCox9KVcehhy1NQGp4HS1lXiyGpPcoip0UbMOR0ICE=;
 b=mrbHjzEJribHMwen1FnLh7peiGIQkXhQ7rm6phGpZx4tHP0C/rOdHKk8QMidA+peYS
 L01VabODQanofY11jpcF0+k5/OBl3/M+e7FM7yHmixMOLJAftl5bQbz24Q1rGhokMxLi
 R7jqRdlHZqsEbsAWHrS74KcskrKW+XRFLBuHJ61v+LK4UiGWA1abJ/bb+Wc85Sz9YtM1
 9u9EFcgP2+dKObyU0F7vwfc6OngN23ze/Vx/3tLi1roOXECr7CPnscnMs3odv7q9HU7l
 Wd6c5FuwZkgGHsVXzSulY+lvgGrOkGxWTc1wpRXFBw+NPFyKpVpG1n+SCgoCos8n9Gk3
 NRSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKL0s4OK9X4lrTbcabFKbgHbfnfHdpDTRsglnKTcdChHDqfcRG+h1sHeFzigPKOGaKTOB0dFRm1g==@nongnu.org
X-Gm-Message-State: AOJu0YwM5oY1cuqLntYu52ZJh8DXK5mtZCXUnhtZWGBmvLeuaTVuzxgm
 tnzbZL4b58rwBPnP1ALlXdSD0nx6/m0Ai/C1QgeOEY4qDcTz5tIlFCu6Ctb+aY3+qIEKmOWYgBp
 i0y4pxu1iM+utJXq5Nw9i9K/Spsjlg7uFvk3CVv1hD+ACrDyuew==
X-Gm-Gg: ASbGncsH7LTJ73/ZdU7YE1NM5liPKF44zYIYjNIuZRobNviqxQvGqLBC32+5iDIu6MO
 Xay7pIKjSfegIq9tgq15l0sDjaBpVGXLabzrsIZdmxaliNVOcY/58drFP4rvhAwPXvH5S7GmGYo
 Di22a9f/vv4so3i1TlOJ4lFcZKbDp25lmAgGqs1us8fucvMm3WcOs6ORTKX6X24V34irmVUuAtQ
 IphNdwoTvbc1VabkIUHfDob2AYtZVnlIrnsCF9WsrrpCtjz81f/1qvmL7/JaS9F9VERT+JahGpB
 W3jrBnQx8odij8o3Ho+BvmIzmRGRB1gB6fewLWJTIOU/nHHp1IWToy5OWnJSXmY=
X-Received: by 2002:a5d:5887:0:b0:38f:355b:141e with SMTP id
 ffacd0b85a97d-390d4f378ebmr3452615f8f.3.1740583626898; 
 Wed, 26 Feb 2025 07:27:06 -0800 (PST)
X-Received: by 2002:a5d:5887:0:b0:38f:355b:141e with SMTP id
 ffacd0b85a97d-390d4f378ebmr3452587f8f.3.1740583626458; 
 Wed, 26 Feb 2025 07:27:06 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390cd882a64sm5769008f8f.46.2025.02.26.07.27.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 07:27:05 -0800 (PST)
Date: Wed, 26 Feb 2025 16:27:05 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Shiju Jose <shiju.jose@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 06/14] acpi/ghes: create an ancillary
 acpi_ghes_get_state() function
Message-ID: <20250226162705.67875661@imammedo.users.ipa.redhat.com>
In-Reply-To: <2288cfe02f8cfec4b35759fd748366c885018b59.1740148260.git.mchehab+huawei@kernel.org>
References: <cover.1740148260.git.mchehab+huawei@kernel.org>
 <2288cfe02f8cfec4b35759fd748366c885018b59.1740148260.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rOb3s-xtg61G922pFTarDhm9cHybjHk7z6jatEEDu-I_1740583627
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
X-TUID: mgJWIYfmLSXz

On Fri, 21 Feb 2025 15:35:15 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Instead of having a function to check if ACPI is enabled
> (acpi_ghes_present), change its logic to be more generic,
> returing a pointed to AcpiGhesState.
> 
> Such change allows cleanup the ghes GED state code, avoiding
> to read it multiple times, and simplifying the code.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by:  Igor Mammedov <imammedo@redhat.com>
> ---
>  hw/acpi/ghes-stub.c    |  7 ++++---
>  hw/acpi/ghes.c         | 38 ++++++++++----------------------------
>  include/hw/acpi/ghes.h | 14 ++++++++------
>  target/arm/kvm.c       |  7 +++++--
>  4 files changed, 27 insertions(+), 39 deletions(-)
> 
> diff --git a/hw/acpi/ghes-stub.c b/hw/acpi/ghes-stub.c
> index 7cec1812dad9..40f660c246fe 100644
> --- a/hw/acpi/ghes-stub.c
> +++ b/hw/acpi/ghes-stub.c
> @@ -11,12 +11,13 @@
>  #include "qemu/osdep.h"
>  #include "hw/acpi/ghes.h"
>  
> -int acpi_ghes_memory_errors(uint16_t source_id, uint64_t physical_address)
> +int acpi_ghes_memory_errors(AcpiGhesState *ags, uint16_t source_id,
> +                            uint64_t physical_address)
>  {
>      return -1;
>  }
>  
> -bool acpi_ghes_present(void)
> +AcpiGhesState *acpi_ghes_get_state(void)
>  {
> -    return false;
> +    return NULL;
>  }
> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> index f2d1cc7369f4..401789259f60 100644
> --- a/hw/acpi/ghes.c
> +++ b/hw/acpi/ghes.c
> @@ -425,10 +425,6 @@ static void get_hw_error_offsets(uint64_t ghes_addr,
>                                   uint64_t *cper_addr,
>                                   uint64_t *read_ack_register_addr)
>  {
> -    if (!ghes_addr) {
> -        return;
> -    }
> -
>      /*
>       * non-HEST version supports only one source, so no need to change
>       * the start offset based on the source ID. Also, we can't validate
> @@ -517,27 +513,16 @@ static void get_ghes_source_offsets(uint16_t source_id,
>  NotifierList acpi_generic_error_notifiers =
>      NOTIFIER_LIST_INITIALIZER(error_device_notifiers);
>  
> -void ghes_record_cper_errors(const void *cper, size_t len,
> +void ghes_record_cper_errors(AcpiGhesState *ags, const void *cper, size_t len,
>                               uint16_t source_id, Error **errp)
>  {
>      uint64_t cper_addr = 0, read_ack_register_addr = 0, read_ack_register;
> -    AcpiGedState *acpi_ged_state;
> -    AcpiGhesState *ags;
>  
>      if (len > ACPI_GHES_MAX_RAW_DATA_LENGTH) {
>          error_setg(errp, "GHES CPER record is too big: %zd", len);
>          return;
>      }
>  
> -    acpi_ged_state = ACPI_GED(object_resolve_path_type("", TYPE_ACPI_GED,
> -                                                       NULL));
> -    if (!acpi_ged_state) {
> -        error_setg(errp, "Can't find ACPI_GED object");
> -        return;
> -    }
> -    ags = &acpi_ged_state->ghes_state;
> -
> -
>      if (!ags->use_hest_addr) {
>          get_hw_error_offsets(le64_to_cpu(ags->hw_error_le),
>                               &cper_addr, &read_ack_register_addr);
> @@ -546,11 +531,6 @@ void ghes_record_cper_errors(const void *cper, size_t len,
>                                  &cper_addr, &read_ack_register_addr, errp);
>      }
>  
> -    if (!cper_addr) {
> -        error_setg(errp, "can not find Generic Error Status Block");
> -        return;
> -    }
> -
>      cpu_physical_memory_read(read_ack_register_addr,
>                               &read_ack_register, sizeof(read_ack_register));
>  
> @@ -576,7 +556,8 @@ void ghes_record_cper_errors(const void *cper, size_t len,
>      notifier_list_notify(&acpi_generic_error_notifiers, NULL);
>  }
>  
> -int acpi_ghes_memory_errors(uint16_t source_id, uint64_t physical_address)
> +int acpi_ghes_memory_errors(AcpiGhesState *ags, uint16_t source_id,
> +                            uint64_t physical_address)
>  {
>      /* Memory Error Section Type */
>      const uint8_t guid[] =
> @@ -602,7 +583,7 @@ int acpi_ghes_memory_errors(uint16_t source_id, uint64_t physical_address)
>      acpi_ghes_build_append_mem_cper(block, physical_address);
>  
>      /* Report the error */
> -    ghes_record_cper_errors(block->data, block->len, source_id, &errp);
> +    ghes_record_cper_errors(ags, block->data, block->len, source_id, &errp);
>  
>      g_array_free(block, true);
>  
> @@ -614,7 +595,7 @@ int acpi_ghes_memory_errors(uint16_t source_id, uint64_t physical_address)
>      return 0;
>  }
>  
> -bool acpi_ghes_present(void)
> +AcpiGhesState *acpi_ghes_get_state(void)
>  {
>      AcpiGedState *acpi_ged_state;
>      AcpiGhesState *ags;
> @@ -623,11 +604,12 @@ bool acpi_ghes_present(void)
>                                                         NULL));
>  
>      if (!acpi_ged_state) {
> -        return false;
> +        return NULL;
>      }
>      ags = &acpi_ged_state->ghes_state;
> -    if (!ags->hw_error_le && !ags->hest_addr_le)
> -        return false;
>  
> -    return true;
> +    if (!ags->hw_error_le && !ags->hest_addr_le) {
> +        return NULL;
> +    }
> +    return ags;
>  }
> diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
> index 219aa7ab4fe0..276f9dc076d9 100644
> --- a/include/hw/acpi/ghes.h
> +++ b/include/hw/acpi/ghes.h
> @@ -99,15 +99,17 @@ void acpi_build_hest(AcpiGhesState *ags, GArray *table_data,
>                       const char *oem_id, const char *oem_table_id);
>  void acpi_ghes_add_fw_cfg(AcpiGhesState *vms, FWCfgState *s,
>                            GArray *hardware_errors);
> -int acpi_ghes_memory_errors(uint16_t source_id, uint64_t error_physical_addr);
> -void ghes_record_cper_errors(const void *cper, size_t len,
> +int acpi_ghes_memory_errors(AcpiGhesState *ags, uint16_t source_id,
> +                            uint64_t error_physical_addr);
> +void ghes_record_cper_errors(AcpiGhesState *ags, const void *cper, size_t len,
>                               uint16_t source_id, Error **errp);
>  
>  /**
> - * acpi_ghes_present: Report whether ACPI GHES table is present
> + * acpi_ghes_get_state: Get a pointer for ACPI ghes state
>   *
> - * Returns: true if the system has an ACPI GHES table and it is
> - * safe to call acpi_ghes_memory_errors() to record a memory error.
> + * Returns: a pointer to ghes state if the system has an ACPI GHES table,
> + * it is enabled and it is safe to call acpi_ghes_memory_errors() to record
      ^^^^^^^^^^^^^ can't link 'it' with anything, I'd drop this

> + * a memory error. Returns false, otherwise.
                              ^^^ NULL ??

>   */
> -bool acpi_ghes_present(void);
> +AcpiGhesState *acpi_ghes_get_state(void);
>  #endif
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index da30bdbb2349..80ca7779797b 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -2366,10 +2366,12 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
>  {
>      ram_addr_t ram_addr;
>      hwaddr paddr;
> +    AcpiGhesState *ags;
>  
>      assert(code == BUS_MCEERR_AR || code == BUS_MCEERR_AO);
>  
> -    if (acpi_ghes_present() && addr) {
> +    ags = acpi_ghes_get_state();
> +    if (ags && addr) {
>          ram_addr = qemu_ram_addr_from_host(addr);
>          if (ram_addr != RAM_ADDR_INVALID &&
>              kvm_physical_memory_addr_from_host(c->kvm_state, addr, &paddr)) {
> @@ -2387,7 +2389,8 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
>               */
>              if (code == BUS_MCEERR_AR) {
>                  kvm_cpu_synchronize_state(c);
> -                if (!acpi_ghes_memory_errors(ACPI_HEST_SRC_ID_SEA, paddr)) {
> +                if (!acpi_ghes_memory_errors(ags, ACPI_HEST_SRC_ID_SEA,
> +                                             paddr)) {
>                      kvm_inject_arm_sea(c);
>                  } else {
>                      error_report("failed to record the error");

