Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp718804njc;
        Tue, 20 May 2025 11:59:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWg1aidn+yvOrGy+2J7rtvMp87EZhU31HyRc8dqT4+UhHr1GJrCKpOmJyhP1OKdQjDrwWkHK10NU40TsA==@linaro.org
X-Google-Smtp-Source: AGHT+IGbvJxmJwjZLyn9x4xvambrybh/I7trayV1vPr4H0u2NQQu0O8W0978tJECvhh2ZdEkUaqD
X-Received: by 2002:a05:6214:cc2:b0:6f8:ac64:64ca with SMTP id 6a1803df08f44-6f8b0828750mr260621606d6.6.1747767553206;
        Tue, 20 May 2025 11:59:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747767553; cv=none;
        d=google.com; s=arc-20240605;
        b=czpFhl4kV2mnhIM5Nprwn6lA8i/sGMfEVa1BFCSKhecTNYhXuRpHCM+rG2XowdbOkK
         a/KkpELw33iEhjB9EboByZYI/lZLXajEKuEh6MkrWUXIBzDE9uZHNdvPD9RTkOGFidJF
         aAqhA9m1CAO1DhJbhQtVqmXlENpZI1bxRsT+yvj+Na6vcozQF0U3+2uQEZ0rEfxZa1XG
         bBJcqN8sOY27fNAbSrw0oHRe7IA0GYooHNCtvVbWT8abxE70CtyNtwvnwfByGYeGYPjM
         6Rsdbcjotp96HLQgPfuHTuRrI7ag4PGpw2h0RbtoRJdhQ5MP1uwNvwKnmz67NodVibfl
         tgSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=9rTivP8jDdK7RJ74edePZCyMdvPAUiRIA4dxTeTZtPg=;
        fh=1+nKkh3BwTL8wT499RKzFvUCywG4VNPmgUgGC/ib6H4=;
        b=Bs9RF3ZTNU5tASXSOR71mV7xAwYcp0FhOOgoLKPFqT8WAp7ordOHV5432icEjZsaCG
         fgqy3AOT+j1vXZtevWnWGZzkhq25lnvr2H/j1H5W1jb5jv5sOgJSdEkLNEnxXSAimcc/
         FYVhnAUoJO+0P5uWrLp1vqCxjoMPqKTy3cH/Jt0t9hf7YSRJTxVyNGVR+QcZiYo2u/AD
         9thtbhUUbO/a/kzv7WZ+u1mGMvV1Lsnr34YwJy+IxxUInwBKMT8tHOL6km1JATUGvkRi
         7MNrE8RSRYNNRaKY90PcGev9vF6uoTCgdf9Mc0YkkNGN1tQR5HYXfqpmoJ1ADxUdoBWP
         I69Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xx1on8Yk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f8b08a0a75si110154476d6.39.2025.05.20.11.59.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 May 2025 11:59:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xx1on8Yk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uHSAj-0007S0-Hv; Tue, 20 May 2025 14:58:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uHSAb-0007PY-6Z
 for qemu-arm@nongnu.org; Tue, 20 May 2025 14:58:34 -0400
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uHSAY-0006tZ-V0
 for qemu-arm@nongnu.org; Tue, 20 May 2025 14:58:32 -0400
