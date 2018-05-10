Received: by 10.28.4.212 with SMTP id 203csp1149143wme;
        Thu, 10 May 2018 08:20:40 -0700 (PDT)
X-Received: by 2002:a17:902:7b86:: with SMTP id w6-v6mr1839123pll.183.1525965640273;
        Thu, 10 May 2018 08:20:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525965640; cv=none;
        d=google.com; s=arc-20160816;
        b=q2CD9Wcm/YIMOCp004uEszk/SrUpD21ocohXYsGuEaUtmfA+Xbvg+Gzm3YHot8aKMR
         aUF0AgCOoX/lP/9QwBE++xTFEqXR6CWYBro/KNv/jZF69J7xP8UDbH15naC/5+Eimn5C
         HROJLxFCTELM4wVoslJFS5u0bdNw0tCATHiFTP2j0yYlwgtsAQTBB6moGCm7O4dBs5Ry
         P+F4d5hIz5eWmP0940QN6ZAIoizCxfOjjN1eDX1lN/cxXDRyYE9Av4TUsNQhxgvAAoqy
         ntjpAH59Sch6V8a8zvZW9wiK6AJ6mbz8mXCMiFQQbHSZvWbyHEnfhzcKgFBjeYGrMHct
         xdew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=H/XYSFYE8458oVdJRzulH3HeL5eiWwBhFeg+l26xjNg=;
        b=bHFHjurFJtBzYqnaWksG1ng4CKLoBteIRJuuoNMxWbh8YRyeLiHsb1Glh+LdLCWpCv
         VzRqDOkfr6hDdJvHEmx+IcgO1Voi9VSZdyLxgjosNu5IjPozHXg30x3+/tlE5bYr9S+y
         Y9+TlfhQ2yedd2aHzNnhbxO3nsPeyPrcCCg4jJzINSzP3qeUBiMcKWoCpVMbwX/cxDEO
         xCYCeGYr2xeGK2z+uSvSN9AlrnFDEksXpq8Ulue7wWU60p6xN6l+rpd4whWQqnLjWkk4
         Y6KUA7kc/7ViIRJN7qGPdAc0EHRTPMkBPGG8rIh1zN9hAHqscv2NjZt+5wnQntYv1XNB
         zvLw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I+25HKM3;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id e1-v6sor384986pld.99.2018.05.10.08.20.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 10 May 2018 08:20:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I+25HKM3;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=H/XYSFYE8458oVdJRzulH3HeL5eiWwBhFeg+l26xjNg=;
        b=I+25HKM3wyyF9s6M5lggBE6d6zN/N2KBJtB/yXy4+omDJTFi1xXSK5f3iFB4jp06xR
         XW1eRe/AuBtjuHY+58rIUeB1P6Nk4ch708MfGzL/2bX8QIDt8JbP0O4pt4GRGlxq5Uql
         0CwlT+rX4ugtHC82Rm9jcD1KAPbnmcLA0FtOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=H/XYSFYE8458oVdJRzulH3HeL5eiWwBhFeg+l26xjNg=;
        b=LHlAdwTcD3n0AFJ49O87zkwbvrKPoW1990FAy2E8LCYcvQKEO1BSNBFEAHk5kLo+iD
         Wlb0d8DMitkI3J5jmpSZHseTUDYtNDscRI+URVWuyv2BboU/wxq7Szp+56sfPyHs1ItC
         XV7yDQmazd139D4XeJpopMg62/MrRe3YGbrQYFCX1tPVY1zZ8rko/PnAYzbYHAP9GZOU
         bHYq9RnbBogGgRrUiP5WX5l2HIqnlq6uw16iWXDBLU50e6P0ojpaRX5vg6MMf9JwUSd5
         R7vSueo30lFlSGDb/jbTd3VNRG8nepUr3xltUAja2DqCvER/dQM/44Z93Z65s6LgAS94
         6y5Q==
X-Gm-Message-State: ALKqPweXPf3+7tPTsPUaRcqcDGAzq4KYLHrmVBXroH9J4OxD6P6jrKve
	Iyjm1HtfCKbUWN76RbWeWCQTKHFW
X-Google-Smtp-Source: AB8JxZq5usr/xHk7OwDnpg7rxgSdb/HebboiYAkDR8XQwMSRhetr404N0O0cZGepLm1tOaea95CbWg==
X-Received: by 2002:a17:902:781:: with SMTP id 1-v6mr1818985plj.150.1525965639582;
        Thu, 10 May 2018 08:20:39 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net. [97.113.2.170])
        by smtp.gmail.com with ESMTPSA id x3-v6sm3307914pff.87.2018.05.10.08.20.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 May 2018 08:20:38 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH] fpu/softfloat: Don't set Invalid for
 float-to-int(MAXINT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, patches@linaro.org
References: <20180510140141.12120-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <72c275da-00d0-9d45-9d3b-2a724e734493@linaro.org>
Date: Thu, 10 May 2018 08:20:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180510140141.12120-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: LGfykWSF3sdS

On 05/10/2018 07:01 AM, Peter Maydell wrote:
> In float-to-integer conversion, if the floating point input
> converts exactly to the largest or smallest integer that
> fits in to the result type, this is not an overflow.
> In this situation we were producing the correct result value,
> but were incorrectly setting the Invalid flag.
> For example for Arm A64, "FCVTAS w0, d0" on an input of
> 0x41dfffffffc00000 should produce 0x7fffffff and set no flags.
> 
> Fix the boundary case to take the right half of the if()
> statements.
> 
> This fixes a regression from 2.11 introduced by the softfloat
> refactoring.
> 
> Cc: qemu-stable@nongnu.org
> Fixes: ab52f973a50
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  fpu/softfloat.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
