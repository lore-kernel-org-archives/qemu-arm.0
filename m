Received: by 10.28.71.27 with SMTP id u27csp11483wma;
        Thu, 8 Feb 2018 14:42:44 -0800 (PST)
X-Received: by 10.107.25.195 with SMTP id 186mr849801ioz.200.1518129764657;
        Thu, 08 Feb 2018 14:42:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518129764; cv=none;
        d=google.com; s=arc-20160816;
        b=X2JnDGPBYdiNt/vqw7Kjy+17gmhWOyShFXhWSjmyDfHMN3nCWFAnWrUGLFPa+Cf1f6
         93tGvZUfgWTdRFAspCbXEiTjY03T+BL9dFjT+M+OON0UrlBBG25ipM2BID9NuMy2qo+a
         CzBraUsblokz3VzRVnjlHNkRBfRVs363QDqEDEna3k8LKLxFPElOLVmawLT0fs4TGiWy
         WDZ47tsM+61ToSqVCgJuN+K+se5LJ07RFAt7PMX0CjZehgmuxEqHlhbQNuXeOffNw94L
         KZxOlLLE4eIobDzfHi8Pp8oZAjBfHoWSe4ziUlHDzrauhggvvmchygKOVi4bWdHvzJwD
         uYMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=JUaNyyy2oqec/Xd59D5QNI+8ipH/NcxcMaEszchztPc=;
        b=vv4PjzkVym02ks3abTiPc8jai3dX0ZYwgSK5SjEzKxFRbEWkp2geGxksc9nJQ5F2Vw
         44xIpZF4VtOpUkjzzXMCbfChNPzYesMSmKuloJKMwbN5t+0diRxy2Y3aRk1fLRPJ4pxY
         ElxrIurHJAU54LvdzRzo/5+baGrs7yG9Sak4xpYNp/nkP0hk1JhOyetJZ+5iGgaI9/0P
         QuX4QzZ9OC/Gbp4Q4PFA/mX+hNDseraxHSfhTmidDyeKZruXHRJCcNFjN837sOXKrq8L
         bJrIygElvA5EUZTl5/gcZsh4FUU9uWu42gfTleNbnibwQrQ76LnQ6sFIS6cUJDsikSLA
         2BeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jy/8qmMo;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id z198sor602096itb.85.2018.02.08.14.42.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 08 Feb 2018 14:42:44 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jy/8qmMo;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=JUaNyyy2oqec/Xd59D5QNI+8ipH/NcxcMaEszchztPc=;
        b=jy/8qmMoIidgayaWZRHbdLzlVGxWaclKxx5RAHO4WMSE1Y22gz9VPV1t/cOyQKLIQk
         1EPo5zrvN5Zb/7qJ2+oRS6CjQON5Bf/cLmq7A47HOvNeXLDJHvM3TTdfqFV6AeizM17u
         R6wRY15xRAIApzU/+Ac2GJwRkGo+aDJBsn+qQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JUaNyyy2oqec/Xd59D5QNI+8ipH/NcxcMaEszchztPc=;
        b=umXgTq4KJRNjHCx5KSbx/ZVNtx71ZEfXft0ADWPvscDV6VXjxSIXzQJo+nBDJTdFJR
         pXOW9wRSPEMRMlUQZBxCKHmju1U/JgfQV6tSFrflbuclwUX3wEDemPjeIOCTH70Nyqnu
         i18cBHgrpM09KNYcZ0RKbRGH7oRsqMfGOJu5Wsj/0T4w33HbxR1/QG5SWAw/HSu50LwZ
         Cm+4UlvxyJGWyY1lBmiQK5PATwPx1DcHPIJWAvdhx1ztAUqzCv7bNPzNUwYTB6+zYf02
         yQmpkV8WeVO2tfx67O1QkZLJ81PZqWkU11tDogU0D3k2BDcfyhWm24GVnEhbOGBAK6qj
         Fhhw==
X-Gm-Message-State: APf1xPCUzSibQvI6H+HtM7RgZhvLSsf/bnQ5hxCFznIc4ZwxOZQZ/K6c
	DwjE3SZLc1NPyHlyzl2GxQrRqy2KcUO5tQ==
X-Google-Smtp-Source: AH8x227a2vef2s4AVUMOz7Tb2o7goCPeJf9paxorIBY9vxkwOsV7ubJ3TRSyJqeKg8RRRsY021bPgQ==
X-Received: by 10.36.9.73 with SMTP id 70mr932879itm.133.1518129764295;
        Thu, 08 Feb 2018 14:42:44 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (174-21-6-47.tukw.qwest.net. [174.21.6.47])
        by smtp.gmail.com with ESMTPSA id h63sm769414ith.40.2018.02.08.14.42.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Feb 2018 14:42:43 -0800 (PST)
Subject: Re: [Qemu-devel] [PATCH v2 21/32] arm/translate-a64: add FP16
 SCVTF/UCVFT to simd_two_reg_misc_fp16
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20180208173157.24705-1-alex.bennee@linaro.org>
 <20180208173157.24705-22-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dbbc1aa9-079f-044b-0af6-08082730f3c2@linaro.org>
Date: Thu, 8 Feb 2018 14:42:41 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180208173157.24705-22-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: OBWp7oUhDBqg

On 02/08/2018 09:31 AM, Alex Bennée wrote:
> I've re-factored the handle_simd_intfp_conv helper to properly handle
> half-precision as well as call plain conversion helpers when we are
> not doing fixed point conversion.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  target/arm/helper.c        |   4 ++
>  target/arm/helper.h        |  10 ++++
>  target/arm/translate-a64.c | 121 +++++++++++++++++++++++++++++++++++----------
>  3 files changed, 108 insertions(+), 27 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
