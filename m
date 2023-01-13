Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp712937ejc;
        Fri, 13 Jan 2023 14:14:24 -0800 (PST)
X-Received: by 2002:a17:902:d587:b0:189:340c:20d2 with SMTP id k7-20020a170902d58700b00189340c20d2mr12331323plh.23.1673648063920;
        Fri, 13 Jan 2023 14:14:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673648063; cv=none;
        d=google.com; s=arc-20160816;
        b=z/5gcXfYFeq+rNnp20Q+5hpaTn6yHnvWuJ6xdZZdUEyXKzqZr1OJ9a4aohilA3CAo1
         Lbqw3KW3d6+EQhojpvY4YOR0uhjdhiRV72IVUsc7jVYHdKlqr1B0S7YTytaahZNrp4wH
         mALROePG+6N+Kvs6bMl7BxhExqghfn8kq8mxDm4oR6Du+TMYldsdQLtQKA+aqtSYxmbc
         0kn3WZnKcj5qixk3AfFrfQagz3xBWQ5mqpDitt1l9vTgZhHDgcbmjP0fIS5xqREEoXpb
         6ija79egxZiY9dhfoQrlXNj1E+oHXn7M6mjurWgBtmh8iBFs/Wzbny8Uj8dztUr27k4u
         tohQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Us/2GYxR1CvhyTHZ7Rv1cdbUiuMJ/PsykrqC7LNnkc4=;
        b=oacD0tOh46oOZL9HbRCw2AtBQOAzC271Ug44FcYveNNhPaJXMxgd3q1leq/wKotD9T
         Jxgy3VMZnBKAAhSwnNqGhSonGrkZnPoz4l+oWiwW3XfQDaBJ8sxGXtm6RvnW/za4DGH4
         Plf890nbm7y4XQi3AMFsz+TfLudLW39gtlBJhiv4dhby4n/TWstfpvwzCpPN0CbKx0xy
         hMlXaFBO4sqfOp0EW59ZuytSChs3wAFzyThJUoZ9THzijCT75Tyj9dQZF2VIQpGCt8wj
         Vntn8DNyif08O1LLmzNfiHc51ENaaKE67ddzZV2x03GM1w2BbaQCvEI73FQbSq4LAHF+
         /2WQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SbA9eAQA;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c9-20020a170903234900b001945367d8besor3893885plh.72.2023.01.13.14.14.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 13 Jan 2023 14:14:23 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SbA9eAQA;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Us/2GYxR1CvhyTHZ7Rv1cdbUiuMJ/PsykrqC7LNnkc4=;
        b=SbA9eAQAMwScCRuQi2Nnr5+DPoiToXjAExv3iOLnevZymxF3qM3BWuN3IxLZHN96q7
         oTOgvtK3iedmykY1rjk+df6/SaMDvRhGgjzFH5czbdjYar1GNc4w5mDsr/PkQlLK/ol8
         U2OU+ODVGUM3BjiR+XIcrCgg1PDVWhrqxUcnM0Ogim+ku6tMd3sMF7ju/sEBsUzJZ7Zb
         IEwGaFoMlGCvURmDhnY02UKvEKr8V856ranFDkjXSYCY5v84f0sQbzUKTXP8rqCAVcij
         gjbc8ZTIT5dPrshxif954j45iUqm1cJuvCDQjtd1lXNZ++ia1tEpmLyjhKzviyGC41+g
         qzkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Us/2GYxR1CvhyTHZ7Rv1cdbUiuMJ/PsykrqC7LNnkc4=;
        b=h0KuI1qEM1KbW33SEGDLI9AdNDIjChACR/3yVUe9I6T/Q4Xp1x0YB8COu5F0yqDOLz
         yTM1X9zpgSk73bDQs7QLsjgilmoilmIw2jTYfrBVKG+kSU+FDGDmhbxNzgJAk/pVxit0
         98inAsWAR/v1BDHiigNkbNswWis4XELUVWenPAsQNXE/eO8v+RrhPkaJgVmljxj9P02k
         pIibN2MaTHCIKY08J3NXZfCgMzLxJl+rV8Kn5EFYqbKEhAENdRg1eTrhpapSznxP6/ep
         YwzgrkiMaXSAcTT5CkjnC8APFuWXvlOzaA+7nD89lTeVQniN8gcRme2Ozo1D1CU9TC+B
         Qn9A==
X-Gm-Message-State: AFqh2kqL+Iw0Crb2DTW9i9rZ1Eh8+apuOapsIdIswBpkrSAUQOJeA4ph
	LZ3e42THB7pTxV5WduJuhSoRolj8
X-Google-Smtp-Source: AMrXdXs5HUW/DUY3ml74rXhm9cnZziC/7tfieTRm2hYyMnXP51HQ3GhjGf0Yqa6kh5BX5T9bO3EJ5A==
X-Received: by 2002:a17:902:784a:b0:193:3354:1c22 with SMTP id e10-20020a170902784a00b0019333541c22mr11712612pln.39.1673648063449;
        Fri, 13 Jan 2023 14:14:23 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
        by smtp.gmail.com with ESMTPSA id c5-20020a170902d90500b001946119c22esm3708918plz.146.2023.01.13.14.14.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 14:14:22 -0800 (PST)
Message-ID: <da04028b-3f5f-6388-ba8a-734cf3901ea4@linaro.org>
Date: Fri, 13 Jan 2023 12:14:19 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v3 25/28] tests/avocado: Tag TCG tests with accel:tcg
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-26-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230113140419.4013-26-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: FrMwuQwbIvHw

On 1/13/23 06:04, Fabiano Rosas wrote:
> This allows the test to be skipped when TCG is not present in the QEMU
> binary.
> 
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
>   tests/avocado/boot_linux_console.py | 1 +
>   tests/avocado/reverse_debugging.py  | 8 ++++++++
>   2 files changed, 9 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
