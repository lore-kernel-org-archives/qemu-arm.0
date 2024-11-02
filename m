Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp1136143njc;
        Sat, 2 Nov 2024 07:59:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWHIc77qQnDOFykjoBH36t4PtyaKWv0vpNeIXDQnaPY8mVRsSKryEsdSIum6nfzeiqnUrT2UB86PtxrXQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEDJYoIesY3hR2sJKIDmM7gmEGTg+fxyPtje/HUlyz3MltLmj1npWym3zI7T9QkMHx0/ZkP
X-Received: by 2002:ac8:5712:0:b0:458:532c:1e6f with SMTP id d75a77b69052e-4613c19bce0mr336199951cf.55.1730559546822;
        Sat, 02 Nov 2024 07:59:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730559546; cv=none;
        d=google.com; s=arc-20240605;
        b=hivxNKbtnjwmmSsvkNk0M2ZzZSjxSjV54UB/W43yBiInsKTNQYWlHAAonT9QVtOhh+
         7nV14rLHvZHP5Mpirj3TPw5zaUs3qutIqN2M8l3RW5cRyjtyYdTJ8Y6sfFhqjv1YfLGM
         9QWwDzOzzfLxzN6y9q2QCR5R9KD2hvy2J6aeAJaNU5E8fmRADvgPCCDslCq5WlV9Zx2G
         0dBGiZvl4qe2frFV9aYTtQbH/RiHMCwyPZeLo5RcwkGQPZCnCYkPgvEaLGFqUW1CuwjM
         RAjEv/39c3qxOB/wcuT3wdlNiMpnDrq9Gch1xaJihGrzI536Sv23if/cCHT6euAwnzyh
         fLww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=vjK2D+adJQRUZdxCl2Nr9Ld7plkNVe+eawjC9ht5ggU=;
        fh=1SU49qERdjFJ+Fjo91JCS1ZXI8rTWTcI/lrYX/VRevc=;
        b=j83atpLQhEhMEc0ykt6OwwSIWYetRVbeBQEw7+8o0WD5guu11gPqlmo8L25jEtLeub
         P7zCZviS8+H8qprt+MK5NRQyH6scgn9qmPAiVes8TYN7a11LgzG2OuXJ4+mafwEh+MML
         jKXsLvjFBW8JC5YCgsRRJpxkRpDioHMGIb/w/sSxilKxFeu6kw9s2SVcCZ6xunaKJQWJ
         ogeKEFVqF9j+uVsxM3vczl4ZRUPhb1ej/i+tE04DRVab2DcDHkzjQX14IG8LvKyn6orJ
         StxiEjwi6t9Z6nL/DJWbF/FGabpysT1MNo5qFZx2ytJKsiGTGFsRwHaGhzCz09oi9zYg
         5tug==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ad24daa5si65143841cf.650.2024.11.02.07.59.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 02 Nov 2024 07:59:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t7Fa7-00042e-KA; Sat, 02 Nov 2024 10:58:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=uVOK=R5=kaod.org=clg@ozlabs.org>)
 id 1t7Fa5-00041v-Jg; Sat, 02 Nov 2024 10:58:25 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=uVOK=R5=kaod.org=clg@ozlabs.org>)
 id 1t7Fa3-0002zt-64; Sat, 02 Nov 2024 10:58:25 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4XggpB6mbSz4x8W;
 Sun,  3 Nov 2024 01:58:10 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xggp76Bv0z4x7G;
 Sun,  3 Nov 2024 01:58:07 +1100 (AEDT)
Message-ID: <966987ee-060d-49c0-ac71-f6675f63d52e@kaod.org>
Date: Sat, 2 Nov 2024 15:58:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/arm: enable at24c with aspeed
To: Patrick Leis <venture@google.com>, peter.maydell@linaro.org,
 steven_lee@aspeedtech.com, "leetroy@gmail.com >> Troy Lee"
 <leetroy@gmail.com>, jamin_lin@aspeedtech.com, andrew@codeconstruct.com.au,
 joel@jms.id.au
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20241028181420.1438938-1-venture@google.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20241028181420.1438938-1-venture@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=uVOK=R5=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_MED=-2.3,
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
X-TUID: FmdCQiZrAYZy

On 10/28/24 19:14, Patrick Leis wrote:
> Enable AT24C with ASPEED in the KConfig because the boards build this
> device.
> 
> Signed-off-by: Patrick Leis <venture@google.com>
> ---
>   hw/arm/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index e7fd9338d1..1b25e73578 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -539,6 +539,7 @@ config ASPEED_SOC
>       select PMBUS
>       select MAX31785
>       select FSI_APB2OPB_ASPEED
> +    select AT24C
>   
>   config MPS2
>       bool


Applied to aspeed-next.

Thanks,

C.


