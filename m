Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp3553856njd;
        Thu, 24 Apr 2025 01:44:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXSqJxmQz7reXtvuiC+b2yyZUwaKVwrQRWDwFi7rky8BaW6SLizV2i/ohdraj0XFhLaelTgEZAsAygGgw==@linaro.org
X-Google-Smtp-Source: AGHT+IErasoXVC6QoVYDE92wQ/U+zMuKjksNhIiIR4VA0DMHwE1bjIKlalDddt96whzETUjSgqRM
X-Received: by 2002:a05:6214:2305:b0:6e8:fee2:aadf with SMTP id 6a1803df08f44-6f4bfc6ce3fmr29311976d6.31.1745484260335;
        Thu, 24 Apr 2025 01:44:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745484260; cv=none;
        d=google.com; s=arc-20240605;
        b=denvAcKqW6dWoDRautctb6niDdAjULBxZvrr5ejY2e1NccooAm8CD+4dZ5svINiZsX
         NrsdavOIZoRBKiTxf+Ou5aMd+UGqDmhSA7XznlbqG2qRuzaDlCkNPBpQUrYs/gmjkIYa
         PTdlNJ38d6VVzEGbevAxg/3UCm+BqmV2sEpxH19Z5AWOhwUtEFNmR60a1vwzD/5ClcWJ
         LOS77ji2C5C8ym5JlTBR1NzsxKagmrBNvoG+YWQH2TTcZL+u6EgyOpt42M6VDHtiIaPl
         IXa/ATIHe+N3M/Xzg/LEtF/fkTjykd8HjHO34P8BHintWQappEI517v7HgPm6p08d7Z4
         1F0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id;
        bh=J8L2BgfkX79O8N8ew/c5yst1+DTuLV64kWrktB2EWjs=;
        fh=aTXBRWvcUi1tLADA5DrDnV7F47mfdIt5smkQi/SmRpk=;
        b=Us+ZC9+0ehSxAMa3TtiqU7Xe9y5i748Dy6TWPnsClqgavobZRecillIy+h/4UtFHaB
         rT2fiPcIlrGUfaGC4aGVFRwnofxjZANNHLbZ0G3BxTdjS2y5FL1cFqPle7pYgtN/Ykxy
         l5jGnlfK62mVsm3s981Bf4ZLx6c6Xaty7dsYokNyhOiP/lxrB76rYC9yXfFIEiiVx80Z
         LuEcmO4UkKviS8UZHcL58X3wkAdUHW4Kaog1+WRp6BwEQ3cd5DOWLqP0WABkDl1++1fW
         jgd2QU1DgNXeMsF9ypo8ogRyuf67/liZ4mfoanpDlOCYYLvb7Obd8+t78E7gfxQ+GVnp
         71Tg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f4c08d6581si10748706d6.22.2025.04.24.01.44.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Apr 2025 01:44:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u7sBo-00016G-D2; Thu, 24 Apr 2025 04:44:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=52tn=XK=kaod.org=clg@ozlabs.org>)
 id 1u7sBl-00011s-0A; Thu, 24 Apr 2025 04:44:09 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=52tn=XK=kaod.org=clg@ozlabs.org>)
 id 1u7sBi-0003tj-9y; Thu, 24 Apr 2025 04:44:08 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4ZjqJY5sFmz4xMy;
 Thu, 24 Apr 2025 18:43:57 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZjqJV2VMZz4wcr;
 Thu, 24 Apr 2025 18:43:54 +1000 (AEST)
