Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp5742608wrp;
        Tue, 17 Sep 2019 14:31:15 -0700 (PDT)
X-Received: by 2002:a17:902:7282:: with SMTP id d2mr822539pll.88.1568755875142;
        Tue, 17 Sep 2019 14:31:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568755875; cv=none;
        d=google.com; s=arc-20160816;
        b=x0a2i2G/JXxbdMQSwsLvTNfMrvxAy+YG7aneABJ2YPxg2jnt61Wl6+Ui4GR0wJX3UR
         UTHVnA7YFfQ9r3q2KfQc0+pVxLlCi/uD9PLKh9LEXbpM/v6qaP384E2zrFrqJhAy7364
         W+K0KfLmpbT1twIr7HfHeuFdAAQ/+ZyVoo3Hr3t1dMa0wdfUnWzbNSDK8RdNFHyxt/n6
         yXCfQqCYbByAXbEGEvevNShOnVd+R2Y69CKZv7UrH2cDDIzPDn0KHDMyWje4LvBc1xUN
         uxxL7kkRx5oXJCG/qHDC16BLcaqERCJoXPWkWpFOZJ5Iz4uFXL5LKxjD9bal01s8u2lI
         1q+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=qPUmFy7nnfR4BPVnW0Iq/YrfVYfO4gvONfjfSzy1Vk0=;
        b=y900U1N/dloTp8knXaZi5OAESEz1XlxEZ/o6onHyyr4K1PeWeyQnJxvJKOazDd4zsQ
         r5dQNQAU1WiiPhFFozWFb5iLVN1cTZzOJ+Ucfc5AXXF+hD6yb5uFTJL1ABpsDycWULAw
         hB0rZ2DG1kTl5KGm8PyHuQGIM1wK+lnkjjZCe+jIZUHh4CpkMzXsaEEs7nEcH5a5UJ5F
         2norUgstwMUCj3U4GXhQAbUucFo5cKdPAziqueFQicwxguF8a4lWo0G1t2WIlDZbr2rE
         qWJamd7s/sKjwV1cJ4vGryFOdUnZ0cLMeUZdnIelP82RPC3CU167lmqof25Is8KcJZwr
         td2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dSfrIfCF;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id s8sor4484195plq.50.2019.09.17.14.31.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 17 Sep 2019 14:31:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dSfrIfCF;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qPUmFy7nnfR4BPVnW0Iq/YrfVYfO4gvONfjfSzy1Vk0=;
        b=dSfrIfCFlnPEuOaFeecweOgBko2te3tG2lNhXwM7HoD+t6D5ckiYZPiaXdFSR/Sjt0
         bXM1tuy1rjulI/TnAAJMFkVwuWdi3kLcoezfForRbu3kn6NAi/78yQ3e5hi7xuKz3jFw
         QCHwEU46A8GuKdwpJuopkN3CNLzu2bNRpkLj/MF6gy26bV8Rmrv6RecrF8XrYOTt/Apx
         7aXc34swEsv5P2cwWQffb2v/p7lzrU4M0D6I68IRC6RZwfbjF0eRkRCuz54G0sM/DOy9
         st8Fm5j+ZYUpm04R3W6ggLV2QEojPyC48d/Dy0fCjZTFXJFQgYS2Tia7UbwIiN5JsJSc
         loxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qPUmFy7nnfR4BPVnW0Iq/YrfVYfO4gvONfjfSzy1Vk0=;
        b=ESYSYow737ez9aBT3fQiaKYzP7iy1ye4i5JYgMeVWMUbYeBl3xY1FInwYQgun9m0rS
         Jf3gW2VYgRkeaVSS+6TN7X02KBUrxwC4b7DMWeTyZ4wD8Wlh56srb/nScMO3N+SM0jYw
         hoo/Yx20aEjzg0fUWuj3E+JRRxiDTwMXzcJVCkrrMcqX73y07ybgrlew9bEU16wsdeB2
         lFU0hiNw3Qw2MkWLmjdPW+kWXMcTmnIVNwC/kc3Jhq2XGxhYIdVlPokvSbRJVIx420e4
         Nxf+OHGgVHl4v3S8wQa+iAb2ghG/i2SAZuOE5Wu0ME1s/pSYIFI3V0I07LMDzhmkhCg5
         a1TA==
X-Gm-Message-State: APjAAAWgmc5c3pW/WZIhLLVVB6CgmPkwZx7KtyQ8QNSXfZPfl7iwuoYx
	RCgZVMeumSFFJKN5dhN44hV2QQE5S+EBIx8U
X-Google-Smtp-Source: APXvYqxycGZyP9EXo0dng9aO66nUlu3FH5wGlsCluKPx/wX9nyGzePwjIknnEVJvdKEvY1Yx1VzRrQ==
X-Received: by 2002:a17:902:bd97:: with SMTP id q23mr773044pls.259.1568755874644;
        Tue, 17 Sep 2019 14:31:14 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id s5sm3706620pfe.52.2019.09.17.14.31.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Sep 2019 14:31:13 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v1 8/9] tests/tcg: add generic version of
 float_convs
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20190917184109.12564-1-alex.bennee@linaro.org>
 <20190917184109.12564-9-alex.bennee@linaro.org>
 <73df6b9e-d096-f58f-dfeb-aad0c8e50d39@linaro.org> <878sqm1w0f.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <62cd0ee7-dcf3-7731-399e-168a02c1ccda@linaro.org>
Date: Tue, 17 Sep 2019 14:31:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <878sqm1w0f.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: /iyDk1JsfqLK

On 9/17/19 4:57 PM, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> On 9/17/19 2:41 PM, Alex Bennée wrote:
>>> +    for (i = 0; i < ARRAY_SIZE(round_flags); ++i) {
>>> +        fesetround(round_flags[i].flag);
>>
>> If we're going to make this a generic test, perhaps
>> continue if fesetround fails?
> 
> I ifdef'ed the missing symbols? Can the symbol exits but not be settable?

I dunno, maybe?  Perhaps based on the exact host.


r~
