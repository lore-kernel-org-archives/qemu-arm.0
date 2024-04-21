Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp3427716ejd;
        Sat, 20 Apr 2024 22:20:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXLNfNHobObSP6aLM9LpdHP4YzTrg2iqRblK3L16N3qi4Xt19QUevmNqwvztB6DkmGLrQAUNtbomwuHseFxVBTgbFIL13aH
X-Received: by 2002:a17:902:d395:b0:1e4:436e:801b with SMTP id e21-20020a170902d39500b001e4436e801bmr6515935pld.67.1713676812783;
        Sat, 20 Apr 2024 22:20:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713676812; cv=none;
        d=google.com; s=arc-20160816;
        b=m0oAGKgCBuPclVwhTj/0P6BJQWzxoLoc417YOxrH6RJNaCndUi0sxuRXdG/o0MJKIu
         3QkibW5jHSeds97Vi8irbTSHeSebD7X6RFYtUDkO3+HhZKUX2z39QHHDxw+0w3eJgvSw
         p0kgPCtP4U7VJqQwmIaXWhRF1UpTn0lQ1bBfIOEYvHDzeZzAE4CFVtvFFrW5dM6Hpn2g
         Ey0ZfBpOQgMyW/cP4MNYjO6UVOtFrauYCE6uWlCF8aDNiEQQYZEz2/kjnsKDHN5HqrkR
         EzDPV4n2hRVPTaSp70PKAds9rPDVn83Kiu7xevWUJpPdq0poHA6vtvV6Nq/JkY0iSz1o
         2awA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=lDXAB8ltRRwkbBawSc6C2SFgBQpWEcy0Yr0gdbEefAg=;
        fh=+1l3ylzWZI8DyyaQ8ZbqBspu2Dg+vK3Rl9xuYcWb/bU=;
        b=W9wxB/rTxbkHFY9clYRZUGoJ4fbAcCJK3ejZRLFNqv1ao+TPQLm1QJY6dx0XWBeNlt
         e/ajHCoVyKt4514OUFqwGeLK8dLNhL2FJ4FAztlRwdlWLJpWTkWDb0Zq+VKBcN9zH/uI
         GTdyh+VdoNtlRu4azNPtevVXCngbi8/tP0zecBzF7zh6bdIA4F4m74bCFM/1sefCgDN4
         EalbLlx+ICSp2Tb0gFPHO4hkJx9pkPIBnvcAkEfts40uf1Qk5renHAArs6SJDMVzBayf
         giBIxKetKL7yBT0CFZghKMp/WJmpiwN5LDf2yaTHCyGNS+vU4CXSw7T5hAy4d+pl7Fg8
         6IYQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sEHGnxSI;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id mg5-20020a170903348500b001e9506b9c4fsor1063528plb.5.2024.04.20.22.20.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 20 Apr 2024 22:20:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sEHGnxSI;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713676812; x=1714281612; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lDXAB8ltRRwkbBawSc6C2SFgBQpWEcy0Yr0gdbEefAg=;
        b=sEHGnxSIioykLb5bB29EImAiNH2VIIdYXgkjB1FCQ0DoVyseZ1Gp690ZKk27bNDKhO
         jlOMpR88aF2Sh5eOfbwkS8juwPhnyhBjITLBHW1ef2E+qTJDbkQPLpEzjSe4eGjNEHcN
         dsIHOBgl/qwBcmHIdXG5Z9VzUtOR1rNpzFEWRB9tnfYi0JJ3e43S5ztTA3FOrXR+QLXT
         c9yF//riCRbOBkCxM3Z1/LvsTEwV9ahKxsOdsFz3UVNrD7+4tikJx9kfkaQUSME+HxDI
         EnkgLsGgpVw68mQTdAYUBwdeGIg6EvwBWUq1DpOIHZ7opMSVC3pmMfDbqQRaoTNKXTQw
         /ZXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713676812; x=1714281612;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lDXAB8ltRRwkbBawSc6C2SFgBQpWEcy0Yr0gdbEefAg=;
        b=IpWxeIhpYH9fP8A7pHaT6bE0u2vIko3kHI3kO28L0XY+ZxcXLrSsfQ7iRl9OpLcwWd
         uSK2NBmri1l4Jb7OLw8XjpLvcX2xjFXEZWH3erjd2BLRUARPOLyOuuf/VYy7M0iMfRrj
         0WgsuwWU/dnuTvCjLB0LpAVCZMuT5Fr0atEDlJ1cq8kwMJmKeW0zugRXP7ZnmPU86390
         grtd5C+D8dQ9d1LWP1wawMdOFtDYozhgbgo9lH2pY9acVey+fRWQTv3M9iiBjgpZ4z76
         N2KnoTVsdzVBcy0ojvO7dT5cV/Q/JYxe9sLdYDMqfmYKgPs2eJ690g+P8Lt6exQxcCDe
         6c5g==
X-Forwarded-Encrypted: i=1; AJvYcCUh6uFDJ4JA1Jt1JACfYzs4Eh1xJ5mqaW822iV+YqtBHfDsAGdZykL7GL+LX/Qh0KWsYB/27R7GxrSY/teHYMtYbjPgSG71
X-Gm-Message-State: AOJu0YwKm5TAXm2R3XDQnVEIkpuvAZ6pO6edBMbr6aKZc/B8uvh1pfFX
	AO/XfNh8wO93WXn3LW79eXdxdNlSZqcfTfLD5Od8vmCp+JO6qIPoG+1UBVU2JAlqQQ==
X-Google-Smtp-Source: AGHT+IHkMyM5opv2eoOylQZroSnk6GqGYbzNWxMP5sTw32UbvTFvHfQW0vjUnKeBk99bL24mNOUByQ==
X-Received: by 2002:a17:902:daca:b0:1e2:7d3b:353c with SMTP id q10-20020a170902daca00b001e27d3b353cmr7571336plx.18.1713676812239;
        Sat, 20 Apr 2024 22:20:12 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.91.227] ([156.19.246.23])
        by smtp.gmail.com with ESMTPSA id mi8-20020a170902fcc800b001e294f2f30dsm5792306plb.93.2024.04.20.22.20.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Apr 2024 22:20:11 -0700 (PDT)
Message-ID: <374ff057-b799-47c0-a033-fc17847e98e9@linaro.org>
Date: Sat, 20 Apr 2024 22:20:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/24] hw/core: Avoid including the full 'hw/core/cpu.h'
 in 'tcg-cpu-ops.h'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Anton Johansson <anjo@rev.ng>
References: <20240418192525.97451-1-philmd@linaro.org>
 <20240418192525.97451-4-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240418192525.97451-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: +rTwIQyqVwna

On 4/18/24 12:25, Philippe Mathieu-Daudé wrote:
> Only include what is required, avoiding the full
> CPUState API from the huge "hw/core/cpu.h" header.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   include/hw/core/tcg-cpu-ops.h | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
