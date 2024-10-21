Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp2237638njb;
        Mon, 21 Oct 2024 02:06:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWsVHA4tc9nN9olYqvS/xiEkGTvfIGGFAa1eScNBBuLr8HIX19HLoAi9Ahb8A1kfOcZaQL6mL5abI2/kQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGwlBqnnrfJijMxZEl1uhWHM9M2qwUcOcp7IwS+CJxELsjR4v5fFE/9wNUbfQHz2EACudPc
X-Received: by 2002:a05:6214:3da1:b0:6cb:cedb:a389 with SMTP id 6a1803df08f44-6cde14d2421mr169722396d6.14.1729501584434;
        Mon, 21 Oct 2024 02:06:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729501584; cv=none;
        d=google.com; s=arc-20240605;
        b=IUNDATWnXHlzNtmOPk9goQvbfR5vKR4dOXUczyBYtN5ZD8S/C0XuYA1taSans77+y+
         034h6MLzsorvOdSoQg5veTnXcWrTH9CZfcEfBIYuyPffxd+mUKLYfpKC/R8ItR9UXLJQ
         LUgP0DJGKZAEiIw1QP+8xpKBlbF+d0oUtkFA2LG729zAWPYnvJG6L31Fy58gJxQUoZ12
         w/xTtaI8eNAq0WToqJijcibk6MjPTSPnnS0aSaupIk8OmWx694CvnLDYUUvI46bq0BI2
         kWi7RFKP/dosxrAtHam1oV8qZvqv83MnOPBeSXHqYS9wKE9PhvpV83i2lRMPv013Lv0J
         wWQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=h2OY/tH5RG378HGaPnuPYzXJld+VnUBwSKJenSol/8o=;
        fh=4mlnkPeqTwuu2Qx8qreMlJHQU0w7aOUfwVS+XUkOkGE=;
        b=Y9V36b55exEfBJDeFVMh6TiCRoWzL43YzgAKX5UeEYxWHPtoR/hl2ZutsPfgVSznf7
         VZUMMK5qjhi3t4Q3niHBBkWkspVrplLSPIgjsUrSI1e5vwK1ddBiMxCKdQO7Z97nmsTC
         PYEGbmXJ9x+1Gv9SHnVwxcIOXWmTOuU6ELGLqnRqXct4h2wWVFwWZh9sPu4tBxq9NIS6
         Fa/R9AAtJ0Lzrv2xgw9PLetuYRwDbZsZ5PFaqc/BYAa6++tpLLPG6T9qz6sYp09jnRmw
         VisTk0TZ79RPEae5BpLiXMLZTdldKVVPrWsZmbJEiEuMnNVoClBxrV33MDbXzo9mVM7R
         oE2A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ce009c95f7si35284906d6.331.2024.10.21.02.06.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2024 02:06:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t2oMi-0000ut-QN; Mon, 21 Oct 2024 05:06:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=cGEO=RR=kaod.org=clg@ozlabs.org>)
 id 1t2oMX-0000u7-B2; Mon, 21 Oct 2024 05:06:05 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=cGEO=RR=kaod.org=clg@ozlabs.org>)
 id 1t2oMU-0008Pi-Pc; Mon, 21 Oct 2024 05:06:04 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4XX8YF72psz4wxx;
 Mon, 21 Oct 2024 20:05:53 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4XX8Y82gF3z4wb5;
 Mon, 21 Oct 2024 20:05:48 +1100 (AEDT)
Message-ID: <7ec6cfa5-fee8-4c2c-8bf8-7fd079867a65@kaod.org>
Date: Mon, 21 Oct 2024 11:05:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [SPAM] [PATCH v1 04/16] hw/block/m25p80: Add SFDP table for
 w25q80bl flash
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:Block layer core" <qemu-block@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
References: <20241018053112.1886173-1-jamin_lin@aspeedtech.com>
 <20241018053112.1886173-5-jamin_lin@aspeedtech.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20241018053112.1886173-5-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=cGEO=RR=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.17, RCVD_IN_DNSWL_MED=-2.3,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: /tVbA5WxcBWU

On 10/18/24 07:31, Jamin Lin wrote:
> Add the SFDP table for the Windbond w25q80bl flash.
>
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>

