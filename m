Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp6171651wrh;
        Wed, 1 May 2019 11:35:21 -0700 (PDT)
X-Received: by 2002:a65:6210:: with SMTP id d16mr74036614pgv.110.1556735721667;
        Wed, 01 May 2019 11:35:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556735721; cv=none;
        d=google.com; s=arc-20160816;
        b=jYRN4YQfFAFwauOTcAGyoWQCUHVmd+Gm8zvzP+sqAnLPakdsLZhW7V0cz9Qk1XVgTi
         SualSJmScca0Uq6B9qSTz4bnDpBNJavisT32mLXmxpIbr22AU0Tplk4bLSH3cRtrIyJB
         lnbpi2LHyMCo/fqRIItMBNNO+dSCOwUJJc3/Z5eg1VXo5mCT6ND5+TaQKNDjvvQJ0i3n
         2zWxn6xfxf5k7TGVZfuMh7DDD9rcccTUcbi/Kf65YE0SlXGXJ9sX/wSKzha0TzkY6RNB
         dGsW1Z65x05kS/ZB288dJf15Zq+9pP0C3aqKfLk12qrMvQpMnpPZnaPCW0vgZEOBqwCr
         Ts3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=/JQSbGM/O19FqjA8tccpETQvPRZf58W19j52MJxDAkE=;
        b=RJwx5ygTxfW6TDGgLhuJLVwqhUffuL1gKzAyqUpJ9iXtFQNMptTpoYvl/KnqIwVPME
         JO3eTimyV37DTAq3t0twoLKIHiiO7Uc24jpNPjHCCSgNcCf8LzhtqNCGaCwGWRFX6kSk
         9RfEOigm3rsNcB+QY87X5qDAZRBtc3g6vICJGmZoTTtYEBzbojcmyniYvWMX1Q7G3e8z
         F9+KJp9YL8qY60rAYWMeJHrRKGc+wV0finnAEFDO9bCEzi9LjmRzwo+lUQDW+E6d7mSQ
         EcQl2ZAlT+bcI8FUhdbTPAcGe5sWNxH5YcBEOpkvOEtAUZwn42FMB4sGmGzl2IvO/S1E
         l7UQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ip6IYdHK;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v9sor15831291pgs.55.2019.05.01.11.35.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 01 May 2019 11:35:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ip6IYdHK;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/JQSbGM/O19FqjA8tccpETQvPRZf58W19j52MJxDAkE=;
        b=Ip6IYdHKykjavxxak7ouh2KLbvcSxTYCb1KNrElaglbEF7FYYRI8xBgVmO6JrZcUVD
         YT6LzMxOZf7Jd0UvLeqbgSwi24iHQrpsQcMK5sevIeVG+fxvWM0HC17RKLPVAjAcrdk3
         /g+m9hsGqwxknPle515lXpkdqdOP7/ComJM2U+gWMfAKkgR3cSxUCLCg250Ckaqix9Xu
         MnrZ3UmrhQwNYDw/b/l8c8Bec9zLMbYf62vgU1OJ3HXE7XnxjW5xHoXHVXAIdI4z33Oz
         D3a11N3nTrx+67uC7X9rTD0PaDCmd2gfgKNrqXRjw9YQ8wvrG+xiC3RMZFEIVILUQu5L
         mFZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/JQSbGM/O19FqjA8tccpETQvPRZf58W19j52MJxDAkE=;
        b=Z1Xf0zOstKAYgcz5MLcrogYHWF8jjLHPpjyjyPG7eTsSw/WFQCiVZNgCu59tMz7eM/
         JaryDyKe+30nt1vLsm4EUfWzY6gGUK5wvDKe5fiDwBIWMPY7PdtRwkFkaGCK7Cj8NtG5
         yIKpDuCjeR8Tx90pz4ruYvnceVmr6Fg+yE5yqWKVIrzVpszou9Dv2p3dL+oOVXyinzqH
         8Kabvh/Oq6gxCzFsuqFmDTt8DfPjsnt1mwyxXYaMnyRYIKGOmX+OOpSIZMGlp1t4cPnf
         JLyVfK8eoZodA7kPoyiC0qrOPZTGGcAE+NVVhvy8Eq0fXThHfomYiOiGPrs/ofXojUfl
         6WYA==
X-Gm-Message-State: APjAAAXqLcTfx/ebzyHU8J4Xy6SS0UUQUzyqSvoND1veIZatAf9rDayi
	8t1sCvnGJJMFCNZBMM+oAtXS7/q02aeghg==
X-Google-Smtp-Source: APXvYqxNBQzlIm1ZGaYSLhe1PHkFnvh8szrv3LWygBa74uFdNdrP829aFQZR8doOED3iwg+jBauAfQ==
X-Received: by 2002:a63:d908:: with SMTP id r8mr42526024pgg.268.1556735720714;
        Wed, 01 May 2019 11:35:20 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-189-189.tukw.qwest.net. [97.113.189.189])
        by smtp.gmail.com with ESMTPSA id g13sm13384891pgr.63.2019.05.01.11.35.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 May 2019 11:35:19 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v5 01/15] tests/tcg/multiarch: add support
 for multiarch system tests
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, mark.cave-ayland@ilande.co.uk, cota@braap.org
References: <20190430165234.32272-1-alex.bennee@linaro.org>
 <20190430165234.32272-2-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <0ef0d685-ddb1-850e-9478-e9c88da8ebb0@linaro.org>
Date: Wed, 1 May 2019 11:35:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190430165234.32272-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: GCwFrZ8x5xJ0

On 4/30/19 9:52 AM, Alex Bennée wrote:
> We can certainly support some common tests for system emulation that
> make use of our minimal defined boot.S support. It will still be up to
> individual architectures to ensure they build so we provide a
> MULTIARCH_TESTS variable that they can tack onto TESTS themselves.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/tcg/Makefile                                 |  1 +
>  tests/tcg/multiarch/system/Makefile.softmmu-target | 14 ++++++++++++++
>  2 files changed, 15 insertions(+)
>  create mode 100644 tests/tcg/multiarch/system/Makefile.softmmu-target

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

