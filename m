Received: by 10.223.159.74 with SMTP id f10csp633507wrg;
        Sun, 3 Dec 2017 07:09:31 -0800 (PST)
X-Received: by 10.99.117.83 with SMTP id f19mr11379896pgn.225.1512313771546;
        Sun, 03 Dec 2017 07:09:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512313771; cv=none;
        d=google.com; s=arc-20160816;
        b=PmcMXz24q1zuFwwlpInv+KksZMxZWX9aP2419ZFfv3x2REtuYza1RLk4zjhQs7TnAB
         FLhpM/P2SajyQDk743PRa9sDGnFlMVBmo9ZwEp6iPCXMTk7Odoc5+U22z1RCXQRqLHNz
         3DvH2V7LVq4DrZhogObtbl8Cnj1AKtOCgmIjjn1Zh7h2J69KbbGSvxYUaYpWopMwlj6M
         kwGNnCS9CPjVBaL2rqaEGmBTzsDBeozIax5rcERO4S/jAPBKEMasoHk4b+6ESaNexht0
         Z4dTS5OnjEYz7n0tuhGHqWO4fXhIqHuw9twC/JYPyqQwLVR+3IfMJUz8u8onR2PRJ42X
         jCJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=ie0xv4etB7QY5/P7M5lhpECkBsLQRog0kL18TMM6K6Y=;
        b=CAIeZ+RWzJBoT8GvV63ts+ATNEqSyt+ewjUqxWzI21dyvWKvdPy52NCfPV01iWKk26
         CRosxs71cLrTPATGwBjHMAEpE3qR2iJotnSWmXiqBAeYImGvwL2Oed7UXRlhIpboAx0v
         M1uTfi+ARCRhI0sdkQgQiTM714OK4Xf556yTcESipqKB120Gx/yqjcLPwqvHYOPe8CcD
         SEhd2k66fG9b7qWKN4+Wnv2SdmT2SHMiH29hAI+ZBUskgQANyZk9//jGGYJ0jhvqk40n
         HSuwLDcgnC4YfS8Y14sHGWPLWIqqZ1FW8Ne5gN0J+D//IUc+yEYLNGOU7tEIszjU0Krh
         x3GA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ez6/N1KK;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id u10sor4010229plu.22.2017.12.03.07.09.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 03 Dec 2017 07:09:31 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ez6/N1KK;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ie0xv4etB7QY5/P7M5lhpECkBsLQRog0kL18TMM6K6Y=;
        b=Ez6/N1KKYl8jd0qlRXerxrJOhn59zEvVum3YBkaletcUw9WObvm8KTljbMtotEn/+I
         FF4ekwDgrFe7l/JlvbtE3sFHzOngKhKPGyj6E52+C3BGlWJ+lB3PuPtcNp3+rj8dU3xZ
         dA/JwmefBcgu/57WyVlQV+fjIbQwTFSuSDwbs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ie0xv4etB7QY5/P7M5lhpECkBsLQRog0kL18TMM6K6Y=;
        b=eNM+UFWpkADlmL2/GGyOKrYatjOt7lM07kTjv6ZErr6wBtBAy8Gj7qv2FRsyevmfAO
         ZwoRKQ4rYOBaxmh/H0Sia7i9cwu31ttFSXOV20WEauGsu0iXKS/tTLk+UTSNzOW7MJro
         Ievo7E+MbRkxvPM029JINh3O6CSRojc1D5AeGZmlFAiiBte5pgxazVXcwhT6WDIDzTsa
         Azk2/CCJjif7ltwXzlomjN6ZrrdAMKqIhJIGPcXSqM4al7ypu5ACVYhdTxiN9NPnzxQM
         VKgMbLZuE0JqnL4cMkv197gMuXUS2yAufohaGrUob1L5SQ5sM4r7bl8ZbSceTm+Lx7FF
         5Qyw==
X-Gm-Message-State: AJaThX68eOk1V39YHhv10EiupSE0HpowrwxK51mxlCl1boM4CNQVSfnm
	r81vlDt8f15CwIsKVh8X62TneBzMsqJWwA==
X-Google-Smtp-Source: AGs4zMbTbyunS/Ey1sjMOK/N3z+rnLugaT6/TYhqgsybR9NrFRp7ug9wNPc823pVudXlTiGqYSdwbQ==
X-Received: by 10.159.254.4 with SMTP id r4mr11953034pls.11.1512313770713;
        Sun, 03 Dec 2017 07:09:30 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (97-126-111-33.tukw.qwest.net. [97.126.111.33])
        by smtp.gmail.com with ESMTPSA id q7sm19787057pgf.26.2017.12.03.07.09.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 03 Dec 2017 07:09:29 -0800 (PST)
Subject: Re: [PATCH 4/7] target/arm: Split M profile MNegPri mmu index into
 user and priv
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <1512153879-5291-1-git-send-email-peter.maydell@linaro.org>
 <1512153879-5291-5-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <609844a3-c004-6268-5174-557096d9e33c@linaro.org>
Date: Sun, 3 Dec 2017 07:09:27 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1512153879-5291-5-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: 8F2PJzljyM+P

On 12/01/2017 10:44 AM, Peter Maydell wrote:
> For M profile, we currently have an mmu index MNegPri for
> "requested execution priority negative". This fails to
> distinguish "requested execution priority negative, privileged"
> from "requested execution priority negative, usermode", but
> the two can return different results for MPU lookups. Fix this
> by splitting MNegPri into MNegPriPriv and MNegPriUser, and
> similarly for the Secure equivalent MSNegPri.
> 
> This takes us from 6 M profile MMU modes to 8, which means
> we need to bump NB_MMU_MODES; this is OK since the point
> where we are forced to reduce TLB sizes is 9 MMU modes.
> 
> (It would in theory be possible to stick with 6 MMU indexes:
> {mpu-disabled,user,privileged} x {secure,nonsecure} since
> in the MPU-disabled case the result of an MPU lookup is
> always the same for both user and privileged code. However
> we would then need to rework the TB flags handling to put
> user/priv into the TB flags separately from the mmuidx.
> Adding an extra couple of mmu indexes is simpler.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h       | 49 ++++++++++++++++++++++++++++---------------------
>  target/arm/internals.h |  6 ++++--
>  target/arm/helper.c    | 14 ++++++++++----
>  target/arm/translate.c |  8 ++++++--
>  4 files changed, 48 insertions(+), 29 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
