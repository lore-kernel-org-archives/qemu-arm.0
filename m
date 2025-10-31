Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF35BCCF9FE
	for <qemu-arm@archiver.kernel.org>; Fri, 31 Oct 2025 13:26:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vEp90-00038D-S7; Fri, 31 Oct 2025 09:26:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1vEp8v-00034e-Qj
 for qemu-arm@nongnu.org; Fri, 31 Oct 2025 09:26:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1vEp8j-0005AG-TU
 for qemu-arm@nongnu.org; Fri, 31 Oct 2025 09:26:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761917151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5A4vcIXrO0+DoGsgFR10gkswUrJvj7BksF5ooRCR8QA=;
 b=CPp9WQROWCynhBBJ8OqpYsqzG0+yAMovxNFIUe+Yi9zGPQ6OYs1+CXZnAjEX8H+ebSkGpW
 1C82IbBO7mv4i9n7JtfCyAvELIKMWhZsZmwtxhhCcSOLoUSxiOOesltTezPih9Ebz4N+yW
 u/adgd7hQKn2Qyq+/Qm7iDA5JyMbJXg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-575-oLxLMc3CPES6Tw7Q4qs8lQ-1; Fri, 31 Oct 2025 09:25:49 -0400
X-MC-Unique: oLxLMc3CPES6Tw7Q4qs8lQ-1
X-Mimecast-MFC-AGG-ID: oLxLMc3CPES6Tw7Q4qs8lQ_1761917148
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4721b4f3afbso7073325e9.0
 for <qemu-arm@nongnu.org>; Fri, 31 Oct 2025 06:25:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761917148; x=1762521948;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5A4vcIXrO0+DoGsgFR10gkswUrJvj7BksF5ooRCR8QA=;
 b=TsZS0C2wchnRtdCrMF77BiqASvWZdBigdsWf+iOKoaKcX4AHwgN7QK6ZPJSDJSaFA2
 aoJ/ov55VwlOvYFSVMY7JMhpbtW9eL8I0v0OETqRH7JxWeDNDSMYi3UFTdo5KiG9+r1B
 zyJNt4jy571MPqRqd0BU2BVd51uj4drwLl9XDVw+7GXsnib+TY5IKMQNbDQpBvaVT6WQ
 abWAGBfOyeFCbQK9cd6W4N1UiSAth4GijqRp1tLnK8XjdPRDkiZusF6IpyvTkJ4JTYpS
 lt3sXGdXZaxsK7Z4tm71/iLEt46FDdqZCpOsRBqkkl0mfpypA4518ADCWe2rXkEse1pT
 te1w==
X-Gm-Message-State: AOJu0Yxj8UB7W7HRc8+KyD7JlmOcnbGAzS4WToxnvq4hm0WERCuNy+wk
 3dzn/Q97KfOj+V+nsrK2LXpgvRDIX/DCw0u8cjo2kwDZ45Yetzosbks6eX+rgknONfWn85NJRc3
 WcZ0pMaIqzEfrjAms33DprJLfkw2lJpydp866WGoEV9FJD1hHUmN34A==
X-Gm-Gg: ASbGncu6eEF3zezDmSdXJh25ExJyPuVxRrPScfd4RfDFffplFMtMBgdgVSHqgrDpdDS
 AfRKA6pgP6XwlyLuoc9e4Fp1c0u50NgXhx/cLPXYtUJwAzCy72acqzfJzvrgz5kAOheN51GXhBz
 Jh1PAv9a08mbrGkclmQK6a+x3cYePnQadKG7dp53jwKthMUNrBiqgpbgbE9tox5IXeDUYFq8Bh3
 2K7jwhgfMdBR81rb8YNpXQMBmgM0U0j7FNajO+ssjvOqzIlLXAd22cJQU/8vPoI0k+P6bf9PnCu
 0g6YhICPsSb4hqqMk4aMr4fc+MxzROoDgrQMh0SvPwyb37Mm4AdE15JdQ3f3xJvycw==
X-Received: by 2002:a05:600c:a0b:b0:476:57b4:72b6 with SMTP id
 5b1f17b1804b1-477305a6db5mr38026065e9.8.1761917148395; 
 Fri, 31 Oct 2025 06:25:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE64A1nYxU+3C6WFnvizMo5GJ9zyOxs5/ZmTCKYp1O6Q4tIVv35LCWO0zuHlCSSEOOxgBluyA==
