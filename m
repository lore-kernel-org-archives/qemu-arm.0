Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp325031ejc;
        Wed, 25 Jan 2023 04:13:33 -0800 (PST)
X-Received: by 2002:a05:600c:3ca6:b0:3d1:caf1:3f56 with SMTP id bg38-20020a05600c3ca600b003d1caf13f56mr39535299wmb.9.1674648813230;
        Wed, 25 Jan 2023 04:13:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674648813; cv=none;
        d=google.com; s=arc-20160816;
        b=PFiTJdILmEc+r57RNMzdm+Bf+tmdx25vkINnVnJBOpYeqwu7EAkENLpw+ICEUYyhmv
         aYudKTBsO5sjaJf6jj2Tov2yM7kmUQETzz5M9jiWtedpvHzQtS8c4JIJuMUcL/Hh/e9F
         4ZzHNTy2vQBLWvIWqAFL8ydMSC9FQpEZXUzdRHUl397aGn7WLu3Lmw5WttCqTsmRwVzv
         0zoeLy1/0jUxm3L43OKFD3nPgvzmrWO6Jw241P76e4NfkklwBSSqu/ZalpbbPWzvtJIu
         u0lDOFs28fIJcmL51iOK3O3Z3PG0HPONGKj26qcgmyhGAZySBBtPwg98sZqlon7wb0xN
         D3Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=sShDAfh4wCk++nUzxpx2MlGatfM5sHj3Ubi3Xsma1Vw=;
        b=h4A9UsdRLh7gmHn6LInz9ADjAeJBXtYp+BujUgbH1O+XxHZ61ZpGaNWg9O+QNtmO8h
         9O+UXd8bLUtyBqcDjiU/dZ9bNhBiKY2Zs/4PtU4ZceNPO2K6tiUTKZ8SKR/xYm26wO2/
         9F8cmEu0VgPgRsq0wSVf49Eh3LiKn+euyM0WEHm3CAt01JXXZIo5p5d0XnUrzv6kz+/0
         cSOE02w0xX6N3u12PuQsE1NzhTmiZwn9LNsr+Y8pN2BIBrCCgheS9Ai4p+7XHRfNTQjF
         MxxA2uQPo6uqzq64YSlnwoqD/vudbFK2YX6ae6xy+ekyjAOs3+5y0iGE2hJOPbC58lfC
         Uqgw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XtpHSS79;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m21-20020a7bce15000000b003da27da92a0sor553524wmc.39.2023.01.25.04.13.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 25 Jan 2023 04:13:33 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XtpHSS79;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sShDAfh4wCk++nUzxpx2MlGatfM5sHj3Ubi3Xsma1Vw=;
        b=XtpHSS79z27Y3+hBIyUrX9JQjbp6BtvJXF7sD+bbgzHrO8czO4BHpbbkqQiZUIkua0
         fJR22bPZlA3v8u534DCN/9ZRY6aBJXgfWryU6ygghfET3OYR3yadR9tFldL4EGQVH/fH
         thDX4oR38Wm3S+BCd9CaoM5riTOmj/rSjIntTVjICNGQ7H9oAXiMtoEwX/2X5j9eDxaZ
         Pq5Iq9U3uAyBO4tobFPOYSlobkNzqZrZo0KTwUZSZMTHONtPmLpnqmVIIp38R6HhUWDo
         mLgP2RZth1JNeLHdJch1gmSC7qJaE+GhbKYnFw7uIrr0VXunwpYrM19M2438diKsK2+k
         VdLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sShDAfh4wCk++nUzxpx2MlGatfM5sHj3Ubi3Xsma1Vw=;
        b=TjM1sUzXTimuBKN3JsWRDu3KydxICxrivOHWTQjyKlmRMy4OOGEoitN22F19Uo4uCP
         BAqPESkoZkMAqjrOeaazHA0mYuc2E2jNsNIfbRctO25J95ARyEkjg21Sa8E6O8qFmeiB
         EV4LdmA/ppGUfPwbu4FlcuF1X40ZryeMzWM5nbFABBnzugwX5y3L2Ukfb1ZgeXm60mST
         uZ06dkelKssSJSWKai8pjrr8xcMxaaRiRvNuGjhlpCJztJXwfYIdYFs/rO6D4j8xV3uQ
         uK9MLlQiVRQxJW2oweTJ5lRmjPLKW+7DxfdKhki1liS6KthjTVbrwTtznTjtfBDNiiMO
         qZQA==
