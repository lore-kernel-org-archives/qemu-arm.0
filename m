Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp1137099njc;
        Sat, 2 Nov 2024 08:00:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUPhHIah8OhNNUyURplns3ikQcnVKR/xCivLG8rCUle4dTiGu0OWJdM94Gh4jzI1/ElqttwplStFYwzhw==@linaro.org
X-Google-Smtp-Source: AGHT+IEvU6IlcL62qs4m+bHcJGpHEoobW3fLsKFCr36gwO3COnFB383JTEe15GaMVckrs3mtVchL
X-Received: by 2002:a05:6214:440c:b0:6d1:9e72:596a with SMTP id 6a1803df08f44-6d351b20831mr146158576d6.37.1730559647978;
        Sat, 02 Nov 2024 08:00:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730559647; cv=none;
        d=google.com; s=arc-20240605;
        b=UjlF2rrLR3dg/NNV+BBM9qiGRwJvQc/BmEL2a4Ipa88e1ruAghkyFlwD8UXdTgHc+3
         Z8y4yqPM9nJMwS0c9PSLZii0GNYZJ+Q+nJxybTxaokfqc0h1A+FoySB1DUnt+yZa+9EQ
         oCl9b4oMfgCFj4oTlGJO4qlLMk151xK/m5doNHwxrTuo2K2eE+dgsw2/nCfSp5kg0uI/
         8+/az9aeLtpieGCo01biRkIDcyZxNOW4G94vKkjFIakjWKKsTsaco4jQzgJYU5QolX+w
         K21Q2i/IN67F6aCxfmR2Urrejg0XDMaIFeK2hW4JzxB+fD6FWEELMD+R4U3DdUhBHZm7
         SE/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=kLR2e7SqBES5NNpt0BpVbhcBu0olCydQJOA2joMgNj4=;
        fh=98dZCMvX+NqbPkRXvFJNDIlyaWZH4tCfmKGJXDrbs8k=;
        b=NMkcc47YKC9mWlOJjxT/8tbnlB/K27wdZBUbwc01Tnw14/pT8TaYcnb8rYo7IMky1O
         /1ua0N0tzHSgPlBRRPUIBblx/EgFFqNpf4Li6El44aInugpTmRnM7bF6n/5mlYhXBPJd
         o6VwqeDYZjlYW/SPgc9fMk4hMWG3c7ycOVF4QGH0LYyQnngZMhIeXZdGI5H/dV5GUipV
         VGhjVZXVy5WitrHIeh1iwJtqCGolno7vSuGQCwVS+zQz06/CLG0mYmXvyav3k6Ssg97M
         E9qCwPYKKw93nUlojnEkcVBTPFSNUUnxPgFX55VFuUGI4okyI8h6fI3h61DEJIM0PsLg
         7fvA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d3541802aasi67620576d6.386.2024.11.02.08.00.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 02 Nov 2024 08:00:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t7FcN-0005Er-7Y; Sat, 02 Nov 2024 11:00:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=uVOK=R5=kaod.org=clg@ozlabs.org>)
 id 1t7Fbt-00056I-5Y; Sat, 02 Nov 2024 11:00:21 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=uVOK=R5=kaod.org=clg@ozlabs.org>)
 id 1t7Fbq-0004C9-9B; Sat, 02 Nov 2024 11:00:16 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4XggrH4GDDz4x8g;
 Sun,  3 Nov 2024 01:59:59 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4XggrC0Z2dz4x7G;
 Sun,  3 Nov 2024 01:59:54 +1100 (AEDT)
Message-ID: <1f02a767-2e28-429f-ac78-fb97ac9b2854@kaod.org>
Date: Sat, 2 Nov 2024 15:59:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [SPAM] [PATCH v1 3/8] hw/timer/aspeed: Fix interrupt status does
 not be cleared for AST2600
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:SD (Secure Card)" <qemu-block@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
References: <20241029091729.3317512-1-jamin_lin@aspeedtech.com>
 <20241029091729.3317512-4-jamin_lin@aspeedtech.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20241029091729.3317512-4-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
X-TUID: PnxvEysq0ZvQ

On 10/29/24 10:17, Jamin Lin wrote:
> According to the datasheet of AST2600 description, interrupt status set by HW
> and clear to "0" by software writing "1" on the specific bit.
> 
> Therefore, if firmware set the specific bit "1" in the interrupt status
> register(0x34), the specific bit of "s->irq_sts" should be cleared 0.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>


Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> ---
>   hw/timer/aspeed_timer.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
> index 5af268ea9e..149f7cc5a6 100644
> --- a/hw/timer/aspeed_timer.c
> +++ b/hw/timer/aspeed_timer.c
> @@ -580,7 +580,7 @@ static void aspeed_2600_timer_write(AspeedTimerCtrlState *s, hwaddr offset,
>   
>       switch (offset) {
>       case 0x34:
> -        s->irq_sts &= tv;
> +        s->irq_sts &= ~tv;
>           break;
>       case 0x3C:
>           aspeed_timer_set_ctrl(s, s->ctrl & ~tv);

