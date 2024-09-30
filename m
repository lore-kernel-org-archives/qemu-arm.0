Received: by 2002:a17:505:70c3:b0:1be9:327d:8ee3 with SMTP id lw3csp1109134njc;
        Mon, 30 Sep 2024 02:12:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVbyuKCSbVwMFviHIG6nMjtv0sahh4QUptmYYOIgcL1fzKgbbDZryY7J4d64JpnqT9jpKKBZLi/INqjPw==@linaro.org
X-Google-Smtp-Source: AGHT+IFPjIBnhVhS3dSit3ah1lq9QcbcLUjvXfwJUlCzx+f7MQg9e7ub6CwO9Jlw4PMB4ZJnU+ta
X-Received: by 2002:a05:622a:1904:b0:456:9494:aa91 with SMTP id d75a77b69052e-45c9ecbdb6cmr181118861cf.16.1727687579387;
        Mon, 30 Sep 2024 02:12:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727687579; cv=none;
        d=google.com; s=arc-20240605;
        b=UTUCalI8FkK6JwUxKunqj3U8aG5GYlDq26MFc7gzWwAoe8glvK3+cWRqFCkXARm+vo
         7nxOOK2NTOntFOqEOLPHeXmaNzxqSaMaUy9hYnUehyqrESbPZb58kSbEVxKfFzpBkfj0
         O7FOykVmbc9bkNLEXghfsHgMAjUAc4xz3Ue+/k2+JESCBRXqv8Q7gjiz7iZfMzF3H8yq
         3t6FSNe/aWwUpyMV3li51MZeP8I93tK5wTyxYEmaxXWsuYZ27jSiGyox5Po6T5sOTh0f
         eRqJTQ9vdl0Mb8ubKEz4wXAdcLqfA+xECYGnWHBh1Dyz7w/shMT6vSBs/B/E1H8T/Emz
         GxxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=pcfLkD5O3Yi/aQU+iB/mMmDxKLhsuUXaKuubExsJ0og=;
        fh=97uyR/uuvr4jnX3vPrzCNtEvGPs9ZT7AiNCQmcU+/V4=;
        b=aK1rZmut3fSfWeq44KrrPWN8RKVhtuFwUiOrYNhJ2YUKCnfvYqGMls+53U9DoWkI1u
         iX9I2/W/vN5R1sYztnOVUaQGsW1ElxIZ+agwfMyNwM31gwdpngPlEorasuBz5wteau0J
         Y/xRgHCrk9NMYOIzT8UWDmcVXA/fM6qyPCdHmuMnyo6QDWJ+936vq1tVsaJnBTLcysU/
         oqPL+Xfmb2GE3F+RW5J1lWOoFpDxUV8g8VRdQ795pxco3WDmFy7a/FPmOQTLk4wPMx+y
         0nZk9q1yYOVQ33fMIVaofH3Omd1JuaSCdEA+Ew+SdLTr1Dk9F8Mr/UiM5gxVujhoFAHM
         bPiA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45c9f382cdcsi76512521cf.678.2024.09.30.02.12.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Sep 2024 02:12:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1svCRf-000142-9m; Mon, 30 Sep 2024 05:11:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=qSCK=Q4=kaod.org=clg@ozlabs.org>)
 id 1svCRY-0000fY-4n; Mon, 30 Sep 2024 05:11:49 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=qSCK=Q4=kaod.org=clg@ozlabs.org>)
 id 1svCRW-0004Xd-0q; Mon, 30 Sep 2024 05:11:47 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4XHFgb5fZKz4wbv;
 Mon, 30 Sep 2024 19:11:39 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4XHFgW0qPKz4wcL;
 Mon, 30 Sep 2024 19:11:34 +1000 (AEST)
Message-ID: <b73a755f-69ae-4132-bcfb-950ac9e3acfb@kaod.org>
Date: Mon, 30 Sep 2024 11:11:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [SPAM] [PATCH v6 6/8] aspeed/soc: Correct GPIO irq 130 for AST2700
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
References: <20240930085239.3089901-1-jamin_lin@aspeedtech.com>
 <20240930085239.3089901-7-jamin_lin@aspeedtech.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240930085239.3089901-7-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=qSCK=Q4=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: BfdHuXHj+Zzg

On 9/30/24 10:52, Jamin Lin wrote:
> The register set of GPIO have a significant change since AST2700.
> Each GPIO pin has their own individual control register and users are able to
> set one GPIO pin’s direction, interrupt enable, input mask and so on in the
> same one control register.
> 
> AST2700 does not have GPIO18_XXX registers for GPIO 1.8v, removes
> ASPEED_DEV_GPIO_1_8V. It is enough to only have ASPEED_DEV_GPIO
> device in AST2700.
> 
> The AST2700 GPIO controller interrupt is connected to GICINT130_INTC at
> bit 18. Therefore, correct GPIO irq 130.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>


Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> ---
>   hw/arm/aspeed_ast27x0.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
> index 761ee11657..99135edc1e 100644
> --- a/hw/arm/aspeed_ast27x0.c
> +++ b/hw/arm/aspeed_ast27x0.c
> @@ -87,8 +87,7 @@ static const int aspeed_soc_ast2700_irqmap[] = {
>       [ASPEED_DEV_ADC]       = 130,
>       [ASPEED_DEV_XDMA]      = 5,
>       [ASPEED_DEV_EMMC]      = 15,
> -    [ASPEED_DEV_GPIO]      = 11,
> -    [ASPEED_DEV_GPIO_1_8V] = 130,
> +    [ASPEED_DEV_GPIO]      = 130,
>       [ASPEED_DEV_RTC]       = 13,
>       [ASPEED_DEV_TIMER1]    = 16,
>       [ASPEED_DEV_TIMER2]    = 17,
> @@ -124,7 +123,7 @@ static const int aspeed_soc_ast2700_gic128_intcmap[] = {
>   static const int aspeed_soc_ast2700_gic130_intcmap[] = {
>       [ASPEED_DEV_I2C]        = 0,
>       [ASPEED_DEV_ADC]        = 16,
> -    [ASPEED_DEV_GPIO_1_8V]  = 18,
> +    [ASPEED_DEV_GPIO]       = 18,
>   };
>   
>   /* GICINT 131 */

