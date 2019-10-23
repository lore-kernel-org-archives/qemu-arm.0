Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp1093763wrq;
        Wed, 23 Oct 2019 09:13:19 -0700 (PDT)
X-Received: by 2002:a0c:b929:: with SMTP id u41mr9639124qvf.37.1571847199159;
        Wed, 23 Oct 2019 09:13:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571847199; cv=none;
        d=google.com; s=arc-20160816;
        b=nkfuW2+ouGS95Eds+IDRYhN4lXlaHNAJGl7XEkSLY1qhYWoO7OgObp+t9EcJXeerac
         yjMrnbBb08sHLI8c32zFUb1EJZuioHA4E1a2g6gRG6rnqQDwKqYsVX6zKTdpeC//d+3u
         BX0pXdW0rigIlgC5eguTKsmTH6vIvUhojqu40t4DUAx6tVDREDtr/zIZuqBkTYzj/nLf
         CKDJaA7xSa+Cr3zhPaKl7K1+8xX6xkUK0+aZSROlbFuYnjc18v3Ak0JwEHRB32xGIYEX
         /FZPQOxRWHF1X9qmrls0q6hNF440v6a3vThVKfkNVsHb16ZCEo/ZS+ydCtWpptu9u3yk
         kPIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=nrvAJTS/jezBLWvO+M8F8gQv267wMLuwRBhFnSGEFeM=;
        b=LXJOK1f+R46h94TjNeImSIA3diH733lfTECHEAW6J4FUh6tUjL3yvFdCmyQ/RNwtIE
         kAguB27Hvtyf1agnJ4G+X0sosqD9fGFXNJ1JFHTmNJRygX9voHzEJ/cqvNz403OREIoV
         swHZ3DodaNZxvwmFA5e7bj0Qvy8RX+KbktCYjsg9W0B+Q2JlhP9c+8U2KzxhyIJ+IEwp
         zmBJip8CsTN84VBZIz3fg1reC7F9rrjsrLnY+L28ojGcL8/L7wTqRCa5s2GANbgoiXHb
         7H7X6/2QVh4PUS8+w1074kYinZ58JCq7ksyUjPZ81tX4FCdCloXH3VQyIewnse+VZTUU
         YlcA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H6kM1rbh;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id a38sor9525292qta.4.2019.10.23.09.13.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 23 Oct 2019 09:13:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H6kM1rbh;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=nrvAJTS/jezBLWvO+M8F8gQv267wMLuwRBhFnSGEFeM=;
        b=H6kM1rbhivP4l30+902GgNfOQQV06aLx3rfEcQUrn8aEcH0hmVUgMEPS8e9V+pipyg
         j/3aAddl/1EyoYMEJNfSBwXbuLgPI131z2nFXc8lolP4gHEFKNynJsJCg723iAi+GKPX
         o+3s5fT9PrJ+hyD6sS5ODt2IFxARWkaqluWGZniURp3tBMhY+HzuxrioSX6BpaOxrWn3
         T1JDHv26QH0FQg2tGnYvJVP/SEGDYQMC4dOkISUjDRZqy+/0FdiCWvyZzr3h3VcngkZo
         3kXu5Jq299aUm94grA6mcO/REahpsNudQKhKTdRkE/ThW9LlN1h2PlFqa9jpd2lgWFrk
         NuZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nrvAJTS/jezBLWvO+M8F8gQv267wMLuwRBhFnSGEFeM=;
        b=oEwh7Z9mn3w6EGWN5CiTHno1IrwO9Ss7PFSubUtf16EAgViLGCLKewEIpptZpNcg3n
         n3/2TfRLKwUOVlFR0vxVTJ4PrFkyAGL0EzwWYVMXM3Jc6t8rMMpFZeZLIH5SPZqg0U8B
         d2rCpG/GL1LUbdDgc7hXodD9+RRwnD0+Ji8zWSRwFzEkZ7A+SbKTbMtf32WDY5dajUfx
         HPVcoqem9Yxa4Q533X/kRBeK2Z43mTOEoFM5JS4uJl3Y86RyzMIKN2Xu+Kqq4FkS6kbf
         CPpczpniqb38uLa6g4qjLZtGq1zrG5vVGnwJHcQy1FP8MNb/b9vHqSqARfHbpEBhzAdb
         8ArA==
X-Gm-Message-State: APjAAAXPOtc/l1kzhdp3dTPfPKJ2RF5Iqz+TokUrl8cAzvrMr/og9sI0
	N+dKt18aODAF8s5DGzzgezNPctgb
X-Google-Smtp-Source: APXvYqy394SF9xkkWaG3lftyOqPnhFJh4yEDe9NZamGJd+2yUihx/Yt7DUAVisMG1ApRAR7mLgjMwA==
X-Received: by 2002:ac8:1408:: with SMTP id k8mr9854763qtj.327.1571847198500;
        Wed, 23 Oct 2019 09:13:18 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [172.20.87.163] (rrcs-172-254-253-50.nyc.biz.rr.com. [172.254.253.50])
        by smtp.gmail.com with ESMTPSA id c126sm12954799qkd.13.2019.10.23.09.13.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 23 Oct 2019 09:13:17 -0700 (PDT)
Subject: Re: [PATCH v8 00/22] target/arm: Reduce overhead of
 cpu_get_tb_cpu_state
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <20191018174431.1784-1-richard.henderson@linaro.org>
 <CAFEAcA-MyKoA63UF6DYQ6J-dKihYn9iyG09eFCgWT8j4OqsQnw@mail.gmail.com>
 <CAFEAcA-Xj-6CdVzgfcVONipApD5b5PZ84nPnvbbOQjQkqQLnqA@mail.gmail.com>
 <6e06dede-2470-92e1-eba9-40646ed56af0@linaro.org> <87zhhrmqyh.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <3e366a5d-0de6-ff1d-7a0c-a40ef8a2bf98@linaro.org>
Date: Wed, 23 Oct 2019 12:13:15 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <87zhhrmqyh.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: eK8rB6HqRlD6

On 10/23/19 11:17 AM, Alex Bennée wrote:
>>> Dropping this series again for the moment.
>> Argh!  I had forgotten that we have no testing of armeb in check-tcg.
> 
> Does it need it's own toolchain or can it be done with flags?

I think the compiler only needs flags, so we might be able to gin something up
for {aarch64_eb,armeb}-linux-user from __start.


r~
