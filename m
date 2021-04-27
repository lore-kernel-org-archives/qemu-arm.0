Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp4978453lfb;
        Tue, 27 Apr 2021 10:12:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8JRKvPCr60mFvtT9vUOpaV1+H6dHmLBSL188erap1TGgwQtJ1PFzglZPsK01Iax2YhqIV
X-Received: by 2002:a92:d3c4:: with SMTP id c4mr18122158ilh.50.1619543521660;
        Tue, 27 Apr 2021 10:12:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619543521; cv=none;
        d=google.com; s=arc-20160816;
        b=ynuVjj5e8XVmcbBSDAvV3ySiHqfbWlEve2Rd97ffcf31e1MK2o3cWofqqBIxyFf6Oi
         3SzURLfn/8YP85mxBRXFzPpPVr0fObeQ7xdBdWFsDyqheCI/aFocDZ/OUoyMkYzO6g6b
         zKDI3OHfhKtJRIyraNSybibeyfHGr20Lg9gMg/KElR9rc5R04OdZ8FLmwgZRi5HIUSFg
         gahBfvGeRfhfWtMMJBtRinIQyD/boxzpahOS884wOtvf9RzBf1/CU4qUiiHt8hPKbNtd
         TIkuNNtGQWli1Pt1wb6fuKBdchhO9QspUedd4TVepgYQJrug9TaxSquVKKVnhluozJr1
         A2UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=w/yIloBiOa5RGJ1keBrumBScQzIpOuFYI5RFV6gaNrM=;
        b=uVYbtcnwL/emHUsaASLGVZwhbzTQbSjZI1nr9vrM9+Wdv4E12gfhE8isUBiy8p+wgD
         9lRPxOQ78aTpdd4NV2p7I4N7fukvVVGEsBS64+uieT8LmiWkwp3ql4BUROCHDGOYCbMo
         yTVNyJUyzXhQIWuPOHKQoPUm1+gS+JFiop0uWCy2tcJmxLenlfxubSkJs8EwdjtIL9HI
         /1y+T0O2+FYvC13rNFiZUDmkBNmDIKB2g+AzvNlhi9yeINWGL+1hyvMY35EP96acakTM
         qTnlVaDi8LrPZkGvgZb62utbxGjw+sXbuKlgkwoOXaG1jb7hcHbhnN+EqJkJB7Hlpcfp
         kmBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MPpVP2oB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t10si4842166jaj.12.2021.04.27.10.12.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Apr 2021 10:12:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MPpVP2oB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lbRFg-0003s8-TO
	for alex.bennee@linaro.org; Tue, 27 Apr 2021 13:12:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbRCg-00025y-8g
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 13:08:54 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:45639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbRCd-0005dx-0q
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 13:08:54 -0400
Received: by mail-pf1-x42f.google.com with SMTP id i190so2220008pfc.12
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 10:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=w/yIloBiOa5RGJ1keBrumBScQzIpOuFYI5RFV6gaNrM=;
 b=MPpVP2oBcW40y/si/UoVA3YCs43imOHapV81lwIYAmg6j7X30pnfN6jHIhAr49cuIn
 e+TU/mmUc3LbjIz+ANLdViipZRsIlVpli0dtl9QoukDvozYPfAWfIEy6Yh+QzpiBSDhe
 c/uN2sP8t5D9ItzwAck9Y+HGRc3y0EksnzDWbo2IITMvZSELDwnzrApr9yjaWJVuZHs2
 rB8ikMleSislZisN2X4h9dJc6Sm6x+di7ilcgj3x2Uov+mzHp6R/Olglye0hVsXb9bXl
 j2pWVJHC82w1G3Q5e0mW3swELr8ICFX9MdRZimGEMSDjCYvXPpW9RzyuqoyyLr6Zo5Mi
 em6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=w/yIloBiOa5RGJ1keBrumBScQzIpOuFYI5RFV6gaNrM=;
 b=JxCggPXrAs+e/jhyFzsn8v0gUFBQ4DgjpvOJ1eYySrS+xMvHw/4920lrv2un4uaXDJ
 GKf1YvaCLsDPQPsNEx/MOnmLSlbGBAMCg27ERA0S+88K7MqqqY1s6IszuXopctX1+5/u
 uuP0XQtSMzW1uN2MJUS7J3SwB8P0TOdFNzw2B3RIu/OQjlRs07SpNOGXVmu5jHXtOw+C
 GfiM5h2h9vOi/cyB4QfS03t2QkGfjc4VsDZD0W8qPEI9MaCb7KyIpSjoWOCgMUhilBzp
 vX0AOEcCbPvjmLg6g/6iYw8/dc4HH6yyGKUoqBAuJlnzxd0edxKYNHXA90wn5Vc4s98z
 r36A==
X-Gm-Message-State: AOAM532zHt4T31288rH5a5iZ9rvy47Hg+uQurUN2KTPIWWhXSEtPtHDd
 N102q5JFH0EcjxjGAjL0EOlmL4A88KFUbQ==
X-Received: by 2002:a63:330b:: with SMTP id z11mr22664102pgz.32.1619543329113; 
 Tue, 27 Apr 2021 10:08:49 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id r32sm303757pgm.49.2021.04.27.10.08.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Apr 2021 10:08:48 -0700 (PDT)
Subject: Re: [PATCH 13/13] target/arm: Make translate-neon.c.inc its own
 compilation unit
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210413160759.5917-1-peter.maydell@linaro.org>
 <20210413160759.5917-14-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5978430f-9a3b-b254-d91f-dfc250395ac9@linaro.org>
Date: Tue, 27 Apr 2021 10:08:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210413160759.5917-14-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: I21HvwPgXFqz

On 4/13/21 9:07 AM, Peter Maydell wrote:
> Switch translate-neon.c.inc from being #included into translate.c
> to being its own compilation unit.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate-a32.h                           |  3 +++
>   .../arm/{translate-neon.c.inc => translate-neon.c}   | 12 +++++++-----
>   target/arm/translate.c                               |  3 ---
>   target/arm/meson.build                               |  7 ++++---
>   4 files changed, 14 insertions(+), 11 deletions(-)
>   rename target/arm/{translate-neon.c.inc => translate-neon.c} (99%)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