Received: by mail-ua1-x933.google.com with SMTP id
 a1e0cc1a2514c-875b8e006f8so1655367241.0
 for <qemu-arm@nongnu.org>; Tue, 20 May 2025 11:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747767507; x=1748372307; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9rTivP8jDdK7RJ74edePZCyMdvPAUiRIA4dxTeTZtPg=;
 b=xx1on8Yk7ptHruD7rDi8SYcrfNPZrs2fu6PWNGR0JpC2xPm1laenMRsWMDxJ4Hv+3M
 4Es9IfrcPmHZZVUEJleCIqRWBb0DjE99cAcOrHexLTNo562kKrms9UlXRcb8H/DAi2bI
 F/dZxViOd6HX1Ldk+STF6n4ZDTBx2X1Ri5AWwomUCLi9Fi+P3XkvuD82+pFY7pjLIHEX
 jqz1tMEJU/LgL9wmceQgRdNFuLSeMG71AHUVlVRvmJkpmqmfIh4+AP5geQEKOwBNq82s
 5xdHLiRXFwazwk4DgDDWnTRe3JjxWsNkcD97IrNLoORyaqhZLQJZvy5YfniCSrUZFGhG
 OMTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747767507; x=1748372307;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9rTivP8jDdK7RJ74edePZCyMdvPAUiRIA4dxTeTZtPg=;
 b=AqNGN1FdmS36wn8/McmvN7aqabmLN5leZ6dzHann1H/SozAoR2tTkQYmvSHTHklwSM
 cBsWZPHoN7pLdXF3Wsk9WuJT+rHdX09u0ilALewmr/uPAZ7928Iz+pNlDPwsJNAL/Aq0
 eAL2FPOUKv6eCm0EOMs3DULXdY2iKrs+JNqSYP6pSIKUWyS9V9mmppNGfKNOfLNFM5C2
 CsVDdSrf5ttYSoVEFEUwwRAbuYwVttUbMFT/wDlIvEpqlxL5UquOgS0jTxKPOHTXeSvz
 cz6+GUpP84+uGjrackEFwWKev6Pm8YETiRm9XmoLu1Hg2P5NHc/f/TpGi+CnI9eajEK0
 w4VQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3MaqmuMCrJ3mNeMeqYj3IRoLKz9enaEBLJ8BVmtxxzapFRdnqp5a1gQoCl9f7g/U7eDmKu5oU9A==@nongnu.org
X-Gm-Message-State: AOJu0Yzq3jFJk1Mvb66nNdgYYudVDEthe+TIm1aINQbPx72tWypURaOC
 QsSPHRiPZdULXPIweIhCJ5JQKs92NZPAvnnAjel8aCryJNwVCjAiiqSbrzRPUtv2yZk=
X-Gm-Gg: ASbGncvPjo4weIgv3XRFrMJGQhZIE8u67Ee8QmdiUwDrUqzvQwsjOcSdBPT2RrgUscB
 vI+blvGeP5XP/vs0YlZNGcL02g2a1VrrMzdgWP7xX9kzRsRWeXAu++F1wxEjVHggqr0qde6k6SS
 UixqmDdUyUB8dagbpxXijxgtqZaA8kcKMo9w0WnhcLWB9w0/HVWm8nfHe+9vs0HF/KhpTxbSmSa
 wvs1gYESz/OuSpnoz2MhO8qeZ3J5ZKM+Raw2XPrxN/JxWBT1WdrHdtff8dx0jBWD1IwO3Rd67na
 mUdmnLnLk1+VIAIcYZULetU7ggNNruHne0StL9FEmypbroY7+j+79QoI5vjP3CQouMQH8v/XixI
 lZ33j4CIDOxJOyQnblB5hSzcpg0mI/Q==
X-Received: by 2002:a05:6102:3054:b0:4df:8f09:7d8f with SMTP id
 ada2fe7eead31-4dfa6c10808mr17835232137.17.1747767507361; 
 Tue, 20 May 2025 11:58:27 -0700 (PDT)
Received: from ?IPV6:2804:7f0:b401:d47f:6989:b93e:2caa:f174?
 ([2804:7f0:b401:d47f:6989:b93e:2caa:f174])
 by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-87bec22768fsm7864458241.30.2025.05.20.11.58.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 11:58:26 -0700 (PDT)
Message-ID: <4e851e3b-169d-4119-b344-b570cb562fb8@linaro.org>
Date: Tue, 20 May 2025 15:58:14 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/22] hw/acpi/pcihp: Add an AmlRegionSpace arg to
 build_acpi_pci_hotplug
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 imammedo@redhat.com, anisinha@redhat.com, mst@redhat.com,
 shannon.zhaosl@gmail.com
Cc: pbonzini@redhat.com, Jonathan.Cameron@huawei.com, philmd@linaro.org
References: <20250514170431.2786231-1-eric.auger@redhat.com>
 <20250514170431.2786231-11-eric.auger@redhat.com>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <20250514170431.2786231-11-eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::933;
 envelope-from=gustavo.romero@linaro.org; helo=mail-ua1-x933.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: vpQG90cXrHjY

Hi Eric,

On 5/14/25 14:00, Eric Auger wrote:
> On ARM we will put the operation regions in AML_SYSTEM_MEMORY.
> So let's allow this configuration.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>   include/hw/acpi/pcihp.h | 3 ++-
>   hw/acpi/pcihp.c         | 8 ++++----
>   hw/i386/acpi-build.c    | 4 ++--
>   3 files changed, 8 insertions(+), 7 deletions(-)

Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>


Cheers,
Gustavo

