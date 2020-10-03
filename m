Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp2325369lfq;
        Sat, 3 Oct 2020 02:32:41 -0700 (PDT)
X-Received: by 2002:a05:6830:204c:: with SMTP id f12mr4311288otp.73.1601717561561;
        Sat, 03 Oct 2020 02:32:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601717561; cv=none;
        d=google.com; s=arc-20160816;
        b=SLZJ5n8hw8wEWdGqx9hyDkSXjn5ww80Ef01eboWGBjh2Tuuh2G4sTDGY55/w1LFzP0
         bVCE0FC4heO+K+5wWEw0QmSe27+qhE7i/383hq56pb9NtctgfmYwyLw5UhTMuJwjOmUT
         Xi305z9WRv+Qsq6NKq36t8iyvAK37hYOmFpHtisYUADD7jB97tR7klhdAk3MrrmqOrlW
         cluaYKJicV4v/R5rUTwA9PEptWQUXaPDQpgnA9Fm3uvsuIfhyMdus3E19fQ8rpVU1/jk
         4iBUE4sub+vpOYwDmaPK0lj3VroD0EMDf3/47AfBOTvg2nQDkW+YU0LH8ZIRB4k3XhzP
         sUJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=Lf+b6wz5aJcxLTuNyvH2xK88mrxNPbARWcfCoU54kpw=;
        b=BQc6RPn0XtDV2PcwFga6vC/By11X4DxyjOIxk0lKmQQaTVSU2BOS3EjeKGwgjY9Q1r
         q4N6IGKk6yAZly8QQVJUArfB7lv+DQOTbpNT0wD6sfngklmP9ERhn9CkeLxHaL6TODs2
         YkIXoy5nJuDIMfIM8HlGvolrMbYHD2cms+qujnpdEq0eo0h/hCGtqcFeSiR+Dt9sSczz
         hZ3y1Lj0XOv+KuuzMHOyJC2CsDLtXHW67+5NSOnaEMXYN7VyUXHBhya/69/6GsxUtalC
         jM665oYBb5waFUw9S+s1sERAKmAfrPaVZNETkduwi8uFBzzwXr8vAaDQUCho4Fj6tT7k
         oGPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K5Sjw0MT;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id z67sor820047otb.16.2020.10.03.02.32.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 Oct 2020 02:32:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K5Sjw0MT;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Lf+b6wz5aJcxLTuNyvH2xK88mrxNPbARWcfCoU54kpw=;
        b=K5Sjw0MTIeUlLlww3BOw6xcDB1/Qz4tk4Vph1UaEbLckM5ohrGn9M+oF6h1/5lnmhJ
         RPfzadY1+eClwFonL2SgiyOn9+397r7bktSIF55VTVf0uRA45T4G3HsKNuWKOZjw/AIO
         wc39cNiFzTALYhYhqD9bpIrC/UELcrLyhDY1oYoW7NDYStby0cK8sG2u0CXVIioF56Je
         AIRFbwa+KmMZRdQPFGPalKhoNU7sXWHuI8+3fXmMFt9rbAPbMG7Nv6eCPOOH3V59YEEz
         GXmk52dcQFBYuAKi8aDR52+f4N4sTyeh4QWohkU+Y1bSow2yZyYAsLJf8VYeojjS6sVW
         XmJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Lf+b6wz5aJcxLTuNyvH2xK88mrxNPbARWcfCoU54kpw=;
        b=LMq0R1ogNEeCR9LEozBUntpcH6IpUInwXucK+J+tauwGSYGGIR3kA9Utf5k6ZgjNZP
         0mPP1BPAULBD1Z5NQyHwhbC81EYLf51+nojze496TAi9V+YI+AVRj6FaGiRr0N6/wT59
         A5f2W72JCuVYHUdP32Lw/cAQ6UczPgJOCOD8DooJjV5+locQTt/wSM+yOnHghCkAgXHh
         zXr2bIrSha3ORb19eYUV33R8WSjC32A9URLhnq0lgqZj5DqISwYN+cSx7BrL+40r3pez
         b1ltW4nwjzUaobuWn1UaLRYKsFZtAWADgc8H6z4sX6AQBR2Wl7/bq0PxOEEnRg7JW/uA
         LziA==
X-Gm-Message-State: AOAM533IWDFGpRnJ1llu1kPb32E6GCOcX6wHjeklzYlkC+ia29bqIocg
	ww2v4bjezovjzJz0idncygS7IHJd
X-Google-Smtp-Source: ABdhPJyYmIU4ZCcxWQ7wTs+cZZk1NiROSUjjIuOHFA8sUv7v1AcsT8YCeOpCVq5eAsoY07+30gxZGQ==
X-Received: by 2002:a9d:70d8:: with SMTP id w24mr4662130otj.275.1601717561171;
        Sat, 03 Oct 2020 02:32:41 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [10.10.73.179] (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id s13sm1085739otq.5.2020.10.03.02.32.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2020 02:32:40 -0700 (PDT)
Subject: Re: [PATCH v4 02/12] meson: Allow optional target/${ARCH}/Kconfig
To: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Fam Zheng <fam@euphon.net>,
 Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <rth@twiddle.net>, Claudio Fontana <cfontana@suse.de>
References: <20200929224355.1224017-1-philmd@redhat.com>
 <20200929224355.1224017-3-philmd@redhat.com>
 <31a173bf-6aa3-1ce8-7d14-5e8f11e2a279@linaro.org>
 <0303fe78-5ae1-2115-247c-71807ce74e12@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <af1779ad-bd09-d1dd-6790-e7004b59c0de@linaro.org>
Date: Sat, 3 Oct 2020 04:32:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0303fe78-5ae1-2115-247c-71807ce74e12@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: cJvMi+yaIJxU

On 10/3/20 4:15 AM, Paolo Bonzini wrote:
> On 03/10/20 11:13, Richard Henderson wrote:
>>> +    target_kconfig = 'target' / config_target['TARGET_BASE_ARCH'] / 'Kconfig'
>>> +    minikconf_input = ['default-configs' / target + '.mak', 'Kconfig']
>>> +    if fs.is_file(target_kconfig)
>> Missing a meson.current_source_dir()?
>> Leastwise that was a comment that Paolo had for me.
> 
> Not sure, but it was the only way I thought the BSD build could fail;
> unless the capstone submodule really was not present in Peter's checkout
> and submodule update was disabled.

I don't think the build actually failed, I think it was just the cmake warning
from the missing method: to which Peter objected.

FWIW with and without source_dir work for me when testing, and I'm about to
include it in the v3 pull for an abundance of caution.


r~
