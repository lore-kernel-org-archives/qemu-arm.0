Received: by 2002:a17:505:3f8c:b0:1be9:327d:8ee3 with SMTP id bm12csp98543njb;
        Tue, 30 Jul 2024 18:30:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX+9NF/CACnecwnyApbAtPJ7RwyRNfHg431Etw4JaiuZk3KMTLBDyIeJ5nPTwhf3zb4VhBpqEnGxgMxQ9sEXuglMD+PCYfr
X-Google-Smtp-Source: AGHT+IHIaikleLyNH+RfahuO3XTUcJSSwIQE2fqOAiCKeTJcJiWYNuZSUi/G9FiDQkpMCkwSxqAI
X-Received: by 2002:a05:6359:281:b0:1ac:f854:b68 with SMTP id e5c5f4694b2df-1adce43dc8cmr1353767855d.29.1722389455029;
        Tue, 30 Jul 2024 18:30:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722389455; cv=none;
        d=google.com; s=arc-20160816;
        b=FMILQlGMyp0NrBgCJXswAsweSylXyPUJXzSyL3J3pjrgBRSYfAgxZi9jjNhP5ouFtA
         GcsucO9/4y7BV+jCIvWy8Dt2UHazkS4DNzV+0f5mYkR9uskz8bXLwyfNvbx3X+6oxYaI
         xyeFvVlus+q8vV/3HN7LD5/eEKnWNwnjUK6bXqhodvefO5rvvUXeAh/qSSV09FZRFgod
         e6hDigbAn7L3pnLoZEit29NHwg1OjXygqFSdmSK+bGBnXDlNjD23ypmADLa69pQX0CxL
         wI5rkwn8i+uPhd1u8kwf+lDEQyGngm3HpK8uNlkYKuHMl1+4Gc5n3WA82QVl7+KImsMg
         ky+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=9biiJL0mbDr1bvDdX9pp1KXU1e+FESJgSWe1rySFiE4=;
        fh=SuS2+1TrhxI/naHgtjWpv+Nii/ZEqVUeInjWBTwIQcM=;
        b=DUXIEPAjdC+qZQV42yqYFlvKB/UuYRTiJ2h+mtJ+QZ88ySGSsxtlQPwa4Dtneor2Eh
         8mXG8gGeUA/lYkz9AVHPcyEEa/+JT4oWRICKadjjL4pyHh8335mY/V8ZLFC86EXJFeJE
         IZWigI+LbkCl6IWxmOwi/TYDkyt1SBgXMqymvsoegbuP960BG84zyoJ5/4Jj6UOB32e/
         F4RoAeu5P9zH/m/MYSX2eoJ1XDwy65lyE3eaeFmEqLEoKMv1pFsFdI5rrcvc8souttH1
         BYFyDdTa/Rd9ypQG5pcZuZPs1kuJaXis5IYGPkpYpAWIq/qFJoPkBGuPm21+X2+DquCg
         5x2g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SaxsTTJA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bb3fb0525asi150604016d6.518.2024.07.30.18.30.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jul 2024 18:30:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SaxsTTJA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sYyAO-0007M5-Dz; Tue, 30 Jul 2024 21:30:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sYyAM-0007KP-Hq
 for qemu-arm@nongnu.org; Tue, 30 Jul 2024 21:30:10 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sYyAK-0005zo-6q
 for qemu-arm@nongnu.org; Tue, 30 Jul 2024 21:30:09 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-2cb4b7fef4aso4013658a91.0
 for <qemu-arm@nongnu.org>; Tue, 30 Jul 2024 18:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722389406; x=1722994206; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9biiJL0mbDr1bvDdX9pp1KXU1e+FESJgSWe1rySFiE4=;
 b=SaxsTTJAfrOCOaqj+ztyTj0mfXynI3A7fBy8s2Cep/VhaFJIGcDd9erjzrdMc1CLxP
 XAL6pT7hft2T74c/yJYuRTaCn1JKsfpn7kOIiG3U8KcJjASpKmeCznPC/uGDwzo8BGHd
 o9g8nkJ5dMgTLkE0xeR2wrPoDRrwYacuM0fo4cpdVR/i649wuqUy6Gx2I0N0bCD8/RW3
 NMyzqOrMExX0EAZ9WDQSP4Eq0d7q18E7j/xnkXEx4qvdLpY+volt0FsK+nSeMVwI60qr
 7nu/YjYf4N3PNeT0GZeO84MN5nEoJEr7hsPvoDXctFKH0EGjQmveJoAuyReU45pCoYjf
 Tuwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722389406; x=1722994206;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9biiJL0mbDr1bvDdX9pp1KXU1e+FESJgSWe1rySFiE4=;
 b=E0KATvlTASq/RTFV6hHUJjkEEt1c8g4P1PyHmp1MTV6ltHQSiiM4EDSQ5+UpDMxEHX
 rSn+ek6raGmnlmFWzgo/OCz+sDoNd+tdN4OE4nWOFVsSqN/IzHac73FvTVIgnj8dYpaj
 QzP6Gv18UlT8U+sd3kz/CdxZU4pBNpXxqs3XERmNt6fXb2At9OeAykP9q9S7lOsCx0PL
 rLI2rqI0wVNLUjWB2RQdn+jV8V2Sc/426jaCUiOl4PBDJlH9krvz9tRbeLyrzrNAf8TC
 2AwKB0xqsLaPEm3m1GMDRFcPPk9MwE4mnmdcxV8nPY4wv8xLNRInohpxLdO0BwAs/roV
 Essg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXYA+6desavSH950deZPJmQ81rVqe9EcJWc5Fj1pqjCvdr6GOOQ5CdFIiE+yhRQV3WJdBpRzt16LyWHsnFfCzLDTlY
