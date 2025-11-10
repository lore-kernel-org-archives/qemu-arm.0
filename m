Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB207CCF9E3
	for <qemu-arm@archiver.kernel.org>; Mon, 10 Nov 2025 14:39:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vIT2y-0006LF-Un; Mon, 10 Nov 2025 09:39:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1vIT23-0005ZA-G7
 for qemu-arm@nongnu.org; Mon, 10 Nov 2025 09:38:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1vIT20-0005yq-Ow
 for qemu-arm@nongnu.org; Mon, 10 Nov 2025 09:38:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762785487;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K4GS7fn1S9YeKvda3j/UgsNJqCahsWDHJF0g1vNTqRw=;
 b=DLFj4MWejG+WIEcEQQ/PIpsa/S29VBIuAb+ufR8Z/vPHGv9/DjC3zwtax7oZRyQduSbW6x
 W1lRC/e/lUQ0JNENTuz2XZ4nxGdMWRe5+eSGiyQ/i2u6fHBlAJww+ybuoLOSXtLaaT00He
 cGc288CwvuugwqDxXpQ9Sl+eEucQhbA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-17-WAiJIjq3O3S7YRcyKeJo6g-1; Mon, 10 Nov 2025 09:38:05 -0500
X-MC-Unique: WAiJIjq3O3S7YRcyKeJo6g-1
X-Mimecast-MFC-AGG-ID: WAiJIjq3O3S7YRcyKeJo6g_1762785484
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-47775585257so14243285e9.1
 for <qemu-arm@nongnu.org>; Mon, 10 Nov 2025 06:38:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762785484; x=1763390284;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=K4GS7fn1S9YeKvda3j/UgsNJqCahsWDHJF0g1vNTqRw=;
 b=f3wVMu5XGhZzpvOWAJvaSQG7FMyqjV9xYqnhSvAtVefCyf9sXFIBhz/xv0vpNTHlI2
 7+5zJXxvFlfsT+rBaRI1mLiInnIMPE3eMc7qB/Zdw4Xe+r7d5IAj3wN7/rxOJIXG15tu
 X8fHaHnpuooDglg3eerXOe7KhqRbStwPGc40+8WpSsOEn1Pxrt3n0YR7Oy/EnjVzhJcF
 XNJ7isrL76hrBKQXc9uTVcw8LiIpMmxf9g+RABQ0NDWsmkL/7KgDpUANmnNX3AZCTkSY
 pVKS57UZqJGgVazL/OxgMawwxhfxY8WgN1Qq6NurulE0D8BzwTiWE5XZ/E6JMdelGJkp
 /7dA==
X-Gm-Message-State: AOJu0Yyoiij8SefuoDSCe03opc3d1UvL3FWZFKdJdvs9VS6XCI9WTLgQ
 yOQmjOBF0EzoQxfOAj7s+mbra9JSYBoE69iL4iyE8k56gMt/v2B8741jUCYjC4TBHhgq7+udCmT
 ea8dcnDk7n2ePwn6AiCfUz3Fg4S260YuuayDZ3c/RdbwiOiBrsR77tw==
X-Gm-Gg: ASbGncuy8uPnDnRUzoJt0EjsRBA1W1d6ISVTgS1txWS+CZruemxySpBbvHprKhiKMMa
 ZWqP3sd5JwWZ84Tx1z+YyAcA5N5vavcL+OIKiL8P7glSAao3+WoxU2/5asO9AueW/kc7fVBwf1B
 3OiyJG9BU77YXegZ7xKb2ED+jZ7Cl9mRsJzx5niGsnb8VCKM3/KiXOJe27Js9P3y0yRkpmFfn+u
 /WQ+oBX2bT3b0UD/UdR4ptGIWNbzKGLdQlQZOGjNtCeRUdJ8ZK4B4+BrXiXNzDPQDs7Niz0f27g
 5HWFXfI0YuZtq2CzsZ9eXt2czldtNE6eWhjC8MTsK1vLeXI45hUK8Kfz+ibdynaIhw==
X-Received: by 2002:a05:600c:1c15:b0:477:7c45:87b1 with SMTP id
 5b1f17b1804b1-4777c45885amr40492015e9.36.1762785484281; 
 Mon, 10 Nov 2025 06:38:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGrWDxmXO+y8oQiESfYpYdRStDfGw0ZEJ6ACBmHkCGkWNK1OgDLg23Al78K2ui6Q25CEIdC/w==
X-Received: by 2002:a05:600c:1c15:b0:477:7c45:87b1 with SMTP id
 5b1f17b1804b1-4777c45885amr40490655e9.36.1762785482509; 
 Mon, 10 Nov 2025 06:38:02 -0800 (PST)
