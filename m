Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE479CCFA13
	for <qemu-arm@archiver.kernel.org>; Mon, 10 Nov 2025 14:54:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vITHb-0007a0-Mh; Mon, 10 Nov 2025 09:54:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vITHY-0007Tv-Lm
 for qemu-arm@nongnu.org; Mon, 10 Nov 2025 09:54:12 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vITHW-0000VM-Q2
 for qemu-arm@nongnu.org; Mon, 10 Nov 2025 09:54:12 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-47775fb6c56so21280405e9.1
 for <qemu-arm@nongnu.org>; Mon, 10 Nov 2025 06:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762786449; x=1763391249; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rP/HdlduQli2MA6b8mkBXJopg598/kTByBr7tf+9QKc=;
 b=uRUQgswbNEqt/j2o64J1P7JYFwU+GhLSAMg/JrSq4zL8nWMs0D4osLyth6i+YBjlpZ
 OPA3PJfi4UVXyomGTcsVFdpLsEQNgqMxGfQ3BnRP7415NbotiL8Xpl+BPnqv6AokQBUE
 deTEmSNv2Sz2jIUVMYmZAH62mkQE6mrFhqOLlLEf5SHEL+ccGcVi/y+HMCI4skpk4esR
 jGCtchCpJ5O9T3INCucrihSHeJt+AgYa6/hNRWqHiUSR8cJN461W+ZT7hgU0qzrEccSr
 o1uZIQwaNuDRGh/ptA1TR1NIZfstvECvuesVcnZ/q4djklZnS0k7MTUnbAGtbuN+RyhT
 QkVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762786449; x=1763391249;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rP/HdlduQli2MA6b8mkBXJopg598/kTByBr7tf+9QKc=;
 b=Mn4PabXfnzt/4wveydn4BEtSD0LDFo+MIbkLCDYMGZPBQhZFjONcsUCAoIfo4RhVRu
 oLB1S/EtaYS7logzNykw9AAQGaQOZ17hYOqcQHwjSfdaXURJAcOquLv2H/XZLOc0KZou
 rYiBGclKdb4nqsD5YebXM1KPxbf9B5dUVz+g2cfHzqvdrBi3iHIzJmxlU+bjXMc/hQgC
 caymokxhw8hcbH/zlLPDNZ4uTWBQJtKDZUupsRxnJxaLiTnZgHCtxe/1VyHRDwZh7Lss
 iAtsZXsxyq+JwD5r3Gk/puDHKyr0iNPOVUA5C3EMwFlIozJZ3EK9PyD7377l581yai1z
 Q0hA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXK7XJkxFM4sPOwfc7aW8C7XzrGF3fecDXdNUER+jOXNT9CkS/fvxEGy87agpJsOS2gsySSv8dqpA==@nongnu.org
X-Gm-Message-State: AOJu0YyqpFSaX9jLHEiNtlddYPQaNCv7Y4wOwYfrqx836vtqS89F2Vry
 DtGI7rVvG2K/DkX4KH2njhcVbqPT8TVecF0Cy0iaPVJtP+7zqtMn2viwxH/OTiexBbY=
X-Gm-Gg: ASbGncv0NAya7pDSbypVlX14A9WadRhBEY0Afc/bNiwFW6jyyjZyaevlnFNvYaicI2E
 MyFbzK0Fp5qX8OY5TT5kVKbTAx+pc7K6+Y8oO5rNvpb6KWEUoBSBCYDvXWj2zJTOKRkVUHStLOB
 xW5bEGJ3trMXIQ538CIFLNxxaPajhjJuPJJ2bWw5tRKuzVka5DQ4guIsixn4C8+P9sVNpPibUvI
 5de6z9dP9ju7UlMwmo58GzWf7gm6aLC/+lJTIucvtRf7Qp4rFOZ2Fj22GgJi6c/5dCCWCU93vhK
 i5QL4w26mWV+hMflRQnLv5JZl6frCY6GZ2El9ggVpG25WEe77Cvi6/9ykOV6WXfPrN5y+IRkGPy
 ZNdebsb7CqvdjxTZu5cbWheXOUHrnMr0Bzy/hFxUAut9RmAHxasbOFCapAiFJ0qeQv8yBHHZrio
 an5eSmALpo48Z9tvL4eah2EPIX5KaSM2rn1qlwQ2wf6+7ZKeMTWH26UwSqB359CBkZ1Q==
