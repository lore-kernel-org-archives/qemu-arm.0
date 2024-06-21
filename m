Received: by 2002:a17:505:2e08:b0:1bd8:8c49:4f6d with SMTP id ya8csp196557njc;
        Fri, 21 Jun 2024 08:03:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXjWF7xNm/PB6YyPZJ992HD+2+8sXRKivWOzQsZKGOnalP8nUiBHGPou7P+qGduy5QpmWBml7wKsS1/hZjGP/ZnGUGNNqcw
X-Google-Smtp-Source: AGHT+IHdtXybdovsAJ85zQ7jlQpsYlHZiAMH8TYxlaNZq0F3CrNFj3CbF7hub+s0hHLpUt7tLIyS
X-Received: by 2002:ad4:4b6e:0:b0:6b0:8789:ae2e with SMTP id 6a1803df08f44-6b501e2488amr87144376d6.23.1718982233356;
        Fri, 21 Jun 2024 08:03:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718982233; cv=none;
        d=google.com; s=arc-20160816;
        b=TyyJbVazNhIyRSq/ybm3ElO/ePNxSFTQkEBYkfE+OjbQXoifcfvfmi8s5v2Oc2mw14
         cV/dxb47iyAvPcSEju9UBwApKy/PNfL4lQ+ZrbkiQeJdCbHR83Ju3R7bWiShgjCEAcK0
         jjD7XmybFy6MEiNoQRx8u2vYIhvTZQFE5EVO8RrXfd4jRJkQbtjBCnFzKabTQ899fmIj
         tprL19QlUpqBniPudz+xKyj8HrR5vDo3RyEh+yrL3lGiK7A0XK6HDCZ+1sCdEEptkJh6
         wTX1UlpkZ4Doue4dJsIp5LADF3YSxOm1KV23/w6P3pLh3C806/m0liWCWfIXLIqJOsgq
         H9QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=I6sLmeL38heShZ3gtwgXCj00k5aL1t+N3UPeJDQWi00=;
        fh=trxR5ydBkfLIuzXSugGhqbmbobfCQIQQpiangShKN40=;
        b=ChG/+TirFRkRytZ8uAaDtsZUvO301A6obUbIA5adfhqu/aOmk4po4fDtITjZqRVy2Q
         A/ZYYp3gaNTQVcMxRIVC2JDcZWY6eusVWtkb/5dytmyt+KZC3u+YOt1+apg4G5CaK9XB
         zXcBVGxeq4CBuaoMnBkcRv3j7rD6yYIDSj+dOLVz+LRkRYZE51jPUIfFZv9YTz2VNf8J
         3d4BjZ0CJqVO/hUa2wKDWeQLO3mT68r55VZVHCSqhITkFTZbRLc0/C2bABwUi5MsYumO
         1AVFHPbjORBgYAh1p4xRRZL5eavXd4TxVTHNLN6bLO5+nY7gtoz2C4Sr9zlBR95LnyeO
         KV7w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S8Kxt5M0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b51ef17341si18714216d6.462.2024.06.21.08.03.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Jun 2024 08:03:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S8Kxt5M0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sKfnW-0005Xp-0C; Fri, 21 Jun 2024 11:03:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sKfnU-0005XO-Nj
 for qemu-arm@nongnu.org; Fri, 21 Jun 2024 11:03:28 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sKfnT-0005Pi-4t
 for qemu-arm@nongnu.org; Fri, 21 Jun 2024 11:03:28 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4230366ad7bso23798475e9.1
 for <qemu-arm@nongnu.org>; Fri, 21 Jun 2024 08:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718982205; x=1719587005; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=I6sLmeL38heShZ3gtwgXCj00k5aL1t+N3UPeJDQWi00=;
 b=S8Kxt5M08qmtelmcikRmkeExg2MkJGCKkWfUrxWO1wdQzSIO/599NNfrucsrnakRdO
 Y9gJIOLT5z40x9TGhaMGrqAjqlzw30s2yjGW6IXHLKqObVBJItNhG8Y1Y6rlpgqxNy87
 cYfp3dQxz6DK0CR6W/p/NHH2pECaN5tx+bv1bOj7H9QIPpnIi80anrXYQBD2eApqvFXe
 B+PEqdUcGb7MLvpADrP8HikXc0fbhY4QDzR4cT/lSDQeqAqGjYcgIr3p2JbYyzb/Yxua
 cWrsxRsHKPhrEc4LExdRx48ew61ubkBiQU+c+xJm+J6VcE77Yr5ITdSP9oBsBpxeY1tA
 fzDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718982205; x=1719587005;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I6sLmeL38heShZ3gtwgXCj00k5aL1t+N3UPeJDQWi00=;
 b=JdEmloMajmfMLcrPHw6KFzOINsxUwT7xDInUeWtzl/VmiHVpCaQSNuNRuHzapZizka
 9WvXrtt8Tgic5LebOVOmEFLp/L+Js/t87yNgdj0vNosxNe/NUzAtKYpWgu+uWG3vp6AA
 IC07XrBl/ftei3Npo68ypHMeYmkrTpesA4sOUwdCC5yhBEcn1Yfjbx+J45nTc0lKTA6c
 n1lPgS+yD9I2oZ/rIhI2K5sbG6sC72kR2HCuYBM2GCz5f/dSOkiE4vkEt+imXF+XYpDm
 8xRGibbvighYGngaIQR882JAUXt58h91Xo3byW3/DfZHXkyYR0w9PXyfSzNg0gmoP8ZQ
 96dw==
