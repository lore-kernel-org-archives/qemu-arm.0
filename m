Received: by 10.223.188.70 with SMTP id a6csp4786998wrh;
        Mon, 28 Aug 2017 10:42:48 -0700 (PDT)
X-Received: by 10.107.157.78 with SMTP id g75mr1348946ioe.190.1503942168792;
        Mon, 28 Aug 2017 10:42:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503942168; cv=none;
        d=google.com; s=arc-20160816;
        b=n5JPnA3ZpsTGFyoMcN/o/aBzTciHnguzmnvUfPhcubzAgaK5DI9z7epmRuzxL00heQ
         yAh96163gTRTa9UZL7wHpqNIAuylN358HfIQ79ahKx2ekshioJVMS2WP6jtRrEvR5R1J
         8BrHT1i4r4M/9mn9Srvg5SeEufL0LI7Q4+sGwZYfg2ioxzKPMb5W5rdgDaMDlCDSRY6A
         8HYyPm8XAKefZ+UTp9s+AlKGCCNlsFJ9lSWDOnfbaroHtXjxA5J9ROiucXuQ2oM8PVh1
         4U+UaZxBRi1idEt32f6dbMgsg35684oTCZAPH3pM01Edq4w4/G7r7pmS/Cm7D5oRROh3
         eXFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=7qwJNpqkwm1Rye4DpAHu3F1U2tZ9LXf4PsTtVkgibWI=;
        b=jQ6b70d4hv+nLR9oLVxeXXWn6jOC2EE7bt+/W4X9G+OtkNPhgrZhPWB/MyxzajsanD
         7xLVg3S+MAhVyhs9MATIS85oH7jSUmsZxSgMaYG5EKQ0e464plZQWDTG0B6jnDUFjavE
         7as3NZ5hlxIZlM/Oqb8Y/IHs4T5sOiZpi5Xsagl1m8ll1aTssGxdpQIbIq3mdVrKzxnP
         TvfqOaVOPBEfY0pZeYgFVyEUgIF0ZQicuMAY7K7aT2CUC7JKD4vXIQwAlbsEdE6it6KH
         MlYdzkCad5FxNIU99ZkGh9pPvRy3AvaA/XWW5+IM2ZBUEuTmm7eV7MwqncP9T6zS0Pdn
         eN/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XqdW22Xf;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 15sor407854itg.82.2017.08.28.10.42.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 28 Aug 2017 10:42:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XqdW22Xf;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7qwJNpqkwm1Rye4DpAHu3F1U2tZ9LXf4PsTtVkgibWI=;
        b=XqdW22XfF/ojzg86PSIm+J1wkQkIl2wf3h8I+llbCHTiQ6/hC8esqhQz21g2Qp2kq/
         IbawlfQZYJoETy6UwJMOTnP8Tnq5DE+Q4+/T+3xG/KaLUNCR4zCULVGUMvdrxNgXwWFD
         WQbSLKjHDZ8C37pyQqKSFc9QzHnM2vKmUS5LU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7qwJNpqkwm1Rye4DpAHu3F1U2tZ9LXf4PsTtVkgibWI=;
        b=CUnO+YCbnPuEpj/swuxOAuTskG0rVzjMFKhIaTeeY3Emkcl1a/v62PEyoGrQA2Pc84
         SceOtjybxCb2kT2gDZ5Y9j4lzs6kc/Vn2U3F0+Id0IfgnDnUoiK2C8vDogWsMgq1GI4o
         uvx16aPfHMFhaC3OkF0XXrxmnuHH+CHTTNhDqQDP2LNEFdG7IlGkoF2WiLQ/wCOpSHa/
         ZPybWMY2xBhs3tiqEWwauNHlGZZIRDJ/YgDzkfY0U4EfggjVDGDWnrNSZIZz4BWTd+XS
         ggecvC+SF7jwjSrwj6w0xb+rvMuNxTccztGoWcKFrRfGaO/e9dX50psWsoKqSLNbwxc1
         z4nA==
X-Gm-Message-State: AHYfb5iXaNv3c9t64FIjdjBLn0hUraRXwujWzebXjADFzRnsbfJDPCmT
	AGwDyPVubKeofMeT07wQG4IJ
X-Received: by 10.36.115.70 with SMTP id y67mr1307280itb.1.1503942168478;
        Mon, 28 Aug 2017 10:42:48 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from bigtime.twiddle.net ([172.56.42.6])
        by smtp.gmail.com with ESMTPSA id e97sm404574ioi.37.2017.08.28.10.42.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Aug 2017 10:42:47 -0700 (PDT)
Subject: Re: [PATCH 1/3] target/arm: Remove stale comment
To: Pranith Kumar <bobby.prani@gmail.com>, alex.bennee@linaro.org,
 Peter Maydell <peter.maydell@linaro.org>, "open list:ARM"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Cc: pbonzini@redhat.com
References: <20170828035327.17146-1-bobby.prani@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <367db2c6-86dc-288e-c020-80d99a755f51@linaro.org>
Date: Mon, 28 Aug 2017 10:42:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170828035327.17146-1-bobby.prani@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: dRugNIbp5huc

On 08/27/2017 08:53 PM, Pranith Kumar wrote:
> Update the comment which is not true since MTTCG.
> 
> Signed-off-by: Pranith Kumar <bobby.prani@gmail.com>
> ---
>  target/arm/translate-a64.c | 4 ----
>  1 file changed, 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
