Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp184084eje;
        Sat, 8 Jul 2023 10:21:14 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFzntkQ54OIcDuHneDqxM8FRqN8MiEX0p17n6c/CcwYSEntljqGagy6Te8eGSxEIxOsYdz5
X-Received: by 2002:a05:622a:1ba4:b0:403:6ac5:e761 with SMTP id bp36-20020a05622a1ba400b004036ac5e761mr10266282qtb.62.1688836874609;
        Sat, 08 Jul 2023 10:21:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688836874; cv=none;
        d=google.com; s=arc-20160816;
        b=YIRdG9QExzIOXVqVF153akM6jjGRKOntPkoyoni92H0vWXHC7PiY0wUYIUesa6QJjZ
         20q6ndm/iV4Y12ZBMZInQT9487Xc1PoodkDTyriRH6Jr/hu1scufj5g1st1ASVy1vyJP
         bHwesZlofiYPTB3UjIc/ZBCqtjv/fD1zlng/mgUJ5d5NwwhTGQD32AJyaxke+bzVIus9
         AqhpqhYsLn8AK2ccOxPkcucXOEJlVBEA9LOiEfrJNxkSVI51WjokSWVj+ZrUqo1HDnnZ
         MVB+1pQPft7IUK9WjtRy/LCADd3sdt5puN4petgLXiaCbjspClju0xiMQQBMAU5CxVoV
         tu5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=TrlA4t5teWO+Wp3OK8Wv1EdseoYAYsKlIWQhdnXURGI=;
        fh=j8pwsiah+H3QGMu65HcARaW+qpQzvNSIWsTdXEYkYfs=;
        b=SVAsXPmxNOfmUTGAejlBJs3lgyMCFi2meAjjwCAy0C4FMoeuR31RxFUevzdkBWki4f
         n48BzeLSwdhdxE6FuT7iptYcnkCc11t0LBaMyD6buqKquKONH+QbVrfkETUCAAK6RPTG
         NSip36HtgSy3bVkR6DZcVqQUvgwPTykw8tEP1v0aGec3TTnt2lOmU+ZHaJk7ZewiP6+v
         W2Q2+dpLnUOJIE3xUeULNffFYWCoOQHAvQOCwp6ut/y2hg4z3ktThhGhwM7esZsZD7NC
         ag//DYp9aDw5OUeX8pd0Mi+pCNuHxwkfLaO0rqnchjxslppFKtbyLDpGLS0WQ1M5o8vf
         5DWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J7VqhyIA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6-20020ac84e86000000b00403525df43asi4043062qtp.720.2023.07.08.10.21.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Jul 2023 10:21:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J7VqhyIA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qIBc7-0002Ej-Nn; Sat, 08 Jul 2023 13:20:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qIBc5-0002E9-Lu
 for qemu-devel@nongnu.org; Sat, 08 Jul 2023 13:20:53 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qIBc4-0005Hs-6v
 for qemu-devel@nongnu.org; Sat, 08 Jul 2023 13:20:53 -0400
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-9924ac01f98so398777266b.1
 for <qemu-devel@nongnu.org>; Sat, 08 Jul 2023 10:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688836851; x=1691428851;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TrlA4t5teWO+Wp3OK8Wv1EdseoYAYsKlIWQhdnXURGI=;
 b=J7VqhyIATyFkoa3FXtt8KaqCS5iEb8PStsae978F2isJMMjndBTfxfmIBBsyeTY7m4
 +ZqxwQ1YIWNyZ8pGdn1P9EiZf0Wgrk+eEqPfShjwH/Yl1Pyq2En1wfsbSTv6XO5V7wIh
 8XwYdRmb3fa1b7N2QkVaigUX/DTbx2RFYTIMP0VZVWeH8NMaQ2S8rBTaq4DR16FNR1hG
 6QlvtXrHRrwxyvew+93SpDsFGrYCuhgOyBe9MU2/V0405tozzj4HW9q38LNTB/Mz3uML
 FfeJr5L/EaEpDeDXgXL8yxel3wQJggvYZq8Uh+/LUbsDkevJHJQXrOxMzR1dXMd7TsKi
 a1vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688836851; x=1691428851;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TrlA4t5teWO+Wp3OK8Wv1EdseoYAYsKlIWQhdnXURGI=;
 b=dlqQjvO/4/Ns19Tm9/QTVUEax08nUn0F4+npfON/20l4YAUyCajsKA7U9Slq7U42kx
 EZP6JXdwJdXv7VFyNS0bKFz7Kt8ogHZ6+iM/W0GOw3rlH0vxW+nJpH8UbQIXT+qMPfFn
 mufuIprVjeXZNSRA6kMHL6cB6AmiQaDwNoYu45KHfDnCnDe6MsP5Ajf1VJiKnacgIeck
 8ASx5lQAT/sHzOjjxmWQyH2wU5BIEIrk0045BmpNhoOsX3fkMUz88+StqicobkK8zYML
 2rIpDRelG9+1QC+Yg53xuzGFFIIrxvprwv5rn8jJ8BWl194zdE/mHU8clNS2qQjlTNWJ
 qxeQ==
X-Gm-Message-State: ABy/qLYaXavoACyVD+Ob2yFamhrIsLpJZssT0ouMgYxcT1yONYz4VzM4
 LeAKQyjexfcyxXM3y56J3gbew1zKD1roYKWO9wA=
X-Received: by 2002:a17:907:2c66:b0:988:c7b0:7e7a with SMTP id
 ib6-20020a1709072c6600b00988c7b07e7amr7209128ejc.34.1688836850788; 
 Sat, 08 Jul 2023 10:20:50 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.184.32])
 by smtp.gmail.com with ESMTPSA id
 gz3-20020a170906f2c300b009929c09abdfsm3773092ejb.70.2023.07.08.10.20.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jul 2023 10:20:50 -0700 (PDT)
Message-ID: <a51c23a5-2cbd-3023-a597-772b053964b3@linaro.org>
Date: Sat, 8 Jul 2023 19:20:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v4 28/37] target/arm: Use aesdec_IMC
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com,
 eduardo@habkost.net, alistair.francis@wdc.com, danielhb413@gmail.com
References: <20230703100520.68224-1-richard.henderson@linaro.org>
 <20230703100520.68224-29-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230703100520.68224-29-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 7LsVOWeYeG8Z

On 3/7/23 12:05, Richard Henderson wrote:
> This implements the AESIMC instruction.  We have converted everything
> to crypto/aes-round.h; crypto/aes.h is no longer needed.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/crypto_helper.c | 33 ++++++++++++++-------------------
>   1 file changed, 14 insertions(+), 19 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