X-Gm-Message-State: AFqh2kqtrQENM7SVfbzEfxY7xKnFyrNjuugSkO9enyhjL5N/TkQrwJDR
	7RjDDWgEJBYUPn/tJjmPSMIGd7vO1mMuJZmbGj3aEQ==
X-Google-Smtp-Source: AMrXdXtq+OysoLRemTlkKJvxDO7oSbjpYDp31s8jXUKLHHXw/pVvrHi4L9YtJo9WyhtBPJQsS2HZyg==
X-Received: by 2002:a1c:cc11:0:b0:3da:1d52:26b5 with SMTP id h17-20020a1ccc11000000b003da1d5226b5mr39203445wmb.14.1674648812677;
        Wed, 25 Jan 2023 04:13:32 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.0.114] ([196.77.22.181])
        by smtp.gmail.com with ESMTPSA id bi24-20020a05600c3d9800b003d1d5a83b2esm1638781wmb.35.2023.01.25.04.13.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 04:13:32 -0800 (PST)
Message-ID: <ff816fa5-3f81-f1c7-7712-8d35c82c8b9b@linaro.org>
Date: Wed, 25 Jan 2023 13:13:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 09/35] gitlab: add lsan suppression file to workaround
 tcmalloc issues
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Ed Maste <emaste@freebsd.org>, Thomas Huth <thuth@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Markus Armbruster <armbru@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Bandan Das <bsd@redhat.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Michael Roth <michael.roth@amd.com>, Eduardo Habkost <eduardo@habkost.net>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 qemu-arm@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Li-Wen Hsu
 <lwhsu@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>
References: <20230124180127.1881110-1-alex.bennee@linaro.org>
 <20230124180127.1881110-10-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230124180127.1881110-10-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: t8r8ep7tF/Bu

On 24/1/23 19:01, Alex Bennée wrote:
> The up-coming upgrade to Fedora 37 will bring in libtcmalloc as a
> dependency of libglusterfs which confuses our fuzz run. Rather than
> disable the build lets use LSAN's suppression mechanism to prevent the
> job from failing.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   .gitlab-ci.d/buildtest.yml             | 1 +
>   scripts/oss-fuzz/lsan_suppressions.txt | 2 ++
>   2 files changed, 3 insertions(+)
>   create mode 100644 scripts/oss-fuzz/lsan_suppressions.txt
> 
> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
> index f09a898c3e..9a6ba1fe3b 100644
> --- a/.gitlab-ci.d/buildtest.yml
> +++ b/.gitlab-ci.d/buildtest.yml
> @@ -511,6 +511,7 @@ build-oss-fuzz:
>       IMAGE: fedora
>     script:
>       - mkdir build-oss-fuzz
> +    - export LSAN_OPTIONS=suppressions=scripts/oss-fuzz/lsan_suppressions.txt
>       - CC="clang" CXX="clang++" CFLAGS="-fsanitize=address"
>         ./scripts/oss-fuzz/build.sh
>       - export ASAN_OPTIONS="fast_unwind_on_malloc=0"
> diff --git a/scripts/oss-fuzz/lsan_suppressions.txt b/scripts/oss-fuzz/lsan_suppressions.txt
> new file mode 100644
> index 0000000000..02ec0a6ed5
> --- /dev/null
> +++ b/scripts/oss-fuzz/lsan_suppressions.txt
> @@ -0,0 +1,2 @@
> +# The tcmalloc on Fedora37 confuses things
> +leak:/lib64/libtcmalloc_minimal.so.4

Maybe add a comment around Fedora37 in tests/lcitool/libvirt-ci
in the next patch "see workaround in scripts/oss-fuzz/lsan_suppressions.txt"
so we remember to remove it when updating again?

Otherwise,

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
