Received: by 10.223.134.117 with SMTP id 50csp5466527wrw;
        Thu, 28 Dec 2017 04:29:32 -0800 (PST)
X-Google-Smtp-Source: ACJfBot9WbMSlUtE7cO6ACIS+vLUUA6prCqvkqGokZwgk4ZHb3EJ3/rmTDdXjTWV6znJsR4iNhFa
X-Received: by 10.99.143.67 with SMTP id r3mr27370413pgn.224.1514464172462;
        Thu, 28 Dec 2017 04:29:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1514464172; cv=none;
        d=google.com; s=arc-20160816;
        b=R+bVP0UwBzp0qBHXBHJApSNdstGEcR3uEhgsvcnPRCM3jhVdN9dzUCTnuOegGMza6u
         PBG+L4paaR+WtgjOlcNYTGoVaS/uEA2M2h+OTjkL8tQ9+uGql/sVYTr7Glrx0PrYaHVF
         W0MTeQ3sTuDAClNJc8bW6RKehqrYZMNFS1QkvSS6352jbSYkYDYtd4t9aWQsThPx87Sa
         aSMsaZj5LeJp5zAKGUsFu18OdL1TaeCl5ZA4AvQKnBOpE4HkHRUdhsFh6hdnJLz1V070
         u/OsD5TMdn/tetTWmrK37IYMNm9PbGyb5KrXvshP9Dv+LGuA9Blx5dXUcwjYZoPhMKiW
         DvJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:subject:cc:to:from:date
         :arc-authentication-results;
        bh=Wu/33ILcpqvoocm740hGPIVf9lh1bdetnmb3Ogt49Zw=;
        b=IgQmA9GosWDYYGM7yBwWhuR3FZeNYkDZnyge3VQOu1I8nKdtRgDZ26JfNVOHL95B/S
         FDJVOKly7w1k394muBHIGJr0e4PDGKNP7BFrWkgYc9CesIXc3Y3unNGSP7iyW9xM2sjB
         ax1tmLQkHWe8nX3V/K3jUzzKoCm5rC6QeSdxzP8BWpl2g3eMCVb59/NUhXOlos88prMS
         lVREYEir7PL1229x97/LXSKyMaoO2hcq6zXAbroB/oyWFWVsQuG185vV/vC9uhC3+vwr
         Sitlsm5YMUebDG3nsI9BngL/0KmP5Y71qbHPWDbzDi14TnvA+A2LGUPt0dwPndTecG1r
         Ro8w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id r66si26526092pfi.217.2017.12.28.04.29.32;
        Thu, 28 Dec 2017 04:29:32 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753006AbdL1M3a (ORCPT <rfc822;francois.ozog@linaro.org>
        + 5 others); Thu, 28 Dec 2017 07:29:30 -0500
