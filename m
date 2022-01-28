Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp73075lfk;
        Thu, 27 Jan 2022 19:32:43 -0800 (PST)
X-Received: by 2002:a63:cd45:: with SMTP id a5mr5126012pgj.64.1643340763474;
        Thu, 27 Jan 2022 19:32:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643340763; cv=none;
        d=google.com; s=arc-20160816;
        b=J7yC/ood62lUKjighC+TExNTCk+8J6UWjchAvRRV6L1pUN7zDee9YVLFiJsqQuOp6C
         rpU0yPhFNMfwmesu+w4/IMGkPASF7wOUpb+aXhOGi7bhBESKWiTVetwRUqjq28sKKeFl
         HMdfgTRVlslTTtlyQg8MfjoiB1ng9ShF7Wlx0HePuTvvpMophkD06GLlmnHvFojjOR1A
         9wi5cpK/JNrgk583rttI4Dp2MfjhQ9MwJK3IJcPAIO91DTgnvoVB9O7IOXseVAWSr+6j
         OIZuiiJ7L+KmZ8K0EZ+bC1Qd4/sw+RO3nTDXv8x6iYpxO7uoBh0THl7pW/321sl+Pz92
         St7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=HSjJFbQbLc5yNE8+vDgwiD9bgfphfoTCCRrfsIEn0rY=;
        b=rz8X4TYzZM6v3jQu1tyf1voWeh4MeWK/CYPPdpcXZIB3XyhvJTBT/7s03MWrQ0TNE8
         2W39+JW94+1s3kZh9lzA8kA+twljQUkp2j/qp9VR54EYuDOIkEeY+TK4geHV5EEz8V2T
         x71sz4vi9jb67ESvUzKDABJjMTXueC3GyXFrPbjHbYfHtPqMFf1IQQhXqcQ9KIXPEmNH
         0ssqG1cq/m/FC4gnel/nBFpbcMv5qBLflPJGg7wwFjgJPAETxOWAVnu3iJHzEb9uRIGj
         tN2caSMR3q/Av+lSySC1vt5VyiS2Sen3AzCjRG9c0shMqEDVyIl7aKb/p2deHxkEGjWt
         zyIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kQgIxxTD;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id s32sor1459383pfw.15.2022.01.27.19.32.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 27 Jan 2022 19:32:43 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kQgIxxTD;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=HSjJFbQbLc5yNE8+vDgwiD9bgfphfoTCCRrfsIEn0rY=;
        b=kQgIxxTDGvl+FwgqCSNZ10arm93+xfFac+ET7D8zo3+GfAonPMtxZ+0DWXy39b+krl
         jIRp7+qPNeGVYFlujzoNtXHF02IvdExN8hKL+M1/MQs8Ez4srs4JCIi27S/6z3/dvbNq
         QctG7JCviX2RZMqKXZSXAjIpkwtPS3MqWIrK7TH4t/ukZeCfi2gTl46+62R+1id2LIwg
         qOWzPR6By0NEiYMIYmeuyymT64rxVR9mYCOM4B4wdkuy7r2WrQcMWXI9t+8z/apBdaSn
         6UR6lmVU6qR1OQo74dpRFjrWk31mrUJxXU1o/Qvbf2S54Ul7jwiF0bsNfNkmBPy7Mrnw
         pT4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=HSjJFbQbLc5yNE8+vDgwiD9bgfphfoTCCRrfsIEn0rY=;
        b=v5JBNPmRJBOHpN3uErTq18ycJLUWuy+rbAMJW4Aq1lDCcC8MW9McaWp7eHZQjO73nu
         NSa0INSCFkufdpd+bxOYiXsthQ/1DdLV1Ra4HJGrg+LqMnphpQuPkEOKtrHfRO8VOWMH
         NBbCl3K+eN0zTlCZFgKoUkzY8PKjemkZwuYk6qRI1fCW8b4QO5q/8wLT3w0kmW+huP7F
         f0kYp93SPzYD2Ky4mOtR/CWR7g+q6/jlMeOjApkQJZqiPDEFaTdeYhZbHylghhavgZDN
         iSDT1o6Q7Bve+NSeqtiffZTPchXAFf0l1/X5taeykT7SgamyYa19xbR4bOtX9y5PkLFz
         PZWQ==
X-Gm-Message-State: AOAM531JrQLmpkBv0WzA8IIyzRWytdl4wJW6uyi1uMZTEIWthFZeTF6m
	JrKMuUWi1UcVEx6Yov9Gp6jWpA8h
X-Google-Smtp-Source: ABdhPJxfAo9AkiIpAP0GEiaE68xKTwvSxb3yjGaBYsI8BEQN24I3ru5ZtCRREr+ypnZL5pAeXkRwrQ==
X-Received: by 2002:a62:5383:: with SMTP id h125mr5938708pfb.30.1643340763006;
        Thu, 27 Jan 2022 19:32:43 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
        by smtp.gmail.com with ESMTPSA id o13sm15641272pgu.89.2022.01.27.19.32.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jan 2022 19:32:42 -0800 (PST)
Message-ID: <c3d680ce-8b0f-67f9-e591-ccad16c114ce@linaro.org>
Date: Fri, 28 Jan 2022 14:32:37 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 12/14] hw/intc/arm_gicv3_its: Check table bounds against
 correct limit
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20220122182444.724087-1-peter.maydell@linaro.org>
 <20220122182444.724087-13-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220122182444.724087-13-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: vGly5NGMgRQM

On 1/23/22 05:24, Peter Maydell wrote:
> Currently when we fill in a TableDesc based on the value the guest
> has written to the GITS_BASER<n> register, we calculate both:
>   * num_entries : the number of entries in the table, constrained
>     by the amount of memory the guest has given it
>   * num_ids : the number of IDs we support for this table,
>     constrained by the implementation choices and the architecture
>     (eg DeviceIDs are 16 bits, so num_ids is 1 << 16)
> 
> When validating ITS commands, however, we check only num_ids,
> thus allowing a broken guest to specify table entries that
> index off the end of it. This will only corrupt guest memory,
> but the ITS is supposed to reject such commands as invalid.
> 
> Instead of calculating both num_entries and num_ids, set
> num_entries to the minimum of the two limits, and check that.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/hw/intc/arm_gicv3_its_common.h |  1 -
>   hw/intc/arm_gicv3_its.c                | 18 +++++++++---------
>   2 files changed, 9 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