X-Gm-Message-State: AOJu0Yym3x1HvXBdwrG9PP7BUMQrHYze3zJjeTdOWeFXx07DHBIlrW44
 bU4zQapP6hgZttVpsS4A+f/JSLbERxtuS9enPy9KfrNO4o/CEdbECYQJNhUwthw=
X-Received: by 2002:a05:600c:19d2:b0:424:7e33:b9ef with SMTP id
 5b1f17b1804b1-4247e33badbmr45893015e9.18.1718982204898; 
 Fri, 21 Jun 2024 08:03:24 -0700 (PDT)
Received: from [192.168.209.175] (139.red-88-28-27.dynamicip.rima-tde.net.
 [88.28.27.139]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36638d9c1d1sm1991454f8f.51.2024.06.21.08.03.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Jun 2024 08:03:24 -0700 (PDT)
Message-ID: <6030d030-cfce-4253-ad4d-f7e2a37e2957@linaro.org>
Date: Fri, 21 Jun 2024 17:03:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/misc/stm32l4x5_rcc: Add validation for MCOPRE and
 MCOSEL values
To: Zheyu Ma <zheyuma97@gmail.com>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 =?UTF-8?Q?In=C3=A8s_Varhol?= <ines.varhol@telecom-paris.fr>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20240618135550.3108739-1-zheyuma97@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240618135550.3108739-1-zheyuma97@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 0JvqcUPErxCP

On 18/6/24 15:55, Zheyu Ma wrote:
> This commit adds validation checks for the MCOPRE and MCOSEL values in
> the rcc_update_cfgr_register function. If the MCOPRE value exceeds
> 0b100 or the MCOSEL value exceeds 0b111, an error is logged and the
> corresponding clock mux is disabled. This helps in identifying and
> handling invalid configurations in the RCC registers.
> 
> Reproducer:
> cat << EOF | qemu-system-aarch64 -display \
> none -machine accel=qtest, -m 512M -machine b-l475e-iot01a -qtest \
> stdio
> writeq 0x40021008 0xffffffff
> EOF
> 
> Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
> ---
>   hw/misc/stm32l4x5_rcc.c | 28 ++++++++++++++++++++--------
>   1 file changed, 20 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/misc/stm32l4x5_rcc.c b/hw/misc/stm32l4x5_rcc.c
> index 417bd5e85f..59d428fa66 100644
> --- a/hw/misc/stm32l4x5_rcc.c
> +++ b/hw/misc/stm32l4x5_rcc.c
> @@ -543,19 +543,31 @@ static void rcc_update_cfgr_register(Stm32l4x5RccState *s)
>       uint32_t val;
>       /* MCOPRE */
>       val = FIELD_EX32(s->cfgr, CFGR, MCOPRE);
> -    assert(val <= 0b100);
> -    clock_mux_set_factor(&s->clock_muxes[RCC_CLOCK_MUX_MCO],
> -                         1, 1 << val);
> +    if (val > 0b100) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: Invalid MCOPRE value: 0x%"PRIx32"\n",
> +                      __func__, val);

How the hardware handles that? I suppose it just ignores the
value, so I'd simply:

           return;

instead of disabling the clock...

Inès, Arnaud, what do you think?

> +        clock_mux_set_enable(&s->clock_muxes[RCC_CLOCK_MUX_MCO], false);
> +    } else {
> +        clock_mux_set_factor(&s->clock_muxes[RCC_CLOCK_MUX_MCO],
> +                             1, 1 << val);
> +    }
>   
>       /* MCOSEL */
>       val = FIELD_EX32(s->cfgr, CFGR, MCOSEL);

MCOSEL is 3-bit wide, so ...

> -    assert(val <= 0b111);

... this condition is always true (and can be removed) ...

> -    if (val == 0) {
> +    if (val > 0b111) {

... and this path isn't reachable IIUC. So you added dead code.

> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: Invalid MCOSEL value: 0x%"PRIx32"\n",
> +                      __func__, val);
>           clock_mux_set_enable(&s->clock_muxes[RCC_CLOCK_MUX_MCO], false);
>       } else {
> -        clock_mux_set_enable(&s->clock_muxes[RCC_CLOCK_MUX_MCO], true);
> -        clock_mux_set_source(&s->clock_muxes[RCC_CLOCK_MUX_MCO],
> -                             val - 1);
> +        if (val == 0) {
> +            clock_mux_set_enable(&s->clock_muxes[RCC_CLOCK_MUX_MCO], false);
> +        } else {
> +            clock_mux_set_enable(&s->clock_muxes[RCC_CLOCK_MUX_MCO], true);
> +            clock_mux_set_source(&s->clock_muxes[RCC_CLOCK_MUX_MCO],
> +                                 val - 1);
> +        }
>       }
>   
>       /* STOPWUCK */

