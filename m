Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp1139225njc;
        Sat, 2 Nov 2024 08:03:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUZAolLEle8+1J75Nt8MLZAoqT+Fj9TwNRFOcsH3f1Zvq963EVm1qsBr5VhU+U5xfZsjBZt9V7wvQj69A==@linaro.org
X-Google-Smtp-Source: AGHT+IHNlNTOBiWiEbNq3ZMCq+nSAf8oEYKXld2lmyHpmQmyDUl86Zk58fFiah0rxhwOQL4cwbkk
X-Received: by 2002:a05:622a:1a1d:b0:460:f094:bd55 with SMTP id d75a77b69052e-461717c67c8mr194107671cf.52.1730559809479;
        Sat, 02 Nov 2024 08:03:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730559809; cv=none;
        d=google.com; s=arc-20240605;
        b=ePpldo8MwGLd0sPcXMUniifFjEP4Dl32qWeid0GCEXgaPaW1XqFI3TccJVQD3ZHMwJ
         TJB8mx4krXVmcbLqBAvCDhfkavjguj28QpyqiGGZkvY+vD5LWBbwbKK8tFw49aOZLmKY
         edL7vAOQuPcrPT7zH4/d7hQbvQY105yn3AWQjL73QF/2eCK7mXdGzFO19HWPkoqKe3Yy
         vkoE0456kXLWSfYTbfi+6sVz5S7zha88ASuhB0u4/KOEYBaukIsxfdOknRbYhrHH3Tws
         vOxYzYzsSf8pxt8qFNJuWqqiN3MpaCMGyiHiCTKgTsGBUJWrl8iWbkGjwXOjpaHWhSC/
         fhfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=dOYF9LlheszonkYCKG6TZcAhK7k1mnBTIfSNkcGmbrs=;
        fh=98dZCMvX+NqbPkRXvFJNDIlyaWZH4tCfmKGJXDrbs8k=;
        b=YE0rl5Ag55vZpoxhzq8xMJLqT8fPNonGll5KBeLPYYglDJtajRtmDr+6pqn1TrsFtz
         Shq/aPHRU4BrtDeiiYUD7PgoO0QvYo6SFbmPV7L34DBQAMQ/0BLzDa4z9LN0WpkoC5Ov
         peHLT8gNSwHZWecW98oN7/gkxXPJLoGKT3ycxyVKdhhkCxixx+hARJ5JoIgpaWh2op76
         6vWMUuxJKZx5GDtRKG0tG6PGN8xLorZY9ONXl47v3wEOZNpjmiWSW2G9YAGSYQTNiO8b
         CiUtrWlgkUsEikudMbOl1kxfog0DtYH0V8R7AUqiZyH4W3cmV7TxFZdqqvyW0jvkGHNZ
         SADg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ad0b1b70si74700211cf.101.2024.11.02.08.03.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 02 Nov 2024 08:03:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t7Feb-0000Jc-Rp; Sat, 02 Nov 2024 11:03:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=uVOK=R5=kaod.org=clg@ozlabs.org>)
 id 1t7FeU-0000Cd-IH; Sat, 02 Nov 2024 11:02:59 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=uVOK=R5=kaod.org=clg@ozlabs.org>)
 id 1t7FeR-0004aK-Fk; Sat, 02 Nov 2024 11:02:56 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4XggvZ68n4z4x8R;
 Sun,  3 Nov 2024 02:02:50 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4XggvV3Z8Tz4wxf;
 Sun,  3 Nov 2024 02:02:46 +1100 (AEDT)
Message-ID: <de5b9cd4-ed9f-4398-86d8-b4ad15849223@kaod.org>
Date: Sat, 2 Nov 2024 16:02:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [SPAM] [PATCH v1 8/8] aspeed: Support create flash devices via
 command line for AST1030
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
 <20241029091729.3317512-9-jamin_lin@aspeedtech.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20241029091729.3317512-9-jamin_lin@aspeedtech.com>
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
X-TUID: 8L8e/pwON+Ly

On 10/29/24 10:17, Jamin Lin wrote:
> Add a "if-statement" in aspeed_minibmc_machine_init function. If users add
> "-nodefaults" in command line, the flash devices should be created by users
> setting. Otherwise, the flash devices are created at machine init.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>



Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.

> ---
>   hw/arm/aspeed.c | 22 ++++++++++++----------
>   1 file changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 0468602d95..e161e6b1c5 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -1602,18 +1602,20 @@ static void aspeed_minibmc_machine_init(MachineState *machine)
>       connect_serial_hds_to_uarts(bmc);
>       qdev_realize(DEVICE(bmc->soc), NULL, &error_abort);
>   
> -    aspeed_board_init_flashes(&bmc->soc->fmc,
> -                              bmc->fmc_model ? bmc->fmc_model : amc->fmc_model,
> -                              amc->num_cs,
> -                              0);
> +    if (defaults_enabled()) {
> +        aspeed_board_init_flashes(&bmc->soc->fmc,
> +                            bmc->fmc_model ? bmc->fmc_model : amc->fmc_model,
> +                            amc->num_cs,
> +                            0);
>   
> -    aspeed_board_init_flashes(&bmc->soc->spi[0],
> -                              bmc->spi_model ? bmc->spi_model : amc->spi_model,
> -                              amc->num_cs, amc->num_cs);
> +        aspeed_board_init_flashes(&bmc->soc->spi[0],
> +                            bmc->spi_model ? bmc->spi_model : amc->spi_model,
> +                            amc->num_cs, amc->num_cs);
>   
> -    aspeed_board_init_flashes(&bmc->soc->spi[1],
> -                              bmc->spi_model ? bmc->spi_model : amc->spi_model,
> -                              amc->num_cs, (amc->num_cs * 2));
> +        aspeed_board_init_flashes(&bmc->soc->spi[1],
> +                            bmc->spi_model ? bmc->spi_model : amc->spi_model,
> +                            amc->num_cs, (amc->num_cs * 2));
> +    }
>   
>       if (amc->i2c_init) {
>           amc->i2c_init(bmc);