X-Google-Smtp-Source: AGHT+IE/F/SHDiPe05AsEpsAlOg9so5WCM/SjQHCkWwNEJRZhRJsINQyUIJWeNoQlMkRxaN5OO/kPA==
X-Received: by 2002:a05:600c:3507:b0:477:7a1a:4b79 with SMTP id
 5b1f17b1804b1-4777a1a4cd3mr40714275e9.37.1762786449015; 
 Mon, 10 Nov 2025 06:54:09 -0800 (PST)
Received: from [192.168.68.117] (anancy-654-1-85-43.w90-26.abo.wanadoo.fr.
 [90.26.70.43]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4775ce2cde0sm328139565e9.15.2025.11.10.06.54.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Nov 2025 06:54:08 -0800 (PST)
Message-ID: <2c3b388e-e002-466a-9b03-cafefcfc9d19@linaro.org>
Date: Mon, 10 Nov 2025 15:54:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/8] acpi/ghes: Use error_abort in
 acpi_ghes_memory_errors()
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, jonathan.cameron@huawei.com,
 mchehab+huawei@kernel.org, gengdongjiu1@gmail.com, mst@redhat.com,
 imammedo@redhat.com, anisinha@redhat.com, peter.maydell@linaro.org,
 pbonzini@redhat.com, shan.gavin@gmail.com,
 Markus Armbruster <armbru@redhat.com>
References: <20251105114453.2164073-1-gshan@redhat.com>
 <20251105114453.2164073-7-gshan@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251105114453.2164073-7-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 5/11/25 12:44, Gavin Shan wrote:
> Use error_abort in acpi_ghes_memory_errors() so that the caller needn't
> explicitly call abort() on errors. With this change, its return value
> isn't needed any more.
> 
> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>   hw/acpi/ghes-stub.c    |  6 +++---
>   hw/acpi/ghes.c         | 15 ++++-----------
>   include/hw/acpi/ghes.h |  5 +++--
>   target/arm/kvm.c       | 10 +++-------
>   4 files changed, 13 insertions(+), 23 deletions(-)


> diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
> index f73908985d..35c7bbbb01 100644
> --- a/include/hw/acpi/ghes.h
> +++ b/include/hw/acpi/ghes.h
> @@ -98,8 +98,9 @@ void acpi_build_hest(AcpiGhesState *ags, GArray *table_data,
>                        const char *oem_id, const char *oem_table_id);
>   void acpi_ghes_add_fw_cfg(AcpiGhesState *vms, FWCfgState *s,
>                             GArray *hardware_errors);
> -int acpi_ghes_memory_errors(AcpiGhesState *ags, uint16_t source_id,
> -                            uint64_t *addresses, uint32_t num_of_addresses);
> +void acpi_ghes_memory_errors(AcpiGhesState *ags, uint16_t source_id,
> +                             uint64_t *addresses, uint32_t num_of_addresses,
> +                             Error **errp);

This is an anti-pattern w.r.t. commit e3fe3988d78 ("error: Document
Error API usage rules"), because it can be called with an errp distinct
of &error_abort.

If you really want to abort(), remove the errp argument, directly call
abort() and rename as acpi_ghes_memory_abort_on_errors().

>   void ghes_record_cper_errors(AcpiGhesState *ags, const void *cper, size_t len,
>                                uint16_t source_id, Error **errp);
>   
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 459ca4a9b0..a889315606 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -2458,13 +2458,9 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
>               addresses[0] = paddr;
>               if (code == BUS_MCEERR_AR) {
>                   kvm_cpu_synchronize_state(c);
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
>               }
>               return;
>           }


