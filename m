Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp4824934lfb;
        Tue, 24 Nov 2020 12:09:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxx1VxueR/RpVHH1hDdvI6FcFNfqJv/7Vu2LUen83fRm2iw5kcg9HUazaHgAnD73520djo8
X-Received: by 2002:a25:9345:: with SMTP id g5mr7299884ybo.208.1606248563509;
        Tue, 24 Nov 2020 12:09:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606248563; cv=none;
        d=google.com; s=arc-20160816;
        b=k89iGUi3UlJLqw4CnF7pYqtX2dlFRV9iIr8bfJz/3JY9BhCywuZFzJdSFh+t0bb+mZ
         1iM3IymMtxaDJTWhn/SfDkiZJ7KGcBiPpj2mQuTasQyWKrhA5JdQZm//B04nPcE7CEjZ
         K6lEWIgU68E5SjNLtRHV6I/JrSuezdioWP1dG6YDI/nJU9CSR1QES1+L9FAGrgDzRaGg
         4+O2Qx3E4u+v85hEIe72CRM2XdAzC6nC+bDxvPQOpats7vvtX3S7mWEMsCVgzyD/vDcC
         rO1SNRL2hhSC3lRInXn7PfwFyrcG5ITI3pls1ZLWXNuJMn3WPDOtE8ZjlzI32sGUxWEo
         zcgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=f3wDPtnsIa+S3jm8yr5kPDpsX6jhI9n3YSeepxAsueI=;
        b=ADVf3y+k1bEKuaVaS9meNpkfduqBY+vKAE94IMiGfULJ+8T2SgMMPS7xYtEd8zoqdA
         o9ZyMUxS443iLanvJf50JzgD1BB1/4mydNGsxxfATK6PQBDbyRr2UAiiw/zjX/x7tDMq
         45ZEdV4STBqNGz9FdILUmGS3pJRIj8C8CrBCfyOO5ncEXz73tQ0160y0EgTqru1RvCA8
         sscaVdagJR/sCaXkK8Srbvmx0k2Ox2xx+v1nH5BPgQPc46Fky0JHzt1nPf9boLvGX/NL
         YkkSFA8Coea41TwruLlnjxZRkK93b44ieXctyYVGk/wdmcW7FNV9wcK0dNICGEorVXjJ
         EBkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Kp7vWj7c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z7si53681ybz.208.2020.11.24.12.09.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Nov 2020 12:09:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Kp7vWj7c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:35998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1khecs-0001Qb-V0
	for alex.bennee@linaro.org; Tue, 24 Nov 2020 15:09:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khech-0001QQ-01; Tue, 24 Nov 2020 15:09:11 -0500
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:34886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khecf-0001kE-Fp; Tue, 24 Nov 2020 15:09:10 -0500
Received: by mail-ed1-x543.google.com with SMTP id cf17so132107edb.2;
 Tue, 24 Nov 2020 12:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=f3wDPtnsIa+S3jm8yr5kPDpsX6jhI9n3YSeepxAsueI=;
 b=Kp7vWj7cwozUdh7NiNbrmxhPx3zMDRQHvdozjtXryYscduNgoGd9AWQHMxN+n0Goi6
 26BBpsgZ30/9ZT82dUnz5lqnlcOQCwG5xNh8fosx5ucbFQ16jDwVQfTq+kzkWcPMnqga
 dPDU2Dzq9jQWwSLC9H9hv6ZMKzrqchB7XboLOSH1NVJLnr8DEzYsPbZWX2RwO7v5Kdz1
 UE9+qTWg1gzj+g7HfEuL46l0C4YMsyh/CLmn1Mq3pf5pFsE6voK9tlSEQu6/wySm3aKr
 4qXgWVvp56Qc4ZtwuHokV5d4a1STfsmzXJWvzWNF/+A/aL1OB5pFI7KyjQ0+Wwm57OZ7
 E1Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=f3wDPtnsIa+S3jm8yr5kPDpsX6jhI9n3YSeepxAsueI=;
 b=OF+Y18b0Bs3Dd3WtABg7sUMsskbi9LSS/V7fzYxU7/Tm+Sn9Ivpe01xERavV6rzL/L
 ZRkh9aOaZBBwOOG6GuG6ObWr/fzx11NW+lK2L8iMnWry0u7Exl+kxMtKz0HTkvMZ6GDv
 Mq4hyrpa8mhf5mY+BJlgT2Lu0z57lgAhU+pOKkdBJ/pOe7Jpw+EWT+qoE14CvA2dBOjK
 DsXKwPiDbHUcHSQEe9V7Hj1Md75uciwUsizRZhCrqiMFMe5pXFnfLWXX0i9feGrHfA/j
 Tbm+UPB7Q293FTdoV97HwZlVdoDjYSHSm2tJ9fxJg912RvXbPj3ME0xOrY9jRabfwPBu
 o2cQ==
