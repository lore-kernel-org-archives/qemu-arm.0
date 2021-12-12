Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp3370106lfk;
        Sun, 12 Dec 2021 09:46:48 -0800 (PST)
X-Received: by 2002:a17:902:654d:b0:141:7df3:b94 with SMTP id d13-20020a170902654d00b001417df30b94mr88775941pln.60.1639331207974;
        Sun, 12 Dec 2021 09:46:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639331207; cv=none;
        d=google.com; s=arc-20160816;
        b=G4287HsBzwzhqJQdell7p1FYl9XwrsHsaXoKQqPZQiSKlPyF7dnpKAhhAKK5weK04L
         SwE7Aa+g7QN0cFBfWn+4RSskxCvMwJNCwnRojR+vcs6rMNgEg7avMqVlZfd7Zu8lwG/I
         6RqcmZzwPBTLISRexsS9A4T0yoiXmvSLW2kkicYf+zdQrd0zvnl5hOyf7PYdgx2nsXqI
         /0ypCN4rWam5cGWOpG/xfli8IiLVnkC8+QbjYcKAD8UhGF6Pn6rkwLhu2Zorxdbv8BO/
         TjmRWMbEj/s1fRm71jFdBFk9kMNdWTdylUIfSySP9kyusFghwoYEOzVjJQkkWEktM5cp
         01Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=AKMOGb7yZGExG+0aoc1hwSTg7fxXwyQ5vqIvI95dVWg=;
        b=WvfJ4NVfQGQ9N6yaNRbk7uxKOtZOc1bI+nsgzEpavQ9dw6L2Ul8gLpe7QUQ7oQXBiG
         G54b8K3Cfpe6vrp2CXuSO9uuWAUOeotJ8SNywBHC43uXlyTuNlNo3lhUE9+ZNHc9AUkx
         xn2WN0TDeRq5z3WFG2oHvHTp7qEXcy3D1e4G9nti6HjQrlI4O2I6AI/QyUGT3Va5CL3c
         Nuurhd21nlKz7CB7SUDb92oi3/yKP0g+QnAD/hlt3uqLVn27B5hY+9uGlKq8aT2D9cbB
         7eaLyTf5VNIzv1Fpz8ACFBMzepE5V1OMD8KSxhovQTsBYD8LH+7jXkLvx0eYhFoXbJze
         HGUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rQwI+Kjx;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n9sor5451480plh.30.2021.12.12.09.46.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 12 Dec 2021 09:46:47 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rQwI+Kjx;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=AKMOGb7yZGExG+0aoc1hwSTg7fxXwyQ5vqIvI95dVWg=;
        b=rQwI+KjxjyhwBmsBsBEphW/jwP0nhmmH2aLUKZjdkzIbUITR3i3VGHRi4r/XZGBapd
         +OBtCDRx2cdRSwA9R5xNPXMzfv8sue/6F81I8dNWAG2/wzExIEUnbxiRXYAdYUpWXtPb
         InI2yOGLjkR9yU88yczr9wpx90I2eabEpXoka3tvw2VYO5Ih308h7/1w0TgFp85uJiR0
         DP5rb3zk75AFYu21ZAAVOK/zwGcABTGcqr5MUMUxIkY8QXh3lKVuDM0ttvArc55y/oK0
         q2BlZMdj4XG6EpOWMrBF+gbInFL4VbBRPq83VvDlfPoo8bo7AeeuPvWWSpFx/gki47Qz
         ucvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AKMOGb7yZGExG+0aoc1hwSTg7fxXwyQ5vqIvI95dVWg=;
        b=noMvDs5mFrk15UWkWsY340k4i2YysoJmHRN5P8j+FFq6Jk+pKQzCCtNEXzbAs5PFE6
         yaiBE4mUJ4U3Tp1l2JmM4DS2uJzi9rgvN7+Z64ju96gvFTojDz+7Qvr0UObw4xniR1bO
         dixNCJuoHpNdPvQPWAxvzx647is8lUo+kgpjogXFe1dk6KpbVQDxFRBUe/vIJqdh6XJi
         A7sBc6fhr1ib6QMYMwH6PbnfDamRM/+KalRjOnF0kPPwmcgJ2Cf5BN6Ci0oANNs+C6PX
         JdUwqn3tDrkRBcPvkE4al/kV+lUrmlvwdJZqgxrJE+5xkldnQhdABlXjy24ofo8UqXwo
         TWWw==
X-Gm-Message-State: AOAM531TPJJbI2vzl2Dkh3vjnnJud5POi9Ou/LFUY/CRp/y/bewCLDgL
	2S6uMN+CKoFzGw1V2CYo4JPvYs+WKHvLC1JM
X-Google-Smtp-Source: ABdhPJx80cNCNPa6sS3QVSBqD5JPccVaTvCQ8V8CCtyXrUVYaIL3DTMZg0HmAVyakEGmEkbFTu5YYg==
X-Received: by 2002:a17:902:e852:b0:142:19fe:982a with SMTP id t18-20020a170902e85200b0014219fe982amr91929254plg.13.1639331207458;
        Sun, 12 Dec 2021 09:46:47 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
        by smtp.gmail.com with ESMTPSA id h5sm9408195pfi.46.2021.12.12.09.46.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Dec 2021 09:46:46 -0800 (PST)
Subject: Re: [PATCH 05/26] hw/intc/arm_gicv3_its: Don't return early in
 extract_table_params() loop
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c9b07fc5-4355-e89b-2859-66518acf687b@linaro.org>
Date: Sun, 12 Dec 2021 09:46:45 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211211191135.1764649-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: /s7/lNyd9siH

On 12/11/21 11:11 AM, Peter Maydell wrote:
> In extract_table_params() we process each GITS_BASER<n> register.  If
> the register's Valid bit is not set, this means there is no
> in-guest-memory table and so we should not try to interpret the other
> fields in the register.  This was incorrectly coded as a 'return'
> rather than a 'break', so instead of looping round to process the
> next GITS_BASER<n> we would stop entirely, treating any later tables
> as being not valid also.
> 
> This has no real guest-visible effects because (since we don't have
> GITS_TYPER.HCC != 0) the guest must in any case set up all the
> GITS_BASER<n> to point to valid tables, so this only happens in an
> odd misbehaving-guest corner case.
> 
> Fix the check to 'break', so that we leave the case statement and
> loop back around to the next GITS_BASER<n>.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I suspect this was an accidental result from a refactoring at
> some point in the development of the ITS code.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