Message-ID: <05e1903a-2896-4a06-8507-c97182930a22@kaod.org>
Date: Thu, 24 Apr 2025 10:43:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/6] hw/arm/aspeed_ast27x0 Introduce vbootrom memory
 region
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
Cc: troy_lee@aspeedtech.com, nabihestefan@google.com
References: <20250424075135.3715128-1-jamin_lin@aspeedtech.com>
 <20250424075135.3715128-2-jamin_lin@aspeedtech.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Autocrypt: addr=clg@kaod.org; keydata=
 xsFNBFu8o3UBEADP+oJVJaWm5vzZa/iLgpBAuzxSmNYhURZH+guITvSySk30YWfLYGBWQgeo
 8NzNXBY3cH7JX3/a0jzmhDc0U61qFxVgrPqs1PQOjp7yRSFuDAnjtRqNvWkvlnRWLFq4+U5t
 yzYe4SFMjFb6Oc0xkQmaK2flmiJNnnxPttYwKBPd98WfXMmjwAv7QfwW+OL3VlTPADgzkcqj
 53bfZ4VblAQrq6Ctbtu7JuUGAxSIL3XqeQlAwwLTfFGrmpY7MroE7n9Rl+hy/kuIrb/TO8n0
 ZxYXvvhT7OmRKvbYuc5Jze6o7op/bJHlufY+AquYQ4dPxjPPVUT/DLiUYJ3oVBWFYNbzfOrV
 RxEwNuRbycttMiZWxgflsQoHF06q/2l4ttS3zsV4TDZudMq0TbCH/uJFPFsbHUN91qwwaN/+
 gy1j7o6aWMz+Ib3O9dK2M/j/O/Ube95mdCqN4N/uSnDlca3YDEWrV9jO1mUS/ndOkjxa34ia
 70FjwiSQAsyIwqbRO3CGmiOJqDa9qNvd2TJgAaS2WCw/TlBALjVQ7AyoPEoBPj31K74Wc4GS
 Rm+FSch32ei61yFu6ACdZ12i5Edt+To+hkElzjt6db/UgRUeKfzlMB7PodK7o8NBD8outJGS
 tsL2GRX24QvvBuusJdMiLGpNz3uqyqwzC5w0Fd34E6G94806fwARAQABzSBDw6lkcmljIExl
 IEdvYXRlciA8Y2xnQGthb2Qub3JnPsLBeAQTAQIAIgUCW7yjdQIbAwYLCQgHAwIGFQgCCQoL
 BBYCAwECHgECF4AACgkQUaNDx8/77KGRSxAAuMJJMhJdj7acTcFtwof7CDSfoVX0owE2FJdd
 M43hNeTwPWlV5oLCj1BOQo0MVilIpSd9Qu5wqRD8KnN2Bv/rllKPqK2+i8CXymi9hsuzF56m
 76wiPwbsX54jhv/VYY9Al7NBknh6iLYJiC/pgacRCHtSj/wofemSCM48s61s1OleSPSSvJE/
 jYRa0jMXP98N5IEn8rEbkPua/yrm9ynHqi4dKEBCq/F7WDQ+FfUaFQb4ey47A/aSHstzpgsl
 TSDTJDD+Ms8y9x2X5EPKXnI3GRLaCKXVNNtrvbUd9LsKymK3WSbADaX7i0gvMFq7j51P/8yj
 neaUSKSkktHauJAtBNXHMghWm/xJXIVAW8xX5aEiSK7DNp5AM478rDXn9NZFUdLTAScVf7LZ
 VzMFKR0jAVG786b/O5vbxklsww+YXJGvCUvHuysEsz5EEzThTJ6AC5JM2iBn9/63PKiS3ptJ
 QAqzasT6KkZ9fKLdK3qtc6yPaSm22C5ROM3GS+yLy6iWBkJ/nEYh/L/du+TLw7YNbKejBr/J
 ml+V3qZLfuhDjW0GbeJVPzsENuxiNiBbyzlSnAvKlzda/sBDvxmvWhC+nMRQCf47mFr8Xx3w
 WtDSQavnz3zTa0XuEucpwfBuVdk4RlPzNPri6p2KTBhPEvRBdC9wNOdRBtsP9rAPjd52d73O
 wU0EW7yjdQEQALyDNNMw/08/fsyWEWjfqVhWpOOrX2h+z4q0lOHkjxi/FRIRLfXeZjFfNQNL
 SoL8j1y2rQOs1j1g+NV3K5hrZYYcMs0xhmrZKXAHjjDx7FW3sG3jcGjFW5Xk4olTrZwFsZVU
 cP8XZlArLmkAX3UyrrXEWPSBJCXxDIW1hzwpbV/nVbo/K9XBptT/wPd+RPiOTIIRptjypGY+
 S23HYBDND3mtfTz/uY0Jytaio9GETj+fFis6TxFjjbZNUxKpwftu/4RimZ7qL+uM1rG1lLWc
 9SPtFxRQ8uLvLOUFB1AqHixBcx7LIXSKZEFUCSLB2AE4wXQkJbApye48qnZ09zc929df5gU6
 hjgqV9Gk1rIfHxvTsYltA1jWalySEScmr0iSYBZjw8Nbd7SxeomAxzBv2l1Fk8fPzR7M616d
 tb3Z3HLjyvwAwxtfGD7VnvINPbzyibbe9c6gLxYCr23c2Ry0UfFXh6UKD83d5ybqnXrEJ5n/
 t1+TLGCYGzF2erVYGkQrReJe8Mld3iGVldB7JhuAU1+d88NS3aBpNF6TbGXqlXGF6Yua6n1c
 OY2Yb4lO/mDKgjXd3aviqlwVlodC8AwI0SdujWryzL5/AGEU2sIDQCHuv1QgzmKwhE58d475
 KdVX/3Vt5I9kTXpvEpfW18TjlFkdHGESM/JxIqVsqvhAJkalABEBAAHCwV8EGAECAAkFAlu8
 o3UCGwwACgkQUaNDx8/77KEhwg//WqVopd5k8hQb9VVdk6RQOCTfo6wHhEqgjbXQGlaxKHoX
 ywEQBi8eULbeMQf5l4+tHJWBxswQ93IHBQjKyKyNr4FXseUI5O20XVNYDJZUrhA4yn0e/Af0
 IX25d94HXQ5sMTWr1qlSK6Zu79lbH3R57w9jhQm9emQEp785ui3A5U2Lqp6nWYWXz0eUZ0Ta
 d2zC71Gg9VazU9MXyWn749s0nXbVLcLS0yops302Gf3ZmtgfXTX/W+M25hiVRRKCH88yr6it
 +OMJBUndQVAA/fE9hYom6t/zqA248j0QAV/pLHH3hSirE1mv+7jpQnhMvatrwUpeXrOiEw1n
 HzWCqOJUZ4SY+HmGFW0YirWV2mYKoaGO2YBUwYF7O9TI3GEEgRMBIRT98fHa0NPwtlTktVIS
 l73LpgVscdW8yg9Gc82oe8FzU1uHjU8b10lUXOMHpqDDEV9//r4ZhkKZ9C4O+YZcTFu+mvAY
 3GlqivBNkmYsHYSlFsbxc37E1HpTEaSWsGfAHQoPn9qrDJgsgcbBVc1gkUT6hnxShKPp4Pls
 ZVMNjvPAnr5TEBgHkk54HQRhhwcYv1T2QumQizDiU6iOrUzBThaMhZO3i927SG2DwWDVzZlt
 KrCMD1aMPvb3NU8FOYRhNmIFR3fcalYr+9gDuVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <20250424075135.3715128-2-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=52tn=XK=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: a5dKRiNDMcOT

