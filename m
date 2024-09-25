Received: by 2002:a17:505:5b18:b0:1be9:327d:8ee3 with SMTP id ox24csp351950njb;
        Wed, 25 Sep 2024 07:10:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX9+1vetEhxWZCV4xZZKq32pqM5xTTC3NsiECsDGWUAjicRjBsrE5NKnp2gKU332OFxlKY0mbvuEgMZbA==@linaro.org
X-Google-Smtp-Source: AGHT+IFVZBBDGmPHeI5mtfG0ydTpzWnJ2xaR0Z0hr4DJDAqEOM0J1N+nZaydVbTNL91cZ/ElOc/4
X-Received: by 2002:a05:6870:3329:b0:277:d932:deb1 with SMTP id 586e51a60fabf-286e13c1841mr2329047fac.18.1727273402577;
        Wed, 25 Sep 2024 07:10:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727273402; cv=none;
        d=google.com; s=arc-20240605;
        b=E4OmxIl5utE5uarW6nkkEg5Za7PWo7MnABPUKK46GSFNd/jxJPX0XEQOXlH+fzs33R
         9vE7rH+J4Hc+DL0s99VujzoNONcC7WCV5ZzF3BEs8MWGf2u1FiyW4Q5+V2J39BNCcIZD
         WTFRTVZRn3JPc/YdlL619I7aiCeVgsjKAiHqpury5Y8UGy2jCuHyBafrcD/NEnCsXX/1
         q/lJYTcoq++r6vQUk3IwgRBldzSMKjK3DjA+cDp4eLaaMgTS+pwC5p9VLfVtTygJe/sM
         LaAEKOL9ydp5TCnEDDGOE4NiO3ktjZV8s4yL3eeC6scQdys8ZXWwicvcvLdb5m/KSXzi
         io2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:date;
        bh=Cjg+T0f3Wnp9ojW+hc+UKKiwpF2I5P/kfIKYzhTJRjQ=;
        fh=sk20niJjP+LyGcAC6rY5I61AlgNCIPpR6UIhxIWLYTI=;
        b=NKIwhXqGtK1r0hF/cXRHH/gjJ6nivRrtSJh6JQ4t7TveVBMhGJ27AVSVo8Oi3WUL0D
         Sv4Ot+WcRIRh7kLu2wvskVMmZgwO0uXBIPtM2lGWYJoXz7t693i5gvtD6N0Hq65+k6su
         KYw/Q0hRgylkydfnh9Vlg6ma1cTxEAPWChRZaE2GIan0wf53TINndHGsKsvRBqY/Tsdb
         EJNoDgDDoPPsPeZe8ByYM1EfDNas6n+Nox8KA02j7Chy7YBsKPB635pKPBulmnvLxpyf
         3ZnGY95EK1tDggUKr/dUk62quxbtMGdxD4NnO8mpBNR5DWPRisjvbU4674cY9VCNGXsS
         Y0GA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-505aa1524aesi1119820e0c.252.2024.09.25.07.10.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Sep 2024 07:10:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1stSi6-0002QV-EK; Wed, 25 Sep 2024 10:09:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1stSi5-0002PU-KI; Wed, 25 Sep 2024 10:09:41 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1stSi3-0000A1-5l; Wed, 25 Sep 2024 10:09:40 -0400
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XDJR53vnjz6D8gq;
 Wed, 25 Sep 2024 22:05:37 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id 7E119140B39;
 Wed, 25 Sep 2024 22:09:35 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 25 Sep
 2024 16:09:34 +0200
Date: Wed, 25 Sep 2024 15:09:33 +0100
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC: Igor Mammedov <imammedo@redhat.com>, Shiju Jose <shiju.jose@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Dongjiu Geng <gengdongjiu1@gmail.com>, <linux-kernel@vger.kernel.org>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: Re: [PATCH 02/15] acpi/ghes: simplify acpi_ghes_record_errors() code
Message-ID: <20240925150933.0000373d@Huawei.com>
In-Reply-To: <45dcc7644e2b2a04645a37e561ed7294482b0744.1727236561.git.mchehab+huawei@kernel.org>
References: <cover.1727236561.git.mchehab+huawei@kernel.org>
 <45dcc7644e2b2a04645a37e561ed7294482b0744.1727236561.git.mchehab+huawei@kernel.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500003.china.huawei.com (7.191.162.67) To
 frapeml500008.china.huawei.com (7.182.85.71)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.828,
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: nrbo/Dwkz9o/