X-Gm-Message-State: AOAM531VRTPO2ROPg0A97kn1IksHkm/lpwarLWQkyFUKjlFIc4vGqJoh
 u5Je0dVidWdqA2LwEENengpv9DoDvEs=
X-Received: by 2002:a50:8f64:: with SMTP id 91mr191708edy.310.1606248546931;
 Tue, 24 Nov 2020 12:09:06 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id e9sm7416958edn.30.2020.11.24.12.09.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Nov 2020 12:09:05 -0800 (PST)
Subject: Re: [PATCH] Initialize Zynq7000 UART clocks on reset
To: Michael Peter <michael.peter@hensoldt-cyber.de>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <FRYP281MB0158389968A2A1C231F3A585ABFB0@FRYP281MB0158.DEUP281.PROD.OUTLOOK.COM>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e03b9af9-d208-ed62-8e03-15004dee7783@amsat.org>
Date: Tue, 24 Nov 2020 21:09:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <FRYP281MB0158389968A2A1C231F3A585ABFB0@FRYP281MB0158.DEUP281.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x543.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CEVMxdAaS+VY

Cc'ing qemu-arm list too.

On 11/24/20 5:52 PM, Michael Peter wrote:
> Pass an additional argument to zynq_slcr_compute_clocks that indicates
> whether an reset-exit condition
> applies. If called from zynq_slcr_reset_exit, external clocks are
> assumed to be active, even if the
> device state indicates a reset state.
> 
> Signed-off-by: Michael Peter <michael.peter@hensoldt-cyber.de>
> ---
>  hw/misc/zynq_slcr.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/misc/zynq_slcr.c b/hw/misc/zynq_slcr.c
> index a2b28019e3..073122b934 100644
> --- a/hw/misc/zynq_slcr.c
> +++ b/hw/misc/zynq_slcr.c
> @@ -269,12 +269,12 @@ static uint64_t zynq_slcr_compute_clock(const
> uint64_t periods[],
>   * But do not propagate them further. Connected clocks
>   * will not receive any updates (See zynq_slcr_compute_clocks())
>   */
> -static void zynq_slcr_compute_clocks(ZynqSLCRState *s)
> +static void zynq_slcr_compute_clocks(ZynqSLCRState *s, bool ignore_reset)
>  {
>      uint64_t ps_clk = clock_get(s->ps_clk);
>  
>      /* consider outputs clocks are disabled while in reset */
> -    if (device_is_in_reset(DEVICE(s))) {
> +    if (!ignore_reset && device_is_in_reset(DEVICE(s))) {
>          ps_clk = 0;
>      }
>  
> @@ -305,7 +305,7 @@ static void zynq_slcr_propagate_clocks(ZynqSLCRState *s)
>  static void zynq_slcr_ps_clk_callback(void *opaque)
>  {
>      ZynqSLCRState *s = (ZynqSLCRState *) opaque;
> -    zynq_slcr_compute_clocks(s);
> +    zynq_slcr_compute_clocks(s, false);
>      zynq_slcr_propagate_clocks(s);
>  }
>  
> @@ -410,7 +410,7 @@ static void zynq_slcr_reset_hold(Object *obj)
>      ZynqSLCRState *s = ZYNQ_SLCR(obj);
>  
>      /* will disable all output clocks */
> -    zynq_slcr_compute_clocks(s);
> +    zynq_slcr_compute_clocks(s, false);
>      zynq_slcr_propagate_clocks(s);
>  }
>  
> @@ -419,7 +419,7 @@ static void zynq_slcr_reset_exit(Object *obj)
>      ZynqSLCRState *s = ZYNQ_SLCR(obj);
>  
>      /* will compute output clocks according to ps_clk and registers */
> -    zynq_slcr_compute_clocks(s);
> +    zynq_slcr_compute_clocks(s, true);
>      zynq_slcr_propagate_clocks(s);
>  }
>  
> @@ -558,7 +558,7 @@ static void zynq_slcr_write(void *opaque, hwaddr offset,
>      case R_ARM_PLL_CTRL:
>      case R_DDR_PLL_CTRL:
>      case R_UART_CLK_CTRL:
> -        zynq_slcr_compute_clocks(s);
> +        zynq_slcr_compute_clocks(s, false);
>          zynq_slcr_propagate_clocks(s);
>          break;
>      }
> -- 
> 2.17.1
> 
> 
> 

