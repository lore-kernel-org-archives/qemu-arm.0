Received: by 2002:a17:90a:ad88:0:0:0:0 with SMTP id s8csp8742297pjq;
        Tue, 28 May 2019 20:40:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzFjI3l0FUBH5lWSpqe4gyVindPTYfAe4/v8C8aky/6wE3jmB0+HX2BGaVnTmsxcz7tymd5
X-Received: by 2002:a05:6a00:c9:: with SMTP id e9mr141595pfj.99.1559101224054;
        Tue, 28 May 2019 20:40:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559101224; cv=none;
        d=google.com; s=arc-20160816;
        b=d234CiffgyLGvQTgCkmJquF3jK1KW4SGk/iOU/FS2BaquS0g3h/d8URM9jj7oJENci
         4tY2RQ1GzanStj2kA3CEi83a8PWH0LYK2onuqXfxkB/5aR67YN0IJ4cNoEYcxq+BGQB8
         aHIInun9YARhPZ0sZ/xlvWeYvONEvRPQwF79JFGmTv3ybZTLsLZ47tqNJ36dNRSmDs+D
         o2CP/XG8pE3dcXGJOIlCXdzEhBeKMvqDwuTMsWSQwM6was4rkN5WuwYrSbS/R97voJBT
         85bQ7M8mwjjR0N1ASinZBXVDbhL4e/joF6YIwG2fG1yOGznw5L/CZat0QL3NcCfDS4qS
         GKOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date;
        bh=CA/4dQuaDckNy4AUShkfB3sMJYFzdlrvMh+cMSh6ymk=;
        b=aNM0fQvSPBR2f8SfucTaB+1tHsK8bTwtge02m/Z+exd3qPqMDS/EWfwA+lQ4lJb7fV
         v51q8L3Sxjenttby8tkgdh5A0KqFcpSzz3o1C9byo7aA18wNwE+iVkwi0GcySfVeDlbL
         1E4d+D5tCg/9iGGkrteSkbkdrYe5SamLJf2Ei7DsKK4rR5GMN/VSGLCnvF0nBPhc0HJ8
         sY3Al+ecmyx66ZejP9PmJCrej3xR9dnyUry2HNoUNnkWubvVbaNwrjdJcpA0TP4yMkdI
         vGx3js4Wp3/mq6HaSrChwPI/MoSEZJbGufUnvzwNnHe94ndRl6W7vg3xVX0Jq1FPKfzh
         gLFg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id j3si23927935pgh.445.2019.05.28.20.40.23;
        Tue, 28 May 2019 20:40:24 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725936AbfE2DkW (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 5 others); Tue, 28 May 2019 23:40:22 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:32829 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbfE2DkW (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 28 May 2019 23:40:22 -0400
Received: by mail-qt1-f196.google.com with SMTP id 14so936750qtf.0
        for <kvm@vger.kernel.org>; Tue, 28 May 2019 20:40:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CA/4dQuaDckNy4AUShkfB3sMJYFzdlrvMh+cMSh6ymk=;
        b=j1Us37almRmLXq9otqDvvBDJ/qDVMFCwJJuo5qUU4MKpYkh0/VKtC2RmyumfumwMjz
         mMIPBlg3uxBMQvQuld+COWbixQaXUDUQyqsj7l4GtzgEPEII0k+O7Q0vyU60GAtn0QWu
         +On11VhWzvzBYqtkNL2hcYITTQzk1NhhjPP4871j8TwUr9MbrcWel5nUJO8kYDjoAVrG
         tOEqdlXkU3r1zsqbFlrVVdmb2mksPh1CR3VR9S5gS60DYAang5ELzrEtbxrSjI6zrE3u
         vwNc0Xj2kVCvfSw3/6LRT1Gq7lhE96EYzhJ5ToS9+icXJ6PnyslX5tooS16lIv1rUhTi
         6KzA==
X-Gm-Message-State: APjAAAWrp2LSsmvfVzSwtDT02dgm4LhcW+0QJVwy5RTnRfLJ5bJMryMD
        Mf278Jf97a5QMh1mCQAjx/ugdg==
X-Received: by 2002:ac8:96d:: with SMTP id z42mr90521227qth.24.1559101221644;
        Tue, 28 May 2019 20:40:21 -0700 (PDT)
Received: from redhat.com (pool-100-0-197-103.bstnma.fios.verizon.net. [100.0.197.103])
        by smtp.gmail.com with ESMTPSA id w5sm6288911qtc.50.2019.05.28.20.40.20
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 28 May 2019 20:40:20 -0700 (PDT)
Date:   Tue, 28 May 2019 23:40:18 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Dongjiu Geng <gengdongjiu@huawei.com>
Cc:     pbonzini@redhat.com, imammedo@redhat.com, shannon.zhaosl@gmail.com,
        peter.maydell@linaro.org, lersek@redhat.com, james.morse@arm.com,
        mtosatti@redhat.com, rth@twiddle.net, ehabkost@redhat.com,
        zhengxiang9@huawei.com, jonathan.cameron@huawei.com,
        xuwei5@huawei.com, kvm@vger.kernel.org, qemu-devel@nongnu.org,
        qemu-arm@nongnu.org, linuxarm@huawei.com
Subject: Re: [PATCH v17 02/10] ACPI: add some GHES structures and macros
 definition
Message-ID: <20190528233859-mutt-send-email-mst@kernel.org>
References: <1557832703-42620-1-git-send-email-gengdongjiu@huawei.com>
 <1557832703-42620-3-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1557832703-42620-3-git-send-email-gengdongjiu@huawei.com>
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: AtlI84j24mqh

On Tue, May 14, 2019 at 04:18:15AM -0700, Dongjiu Geng wrote:
> Add Generic Error Status Block structures and some macros
> definitions, which is referred to the ACPI 4.0 or ACPI 6.2. The
> HEST table generation and CPER record will use them.
> 
> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>

Are these all still used? I'd rather you moved stuff to
where it's used.



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

If there's a single user, the best thing to do
is just to open-code with a comment that matches
spec names. It's hard to find stuff like ACPI_HEST_NOTIFY_GSIV
in a spec.

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
> -- 
> 1.8.3.1
