Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2485318wrq;
        Thu, 14 Jun 2018 13:21:00 -0700 (PDT)
X-Received: by 2002:a17:902:5a1:: with SMTP id f30-v6mr4604294plf.167.1529007660538;
        Thu, 14 Jun 2018 13:21:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529007660; cv=none;
        d=google.com; s=arc-20160816;
        b=mm6ClbXtHvLxM7EEIGEsCo5dkaBZtJj9jZ7v3cB73WDxsGGGqDcb9vjdjADbA4kFv0
         u9hregIOgQ1ecAQckD1wvea5ive1xg6kYsSE3ZymN2jc9bv+291tm0vpklmKzAlnoeGN
         RLH3BwOozU6w1CozMfHi9uOVIw0+pIhvFirViaU4bM1Cj+BHCd3YSpd4URFJw8BaH/G/
         gFXlqDSL3cNC65qasRrh2w3Gil0W/TCZLK8LO3AiF8i7lOkg+6+xcD4U4zjij9iigMm3
         VfbBaltCv/zEkhn7vABVUcaeX0DiJ1iquW2RqczjOuJMiOA+GmTPSj8rQc+BSAl96NLs
         1LfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=ym6ia0iJMh3Y15sm83R13TA+95Soh8HR6YxhQlLcjYQ=;
        b=q+vGEV0T8F6zfHsHNDSfCjpnY6W2hrqqp+nJ5fnumx9ypo2arHJTkPFHys+aAAFcA8
         jfFR6gxgfh0Mb+S47Xl9AGUMA0ZcVJQS8rPOG3HSIyxlU6b0d1v2MRZsfYipeCCD0Tg0
         RB91xDtFO87hfqJB4nnYE0pcvbYKxF0/fTfoBwvfQngrL/0sV7GmSBegdhCJwz6lN3Ww
         7Xzgp8LLdFbR87K1jMvbOicH35+TsN5j0zhqk4VoyD4Fu+6cZU+E8GY0eyziu2Jq1v9T
         AC00OMPJwXmw+6KeKnuyNuz3S4at6YUoLXWTQsUX1MBf/X36hhOJoTEHifnXnclZCpQD
         qpJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kUDOYpzC;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id z33-v6sor2122890plb.77.2018.06.14.13.21.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 14 Jun 2018 13:21:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kUDOYpzC;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ym6ia0iJMh3Y15sm83R13TA+95Soh8HR6YxhQlLcjYQ=;
        b=kUDOYpzCy9tlNVpDNpVuAII6pWZxOOcxra4ibVHBFbFnGPRkijMO8QloH+2kiAqaPM
         bHmkp9iabRZGPK0e23oxjwVmK72Zwpco/IV/TJwJ0ppr82XmmCohunn5AGotUCDT3Di5
         srRk08R503+Y8k8k0bABYeQk3teR8B8pGVMb0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ym6ia0iJMh3Y15sm83R13TA+95Soh8HR6YxhQlLcjYQ=;
        b=mrASr4xv6ci266SUi1JLnBmVKlOCQZFkei1YTdmxwaYCL+3XlJv4X2lYx30Arlov0j
         2Zw/vGmTX9XQwDN5XnadDruIbHYc0z6sHJGouB19qj1wdpSu2jdy2Ckh3+MrliB6odyF
         iSC34dcZj1zhmKqiALXXuE3oT1Ia1rPwak657MvF17fQfyRqOmqrZcvX54W5vwyZ3rYr
         RSLIBQbqpCQ4nxSvPMaxz/PDgRjLi0lSTjFBJCmqj0DgJQ92MwwtnNS0Db0r2ECExYdp
         ohuI3IFhoHvKSZjUMCd5LlBQpLPo3k1fJln2sZZ9lu6l60Ihq63GYPWmOLHU1UoIvN0W
         yUWg==
X-Gm-Message-State: APt69E2Dr9dkReY33J4N+XlUMxUFpLAAP51CLTWt/SAI/jvb1tv0USEB
	Q0iSiOtTV0B1W8LAntmbYMpGei/oTHVZmA==
X-Google-Smtp-Source: ADUXVKJ/wNNZnd1+fLPhxdeYS/9I704G0gNO9yPQdY28TQLwwLnk2x1yTm8/pbXGC2CJXmt0OUvsgw==
X-Received: by 2002:a17:902:1081:: with SMTP id c1-v6mr4589034pla.153.1529007660137;
        Thu, 14 Jun 2018 13:21:00 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (rrcs-173-198-77-219.west.biz.rr.com. [173.198.77.219])
        by smtp.gmail.com with ESMTPSA id m16-v6sm7119678pgu.67.2018.06.14.13.20.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 Jun 2018 13:20:59 -0700 (PDT)
Subject: Re: [RISU PATCH v3 13/22] risu: move optional args to each
 architecture
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20180613125601.14371-1-alex.bennee@linaro.org>
 <20180613125601.14371-14-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <0238382a-6265-789f-0b0a-256357366613@linaro.org>
Date: Thu, 14 Jun 2018 10:20:55 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180613125601.14371-14-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: jyRRIfARjlWI

On 06/13/2018 02:55 AM, Alex Bennée wrote:
> The key variables here are: *arch_long_opts and *arch_extra_help. If
> they are not NULL then we concatenate the extra options to appropriate
> structure to enable the support. Adding architecture short options is
> not supported.
> 
> This also includes moving the ARM specific test_fp_exc/test-fp-exc
> into ARM specific code.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v2
>   - better concatenation of default and extra opts

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