capabilities exposed to Linux look correct :
     
     root@ast2600-default:~# cat  /sys/kernel/debug/spi-nor/spi0.1/*
     Supported read modes by the flash
      1S-1S-1S
       opcode	0x03
       mode cycles	0
       dummy cycles	0
      1S-1S-1S (fast read)
       opcode	0x0b
       mode cycles	0
       dummy cycles	8
      1S-1S-2S
       opcode	0x3b
       mode cycles	0
       dummy cycles	8
      1S-2S-2S
       opcode	0xbb
       mode cycles	2
       dummy cycles	2
      1S-1S-4S
       opcode	0x6b
       mode cycles	0
       dummy cycles	8
      1S-4S-4S
       opcode	0xeb
       mode cycles	2
       dummy cycles	4
     
     Supported page program modes by the flash
      1S-1S-1S
       opcode	0x02
     name		s25fl008k
     id		ef 40 14 00 00 00
     size		1.00 MiB
     write size	1
     page size	256
     address nbytes	3
     flags		HAS_16BIT_SR | NO_READ_CR | SOFT_RESET
     
     opcodes
      read		0x6b
       dummy cycles	8
      erase		0xd8
      program	0x02
      8D extension	none
     
     protocols
      read		1S-1S-4S
      write		1S-1S-1S
      register	1S-1S-1S
     
     erase commands
      20 (4.00 KiB) [1]
      52 (32.0 KiB) [2]
      d8 (64.0 KiB) [3]
      c7 (1.00 MiB)
     
     sector map
      region (in hex)   | erase mask | flags
      ------------------+------------+----------
      00000000-000fffff |     [ 123] |
     
Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> ---
>   hw/block/m25p80.c      |  3 ++-
>   hw/block/m25p80_sfdp.c | 36 ++++++++++++++++++++++++++++++++++++
>   hw/block/m25p80_sfdp.h |  2 +-
>   3 files changed, 39 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index 411d810d3b..e2e84f8b5f 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -356,7 +356,8 @@ static const FlashPartInfo known_devices[] = {
>       { INFO("w25x64",      0xef3017,      0,  64 << 10, 128, ER_4K) },
>       { INFO("w25q64",      0xef4017,      0,  64 << 10, 128, ER_4K) },
>       { INFO("w25q80",      0xef5014,      0,  64 << 10,  16, ER_4K) },
> -    { INFO("w25q80bl",    0xef4014,      0,  64 << 10,  16, ER_4K) },
> +    { INFO("w25q80bl",    0xef4014,      0,  64 << 10,  16, ER_4K),
> +      .sfdp_read = m25p80_sfdp_w25q80bl },
>       { INFO("w25q256",     0xef4019,      0,  64 << 10, 512, ER_4K),
>         .sfdp_read = m25p80_sfdp_w25q256 },
>       { INFO("w25q512jv",   0xef4020,      0,  64 << 10, 1024, ER_4K),
> diff --git a/hw/block/m25p80_sfdp.c b/hw/block/m25p80_sfdp.c
> index 82d84cc21f..a03a291a09 100644
> --- a/hw/block/m25p80_sfdp.c
> +++ b/hw/block/m25p80_sfdp.c
> @@ -404,6 +404,42 @@ static const uint8_t sfdp_w25q01jvq[] = {
>   };
>   define_sfdp_read(w25q01jvq);
>   
> +static const uint8_t sfdp_w25q80bl[] = {
> +    0x53, 0x46, 0x44, 0x50, 0x05, 0x01, 0x00, 0xff,
> +    0x00, 0x05, 0x01, 0x10, 0x80, 0x00, 0x00, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xe5, 0x20, 0xf1, 0xff, 0xff, 0xff, 0x7f, 0x00,
> +    0x44, 0xeb, 0x08, 0x6b, 0x08, 0x3b, 0x42, 0xbb,
> +    0xee, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00, 0x00,
> +    0xff, 0xff, 0x00, 0x00, 0x0c, 0x20, 0x0f, 0x52,
> +    0x10, 0xd8, 0x00, 0x00, 0x23, 0x02, 0xa6, 0x00,
> +    0x81, 0x6c, 0x14, 0xa7, 0xed, 0x61, 0x76, 0x33,
> +    0x7a, 0x75, 0x7a, 0x75, 0xf7, 0xa2, 0xd5, 0x5c,
> +    0x00, 0xf7, 0x1d, 0xff, 0xe9, 0x30, 0xc0, 0x80,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +};
> +define_sfdp_read(w25q80bl);
> +
>   /*
>    * Integrated Silicon Solution (ISSI)
>    */
> diff --git a/hw/block/m25p80_sfdp.h b/hw/block/m25p80_sfdp.h
> index 89c2d8f72d..35785686a0 100644
> --- a/hw/block/m25p80_sfdp.h
> +++ b/hw/block/m25p80_sfdp.h
> @@ -25,7 +25,7 @@ uint8_t m25p80_sfdp_mx66l1g45g(uint32_t addr);
>   
>   uint8_t m25p80_sfdp_w25q256(uint32_t addr);
>   uint8_t m25p80_sfdp_w25q512jv(uint32_t addr);
> -
> +uint8_t m25p80_sfdp_w25q80bl(uint32_t addr);
>   uint8_t m25p80_sfdp_w25q01jvq(uint32_t addr);
>   
>   uint8_t m25p80_sfdp_is25wp256(uint32_t addr);

