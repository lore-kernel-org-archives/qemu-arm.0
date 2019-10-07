Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp3809714wrm;
        Mon, 7 Oct 2019 06:37:46 -0700 (PDT)
X-Received: by 2002:a25:830f:: with SMTP id s15mr10377874ybk.416.1570455466681;
        Mon, 07 Oct 2019 06:37:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570455466; cv=none;
        d=google.com; s=arc-20160816;
        b=zbpha/8PpGLmFZGkTjBFLIOPxwjkWR2EX8yZULDq2pGhULU2dMkqbBvD5TbhpR6b9n
         9+wWcrsxjkpNA/hiVSnrwslf0B3CLIqnE+8g34HGoYmHYyBhhVztg/wjO5BGXQSIvwve
         dIuvGROdCQm9/lyWwnDfA8cLd+XtKHLtHcvly024kfFoVl5pd2oFotSPv1wSrUEtcK/9
         9zfC9K1XBraGNlZrdt1WEX1gy6Np6Rf94l90A+8N5xUHGqzegdF8rzW4pdpiLYyscmqt
         KQ+htV4uAzjZcFsj7e2WuqbC5oCUEhuxe+0ldab/BFUVVlclBaKmi1gJPcKO/uscVODD
         qPDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=kjGEkegORlysiCvDcBVThRl7o0UalPLlBqkuzJN6oyA=;
        b=W19oGPxOg3Khmwvypz42MiTXd7vj0CDium/H1K+BRlU4KW+B2Y7Y3gg2Jhz85x5o8b
         CGPhd8hvzZcp2H5I4bYAkw1De6YvRJ5TVF1DJf7XrkFKxSMaukBG9y23bJtO8vjVwhDB
         ZaiinpI0VelL9aBh0riVBIOfiJqCBm3isGBCLhEoWTL7uH+BAy+IAkueYjn3nCbuaCVX
         aTPml/FnJhajSeOrbi2f9qV9/lbw4caV9WXs2GRQfBDixj6ynpTPDShaCw8uNVIqJz8L
         AKPxba/J7W8paww0VB4HP4h8KCWe52aGQfCNp2kS0suuZoEUthVRs5OYJ/eMhBba6jUf
         unpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PGn6pZxF;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id y65sor8312373ywa.70.2019.10.07.06.37.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 07 Oct 2019 06:37:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PGn6pZxF;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kjGEkegORlysiCvDcBVThRl7o0UalPLlBqkuzJN6oyA=;
        b=PGn6pZxFk6UjITHYaKjIXHAs/qgRpHa3gsAO/G6gYN1NwxcbVjYpBZi5IBeOiW6k51
         M5RSAKriSKPdO/25dU8ZxtcmhF64WBzfK7lkhV/YzcAxLmmko2u52OvEFw152+aLB2sQ
         5nskhDUOQBm7623qy8jGDz49y2SgF0LoAkacGfhT06Z2t3EE8HoOIbOKiExw8sF+PLbG
         EFc2TxQcRF4EBSXtqxNuLdq4UL8UJQCFfe5DlzusmCatdcvkOkhd4N/hZ/h0a5VeXc1h
         z9fW68+5NmkFUS88/gpySYgufVuPlhuubEvoBziQMfFu8LLGSXlRUSOnmmzD9Svs30Vu
         vJgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kjGEkegORlysiCvDcBVThRl7o0UalPLlBqkuzJN6oyA=;
        b=fZy6VdyAOhp7ltod4QUzEO+RAOQJluDYAUt7bZ4Z/2vSZlBMbG/dU8X/jda2YLU4ce
         9ZRAyQftqMCXhqpY8vic/l3YboBHDv8PvDA2SQ1/xZw2U3Kw03cQhegDTophdWwe8mSe
         kFinkCerZ0IzCLBduFQXgwRUSl2n63SSh5rPq3m8nQapsCvPdvGBk3Lel6o5CIsVg9oi
         FCqYIUI0PK+OMl4wiMRWWH6ihRbs6+mDCBTVKhntCsljELUKnd/MtYyo0855aErwLncd
         np9snsnwe3j9sefw3p6RPo6sl4BgaMlom46WzvCNDCLYAobApU71gLxMIsF33fxN+W0t
         M7ag==
X-Gm-Message-State: APjAAAWutBg/qHJl4sjzMpZVVqmgIlPEC2Ad3fNKnClt+heV1G1tahfz
	t6b3T4k+sKew1Fw9cnHZotZGjHF284apqA==
X-Google-Smtp-Source: APXvYqzRbDoV11Xq8RUZa3izNtIYsb4feRG+vTQXBCk3z66HjjTgB8cwBMW6Dhq6nu19nHcJIoCGvg==
X-Received: by 2002:a81:a903:: with SMTP id g3mr11917115ywh.188.1570455465740;
        Mon, 07 Oct 2019 06:37:45 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.44] (67.216.144.16.pool.hargray.net. [67.216.144.16])
        by smtp.gmail.com with ESMTPSA id v204sm3779080ywb.23.2019.10.07.06.37.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Oct 2019 06:37:45 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v2 02/15] target/arm/arm-semi: Always set
 some kind of errno for failed calls
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20190916141544.17540-1-peter.maydell@linaro.org>
 <20190916141544.17540-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <ea400570-4446-5d2d-9e19-82229b9e69e1@linaro.org>
Date: Mon, 7 Oct 2019 09:37:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190916141544.17540-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: SS751smZVUNx

On 9/16/19 7:15 AM, Peter Maydell wrote:
> If we fail a semihosting call we should always set the
> semihosting errno to something; we were failing to do
> this for some of the "check inputs for sanity" cases.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  target/arm/arm-semi.c | 45 ++++++++++++++++++++++++++-----------------
>  1 file changed, 27 insertions(+), 18 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
