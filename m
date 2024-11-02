Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp1141511njc;
        Sat, 2 Nov 2024 08:06:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUQTyjU+TRWMsB2Z4cCZEQux+b9h4xdwtNpcOsboBz9iEPlax8X1woskMVv9aa93UhBa8hFxEq9yO8xgQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGQqXF5xudmEb2VveUZBVWs74IbLyylub9IR+RXmXzWfsF11l9lKOJp9i3YhWlCABIPNQu8
X-Received: by 2002:a0c:ec0c:0:b0:6d3:5274:f37e with SMTP id 6a1803df08f44-6d35274f42dmr125106096d6.40.1730559996004;
        Sat, 02 Nov 2024 08:06:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730559995; cv=none;
        d=google.com; s=arc-20240605;
        b=gj5GGrxlV5nnF+SWPBmSVd/JBAhAGx9r/nmb5qg+I2P0N9et/Yyx593QXkjF6/coqF
         WfWCxsR1qzkKYK0jnZ6E+oTGdVwf/diIusT2PXnmjIYu0MkgppSyulhjRchizDewZU0X
         iAmCcK05JBbBYYX90bMQPMePIB9SqLE3Q7VR++Ssb72UC0PYGnPX0r9+NtbQRlInNR/a
         J8fFEXNw8sBwZi2Ze8DDYPSqsWr12oGu9kqlbOgOVtCUmMc2LnFiJRnipCqbCA5318oW
         TRNitzC38Eff1WMSMKsdZdjzctaANnrGR6wgh3wch//SuBW9V5wdH8Ctm2eGVzDIfCjJ
         HaRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=dtEShMJiq97tXPYWxI3gXdjJ/zN7jrEN7Elu5NQ3cow=;
        fh=6ILVr1oEIca51E/DhccYCIeasNpl/rrGbbtj0Cc168M=;
        b=PQyQf/qdueva9sdij9SxP9A9UbJHGvYPwxMqWSkhORhpZzVYQ6u90PKqNJqpuzR+Xy
         nVWLGfy14AyHc3t3Ia1xm7+d8ETEOkPNIk5rqJgfQkGW8mdpdAu5ogb8LZUiS1Knd5TV
         FXhYoIEYiMJOV/aGzY5tVRUZKEkKYd6+B3l6//4PPxd9NroW4/Afqni0woko6ZUI6jwz
         XvNJC5WnlmdBz3JrU2CnS8HbJcHsX6TXFm5UsDjNPMy7a8eCM0Zl4uE/rW5D5DbPezWp
         3u7b8Mmqq6lnQFcLZZw8vqEhJ4RlkL64XEBTLv9oEC9tG2OAtZMx+PsM2/2o59wiYeDN
         NUmQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d353fa8895si70043596d6.49.2024.11.02.08.06.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 02 Nov 2024 08:06:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1t7Fhm-0002mU-8w; Sat, 02 Nov 2024 11:06:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=uVOK=R5=kaod.org=clg@ozlabs.org>)
 id 1t7Fhg-0002lS-Gw; Sat, 02 Nov 2024 11:06:16 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=uVOK=R5=kaod.org=clg@ozlabs.org>)
 id 1t7Fhe-000606-Tc; Sat, 02 Nov 2024 11:06:16 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4XggzQ1Kysz4x8W;
 Sun,  3 Nov 2024 02:06:10 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4XggzL5tqDz4x7G;
 Sun,  3 Nov 2024 02:06:06 +1100 (AEDT)
Message-ID: <9fa94cbc-8010-4805-be44-939ce35182dc@kaod.org>
Date: Sat, 2 Nov 2024 16:06:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/sd/sdcard: Fix calculation of size when using eMMC
 boot partitions
To: Jan Luebbe <jlu@pengutronix.de>, qemu-devel@nongnu.org
Cc: Guenter Roeck <linux@roeck-us.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org, qemu-block@nongnu.org
References: <1bce4c22-9281-44c5-8acb-860881dc271c@kaod.org>
 <20241028162308.2152712-1-jlu@pengutronix.de>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20241028162308.2152712-1-jlu@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=uVOK=R5=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_MED=-2.3,
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
X-TUID: cP2yrxOCiE1H

Philippe,

I can take this patch through the aspeed branch.

Thanks,

C.

On 10/28/24 17:23, Jan Luebbe wrote:
> The sd_bootpart_offset() function calculates the *runtime* offset which
> changes as the guest switches between accessing the main user data area
> and the boot partitions by writing to the EXT_CSD_PART_CONFIG_ACC_MASK
> bits, so it shouldn't be used to calculate the main user data area size.
> 
> Instead, subtract the boot_part_size directly (twice, as there are two
> identical boot partitions defined by the eMMC spec).
> 
> Suggested-by: Cédric Le Goater <clg@kaod.org>
> Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
> --->   hw/sd/sd.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index 2d3467c3d956..8430d5ae361c 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -826,7 +826,9 @@ static void sd_reset(DeviceState *dev)
>           sect = 0;
>       }
>       size = sect << HWBLOCK_SHIFT;
> -    size -= sd_bootpart_offset(sd);
> +    if (sd_is_emmc(sd)) {
> +        size -= sd->boot_part_size * 2;
> +    }
>   
>       sect = sd_addr_to_wpnum(size) + 1;
>   

