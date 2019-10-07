Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp3849185wrm;
        Mon, 7 Oct 2019 07:13:14 -0700 (PDT)
X-Received: by 2002:a25:3405:: with SMTP id b5mr11481471yba.13.1570457594452;
        Mon, 07 Oct 2019 07:13:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570457594; cv=none;
        d=google.com; s=arc-20160816;
        b=NIoUbQoSlpTY2GtvjiX7oox2bmqXr+UKk9eUlI7EwWQ80RYATH2lgXQfGs/rGemSMm
         EGzUT5AvipeEg+qeNcJONkJXGrPhS6i+SfxooaM/T/uAO9DlJUatIBxtQWJNEdY+sWn2
         LFlCYGK1ZPGCe2KJ8UiQ6PPHVP64684H4KAM5CpEVzrmPdU4ByFbdP2HqgApesJqHtAY
         FopepFhrhV/4Z0Dx456rhbADPyLhgI2rRrE/90ub48iDkVh4yaYFZqqTgKm4Tk0oaVmO
         PlDfwBv/SouQxqJJ5GgTJtJO1bhQ5Wo1s5tRNQP/ggxpQXOoq6G+MSXZWnEiwd/hKdV0
         zs/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=GxEeeercCVRTVZXh0L1Q3s3YB+NxLMfba7vvV5P4ynI=;
        b=LivNHvuVggJi5Y3fRzfToPAvHxK2gf0ZKq958yDtklmRAS0f1z/X1Nc52FWVySzV6K
         cTzdmDPLC7ktvKfFAT3oMVTISa9bag4lskZD0eF8u7rLwLmFM2kN0X8qJhNjJQT0FBO5
         C2k5nQH+2zoZrdtS2dzmDWSRHgIYq1SCGaSVnlLrC5XJaLW/Lc0jytSRUbQ1i7+mEk0g
         wGEX1LKQIxOcn7o9sn1Jhh1p0BeFMqDsfDgPdH8Fn20JbrPDR6NTFbKs4FSAU56n5Z1P
         t3hxzLSHb49x7jvVV30qp5gNnth1P0LXeYE+ygvvtuXAPpJxUjblR79BcbHcjM3BXWRO
         b83w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MybxXpBr;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 70sor8441876ywe.115.2019.10.07.07.13.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 07 Oct 2019 07:13:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MybxXpBr;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GxEeeercCVRTVZXh0L1Q3s3YB+NxLMfba7vvV5P4ynI=;
        b=MybxXpBrUsrhJpoGfyqUuV2XGa1ie71ywSbEAwieJfHUsPFMJgndseCjkD7T2YwJx2
         uqu2lJ9nKpNK2hj9XFPrnS/j5424yqEK2lTO8etBpciAWrbLX04H43Ky11fSBjFamErK
         9C1Tb5Ci3AXATugXcDcbJ2HmpML8gsrCTuvIkbCFf3/L8SiDmv18/diXx4nNvwh4HOuA
         xp7bydBNId8r+EjcBssbnSh42kLP9ScPJUY8j9gPcu0X5caOvjqyKKYdPy9C83Kz/HZB
         /xZQHPujCLUSKMk3+4aR5G70M6AdwX4Qoavhi1o7OZtSetN8Zhaq9F8yDxabvSPrF+fL
         XBbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GxEeeercCVRTVZXh0L1Q3s3YB+NxLMfba7vvV5P4ynI=;
        b=Gwyq1UwlEnwieP2Ccga3iwxUvFk9crMrHkSaCGlShKzpjsfJO3aoJ78mWyg//xfKyl
         HNVF2KCeyv5yIwHwhKk26OTds6UeEKsOkMo8/IvScWSTCV2k0yBSOlKbxrGbc9U0niYa
         lXqQR5k13KNRtnZCxqu3+51jU1qgY5lkecaozncKJ9zk1/CBTm3MyfcLU9wVKi34LrGd
         3fCDriH9tagNJB68aOfGHpXTa/1qz/KC1GTcwmWM5EaXRLl/ipi02u63eIBIKw+ctDx7
         mCjt1EVAYgb2mG/krZZ4/wic4TcUvjGqM2WlxrChauiBZYq2jl0adF7uLL8h1y8Rp206
         +dTw==
X-Gm-Message-State: APjAAAU7oCl8vtp6PKrOJpoRbHBvnR5R2s4BXaKLdZx3HbzDcMu3RaeL
	Ca1O8+giReL2qAPPBWOtBwZ0ZkrZiHihww==
X-Google-Smtp-Source: APXvYqxg3nXKlElmebUnG4AP7/ZhYYWQ+cKHMkERpgLzE+UVnTNMytWvUnpgmZVqX0gcHnobvauCiQ==
X-Received: by 2002:a81:7703:: with SMTP id s3mr19454673ywc.382.1570457593665;
        Mon, 07 Oct 2019 07:13:13 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.44] (67.216.144.16.pool.hargray.net. [67.216.144.16])
        by smtp.gmail.com with ESMTPSA id y11sm3923613ywd.84.2019.10.07.07.13.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Oct 2019 07:13:13 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v2 06/15] target/arm/arm-semi: Use
 set_swi_errno() in gdbstub callback functions
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20190916141544.17540-1-peter.maydell@linaro.org>
 <20190916141544.17540-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <9015f172-7e7b-e60d-e273-c4d3cb4e21ff@linaro.org>
Date: Mon, 7 Oct 2019 10:13:11 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190916141544.17540-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: HSGUI6oOIMqE

On 9/16/19 7:15 AM, Peter Maydell wrote:
> When we are routing semihosting operations through the gdbstub, the
> work of sorting out the return value and setting errno if necessary
> is done by callback functions which are invoked by the gdbstub code.
> Clean up some ifdeffery in those functions by having them call
> set_swi_errno() to set the semihosting errno.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/arm-semi.c | 27 ++++++---------------------
>  1 file changed, 6 insertions(+), 21 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
