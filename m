Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3154221wrg;
        Mon, 13 May 2019 11:46:32 -0700 (PDT)
X-Received: by 2002:aa7:881a:: with SMTP id c26mr28169021pfo.254.1557773192822;
        Mon, 13 May 2019 11:46:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557773192; cv=none;
        d=google.com; s=arc-20160816;
        b=BFNf4GHVVMDZR4qtjRfRRn0c16QtQPBbNYP8DU23j+iCORlb1mt36zEVRYXrBkGLQK
         PoYgrzPK0UcUKkatbjaDaoxnOBTbZyQoP4ZoBvFri5Krw6BBmmfdO5inOWR2vnpyah8y
         vGpoJfzsoac2IXFy62MufLdSTjZs02UQPF/wa0cYAezoGQUbIeCwS2juwMxBqXC4SHlt
         bRcPglLa5Q2hk9iRBgICfazs7unQHNW73HwM8ULybPKNhuuq6RR1wAd+4xLlMyVMrK9B
         /BPn1PrHMMkKu5MSlKAjXO40jstNkynFaTGElXv123K42BKCJYLAnryRU4MA2T1iHH1j
         12aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=mfztUT8HThQnL4EPiJVtdwKXVUVQdkxXqoa2KIl4nV4=;
        b=SRNvGeHhbT7QsNFJSs3rBlLwgOFHogkZpwM9Yg0VKTQvp4rvQHdJPCiUAjr1VPXLcK
         4V8e3yTUjcbbAddU976uo+VPqR5jDTxXxA9ojrTOjSnSCDgSntCz28nUIRzH6LY3ND7Z
         V2R7p76JkmNzuFMAuvF1j5boZRLAX6g5Q3DzyC8KMAWcHsmj5mWrXmKTWUlpiO9UUtru
         GYyGHqQ73cuRonZh0ecFwIGBDICL5bmzMQ9BTdW1q2wO8rgwO9einRtFCJSiqPzoGgDM
         xIsCXCkw3P6rcaUSA3I3fe0JgJdPtQcQ3mY2PtJ8IAPtuM4m39nPbuaQPjqsF/QJfIGd
         A2Ag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="i/VFDbkM";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 2sor15228931pga.27.2019.05.13.11.46.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 13 May 2019 11:46:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="i/VFDbkM";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=mfztUT8HThQnL4EPiJVtdwKXVUVQdkxXqoa2KIl4nV4=;
        b=i/VFDbkMoQMJoX6pEeyVAe8gvd+PLxjrK9EEd0yaRjTN19LXINYNbiLCOdA4oN1sxF
         4I/Li3TAC0YQu3sRb82FoCTfA5CXvhZz5CYmv+U7Zoy/BSE8f30eCfv/q0dZies4KDHH
         Hnta+8WoZTWbXmD7Ck4605xo0No7Qg/VxbrnarbwFh+V4Otv4mQP/VrOpLgf6DIDEnTD
         J5VGAd9FrnDxp5MTrcPVTpT7gnMzmbjn4QAjz1fDowvAzDtxVG1lJ6M0rjOshkxoTfZP
         +viWE3s1xcV6yo+tfIKDjrBlUoospK/HggGXGO1fsdDRcVlWXgXSoJTcFujtBvbQJqWc
         KXjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mfztUT8HThQnL4EPiJVtdwKXVUVQdkxXqoa2KIl4nV4=;
        b=ZtYHZSERRxlUAIWSZSFMFnsIy4Ubi7sNhK1i/mPcp5FamK446ordmsYnguDdBN0G9o
         fT4OGMxSZZR62QlFwoT2zlydrYwMtXwVshf5zdeTcnqJWfqBDP6GIp5C5LKbyKGiGk5Z
         8rzQ6bzySD3/SwSrbZWFFDnGs0KRPihf2XB4IDgrXkuSjnijTInDNn+R/Uxjqi+lp16+
         lh0wjABukNQBCXI8/xv1c3Ne6dlH4upZPibV/qmoNAPRd14uA32r2HSxD+ZSpp+0dnI9
         1iAj9Wfoe/Ap+PMBDz+olDhUBdC3kcAlTf6UVdfEYy/j6rYDOYbP0mj6hKEFTnYvBRAq
         hd5w==
X-Gm-Message-State: APjAAAXeQN6SMcWR6k9X3UoUo8mf8Fa8Kq/pB6zL6jnMnXyujAhUmae0
	AKzuAze6lq9Y0+fla0Jsb2W9VPQH8k2lCQ==
X-Google-Smtp-Source: APXvYqzeGm6Y0Hi9OkOkxhjsX58wH4dH6UD4wYD+cmmIFZU3uyMZVni2lFc2S3lh5plE/x6eVCwdOw==
X-Received: by 2002:a63:1a42:: with SMTP id a2mr32676995pgm.358.1557773191927;
        Mon, 13 May 2019 11:46:31 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-13-231.tukw.qwest.net. [97.113.13.231])
        by smtp.gmail.com with ESMTPSA id m123sm25519294pfm.39.2019.05.13.11.46.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 May 2019 11:46:31 -0700 (PDT)
Subject: Re: [PATCH 00/13] target/arm/kvm: enable SVE in guests
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org, armbru@redhat.com,
 eblake@redhat.com, Dave.Martin@arm.com, abologna@redhat.com
References: <20190512083624.8916-1-drjones@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <fa220ee2-b4bc-cdfa-ddde-90206e417cf3@linaro.org>
Date: Mon, 13 May 2019 11:46:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190512083624.8916-1-drjones@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: 5yTZw81VaZ2N

On 5/12/19 1:36 AM, Andrew Jones wrote:
>    CPU type | accel | sve-max-vq | sve-vls-map
>    -------------------------------------------
>  1)     max | tcg   |  $MAX_VQ   |  $VLS_MAP
>  2)     max | kvm   |  $MAX_VQ   |  $VLS_MAP
>  3)    host | kvm   |  N/A       |  $VLS_MAP

This doesn't seem right.  Why is -cpu host not whatever the host supports?  It
certainly has been so far.  I really don't see how -cpu max makes any sense for
kvm.


> The QMP query returns a list of valid vq lists. For example, if
> a guest can use vqs 1, 2, 3, and 4, then the following list will
> be returned
> 
>  [ [ 1 ], [ 1, 2 ], [ 1, 2, 3 ], [ 1, 2, 3, 4 ] ]
> 
> Another example might be 1, 2, 4, as the architecture states 3
> is optional. In that case the list would be
> 
>  [ [ 1 ], [ 1, 2 ], [ 1, 2, 4 ] ]
> 
> This may look redundant, but it's necessary to provide a future-
> proof query, because while KVM currently requires vector sets to
> be strict truncations of the full valid vector set, that may change
> at some point.

How and why would that make sense?

Real hardware is going to support one set of vector lengths.  Whether VQ=3 is
valid or not is not going to depend on the maximum VQ, surely.

I'll also note that if we want to support the theoretical
beyond-current-architecture maximum VQ=512, such that migration works
seemlessly with current hardware, then we're going to have to change the
migration format.

So far I'm supporting only the current architecture maximum VQ=16.  Which
seemed plenty, given that the first round of hardware only supports VQ=4.



r~
