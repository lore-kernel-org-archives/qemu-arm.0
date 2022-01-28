Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp75391lfk;
        Thu, 27 Jan 2022 19:38:46 -0800 (PST)
X-Received: by 2002:a17:902:694c:: with SMTP id k12mr6770248plt.98.1643341126731;
        Thu, 27 Jan 2022 19:38:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643341126; cv=none;
        d=google.com; s=arc-20160816;
        b=Qr1Q8mT9EfQkKq7jmNUK9HcmyISq2DA0/fpKmvr6wA1FfHB1dkeNhqLQ+CP4XP6UFA
         pH0CvVCuEF4ygod86L4q1peo11kBu+0s8S+NU4mVmBd3QvYz5CyCDzsdX/9HqJh57u+g
         NUp27e/Figfig78exTM9hemaTgGKTMCDSynY76GvNbHRaiX8kvQJTWd3iewt/26tpQ26
         U33uj7nrrqUGzl7QUSpx2vOQpfxJ395+7loSxA0LP53E7uhjLXP8iZeKXw+7NgyPEEQr
         xmfw0Ji2zmTHX7TmJCOGA8Pmbdw6h6nbIf1/mEDLR759lImlFbWWRXOibbWc1X09cBN7
         pNAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=1bNRYm61u3wzfZM74ZvYU9IkZ0YmO0e2GB7pf2XyzRw=;
        b=PKfHsaALWQyvpHA/RU7JYCFieZFaRgqYkhs+nlbFOZYI9YBkwQ9N8FrYcT77zbxI3i
         GgXiXIYsbtfGvv5AkTxeO1aZW7hSWQ2uklp+0S+eBO/hSFkXcZtnj72vvXG53V/xTJ8u
         THUtB3aAiMfIPLUuEqdNVSCPWDeTwOCvpPiUMfww4QXWXRRCk4DuqB+vjSSa2cazJVEz
         7s2hZWWZkVwuglrrE68+e+4knrwQcsLr/bbeZ7DjDdQl740DBmuEe3+cCd8YO/FbpN2D
         VKn/7EmA/39/ROoXEshSuA5kj8A9GQSwIoxutuhdmVsowlX0La74jKmKzU8yffARm8j+
         ZxLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rbtsbSvl;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x9sor2231952pga.16.2022.01.27.19.38.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 27 Jan 2022 19:38:46 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rbtsbSvl;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=1bNRYm61u3wzfZM74ZvYU9IkZ0YmO0e2GB7pf2XyzRw=;
        b=rbtsbSvl0E1y99+r0B9hL5xqdI2aaQCPO8y0scyfgCQjYT5VkdXkhmgmNrZC/3snNU
         YCYxjk9RbbMD1+FTT708B6fBeTuot0tFzio82Ttnbxfcmn0d8/ZDJ3b0AyUredXjeq90
         ZjjIPbHsEYB22VR+6VLSaif6KqJvD6HdmNkepVsxwts+EGicJzqw1hYAxh4Pma4krd49
         MHjQr9+BfU/9mkzC4IxYPnCbQ5D7w8T3nl6atyqWaTMwTsIc839uSPs2jwcnrC+wTy81
         69HAbv3KNzVPgnKRe0uXkEQUGtlvpTy6OiJ/c+MCW6jjcdqVwLuAqv9mCy5CWbJSqbXg
         Y57Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=1bNRYm61u3wzfZM74ZvYU9IkZ0YmO0e2GB7pf2XyzRw=;
        b=IBxexjju3HRtyu4qR34sldxZSKfZtPMBYE2fYw+xP6KQmV4c34IpD0clO6bb4n+/bX
         XVtnnI1TpqGWhIZTo0Ll2ULJcmE2X2XNG18NGaGLyS4e98lWMRGFjDqAOPwDn9PQLT38
         wWxiazUwya60k04l+UHFFN2mu0135JUQrEfzKpQeK+dCAxppwFvd7Uxr4qO9UaAn6asx
         tHvJwTwO4eyNYici11o3Qy7E+Gpss8HZ94RTo0M3ESgV23zmO9KR4pUBJtO3tWKMukRY
         Fy0U0UojFthLBEiieuIiQH8SIbnE39RHuPZB4y5Mv3EYr7j8dHUihwZy6BgldpkP1M4G
         xoEQ==
X-Gm-Message-State: AOAM533eMFKdAErrBoDgeQa1JP6ISNgsDeSpRZigmQOOw/yYH1PSxq6D
	V2oZDV+AxbGGdEb18AXO4xY9J/7j
X-Google-Smtp-Source: ABdhPJzQn2d37T0STfccpSxkLPAvQOiyIV6HLMDDYHV4+FokcOTIqM72ZUxvn7+TvarByyz7pcSOzw==
X-Received: by 2002:a63:6cc9:: with SMTP id h192mr5004307pgc.486.1643341126235;
        Thu, 27 Jan 2022 19:38:46 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
        by smtp.gmail.com with ESMTPSA id y191sm6913577pfb.114.2022.01.27.19.38.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jan 2022 19:38:45 -0800 (PST)
Message-ID: <cff79bec-6c8f-74e4-799f-cb9ae56b074e@linaro.org>
Date: Fri, 28 Jan 2022 14:38:40 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 14/14] hw/intc/arm_gicv3_its: Implement MOVI
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20220122182444.724087-1-peter.maydell@linaro.org>
 <20220122182444.724087-15-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220122182444.724087-15-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: QDMa8nN8jGZc

On 1/23/22 05:24, Peter Maydell wrote:
> Implement the ITS MOVI command. This command specifies a (physical) LPI
> by DeviceID and EventID and provides a new ICID for it. The ITS must
> find the interrupt translation table entry for the LPI, which will
> tell it the old ICID. It then moves the pending state of the LPI from
> the old redistributor to the new one and updates the ICID field in
> the translation table entry.
> 
> This is another GICv3 ITS command that we forgot to implement.  Linux
> does use this one, but only if the guest powers off one of its CPUs.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> All the "validate guest command argument, log and return if bad"
> logic feels very clunky here...
> ---
>   hw/intc/gicv3_internal.h   |  16 ++++
>   hw/intc/arm_gicv3_its.c    | 146 +++++++++++++++++++++++++++++++++++++
>   hw/intc/arm_gicv3_redist.c |  53 ++++++++++++++
>   3 files changed, 215 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
