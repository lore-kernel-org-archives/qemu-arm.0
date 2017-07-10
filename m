Received: by 10.25.44.15 with SMTP id s15csp3846417lfs;
        Mon, 10 Jul 2017 12:58:43 -0700 (PDT)
X-Received: by 10.233.239.11 with SMTP id d11mr5884281qkg.126.1499716723578;
        Mon, 10 Jul 2017 12:58:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499716723; cv=none;
        d=google.com; s=arc-20160816;
        b=NVlQ9+jt6PpIKvlp2tJd2xq4WVOIAMbM6tNXHN0zbM5BqDxA9MpzZNXIX5XgLw4Pzg
         KA2RH0QQt0WiROuqEtnvESG+CRx1el2i3cNIQ8z5E+bmHipYx6DU1p2bqZwf5H6cdIjA
         t+pj30wB2KGM3WIDqs4Zm62VwJPQnLJ2XeKms+CniOUl8N9PGtGQMjL2cLpLAC59nrRY
         /8lwHh6rQLzKSuC1RWdN0yo9RJnNWszCIV7Gb/AULSFLO6Oy+GgoDeRl/vwhdfJpMKUd
         tPLRhtRo4/1CUCCW2UwhpoIheO9uhYlxRS141w0PTZxTPEH9a4+H/yZfWfKNEdB9z3QW
         6jlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=2Ku3/ObJLihtd7apeSEe8FV+2EgHNmQ8dDYAvpLOqiQ=;
        b=k0n3YOI6nzszOdgzqv+I8GuzslT+Kmv+qAdA27TCfiV02gLGyG1c3JsO9sSWJwb/P5
         WvCkpXd84FvBKTq3SxdlXxEBQn8xcwWri8Cq8THxdYCw0n2iyN7edrGf/Bf/QY0Rd6Z7
         1EB1WoCXIwZo+JFLiVPQuuuaXpUCUN+FDuRxP9VDSjdNK9YkyRQrPkJFiKqtZsHZwkvg
         iGlpBYbn42eT1ltYHIZtDjLTQuyZ9FRS+KOMnnLNaJlAcngr9v18xkrFqOcdclIHr3y/
         I2Xy4IUz/D3pxzL2s+fsTebuc8qbnxPsv1puXTJwv0hpilpDJvZYSzqDMDzRYRTgBqeO
         DrtA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=i259BaHX;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::244 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-qt0-x244.google.com (mail-qt0-x244.google.com. [2607:f8b0:400d:c0d::244])
        by mx.google.com with ESMTPS id l13si11800029qtc.61.2017.07.10.12.58.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jul 2017 12:58:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::244 as permitted sender) client-ip=2607:f8b0:400d:c0d::244;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=i259BaHX;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::244 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-qt0-x244.google.com with SMTP id v31so14038388qtb.3;
        Mon, 10 Jul 2017 12:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2Ku3/ObJLihtd7apeSEe8FV+2EgHNmQ8dDYAvpLOqiQ=;
        b=i259BaHXPBocNAMc5tOFETi8J/3sq3VKxZlH82xO9RbGfvDHusndyYsDXRSq6pr9GW
         8r2LRIZ/Y7NCFCllEwUFGE/Q/eI1M6IDjs0XmHeJ1oElqNifT7Usp3DWGL3ECd2AuKus
         C4Ww/O5jh9roP4EhJII5iTYdA085wwulT0RLpDQbIM7tx8HkjvSPkBRwr4hIvpxq22Xe
         ekfY0UGSEsmrJKgJrhX4l8dyzkDEKRQMabXYULKhbfUr710Gib0Pf/Biaj7ffaq+mca5
         Gkd/yXWAW6VtxkBJxIfQGuKmc/wEXHNkQPHkGq5IUqhPBVJkTIU1pQyCp2m3DLqIJtnX
         Y8Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2Ku3/ObJLihtd7apeSEe8FV+2EgHNmQ8dDYAvpLOqiQ=;
        b=W9+4x/LmWBaqg76yJk1eCHE3CV/nN0Ty6Z9YyFTYHFPlWzc8Hl39P9f0ofuCxjszwp
         4GOppppYwDNZqZcRboD9h/rTrGuoDdA7jjab6v6Z5cUFUsopJjIT3pCBSlcXC6TSv/ko
         jar96fw8/h7tcF2jlNDLUfoY9oeM0h6fhn1WN7KonMYnhYU6JdZWuXa8exEUoa8UY4KY
         njjEp2sBEOQNNtKJCDzhHe7O0yz2YqRynP3VlACNY1/IskEdMA7Vsum6gAZII+vCLHfM
         Mu893dm/38NN0t5YsQDoZ1YknBlor33B2mWK6KTWqHTAeTkFYdoBSAkF/QNuuMyKpdFS
         m0oA==
X-Gm-Message-State: AIVw112ncYP7Rf7buPHHY3yHE7exDD+iOK+ok9ac3UccgCD/9BVTovYu
	KzOGKFcCGUT79k+2TSM=
X-Received: by 10.200.38.244 with SMTP id 49mr6557411qtp.236.1499716723017;
        Mon, 10 Jul 2017 12:58:43 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (rrcs-173-197-98-123.west.biz.rr.com. [173.197.98.123])
        by smtp.googlemail.com with ESMTPSA id r191sm8885665qke.22.2017.07.10.12.58.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jul 2017 12:58:41 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH v2 5/5] target/arm: use DISAS_EXIT for eret handling
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org, cota@braap.org
Cc: qemu-devel@nongnu.org, Etienne Carriere <etienne.carriere@linaro.org>,
 Joakim Bech <joakim.bech@linaro.org>, "open list:ARM" <qemu-arm@nongnu.org>
References: <20170710192128.9048-1-alex.bennee@linaro.org>
 <20170710192128.9048-6-alex.bennee@linaro.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <9d34052b-57db-9a71-b8a9-e1bbe1a9fae1@twiddle.net>
Date: Mon, 10 Jul 2017 09:58:31 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170710192128.9048-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: ifwj7ErWC0eM

On 07/10/2017 09:21 AM, Alex Bennée wrote:
> Previously DISAS_JUMP did ensure this but with the optimisation of
> 8a6b28c7 (optimize indirect branches) we might not leave the loop.
> This means if any pending interrupts are cleared by changing IRQ flags
> we might never get around to servicing them. You usually notice this
> by seeing the lookup_tb_ptr() helper gainfully chaining TBs together
> while cpu->interrupt_request remains high and the exit_request has not
> been set.
> 
> This breaks amongst other things the OPTEE test suite which executes
> an eret from the secure world after a non-secure world IRQ has gone
> pending which then never gets serviced.
> 
> Instead of using the previously implied semantics of DISAS_JUMP we use
> DISAS_EXIT which will always exit the run-loop.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> CC: Etienne Carriere<etienne.carriere@linaro.org>
> CC: Joakim Bech<joakim.bech@linaro.org>
> CC: Peter Maydell<peter.maydell@linaro.org>
> CC: Emilio G. Cota<cota@braap.org>
> CC: Richard Henderson<rth@twiddle.net>
> ---
>   target/arm/translate-a64.c | 3 ++-
>   target/arm/translate.c     | 6 ++++--
>   2 files changed, 6 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <rth@twiddle.net>

As an aside, I presume we don't have support for armv7ve?  I was expecting 
there to be an eret insn in the aa32 translator and had to dig up previous 
manuals to see when that insn was introduced.


r~
