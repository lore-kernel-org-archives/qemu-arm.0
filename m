Received: by 10.223.197.9 with SMTP id q9csp1122678wrf;
        Fri, 13 Oct 2017 13:44:37 -0700 (PDT)
X-Received: by 10.84.141.1 with SMTP id 1mr2427408plu.234.1507927477141;
        Fri, 13 Oct 2017 13:44:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507927477; cv=none;
        d=google.com; s=arc-20160816;
        b=rLuR9LJTaxJlqS4lLg8c8QFTubC+VhWd4cQMF1dMgRWc0Cvlg0GQVLChGJT1nEf854
         rawP/HtMMlCKoJMHdN9bECejR3t9qIyWpZuij6oNYenC+HhT96VeMyY+ZE3j4l2nEviQ
         bDGSY9F6jGFZLVmZ5wQvFWG9qLOwFiIZpeLqxIRb9edGwXn4yesRifwzeYX9naisTAma
         CZxOpw1pdZ4bHeLfYxGCPG1odfzLi7S9LoVP9PsZDpz8gNAPVTztzaCXj7wV0L1qUBu6
         Aem8FW/60CGHl4FmyjWdgB2qZYZbpe5WG1mKuZ1qXkR/saJAGO6/miI3Od52Hy7NE1cT
         np3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=QcuuUMGJ6UmxqQ0w5Rtsix5iiAo6YWWwLHjIyRBfOfo=;
        b=cs3xLmWy/+eI41FLet1bCRNuigXwYGKOoXKwJcStTJ4A6PRzONiQB1uduwYJxV2OrD
         1LK1shGTX3lHi+WVJaSLjt5mjAT9HlHRY7vSIE0RlKEYocG7dtCqr96FoIMSEwDLdboH
         /+lCnxU3XfpOi46lfjl/kseY4zBozlnHo46s/TqxaCsu8IK/m5YYYA7kCZhTjzWj3yZZ
         mXoq7rO2DHefIBTaD6Kn7jWaxXeDQXWV44Ak75n1h8nXLPz4mbYasOYaqJqA1430gOZI
         FAShxx6T684IILT3qWpJeVEVGbq5bZHuWGXtyXg1Rlsa4VKEbKzwi5yd2rY4uEHqU4hy
         gbvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HDeZwCwD;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id r22sor451560pfg.126.2017.10.13.13.44.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 13 Oct 2017 13:44:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HDeZwCwD;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QcuuUMGJ6UmxqQ0w5Rtsix5iiAo6YWWwLHjIyRBfOfo=;
        b=HDeZwCwDkstU3UmsXOrXion+ur9JmOnnUOO4cgi9qDPj3+qoqngvmZmMK5GzYJ0lN7
         sGGHuwOlDXjnkKTjGmlIeUCW8uTI/LUgDdfWKYF4H4oxhV5DavAsmHuplPaRPhIn/RbI
         UfY1wLT0tIx92QYuBiFb1Kag41RJHGMorxnqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QcuuUMGJ6UmxqQ0w5Rtsix5iiAo6YWWwLHjIyRBfOfo=;
        b=CACAWYgmzIdLX13zeXv9ys9iKQdH0k90OuPrIKJb+bX2HKo4S9BvzaibEc5mx9ee1q
         m/WThtQscjgSuS174zHFjWuB0UFBnnR4F8bkyrjP5EPvXLEo49JiZyw3/d+tsPI0KeD4
         Zc+D+NP4RR1n7vZl9c1Mmw0Dzu3w80jdSfL0Yrl0/Xy+Xe1N9uOD2Pq9i4+lUBtg2vVz
         pdv6/H+xYDO/iJNMPyI1qY7mWI8v3w7fSn5cJ9r5MqXgpnWL8sk8cnLYjrOiJNON1UbZ
         fXEQfsdFEMvFjS6WbZe7DdBFZ9X+GwqIgENCnOEEQxccf7OO5rMD4m7IKHyI1+vGHOcD
         qIyA==
X-Gm-Message-State: AMCzsaVWfiI3ze6XxEPku0g1JdW7TqF49PqwZm7LYfULGePHWxCbk9pN
	vpV48BB1SMU91GRjzESk+7gAty5/
X-Google-Smtp-Source: AOwi7QBmSt5nwxO9RCYrIYVUwSOqceL34aAWI9dHhT5SN+IZUyFz6WLQ20v7H1ACzjBa4fZHuzvADQ==
X-Received: by 10.98.197.69 with SMTP id j66mr2342681pfg.135.1507927476791;
        Fri, 13 Oct 2017 13:44:36 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from bigtime.twiddle.net (97-126-104-76.tukw.qwest.net. [97.126.104.76])
        by smtp.gmail.com with ESMTPSA id y3sm3623757pfe.68.2017.10.13.13.44.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Oct 2017 13:44:35 -0700 (PDT)
Subject: Re: [RFC PATCH 03/30] include/exec/helper-head.h: support f16 in
 helper calls
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 Richard Henderson <rth@twiddle.net>
References: <20171013162438.32458-1-alex.bennee@linaro.org>
 <20171013162438.32458-4-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e9bfb1d9-95b3-aca1-77e0-551e88815925@linaro.org>
Date: Fri, 13 Oct 2017 13:44:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171013162438.32458-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 3K2yGKnV/uzQ

On 10/13/2017 09:24 AM, Alex Bennée wrote:
> This allows us to explicitly pass float16 to helpers rather than
> assuming uint32_t and dealing with the result. Of course they will be
> passed in i32 sized registers by default.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  include/exec/helper-head.h | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
