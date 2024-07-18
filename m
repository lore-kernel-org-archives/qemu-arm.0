Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp1375056njk;
        Thu, 18 Jul 2024 04:30:51 -0700 (PDT)
X-Received: by 2002:a05:600c:3105:b0:426:6ea7:3838 with SMTP id 5b1f17b1804b1-427c2cf18ddmr28953555e9.27.1721302251478;
        Thu, 18 Jul 2024 04:30:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721302251; cv=none;
        d=google.com; s=arc-20160816;
        b=WNtYYsQWWEgJp5Uh0AF3mp8sfaxK3U2e0kD4hfrcTnw50T4lGKxljKV/UWgxqlRKk6
         YRZ9hstiyKPhp6wShIzu3I/Z4XbmSQqpDFlI71Bf91d7fjJKQjevrNdrjSqjSP76eBHy
         UUjMOeeZA/qK7JgtrxC+HRL2hXFxU0VBskBx0OspOpZEJ3xtxiBd4gJ49M7907HdQ+49
         ChZAaxlgt80ygo5vufL66tfzJ4I8hOjfIzsT0dkH4ZGpsdND61lzMl53fxK6N5LhGnkI
         WKYBDjyc+yxTV5Ogfkb3OYM5MlXOcKyD2HSWSaNuR6mltjrpa4yFl3zZENzExtCZdiyg
         l1UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=GC6B5R1pfzY359nD27E0dLm5dNs9vPh+QFw1Nt6VMiE=;
        fh=8X6+4fQ3Eegt8YDX6OW9RI+0nIJojlKHn9XJunP2neo=;
        b=lX8HKL23F+XbajipWWsT5nvkgHLodPgy+6tG+m+UXfCdZn4zdXKEZJPXDAfip01hyF
         Ycvfe4mPJi08Lh0bnZyqHKDYV6bZ/SVymNoUbp4ALlb00RJa5vh8fJVBCWTeroZFtM/f
         KZyry9jmQkjDDrmBFzGuTJQCG2Ie97HeZHgL+xoT29m5NjflAQLZKJiphpFmZEVQ+sBf
         lhZlsnFdlnhBh99HWwPwj3d24sgezrX5NdlegM7t9kkzFcTIpLkRSG4a9DE/miErPntg
         F89rIRfUvNMc8XAwXxwt90Uyb9OCjhujjJEsl3nLUZLKyIIPmA47eXb+KOrOUi+R32t4
         1WnQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aGg90ASc;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3685b013799sor228499f8f.8.2024.07.18.04.30.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 18 Jul 2024 04:30:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aGg90ASc;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721302250; x=1721907050; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GC6B5R1pfzY359nD27E0dLm5dNs9vPh+QFw1Nt6VMiE=;
        b=aGg90AScRYRM04JA09NZjrkF45HxPCBP5XurkJt3nXY8pPCO6xuITyoSg+/nXP/m9k
         3DYOXC/7bIhsAx5rMDFAGwWpZs3MdzElJVINmZLRqx8H5QFwer5Zs3m2vhwTzHpRuvhh
         l0gefU9y8FuPpBkqqiTUrkMepE/As8zNrdYeBy0ul7k3PYitic7Y+IzbYDPuLv1taEfj
         E5DYnOG4XHko1AP/MBQO+p0JHw/jxSHM2QmyEDUA2FVq7DhOMILlcgnBxe46vHptgBiJ
         mDg+j4+UYyUUtRyR2P2crve8OZK4E8EM1RPuq8FV0m1HfwskvPigIe9EKS02YwkjYE+9
         XitQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721302250; x=1721907050;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GC6B5R1pfzY359nD27E0dLm5dNs9vPh+QFw1Nt6VMiE=;
        b=VNZrrIVvMxI1RS/dAaKc3HE9emlnwakKEVWkrhoMW+VlosDTFfyaQjrEvXkKNc8Bes
         4Ee7ry27qAYnJvZSKg5UX9yhWGbDwdDjeKFDkA3Ea/kpZ+aMXAkOWFnXR90uxWXCgqWc
         HguRHGnbdJLkO/O6u/4pI0UkdBWY0gTlsd2ThSpL4VUZ0SGYVPDBaKMx1RVCSVoObg9q
         Jqg4wpKv3NjeLwSqb28G1+DrC6Z2ZYpzydN7eDmQv1ENpxtB78uQmpZ9cox3+7cCBM/E
         /VSmtNLc3eypBvJl85cFLGgUi2dM050cAbGV47JUcYSK4SN//Kl2qIPgWA5twGWtNLQ8
         sjrQ==
X-Gm-Message-State: AOJu0YwzMe+xd9X9Lc2fqI9JScaEYPVjhndzgDOB2YJPGj2T1MfLyZ1E
	tBrCMJ4kkXbGFKEEAv1xlQedFaL9LaoD4t6xBHJ5qcwzqGWjeqrFe7MTJagHo4uoA5Q9W2fZS1v
	BLRI=
X-Google-Smtp-Source: AGHT+IHnaweuNNOtyRL96PoI9YJ2x6G7utTh+oysypBnhG9oHH3Jv1lCYu0RAEnJ8nw34bz7/GfNBw==
X-Received: by 2002:a05:6000:184f:b0:368:334e:2d2a with SMTP id ffacd0b85a97d-368334e2e94mr4371298f8f.18.1721302250489;
        Thu, 18 Jul 2024 04:30:50 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.176.173.113])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-368447b4b1esm2478804f8f.107.2024.07.18.04.30.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jul 2024 04:30:50 -0700 (PDT)
Message-ID: <392413e8-dfc7-422e-ae9d-a5ee55c02a08@linaro.org>
Date: Thu, 18 Jul 2024 13:30:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/15] testing: bump to latest libvirt-ci
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Thomas Huth <thuth@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alexandre Iooss <erdnaxe@crans.org>, qemu-arm@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Beraldo Leal <bleal@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Ed Maste <emaste@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>
References: <20240718094523.1198645-1-alex.bennee@linaro.org>
 <20240718094523.1198645-2-alex.bennee@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240718094523.1198645-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 5mj0tLbfzmds

On 18/7/24 11:45, Alex Bennée wrote:
> This brings in the latest python mappings for the BSD updates.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .gitlab-ci.d/cirrus/freebsd-13.vars |  2 +-
>   tests/lcitool/libvirt-ci            |  2 +-
>   tests/vm/generated/freebsd.json     | 14 +++++++-------
>   3 files changed, 9 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
