Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp678043ejb;
        Fri, 7 Apr 2023 21:25:11 -0700 (PDT)
X-Received: by 2002:a17:90b:4d0e:b0:23f:7464:ae55 with SMTP id mw14-20020a17090b4d0e00b0023f7464ae55mr5254304pjb.0.1680927911291;
        Fri, 07 Apr 2023 21:25:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680927911; cv=none;
        d=google.com; s=arc-20160816;
        b=fFIC73V/HEkcyuihaiQIY/AiZn4KwMYQcnP6AQbj6bznrJm4gKOz9K3ZmCQ6abL8ut
         MiUoFH6Qi0fZNBJ5uTwHYq1c/cewPoBkEc3awI0jaF5yedDfNoocCPmdplPVmNpcHV17
         CclXkMk3A04nuRkI/TR72emB3HaWQMz7h9wWBUKThSO+3auDtiTO0j82tGgRAF266jVt
         pu30VVWXHZlxKMFfd+fhhzw/BXayZlOUohcAvvUc6QLvgwpk8aCxWPUwdPbJJ8Ogr8dG
         Z4OCxoIAp1se/mrN1Lpw6wh0OveGq0h/K80gmCuKfmQN7T+Vjj2bunO/jI8OZL/tk5+e
         ew3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=hW/VSf7Q3/d56s71eq7R7lxXfgNg9+7clCwmfbVpN/Y=;
        b=AFCH95NaWudmt/ba14r7fkV4dPjv9lwX4XmYOiVFQUpTvRL8cjP7M1Hw8l5q+h8/C+
         /npz5JtgoCwqRm7nqC3JkDWaIHmLOgfueTb2PJUNUFN4M07M+2xlgl+Mt5ukAZF1cCpB
         OfCwhtHfG8gfJipFv/hx9YT3PUWMuOfr/mUAvfz0CXaiWHnaLv2P3+TGh4fj88dXwAyr
         QVJN4e+i1esLZ2A722qK/zZewoNNWL+PFZ9ko8LKxFzaszgLdGrArAwH12a6Q+nKbz/b
         fup0MiPB0wlG9OtgCaLQ8+gipYFOz4Asxgxp66yOgoDWy7sA1UT0vCjYIGKM+aWOkIVH
         rHJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AD0MsyTB;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id j12-20020a17090a840c00b0023f7a586597sor4211486pjn.37.2023.04.07.21.25.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 07 Apr 2023 21:25:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AD0MsyTB;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680927911;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hW/VSf7Q3/d56s71eq7R7lxXfgNg9+7clCwmfbVpN/Y=;
        b=AD0MsyTBfV0voztSlaCjS4/i8WtfCkzfpKBNK/v6C6M8jjO/kXSKCc0dYSUPMWO3/c
         mioyBcuh9dbN5ZUB4ifq0fkuqnxYXzP4KyuHu1SdBKyT3uSi3f1bxld3EEtOXumjKsrD
         UM0RuTSzyddlVlfnRFuKOYnPHAfUeu7YYbuqoc9sU7sBzUg3Mli9fq3oBFUfoZZE1gAZ
         DcaFqJU9Zw/bmGDE0gGhdAekfTlGITjw9XkE6+dYDbfIl2O2IwqTPC/l3yo+rBcoet8u
         7hWl8wsCBXfi3VcPWH1UcC+diy5cURNzdIot8UWAyQSObeTmkpMzbUhezy0KAgQ7Z4of
         5CIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680927911;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hW/VSf7Q3/d56s71eq7R7lxXfgNg9+7clCwmfbVpN/Y=;
        b=EQQ9xgwDklPbvJuZlb4X7l8HWQGvEc/W/Gc29rkSqaSMOl7f1d4MorZuyCu0JMaxCe
         ETbuIEQQ5uPtl32Dnb45f/9RIiiKZRq1CVxZfg8COfZv1OtFce8w+4lCFqvykkSrRcZg
         CWC5WCYjQBG6QTV6qoJxpa/znwGH0pXFqBDkmjgIT3p5p9FPF2CYXYIvngNrSNQhW5Cq
         2VGj1ZovBKfx+EV9gpe683+xsEKvwg0TTu97ybUtBsgORBkWIHsZ+aEmr/2GRO+bBo3N
         2Lk8zjrolA7ZizAtkqwp9TVmPFNZ0ygz0eBm0lPmy3Kbr6I/0QKDaRtsMyX87BYHVKVj
         50FA==
X-Gm-Message-State: AAQBX9eOuUC1QhJVG0jb10U4QPDn4lhisjmFBjRsDvZfAybqtTW2nqmh
	dD8k16KHnu/IE85itTeYq978NsUZ
X-Google-Smtp-Source: AKy350ZUbQYkpHgjHTHqWPoCLiXyBP/r0ksrikXsadVUUJ0Z9+D+HwacqU3D1RBcoFMeI9Y1KRfWMw==
X-Received: by 2002:a17:90b:1c91:b0:22b:b832:d32 with SMTP id oo17-20020a17090b1c9100b0022bb8320d32mr5197335pjb.9.1680927910856;
        Fri, 07 Apr 2023 21:25:10 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8? ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
        by smtp.gmail.com with ESMTPSA id gd22-20020a17090b0fd600b002465ff5d829sm1432776pjb.13.2023.04.07.21.25.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Apr 2023 21:25:10 -0700 (PDT)
Message-ID: <ef9c1261-2f9c-0f22-b502-56b5f9c52618@linaro.org>
Date: Fri, 7 Apr 2023 21:25:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 06/10] target/arm: Reduce QMP header pressure by not
 including 'kvm_arm.h'
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230405160454.97436-1-philmd@linaro.org>
 <20230405160454.97436-7-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230405160454.97436-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Sfy/wFcZ46R5

On 4/5/23 09:04, Philippe Mathieu-Daudé wrote:
> We only need "sysemu/kvm.h" for kvm_enabled() and "cpu.h"
> for the QOM type definitions (TYPE_ARM_CPU). Avoid including
> the heavy "kvm_arm.h" header.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/arm/arm-qmp-cmds.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