Received: from mx1.redhat.com ([209.132.183.28]:37146 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751431AbdL1M32 (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 28 Dec 2017 07:29:28 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 42E90C0587FD;
        Thu, 28 Dec 2017 12:29:28 +0000 (UTC)
Received: from igors-macbook-pro.local (ovpn-112-23.ams2.redhat.com [10.36.112.23])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1E8A8600D2;
        Thu, 28 Dec 2017 12:29:13 +0000 (UTC)
Date:   Thu, 28 Dec 2017 13:29:10 +0100
From:   Igor Mammedov <imammedo@redhat.com>
To:     Dongjiu Geng <gengdongjiu@huawei.com>
Cc:     <pbonzini@redhat.com>, <mst@redhat.com>,
        <zhaoshenglong@huawei.com>, <peter.maydell@linaro.org>,
        <mtosatti@redhat.com>, <rth@twiddle.net>, <ehabkost@redhat.com>,
        <james.morse@arm.com>, <christoffer.dall@linaro.org>,
        <marc.zyngier@arm.com>, <kvm@vger.kernel.org>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
        <huangshaoyu@huawei.com>, <zhengqiang10@huawei.com>,
        <xuwei5@hisilicon.com>
Subject: Re: [PATCH v14 1/9] ACPI: add some GHES structures and macros
 definition
Message-ID: <20171228132910.6594110a@igors-macbook-pro.local>
In-Reply-To: <1514440458-10515-2-git-send-email-gengdongjiu@huawei.com>
References: <1514440458-10515-1-git-send-email-gengdongjiu@huawei.com>
        <1514440458-10515-2-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Thu, 28 Dec 2017 12:29:28 +0000 (UTC)
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: /vygE4NK57wf

On Thu, 28 Dec 2017 13:54:10 +0800
Dongjiu Geng <gengdongjiu@huawei.com> wrote:

> Add Generic Error Status Block structures and some macros
> definitions, which is referred to the ACPI 4.0 or ACPI 6.1. The
> HEST table generation and CPER record will use them.
> 
> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
> ---
> Change since v13:
> 1. Clean the new added structures and macros definition
> 
> Change since v12:
> 1. Address Igor's comments to to get rid of most structures and use
> build_append_int_noprefix() API to compose whole error status block
> and APEI table in [1]
> 
> [1]: https://lkml.org/lkml/2017/8/29/187
> ---
>  include/hw/acpi/acpi-defs.h | 52 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 
> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> index 72be675..fb2110c 100644
> --- a/include/hw/acpi/acpi-defs.h
> +++ b/include/hw/acpi/acpi-defs.h
> @@ -298,6 +298,25 @@ typedef struct AcpiMultipleApicTable AcpiMultipleApicTable;
>  #define ACPI_APIC_RESERVED              16   /* 16 and greater are reserved */
>  
>  /*
> + * Hardware Error Notification
> + */
> +enum AcpiHestNotifyType {
> +    ACPI_HEST_NOTIFY_POLLED = 0,
> +    ACPI_HEST_NOTIFY_EXTERNAL = 1,
> +    ACPI_HEST_NOTIFY_LOCAL = 2,
> +    ACPI_HEST_NOTIFY_SCI = 3,
> +    ACPI_HEST_NOTIFY_NMI = 4,
> +    ACPI_HEST_NOTIFY_CMCI = 5,  /* ACPI 5.0 */
for stuff coming from spec comment should be something like this
/* ACPI 1.0b: 16.2.5.3 Type 1 Opcodes Encoding: DefReturn */

i.e. concrete version, chapter/table
otherwise it could be hard to find definition in huge spec 

> +    ACPI_HEST_NOTIFY_MCE = 6,   /* ACPI 5.0 */
> +    ACPI_HEST_NOTIFY_GPIO = 7,  /* ACPI 6.0 */
> +    ACPI_HEST_NOTIFY_SEA = 8,   /* ACPI 6.1 */
> +    ACPI_HEST_NOTIFY_SEI = 9,   /* ACPI 6.1 */
> +    ACPI_HEST_NOTIFY_GSIV = 10, /* ACPI 6.1 */
> +    ACPI_HEST_NOTIFY_SDEI = 11, /* ACPI 6.2 */
> +    ACPI_HEST_NOTIFY_RESERVED = 12 /* 12 and greater are reserved */
> +};
> +
> +/*
>   * MADT sub-structures (Follow MULTIPLE_APIC_DESCRIPTION_TABLE)
>   */
>  #define ACPI_SUB_HEADER_DEF   /* Common ACPI sub-structure header */\
> @@ -474,6 +493,39 @@ struct AcpiSystemResourceAffinityTable {
>  } QEMU_PACKED;
>  typedef struct AcpiSystemResourceAffinityTable AcpiSystemResourceAffinityTable;
>  
> +/*
> + * Generic Error Status Block
> + */
> +struct AcpiGenericErrorStatus {
> +    /* It is a bitmask composed of ACPI_GEBS_xxx macros */
> +    uint32_t block_status;
> +    uint32_t raw_data_offset;
> +    uint32_t raw_data_length;
> +    uint32_t data_length;
> +    uint32_t error_severity;
> +} QEMU_PACKED;
> +typedef struct AcpiGenericErrorStatus AcpiGenericErrorStatus;
> +
> +/*
> + * Masks for Block Status field above
> + */
> +#define ACPI_GEBS_UNCORRECTABLE          (1)
() are usually used with an expression and not with single value,
so drop that to be consistent with style of the header

> +
> +/*
> + * Value for Error Severity field above
> + */
> +enum AcpiGenericErrorSeverity {
> +    ACPI_CPER_SEV_RECOVERABLE,
> +    ACPI_CPER_SEV_FATAL,
> +    ACPI_CPER_SEV_CORRECTED,
> +    ACPI_CPER_SEV_NONE,
> +};
> +
> +/*
> + * Generic Hardware Error Source version 2
> + */
> +#define ACPI_HEST_SOURCE_GENERIC_ERROR_V2    (10)
ditto

> +
>  #define ACPI_SRAT_PROCESSOR_APIC     0
>  #define ACPI_SRAT_MEMORY             1
>  #define ACPI_SRAT_PROCESSOR_x2APIC   2
