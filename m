Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp2130866lfa;
        Sat, 5 Jun 2021 09:32:01 -0700 (PDT)
X-Received: by 2002:a17:902:34f:b029:ef:3d14:1c27 with SMTP id 73-20020a170902034fb02900ef3d141c27mr9951185pld.65.1622910721300;
        Sat, 05 Jun 2021 09:32:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622910721; cv=none;
        d=google.com; s=arc-20160816;
        b=sQojDBEMr7m2gSKq2JsqfE33B/HP1wO05iyyvFV/ZR8tetNu0cRhGC0L66ujqO9qtE
         YG+aR9s7ZdAwW5aWTAh+Myb8pp3nguDMh14faJ8whNzWEXE4R4fgXIYx0QeJ7643lnQg
         kW9U+0xAryn6nIVjZj5xkeJc4wy1fLA+kF46hlOvIc22VTVOu0eNt5qYiErNt4Nhmem5
         JWh6N3Lxv54AlwrIuZJjKDpHD3PNdxssJVAYnxNQKbi4z5CyZui28GnZsKoQSrlhUFMx
         kpltZdRoqzbnjdWcxn5VAmGLDqzmjJXkPkzCz4qlP6FyXYaY90MkLJcd6wZDH3eW9BYI
         /WMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=KwV/Cpcs2rkQMsstrqA0z+o8gRGA7Zs5z37jtMdv4E8=;
        b=d4Y8FQ9TqPgceUGdBKcYD4d6C7HCkkOlaGoYTyMutkiGATtD2C378DLjt/jFGtxZWI
         TDcAhl6NEB5wDxWIDzz05W+HTpb3lPjizwmgGszp1lJN7TGeUJcA5mVrYaiAX14IGcJP
         teQWM5VL7jfFBC8dei2mBqT1A0yX/MhajcpsNlsngTcOzkVGmP8Il7xEL1yMaPy8uc9V
         goDs155lTKZ/5Wh7n68JsbDnwp3maVoNcMqgsud0wuQ4GYLl2Udv2fO1I27ntZrWPZzw
         C2NMCJYEnT8zwZbw/6kRHYoSUHELSHNSuXwcv6ZPVwbsmwJ1ujGX6YiLC31PkVBcZydc
         ZIFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BTrehXey;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id oc16sor5311846pjb.1.2021.06.05.09.32.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Jun 2021 09:32:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BTrehXey;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KwV/Cpcs2rkQMsstrqA0z+o8gRGA7Zs5z37jtMdv4E8=;
        b=BTrehXeyFbTqRnjh2fU8uTg2fdxtKOUXh/gWPrTBrPXLKybyXrJzgrGvAt9+oF41h6
         kvkHl8tJbC23jwVXxwdh6yGPRsrM8nkzQ6mUg3YC69ssKIwto7HpUE36boec0wVqTzoj
         5AUWzyKUKynh+G9WbA4bGIURKEjSjmHQg/LGqUZqeTNVhiGNM8a4kh+WiKbJYyU7hrnQ
         PxNrYRxA21Ih7n53RzpcS+jMyjhnyyYOAgSxbYGC0J0NAzL0pauRXxqUrLcoVn07K0VF
         8YXE55lPfdsq9vCYMxSqCwoXVFo0tKIqI75AjxEXEHlwe9gnw8G5mxwoGVxyUs5oz6wR
         KjNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KwV/Cpcs2rkQMsstrqA0z+o8gRGA7Zs5z37jtMdv4E8=;
        b=mrIMTPcyLIxPMnqozhJXwFcIpkU+BcJ+o8TYeBCq1WVf+YvYA73pA5rk0VrXZFuL43
         dQzcrhqCcfh73NxbLa5H02FtOI70sOycg9I0MM/5N+jBTsO5ok2maOP+MxD4g2slKDuA
         gyKg3aVZuo5UH3AwtVUExm8ZqqFy+neIitaX/Vk/wn4QNzR3NS3z77GJzePAe0QGbx3U
         qK9fYr/53VLBu+quuklt3BtukYQcZTjW0OMJ6zt4DdTAEzmjNmaF1HNbXhsYH9jqagtT
         yCBQhEzFMorYl032pvT1SuwVvzWltFAP/WJFsMcjkoLgwbaQ9YHW9WEaKEVdzRkHUbPV
         Yb/A==
X-Gm-Message-State: AOAM530WcMq+B8kO/qpu1iXJW8B+3cqN7ctYZYb8LPwJhlQWrZFwKQTl
	wEw6ZUT22B9jUxwbZhh9gbdUVf1q
X-Google-Smtp-Source: ABdhPJx1786grwM0/LH2BLPmWZV35vqWeVLjHopLD/3pvRrdHGvPMSdYOUdgA48spVf6/yFApVv1WA==
X-Received: by 2002:a17:90a:3801:: with SMTP id w1mr15779252pjb.138.1622910720745;
        Sat, 05 Jun 2021 09:32:00 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
        by smtp.gmail.com with ESMTPSA id ei10sm2575537pjb.8.2021.06.05.09.32.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Jun 2021 09:32:00 -0700 (PDT)
Subject: Re: [PATCH v16 65/99] tests: device-introspect-test: cope with ARM
 TCG-only devices
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-66-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2d9bcfbd-5921-dd44-f959-9ab1ec484eb7@linaro.org>
Date: Sat, 5 Jun 2021 09:31:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-66-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: O7H51Q845Hj9

On 6/4/21 8:52 AM, Alex Bennée wrote:
> From: Claudio Fontana<cfontana@suse.de>
> 
> Skip the test_device_intro_concrete for now for ARM KVM-only build,
> as on ARM we currently build devices for ARM that are not
> compatible with a KVM-only build.
> 
> We can remove this workaround when we fix this in KConfig etc,
> and we only list and build machines that are compatible with KVM
> for KVM-only builds.
> 
> Alternative implementation provided by Alex.
> 
> Suggested-by: Alex Bennée<alex.bennee@linaro.org>
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> Cc: Philippe Mathieu-Daudé<f4bug@amsat.org>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   tests/qtest/device-introspect-test.c | 32 +++++++++++++++++++++++-----
>   1 file changed, 27 insertions(+), 5 deletions(-)

Similarly, qtest_has_accel.

r~
