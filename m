Received: by 10.28.71.27 with SMTP id u27csp2527449wma;
        Thu, 8 Feb 2018 12:46:29 -0800 (PST)
X-Received: by 10.36.155.215 with SMTP id o206mr656656itd.22.1518122789258;
        Thu, 08 Feb 2018 12:46:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518122789; cv=none;
        d=google.com; s=arc-20160816;
        b=y0acE8tT1dXZvaDSirs5myf76l3hTMA3q90bjZ8xvCUJIgHlV2ItJ7iJK36Kt5cNNX
         q5BHbM5X1XDtxaqGVu3hN2n75f0T62AL5TZe9bYO81tDOo9mLVYC2gmb/jEmn4aI0Vh0
         sPfRSeQUTioCpR/EQfnCe9VTIUM7SF5l97gFjzcjM96uuVVc7APqqfprkqsecAjaXthG
         NXeJS3kGJ/epluuRO0aCxbotJvXpPJ01r0BWx89S159KZiLyLXPtxqXHgz1zEDABevBM
         hrkrnES9oPpYmZNFxWLNk94hZo06wuHc5hPAT3lvVnph7u5CHpLw1Js7ObiYvAn+QGso
         Lxww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=qNqrh18S2D3Qcgkw7i1Qx/00g6gBqeZVmdC0yasD8MI=;
        b=X0OvCbUV/ZIaRK0Lgl7iBl9FQvv+fTvu+X1ndAEfbe4l292ICIDEjxAHXBDNoyUvrG
         xZukw3F+43DSHBLu7WzfejJ/uu0+8DmulGbj0pTU56cIWPM9B3lQYVEoAJruUqXxg3Fs
         Se7ucKamm4GqCds1tXR+MM4miVgHbtnZog4qqj6VA5ufHoTnKdY7u5Fn4qmY0w5KiPZ/
         9oCRODYGbEOGl23zRxy/ECD0e8SclC+nSzDcvi4jK4thdtDUE1hpMF1GgejpADbg4kRV
         nxjIjtcCggQZNipSJmE+hTPkXFgGARLGzRJ/QV/G0b4jEH9grZIFkqwLvvjQkhWrHY5+
         5X0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ImvHHkzS;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id l17sor516686itl.116.2018.02.08.12.46.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 08 Feb 2018 12:46:29 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ImvHHkzS;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qNqrh18S2D3Qcgkw7i1Qx/00g6gBqeZVmdC0yasD8MI=;
        b=ImvHHkzSl48a701yfOpqasEbmncu2Vdw0Tl9yTn8PEgm4niKAv/Aw0WdLuoATPLezR
         /x3kRaOLfRR9kRF1QcAWN/7fWKN3JTWxs4fPPPpW6UnZfv0ivlPcAD5dt30B1zRna++n
         GLQSvTuOZyzPlNQ+niP/SL7Js5gcHtcd8W5dg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qNqrh18S2D3Qcgkw7i1Qx/00g6gBqeZVmdC0yasD8MI=;
        b=jlHZvbKe5bW1YtKMI72E6Sg1PK9XaGj9GkkgM6WqVosPzNMT1piFRZpveIQ9uLt32J
         zj2YgFDaRFTO1txVU8bY78m3GWOH58UqbCb7QklI3ooTipgKqj7ZvHcRvo6jBKYBnKIk
         RO1M/bNmQdwU8K8PvD6iHupO790iN1TSrvXfz1HNEPlvL9fkdp6WZt7c/5R4vWPZyqhm
         erG+rF/CbbwT4y83b3PTAUASDQUaeUUWsC1WzdMumPTdmbVb8uSV2boJdFjwb0mQ0VMg
         FJFz4EI5ixolBa5rL/t73niMcp3Igfik9A3JpiXSnid0+qHqMW5p39wCqhfPzvrcn+as
         yU1Q==
X-Gm-Message-State: APf1xPArcXuD6x+qh45WFArzJHSRXghl+2V0jge5b85cg3dGbtkNRsCy
	nnJUHLXF4rRFe3UnsOG3ezFHc3TW
X-Google-Smtp-Source: AH8x225Trep87uk4GEQXd41ehtfWLSpvKKXBWdwiUjYs+LexTbeHNjmRt14uQVQ1KTqFMn2Cy078Cg==
X-Received: by 10.36.117.150 with SMTP id y144mr580358itc.141.1518122788779;
        Thu, 08 Feb 2018 12:46:28 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (174-21-6-47.tukw.qwest.net. [174.21.6.47])
        by smtp.gmail.com with ESMTPSA id f207sm582876ita.26.2018.02.08.12.46.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Feb 2018 12:46:27 -0800 (PST)
Subject: Re: [Qemu-devel] [PATCH v2 07/32] arm/translate-a64: implement
 half-precision F(MIN|MAX)(V|NMV)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20180208173157.24705-1-alex.bennee@linaro.org>
 <20180208173157.24705-8-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3f79871c-2aaf-1127-c3a5-019383c06e7a@linaro.org>
Date: Thu, 8 Feb 2018 12:46:25 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180208173157.24705-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: yqa11kyzWu+R

On 02/08/2018 09:31 AM, Alex Bennée wrote:
> This implements the half-precision variants of the across vector
> reduction operations. This involves a re-factor of the reduction code
> which more closely matches the ARM ARM order (and handles 8 element
> reductions).
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> --
> v1
>   - dropped the advsimd_2a stuff
> v2
>   - fixed up checkpatch
> ---
>  target/arm/helper-a64.c    |  18 ++++++
>  target/arm/helper-a64.h    |   4 ++
>  target/arm/translate-a64.c | 144 ++++++++++++++++++++++++++++-----------------
>  3 files changed, 111 insertions(+), 55 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
