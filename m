Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp6362485ejc;
        Tue, 28 Feb 2023 17:21:27 -0800 (PST)
X-Received: by 2002:a17:903:24d:b0:19c:eb9a:770d with SMTP id j13-20020a170903024d00b0019ceb9a770dmr5244517plh.53.1677633687510;
        Tue, 28 Feb 2023 17:21:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677633687; cv=none;
        d=google.com; s=arc-20160816;
        b=WdAzuZy24VdNrSEnxDMIfwiuqScG3VmYXLA89bHSMRm0OEgc7NKrR1QZoa7csPG3kP
         F3H8YYNgTwmnLnlY3OIMPfnhIaaPLvTiKLtLNGXIkw7JEazIKDL8NxADYMXK56h8LNLw
         AxFqBvX+wWf/jKGGFuLEBQoaU7EOckOigKJx+T0ihVb0r12iY3SfM74Lc0G+PhWYOvdq
         YuCD51OUK6Cofw40PhYyc6uB1s9DB5HnaX/2Fs1Gve6dWpYhIxxAarqy4c2UjGndehaq
         cmF/G9RYRxRp3g3pvMmgGwGS4tHvrnxcmOoHiHpzuM2FAaK3VUt6D5HaqDcPq/rgDvYY
         Ey9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=PcFqs96t+/JGXoAq6gVLOXrsvN2eBSdItU0v2+/hoGo=;
        b=TxMHYB8uy66u+z4VnjkXOcIBAJVLEczEt0FDeeX/i7LZQgki3P1ESpayyQhCyCQbMq
         Mdk4b1bdvbmA8alNwWRVlnFigxt/f/4XohYDwG2utoRMUiooQKO16NKqWXUQAk9rNnn3
         Rn5eLslxVBh0VKyW2zLoC6o13wD10kEWd0bgbmJBO2J7Ou3LFmsjgDPJAy7cNSSOqSgD
         Xpj+xnv9gBPF/CwS/F/mSmOWQbvqBti8eoerPiMy50qL00rXMjDvaf0kNNGfkQH0wRD0
         ClJE7h0Du2XMVnnBpLG9uaY1d/l6W5tk8ozQ5QxMA6IAULoboo/r3RBisqg+dE73x47Y
         1QeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=paODFKRj;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id jf18-20020a170903269200b0019adbf360c1sor4252309plb.120.2023.02.28.17.21.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 28 Feb 2023 17:21:27 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=paODFKRj;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PcFqs96t+/JGXoAq6gVLOXrsvN2eBSdItU0v2+/hoGo=;
        b=paODFKRjey7o7P1jgwuM3Zjx2TypXm/YjSco45/Haz6Z/tmUW+Aj4IP+jSf9p0GyG/
         ExGvlim6SfRHhtPghyY1ttbYgMTMZFx49h/Nn7BcacfUEsANCzZYHlDVPXa/B78mDs4t
         /45+XUlXuJJml620niCU68i/44//z7J+2hLuOC6CCUIiFBEqo+DBK/VvIiWIjw4ZsJAK
         34clCQTM7ujsdpde5ScMy+DzkIDLiimF5NwuLXtAnFCHlmMqrj1W4pMonW2DoC8FAM2D
         TZau5XGchAIqH75ONKEAto6AruDTmcF9CJjRr2fVV0aQc6QdqxwLikh5e1J2jaDF5EhC
         CfSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PcFqs96t+/JGXoAq6gVLOXrsvN2eBSdItU0v2+/hoGo=;
        b=Dwf309iL5xZ2G6Up37NOr2nU8cT+xnUljHqU4x5Ho9SHEbrq+5FUpyAfAaKzl7SXob
         nKyBsklaPij4mr/vLg/frVNZGRvJTnxbvCcSryEprJXsEUCwMiMVODB2aiymwjctpusM
         cX/sjD0FLsY6nWC39zzh9e75PlflofvcbBbyCjn0GIAI68BXvrIOE7Php6bid2JUnxVb
         tHMGi2I6RUKKqhYKYc9lbMDunKDmaCqYi6gQkRpx3MkIMuQXG9yEQaCMrf8APwY53wUm
         SIDShvWFJ7AWO4K40VmZjR+CTQB0IUvgLJj1JS8wbeQrkwvECFPSDjyK6Rp8/XF8yRce
         IWYQ==
X-Gm-Message-State: AO0yUKUY2U4uRxmqEGqG7i2m9Pzy8I2r8K8QBHNrsBsMDOJ/s31rvDyo
	FcaOxHtx097i/83gmqL50npsQoJA
X-Google-Smtp-Source: AK7set+G+oqBAZVWEI9qJdHdFShSHbt6tYFqMoZMLiCWAXGiaVKxUrnN0P49EB+HrL2KrZ6rGEYT9g==
X-Received: by 2002:a05:6a21:3395:b0:cc:786d:2128 with SMTP id yy21-20020a056a21339500b000cc786d2128mr6111913pzb.53.1677633687013;
        Tue, 28 Feb 2023 17:21:27 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
        by smtp.gmail.com with ESMTPSA id s13-20020a65690d000000b004fcda0e59c3sm6292424pgq.69.2023.02.28.17.21.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 17:21:26 -0800 (PST)
Message-ID: <4d42d401-9049-afc0-a5d3-9de28457afc2@linaro.org>
Date: Tue, 28 Feb 2023 15:21:19 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH RESEND v7 1/9] target/arm: Move cortex sysregs into a
 separate file
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
References: <20230228192628.26140-1-farosas@suse.de>
 <20230228192628.26140-2-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230228192628.26140-2-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: YmE6TNSeRXpe

On 2/28/23 09:26, Fabiano Rosas wrote:
> The file cpu_tcg.c is about to be moved into the tcg/ directory, so
> move the register definitions into a new file.
> 
> Also move the function declaration to the more appropriate cpregs.h.
> 
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
>   target/arm/cortex-regs.c | 69 ++++++++++++++++++++++++++++++++++++++++
>   target/arm/cpregs.h      |  6 ++++
>   target/arm/cpu64.c       |  1 +
>   target/arm/cpu_tcg.c     | 59 ----------------------------------
>   target/arm/internals.h   |  6 ----
>   target/arm/meson.build   |  1 +
>   6 files changed, 77 insertions(+), 65 deletions(-)
>   create mode 100644 target/arm/cortex-regs.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
