Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp4413828lfg;
        Thu, 27 Feb 2020 04:56:49 -0800 (PST)
X-Received: by 2002:a62:7f8d:: with SMTP id a135mr3986261pfd.237.1582808209355;
        Thu, 27 Feb 2020 04:56:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582808209; cv=none;
        d=google.com; s=arc-20160816;
        b=PAVIBUaIbuEEZuy1IFNaaXYLf4lwy3AhvAnz7Gcs2VpKy0W9ppwwLCKh6YC5Qriw6y
         cRtdLp4/BhBLmkrPGRvTYOX0Spa01tkmJ8fpXFVc27C+ZjsVaFoYoY3ltBstDqmNmhoJ
         mOZwVFmHVeJSKi4bizx1Iinxq4bkqRlThi6hf60xKkeeS5lvP2hugkDo3y4fEyh32x2w
         elAZzbHMvoujQw6+ZIUCA7/eZY52ESUzEw6vzzTNyaBgipF6+RtsGVyZQ3/qTfd22PzN
         Y0EUgx0kFFmpsovkOTwRh4cLTubkjxmOH7YYuM3liSUMFtX+2IDtnImqDFmXgcP/l+rG
         tU6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=/B8hMISiRy/G+ie70axEz69LfXSiPbJHtnLMgBPq6eg=;
        b=OscykYZGml7nj+2LPtwSyz+sjYKt1/HlRoWNSIxohD5ts5tkSAdcU61OTxKXo8gXSH
         xSY4ppFAL+nZ5xJ0spsJzPWd/Idd5eDAQEBTRlgCQfMnnOV00oxybrrElIh6ZrLqyeOO
         G11fk0XrnJBRjiHDzg4Gz2sX2UFeTTDUhMBXidWI6sdWOgS5BRbZIzp/+8mwJUxM/+pf
         iGstTT08EvaOjCc/VvgUAUALRcciidsmiesuh34gIVb3ZoVmmPf7ISoGDLmwATYD/I37
         Po3XyxAWjqymxJv/mHSYtS25NO9aNI0eIWpHaeni5o5u25E+I771kx6WWuEI+SWtiGMc
         u+0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VGLKRxU0;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id a3sor2884863pjv.15.2020.02.27.04.56.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 27 Feb 2020 04:56:49 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VGLKRxU0;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/B8hMISiRy/G+ie70axEz69LfXSiPbJHtnLMgBPq6eg=;
        b=VGLKRxU00rdRUdhqCIl80Vx2QfBQ5huxdqzXTs5oj91RnOMTaf9JLesXXsAS4Eq8gN
         Snq8pLC74g22kHA99/tQyNROnLssNbw9rDnLK/gwEvQYZORbfW9oumt2wrJ+sVduxtyj
         AH7pdlcVbhsC4dhQoQlY8P1sos1RJOuPwchtEo+QtP4wGrYSoQU7fFMM4d4YTucH83il
         57tyLn3W9bV/ZnwHdhdczhVCoaRRLtQemTYdRH5YCvHpVu3BWOtrSkC6HnKlUuVQjd4+
         iVDgBLFz4iEpPIwGPLadFvTWiPEY6E4rKhJ6iFdvTdwFn/vc3tFt71GdwnAQHq1SUvc5
         EfvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/B8hMISiRy/G+ie70axEz69LfXSiPbJHtnLMgBPq6eg=;
        b=PjBQyDAR301tD/+hhrCi1Mgy5TFXiOugOEP2wrcXXVmHGJ3YKyGvamwnbR3chk+L6L
         3QOqluCIgSAV0vttL3Ioexe7zqUwu5CyaUXsUZAWwOAjk5g5oUmb/frEU3pB3tQa9t7Y
         aatrCX2MLDhbnccehDvIlwyt9g665i2m7rf3I2oZtPvBsKq8t2Ct+pI06efdrKUZ5cKz
         V4GpdAm+J4XV/GO9NEe2XnQ7Zaw+CbjRuQVvV/EBj3h1Mh12UGB64Hv+PucdewdsMjy7
         IfP1c/HgB9bt8+rSLZfa8o9cZTBJ8/IWf9mCB0CNO2jXM+mHLyzDK0NRfQNkmCXqMO3j
         zhtg==
X-Gm-Message-State: APjAAAUCXGUaIvzJcWgJycCksZ8soCq7P9bVdp8pDFnswvWSLc60kHnA
	Koc3ctam9K/YCHd7ZLx0DHoFE1Iu
X-Google-Smtp-Source: APXvYqxcYQknEEwEPA392GeXNqXsCW1KEzjX1Q8kZ1XHuJUH6vP4E6eyQ3cy8aJu2QR4hhAcNRTrEw==
X-Received: by 2002:a17:90a:bf81:: with SMTP id d1mr4716950pjs.21.1582808208712;
        Thu, 27 Feb 2020 04:56:48 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id r145sm7431800pfr.5.2020.02.27.04.56.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2020 04:56:48 -0800 (PST)
Subject: Re: [PATCH v1 4/4] accel/tcg: increase default code gen buffer size
 for 64 bit
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>
References: <20200226181020.19592-1-alex.bennee@linaro.org>
 <20200226181020.19592-5-alex.bennee@linaro.org>
 <2ca7b55b-5674-370d-5c4d-dc8b7782ca64@linaro.org> <87pne0w6rt.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <56f5e355-9357-e212-e92b-9db1d8424dea@linaro.org>
Date: Thu, 27 Feb 2020 04:56:46 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <87pne0w6rt.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: Rj5vFW0pZroo

On 2/27/20 4:31 AM, Alex Bennée wrote:
>> It does not make sense for a linux-user chroot, running make -jN, on just about
>> any host.  For linux-user, I could be happy with a modest increase, but not all
>> the way out to 2GiB.
>>
>> Discuss.
> 
> Does it matter that much? Surely for small programs the kernel just
> never pages in the used portions of the mmap?

That's why I used the example of a build under the chroot, because the compiler
is not a small program.

Consider when the memory *is* used, and N * 2GB implies lots of paging, where
the previous N * 32MB did not.

I'm saying that we should consider a setting more like 128MB or so, since the
value cannot be changed from the command-line, or through the environment.


r~
