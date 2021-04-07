Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp770873lfr;
        Wed, 7 Apr 2021 12:56:20 -0700 (PDT)
X-Received: by 2002:a62:55c6:0:b029:21c:4dfc:d6e2 with SMTP id j189-20020a6255c60000b029021c4dfcd6e2mr4280767pfb.60.1617825380062;
        Wed, 07 Apr 2021 12:56:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617825380; cv=none;
        d=google.com; s=arc-20160816;
        b=yXCaGixdKcvTyH8aJEmi6RDfjbRmqL+XjtDpfqyCqs0dcFtiRv7bE82XsgWctxHleQ
         yCBAl7KQ5JozxNOxrZacgpGWEggOOXiF6hKuGAttpHZfRAtfGqIJP6uB/B9D1YskgB4r
         OlgK2+7b22mfwjUAF6o5rTCAMy6YPmugFnw57rVCRe0wUTGyib0e7Qisz39rnbJRc35E
         DRIZwbLJ0NsDoXGDjyMwfIvP0/jVFtj3to55VbzD5cOZ7cEoSCKxSFuHjKlipp+dZt6j
         3bp3WBaKPSCXBZB8nhS9xvVgP9l3+szA2+kTSB+MnLcMsJ8X7wk9pEknJuzTFyXR7gFv
         x3XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=JuNeZjPrq3Xh3zpIYXdRVP983710tDIvvKzIgNNMesM=;
        b=k4JHqh+8IUaForTrxtz9TUl3uZFmrVU2Rt9z/1b6lx+NtMLpM3WyQ5saYD9vzM6shn
         AgcA+zAg+23+CsrRjaTiiaWpfCImBUqk7q9MBYfE/US9Ta2DAB736FDeYEKliUbRY7ea
         tR1HaeK9MjTRnICR3mGkHwXogdQ6wxiRO/3y3PoRhL7t33EJlB/FjThOqnYVeuOEgyHs
         NK2hZufl+j1FLrwCQxbjcfqB45cDbPxM6s8y1AULmJy4sKCax8vH0KcMfN78ruBn4cdF
         gyl3pYtxYolkr25U4KpcjTsm/sYLO1mCEah8UbP0J+AItMfqO1NSr/4AgZULMchZXgx7
         JlHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ciCjsiF6;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id b14sor5140820plh.57.2021.04.07.12.56.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 07 Apr 2021 12:56:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ciCjsiF6;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=JuNeZjPrq3Xh3zpIYXdRVP983710tDIvvKzIgNNMesM=;
        b=ciCjsiF6hAlGcdzuAHZeGCES/3Wh+RQJqyDCB4sUUpaB0IczQmK1E736ywIwPymGd0
         mP16XoLgrIGrviwKop3gn/E/Pner86tMr79bN4g2g9QQnwWcxqY073+YJrpzth6renhz
         o9YZhLczfRzV3z+oCaJ81zoWHC3E4NPN8xO9XLbNSrbdjWIYY1Fqp6jX8+zlkkSNsx5m
         wzmJaeiM4FCrQVd2zWEzccNzE7HiojxIvhHgc4zq50D7BxkKL+eqbHUO+EIfpXvQq0CH
         Iprm9mHK+oqo+V0+gRPnPrrfQU3YP7N+/eU3OsYtJL4lFasfuktWEWjaW6GChgvuXSJS
         3tGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JuNeZjPrq3Xh3zpIYXdRVP983710tDIvvKzIgNNMesM=;
        b=rBfCnjyolMVu44platWYZRVd5AvYP7Ca5O/t8/YWMbKPI6Vl2Rd52ixBLJGYtlU+fo
         M+H2lxh39Clx01yscHxYCevmiJZ62ufl0x5nUYuCSHFtjOlWlO4JLpm76vSxS0EFd64U
         xdq+jo+/F9EVLD+dxt8GfTKanQmnipnuBfPDKt372Cc45kvL9UQ6ZxNgHjtSikW+fVg/
         CLA0y2xnZP57ueMav/YDsYXdpCiUyqgWixVjB2gIAwqPSx56t0imPoa3oyv+M9WLVCmI
         7Z/SMmFgfi24clLoP8lv/P6RJkxw9kKqtvAL+xYhblXWFMy1c+WfB2+9QsIi0lYzqjos
         +R0Q==
