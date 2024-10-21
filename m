Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp2238297njb;
        Mon, 21 Oct 2024 02:07:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVD+jsOmhU0o69FskQ3/j1A4JMd8bVND+yX+Bqx5kGgAWIA5qYnQNEJeUzs1KwMXzJxlHlkgMdy0Ye1Fg==@linaro.org
X-Google-Smtp-Source: AGHT+IFKkYnToCyWzogJ2gI3bFxuUWb/0Wam5iGjUiMcZlPQ0Xd4jvIMk6pWlTCtfvnlj85GGXPD
X-Received: by 2002:a05:622a:4ccc:b0:460:961e:9996 with SMTP id d75a77b69052e-460aed030c8mr168667021cf.7.1729501664621;
        Mon, 21 Oct 2024 02:07:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729501664; cv=none;
        d=google.com; s=arc-20240605;
        b=FyZagUL/8ZhPhLGaSz1kTv0nw53f2E6/ysIaEr9fyxKBlY0JWeqKFgxlQYnUDCxo0J
         lV63Kj5j2dYcTZ+TthHXJn3HBSU0lkm+Kh/RqYqEXYJBIzKP7fO2M4ORgcxHktue65na
         4iWOFUAG6pBB4w8RPgmmzjf3KexJf2G8o7Fl2hQK1gUCwTi3giQdX+jSPJ93FUTEZVmj
         5Evpv5o2HvDrLM0Q9IDi7iBjKOO10vvXKEe6CyMnjINsHkIcspMbE7GL+UuybgebqKJy
         2kYwLwQu+fDrrVcWRYFNbmIHlN77vXFX/fhzo0ddG8cdYTCGXUpcO59tXUCU/Y46RZX6
         KcSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=qt76O8XAwYp/2+c2sOhMFEQeu6RfhuRTvusiPX2UxHs=;
        fh=4mlnkPeqTwuu2Qx8qreMlJHQU0w7aOUfwVS+XUkOkGE=;
        b=Y9PVXOhExtC793nxsJsjPQ6LQriH8F2nJUP49W48q4zpfbMTWUgcSTw/pFUILcTMp3
         i1nmzXmuWfiqGP9OiJmVzW1DImztNGLvn/5ux51ypLYdO+I8orBTC4vhB3Fh9pFTJ/qY
         ci+fXgFloJQFApdvomzlOeq0fmETZ8mc9l5H2vkcEPvWXxBtr9q50I5OHDiOF6U3loJt
         0otUh5C+CpTDWjWSt7gaQUss4JsSZJqT4ELJoD7FzPPaaRKppqkOWE8gcoRSr5K95HVV
         Y8EQUvrwCAhhggOq3Kt0bjNoKbtYxBgvMA8Ap3e7KjVe/17Na9aYVzkx1ICUTDr7/Ixn
         1d5w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-460d3b36805si34787611cf.27.2024.10.21.02.07.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2024 02:07:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t2oO3-0002p8-Dq; Mon, 21 Oct 2024 05:07:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=cGEO=RR=kaod.org=clg@ozlabs.org>)
 id 1t2oO1-0002fv-Pr; Mon, 21 Oct 2024 05:07:37 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=cGEO=RR=kaod.org=clg@ozlabs.org>)
 id 1t2oO0-00006o-3R; Mon, 21 Oct 2024 05:07:37 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4XX8b81jY0z4wxx;
 Mon, 21 Oct 2024 20:07:32 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4XX8b26cv3z4wb5;
 Mon, 21 Oct 2024 20:07:26 +1100 (AEDT)
Message-ID: <32905623-e72b-4c91-bf0b-d41e5725eef2@kaod.org>
Date: Mon, 21 Oct 2024 11:07:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [SPAM] [PATCH v1 06/16] hw/arm/aspeed: Correct fmc_model w25q80bl
 for ast1030-a1 EVB
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
 <20241018053112.1886173-7-jamin_lin@aspeedtech.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20241018053112.1886173-7-jamin_lin@aspeedtech.com>
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
X-TUID: hWwLuGAAx5b3

On 10/18/24 07:31, Jamin Lin wrote:
> Currently, the default fmc_model was "sst25vf032b" whose size was 4MB for
> ast1030-a1 EVB. However, according to the schematic of ast1030-a1 EVB,
> ASPEED shipped default flash of fmc_cs0 and fmc_cs1 were "w25q80bl" and
> "w25q256", respectively. The size of w25q80bl is 1MB and the size of w25q256
> is 32MB.
> 
> The fmc_cs0 was connected to AST1030 A1 internal flash and the fmc_cs1 was
> connected to external flash. The internal flash could not be changed because
> it was placed into AST1030 A1 chip. Users only can change fmc_cs1 external
> flash.
> 
> So far, only supports to set the default fmc_model for all chip select pins.
> In other words, users cannot set the different default flash model for
> fmc_cs0 and fmc_cs1, respectively.
> 
> Correct fmc_model default flash to w25q80bl the same as AST1030 A1
> internal flash for ast1030-a1 EVB.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>


Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> ---
>   hw/arm/aspeed.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index bf68224295..b4b1ce9efb 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -1642,7 +1642,7 @@ static void aspeed_minibmc_machine_ast1030_evb_class_init(ObjectClass *oc,
>       mc->init = aspeed_minibmc_machine_init;
>       amc->i2c_init = ast1030_evb_i2c_init;
>       mc->default_ram_size = 0;
> -    amc->fmc_model = "sst25vf032b";
> +    amc->fmc_model = "w25q80bl";
>       amc->spi_model = "w25q256";
>       amc->num_cs = 2;
>       amc->macs_mask = 0;