X-Gm-Message-State: AOJu0YyuAOEJ2kiojTdT+OpZG8PEktYC0npdBxKx2O/ehSHeo3mMEgCZ
 fUA3KfFqb+JOaenpJkEjB7+G9lfdD2X2Jn3Ji0sRPIfspaZs5LXA7BMMXJGdCLM=
X-Received: by 2002:a17:90a:888:b0:2cb:55f9:b7c5 with SMTP id
 98e67ed59e1d1-2cf7e1df02dmr14985782a91.12.1722389406278; 
 Tue, 30 Jul 2024 18:30:06 -0700 (PDT)
Received: from ?IPV6:2403:580a:f89b:0:7406:659b:9ac8:69bb?
 (2403-580a-f89b-0-7406-659b-9ac8-69bb.ip6.aussiebb.net.
 [2403:580a:f89b:0:7406:659b:9ac8:69bb])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2cfdc4bd11fsm72812a91.55.2024.07.30.18.30.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jul 2024 18:30:05 -0700 (PDT)
Message-ID: <aa95043b-2192-417f-9c46-5d3b92f8dd92@linaro.org>
Date: Wed, 31 Jul 2024 11:30:00 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] target/arm: Allow setting the FPCR.EBF bit for
 FEAT_EBF16
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240730160306.2959745-1-peter.maydell@linaro.org>
 <20240730160306.2959745-2-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240730160306.2959745-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: U1JAjeozsNyn

On 7/31/24 02:02, Peter Maydell wrote:
> FEAT_EBF16 adds one new bit to the FPCR floating point control
> register.  Allow this bit to be read and written when the ID
> registers indicate the presence of the feature.
> 
> Note that because this new bit is not in FPSCR_FPCR_MASK the bit is
> not visible in the AArch32 FPSCR, and FPSCR writes do not affect it.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpu-features.h | 5 +++++
>   target/arm/cpu.h          | 1 +
>   target/arm/vfp_helper.c   | 8 ++++++--
>   3 files changed, 12 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
