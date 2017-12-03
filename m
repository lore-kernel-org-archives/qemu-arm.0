Received: by 10.223.159.74 with SMTP id f10csp677122wrg;
        Sun, 3 Dec 2017 08:04:42 -0800 (PST)
X-Received: by 10.159.204.146 with SMTP id t18mr8959654plo.237.1512317082526;
        Sun, 03 Dec 2017 08:04:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512317082; cv=none;
        d=google.com; s=arc-20160816;
        b=Zs8UfN22mcuM4WU7E+ANla/YCc2ePGmrDMiYgdfOqn3zZwXg96hYEaYXgvWEPjMfQ7
         070GAhHYJknHXI1S78rF1rIhj7eakfQ9bz65qkd+YrD2BgY+8S/4Ko/EkAtHtw2jXBre
         qLXdYO6FxK01xWdybkRP6QlGn8DY/J18mb1vvJsP/Dav1zm0myXKg2quwZfO4hKsoPjU
         B/Rlum3CiqK/CrDi1nsNZuGx4dtCMf+8fuCrjLlUj/T5Qq9fvU2iwbiTlwHgGiRGWUoK
         frVR+6R5OBJr8BTvfrUR1p+3uhjDRILjNQgYGCnnhxO9XzpSE1CqdjYkD9b4of4A1V2R
         o3Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=UvBFwXW1jDio+ZggvjNtEMce3gMR2ouiM6EUGIVoVDU=;
        b=QUX6OSQm0ebY/HtikGPZ8Vumaudpn0h4a+f2rXj3c4w1rDnZBNbLaZweChD+xmaHMo
         1Kw4pGGBNBeZ7AUs06lcZdjmM1gYV5C8OW3fkBBVwvLIWRJ55vNpkrKKXh2Il/rUS5Tc
         3uhQ5Gg+SjBx2lOLOMOGlcOKzFGAOo2B/WU68Jl0zmAu/X/2Zr6Ks0TznoTP9e9H+n29
         5xjlvRdC1H0yEqD0x4RDwZ21L40MtD8LHVSqdRsQnZm6H9lyH3I0GLM36JVEZCRWVPWR
         ppn/modEZs6VzRfLciB1ETRlOR0xXi/PbFHNSKHsULlK7s2EzLaAbCrazPnou3+v/Hk1
         bioQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZR0PvtZg;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q15sor2848075pgv.189.2017.12.03.08.04.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 03 Dec 2017 08:04:42 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZR0PvtZg;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UvBFwXW1jDio+ZggvjNtEMce3gMR2ouiM6EUGIVoVDU=;
        b=ZR0PvtZgem3xAq2g3pnSSXmC3zkXcTcfylPiMTRzwKclENSpZA+P5cFKlrIPb+TYxx
         rMjdqVyL0aoyQJYdV6xZGaUMqnCCuWLphCB5HRxhUKuYKchVYM2VhLE3inDyxTqMhM3m
         P8ASf9hQnwmFocDj42fdtzVIFdIfaWNayS02I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UvBFwXW1jDio+ZggvjNtEMce3gMR2ouiM6EUGIVoVDU=;
        b=IXfURP9zlJDjhvhVvIV6TVsPtiX22hpIsxk3MGIwujp+V3/5hNwlZiadJ0xFvUsbA7
         hfpC6rK//jb7g3m9b1VcqEO3YeqVPVjPTA2/CXXE3zVU6mmqEKPcFHPitldI1iLTnVlx
         9MD9hVB5LQPf1WzNDsm7F4CYlajE2l8GB9ye+jitSdn5nrLL/Ms+lgX2vIwqjLolvhO/
         Ll1mBcQRc5DAyW3IqTcJHcgtWc96QWTZpbV8NWhNE6TqM+uDaNNuP0qoxGNBCEZ1lwQq
         YEWkYuL++jC6mM3juNXaLdLW18yyuFgB+sGfGchNG475//rzMgAfkxyry53DtDseREkH
         lY8A==
X-Gm-Message-State: AJaThX4kAC8JSoTcZdfO0Q6AAxb5A9QcTm1zxNHSAbPtT1TO9qz0mUbw
	ruM3MU2obmsUX1AKJrvtCyKGDHVt8wtrwg==
X-Google-Smtp-Source: AGs4zMa+tcLHsLnGtio37YqxZ07Jtvp1av70DlrP4Bloi6LZXkV5cuS6Ke5DtDWeW1SNyz/h5AQWFQ==
X-Received: by 10.99.176.69 with SMTP id z5mr11951889pgo.131.1512317081721;
        Sun, 03 Dec 2017 08:04:41 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (97-126-111-33.tukw.qwest.net. [97.126.111.33])
        by smtp.gmail.com with ESMTPSA id r11sm17526697pgf.79.2017.12.03.08.04.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 03 Dec 2017 08:04:40 -0800 (PST)
Subject: Re: [PATCH 7/7] target/arm: Implement TT instruction
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <1512153879-5291-1-git-send-email-peter.maydell@linaro.org>
 <1512153879-5291-8-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b647f571-fffb-1f40-9bf4-74d1f97fc8f8@linaro.org>
Date: Sun, 3 Dec 2017 08:04:38 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1512153879-5291-8-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: CzsgtCjwjljh

On 12/01/2017 10:44 AM, Peter Maydell wrote:
> Implement the TT instruction which queries the security
> state and access permissions of a memory location.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.h    |   2 +
>  target/arm/helper.c    | 108 +++++++++++++++++++++++++++++++++++++++++++++++++
>  target/arm/translate.c |  29 ++++++++++++-
>  3 files changed, 138 insertions(+), 1 deletion(-)


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
