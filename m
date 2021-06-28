Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp4149715lfg;
        Mon, 28 Jun 2021 09:27:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOG0TkT31UhrDjt0rSoq7F242eQopMqN7I32uNA8AtKQp7RyodAR0DeeOVWQt+s2BoQRfm
X-Received: by 2002:a25:4044:: with SMTP id n65mr6347111yba.500.1624897640225;
        Mon, 28 Jun 2021 09:27:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624897640; cv=none;
        d=google.com; s=arc-20160816;
        b=l1c5z41T9iQnxJWMHmIrSjgKehAWE2vbKvfOUjEFI4WBJWoGpkyRJVAasRIRIPZjDn
         euiGihH9cx+GBl02BJCTupkc0HyOVeqWTCLFjk1OggAwU75NcSnwx+SMGUKR/S+5yY2f
         E9chR4Ts7vx/3hTuqw87ZTAARwnnR7yOlql4bFe0ZxxNFQdfqPOkHBP8olguN9cENLVn
         BUdz+w97bLN2KKN7oeAUD6a3M1qQ1F3959dWqV99OHvu/CBBJHAz2pVv6c1pwPKHOJ6F
         CHmu5A1ol6d6spdSMMQ+jQlkP6htj06R5ZM7MeYwUuNyOHuANemqI9ckOwpWcX7snMEV
         FBKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=K7GBvLooGu6oyfCGMLgyd1N1/7+0VnyWXEApFbvoBeI=;
        b=Q1kNqERA0l/acSp/y23Avi5xq8O0IgKNAPqdDlLguO49FzbppJyioLS9T3rrOwueGv
         Nyl70Vh1+SvqEnDr7KEBrQB5GdE8o9hAwNYHpLmozcyOUR97PVeEUSLYR6S5CN9CM4TB
         Qb7JpJLRjC5TbDINEvw5Wexw/K1O3yqZIdFc8wIwFti4wgGQuWaXdkGmZyt2bEcEgLOZ
         DVs4RrKeIq730RwvuYXurvCHE/etzM1lXMFm620ijFNWcBNq/gIm0wDT46Ethct28kW9
         v59l42ft5EdMgbJBLSR5GqjHEtBEJT+p1TIUNfKyzFEJBIitZRECUVmbyjCPvad/gYdj
         eCOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="TgM/gF1X";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a10si13526750ybe.298.2021.06.28.09.27.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Jun 2021 09:27:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="TgM/gF1X";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lxu6R-0007cI-HB
	for alex.bennee@linaro.org; Mon, 28 Jun 2021 12:27:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxu5O-0005pr-VZ
 for qemu-arm@nongnu.org; Mon, 28 Jun 2021 12:26:14 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:43985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxu5N-0003ux-9V
 for qemu-arm@nongnu.org; Mon, 28 Jun 2021 12:26:14 -0400
Received: by mail-pf1-x429.google.com with SMTP id a127so14516931pfa.10
 for <qemu-arm@nongnu.org>; Mon, 28 Jun 2021 09:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=K7GBvLooGu6oyfCGMLgyd1N1/7+0VnyWXEApFbvoBeI=;
 b=TgM/gF1X2IesdBsM1DHlQzMeD8bZ02OPe8qH1ahMjklgZHesVAn9xVk+g9BLhQEbeh
 hMnhI5qVga4fgU4DRqssa1pSLOh4yjL8jL6yPBr6U8q53/qyFQws0OWlp/xJ4P85s2qD
 Z9CEf+5WZOw0cObdvFVbLFdoTG80QxY1SmTIIdJK/Zzuj0YB+P5ff0xn0ikl6b364JF3
 3Tn7HlffUpBXmG+LZh2v35jc8wIZ8QReP+134qZ+3He5xO5/2nRJjJ8GxwuvGCAaM8NW
 FvOr5lt7xy0htzBElqGwaZMEydugpw3iris0QY2niA9XEgBCsJRJZW3/2si/U8mhsUtz
 QjVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=K7GBvLooGu6oyfCGMLgyd1N1/7+0VnyWXEApFbvoBeI=;
 b=uTS3L7XSpOznhE9kZWrI9YK4OWzKabuajH2yyKXGbE8FvEx2/C/4wOa3o+66BzAUIp
 SkXyMmUfCww7k1ey1tsUw5EH/45KyGUC9pcrlKoPv3Yehq7UT79zuASkE0Th6CADQs9H
 VJvyL+Vt+6/2c9iEhCyg3SrjwJZ2aqiJl/d9ooFbHQG72aJBbanGEjsDqe2YyoRGLTJz
 j7A9zafG2S4XzMoRIMlOHdpKvegz2eVZa8UmNgVOELMQkfHq7L7Rru8UQhdn8qF607p1
 OsXgMkKs7lodDF6iACCBMH3nlP2Wakty3BFLyv1sxt8R38Gy+Xy8pSoOomT8fTwPrY0J
 wKMA==
X-Gm-Message-State: AOAM532Jp0PALGlhwgUhddSstwtQ8NM3qGPIfAzOszTkwlGpSYJRaTlR
 +SuZ6zHJzwPBm0oHSldvJfNqIg==
X-Received: by 2002:a63:2d46:: with SMTP id t67mr23812998pgt.307.1624897571595; 
 Mon, 28 Jun 2021 09:26:11 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id w2sm15356532pjq.5.2021.06.28.09.26.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 09:26:11 -0700 (PDT)
Subject: Re: [PATCH 10/18] target/arm: Implement MVE VSRI, VSLI
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210628135835.6690-1-peter.maydell@linaro.org>
 <20210628135835.6690-11-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fde240ca-bde2-f47b-3dbc-00f03acd907a@linaro.org>
Date: Mon, 28 Jun 2021 09:26:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628135835.6690-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GqxezQRgcUp2

On 6/28/21 6:58 AM, Peter Maydell wrote:
> Implement the MVE VSRI and VSLI insns, which perform a
> shift-and-insert operation.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    |  8 ++++++++
>   target/arm/mve.decode      |  9 ++++++++
>   target/arm/mve_helper.c    | 42 ++++++++++++++++++++++++++++++++++++++
>   target/arm/translate-mve.c |  3 +++
>   4 files changed, 62 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
