Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp1283391njc;
        Wed, 21 May 2025 08:56:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXTyTfk+9JKVlq0fR5xKIno0EYmjj+NI1FqExWqlHqYUH0SuO8NMJE3sFAeclE6FF18RaIqfMP0avXwYQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGPMMFjAHyDY7VzY47XXvXhGIiZB1Cn2TwdePa/mr0VuQvioo16scChjcJVG60hNwr2fvRv
X-Received: by 2002:a05:6602:380d:b0:864:4aa2:d796 with SMTP id ca18e2360f4ac-86a231e19e9mr2816823639f.8.1747843013370;
        Wed, 21 May 2025 08:56:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747843013; cv=none;
        d=google.com; s=arc-20240605;
        b=YYbanQePbe9j53W8+dEKIZghcsVt2e0lynIGaUnuRKBfOWrqrxy9gUiJX+w4idE2MF
         lLOjOr3N0HDf8bCiBOX6CF0Km/qrOC7jeHz2RtNsuoxj7GyxZGhxn7bQSuv9dA9Svwod
         ROS/LNUuI1KcnUOt5YdLoxST89SGdeWcyngGG88YQMA/FTt/M68/IP56KsKo87+/+S7k
         3Rgq+dFWx7TCx4SsbEkwOjIT8MiB3hrlUZJ8ml00vdouK450UPKYzac8M/HDvbdI74ER
         xQFRvxxHpLIhOlhu49vwZ3O0W3pc4erfFq+o/VIDzulGsmsxdhF1qncv8zoSie6Kh3wU
         oY8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id;
        bh=dkEPQQnqq2osiNVv4ua6vRwxHX1aKf0cG3l7GlRZhGE=;
        fh=Z2qDztSV8CWVU0ChRWBZcc7s5uQfKpc4TkuCRqvdIcI=;
        b=eGKWH0CF/aBCmOfrUYfd8ylJuHH2gV2zRRVpWiqtEdmTjYgL6vVCow9J+r+Wtt0rwm
         +xCRYR+zlujoF8fk3ZXTqXpzYPqSKmxzGDbRi5fmQvrA4o69ndSY83RRCRrfDk16CleX
         S5h4mLFBjxlrDDjeMIyH+bDyIrPF58PGRS27SUcFBt44ejOXyo6K1FTviwwEHHO1P5BY
         jc6eYEKOQjxN9wJlH3AkjbJ76CghSW3DbuMySpzCSUpBGmkFR3GtruXdubwTnUrGwnB6
         ogIurxR64Gy1byEkSCaTiO6H0bYpDnZTbEvMSNsCYAKTloqy3n6FNsZlm20+HLNCJgGg
         5qyw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ca18e2360f4ac-86a235e335bsi824020239f.52.2025.05.21.08.56.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 May 2025 08:56:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uHlnq-0004L0-1r; Wed, 21 May 2025 11:56:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=LBbo=YF=kaod.org=clg@ozlabs.org>)
 id 1uHlnn-0004Cd-1m; Wed, 21 May 2025 11:56:19 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=LBbo=YF=kaod.org=clg@ozlabs.org>)
 id 1uHlnf-0008F9-TB; Wed, 21 May 2025 11:56:18 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4b2bcd3th9z4xTx;
 Thu, 22 May 2025 01:56:01 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4b2bcZ3Hn4z4xNG;
 Thu, 22 May 2025 01:55:57 +1000 (AEST)
Message-ID: <55f9f007-44c5-4a27-b3a5-9c4a939d1c6b@kaod.org>
Date: Wed, 21 May 2025 17:55:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] hw/arm/aspeed_ast27x0: Fix RAM size detection
 failure on BE hosts
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com
References: <20250520073540.2014240-1-jamin_lin@aspeedtech.com>
 <20250520073540.2014240-4-jamin_lin@aspeedtech.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Autocrypt: addr=clg@kaod.org; keydata=
 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
In-Reply-To: <20250520073540.2014240-4-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=LBbo=YF=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: qbgun0PbXUpZ

On 5/20/25 09:35, Jamin Lin wrote:
> On big-endian hosts, the aspeed_ram_capacity_write() function previously passed
> the address of a 64-bit "data" variable directly to address_space_write(),
> assuming host and guest endianness matched.
> 
> However, the data is expected to be written in little-endian format to DRAM.
> On big-endian hosts, this led to incorrect data being written into DRAM,
> which caused the guest firmware to misdetect the DRAM size.
> 
> As a result, U-Boot fails to boot and hangs.
> 
> - Explicitly converting the 32-bit portion of "data" to little-endian format
>    using cpu_to_le32(), storing it in a temporary "uint32_t le_data".
> - Updating the MemoryRegionOps to restrict access to exactly 4 bytes
>    using .valid.{min,max}_access_size = 4 and .impl.min_access_size = 4.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> Fixes: 7436db1 ("aspeed/soc: fix incorrect dram size for AST2700")
> ---
>   hw/arm/aspeed_ast27x0.c | 21 ++++++++++++++++-----
>   1 file changed, 16 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
> index 1974a25766..7ed0919b3f 100644
> --- a/hw/arm/aspeed_ast27x0.c
> +++ b/hw/arm/aspeed_ast27x0.c
> @@ -335,24 +335,34 @@ static void aspeed_ram_capacity_write(void *opaque, hwaddr addr, uint64_t data,
>       AspeedSoCState *s = ASPEED_SOC(opaque);
>       ram_addr_t ram_size;
>       MemTxResult result;
> +    uint32_t le_data;
>   
>       ram_size = object_property_get_uint(OBJECT(&s->sdmc), "ram-size",
>                                           &error_abort);
>   
>       assert(ram_size > 0);
>   
> +    if (size != 4) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: Unsupported write size: %d (only 4-byte allowed)\n",
> +                      __func__, size);
> +        return;
> +    }

The core memory subsystem should find such issues if the valid attributes
of MemoryRegionOps are set correctly.

> +    le_data = cpu_to_le32((uint32_t)data);
> +
>       /*
>        * Emulate ddr capacity hardware behavior.
>        * If writes the data to the address which is beyond the ram size,
>        * it would write the data to the "address % ram_size".
>        */
>       result = address_space_write(&s->dram_as, addr % ram_size,
> -                                 MEMTXATTRS_UNSPECIFIED, &data, 4);
> +                                 MEMTXATTRS_UNSPECIFIED, &le_data, 4);


This should be enough :

     address_space_stl_le(&s->dram_as, addr % ram_size, data,
                          MEMTXATTRS_UNSPECIFIED, &result);

Sorry for not spotting this earlier. Finding a BE host is difficult.
Thanks for the time you spent on fixing this issue.

C.


>       if (result != MEMTX_OK) {
>           qemu_log_mask(LOG_GUEST_ERROR,
>                         "%s: DRAM write failed, addr:0x%" HWADDR_PRIx
> -                      ", data :0x%" PRIx64  "\n",
> -                      __func__, addr % ram_size, data);
> +                      ", data :0x%x\n",
> +                      __func__, addr % ram_size, le_data);
>       }
>   }
>   
> @@ -360,9 +370,10 @@ static const MemoryRegionOps aspeed_ram_capacity_ops = {
>       .read = aspeed_ram_capacity_read,
>       .write = aspeed_ram_capacity_write,
>       .endianness = DEVICE_LITTLE_ENDIAN,
> +    .impl.min_access_size = 4,
>       .valid = {
> -        .min_access_size = 1,
> -        .max_access_size = 8,
> +        .min_access_size = 4,
> +        .max_access_size = 4,
>       },
>   };
>   

