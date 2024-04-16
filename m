Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp452890ejd;
        Tue, 16 Apr 2024 08:35:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXM7PM6hbGpnyRjCr8/QRMtOsSE5+8Lw1fNPR+fHwq7XtmtnduwwYFFGh2+4LjIIu/AN7yBeAGhlXaOo28uWL4XTKd7ohFa
X-Google-Smtp-Source: AGHT+IGqMdlJVUC57L1pJrPkFdpT4Ynj1Kfk9/pv1Dgb5WvaR9BYxRUM5ZG9D1BN7y+TF2OT9fam
X-Received: by 2002:a05:6122:1824:b0:4da:d617:520c with SMTP id ay36-20020a056122182400b004dad617520cmr11617243vkb.13.1713281705500;
        Tue, 16 Apr 2024 08:35:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713281705; cv=none;
        d=google.com; s=arc-20160816;
        b=HC2yEvSt4FP8HFj3IENLh68aVe6cDU8JsUj3oV37SZGAmPaJpskbAF7ra0Y0mqDAw8
         I+OtcakVveWIpiv0E0EcFLHeK20uCYCb9wRGU1n9YQ7XD+0RRHze7vNl0CGCKCTSok37
         ZfIjqyyoBeGdFTjbt4Jr20vgwP7jrzMz7zQ6uvzVdejG0VG0Wx+HA25zr/jBQzTufjWk
         G7u48gywzLk81SB93YedRvNvcYEfi1H4QIlrRIW+kabHWMrlmYYTNBo0tpqlrCHFe09o
         G3hsVJ9ep4X8PmmiXVafEJ7ks9cR6T/nXkoHh9uLkjldsTVZcaLl1P+e6TcKcEB4MX1W
         c6Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=H7zq3zOdUOxa+2HTsJym5PdHMBvnPJJFAM5abklMy1c=;
        fh=dkl4W7Ty5DQDYblIuR6iwQV8rfkW6Bl5VLJjLin9mSc=;
        b=AxoTa65OWqFELr+QT1QP6uwhCjdbAix5v0Q+rkfOmR8D579z5ZwHvl1Pyh0V1ZPHGA
         fSDDgPgCfOST/MH0qjEc7dyVckc0GeD3rkFcKd5vHyiVjDg6qhEleQXme8dQpSPKuNdp
         D33dmxlZlC0cMyEdRixDHRQOnXvbYap9pJfstuw0uL3iLNaEgQdrN2ZReSrTQf+et4IL
         oAy+an7AHni/gslnE5c440bAtKX+zYPRoqBYSZYWfwez0pmiV+RwrfIu7DyuBL2PMh+C
         E1Cv6bYeUExB0VT81HyUiQRMVUV0Trnyc6PDHHpMVdcH+LX5IMJ4+xStZArNOupMNQpB
         F2Tw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d24-20020a056122033800b004b7305215b8si1791793vko.294.2024.04.16.08.35.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Apr 2024 08:35:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rwkpb-0003rJ-H7; Tue, 16 Apr 2024 11:34:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=29bf=LV=kaod.org=clg@ozlabs.org>)
 id 1rwkpa-0003qi-8n; Tue, 16 Apr 2024 11:34:46 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=29bf=LV=kaod.org=clg@ozlabs.org>)
 id 1rwkpY-0002VW-4A; Tue, 16 Apr 2024 11:34:45 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4VJp4d5KRhz4x1x;
 Wed, 17 Apr 2024 01:34:41 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4VJp4X4qKKz4wyY;
 Wed, 17 Apr 2024 01:34:36 +1000 (AEST)
Message-ID: <9b3170d9-001e-4f05-a7d3-7ace61f957fd@kaod.org>
Date: Tue, 16 Apr 2024 17:34:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/16] aspeed/smc: correct device description
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
References: <20240416091904.935283-1-jamin_lin@aspeedtech.com>
 <20240416091904.935283-7-jamin_lin@aspeedtech.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240416091904.935283-7-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=29bf=LV=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_LOW=-0.7,
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
X-TUID: TYshLyINwIVG

On 4/16/24 11:18, Jamin Lin wrote:
> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   hw/ssi/aspeed_smc.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index 6e1a84c197..8a8d77b480 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c
> @@ -1448,7 +1448,7 @@ static void aspeed_2500_fmc_class_init(ObjectClass *klass, void *data)
>       DeviceClass *dc = DEVICE_CLASS(klass);
>       AspeedSMCClass *asc = ASPEED_SMC_CLASS(klass);
>   
> -    dc->desc               = "Aspeed 2600 FMC Controller";
> +    dc->desc               = "Aspeed 2500 FMC Controller";
>       asc->r_conf            = R_CONF;
>       asc->r_ce_ctrl         = R_CE_CTRL;
>       asc->r_ctrl0           = R_CTRL0;
> @@ -1486,7 +1486,7 @@ static void aspeed_2500_spi1_class_init(ObjectClass *klass, void *data)
>       DeviceClass *dc = DEVICE_CLASS(klass);
>       AspeedSMCClass *asc = ASPEED_SMC_CLASS(klass);
>   
> -    dc->desc               = "Aspeed 2600 SPI1 Controller";
> +    dc->desc               = "Aspeed 2500 SPI1 Controller";
>       asc->r_conf            = R_CONF;
>       asc->r_ce_ctrl         = R_CE_CTRL;
>       asc->r_ctrl0           = R_CTRL0;
> @@ -1521,7 +1521,7 @@ static void aspeed_2500_spi2_class_init(ObjectClass *klass, void *data)
>       DeviceClass *dc = DEVICE_CLASS(klass);
>       AspeedSMCClass *asc = ASPEED_SMC_CLASS(klass);
>   
> -    dc->desc               = "Aspeed 2600 SPI2 Controller";
> +    dc->desc               = "Aspeed 2500 SPI2 Controller";
>       asc->r_conf            = R_CONF;
>       asc->r_ce_ctrl         = R_CE_CTRL;
>       asc->r_ctrl0           = R_CTRL0;

