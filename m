Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F345CCFA13
	for <qemu-arm@archiver.kernel.org>; Mon, 10 Nov 2025 14:53:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vITGl-00062r-Fd; Mon, 10 Nov 2025 09:53:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1vITGe-0005xs-Cb
 for qemu-arm@nongnu.org; Mon, 10 Nov 2025 09:53:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1vITGb-0000Pd-2R
 for qemu-arm@nongnu.org; Mon, 10 Nov 2025 09:53:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762786391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mfVMdJfyaaPsUPMviEliedK60j/rWdz+0nevChecdnc=;
 b=NZjH6ubTbSD7qsnAiX8x1jfJdhwzZj+Il24eGXh55wcIB0cDS2exfUcNcoZ7TA+Zdlrz9A
 hymznp7GAqf+wue8sJoiZC4CAY2Gv5XeZjxz1dSyN11lmvdp+9X7915MoLu0v1JMUNAysd
 jpRdgMmuljXl2nyg7PL2yPFgRBEGVrE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-417-yvO9Fx-WPeO4NCbjflKTeA-1; Mon, 10 Nov 2025 09:53:10 -0500
X-MC-Unique: yvO9Fx-WPeO4NCbjflKTeA-1
X-Mimecast-MFC-AGG-ID: yvO9Fx-WPeO4NCbjflKTeA_1762786390
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-429cbed2b8fso1502212f8f.1
 for <qemu-arm@nongnu.org>; Mon, 10 Nov 2025 06:53:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762786389; x=1763391189;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mfVMdJfyaaPsUPMviEliedK60j/rWdz+0nevChecdnc=;
 b=V0ReE9cGjIc4W32fi9nEs1xJY6VcRQVgeEB06yxaA62vHIS/ckhqpYVy6g2dQ5AUcF
 5GR/72C3Ra4LerpH8R+pdflhdjTUMhGXY6CReWsblsjG8OZh2ubnUYqmobbzu7fnChyu
 RD7DZ5XhkecmDn+z51EydRBHbuImHs3o73IQjWjhASvBAUG4JEh9I86oAkco1LfZYP3U
 gPevstm9I8WOBLFNh1feuuc+RGK3SFNQrmuEpFq0YO3QpEm3KCZvUkb6EGdqR+uhAzP9
 BWZpeSV7maOyIdJE+yZ7xdVQVDdatFA1T5sZFGulCo5V4QO76I6sB+yFHnDYunKm4Gki
 vglA==
X-Gm-Message-State: AOJu0YzRKen6XEmQ/kijs3Jc6RkFvcf7kWYy8N96z7xtGH0xC1hFL+PT
 vrGAiE1ccnMkCERL/RuthYDgPf+rCVM40+uoDittZuiH5txyF6M13nf9Uv3dot1+KgG1rTVU+Qc
 PilXSx11bCwoWsz2RSQWZjsFUHYp/I3QUWqOX2bMoHhyNKQe5s6Y0uA==
X-Gm-Gg: ASbGncsfzs/08lLVoAh7kZI1ZD/4MSGgrdtVzrPQEtPfdfH1AReoLXl439vG+Nqg872
 DOyXZg33co+Be5tHt0rVT0SYXX/HCPrGnFzTDp9WFjxS/m+jtAp6QWASVphehPp/sndEpy/Fa9j
 HfXbbDnzXPgSHIPtT9MwcuK2fBXjeDJiudEIg8t/6lK/RRIdIAVZOThSbQIkDU4TUNiSWlw9aCz
 5i7UGb2KhcCS6t6VuMRHXj2qTWW6DpqOgndoELv9YVZQVRB2a09LmP6O5Xx9LkwFZRhd5bGC8dZ
 5/QKvgC5HyAJDH/CT1FEf4k41J1RZdteLAkL28zMHi5BsA38FBi+0DBPsB3rIjIisQ==
X-Received: by 2002:a05:6000:22c5:b0:42b:3806:2bb4 with SMTP id
 ffacd0b85a97d-42b38062ee3mr4659081f8f.27.1762786389450; 
 Mon, 10 Nov 2025 06:53:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF6IUThXKt0KKjHqEVdE+mYwAOPIdOCgZ1CY1+kF0yMKjCk3InWytT1vqqnXexM0MQpe3Ftyg==
X-Received: by 2002:a05:6000:22c5:b0:42b:3806:2bb4 with SMTP id
 ffacd0b85a97d-42b38062ee3mr4659041f8f.27.1762786388960; 
 Mon, 10 Nov 2025 06:53:08 -0800 (PST)
