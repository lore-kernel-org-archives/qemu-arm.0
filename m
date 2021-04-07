Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp899876lfr;
        Wed, 7 Apr 2021 15:59:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyoLzlBu9nS0QhoREmWhd+VZb9OvyBVst+viWsdXCA52/Bi+oIcXe+1C60VLM7n5XwOXXZz
X-Received: by 2002:a37:ef18:: with SMTP id j24mr5697542qkk.96.1617836378810;
        Wed, 07 Apr 2021 15:59:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617836378; cv=none;
        d=google.com; s=arc-20160816;
        b=Qi9yQ48lk0RiBR1W0ut9f1nPajcKCpzhJHAiXl0npuHpiJ7oC3PNBq++X5oVhZrsg0
         TyEn0V1oAXdByWU+i6jli5VySaFyoTffQsGolBGG8MwNoCQ+s2F8mS8TRA1aDGxgByIP
         N1Q0hSdkGFdwLH8khQnoCpJ7tSDTeC3zuu2SCxVOhH+blMwPqYslbPVoatKt+6VeTx1c
         aBIOpa561ccTPMhOdtHBrV+iTFJqMU40H3uelUDGsPfpl2Qa5Hk7s7xS3tg7KVz771RH
         HcD1FfWBfhiCz81+M5267WQOZu4b2jBa7O1hlSFUeZBdiQI9F+JIX5DHZYbcOlh54+1V
         mtAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=6EkxbiY+NIoyu8xdhMte+HJ7xOFHbxj6pBXNu28kt48=;
        b=LM9QCWv2YXj7rmxTZ9V1X8Mzfl03kvg1oQAgynODdjWH9Rhxj7zHxgEEMea+Ew46G3
         ylZlK49C5UkaskLZyTAI+5gV+NKukH/Y1HBMyM43BRg7AsIrxkAXWFuNPB7Rv1Y8sEhn
         k6KJwjsMWIT+uHKKwGKyPmdamyOhs+8FapUtbIKxLocKTs/D3cqlee97p9LR3rIVhSn+
         WoA0Z8X9cSpmKHWy10sPgN+1gWLB+1r4MZrHhEdwJ/5FgW0BsJKmxmFKwBrqG85V+jmf
         6RGnOd8Cw94mMmhSHngMqT39JsTBBbUoO0impvXlfqNf9kpTvd/lN1XxxtpOfmrD9x43
         XKQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LKO9vjsV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f17si16025443qvo.187.2021.04.07.15.59.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Apr 2021 15:59:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LKO9vjsV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lUH98-0000vP-39
	for alex.bennee@linaro.org; Wed, 07 Apr 2021 18:59:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUH8z-0000tw-Kn
 for qemu-arm@nongnu.org; Wed, 07 Apr 2021 18:59:29 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:41630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUH8y-0001Ao-5c
 for qemu-arm@nongnu.org; Wed, 07 Apr 2021 18:59:29 -0400
Received: by mail-pl1-x629.google.com with SMTP id g10so27181plt.8
 for <qemu-arm@nongnu.org>; Wed, 07 Apr 2021 15:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6EkxbiY+NIoyu8xdhMte+HJ7xOFHbxj6pBXNu28kt48=;
 b=LKO9vjsVdQ0v8Gz7VEC+P74kiMgEH+XJlQj3vztHihAHXQ/Wu2+0j5KnIvtwhvqAgu
 PhLiSiDmaXcPK28rcQCz58hj+7HWSuzNd859fembOUjbIAnus9hII5MpBUcDtc7b7tNP
 bYqVWYfUSW+qhVyvMbFVz0WDWILEZgQ7+gX+30581F3X0kHdjh6Msjvq8544vZeC73kf
 kISAIWE6RFnVygqYcl18krqrDqhdA0u1swiWtabeQB1xy5Bf37L+MX7D8ut8cbVE1Y3w
 sshPBKowdeeZOUnVjLwrEHSUspb7PgCzv8MABSCneDd4PrCdtdcIi38T5rwjveDkTeOt
 QmVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6EkxbiY+NIoyu8xdhMte+HJ7xOFHbxj6pBXNu28kt48=;
 b=ilFmljIbCinpRJU4pR4n3a2y3tS1RzDtM6yokrsDeZAa5NslCPL+oOq3GjYwMZQ94n
 A9VnhGpsRYd2ValPFJKztBzhCC4cNlGyUAbSWoC9L9jheH6k3aj/TrmnK+jK+MnWpPQr
 Gy3/59AVOmqn4XjRTL+KzEqoCr3fK7QNBqexoX4s0872CopMZxA+8Frizj0NbvI3P/XB
 R5rzbAM6Pj1BwC1hRzF4+rR0ySJnQjK8nSAca7Ls3wyZs7C354BUHigEhoqQru7pdkw9
 whl9AbPyAL9mBaaXDmi4Obz7vzqi28eMfLqWRcjVXbVmKuYDU8bAonQXdTzjzadSH7dy
 yr6Q==
X-Gm-Message-State: AOAM533Pm12S4vqwxJfnkrdy3yJiXR8UFTuH1FQj3wWCkSTD5RcPxeby
 S7x9wG2v07+SxKS4bLcitutJnQ==
X-Received: by 2002:a17:902:e886:b029:e7:386b:1b30 with SMTP id
 w6-20020a170902e886b02900e7386b1b30mr5126132plg.42.1617836366625; 
 Wed, 07 Apr 2021 15:59:26 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id z23sm22927819pgn.88.2021.04.07.15.59.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Apr 2021 15:59:26 -0700 (PDT)
Subject: Re: [PATCH-for-6.0?] hw/arm/imx25_pdk: Fix error message for invalid
 RAM size
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210407225608.1882855-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <98c04529-d9a3-1a1b-65e1-a0b51da90081@linaro.org>
Date: Wed, 7 Apr 2021 15:59:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210407225608.1882855-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JLWVn+6ibUlb

On 4/7/21 3:56 PM, Philippe Mathieu-Daudé wrote:
> The i.MX25 PDK board has 2 banks for SDRAM, each can
> address up to 256 MiB. So the total RAM usable for this
> board is 512M. When we ask for more we get a misleading
> error message:
> 
>    $ qemu-system-arm -M imx25-pdk -m 513M
>    qemu-system-arm: Invalid RAM size, should be 128 MiB
> 
> Update the error message to better match the reality:
> 
>    $ qemu-system-arm -M imx25-pdk -m 513M
>    qemu-system-arm: RAM size more than 512 MiB is not supported
> 
> Fixes: bf350daae02 ("arm/imx25_pdk: drop RAM size fixup")
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/arm/imx25_pdk.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
