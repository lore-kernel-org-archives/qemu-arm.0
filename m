Received: by 10.28.71.27 with SMTP id u27csp1190590wma;
        Fri, 23 Feb 2018 15:51:47 -0800 (PST)
X-Received: by 10.98.61.73 with SMTP id k70mr3366442pfa.10.1519429907865;
        Fri, 23 Feb 2018 15:51:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519429907; cv=none;
        d=google.com; s=arc-20160816;
        b=T1ofMdrUDBN1EAFiuW2P5xWz2FNvlhtYbXxMzPFXy41andrh800QO+LdRZjcGmULCn
         l7P/7NYoxUU+XLBeUuZYIIYd1pBvr93qc+Iik6XvPoRXeqTT/m/2aME1zHxqD2F0xJou
         3Ni8ksWMyp6hU+zsYTHr5yu5Fz9lgxX/i4IrQTTa3YMUSCnYfMOl8S4fkgW1FAOGqgpi
         0lVqcEG91QIQZGciuJeFltzpwRURFyixHyeqelA+MDSK68mh50UWuArS2WmNgws0z10s
         fApa3ge7+QCuAAzH1SD1ZB9plHyMrBS1af9gYty6l1o9Y72tWRYrUN/lqL1LmcTekhSr
         ZA6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=sFaZk5qj4RxxHIfbOYXRfCYxU4mHILjNENCuTGLQVls=;
        b=LOJaIEcUdrxwcGZLi5o7VrXpOI/Qp7jVEB7P8ZVuHdnWMaAKqhZIQEgL27ln5lp6fl
         ZJDwjfMX9W5YWsoxxjaES5V/zlqAt+BOoNVVBbOJB+AEtVwlQMy7AudMcSUVhpn0Oj7k
         aDXR3YlQ9zdfyxF3hupLFFyIZna3Nxlh3/aTdWG/IHfx4pqLa1tXXQUO6l8fdU7cIhFo
         wczEesYU1KCS3wbZoyImJNl0+sYy+4ElJVcKSheG+ZAmMWsHUt0x2ytRhS0Og004NZS4
         r1Zf4VzqOvKGUpGxc9+cXDZQMPckF+8wkdxqQnx6k9rkWVNHADQAJT+MFrIGhwKqKiWt
         vZxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GNun6Tcs;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k124sor795272pgc.238.2018.02.23.15.51.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 23 Feb 2018 15:51:47 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GNun6Tcs;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=sFaZk5qj4RxxHIfbOYXRfCYxU4mHILjNENCuTGLQVls=;
        b=GNun6TcsViVTDTTWCCdkoVid4CLNvhptTob86T1RgRI/KLuxbhIyQSr0u1LkgeFskX
         TRmmPYiuACflRGrRnAhrns6eD804QycoKlZjiRY9d9ey1Nok8Cx4alr1rO1dQ0Di9geb
         gbhlgtKw33PvksJQQkCUKEY3hdZxmvVa2sAyU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sFaZk5qj4RxxHIfbOYXRfCYxU4mHILjNENCuTGLQVls=;
        b=mytQ5vOAlKm5TnROd+qZhBk0Df9+YyU7BUFTurtp86QJj8+0xlkXibe/zygojHHmdd
         NrQ9hKBbwlvCaoKNdrd6HVJd/EDnnHBpiZ9FWHmdmz6q4HHY+VWsZ2xLsjweIxnwW+Dr
         b5ecGYFk4z+O+i7ov6mh8lEnoDFT+32cgrbfZKfFLUd3LkVWbMwulOPd9tfHBGcXwwSC
         ZZWpi9YbMPfP7t5JSyV4/z5hTfSESM/ao+wDi+3OEjTK2RCpP3IqXehldk+ctcVVS2XG
         3jKm8cIUsSt++7VQ7Jz3qvv/NDewtk5Jiw0Du7iWPuq8kMKO5dnFr6xSrWgWjpKcRXcY
         U1eQ==
X-Gm-Message-State: APf1xPCAYMLcqvpM4S0ugg+jDH9I/kIcUuUHYMh3KIJr8vyl/4dMDaJt
	pUFyBsfxEp0/gHuLr5R/j4GiZa1I
X-Google-Smtp-Source: AH8x225fF8Edj6dB33sGUBGIgz6UokJT/kfbmNi2DsnNDnQXNM8Yk+Zucth8u0SbW3t5R35ETfW7Ew==
X-Received: by 10.101.66.196 with SMTP id l4mr2675376pgp.66.1519429907358;
        Fri, 23 Feb 2018 15:51:47 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net. [97.113.169.147])
        by smtp.gmail.com with ESMTPSA id p79sm6268696pfi.115.2018.02.23.15.51.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Feb 2018 15:51:46 -0800 (PST)
Subject: Re: [PATCH v3 04/31] target/arm/cpu.h: add additional float_status
 flags
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20180223153636.29809-1-alex.bennee@linaro.org>
 <20180223153636.29809-5-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <93ed5c75-c704-2d47-c1b8-699f419ab2b3@linaro.org>
Date: Fri, 23 Feb 2018 15:51:43 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180223153636.29809-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 4jMaC8qXY/bF

On 02/23/2018 07:36 AM, Alex Bennée wrote:
> Half-precision flush to zero behaviour is controlled by a separate
> FZ16 bit in the FPCR. To handle this we pass a pointer to
> fp_status_fp16 when working on half-precision operations. The value of
> the presented FPCR is calculated from an amalgam of the two when read.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v3
>   - add FPCR_[FZ/FZ16/DN] defines to cpu.h and use
>   - only propagate flag status to fp_status as they are ored later
>   - ensure dnan and round mode propagated to fp_status_fp16
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
