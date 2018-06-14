Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1600525wrq;
        Wed, 13 Jun 2018 22:47:22 -0700 (PDT)
X-Received: by 2002:a17:902:7d89:: with SMTP id a9-v6mr1379827plm.238.1528955242204;
        Wed, 13 Jun 2018 22:47:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528955242; cv=none;
        d=google.com; s=arc-20160816;
        b=FaFrdY/P7KPcdX75Qg0QqHAUP7PHkrSb/rTK9Hp9vzc/5xY1/ipWS77n7ajqSQPrOV
         dw2Lfl1zk9otOnhvKperpX9S4cqzIMC4dVtHYFD/QXKiI/81YLSKBOk0MZB/U+rXiBkC
         lOvlQRY8Ggn1SUZcwcHrpqvAtYwPGNozrgS6LLu1FXc+iiwnNjERgJqczvsjN6BzNHG7
         8zISco54tmbnDQ9XU94c635yeyYZlpAuibunJ83hqTQvftyoqTsTGIVMLIOjU8bSAVaV
         N9cnX5l6CBVTSz1kcfSCh6j++wZRxWwUImZ0NiJAvnpdwQ7uQq3MHlTYRRT58PjvjCWv
         /HnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=pEMEFzon9vLrO/TS+OYNFiCujtwDfdpEJuz8XnzTSqY=;
        b=JhnPeHA1KUiDzTyARQAN+u7vBgQXnnVGtHpDuvzqeITXfqpaqcwKazij0iCa1JZrM5
         jUFIhVFnlPIc2K7g8eNIL8KiN5XB72l9CvCnBLktXb0KXHt8pIU5yghX08gCyQ7UREYN
         +BY3ypEPfENoMkMbkwu0atyCwrGNthizGyeFHgTECElY/3r/4/Yc8zbb0QhaUEUni8rd
         tSyDdb+MvjlJ3jvxJLFusv3JDBKZztBg/sgjKdq4n/AAEpHeoHNURnOrQx9UwWxJNApJ
         SHl3pDUfSxuz0vpYNbiwc7WD9gahLHSl0moUWHUErLwGjNRShlZGxmU+MiGfWGPvXDno
         kJyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V6tlxOki;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id t11-v6sor1503433plr.140.2018.06.13.22.47.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 13 Jun 2018 22:47:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V6tlxOki;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pEMEFzon9vLrO/TS+OYNFiCujtwDfdpEJuz8XnzTSqY=;
        b=V6tlxOkisNljwcodOb+O2OGaDJj8lxOTcf3J/uirHuoocGR64E+gVgxbSOz0U+JoV/
         A6LsdvTpftXthhHotxJh/P8XCN8ayxT+LO0Ru1ON/zAC/fJ/+TTNLxyGihaCq8KwCGSR
         ZoqXanZkxRqP0vm1TSao7v715Y+G/t/ZhLazk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pEMEFzon9vLrO/TS+OYNFiCujtwDfdpEJuz8XnzTSqY=;
        b=nly+POGszaspNqBQ/Oge/gLfeo6MLkz0HbIttqfO9OIkfXVKcvnYlVissgwqZe0MkJ
         ToPsJLBaXB2uESlM5QbdcRDqBbHJL15hnTzkWAJ9By2VBQgzkT9BOJ3uZYc31DVExi+8
         IxAIMJ5rW+JdF6ziyDo4oVWMZcDspq0bGCgEe3sZ3VBpqM1c0Rq8VRb2AcFHUh0taUYp
         g+3ihDZWCLKusaRs2XeNCywHEpoEcb8Q+ZZow2n3s2k+WliAI/0v0ELQOXydoGZb2VFs
         wZESRaXIaksnK75UolUDP6XgMV0o/uv3lB4/H5AkWPIfuAzx7oUIAYBavPNpzwmRAygK
         3wkg==
X-Gm-Message-State: APt69E1jeZCBuHO9CkTEIR1vH6hWBoHLtKUKL4XpreC9zx8tAg0dgkWk
	SaL3iYTp4KQ8o3bA89p28pYb87a5
X-Google-Smtp-Source: ADUXVKIICPdLAND6jENJ8P68K0XpbkjT5/IJ54/8nvdRvjCtql5VLlDZhjfR944kWmPruXcCAW0f2Q==
X-Received: by 2002:a17:902:7202:: with SMTP id ba2-v6mr1329645plb.119.1528955241831;
        Wed, 13 Jun 2018 22:47:21 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (rrcs-173-198-77-219.west.biz.rr.com. [173.198.77.219])
        by smtp.gmail.com with ESMTPSA id g80-v6sm9220833pfd.21.2018.06.13.22.47.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 13 Jun 2018 22:47:20 -0700 (PDT)
Subject: Re: [RISU PATCH v3 05/22] risu: add zlib indication to help text
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20180613125601.14371-1-alex.bennee@linaro.org>
 <20180613125601.14371-6-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <a24ec09d-9bf8-ea12-092f-9df1d4ad7786@linaro.org>
Date: Wed, 13 Jun 2018 19:47:17 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180613125601.14371-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: FrrXkcnechuf

On 06/13/2018 02:55 AM, Alex Bennée wrote:
> This is a simple aide-memoir as it can be tricky to determine this
> with a simple statically compiled binary.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  risu.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Eh, sure.  Or we could simply require zlib...

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