> diff --git a/include/hw/acpi/pcihp.h b/include/hw/acpi/pcihp.h
> index ec9b010e4a..525e61a2a9 100644
> --- a/include/hw/acpi/pcihp.h
> +++ b/include/hw/acpi/pcihp.h
> @@ -28,6 +28,7 @@
>   #define HW_ACPI_PCIHP_H
>   
>   #include "hw/acpi/acpi.h"
> +#include "hw/acpi/aml-build.h"
>   #include "hw/hotplug.h"
>   
>   #define ACPI_PCIHP_IO_BASE_PROP "acpi-pcihp-io-base"
> @@ -73,7 +74,7 @@ void acpi_pcihp_device_unplug_request_cb(HotplugHandler *hotplug_dev,
>                                            AcpiPciHpState *s, DeviceState *dev,
>                                            Error **errp);
>   
> -void build_acpi_pci_hotplug(Aml *table, uint64_t pcihp_addr);
> +void build_acpi_pci_hotplug(Aml *table, AmlRegionSpace rs, uint64_t pcihp_addr);
>   void build_append_pci_dsm_func0_common(Aml *ctx, Aml *retvar);
>   void build_append_pcihp_resources(Aml *table,
>                                     uint64_t io_addr, uint64_t io_len);
> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> index fb54c31f77..310a5c54bd 100644
> --- a/hw/acpi/pcihp.c
> +++ b/hw/acpi/pcihp.c
> @@ -629,7 +629,7 @@ static Aml *aml_pci_pdsm(void)
>       return method;
>   }
>   
> -void build_acpi_pci_hotplug(Aml *table, uint64_t pcihp_addr)
> +void build_acpi_pci_hotplug(Aml *table, AmlRegionSpace rs, uint64_t pcihp_addr)
>   {
>       Aml *scope;
>       Aml *field;
> @@ -638,21 +638,21 @@ void build_acpi_pci_hotplug(Aml *table, uint64_t pcihp_addr)
>       scope =  aml_scope("_SB.PCI0");
>   
>       aml_append(scope,
> -        aml_operation_region("PCST", AML_SYSTEM_IO, aml_int(pcihp_addr), 0x08));
> +        aml_operation_region("PCST", rs, aml_int(pcihp_addr), 0x08));
>       field = aml_field("PCST", AML_DWORD_ACC, AML_NOLOCK, AML_WRITE_AS_ZEROS);
>       aml_append(field, aml_named_field("PCIU", 32));
>       aml_append(field, aml_named_field("PCID", 32));
>       aml_append(scope, field);
>   
>       aml_append(scope,
> -        aml_operation_region("SEJ", AML_SYSTEM_IO,
> +        aml_operation_region("SEJ", rs,
>                                aml_int(pcihp_addr + ACPI_PCIHP_SEJ_BASE), 0x04));
>       field = aml_field("SEJ", AML_DWORD_ACC, AML_NOLOCK, AML_WRITE_AS_ZEROS);
>       aml_append(field, aml_named_field("B0EJ", 32));
>       aml_append(scope, field);
>   
>       aml_append(scope,
> -        aml_operation_region("BNMR", AML_SYSTEM_IO,
> +        aml_operation_region("BNMR", rs,
>                                aml_int(pcihp_addr + ACPI_PCIHP_BNMR_BASE), 0x08));
>       field = aml_field("BNMR", AML_DWORD_ACC, AML_NOLOCK, AML_WRITE_AS_ZEROS);
>       aml_append(field, aml_named_field("BNUM", 32));
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index ca59185aac..87bb3d5cee 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -1172,7 +1172,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>           aml_append(dsdt, sb_scope);
>   
>           if (pm->pcihp_bridge_en || pm->pcihp_root_en) {
> -            build_acpi_pci_hotplug(dsdt, pm->pcihp_io_base);
> +            build_acpi_pci_hotplug(dsdt, AML_SYSTEM_IO, pm->pcihp_io_base);
>           }
>           build_piix4_pci0_int(dsdt);
>       } else if (q35) {
> @@ -1216,7 +1216,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>           aml_append(dsdt, sb_scope);
>   
>           if (pm->pcihp_bridge_en) {
> -            build_acpi_pci_hotplug(dsdt, pm->pcihp_io_base);
> +            build_acpi_pci_hotplug(dsdt, AML_SYSTEM_IO, pm->pcihp_io_base);
>           }
>           build_q35_pci0_int(dsdt);
>       }