Received: from fedora ([85.93.96.130]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4775cd45466sm320271685e9.0.2025.11.10.06.38.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Nov 2025 06:38:02 -0800 (PST)
Date: Mon, 10 Nov 2025 15:38:01 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, jonathan.cameron@huawei.com,
 mchehab+huawei@kernel.org, gengdongjiu1@gmail.com, mst@redhat.com,
 anisinha@redhat.com, peter.maydell@linaro.org, pbonzini@redhat.com,
 shan.gavin@gmail.com
Subject: Re: [PATCH v3 4/8] acpi/ghes: Extend acpi_ghes_memory_errors() to
 support multiple CPERs
Message-ID: <20251110153801.258be29d@fedora>
In-Reply-To: <20251105114453.2164073-5-gshan@redhat.com>
References: <20251105114453.2164073-1-gshan@redhat.com>
 <20251105114453.2164073-5-gshan@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uMr5RUhnePX5aXolHwc3MqNgmnGvJjncZr0nBMV24M8_1762785484
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

On Wed,  5 Nov 2025 21:44:49 +1000
Gavin Shan <gshan@redhat.com> wrote:

> In the situation where host and guest has 64KiB and 4KiB page sizes,
> one problematic host page affects 16 guest pages. we need to send 16
> consective errors in this specific case.

I still don't like it, since it won't fix anything in case of more than
1 broken host pages. (in v2 discussion quickly went hugepages route
and futility of recovering from them).

If having per vCPU source is not desirable,
can we stall all other vcpus that touch poisoned pages until
error is acked by guest and then let another VCPU to queue its own error?


> Extend acpi_ghes_memory_errors() to support multiple CPERs after the
> hunk of code to generate the GHES error status is pulled out from
> ghes_gen_err_data_uncorrectable_recoverable(). The status field of
> generic error status block is also updated accordingly if multiple
> error data entries are contained in the generic error status block.

I don't mind much translating 64K page error into several 4K CPER
records, so this part is fine. But it's hardly a solution to the generic
problem.

> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  hw/acpi/ghes-stub.c    |  2 +-
>  hw/acpi/ghes.c         | 60 +++++++++++++++++++++++-------------------
>  include/hw/acpi/ghes.h |  2 +-
>  target/arm/kvm.c       |  4 ++-
>  4 files changed, 38 insertions(+), 30 deletions(-)
> 
...
> @@ -577,10 +568,25 @@ int acpi_ghes_memory_errors(AcpiGhesState *ags, uint16_t source_id,
>      assert((data_length + ACPI_GHES_GESB_SIZE) <=
>              ACPI_GHES_MAX_RAW_DATA_LENGTH);
>  
> -    ghes_gen_err_data_uncorrectable_recoverable(block, guid, data_length);
> +    /* Build the new generic error status block header */
> +    block_status = (1 << ACPI_GEBS_UNCORRECTABLE) |
> +                   (num_of_addresses << ACPI_GEBS_ERROR_DATA_ENTRIES);
                       ^^^^^^^^^^^^^^
maybe assert in case it won't fit into bit field 

> +    if (num_of_addresses > 1) {
> +        block_status |= ACPI_GEBS_MULTIPLE_UNCORRECTABLE;
> +    }
> +
> +    acpi_ghes_generic_error_status(block, block_status, 0, 0,
> +                                   data_length, ACPI_CPER_SEV_RECOVERABLE);
>  
> -    /* Build the memory section CPER for above new generic error data entry */
> -    acpi_ghes_build_append_mem_cper(block, physical_address);
> +    for (i = 0; i < num_of_addresses; i++) {
> +        /* Build generic error data entries */
> +        acpi_ghes_generic_error_data(block, guid,
> +                                     ACPI_CPER_SEV_RECOVERABLE, 0, 0,
> +                                     ACPI_GHES_MEM_CPER_LENGTH, fru_id, 0);
> +
> +        /* Memory section CPER on top of the generic error data entry */
> +        acpi_ghes_build_append_mem_cper(block, addresses[i]);
> +    }
>  
>      /* Report the error */
>      ghes_record_cper_errors(ags, block->data, block->len, source_id, &errp);
> diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
> index df2ecbf6e4..f73908985d 100644
> --- a/include/hw/acpi/ghes.h
> +++ b/include/hw/acpi/ghes.h
> @@ -99,7 +99,7 @@ void acpi_build_hest(AcpiGhesState *ags, GArray *table_data,
>  void acpi_ghes_add_fw_cfg(AcpiGhesState *vms, FWCfgState *s,
>                            GArray *hardware_errors);
>  int acpi_ghes_memory_errors(AcpiGhesState *ags, uint16_t source_id,
> -                            uint64_t error_physical_addr);
> +                            uint64_t *addresses, uint32_t num_of_addresses);
>  void ghes_record_cper_errors(AcpiGhesState *ags, const void *cper, size_t len,
>                               uint16_t source_id, Error **errp);
>  
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 0d57081e69..459ca4a9b0 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -2434,6 +2434,7 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
>      ram_addr_t ram_addr;
>      hwaddr paddr;
>      AcpiGhesState *ags;
> +    uint64_t addresses[16];
>  
>      assert(code == BUS_MCEERR_AR || code == BUS_MCEERR_AO);
>  
> @@ -2454,10 +2455,11 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
>               * later from the main thread, so doing the injection of
>               * the error would be more complicated.
>               */
> +            addresses[0] = paddr;
>              if (code == BUS_MCEERR_AR) {
>                  kvm_cpu_synchronize_state(c);
>                  if (!acpi_ghes_memory_errors(ags, ACPI_HEST_SRC_ID_SYNC,
> -                                             paddr)) {
> +                                             addresses, 1)) {
>                      kvm_inject_arm_sea(c);
>                  } else {
>                      error_report("failed to record the error");


