Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp3639550lfg;
        Wed, 26 Feb 2020 14:50:39 -0800 (PST)
X-Received: by 2002:a17:902:ac97:: with SMTP id h23mr1558145plr.237.1582757439132;
        Wed, 26 Feb 2020 14:50:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582757439; cv=none;
        d=google.com; s=arc-20160816;
        b=nuMZJnDURPCtZ9im1GSbo2Sx7nBJAfTfjfsqF1eIA1ZaBzp8shP7NWpFWRWSbRm7IQ
         WNIgDfbpCt2TH0Koe1pKvBVN48BxJoQVD+AHl+B5GtwKpQuA+T344MfB7iNNuvFgheY2
         fm6TxOB9lZJyck7icRcRmPi67a6BGcqlL8G+Am5tyQZJxHjOMgu+r6Mfyej/n/kVP1cN
         7a9O9JSSBglWgYiC5SClr4sNhGDf5kdTrYUpcAmmfMzHHZVsi5+jPL87OWt0HKkZXza2
         iHRz0yzbD3pmzycAuuJAhegZ3ugn4L+Ots5t/YrY0KTElVYWyvwi4ZC5F84BoivgRIDK
         AjbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=sp6GJyMSnGPLydKSQZ7pqUrPJYMkzVHdQBjQJtq3eF8=;
        b=Fq30eR/YXXPuJcH0yeehbMO1K+uGEQL492pYMKnYRO3VzeFAu+BC8BZhGyPFH+wH8r
         loaDUOxqbQYVdxRCHUzxmuwoWJFSYCHmPkXNZYCm3ZWnN0FDb7UW9XLSW7sYfoe3wYJQ
         6kt+0oKhn6dYBQikv/8+9i9lI/macQ7iAhiFkHfRrMgG3uK2Tmuza8mTYSbdPGeQvTuK
         w3ZyQ5cLpEHtNG80uMPFEryXz45R2TvaNEHzUjdIJ18z1EAUnL1SP3afH7Br3e8+16Df
         2QG71760gMKZPxK/6iOkboe8M22pfRMyJkALvQDiitummO9LS4MQ9Q6pb3sdLXRXG95u
         JCBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pRLRVQ4m;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id hc7sor1054488pjb.5.2020.02.26.14.50.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 26 Feb 2020 14:50:38 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pRLRVQ4m;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=sp6GJyMSnGPLydKSQZ7pqUrPJYMkzVHdQBjQJtq3eF8=;
        b=pRLRVQ4mDh40cJEg/zHdyNwVzdr+y6oEmgBIw69g5yE1AFIPAjbyMmVl9v6NgDrla0
         NZfTQtz4LFfPN4gvZNha5SrabXKFAzC4xikwbEhU74u8k144taeZxjOpZOgN6fQvMVgU
         EsMPYt8JJlRINZXXFZx2UslT092SyYDLB2wL0yzgi/MiB9tPjSArl5RNj2fk+OIT/V3g
         R+yprZV/LpOfCJaRbn6w6TkdO7M0794ckO8+Cf1FTT0I1PzV3MzZiL0u9I+tNRLQcNGU
         ApYP0FiWwmLXP4AvYLAbWcymgca7bneTg5R9qcazc7gTzozn4m1I8kSlTOOJbgTo6HSn
         5eWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sp6GJyMSnGPLydKSQZ7pqUrPJYMkzVHdQBjQJtq3eF8=;
        b=QKiEWeNXgS5lzWjxDh5RMcXWY4l5f1J9u3Hs7vKav8GWFfli1yg3W9GfgUw5ICLNz0
         o9kvDQjrTl7bCf6imgmaw2YJk6Hv9SmcLjyhyVhs3jngiLcDnfhHGBffNXcBOCFdWBez
         gRSLWI5t8tDtMNgPcEGR1+Q/RlZJ/Qf8w4HKV/eyff98mR65aI1/qwYeWSDgZkHZBi3f
         Cyx6uXjf+GnwQ5OyhA3y0gfLw/QeM61ZmcmHT80e8qw4WyskoKuDAIwGkvXW5kF12tWj
         WMp+k+YlQkXpAhC7h3fpXtGol6FfsVmWESTA/YlV2WWv6HY523lgT/7ZqeYo3weCsmuo
         SXSA==
X-Gm-Message-State: APjAAAWAQoOr2i0QExlrBArzk08U5oEPlzqcXjB98UJlb536XUnA4G4F
	m840DdUeH2oD7iTzs/T9aOQEPvJa
X-Google-Smtp-Source: APXvYqzsM2XauNpgrezmHcXs+XV3GG29HyIu0RtH7SdkvIh6qP8MfEv3/o+6SXRFzAtolBMab6zSDg==
X-Received: by 2002:a17:90a:330c:: with SMTP id m12mr1494892pjb.18.1582757438494;
        Wed, 26 Feb 2020 14:50:38 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id n9sm49272pfq.160.2020.02.26.14.50.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2020 14:50:37 -0800 (PST)
Subject: Re: [PATCH v1 3/4] accel/tcg: only USE_STATIC_CODE_GEN_BUFFER on 32
 bit hosts
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Richard Henderson <rth@twiddle.net>
References: <20200226181020.19592-1-alex.bennee@linaro.org>
 <20200226181020.19592-4-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <902c34be-37c9-0d26-5d72-bba12b0ce8e4@linaro.org>
Date: Wed, 26 Feb 2020 14:50:36 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200226181020.19592-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: O0ntkx5ocfY+

On 2/26/20 10:10 AM, Alex Bennée wrote:
> There is no particular reason to use a static codegen buffer on 64 bit
> hosts as we have address space to burn. Allow the common CONFIG_USER
> case to use the mmap'ed buffers like SoftMMU.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  accel/tcg/translate-all.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