X-Gm-Message-State: AOAM531N+aQMklS9AdgFNjxTccVXg1RxwkYcQde6o242X219duDcmvKs
	VfPADNClGV2OKq+PWOgDtoSMMv5/VpScA3S8
X-Google-Smtp-Source: ABdhPJxqxE0Ej/11FHaf+F4rFGwlRpSDOg1vRUm0bJOIfYcvl2WTbg+yyOqRwnnWQMJ4IYsN1MyKUw==
X-Received: by 2002:a17:902:6b02:b029:e9:8e2:d107 with SMTP id o2-20020a1709026b02b02900e908e2d107mr4408126plk.61.1617825379496;
        Wed, 07 Apr 2021 12:56:19 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] ([71.212.131.83])
        by smtp.gmail.com with ESMTPSA id c9sm20725420pfl.169.2021.04.07.12.56.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Apr 2021 12:56:18 -0700 (PDT)
Subject: Re: [PATCH v4 03/12] target/arm: Fix mte_checkN
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 1921948@bugs.launchpad.net
References: <20210406174031.64299-1-richard.henderson@linaro.org>
 <20210406174031.64299-4-richard.henderson@linaro.org>
 <877dleuds3.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ade8e2d3-e1a6-3b84-7850-ceb4bcd59758@linaro.org>
Date: Wed, 7 Apr 2021 12:56:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <877dleuds3.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: P76rzJ0FQcOy

On 4/7/21 11:39 AM, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> We were incorrectly assuming that only the first byte of an MTE access
>> is checked against the tags.  But per the ARM, unaligned accesses are
>> pre-decomposed into single-byte accesses.  So by the time we reach the
>> actual MTE check in the ARM pseudocode, all accesses are aligned.
>>
>> Therefore, the first failure is always either the first byte of the
>> access, or the first byte of the granule.
>>
>> In addition, some of the arithmetic is off for last-first -> count.
>> This does not become directly visible until a later patch that passes
>> single bytes into this function, so ptr == ptr_last.
>>
>> Buglink: https://bugs.launchpad.net/bugs/1921948
> 
> Minor note: you can Cc: Bug 1921948 <1921948@bugs.launchpad.net> to
> automatically copy patches to the appropriate bugs which is useful if
> you don't have the Cc for the reporter.
> 
> Anyway I'm trying to get the kasas unit tests running as a way of
> testing this (and maybe expanding with a version of Andrey's test). I
> suspect this may be a PEBCAC issue but I built an MTE enabled kernel
> with:
> 
>    CONFIG_HAVE_ARCH_KASAN=y
>    CONFIG_HAVE_ARCH_KASAN_SW_TAGS=y
>    CONFIG_HAVE_ARCH_KASAN_HW_TAGS=y
>    CONFIG_CC_HAS_KASAN_GENERIC=y
>    CONFIG_KASAN=y
>    # CONFIG_KASAN_GENERIC is not set
>    CONFIG_KASAN_HW_TAGS=y
>    CONFIG_KASAN_STACK=1
>    CONFIG_KASAN_KUNIT_TEST=m
>    CONFIG_TEST_KASAN_MODULE=m

I built it all in:

CONFIG_HAVE_ARCH_KASAN=y
CONFIG_HAVE_ARCH_KASAN_SW_TAGS=y
CONFIG_HAVE_ARCH_KASAN_HW_TAGS=y
CONFIG_CC_HAS_KASAN_GENERIC=y
CONFIG_KASAN=y
# CONFIG_KASAN_GENERIC is not set
CONFIG_KASAN_HW_TAGS=y
CONFIG_KASAN_KUNIT_TEST=y

Then I just boot the raw kernel (no filesystem or anything):

./qemu-system-aarch64 -M virt,mte=on -cpu max -nographic \
   -kernel ~/linux/bld-aa/arch/arm64/boot/Image

There's a ton of output, but at the end I see

[   11.901185]     ok 48 - match_all_mem_tag
[   11.901422] ok 1 - kasan

just before the "VFS: Cannot open root device" panic.
Which has done all we wanted, so, yay.


r~
