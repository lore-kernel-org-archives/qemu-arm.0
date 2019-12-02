Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp12132053lfc;
        Sun, 1 Dec 2019 18:41:37 -0800 (PST)
X-Received: by 2002:a63:c20c:: with SMTP id b12mr23056421pgd.407.1575254497545;
        Sun, 01 Dec 2019 18:41:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575254497; cv=none;
        d=google.com; s=arc-20160816;
        b=CTWeEOvA57xYIxMys61SRxG/5lOYO3srpxVsY6DhILGnHDb3ZpzX51khi0pOTXaMlm
         xA6tHveatCy0suRmtzDe8yO7s6Hgt0nPN1GnhpfCHnRr3F5o/GTYxQReIC76jUO18dTj
         HichWdBBrJmasl8BeztE7YqLUtZJdXRkwkUC/l7uN40kaBcnnjMDgnbp1m9FTsFORPYY
         3BwoN8BUf1fiGKv4f6NA0lZB3owdnkYzCWQz6oS8OgcrpHkwAHEJ2ryIhjJDsAIbrKv3
         Meu01P+zJbUtMN6P90nK7vGU1F7t2TWSB+ICu+jqg6H32cAPzqQJO6Z1iJ0FPD32vlWa
         jufg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=c13Wjzos1EtGKKvew52DvMGXElPNobtTinpSlmyukJA=;
        b=hqZtK7pZTQSgFNI6WSvCismFV9tHNJ4L95mqZSWqK2Uoq8m0KtzwfH7vHj3wgmO4zX
         0CbpDLiUN71EdGR+ZMWhr+MFL8dM5JB7LWq/L0tBIpyK2FEDUosFoRg0+Sx0Ax3Xckv0
         4ow2VOyH0YqwwiMY7Xh76ymFxP934uhFPBKonHddtmqswTmpP0y1ZBz9L70YFrJDLX/b
         MojS+GJTx3iJsUXgcaQC67zl/JZnLMmUqgRAwECvVpdr0yFuQzQnwBFy5VhxDEtmjPz0
         4x5ZI0qDb6Tu/YntO0Z7F7Wewt9NlDfjhsMy/qMoJvvUczXs+E481RNJCgOHcBo4v04M
         R0HQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NKlNgjFQ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id o73sor20301383pjb.14.2019.12.01.18.41.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 01 Dec 2019 18:41:37 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NKlNgjFQ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=c13Wjzos1EtGKKvew52DvMGXElPNobtTinpSlmyukJA=;
        b=NKlNgjFQi6sOk7HkO8p4H2g/ovKzfs0J94FjBbxdCd36Y4m9tvWePzC7/XYhvTgFi8
         qmPC+NHbeOAXw9kVJubX6e5o6GjZ0HmTFmhPFgO7Pk4alsSBHA1HbOlIEzwrjxkxZ9OB
         PCVcEq4WuFMTaE+2FFTLuOb1GIETNMrcvAeQdV6Sx/5MfDbQYcNUBvCP2RmbC2rK79/h
         bywxmJON8h3vF3aSfXsf3MmyqUDg/bPeETBaUpRRdRpJhtGsWwqdC9QPrZnfPapPwHwv
         dSwMlmHgbBDhUp/XflIn99HfTwF4tZjTqoc3oKQFd8HYQlBLKl1kb+8xHKzJXPWnRe7n
         PZZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=c13Wjzos1EtGKKvew52DvMGXElPNobtTinpSlmyukJA=;
        b=WsoishuZK8PaTSBWHNMnlQvTjx1tRyWg5KTZRn18ng6Dfu4aKVDsd1bO2TPoo2QCzo
         e11+lEP3u4Hs1pVICO+ltCsSajyNTt98KMa40D569aOfkLFEpPPUhOEuJihvzmIvANKY
         MxCeKmJcfIk2wJBT0e3utGd3NQnQ4c/BftMVrJ+qMLUBPzWIXBCRbkoYrpmDQfZhYBm3
         H/M7aO4IUb/BykFWTf17BMYyqCJGyRGLKZFSJMMKGxfRHe+r5FwhothM6+K1zRFUnCYK
         +stU9HOKlP7Gr9yh36xWLZKLbsOK2DfrAC16wurrYDzkFQEB4AVESTXLhG0tMaMYoNC3
         sGSw==
X-Gm-Message-State: APjAAAWwgbytfVY6F3upuSmj5+gGQ7fKzaniDVaENZrJpiprLUHe4G1R
	v01UXvuknbwdl0PhEveij0L/g8Jd
X-Google-Smtp-Source: APXvYqwwdN0t6YJZkt+82dxh4n2UojMRsqoLnEp3XQMKtVLZEuJURDc98DpQCtzq6wkNWU0nnDswHg==
X-Received: by 2002:a17:90b:d85:: with SMTP id bg5mr6202738pjb.99.1575254496974;
        Sun, 01 Dec 2019 18:41:36 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id u18sm16530275pgi.44.2019.12.01.18.41.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Dec 2019 18:41:36 -0800 (PST)
Subject: Re: [PATCH v2 11/14] target/arm: default SVE length to 64 bytes for
 linux-user
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: alan.hayward@arm.com, luis.machado@linaro.org,
 damien.hedde@greensocs.com, Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20191130084602.10818-1-alex.bennee@linaro.org>
 <20191130084602.10818-12-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9362663d-6452-39aa-2a8d-1cfd853d7faa@linaro.org>
Date: Sun, 1 Dec 2019 18:41:34 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191130084602.10818-12-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: OGZp+LYOHQmg

On 11/30/19 8:45 AM, Alex Bennée wrote:
> The Linux kernel chooses the default of 64 bytes for SVE registers on
> the basis that it is the largest size that won't grow the signal
> frame. When debugging larger sizes are also unwieldy in gdb as each
> zreg will take over a page of terminal to display.
> 
> The user can of course always specify a larger size with the
> sve-max-vq property on the command line:
> 
>   -cpu max,sve-max-vq=16
> 
> This should not make any difference to SVE enabled software as the SVE
> is of course vector length agnostic.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  target/arm/cpu64.c | 3 +++
>  1 file changed, 3 insertions(+)

6 is the largest size that doesn't grow the signal frame.
I imagine 4 was chosen because that's the only real hw atm.

> +        /* Default sve-max-vq to a reasonable numer */
> +        cpu->sve_max_vq = 4;

I also agree that we should match the kernel, but this is not the right way.
Changing max vq is not the same as changing the default vq.

You should change the value of env->vfp.zcr_el[1] in arm_cpu_reset(), and the
user can increase the length with prctl(2) as they would be able to on real
hardware that would have support for longer vector lengths.

Also, I don't think you should mix this up with gdb stuff.


r~
