Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3882784lfp;
        Sun, 16 Feb 2020 01:30:18 -0800 (PST)
X-Received: by 2002:a63:3f4f:: with SMTP id m76mr11761044pga.353.1581845418432;
        Sun, 16 Feb 2020 01:30:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581845418; cv=none;
        d=google.com; s=arc-20160816;
        b=x8iyp1a5CYXzgmqKjNB6CesP1Zmw+AYJbDgp5lqhfqKjrs+1kQSnVbGtzE90MeeOXV
         JXHj/AJOzx2U39Z+NKeRqHRP5BNe3C4HtO4lYvS/rjAdcNMrTH4C11Q+Go/Xqj2VBQDD
         U8zIaJpC8cMQUkhILsqDwof5tJnX+6hsbdtjeMooW75ZP7Xh3hYwgDBeOPORLZf0Cssk
         QiekwjiicVdbhOChZ2tu/1U/ZDFUPu+MwbNhLUUPiimpUa4Tc+6qnGq3kBmSXssNgM0H
         Pkv3w1GRkXfALQGc2d3Xf3O36vGG49CE/QU8fLEJkERWuV2fShNZu9pohFn6rx/7JAiv
         YBgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=PjV188ljJOcj5eD5Q+Bzib1gG/XuNZZpkt8IMeQJWxA=;
        b=AkClI/G0ygf5R0HmhWN4RNC5ifHQAR0WfQHXsn7qOSufZ5xfrrD4kU9/XKb2P87cF9
         +ScjebD6Q6si/earPMh0rtKF7z+vSolcB3F/PtlmZ3qpWdyuteUFKqi8TSiaYRfivr0X
         UZP/HXFHoUHVUWI+0BIeWqb1xQp/yRTeDeKAeFc7hXEgXc3kvtAB3+311NUZ+6dGJ27C
         M3uQStP7S2Mjnhu2FQNi5dutck3GVhJ35yj7Y2H2OSvWPMOSNyfYTPuKBUOKZT408Xgp
         znYFctQKK9DrQm9+ZT1dLlPziRcO553O8TTsOj1yMtm1eH+QBy+nWJVhW/I5iUii+3qt
         YHyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="mBPEDqe/";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id y7sor13456195pff.13.2020.02.16.01.30.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 16 Feb 2020 01:30:18 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="mBPEDqe/";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PjV188ljJOcj5eD5Q+Bzib1gG/XuNZZpkt8IMeQJWxA=;
        b=mBPEDqe/Lh0jrS3ZlXb73eGTAO+G2rYEMvR8s40NCnxQ6vGAsbtq0hXtFGkeLjqxnB
         xAQWyLaygG7LSbbFa1jChdF+pBmilbrAWWqa/dTLapa3gZkuXfEJYGSxlX+TwypGzMXt
         uAaFQsekdnvARbfH+5pq/OMvcrvazwYbRrMWwyXSbMrVH2x4l/Ao8AwGoPK/364LoAlV
         4wIij/GzZ9/e+obAAjnn3P05R+NQyK5mpHufcZ3mcQrktUC9SlNP2XHopD/qvdSyz4Mc
         HdTBtodlEK9+8nOYXgjfPxASigbrMaeWYrwWKs3E1M/hIO4PtyyukPihx3cEFAwHmfPv
         BSPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PjV188ljJOcj5eD5Q+Bzib1gG/XuNZZpkt8IMeQJWxA=;
        b=h943cUjncWl2J11iiFOPcglo3Tw3cjAKfA9BQT5R/Ua6vlHOWTPxRFLOWek66U0kTx
         QgaUJ56GvWyjsIJlS6YBWHh3yOQSe1WgvA4c0FUzt9dvQFJHjoqJQxvHUcRDCnV8XAVb
         O0bQ9k6BTlpM1QQ/K4pvE0uqf5RrHlcwgDJPcVxY+KuvyeKaEnRlKw3XSmT/wC1NoMuK
         S18pY2HjnSFGxQxWEIT5aPVmQyZcLnm4w3CZ4Z/usi8frKr56d9VBzlDjZsobZLZnW3I
         /KGzu3xHyo+7lC55OCtLJWUCV8J2oBvjxdzfzkD3KQgmd9XtVexYFh7MHRNs2766y7H+
         eJmA==
X-Gm-Message-State: APjAAAUZp0OBuXAaRT7ZBk2dozuY8prn0KobI0FpKzwdKzMUbPyy1c7I
	iElR4TnWdDxQ+KNZIOAho7MkMhJy
X-Google-Smtp-Source: APXvYqxyTVZV8jn9k2Gey0mBy9iJEwqt/4AzJYg+kW+9FYG3b3anof2tr2y4KVfddMUbLekFNquo6A==
X-Received: by 2002:aa7:8815:: with SMTP id c21mr11345865pfo.81.1581845417905;
        Sun, 16 Feb 2020 01:30:17 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id q17sm12803261pfg.123.2020.02.16.01.30.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Feb 2020 01:30:17 -0800 (PST)
Subject: Re: [PATCH v2 19/19] tests/tcg: take into account expected clashes
 pauth-4
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: cota@braap.org, aaron@os.amperecomputing.com, peter.puhov@linaro.org,
 robert.foley@linaro.org, kuhn.chenqun@huawei.com, robhenry@microsoft.com,
 fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, balrogg@gmail.com,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 stefanb@linux.vnet.ibm.com, marcandre.lureau@redhat.com,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20200213225109.13120-1-alex.bennee@linaro.org>
 <20200213225109.13120-20-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ded4f25b-817e-ec52-120b-8aecb2ebdb9c@linaro.org>
Date: Sun, 16 Feb 2020 01:30:14 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200213225109.13120-20-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 6ZmPDjIty/Rn

On 2/13/20 2:51 PM, Alex Bennée wrote:
> Pointer authentication isn't perfect so measure the percentage of
> failed checks. As we want to vary the pointer that is authenticated we
> recurse down the stack.
> 

You're no longer recursing.

> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/tcg/aarch64/pauth-4.c | 54 +++++++++++++++++++++++++------------
>  1 file changed, 37 insertions(+), 17 deletions(-)
> 
> diff --git a/tests/tcg/aarch64/pauth-4.c b/tests/tcg/aarch64/pauth-4.c
> index 1040e92aec3..24a639e36ca 100644
> --- a/tests/tcg/aarch64/pauth-4.c
> +++ b/tests/tcg/aarch64/pauth-4.c
> @@ -1,25 +1,45 @@
>  #include <stdint.h>
>  #include <assert.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +
> +#define TESTS 1000
>  
>  int main()
>  {
> -  uintptr_t x, y;
> +    int i, count = 0;
> +    float perc;
> +    void *base = malloc(TESTS);
> +
> +    for (i = 0; i < TESTS; i++) {
> +        uintptr_t in, x, y;
> +
> +        in = i + (uintptr_t) base;

There's no reason all of these couldn't be char* or void* instead of casting to
uintptr_t.  Nothing else would have to change.

> +
> +        asm("mov %0, %[in]\n\t"
> +            "pacia %0, sp\n\t"        /* sigill if pauth not supported */
> +            "eor %0, %0, #4\n\t"      /* corrupt single bit */
> +            "mov %1, %0\n\t"
> +            "autia %1, sp\n\t"        /* validate corrupted pointer */
> +            "xpaci %0\n\t"            /* strip pac from corrupted pointer */
> +            : /* out */ "=r"(x), "=r"(y)
> +            : /* in */ [in] "r" (in)

It's weird to have some arguments named and some not.  Why not just use %2,
since this is simple enough?

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
