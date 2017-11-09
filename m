Received: by 10.223.150.237 with SMTP id u100csp2223868wrb;
        Thu, 9 Nov 2017 00:13:33 -0800 (PST)
X-Received: by 10.80.170.28 with SMTP id o28mr4105775edc.93.1510215213415;
        Thu, 09 Nov 2017 00:13:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510215213; cv=none;
        d=google.com; s=arc-20160816;
        b=rHGB42FJqTcUX0Ave+KI+jbsW8FgCpGNWjA+n50lRP3U0Ee/1BNQYJ44rWwvWe7Hdp
         0y4lXt91IBKoYAbHKOYrvCx+ejdTZXGT3Nzk8jwk7eliw79vU6la11CJD59MWeFRRPeZ
         mkd9dKTGXrwsXpKDqijc9X/8XEGQ3gi+0xgUdzSzDlMCcgyR4mlnIV4UkfAYHkp7v85u
         QPLB8/o0VrlsKEWp64hDE+bhcDxfTfkrMZVJwjkLrtQzTQfbqEwYv4nwwM8SsxImBKO9
         q7AkuFNMUy+tzhyRXMm/aPxnogdupXfj/nAkeDm40wJQXLr+dt1e+QJieAVEiu93Upa/
         8MdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=OJDqMUiL3+GTROdpfuOsCDf1mrIVjiSScQli5/VsNHA=;
        b=qEWTwy9YmqoJQaLwrYg3SX7OoAaYw2Uq8U1zKn7zoiI3reUA39j7TgaBz6S8j7F9sY
         7DO3QYRqh4zUOcbMl0cCmn80fFALHtOmPbmTj6rLOJHUwIkSHJcUSX+WGG6sV4+PUiS7
         RCKmdYX4IHIAvbt+VPTcYYD5r4+SjjahXau8d/F7NmmnCTgMT8czdEEK6z4lQXDHdJTT
         i+s8g1rheuskKjJGpBmr36cAw97AicH3LKMPiNe008KbYfFp/bXinEUwgS/AWif64lFT
         YODVcq4oSLi0LRuDuL7+tg7B8Wh5F+0I8kDNTwJl4qpobibPNNdbMPpNxon8a9ix6c01
         OSWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TCic3Ing;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id s9sor3842271edc.52.2017.11.09.00.13.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 09 Nov 2017 00:13:33 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TCic3Ing;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OJDqMUiL3+GTROdpfuOsCDf1mrIVjiSScQli5/VsNHA=;
        b=TCic3IngqeL4VEbc5gqdCRDAVQ18bZUScw2gL9KXiJgmTJslFlgFpW6A9ufohXhGJv
         oE/x4hKKzu7DTt43ewvDa6zCiwzCK7GOjoSHSRDGwGfRfMbJYkKlLzH1onJ5vcOMMz3Z
         ne79NugHUhr7SkWjt/4Xc5rtKHHI8vzU8E+rk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OJDqMUiL3+GTROdpfuOsCDf1mrIVjiSScQli5/VsNHA=;
        b=BgHxZQ0KnHOH3gYxpMrEevNUbLjYjhSMCbtL5XiDQ/aXP1pOuHfMYjPbrl34JjSx6K
         6oFQX0Zfbs8BP66WfE7J9Go0mH/meI3kwnJzOgrqVgE4RknS4ZOVPNakoEfjHedISSnG
         EnbWQsjdKGGIfZKTy5JkXqtkkUNVGBvJlbpnFFntwsJsS4XozmouAfqQ6wmw88m9DEqZ
         utFL4fizAoUzJy41Ymg5G9rXrSJqu5Q71HuGXg2MMBZXZ2Za2a/7GnSENG060iY35wP1
         NGVQiR5iOPEtiXmq6k4gcbnOM7RoVuiNNQyKO2vbX7VDeeLTDMx3GGERgUiTGC1x0xTA
         pENA==
X-Gm-Message-State: AJaThX7oQJg/qDIPq3OYMyIVW5yW8iVFknpy6x5k2zdVboq3lR7Fyu4O
	zZ7EmgcaFkL1uLFMZrX9aaVjhL2SQy6ecw==
X-Google-Smtp-Source: ABhQp+QUM9Q6+burQy+BaJeA/NoCbH0AKtSo1cDZbsrRtf2JzaNpcpb96ad1E1OA+rdhg07KVUKjIQ==
X-Received: by 10.80.137.154 with SMTP id g26mr4248881edg.80.1510215213114;
        Thu, 09 Nov 2017 00:13:33 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (93-45-2-58.ip99.fastwebnet.it. [93.45.2.58])
        by smtp.gmail.com with ESMTPSA id w28sm5611602edl.16.2017.11.09.00.13.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Nov 2017 00:13:32 -0800 (PST)
Subject: Re: [Qemu-devel] [RISU PATCH 04/10] risu: move optional args to each
 architecture
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, Dave.Martin@arm.com, qemu-devel@nongnu.org
References: <20171107150558.22131-1-alex.bennee@linaro.org>
 <20171107150558.22131-5-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7bb27c4a-6c53-69b9-dff6-aa7413b6275f@linaro.org>
Date: Thu, 9 Nov 2017 09:13:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171107150558.22131-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: V7KxsBCoUH96

On 11/07/2017 04:05 PM, Alex Bennée wrote:
> +    if (arch_long_opts) {
> +        struct option *dptr, *sptr;
> +        size_t osize = sizeof(default_longopts);
> +        lopts = malloc(osize);
> +        /* Copy default opts */
> +        memcpy(lopts, default_longopts, osize);
> +        dptr = lopts;
> +        while (dptr->name) {
> +            dptr++;
> +        }
> +        /* Copy extra opts */
> +        sptr = arch_long_opts;
> +        while (sptr->name) {
> +            osize += sizeof(struct option);
> +            lopts = realloc(lopts, osize);

Count default and arch opts first?


r~