Received: from fedora ([85.93.96.130]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42ac67920fcsm22466090f8f.39.2025.11.10.06.53.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Nov 2025 06:53:08 -0800 (PST)
Date: Mon, 10 Nov 2025 15:53:07 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, jonathan.cameron@huawei.com,
 mchehab+huawei@kernel.org, gengdongjiu1@gmail.com, mst@redhat.com,
 anisinha@redhat.com, peter.maydell@linaro.org, pbonzini@redhat.com,
 shan.gavin@gmail.com
Subject: Re: [PATCH v3 6/8] acpi/ghes: Use error_abort in
 acpi_ghes_memory_errors()
Message-ID: <20251110155307.372dafb0@fedora>
In-Reply-To: <20251105114453.2164073-7-gshan@redhat.com>
References: <20251105114453.2164073-1-gshan@redhat.com>
 <20251105114453.2164073-7-gshan@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bXy9bsF3mN2SpU5XjQsvRiFtCRGQ0rehdzo1jv0g1HU_1762786390
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Wed,  5 Nov 2025 21:44:51 +1000
Gavin Shan <gshan@redhat.com> wrote:

> Use error_abort in acpi_ghes_memory_errors() so that the caller needn't
> explicitly call abort() on errors. With this change, its return value
> isn't needed any more.
> 
> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/acpi/ghes-stub.c    |  6 +++---
>  hw/acpi/ghes.c         | 15 ++++-----------
>  include/hw/acpi/ghes.h |  5 +++--
>  target/arm/kvm.c       | 10 +++-------
>  4 files changed, 13 insertions(+), 23 deletions(-)
> 
> diff --git a/hw/acpi/ghes-stub.c b/hw/acpi/ghes-stub.c
> index 4faf573aeb..4ef914ffc5 100644
> --- a/hw/acpi/ghes-stub.c
> +++ b/hw/acpi/ghes-stub.c
> @@ -11,10 +11,10 @@
>  #include "qemu/osdep.h"
>  #include "hw/acpi/ghes.h"
>  
> -int acpi_ghes_memory_errors(AcpiGhesState *ags, uint16_t source_id,
> -                            uint64_t *addresses, uint32_t num_of_addresses)
> +void acpi_ghes_memory_errors(AcpiGhesState *ags, uint16_t source_id,
> +                             uint64_t *addresses, uint32_t num_of_addresses,
> +                             Error **errp)
>  {
> -    return -1;
>  }
>  
>  AcpiGhesState *acpi_ghes_get_state(void)
> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> index 055e5d719a..aa469c03f2 100644
> --- a/hw/acpi/ghes.c
> +++ b/hw/acpi/ghes.c
> @@ -543,8 +543,9 @@ void ghes_record_cper_errors(AcpiGhesState *ags, const void *cper, size_t len,
>      notifier_list_notify(&acpi_generic_error_notifiers, &source_id);
>  }
>  
> -int acpi_ghes_memory_errors(AcpiGhesState *ags, uint16_t source_id,
> -                            uint64_t *addresses, uint32_t num_of_addresses)
> +void acpi_ghes_memory_errors(AcpiGhesState *ags, uint16_t source_id,
> +                             uint64_t *addresses, uint32_t num_of_addresses,
> +                             Error **errp)
>  {
>      /* Memory Error Section Type */
>      const uint8_t guid[] =
> @@ -555,7 +556,6 @@ int acpi_ghes_memory_errors(AcpiGhesState *ags, uint16_t source_id,
>       * Table 17-13 Generic Error Data Entry
>       */
>      QemuUUID fru_id = {};
> -    Error *errp = NULL;
>      int data_length;
>      GArray *block;
>      uint32_t block_status, i;
> @@ -592,16 +592,9 @@ int acpi_ghes_memory_errors(AcpiGhesState *ags, uint16_t source_id,
>      }
>  
>      /* Report the error */
> -    ghes_record_cper_errors(ags, block->data, block->len, source_id, &errp);
> +    ghes_record_cper_errors(ags, block->data, block->len, source_id, errp);
>  
>      g_array_free(block, true);
> -
> -    if (errp) {
> -        error_report_err(errp);
> -        return -1;
> -    }
> -
> -    return 0;
>  }
>  
>  AcpiGhesState *acpi_ghes_get_state(void)
> diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
> index f73908985d..35c7bbbb01 100644
> --- a/include/hw/acpi/ghes.h
> +++ b/include/hw/acpi/ghes.h
> @@ -98,8 +98,9 @@ void acpi_build_hest(AcpiGhesState *ags, GArray *table_data,
>                       const char *oem_id, const char *oem_table_id);
>  void acpi_ghes_add_fw_cfg(AcpiGhesState *vms, FWCfgState *s,
>                            GArray *hardware_errors);
> -int acpi_ghes_memory_errors(AcpiGhesState *ags, uint16_t source_id,
> -                            uint64_t *addresses, uint32_t num_of_addresses);
> +void acpi_ghes_memory_errors(AcpiGhesState *ags, uint16_t source_id,
> +                             uint64_t *addresses, uint32_t num_of_addresses,
> +                             Error **errp);
>  void ghes_record_cper_errors(AcpiGhesState *ags, const void *cper, size_t len,
>                               uint16_t source_id, Error **errp);
>  
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 459ca4a9b0..a889315606 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -2458,13 +2458,9 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
>              addresses[0] = paddr;
>              if (code == BUS_MCEERR_AR) {
>                  kvm_cpu_synchronize_state(c);
> -                if (!acpi_ghes_memory_errors(ags, ACPI_HEST_SRC_ID_SYNC,
> -                                             addresses, 1)) {
> -                    kvm_inject_arm_sea(c);
> -                } else {
> -                    error_report("failed to record the error");
> -                    abort();
> -                }
> +                acpi_ghes_memory_errors(ags, ACPI_HEST_SRC_ID_SYNC,
> +                                        addresses, 1, &error_abort);
> +                kvm_inject_arm_sea(c);
>              }
>              return;
>          }


