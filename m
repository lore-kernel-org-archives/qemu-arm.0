Received: by 2002:a2e:b168:0:0:0:0:0 with SMTP id a8csp129805ljm;
        Mon, 26 Sep 2022 13:16:00 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4LxEAcakLrIPj1iEVzeqlcAJpqFNFwgQweMuxfT7BiUjbdq/i8FxomKs45dbXCee3z8343
X-Received: by 2002:a05:6000:156b:b0:22a:a83a:d349 with SMTP id 11-20020a056000156b00b0022aa83ad349mr14937842wrz.277.1664223360289;
        Mon, 26 Sep 2022 13:16:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664223360; cv=none;
        d=google.com; s=arc-20160816;
        b=iBifrU0xy06nDjdyQISJLPwwKckB0fllcaxeQmcG0034Ha2si7spWEQPuT4Hs+gH9j
         PTrueSijx9kJs3kPcaCo6iPcx0Xm9GhquetKxTw97ZTwFva5Q9aC1n7JIa6Fd5kpZQX6
         GVrBGkHcwcKWZLNPjf4BbMMMNErpp5pxPRdtTOAsOwZnDNLzP4HYkVOFOzob8oVy/gVI
         zyfa0Ii5wwEfAK4T2nUD3L/EAZ0OTiG2Y5OL216G3OUixS5Y6wPYHkQp3dMMZPRwMUM+
         d0SH0JG094yNnv6ybrS8chYpw0CNdBve4wt0I8wllLY2xMIddazCXM1/ynhPignDbHRF
         kInQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=XjfeqkGznulLudZWqr+683vg0yWt3N9XllxRrsAQbQo=;
        b=uJ2i7S96fMW03Snjv2gQRhZBF/rRPY8zLiPZ5cdEVU7zoxKlRu2rnlltxyHhlKeyKP
         KAPyGZ2rwdSHRApPaikSv5cmBGplPjL56G/BbXAqmsV2Rx7mvlUm5sSWXpW8audIaU6E
         qqXECAc/niymDDg9GpVd7HHd67eCt9itdRtXWSgx6V38HHsUAov6XpUlibrU3KOuzNEM
         o3pJ1bZXVppdKdtrv/TGl3M9SYL8CYauOY5hscf5hAp+buWK5GHLc71ZWFS+00bTwGp7
         CKMwYHrhnoVk/0r5UN7tdFZGSTuzM1RrhzWsWLC94pyaiRcg0PDi6PvVYo7w75nEXRb3
         JW+w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of agraf@csgraf.de designates 85.25.223.15 as permitted sender) smtp.mailfrom=agraf@csgraf.de
Return-Path: <agraf@csgraf.de>
Received: from zulu616.server4you.de (mail.csgraf.de. [85.25.223.15])
        by mx.google.com with ESMTP id f2-20020adff442000000b0022ac2088a1dsi9917208wrp.375.2022.09.26.13.16.00
        for <alex.bennee@linaro.org>;
        Mon, 26 Sep 2022 13:16:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of agraf@csgraf.de designates 85.25.223.15 as permitted sender) client-ip=85.25.223.15;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of agraf@csgraf.de designates 85.25.223.15 as permitted sender) smtp.mailfrom=agraf@csgraf.de
Received: from [10.95.79.201] (ec2-3-122-114-9.eu-central-1.compute.amazonaws.com [3.122.114.9])
	by csgraf.de (Postfix) with ESMTPSA id A543D608061F;
	Mon, 26 Sep 2022 22:15:59 +0200 (CEST)
Message-ID: <91ee005f-d9a9-eb77-43a8-96365b088ee0@csgraf.de>
Date: Mon, 26 Sep 2022 22:15:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.0
Subject: Re: [PATCH v2 01/11] hw: encode accessing CPU index in MemTxAttrs
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: f4bug@amsat.org, mads@ynddal.dk, qemu-arm@nongnu.org
References: <20220926133904.3297263-1-alex.bennee@linaro.org>
 <20220926133904.3297263-2-alex.bennee@linaro.org>
From: Alexander Graf <agraf@csgraf.de>
In-Reply-To: <20220926133904.3297263-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: qSR52x7KvAnW


On 26.09.22 15:38, Alex Bennée wrote:
> We currently have hacks across the hw/ to reference current_cpu to
> work out what the current accessing CPU is. This breaks in some cases
> including using gdbstub to access HW state. As we have MemTxAttrs to
> describe details about the access lets extend it to mention if this is
> a CPU access and which one it is.
>
> There are a number of places we need to fix up including:
>
>    CPU helpers directly calling address_space_*() fns
>    models in hw/ fishing the data out of current_cpu
>    hypervisors offloading device emulation to QEMU
>
> I'll start addressing some of these in following patches.
>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>
> ---
> v2
>    - use separate field cpu_index
>    - bool for requester_is_cpu
> v3
>    - switch to enum MemTxRequesterType
>    - move helper #define to patch
>    - revert to overloading requester_id
>    - mention hypervisors in commit message
>    - drop cputlb tweaks, they will move to target specific code
> ---
>   include/exec/memattrs.h | 17 ++++++++++++++++-
>   1 file changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
> index 9fb98bc1ef..0fb5f29d25 100644
> --- a/include/exec/memattrs.h
> +++ b/include/exec/memattrs.h
> @@ -14,6 +14,15 @@
>   #ifndef MEMATTRS_H
>   #define MEMATTRS_H
>   
> +/*
> + * Where the memory transaction comes from
> + */
> +typedef enum MemTxRequesterType {
> +    MEMTXATTRS_CPU,
> +    MEMTXATTRS_MSI,


I don't think MSI is any sensible identifier here. What you actually are 
trying to describe are bus messages that may carry additional source 
information - and what you describe as "MSI" here most likely means "no 
further information".

How about you just call it "BUS", "DMA" or literally "UNSPECIFIED" for 
now? Also, why is unspecified not part of the requester type enum?


Alex

> +} MemTxRequesterType;
> +
> +
>   /* Every memory transaction has associated with it a set of
>    * attributes. Some of these are generic (such as the ID of
>    * the bus master); some are specific to a particular kind of
> @@ -43,7 +52,9 @@ typedef struct MemTxAttrs {
>        * (see MEMTX_ACCESS_ERROR).
>        */
>       unsigned int memory:1;
> -    /* Requester ID (for MSI for example) */
> +    /* Requester type (e.g. CPU or PCI MSI) */
> +    MemTxRequesterType requester_type:2;
> +    /* Requester ID */
>       unsigned int requester_id:16;
>       /* Invert endianness for this page */
>       unsigned int byte_swap:1;
> @@ -66,6 +77,10 @@ typedef struct MemTxAttrs {
>    */
>   #define MEMTXATTRS_UNSPECIFIED ((MemTxAttrs) { .unspecified = 1 })
>   
> +/* Helper for setting a basic CPU sourced transaction */
> +#define MEMTXATTRS_CPU(id) ((MemTxAttrs) \
> +                            {.requester_type = MEMTXATTRS_CPU, .requester_id = id})
> +
>   /* New-style MMIO accessors can indicate that the transaction failed.
>    * A zero (MEMTX_OK) response means success; anything else is a failure
>    * of some kind. The memory subsystem will bitwise-OR together results
