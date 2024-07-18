Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp1308214njk;
        Thu, 18 Jul 2024 01:54:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV8wPi5t8kESKSaKJnkD+FOEEcJ3VSDVbee1WaBs0tbjBSS7exCIx8tO7MaOmKdjpYIlLKEX13PkGt0ZbKiqvDsc/n7MJhA
X-Google-Smtp-Source: AGHT+IHdJOHd9Epse7cvBYblc2K0EuA8tRpS19CvXNi4PCSp5GTLXF2n2yXNXD4Lesobi09weYh5
X-Received: by 2002:a05:620a:2490:b0:79f:8c4:114e with SMTP id af79cd13be357-7a1939901d7mr12665285a.70.1721292869793;
        Thu, 18 Jul 2024 01:54:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721292869; cv=none;
        d=google.com; s=arc-20160816;
        b=yksO0PHKqugOKFye2tFQ2+GrdWwt0rTbGybL/uMrcQML7Sg8icgV9Xpy1HXXpuBVXD
         bRERQ7j8a3dqaTHwDIp5TUsMb5ueUavoReFtw2t960gbv0g4MMA0oFzisPkaFYhvIyps
         l20QmULTLvJutOpkrGqNuQclCL0ADihJC3KDNszb/Zh1wRvaySSLgKcbtINuVblwFJU+
         y/pYek/LTz1uwlgutWSlb0eCf8ftK9mN2GR60ndTuKH2xVTdAZhnJJjkKwJ2lkYMkDFV
         cmzmH9SEUSw603VkSAdGhfhrEQXjR98XJA9pnsofmnvt+F57D5BlLxinurrSviZJfutz
         d07g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=gd6vhJAuqKeIjiPjmDJ2v3BYJpge/aYR5onSJV6cR2o=;
        fh=vpv4dibz543bPaX9Fq9ZvnJ9J5iREE2VOWA/tGZmS3U=;
        b=fz+sEaO6pylv0cCbCMSzbmK2cuB0ioSPBEsC9zAlf9GbzVydO8O49pdeasfuWYwr8Y
         zOru7pPnRXUQcyTeusure/Ufhiykp8OIzAXG0EUfwxt21dDPOYjkhXnb5JxH5IMHpDLL
         q2/O4/Pv/G75rYZyvrSlcxekxx5NAfbQRUP9l4ghN4npg1YMhUxaLgEgEi5LYYaMNvLG
         Qnlz4mnRBHSrEzvrBojkrs/6kLt09Hed7Xw3RidbxIBCi0TZ2DYlRjEL+beHbGplWsri
         y9ozz8O17JdCvswT4MmpkCspaoWNueprkzSQLha2IHDpZbBm1G8ZUh3NeEgkd2/bn1Hp
         9h9w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a1938db8a9si10940085a.93.2024.07.18.01.54.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Jul 2024 01:54:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sUMtn-000355-BC; Thu, 18 Jul 2024 04:54:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=3riu=OS=kaod.org=clg@ozlabs.org>)
 id 1sUMtm-00030i-8z; Thu, 18 Jul 2024 04:54:02 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=3riu=OS=kaod.org=clg@ozlabs.org>)
 id 1sUMtk-0001oU-0g; Thu, 18 Jul 2024 04:54:01 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4WPmnK2XCDz4x0C;
 Thu, 18 Jul 2024 18:53:57 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4WPmnF1hKZz4x04;
 Thu, 18 Jul 2024 18:53:33 +1000 (AEST)
Message-ID: <e610b6e1-9871-4b02-8596-2f2fb6b2c8b1@kaod.org>
Date: Thu, 18 Jul 2024 10:53:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 14/15] aspeed: fix coding style
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
References: <20240718064925.1846074-1-jamin_lin@aspeedtech.com>
 <20240718064925.1846074-15-jamin_lin@aspeedtech.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240718064925.1846074-15-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=3riu=OS=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_MED=-2.3,
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
X-TUID: A8WEu/KFzN8G

On 7/18/24 08:49, Jamin Lin wrote:
> Fix coding style issues from checkpatch.pl
> 
> Test command:
> ./scripts/checkpatch.pl --no-tree -f hw/arm/aspeed.c
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>


Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> ---
>   hw/arm/aspeed.c | 21 ++++++++++++++-------
>   1 file changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 53a4f665d0..f8766ea462 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -265,7 +265,8 @@ static void write_boot_rom(BlockBackend *blk, hwaddr addr, size_t rom_size,
>       g_autofree void *storage = NULL;
>       int64_t size;
>   
> -    /* The block backend size should have already been 'validated' by
> +    /*
> +     * The block backend size should have already been 'validated' by
>        * the creation of the m25p80 object.
>        */
>       size = blk_getlength(blk);
> @@ -463,8 +464,10 @@ static void palmetto_bmc_i2c_init(AspeedMachineState *bmc)
>       DeviceState *dev;
>       uint8_t *eeprom_buf = g_malloc0(32 * 1024);
>   
> -    /* The palmetto platform expects a ds3231 RTC but a ds1338 is
> -     * enough to provide basic RTC features. Alarms will be missing */
> +    /*
> +     * The palmetto platform expects a ds3231 RTC but a ds1338 is
> +     * enough to provide basic RTC features. Alarms will be missing
> +     */
>       i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 0), "ds1338", 0x68);
>   
>       smbus_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 0), 0x50,
> @@ -555,8 +558,10 @@ static void romulus_bmc_i2c_init(AspeedMachineState *bmc)
>   {
>       AspeedSoCState *soc = bmc->soc;
>   
> -    /* The romulus board expects Epson RX8900 I2C RTC but a ds1338 is
> -     * good enough */
> +    /*
> +     * The romulus board expects Epson RX8900 I2C RTC but a ds1338 is
> +     * good enough
> +     */
>       i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 11), "ds1338", 0x32);
>   }
>   
> @@ -664,8 +669,10 @@ static void witherspoon_bmc_i2c_init(AspeedMachineState *bmc)
>       i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 9), TYPE_TMP105,
>                        0x4a);
>   
> -    /* The witherspoon board expects Epson RX8900 I2C RTC but a ds1338 is
> -     * good enough */
> +    /*
> +     * The witherspoon board expects Epson RX8900 I2C RTC but a ds1338 is
> +     * good enough
> +     */
>       i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 11), "ds1338", 0x32);
>   
>       smbus_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 11), 0x51,

