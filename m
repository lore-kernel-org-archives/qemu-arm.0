Received: by 10.28.71.27 with SMTP id u27csp1236696wma;
        Fri, 23 Feb 2018 16:58:58 -0800 (PST)
X-Received: by 10.98.253.17 with SMTP id p17mr3448554pfh.105.1519433938407;
        Fri, 23 Feb 2018 16:58:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519433938; cv=none;
        d=google.com; s=arc-20160816;
        b=rPdgNWjH0jxdy/hrgqRQU5nNuKXzRKzViSrm2LjlpTMhiX8QCraeOCXQDNFFaYBuAq
         9Bov+5jf6OIEJSfrHTybQstG7H7luDBtX4Yu839ZyvuMzcm1QPZ3JBhWpNOV0CfQB2Pw
         0heb5wPKikiNXwnZN6cat7rcPThu2XtL6Inwk5OGxHMFGlMo8VTMgW41ftII33MVPMiT
         Yn/k/+7JmmXOf/QHI6aV5mjrPbS3/YjnGRFRROZpEiQsGU1drRGnfxs7Pkc8LjWNFXCK
         TcO4K0s6XthOCiCfftVWYGPUpzpIIG01IcxQTvOqhGhyvB11zJsik7Ny2YDpM+NLuI8K
         D7xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=NuTagIE4jY0bCTp8Ha5fNEJ1O/r5UpMA5fSlV5stR1A=;
        b=bfUiTuJQjLWWMBD1s0mBtE9mwLJNepcziVj4TOCuxMEuXX6jNPvYuEGVT+EB/8H1lF
         NimmY56k2PP1pE10MkkNyVo0qVpEo8FMQXm+5Ybr/4ysQpBRQ3V7XYy+Hmkt7u3gYkff
         +EmHxKFmi1uExkyQ9wB8DIfXSq76p/oaMKODjD4qV+xKBQUos2R3RM3EZdGGlyz/pDFR
         O1RsyH0ddc6Gl8pcQoIruv3SYJY6HfAFd0EVB2m1eSlDWVkYz3G6RULGV1MAVXD6mGfR
         o4jdhvfhSGNkxctAfb1ZAgZMEW0L6oxigtvThaKYUARk38cN5zfMHJECCf/QnWGuEKK+
         EcRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jWi/f7Mz;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v8sor1034088pfe.127.2018.02.23.16.58.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 23 Feb 2018 16:58:58 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jWi/f7Mz;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NuTagIE4jY0bCTp8Ha5fNEJ1O/r5UpMA5fSlV5stR1A=;
        b=jWi/f7MzIdEKNahgOk9kZiGiWt9gOJvn93p3sIZfQyo7/pn9O8FFPvHDGwrGXjQ1CB
         Oepc+a+r4kEWSsqWwPDYVwb7xTMYT0ah6X0iB4nPzLeSxHrMM55L7H4LyCST7Am7u3Go
         WJCAFzzG6k7pHbca9XNCgcPZRm5jEWedl/1Qs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NuTagIE4jY0bCTp8Ha5fNEJ1O/r5UpMA5fSlV5stR1A=;
        b=AyiNLAkyfogOgXihZZ3tiuW3TpceI/P2vQ8uMhwnbuXkexsmhQ38mqUHWQJqWrQZue
         aVqunCIe6j6DcH7k3WfcnMhhI7Gcm5Ptq9l6ncxhZR1i2P4HTV277RGpyudn6yn0K/t4
         DrqT8rbyrji3DAOy5kT9B2zGpYyWvGvG4n6zMBHvq8JwIssVnrWICxovDL0OLYFhrrrJ
         UAeLBlrcpxLIq/yaV/rh7y57WXDp4EhbZjp57SF1JqRwktcbzkcgqlvlxUjeIT2r8zsG
         SpBJLEVIeOjA7QyYikdVAe/tIQ1c/FSAwM9fskFqwLbmdP6brmHUC4eqNkaTGi71GHBM
         VrLA==
X-Gm-Message-State: APf1xPDNGStyMdU86y3T9ESQbyPcxcMQMCxALnQBdUXa4XEw+hpgEPXK
	ooBx/vQ0qpfAeTIca/Usn1wPCjfgAoe8oQ==
X-Google-Smtp-Source: AH8x227e/kMyco30fNrwIVlOlt+SOxLn380DrEmetzDy5gcKnctytpVw3/y/E+2SIqMWwk6/Rmqnnw==
X-Received: by 10.98.225.2 with SMTP id q2mr3416832pfh.23.1519433937851;
        Fri, 23 Feb 2018 16:58:57 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net. [97.113.169.147])
        by smtp.gmail.com with ESMTPSA id u19sm6874950pfl.75.2018.02.23.16.58.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Feb 2018 16:58:56 -0800 (PST)
Subject: Re: [PATCH v3 00/31] Add ARMv8.2 half-precision functions
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
References: <20180223153636.29809-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <eda535c7-e66e-fc00-5614-5a1be2ba80bb@linaro.org>
Date: Fri, 23 Feb 2018 16:58:55 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180223153636.29809-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: GDgvQ2nrGWo3

On 02/23/2018 07:36 AM, Alex Bennée wrote:
> Now that the softfloat re-factoring has been merged I re-based this
> directly from master. Alternatively you can grab the full tree from:
> 
>   https://github.com/stsquad/qemu/tree/arm-fp16-v3
> 
> I've tested with the following RISU test binaries:
> 
>   http://people.linaro.org/~alex.bennee/testcases/arm64.risu/testcases.armv8.2_hp.tar.xz
> 
> Which now includes insn_FP1SRC.risu.bin which tests the final patch in
> the series which wasn't being exercised by my previous set of tests.
> 
> I've dropped the fp16 patch to both avoid the bikesheding but also
> because I could achieve the same effect by running RISU with:
> 
>   -cpu cortex-a57
> 
> The changes are all relatively minor based on feedback. The details
> are as usual included in the commit messages bellow ---.

Unless I've missed something, that's the whole patch set reviewed.


r~
