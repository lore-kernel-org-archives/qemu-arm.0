Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1843614wrg;
        Thu, 20 Jun 2019 05:11:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwNyC+ziXNDQ4oAdGEsu9wTzzYaJJjAGjxXMPZIZXkL/+qX/Ot1HMW2+26OwtBE0OCFxmD+
X-Received: by 2002:a17:902:740b:: with SMTP id g11mr13358508pll.265.1561032663586;
        Thu, 20 Jun 2019 05:11:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561032663; cv=none;
        d=google.com; s=arc-20160816;
        b=0wo3Uxwl/ZRzYYCZ3AiLel5eYfMsQPSjHh3IcwjTIhWqgU8NAXfSH3zyIOqJeQwvj2
         Z5IN3rFA1cXE1iWzIQCtbFpGYFIXnLYLHMbLqk5oFwqCVan7xpRt0pLjjTCCKuA3mZD0
         rXTU+RLa4pM570VcM91usRRc3WkHE2fmkh3s5sBTBKe7sGP960okiVAmSb507egudVMc
         KfJxbUX7zTo3nWdYWA7YMej3OPhJJ0oV6/v6yilb1Y5fftJYJEYwoX5QNbXxPgdXQV+H
         XvIk7FLvh0cb3drCOWdkuJ9wu/HTocV5pUDdtg7pJo1odyEW9+H4T36/zcWjJ9BAhwxO
         5ICQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:subject:cc:to:from:date;
        bh=4RaXVbBEZDVCFp5v/IIdbrYCBq2HwiZxFX9DHq/qh+0=;
        b=erAS3avV3K+24SEjoupQp8H8LVhBXY1Qj+9vBOEk/qwAvjNQ0epZJVQ+ZBEe3bPkPN
         udOQEMLndaYMvDnJow6IXuUq+/A1emswaPCnrKwL4hGl6AC2CNYLnAOndoeRnUiMrnQn
         hh8JFqKP4kgmefN015tQqfRFyJnEpC+oRWZ0NniccrrIEUcP375uSjW3EEOtur302aOx
         aK6SAW9R+ktUG9AnBn9eiZ9rUjqcaoNjy8tLbQxJdWfnbGfGOC4435zfO8Fz2DvfCK/e
         S1AqJV0JnYC9GeRJumizQZKwrtf6NyD26KdCFWCI0fMjfToN/8yIyF2nNHrYWbUx/eal
         tSYA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id d1si5745343pgb.24.2019.06.20.05.11.03;
        Thu, 20 Jun 2019 05:11:03 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731838AbfFTMLC (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 5 others); Thu, 20 Jun 2019 08:11:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36896 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726874AbfFTMLC (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 20 Jun 2019 08:11:02 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id B5DAA307D980;
        Thu, 20 Jun 2019 12:11:01 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 9657E608D0;
        Thu, 20 Jun 2019 12:10:56 +0000 (UTC)
Date:   Thu, 20 Jun 2019 14:10:52 +0200
From:   Igor Mammedov <imammedo@redhat.com>
To:     Dongjiu Geng <gengdongjiu@huawei.com>
Cc:     <pbonzini@redhat.com>, <mst@redhat.com>,
        <shannon.zhaosl@gmail.com>, <peter.maydell@linaro.org>,
        <lersek@redhat.com>, <james.morse@arm.com>, <mtosatti@redhat.com>,
        <rth@twiddle.net>, <ehabkost@redhat.com>, <zhengxiang9@huawei.com>,
        <jonathan.cameron@huawei.com>, <xuwei5@huawei.com>,
        <kvm@vger.kernel.org>, <qemu-devel@nongnu.org>,
        <qemu-arm@nongnu.org>, <linuxarm@huawei.com>
Subject: Re: [Qemu-devel] [PATCH v17 02/10] ACPI: add some GHES structures
 and macros definition
Message-ID: <20190620141052.370788fb@redhat.com>
In-Reply-To: <1557832703-42620-3-git-send-email-gengdongjiu@huawei.com>
References: <1557832703-42620-1-git-send-email-gengdongjiu@huawei.com>
        <1557832703-42620-3-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Thu, 20 Jun 2019 12:11:01 +0000 (UTC)
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 6t+upMGqdYcG

On Tue, 14 May 2019 04:18:15 -0700
Dongjiu Geng <gengdongjiu@huawei.com> wrote:

> Add Generic Error Status Block structures and some macros
> definitions, which is referred to the ACPI 4.0 or ACPI 6.2. The
> HEST table generation and CPER record will use them.
> 
> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
> ---
>  include/hw/acpi/acpi-defs.h | 52 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 
> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> index f9aa4bd..d1996fb 100644
> --- a/include/hw/acpi/acpi-defs.h
> +++ b/include/hw/acpi/acpi-defs.h
> @@ -224,6 +224,25 @@ typedef struct AcpiMultipleApicTable AcpiMultipleApicTable;
>  #define ACPI_APIC_RESERVED              16   /* 16 and greater are reserved */
>  
>  /*
> + * Values for Hardware Error Notification Type field
> + */
> +enum AcpiHestNotifyType {
> +    ACPI_HEST_NOTIFY_POLLED = 0,
> +    ACPI_HEST_NOTIFY_EXTERNAL = 1,
> +    ACPI_HEST_NOTIFY_LOCAL = 2,
> +    ACPI_HEST_NOTIFY_SCI = 3,
> +    ACPI_HEST_NOTIFY_NMI = 4,
> +    ACPI_HEST_NOTIFY_CMCI = 5,  /* ACPI 5.0: 18.3.2.7, Table 18-290 */
> +    ACPI_HEST_NOTIFY_MCE = 6,   /* ACPI 5.0: 18.3.2.7, Table 18-290 */
> +    ACPI_HEST_NOTIFY_GPIO = 7,  /* ACPI 6.0: 18.3.2.7, Table 18-332 */
> +    ACPI_HEST_NOTIFY_SEA = 8,   /* ACPI 6.1: 18.3.2.9, Table 18-345 */
> +    ACPI_HEST_NOTIFY_SEI = 9,   /* ACPI 6.1: 18.3.2.9, Table 18-345 */
> +    ACPI_HEST_NOTIFY_GSIV = 10, /* ACPI 6.1: 18.3.2.9, Table 18-345 */
> +    ACPI_HEST_NOTIFY_SDEI = 11, /* ACPI 6.2: 18.3.2.9, Table 18-383 */
> +    ACPI_HEST_NOTIFY_RESERVED = 12 /* 12 and greater are reserved */
> +};
> +
> +/*
>   * MADT sub-structures (Follow MULTIPLE_APIC_DESCRIPTION_TABLE)
>   */
>  #define ACPI_SUB_HEADER_DEF   /* Common ACPI sub-structure header */\
> @@ -400,6 +419,39 @@ struct AcpiSystemResourceAffinityTable {
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

there shouldn't be packed structures,
is it a leftover from previous version?

> +
> +/*
> + * Masks for block_status flags above
> + */
> +#define ACPI_GEBS_UNCORRECTABLE         1
> +
> +/*
> + * Values for error_severity field above
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
> +#define ACPI_HEST_SOURCE_GENERIC_ERROR_V2    10
> +
>  #define ACPI_SRAT_PROCESSOR_APIC     0
>  #define ACPI_SRAT_MEMORY             1
>  #define ACPI_SRAT_PROCESSOR_x2APIC   2
