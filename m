Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp461179njb;
        Thu, 4 Jul 2024 01:54:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXU27BN69bgW6nyFSie2REcU/DztisQKOOXFWgL8lVRGiHNfe6lPJpfzgRuHKKQ0yf4JzdJmU0FE827I+1TfHzUg7RXA77e
X-Google-Smtp-Source: AGHT+IEj0OdGJc33hPhvmwsBMsvUZK64/yT/c4L/JrX8RVdiogk4G3x/7ZebVBUByERv8r/Gak4k
X-Received: by 2002:a05:622a:494:b0:446:4007:4c22 with SMTP id d75a77b69052e-447cbf0352amr10562161cf.35.1720083294807;
        Thu, 04 Jul 2024 01:54:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720083294; cv=none;
        d=google.com; s=arc-20160816;
        b=Lm6suMCX8GUwP3zx5XDY3DPgrB7+RtKQt2y46jqzBfecBHKTsa18oM1OnPs6ULTWTc
         5+L5d0jk3fHYlFWkYQCc/1eVbPFdIQSRdmrq+WU69N3j2sSbNXxWCQ8KzbzbHCrRObgk
         0O4Mu2RDdWRSYmOCgIPXUUlKMYn74O0rjOzzeXfXgsL0eKWrlqSYuXv14zsNUaYXuTQ9
         pNzVzSO4XulQRU9QSxito40X/ERv14eP8rziF9s8BE+qAxwp6/2SL1tMNwBzcwYEIrg8
         +rTHiJ9LAkIH9UMMlRxC+p/gLVmxVml+PamdvMwMdzAbWvc0kSGuCa/Bks21sLttDp3L
         n8NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=J7rxiAhUV2D4FtETQKGz1ZH25I+dJfGhiPmF6Kqq7KA=;
        fh=99LDCLNDIGyo70K5tizYz4Wx+QKxBdnC4BaKqLN7Z0w=;
        b=J7PnRbu0CTL24/Y9EUOiBYhkx0hfnIgufwCLnUbcVQWmgHdKBYfUp+mNupLawC8TQZ
         LWCHndefFufHgh9cSxR5HyjXSbcy82/DEqhaSxjUjGEKX4bLtIpuYkFvE7D9B4rhNV0d
         Vphu/PVatLKXMpiUSidmNxtjPLotT5WJ/+gb90FGokag7aznulJSYz3El5kHbO2HAPOK
         EGT1aOih7lX7sfTtVnbl0PVwmRlRbSPAmh//Q8dnwAVx81UZGAQFiOBOgonk5gVcLw8z
         m7V2aFoyFMj2KE7fQFAYJzSvqcQqq3vJ6qms6MYs4ZGxS/2eT3fUV3SyVzSenF1tGg8A
         cPHA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-446514a4d4csi144833071cf.482.2024.07.04.01.54.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jul 2024 01:54:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sPIEc-0001XQ-CZ; Thu, 04 Jul 2024 04:54:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=mgHy=OE=kaod.org=clg@ozlabs.org>)
 id 1sPIEZ-0001Ve-Cu; Thu, 04 Jul 2024 04:54:31 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=mgHy=OE=kaod.org=clg@ozlabs.org>)
 id 1sPIEX-0003b4-Gc; Thu, 04 Jul 2024 04:54:30 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4WF9SL6Lnjz4x0w;
 Thu,  4 Jul 2024 18:54:26 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4WF9SC6lFZz4wny;
 Thu,  4 Jul 2024 18:54:19 +1000 (AEST)
Message-ID: <f3c9ee66-3dff-4fc9-b786-d4c8068837fe@kaod.org>
Date: Thu, 4 Jul 2024 10:54:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/8] aspeed/soc: set dma64 property for AST2700
 ftgmac100
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:Block layer core" <qemu-block@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
References: <20240704082922.1464317-1-jamin_lin@aspeedtech.com>
 <20240704082922.1464317-6-jamin_lin@aspeedtech.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240704082922.1464317-6-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=mgHy=OE=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
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
X-TUID: zdzf7kHoovc6

On 7/4/24 10:29 AM, Jamin Lin wrote:
> ASPEED AST2700 SOC is a 64 bits quad core CPUs (Cortex-a35)
> And the base address of dram is "0x4 00000000" which
> is 64bits address.
> 
> Set dma64 property for ftgmac100 model to support
> 64bits dram address DMA.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>


Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> ---
>   hw/arm/aspeed_ast27x0.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
> index 18e6a8b10c..a9fb0d4b88 100644
> --- a/hw/arm/aspeed_ast27x0.c
> +++ b/hw/arm/aspeed_ast27x0.c
> @@ -552,9 +552,12 @@ static void aspeed_soc_ast2700_realize(DeviceState *dev, Error **errp)
>           return;
>       }
>   
> +    /* Net */
>       for (i = 0; i < sc->macs_num; i++) {
>           object_property_set_bool(OBJECT(&s->ftgmac100[i]), "aspeed", true,
>                                    &error_abort);
> +        object_property_set_bool(OBJECT(&s->ftgmac100[i]), "dma64", true,
> +                                 &error_abort);
>           if (!sysbus_realize(SYS_BUS_DEVICE(&s->ftgmac100[i]), errp)) {
>               return;
>           }