X-Received: by 2002:a05:600c:a0b:b0:476:57b4:72b6 with SMTP id
 5b1f17b1804b1-477305a6db5mr38025705e9.8.1761917147913; 
 Fri, 31 Oct 2025 06:25:47 -0700 (PDT)
Received: from fedora ([85.93.96.130]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47728aa915asm91132635e9.16.2025.10.31.06.25.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 06:25:47 -0700 (PDT)
Date: Fri, 31 Oct 2025 14:25:43 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, mst@redhat.com,
 anisinha@redhat.com, gengdongjiu1@gmail.com, peter.maydell@linaro.org,
 pbonzini@redhat.com, mchehab+huawei@kernel.org,
 Jonathan.Cameron@huawei.com, shan.gavin@gmail.com
Subject: Re: [PATCH RESEND v2 2/3] kvm/arm/kvm: Introduce helper
 push_ghes_memory_errors()
Message-ID: <20251031142543.0c7d384f@fedora>
In-Reply-To: <20251007060810.258536-3-gshan@redhat.com>
References: <20251007060810.258536-1-gshan@redhat.com>
 <20251007060810.258536-3-gshan@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XinEHa3y-C0vO_Nu0YCADwCiOHg4Nn781CpZE4-xOGg_1761917148
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

On Tue,  7 Oct 2025 16:08:09 +1000
Gavin Shan <gshan@redhat.com> wrote:

> Introduce helper push_ghes_memory_errors(), which sends ACPI GHES memory
> errors, injects SEA exception or aborts on errors. This function will
> be extended to support multiple ACPI GHES memory errors in the next
> path.
> 
> No functional changes intended.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  target/arm/kvm.c | 36 ++++++++++++++++++++++++------------
>  1 file changed, 24 insertions(+), 12 deletions(-)
> 
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 9a47ac9e3a..c5d5b3b16e 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -2429,12 +2429,34 @@ int kvm_arch_get_registers(CPUState *cs, Error **errp)
>      return ret;
>  }
>  
> +static void push_ghes_memory_errors(CPUState *c, AcpiGhesState *ags,
> +                                    uint64_t paddr)
> +{
> +    GArray *addresses = g_array_new(false, false, sizeof(paddr));
> +    int ret;
> +
> +    kvm_cpu_synchronize_state(c);
> +    g_array_append_vals(addresses, &paddr, 1);
> +    ret = acpi_ghes_memory_errors(ags, ACPI_HEST_SRC_ID_SYNC, addresses);
> +    if (ret) {
> +        goto error;

perhaps use &error_abort and use it right here instead of goto
or even more cleaner: pass  &error_abort as arg to acpi_ghes_memory_errors()
and drop not needed 'if's & return value

> +    }
> +
> +    kvm_inject_arm_sea(c);
> +
> +    g_array_free(addresses, true);
> +
> +    return;
> +error:
> +    error_report("failed to record the error");
> +    abort();
> +}
> +
>  void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
>  {
>      ram_addr_t ram_addr;
>      hwaddr paddr;
>      AcpiGhesState *ags;
> -    GArray *addresses;
>  
>      assert(code == BUS_MCEERR_AR || code == BUS_MCEERR_AO);
>  
> @@ -2443,7 +2465,6 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
>          ram_addr = qemu_ram_addr_from_host(addr);
>          if (ram_addr != RAM_ADDR_INVALID &&
>              kvm_physical_memory_addr_from_host(c->kvm_state, addr, &paddr)) {
> -            addresses = g_array_new(false, false, sizeof(paddr));
>              kvm_hwpoison_page_add(ram_addr);
>              /*
>               * If this is a BUS_MCEERR_AR, we know we have been called
> @@ -2456,19 +2477,10 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
>               * later from the main thread, so doing the injection of
>               * the error would be more complicated.
>               */
> -            g_array_append_vals(addresses, &paddr, 1);
>              if (code == BUS_MCEERR_AR) {
> -                kvm_cpu_synchronize_state(c);
> -                if (!acpi_ghes_memory_errors(ags, ACPI_HEST_SRC_ID_SYNC,
> -                                             addresses)) {
> -                    kvm_inject_arm_sea(c);
> -                } else {
> -                    error_report("failed to record the error");
> -                    abort();
> -                }
> +                push_ghes_memory_errors(c, ags, paddr);
>              }
>  
> -            g_array_free(addresses, true);
>              return;
>          }
>          if (code == BUS_MCEERR_AO) {


