Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp6579940njn;
        Tue, 21 Jan 2025 02:39:53 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWdROQuYysiaCqpQHRR210vR/E+a6Xyxqst6gQ/gfmsH8fDNL6VVUzdv/bJ83t+lg5fFLDiJQAFZ/QWpA==@linaro.org
X-Google-Smtp-Source: AGHT+IFxsvc8Bw26u2skZUSBqVkueR76Jgn0jEvE1EonBuV038jzaVFKswTBLliE5hwhkkB9VNQD
X-Received: by 2002:a05:6214:486:b0:6d8:e7c9:ffa0 with SMTP id 6a1803df08f44-6e192c73ef5mr351805606d6.19.1737455993514;
        Tue, 21 Jan 2025 02:39:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737455993; cv=none;
        d=google.com; s=arc-20240605;
        b=gc5Izg6m8Ugm3ldGcJU0dI4DOYihtDIvPiEWZSacaVNu2t+XBo3ahQjp/BedTYPvIy
         kOCrwwmhSlJCbAThxBBqb4dB+an/Lzm8DZ6dgKRpKKqvJ2uKf8+dJ8qsZiAacWZ1mViV
         XcsYPSYDa9/tNuKeMOiehXUZOcHjVyGyJdmyTdMw5JsKenU/IsbgxIx7yd2v1LqkkuIQ
         b0Y45Bp1s5YimQkLTPIcXhebYW3xkB67Ft7eUSXZbGH5zZ35wrafxmSskYFHqgxn2Q9E
         PNpVJfgwdgWGhVPPm7R4BBPcf/7jcDlc8Yh4y9Q6JySJwFhSWHsmS6myqvy9EZy07328
         EsiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id;
        bh=pA4PHcSv3H680ARJBKyeAQmZL6ytckUfw7QoJ0ApQOU=;
        fh=xBZN4dvZgh4ulEil/F/IiDrECbWPxH0BDhZn0rcjSj4=;
        b=CvFpFDAoN0w50YfqwxC26WWFgKbuBb+PQYDjvQhHPyPK4dnz1RaY7Ww4hqhAJ3n5b5
         Vrzr0pbpKuohYeHd//lThsAIEkoyme6HE8MIByQaAtvBUbgjh4m2QQVHYdU96EDO7iKf
         y179jo4bUh9htLxieFuEW4JggMuZiKWLmVFrcya6eedHte6ud6oXQneLc/kxLDXxBsPu
         IP2lzjRPlr+akUtdi0m3xvJVweSqQihbtN40v6Th+DGQywcLfiTLgszgUZdsDk83KhnO
         h9QDRHJLW7k3bQyEk1kYl2T8rtTUysXXIBtIyq9ygM/fmeKN1Qnwy9De0ZUrioUhO8D5
         v+UA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e104bbfedsi118523981cf.643.2025.01.21.02.39.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jan 2025 02:39:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1taBfB-00020F-6E; Tue, 21 Jan 2025 05:39:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=bIEm=UN=kaod.org=clg@ozlabs.org>)
 id 1taBf9-0001zR-8X; Tue, 21 Jan 2025 05:39:15 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=bIEm=UN=kaod.org=clg@ozlabs.org>)
 id 1taBf6-0002aX-J4; Tue, 21 Jan 2025 05:39:15 -0500
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4YckG901zfz4x8f;
 Tue, 21 Jan 2025 21:38:57 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4YckG06Vqtz4wxm;
 Tue, 21 Jan 2025 21:38:48 +1100 (AEDT)
Message-ID: <26daf2e4-dcf3-4da2-b9aa-63de37ecf877@kaod.org>
Date: Tue, 21 Jan 2025 11:38:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] hw/sd/sdhci: Introduce a new Write Protected pin
 inverted property
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:SD (Secure Card)"
 <qemu-block@nongnu.org>, Bernhard Beschow <shentey@gmail.com>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
References: <20241114094839.4128404-1-jamin_lin@aspeedtech.com>
 <20241114094839.4128404-3-jamin_lin@aspeedtech.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Autocrypt: addr=clg@kaod.org; keydata=
 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
In-Reply-To: <20241114094839.4128404-3-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=bIEm=UN=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_MED=-2.3,
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
X-TUID: ic5+5D+YGqaf

Jamin,

+Bernhard

On 11/14/24 10:48, Jamin Lin wrote:
> The Write Protect pin of SDHCI model is default active low to match the SDHCI
> spec. So, write enable the bit 19 should be 1 and write protected the bit 19
> should be 0 at the Present State Register (0x24). However, some boards are
> design Write Protected pin active high. In other words, write enable the bit 19
> should be 0 and write protected the bit 19 should be 1 at the
> Present State Register (0x24). To support it, introduces a new "wp-inverted"
> property and set it false by default.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> Acked-by: Cédric Le Goater <clg@redhat.com>

When you have some time, could you please check that this change fits
the aspeed needs :

   https://lore.kernel.org/qemu-devel/20250108092538.11474-9-shentey@gmail.com/

It should be merged shortly.

Thanks,

C.




> ---
>   hw/sd/sdhci.c         | 6 ++++++
>   include/hw/sd/sdhci.h | 5 +++++
>   2 files changed, 11 insertions(+)
> 
> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> index 37875c02c3..06d1e24086 100644
> --- a/hw/sd/sdhci.c
> +++ b/hw/sd/sdhci.c
> @@ -274,6 +274,10 @@ static void sdhci_set_readonly(DeviceState *dev, bool level)
>   {
>       SDHCIState *s = (SDHCIState *)dev;
>   
> +    if (s->wp_inverted) {
> +        level = !level;
> +    }
> +
>       if (level) {
>           s->prnsts &= ~SDHC_WRITE_PROTECT;
>       } else {
> @@ -1550,6 +1554,8 @@ static Property sdhci_sysbus_properties[] = {
>                        false),
>       DEFINE_PROP_LINK("dma", SDHCIState,
>                        dma_mr, TYPE_MEMORY_REGION, MemoryRegion *),
> +    DEFINE_PROP_BOOL("wp-inverted", SDHCIState,
> +                     wp_inverted, false),
>       DEFINE_PROP_END_OF_LIST(),
>   };
>   
> diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
> index 6cd2822f1d..38c08e2859 100644
> --- a/include/hw/sd/sdhci.h
> +++ b/include/hw/sd/sdhci.h
> @@ -100,6 +100,11 @@ struct SDHCIState {
>       uint8_t sd_spec_version;
>       uint8_t uhs_mode;
>       uint8_t vendor;        /* For vendor specific functionality */
> +    /*
> +     * Write Protect pin default active low for detecting SD card
> +     * to be protected. Set wp_inverted to invert the signal.
> +     */
> +    bool wp_inverted;
>   };
>   typedef struct SDHCIState SDHCIState;
>   