On Wed, 25 Sep 2024 06:04:07 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Reduce the ident of the function and prepares it for
> the next changes.
> 
> No functional changes.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Some of the alignment doesn't seem to match local style which
is either align after ( or align 4 spaces in from line above for
multiple line argument lists.

Code is fine as I guess the later structure is to prepare
for additions that prevent early returns being sensible.

With that in mind.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  hw/acpi/ghes.c | 56 ++++++++++++++++++++++++++------------------------
>  1 file changed, 29 insertions(+), 27 deletions(-)
> 
> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> index dc217694deb9..dacbd4d0c093 100644
> --- a/hw/acpi/ghes.c
> +++ b/hw/acpi/ghes.c
> @@ -402,40 +402,42 @@ int acpi_ghes_record_errors(uint8_t source_id, uint64_t physical_address)
>  
>      start_addr = le64_to_cpu(ags->ghes_addr_le);
>  
> -    if (physical_address) {
> +    if (!physical_address) {
> +        return -1;
> +    }
>  
> -        if (source_id < ACPI_GHES_ERROR_SOURCE_COUNT) {
> -            start_addr += source_id * sizeof(uint64_t);
> -        }
> +    if (source_id < ACPI_GHES_ERROR_SOURCE_COUNT) {
> +        start_addr += source_id * sizeof(uint64_t);
> +    }
>  
> -        cpu_physical_memory_read(start_addr, &error_block_addr,
> -                                 sizeof(error_block_addr));
> +    cpu_physical_memory_read(start_addr, &error_block_addr,
> +                                sizeof(error_block_addr));
>  
> -        error_block_addr = le64_to_cpu(error_block_addr);
> +    error_block_addr = le64_to_cpu(error_block_addr);
>  
> -        read_ack_register_addr = start_addr +
> -            ACPI_GHES_ERROR_SOURCE_COUNT * sizeof(uint64_t);
> +    read_ack_register_addr = start_addr +
> +        ACPI_GHES_ERROR_SOURCE_COUNT * sizeof(uint64_t);
>  
> -        cpu_physical_memory_read(read_ack_register_addr,
> -                                 &read_ack_register, sizeof(read_ack_register));
> +    cpu_physical_memory_read(read_ack_register_addr,
> +                                &read_ack_register, sizeof(read_ack_register));

Alignment looks fishy plus maybe move &read_ack_register up a line.


>  
> -        /* zero means OSPM does not acknowledge the error */
> -        if (!read_ack_register) {
> -            error_report("OSPM does not acknowledge previous error,"
> -                " so can not record CPER for current error anymore");
> -        } else if (error_block_addr) {
> -            read_ack_register = cpu_to_le64(0);
> -            /*
> -             * Clear the Read Ack Register, OSPM will write it to 1 when
> -             * it acknowledges this error.
> -             */
> -            cpu_physical_memory_write(read_ack_register_addr,
> -                &read_ack_register, sizeof(uint64_t));
> +    /* zero means OSPM does not acknowledge the error */
> +    if (!read_ack_register) {
> +        error_report("OSPM does not acknowledge previous error,"
> +            " so can not record CPER for current error anymore");
I guess later changes make it unwise to just return -1 here.	

> +    } else if (error_block_addr) {
> +        read_ack_register = cpu_to_le64(0);
> +        /*
> +         * Clear the Read Ack Register, OSPM will write it to 1 when
> +         * it acknowledges this error.
> +         */
> +        cpu_physical_memory_write(read_ack_register_addr,
> +            &read_ack_register, sizeof(uint64_t));
>  
> -            ret = acpi_ghes_record_mem_error(error_block_addr,
> -                                             physical_address);
> -        } else
> -            error_report("can not find Generic Error Status Block");
> +        ret = acpi_ghes_record_mem_error(error_block_addr,
> +                                            physical_address);
or return here.
> +    } else {
> +        error_report("can not find Generic Error Status Block");
>      }
>  
>      return ret;

