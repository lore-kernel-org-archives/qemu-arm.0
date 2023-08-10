Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp767775ejc;
        Thu, 10 Aug 2023 08:48:05 -0700 (PDT)
X-Received: by 2002:a05:6808:de6:b0:3a7:db97:6af7 with SMTP id g38-20020a0568080de600b003a7db976af7mr101338oic.30.1691682485327;
        Thu, 10 Aug 2023 08:48:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691682485; cv=none;
        d=google.com; s=arc-20160816;
        b=Hf1n8g1ec1X4Fc7+t5te5lTtZ/cpFI7XEMe7sy3v3iy1/HZz2c4vDJX4trmZMYbrtU
         ++gP/YgCIwyJh0RHsAjsSrvGWdbFXEnnkodG8VqsQU3ZXHkdWbk6uFvaywaCBGp63xiD
         ODZjfSgHo586jnywxCuZljiiN08uTNh42ReoYxpG/0YO3tK+G6Lf6qmN8FpJQ8t+G3I5
         XI0X8BgbxRMfSA9t0V6+AgStk+mwEdDQq5+1VEvSricRwveixSVlGXPdqnGigyEzcOjC
         f56tGUG+02vJtrCsBv4cDcV43K6AL9cTXhbWD09sef680qUShzE6lkgZZUUXzgmLkWok
         c56A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=J/Ucxb3WSoVPLf997Na58DsmtEvlKSQcrIx6PUuqvrY=;
        fh=0rJWTZO+K/xkC8ROuHEDRt6D9sz7ASZ9XOSzgLP3ooM=;
        b=SDiLsc9j0HcJFKcrJ1tH6p6Wsc95J7k+PNVfKL++qY+SglFGkxeSFZqB794saWLabt
         hVbSqENrXzcjBE2TIpYi7LWLa6reL91W00IuZyan0RVFhrdinJH8lhTahMsLni25mTud
         ig6qxUpus1/NCJvMQbbX7RayHnYlbB8QoDBSrtD7I3kJBbeIHEZgBKSTH4e9/ZmjGBXw
         RTREsOiK6QzZ3vRFm5T7FkyR3gQAS+ZKrz3r1AKdaXc1wniJsfksJ6RL1TqLbRtU10iL
         f3SP3ACrBYfoxuIiiQ+Eq2lXheQxoh33zu/c01Rcl5RrO8AOsv7yeldAHUAYxaO67AMW
         zcYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CSfEc8o1;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id s23-20020a056808009700b003a3c77d4596sor935211oic.6.2023.08.10.08.48.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 10 Aug 2023 08:48:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CSfEc8o1;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691682484; x=1692287284;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J/Ucxb3WSoVPLf997Na58DsmtEvlKSQcrIx6PUuqvrY=;
        b=CSfEc8o1yWzFFidn/JW8AKYIUn5Bqlj9kYzEiAh3kUHXBnY1jRAVVDdMBc5H7NrvTC
         SYMCrvnUnPVtS4xUzSD5uDk27K5P827oExuN1NPXDlWno48q58KNKjdXJV13/y5sBYe2
         isDxBv+O9XlF3LUpqWLcecEy9fU6HSwZhMdMAHUZTXcQ+I6BSpl0c2nmIqACgTod3RaK
         66ZJ3V8Ov1Y5dO7WFqHy72u4fszMmtB+yPz/1jC4lFiRVXSmNWycRvpZghVhI5hiQmb8
         3oMcQZgtYRP/IUyIonRu+CF3t9KeVx6lQMAEFtrJdZFVRHfaBGQJ08q+ei+DAxDCJ+5a
         ghDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691682484; x=1692287284;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J/Ucxb3WSoVPLf997Na58DsmtEvlKSQcrIx6PUuqvrY=;
        b=hQPsZppuLfMz7Yko12EjnBwQ4Nx0d7vka4+/dyLm4S8Z1T+nvVYzT/LBY6rG9KSe55
         C4/Vf0a1Q6tvu6QL0Zn7h2dUUptPg7jB/IRJT2uTlLN18tw37oiTV5U05Vj0aL5PRtre
         6NSE3/vP6CpmhvFMLKdT5JN9xwiDT6sdF+5T3rtVzdQSuy4vqSAldzY0KDDp48fIzET2
         hkMFkZrnFEwPOQHKQs50UiI+mCy2gS2uKVD5F/1+sSIl//SemzCx6twUIAq82JMIztr7
         +vHXpqSRCGgh8Gi2t2A6JOqBVXX0sFDLE8MrWxVgIgn1PJVFESZYNB+/qOMQkEVk7BpM
         1EDQ==
X-Gm-Message-State: AOJu0YxyhEISyPRPlUZF//EZ0gCTpVz/YGyF/sR9r6Gl4F4g5EQriuDQ
	PlBaDntxnu+IxZX6K1bQIZqfHNTBwbPvJMN+BoBNfQ==
X-Google-Smtp-Source: AGHT+IEVJmw7bQFZ5nYjTCaMh/iRwLzuyEeJWZ5wpZcDyAjEetzu+xQQTlDj0jT+Al3niWerqqpl1Q==
X-Received: by 2002:a05:6358:52d3:b0:139:55de:329 with SMTP id z19-20020a05635852d300b0013955de0329mr2126871rwz.27.1691682484670;
        Thu, 10 Aug 2023 08:48:04 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] (tre93-h02-176-184-7-255.dsl.sta.abo.bbox.fr. [176.184.7.255])
        by smtp.gmail.com with ESMTPSA id f19-20020ac84993000000b004053bcffe49sm576958qtq.9.2023.08.10.08.48.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Aug 2023 08:48:04 -0700 (PDT)
Message-ID: <c2bc8d1a-87e0-4e7d-e4e2-99021b633da4@linaro.org>
Date: Thu, 10 Aug 2023 17:47:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH 5/8] tests/tcg: clean-up gdb confirm/pagination settings
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, Yonggang Luo
 <luoyonggang@gmail.com>, Beraldo Leal <bleal@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20230810153640.1879717-1-alex.bennee@linaro.org>
 <20230810153640.1879717-6-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230810153640.1879717-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 1xcy7cWotOQo

On 10/8/23 17:36, Alex Bennée wrote:
> We can do this all in the run-test.py script so remove the extraneous
> bits from the individual tests which got copied from the original
> non-CI gdb tests.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/guest-debug/run-test.py                         | 2 ++
>   tests/tcg/aarch64/gdbstub/test-sve-ioctl.py           | 3 ---
>   tests/tcg/aarch64/gdbstub/test-sve.py                 | 3 ---
>   tests/tcg/multiarch/gdbstub/memory.py                 | 3 ---
>   tests/tcg/multiarch/gdbstub/sha1.py                   | 4 ----
>   tests/tcg/multiarch/gdbstub/test-proc-mappings.py     | 4 ----
>   tests/tcg/multiarch/gdbstub/test-qxfer-auxv-read.py   | 4 ----
>   tests/tcg/multiarch/gdbstub/test-thread-breakpoint.py | 4 ----
>   tests/tcg/s390x/gdbstub/test-signals-s390x.py         | 4 ----
>   tests/tcg/s390x/gdbstub/test-svc.py                   | 4 ----
>   10 files changed, 2 insertions(+), 33 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
