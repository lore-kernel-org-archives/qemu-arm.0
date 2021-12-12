Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp3410615lfk;
        Sun, 12 Dec 2021 10:48:32 -0800 (PST)
X-Received: by 2002:a17:902:d490:b0:141:fd0f:5316 with SMTP id c16-20020a170902d49000b00141fd0f5316mr90220148plg.14.1639334912695;
        Sun, 12 Dec 2021 10:48:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639334912; cv=none;
        d=google.com; s=arc-20160816;
        b=ChSt8SjNWDMpYAR0EBMKgSLXO5PXohFAV98U1LGql3rAZgDXVzmjeAgim0yEopX6ts
         GM/5JD869UJYAzKfxkXf0qZcoGgjNjNvZrYmf5e5x9Axs801wikdvsEKWdGCUPUD81Qj
         bEX+GwnqaeU4AWhOUrXPLgXM1KS60yar3UxmI92ZeyJZ4PLhpokKI9OXqiT+Mtx7FHyJ
         +8/h+1hi0QQn7+YhaVG54lXsYNv7PaAN/h/cW3TDqzyv62ZPub0Lq7uO3O0Fb1OZ1ueI
         Q6ww8EVwpFS0WcDeoV4vqCWs1AcqB8Lgq8bvEMvpvw/zhXx8LNfssWAzYSldKwisy5Q5
         JGJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=868gtSq+z5opgWOFdZHCTfBALctYxqDxSS/1rU9Jbr0=;
        b=l3DJsA4civqxmGzNbgVCRdcCxuIx+3GURXr4kHeX3xMyszJcn/+xpgeMicHfBTa1mv
         nO6JFuB86Hm0SKUmuCrwB1K/I1Y/ceZKf5xfK+nU7irmp/OMKtaLmtAl2vgPHdbZozp2
         Etf6unc5xwAfJSvhmwk5/7Al4w3eWUGMTwF3IW0NLdknviIKTgu58sAuShRhJyzedCk3
         pO1lzjQ074gTIxT3hm4uEUvs6IYhXSOIXznBe2pb03sQq9CKlhQcPknCVFAYZcuAd66D
         jdYnS3EGO85Gc06uMT/ZatHctjoyneoUzFtCmt+QFLC7hEvCaXREVWfA4hm1hSV4YyOf
         p3NQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="fK/mE6UO";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id oc9sor2029603pjb.3.2021.12.12.10.48.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 12 Dec 2021 10:48:32 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="fK/mE6UO";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=868gtSq+z5opgWOFdZHCTfBALctYxqDxSS/1rU9Jbr0=;
        b=fK/mE6UOObPuYjRNFW6X24SBHIH7jch5aotcUUJQVBqD90asjgJ3RdnAwtBoRPWs9x
         QAb1in5UG4zGoRevwQ2kScjuy61sSdSMsIZ1IVGqwVW0eKprp6P8ZYknBDsYmSwSynQe
         gwxdvZwOrheHW8DzPp0/z3572GwITVyuYrg4kS0TCluphzGcjTNbBCHJfISpJ01IHZ7b
         a8Y/W4fuxgRWe1uyHABybZdHNMVJKSxAypktoz0knWq3NYDubALigohtiI3WB6K/LleW
         5Tup5xnjrzXKrl84YzL93CgNpoAmMA3RgExWk1b9LuvZriMVpBOPi0+Egs3Vo40y9Hq8
         IuKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=868gtSq+z5opgWOFdZHCTfBALctYxqDxSS/1rU9Jbr0=;
        b=mMLAgBNZSU6d05Tsgmmakb6Yu9qAALQ3Hzag3+yZ61BtMyv4lvuWY0KuA/KfGrrZQt
         a8oZFqqvKOp+GrmUTp1NKjvWYLlQh1d9X9squ4fAVFUJJzEMO6J0rqVlzbgtFP/QW15E
         c94+hzS8Y8jdJK/wu/3fx867MmAwlRHM7l2D0/p4mTBmEII3syF/G+RctgFhjZjMJRDg
         yHC2rzcw18WJUA+EJkbwziy9Sm7jAhQUBpoMmM9qzoRuUKlbfHO98RGqMs757eOEzySE
         EDatOpTDaVILiyBX1JVqVsIiajFwERkz0SKRsCg1qYOUJaRboafxWGjjptOKk0TegsZs
         Ag0w==
X-Gm-Message-State: AOAM531i2GT60tE7lM9t+dTcj9C4uCyFRxDwTzgldlDpU4q+JljFN1VT
	MDX8qzxPV7EcKdee8uKILCsshPJ7McT+uj3c
X-Google-Smtp-Source: ABdhPJzoE1zL7jEnwlROegqt02F3y7Ouj8oNBEnnAVu14QLIpOOdvSby2tfdJpG5WyZ2yqcSSj32YA==
X-Received: by 2002:a17:90b:4b89:: with SMTP id lr9mr38664562pjb.49.1639334912216;
        Sun, 12 Dec 2021 10:48:32 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
        by smtp.gmail.com with ESMTPSA id k5sm3847551pgm.94.2021.12.12.10.48.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Dec 2021 10:48:31 -0800 (PST)
Subject: Re: [PATCH 09/26] hw/intc/arm_gicv3_its: Correct handling of MAPI
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-10-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <61dceef8-42e8-22f0-fcfc-b7290d56d540@linaro.org>
Date: Sun, 12 Dec 2021 10:48:30 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211211191135.1764649-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: txAhUsZdFdFO

On 12/11/21 11:11 AM, Peter Maydell wrote:
> The MAPI command takes arguments DeviceID, EventID, ICID, and is
> defined to be equivalent to MAPTI DeviceID, EventID, EventID, ICID.
> (That is, where MAPTI takes an explicit pINTID, MAPI uses the EventID
> as the pINTID.)
> 
> We didn't quite get this right.  In particular the error checks for
> MAPI include "EventID does not specify a valid LPI identifier", which
> is the same as MAPTI's error check for the pINTID field.  QEMU's code
> skips the pINTID error check entirely in the MAPI case.
> 
> We can fix this bug and in the process simplify the code by switching
> to the obvious implementation of setting pIntid = eventid early
> if ignore_pInt is true.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 18 +++++++-----------
>   1 file changed, 7 insertions(+), 11 deletions(-)


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