On 4/24/25 09:51, Jamin Lin wrote:
> Introduce a new vbootrom memory region. The region is mapped at address
> "0x00000000" and has a size of 128KB, identical to the SRAM region size.
> This memory region is intended for loading a vbootrom image file as part of the
> boot process.
> 
> The vbootrom registered in the SoC's address space using the ASPEED_DEV_VBOOTROM
> index.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> Reviewed-by: Nabih Estefan <nabihestefan@google.com>
> Tested-by: Nabih Estefan <nabihestefan@google.com>


Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> ---
>   include/hw/arm/aspeed_soc.h | 2 ++
>   hw/arm/aspeed_ast27x0.c     | 9 +++++++++
>   2 files changed, 11 insertions(+)
> 
> diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> index f069d17d16..b4b23d693d 100644
> --- a/include/hw/arm/aspeed_soc.h
> +++ b/include/hw/arm/aspeed_soc.h
> @@ -59,6 +59,7 @@ struct AspeedSoCState {
>       MemoryRegion sram;
>       MemoryRegion spi_boot_container;
>       MemoryRegion spi_boot;
> +    MemoryRegion vbootrom;
>       AddressSpace dram_as;
>       AspeedRtcState rtc;
>       AspeedTimerCtrlState timerctrl;
> @@ -169,6 +170,7 @@ struct AspeedSoCClass {
>   const char *aspeed_soc_cpu_type(AspeedSoCClass *sc);
>   
>   enum {
> +    ASPEED_DEV_VBOOTROM,
>       ASPEED_DEV_SPI_BOOT,
>       ASPEED_DEV_IOMEM,
>       ASPEED_DEV_UART0,
> diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
> index b05ed75ff4..968dfa5526 100644
> --- a/hw/arm/aspeed_ast27x0.c
> +++ b/hw/arm/aspeed_ast27x0.c
> @@ -24,6 +24,7 @@
>   #include "qemu/log.h"
>   
>   static const hwaddr aspeed_soc_ast2700_memmap[] = {
> +    [ASPEED_DEV_VBOOTROM]  =  0x00000000,
>       [ASPEED_DEV_SRAM]      =  0x10000000,
>       [ASPEED_DEV_HACE]      =  0x12070000,
>       [ASPEED_DEV_EMMC]      =  0x12090000,
> @@ -657,6 +658,14 @@ static void aspeed_soc_ast2700_realize(DeviceState *dev, Error **errp)
>       memory_region_add_subregion(s->memory,
>                                   sc->memmap[ASPEED_DEV_SRAM], &s->sram);
>   
> +    /* VBOOTROM */
> +    if (!memory_region_init_ram(&s->vbootrom, OBJECT(s), "aspeed.vbootrom",
> +                                0x20000, errp)) {
> +        return;
> +    }
> +    memory_region_add_subregion(s->memory,
> +                                sc->memmap[ASPEED_DEV_VBOOTROM], &s->vbootrom);
> +
>       /* SCU */
>       if (!sysbus_realize(SYS_BUS_DEVICE(&s->scu), errp)) {
>           return;

