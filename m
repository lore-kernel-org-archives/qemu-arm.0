Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp4426775lfb;
        Tue, 19 May 2020 14:41:41 -0700 (PDT)
X-Received: by 2002:aa7:83c8:: with SMTP id j8mr1101053pfn.272.1589924501168;
        Tue, 19 May 2020 14:41:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589924501; cv=none;
        d=google.com; s=arc-20160816;
        b=gNrakdtNrgvxc26Qyudw3+lQvmAs6XNBPsI6fgK18+jNGv5HMJvGGHpuRlHdiUZ+A/
         obukrOsQQOnWPb5BcFE64U2fkI+AYvKvN2L9MS/5kgN8tZrgxaAV2fSild1rIfvIvEcb
         JSXNNb4tNpWHG4NT1L2qtfuOera0Orj3dFDG1bpPz31FafO5Om2F+xEF14cfEpdRduwk
         zSEspDH8A7vY91SL3FnxKV5ZlM+ncnHgsK0hXnSzRu7J48dpJZKQ2ifLsaoJk/YCSqxi
         u4qIkwJ0wM6F5W1GOTI0UXcuG0z4pkZd3HGS/9qWWhsoNU5WXBe+MXKgqo8WQzlNvym2
         sr4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=CMye0gRnqmKea87uFYvrR2qGt7AWfI8R4JkHmzP32YI=;
        b=DtNgdDiY3vngwVOspSC4Si+Zn2bHxaytGalJB7z5y/D8lzzOM/Gpe7KngY5c5khSNj
         9NkW4HPU6eewG3cSSm6etUJsEoPWqsqCgGSekzcrQEnbX+KIEJ8K9cIw8+hNfESD1ZlX
         JcxWPcU/yB5OajBM6oE/Zftk6DFO1V1907EmGVD3/N9+JTZ+b4rPFms1+rAWYHVT8dd0
         nsQOm0UhdbHXZocBycnmvsKFTRVcV+ALFajz2GVXh7pGBj+tf21b4PZpML2DIH1F+T3T
         yFEbbp+A/pzItjK7LlJ8wm1ca8iCo5uyNQMIzFMZ7tprUCbaNtgV442r5NDZdIgiVfq9
         fyIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Lw21wVNF;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id h126sor1429203pgc.30.2020.05.19.14.41.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 19 May 2020 14:41:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Lw21wVNF;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=CMye0gRnqmKea87uFYvrR2qGt7AWfI8R4JkHmzP32YI=;
        b=Lw21wVNFk/ef9zTd2wkJzOON9dfOfJGBjhEXeK4P387RP2jLEaJkdajlgoay5EcFQD
         2Ff2Eb/pS/1Nq7nZQPtZLQJMT2GRX23Bx2o9sfspZJhfnn4MuPgGtK7lCG6mpsScj+CW
         eCM279MJYS2tqr8o64rYJaoQtRDzDUPa3RSu+iheZYbGYaFYSy2W+Qx0uwpdP/L72mdT
         0ET2H/xsS9zS8n439yY0WnyTW+GiqF4qR0JzQg/1QzIRUVhnnWwPqirL4CM+Foj+C/Cn
         dWWcgLcUY3TA/53V3g0UCvduuMCVJQmd18ZFVUCjaExHSP4bWOzUD/rLah8CJENbZ5N1
         liOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CMye0gRnqmKea87uFYvrR2qGt7AWfI8R4JkHmzP32YI=;
        b=rv9dJEcuLa0/vopnp2DG9xXLogbOMaRHzoqZncxtV8aCwKj/i6K3VhdP9ZRZETPPwB
         04hpmK4jCWyXcU+VdIZBGXX3NrHZS+CvWrfRAX6qeQS8dhAHvyys71h65wwApoxcNIOP
         0Yugagp91aS+4d9Mr+z7cr5JlFBKLhz4bfwSiqkFJx4QgBcwRocKBrvO4GmGMzuxG27M
         lcABKZcGSxoMgMU9mz9LQwOjAMUdq5ZZx6p0K7NlVrG8z86CiE7Buy0HhA97ysXEjwfA
         kMWycsbYWZSsR7WSKL7lsSndCm1bSguxUPsCthuHTXFtSnF7LzzPFeJsr8Fimwr057gl
         zisw==
X-Gm-Message-State: AOAM530BLGyuWMyDCzpCWlLPsjG+L7dYeNKg737CIi4zVYLS95d3fY+6
	zNhn7K78NlHfULoUIyLteoCOwjKN
X-Google-Smtp-Source: ABdhPJwoC6noJKTG77fPfU2eCRRbQs2oAlFqLDHodQayiKG7+kIM2EtKvh92YwHJApOXyau7gQq42A==
X-Received: by 2002:a63:2347:: with SMTP id u7mr1071376pgm.183.1589924500699;
        Tue, 19 May 2020 14:41:40 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
        by smtp.gmail.com with ESMTPSA id y5sm356466pff.150.2020.05.19.14.41.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2020 14:41:39 -0700 (PDT)
Subject: Re: [PATCH v2 04/10] accel/tcg: Add stub for probe_access()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Marek Vasut <marex@denx.de>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 "Emilio G . Cota" <cota@braap.org>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <rth@twiddle.net>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Walle <michael@walle.cc>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
References: <20200515170804.5707-1-philmd@redhat.com>
 <20200515170804.5707-5-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <23e13589-1d57-8fc2-885d-b2fa34589d6b@linaro.org>
Date: Tue, 19 May 2020 14:41:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200515170804.5707-5-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: Tdu868PFuuUN

On 5/15/20 10:07 AM, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> The TCG helpers where added in b92e5a22ec3 in softmmu_template.h.
> probe_write() was added in there in 3b4afc9e75a to be moved out
> to accel/tcg/cputlb.c in 3b08f0a9254, and was later refactored
> as probe_access() in c25c283df0f.
> Since it is a TCG specific helper, add a stub to avoid failures
> when building without TCG, such:
> 
>   target/arm/helper.o: In function `probe_read':
>   include/exec/exec-all.h:362: undefined reference to `probe_access'
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Cc: Richard Henderson <rth@twiddle.net>
> Cc: Emilio G. Cota <cota@braap.org>
> Cc: Alex Bennée <alex.bennee@linaro.org>
> Cc: David Hildenbrand <david@redhat.com>
> ---
>  accel/stubs/tcg-stub.c | 7 +++++++
>  1 file changed, 7 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
