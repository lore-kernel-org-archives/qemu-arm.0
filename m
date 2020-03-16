Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp483856lfe;
        Mon, 16 Mar 2020 12:50:03 -0700 (PDT)
X-Received: by 2002:a63:144e:: with SMTP id 14mr1455343pgu.264.1584388203562;
        Mon, 16 Mar 2020 12:50:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584388203; cv=none;
        d=google.com; s=arc-20160816;
        b=WCiDLyogUQJRmtIQx1ATYedloA6ecZTT3pK+ryLyHhd2/X34ixbpyhur2JLn1rIAQ9
         VX8dgMmaQcS/yAO/Lhw6i8H1l59UlIRfu4kd2THRoT2Gq3cBFkAtVkeDlkMBz18d3agc
         G5gx7XaMncG/ilHMtiFp664Nr0r29jiuUJy50eEl5DVqNuCPqDcLHid8cAZUNE9aiGJR
         aXqHNSNlXU4NEwQ8/6qFLi4vIQxhF1GoxqswdalC3H7p17txEzsyLyKr4GEM/lRH1d4P
         nwJH7F5jvPW9hDnmmELkMoIexYg6vfOsz4hwXiwS3/EK9BJ/TJ2enEGxhtDI2apCcZ7F
         0tdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=JIIXamngHKCNeGNFCvKp7fJI5aol/285BJCeJ13G1Aw=;
        b=OV4gIQSP6kePP6p7kc+pG+tV4w58pbqd3KLve16auc3J5f/P+wwasi2lhglgmBLzyg
         KQ6YtGzwO6wEfOYUZfZGZyyHm9ygBfB+irr6wqAqw26SwuyASE1HEU7fwlCHy2QJ7IIJ
         lf8xCjdj2ZLQOfmsRO1pjHJQx5kFHHCPi7ZBvH/CerozsimIWSc1Kb9KKWFl3RJiA3HK
         4ZOljN1ZSkn6DIeIUGcLlUOXxoZpsBjHhurZyeYxN5zWxKmCbVr2vyuEseMd/dcvtdi2
         YWO5hf0i2s4lQ12AEkI8jPVWXShFjYGLJDnqdIdIjJxhQNdinSIWBVuZ2UxEOdoTN2HQ
         xNhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DYbnMOE1;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id r6sor880883pgm.2.2020.03.16.12.50.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 16 Mar 2020 12:50:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DYbnMOE1;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=JIIXamngHKCNeGNFCvKp7fJI5aol/285BJCeJ13G1Aw=;
        b=DYbnMOE1p6fNHBWyNshe1JqLgxkUEJKp7IhCGmrY8cQDYCWT97FIzU4UlcQoTOEmNc
         g+gaRYp8IijbJOjjbBqgwoTfujYM9FpLbAmI3COsf696qM2MxpfS8VYjReiUHhSsA29u
         v3qm/j5bnDmx3amXZBrIAGvx1FczjljWwZivI9824aK4zXP2kucEEUzIdHrNjK42dj3w
         Vk9JhkgmJWv4i+/b2eVBzlzykm68EUFFpqn0dyvH0cxzsPIvQaYJX5lfO5ClPUxFJAGE
         d+YMrfFyFmX3wmnJPLu0yhGNIYVIU759uwfv4pvbaTmlwdTeKQPxE9xwovTsSJk1kZEH
         RucA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JIIXamngHKCNeGNFCvKp7fJI5aol/285BJCeJ13G1Aw=;
        b=sByCLfBkiIYWWklop7k1h5ORvjYivaxWmc1D8YErAj8v5Ibp7w5uqtuPtLX4lTmKDG
         BfhxeStX6yYkI0uBA6NVQ6NOQ/IWs8Jm0Y1hllbLbW3YH2QZ+oSILGHfE0gYlVQWLvru
         F5NV2ZPvsMdcD7Q9UnIyovAdl2vSAZ6fVh7vc27DWHncXm50KAvC5/kOqQexiQqseMDX
         DOu0061Bzex+kAD3r2LV3GO1wk7oOwwTGz8P9Cr0Rzfice+hoh35h2dX7TZ1/dAyChM2
         Zo7ZTjJ4MhUAelGNFVD534QtnixPJ82pb4msANmpnB+YCj/Gr6n7eAqDp8kZUP1WMSv3
         /rSg==
X-Gm-Message-State: ANhLgQ2jdwx7HNgBuqiIwFcEyAFYzVGBGgGAzp3oL1Y9vbKwyMTMmm92
	YNuf3lYGCaeDlqUeXwN50s66M5HJ
X-Google-Smtp-Source: ADFU+vt0yq9wHnOPkKK1VlQnOJyORm9Djm7DBt1D1EXniKGL7V6557Qng/hrzuvzNfQpAtJaK3s2IA==
X-Received: by 2002:a63:58e:: with SMTP id 136mr1382048pgf.306.1584388203071;
        Mon, 16 Mar 2020 12:50:03 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id md20sm564159pjb.15.2020.03.16.12.50.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2020 12:50:02 -0700 (PDT)
Subject: Re: [PATCH v3 10/19] target/arm: Restrict ARMv4 cpus to TCG accel
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 kvm@vger.kernel.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20200316160634.3386-1-philmd@redhat.com>
 <20200316160634.3386-11-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b5c047f3-ab3e-825d-35c8-b24c8efc616e@linaro.org>
Date: Mon, 16 Mar 2020 12:50:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200316160634.3386-11-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: KqTYjP+tGEE0

On 3/16/20 9:06 AM, Philippe Mathieu-Daudé wrote:
> +static const ARMCPUInfo arm_v4_cpus[] = {
> +    { .name = "ti925t",      .initfn = ti925t_initfn },
> +    { .name = "sa1100",      .initfn = sa1100_initfn },
> +    { .name = "sa1110",      .initfn = sa1110_initfn },
> +    { .name = NULL }
> +};
> +
> +static void arm_v4_cpu_register_types(void)
> +{
> +    const ARMCPUInfo *info = arm_v4_cpus;
> +
> +    while (info->name) {
> +        arm_cpu_register(info);
> +        info++;
> +    }
> +}

I much prefer ARRAY_SIZE() to sentinels.
I know the existing code make much use of them,
but we don't need to replicate that here.


r~
