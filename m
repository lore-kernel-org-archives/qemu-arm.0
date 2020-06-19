Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1040390lfm;
        Fri, 19 Jun 2020 16:32:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJznPybgfV01n/lYhuL/3j93rhFHhuRGBn6CYYxmYzjnPGExyFubYKQ0zvTtOBg45RouAxXm
X-Received: by 2002:a5b:707:: with SMTP id g7mr9498015ybq.136.1592609557771;
        Fri, 19 Jun 2020 16:32:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592609557; cv=none;
        d=google.com; s=arc-20160816;
        b=ohJVOTLxw03jfIZlOIoHGNn0IuTDaRnF3bHVk+vaUYeDTgOD/98Q9HqxYFuBS70AfU
         HdNLAVO2qqEB3aNmkAVvBaioAK8pfYpxZCGQppBQbaPsbMxM9U1OEJmdVFfB6N8GNci/
         sNM29R6DB50JBq5hXTORawI2OR/DZSqT6/skVISpa5ykqs33kndpt4RtL43G+TNaH0oW
         2UoUKIuanIZaXskrHSccV6cFQlsIcUreUiYHqVHmrYzmMxCWy/JioGDNORTko33++Rn/
         fikpUE8p81i4Amo162C30dN/uGgxinWC5sZQARWXHtNK+5LoLb7ri6GU8zMuj5Pu28qm
         hUXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=1zOeVC30jfVm1MMvsEmRuFOc6nJ0U8IaZeGnW53qhLo=;
        b=1KPdcZquX7KARHTWHkB6gftZBqW7rrHUqoTxr0J9g51LIE30TS2xIh0t2D0x70nmrX
         kywQjOinPH6tIlKxKKDT382A/DDQwbb8oCPrQtRV5gDVOYRqIirno1g9+XXyw+7CIpB2
         aGgcEWQnEQ0ktjkCsoN6XM8kSn018orM+GMSwD/in3WqHuHxolzrSEfqa8GchK4PzNCt
         75uCi+K1ua/594OijyrFkvTAPg8LSv9eC4kEkxmo59r+hlIicz6kcc2dSazahWsG1dEM
         LnCajtawZHDpJSNHv2rO1rDZ5skEBFwQKw8iooj3vNXgb0mg59MI/c9mBM1bBnBLBQhM
         zpew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QTZNLVoL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 141si6223829ybf.456.2020.06.19.16.32.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jun 2020 16:32:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QTZNLVoL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jmQUv-0006Oi-4t
	for alex.bennee@linaro.org; Fri, 19 Jun 2020 19:32:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jmQUm-0006OT-9K
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 19:32:28 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:34322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jmQUk-0000Pi-NT
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 19:32:28 -0400
Received: by mail-pf1-x441.google.com with SMTP id z63so5143096pfb.1
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2020 16:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=1zOeVC30jfVm1MMvsEmRuFOc6nJ0U8IaZeGnW53qhLo=;
 b=QTZNLVoLksxcYiyK7TIOC2l31DMBk1n1sLniO3gxPoV8P7eSvYfBwWWDzYNmgt4Nod
 uS7mb40prODzc0b+FW7qHjShUoOdewWeYCb+yUK0fkjRpSMD/F1DRPjDZX0imKiepexa
 WPN8ws5/aLDPfcoNHnt49RNnrrAj1UyPXvx/MJC0WP3xaZzBFunMS2NedGj/41dTZ+n/
 cLXIgBwhILwcAPUKFnfs3mp0CGi4rNPfXeAM/VHOl/C5eQV0QKUILID8piaX3qFqt8Oh
 k4WPIrpNp/0LVektEyIHP/fCaJk4WIC8p01nxBoMs76EtYy5J13GRTA59KigyW82QSbY
 mhvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1zOeVC30jfVm1MMvsEmRuFOc6nJ0U8IaZeGnW53qhLo=;
 b=mWdZjTfRVbL5MJP2dkV4XDV8/j9EHIu9s39ezGfz+2/bSaeL70WLmmD1Tr5qAbGwRz
 HTERXEDyf3JintCFS9Yxf1MwEzwB/tTxVW2P6FTRHe8ghTB+XK38jRQ1aAGtC4AXumwt
 4bxdqH5EStPkmcKlY9wCYTnWGbh0aXZSSlLPI9XKMcNmc5F8t8B78OAAQuLY4Vcp9xhD
 35SwQjAtpmkc605ebozGwa3WKhrr+mNqzdt+qcJxGxY+k00rXQ1kICtZQYN97w10BDFy
 Hj+sem+/DxoC+E7GXAJSihUXOKuzODZ1aW71+dqIHEvtS5jq+M5zLdHTSGVYYYWWnmFk
 HVWg==
X-Gm-Message-State: AOAM532l1QqCTGqhRxE5/nUNg4A/YLiNHT0vax4PzPqzXV2YuRaTzixK
 gkJoE/ppI3k6+gf/50ZsLJvmsg==
X-Received: by 2002:a63:dc13:: with SMTP id s19mr4732846pgg.53.1592609545111; 
 Fri, 19 Jun 2020 16:32:25 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id p31sm5937691pgb.46.2020.06.19.16.32.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jun 2020 16:32:24 -0700 (PDT)
Subject: Re: [PATCH 10/21] target/arm: Fix capitalization in
 NeonGenTwo{Single,Double}OPFn typedefs
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200616170844.13318-1-peter.maydell@linaro.org>
 <20200616170844.13318-11-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b439e716-4489-d316-3256-c6bcbdc98329@linaro.org>
Date: Fri, 19 Jun 2020 16:32:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200616170844.13318-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-TUID: lqMWoSLaZuDA

On 6/16/20 10:08 AM, Peter Maydell wrote:
> All the other typedefs like these spell "Op" with a lowercase 'p';
> remane the NeonGenTwoSingleOPFn and NeonGenTwoDoubleOPFn typedefs to
> match.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate.h          | 4 ++--
>  target/arm/translate-a64.c      | 4 ++--
>  target/arm/translate-neon.inc.c | 2 +-
>  3 files changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

