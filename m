Received: by 2002:a05:622a:6187:b0:4a7:49b6:ba6e with SMTP id hh7csp2331939qtb;
        Mon, 30 Jun 2025 03:39:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWczVuCzbIzWbYQ6PUaUDZLiobgAFsjgfpSvlVfyyY6g/43Rdt4WIaDz3fbGMVxEbTnVS9Q6YqzBLRTYQ==@linaro.org
X-Received: by 2002:a05:600c:444f:b0:450:d012:df85 with SMTP id 5b1f17b1804b1-453952b30ddmr91067655e9.18.1751279950189;
        Mon, 30 Jun 2025 03:39:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751279950; cv=none;
        d=google.com; s=arc-20240605;
        b=irx5Y7a5y2Kjhev05MoVL3RGXYYfeydMxvvAnXnWKZwbDc0zWnnMP1GtXAW2b2OK33
         /yA8uVDzdqfu9kQreAp3fwrTp1cWF+nHI31A62yWnLQzB/1dKgr0XzSFdheDvTcx0Acn
         nlUd9pfW/ht08s0wsFgm2bc2Z4QI4j3ZnfAgP9OdPRJjSMiSjICjRuwSJTpsD1TofMVB
         CkzRh5esdS5VXfKLlRQSeRvsGdfuwRbcBMeb4exL3alMDoT//2iRk3spgLCYRWeD4xLK
         6nwYbrZf2Chm6d/e5pPBU7kx/I5bdyp0SIhatJ4naEqIQRGrTtYNnByTj2zRN80SM9+K
         CnxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=aY2ljNQQ7s+olZYdhb6NcXGhl/GbIzPd8ZgET/oFbLk=;
        fh=+kPfuGM3O/GQ2OH46nxtJUHQ/kjX4x2ScA4IgJZar4c=;
        b=TCqd6Hexrsqe5FLb71ngZj2F+K/i48AVhN1jR6lxlbH5lp0PXGI+5N5bNMli8i6C8r
         hlnnXXTyFrX7JFILMeSZIfm3cXlS2RDA9VDpFJDkeaY6mBULnpzOQo4SleYLw1uldHI7
         hKnlbHgb4eq7qCwxndA7cKmUOtw9QMfJaxEX4wXDfcOti6PTeBIxrV0zxquDVa9j32q9
         VMmeo7NkqNeKLlA+MKqnoyL7cfsuImO29aif0lbSP+ucfS5/Wbnkte/2h9yDqPeLLa2F
         NLBGy+uekr7a33jkHimMPEbDXE9HGz4oQkUFbu/Cr3KdNfMC5En/6HJfwl/Zzio/N8zr
         PrzA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SY4C8Blc;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4539b91ae93sor9680125e9.3.2025.06.30.03.39.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 30 Jun 2025 03:39:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SY4C8Blc;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751279950; x=1751884750; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aY2ljNQQ7s+olZYdhb6NcXGhl/GbIzPd8ZgET/oFbLk=;
        b=SY4C8Blcm9HGH7lA/V3D4fs341R9uY1VkNa7tFsvc1LqVJxluISkqGHWt6RSPSgaGE
         u/QJirC9HmZ6Csbp0GketMR+rSnooXglvZxh70cR+s6If0Tl6aywZ/a5VcKrRusNoLTn
         kEr55btFDdPvZdjpYu0aR/n/Qo6a/OmRq32ydepCxtCGYuBu7cA4KsL1m1xuIkptaJr6
         iIMuEbJBqu89gh0Yi4tlzqEj1qk6QmRXizd3mvzLyRZXt49EMPfqsYmPkxf9GlaududC
         pggKjIYo/oz9pZzXkTZPeqBHZS6f0mmOn5y2vwV9UQ6AvqvEhhYMjDP+pqhVM1m5DxKt
         6Heg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751279950; x=1751884750;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aY2ljNQQ7s+olZYdhb6NcXGhl/GbIzPd8ZgET/oFbLk=;
        b=AxKFnjfTKBV4uTXu4Jikgd5pF+a7x56HSjA13NIN+lpVIxpcN0WHLHtD1GB/rE+EEO
         zfZu+lk0gF0PFlJIo9ZMib/qUlAI1l8ZvGTKtsOSqGnHD/GcpaM5U+Jrb9/3vCjsE9bg
         PQZ6Pe+B3+O6Mzt+X5ewDWGoovx+1h+IVfI58CN2kYwveTTbmmvJZwgk24+Jc89BRgpk
         kMJogFV6QaJWoYt5M+9nDw6mlkAdlaRCUh6ZFimQgm3+XABNvh/Q9OUapvDcLkN2wgRZ
         2N3FIUOABTaAbUL0qLQeekpU8NKGBDs8y9DkStputsuf/ecOw0j0fjgAADmWFZDO4t/X
         uoxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTnKuUhOoaBUY8ISPP8pJ+FTSIzn8q/50ZGbOJHJCx1VL7BbVIxUfuCjvsaEx8V4mlbKW6bwRX5ktH4g==@linaro.org
X-Gm-Message-State: AOJu0YyLt2DE9K2NLrqxM79O9NxJ952Wu13hhCCb/ezX6Stf1U9/xA/g
	inxpN6hfD9al/V2lYY8mXIOkNtlVEjWkMSP6Q6Sgw44RJ73yRrIgohd8VkKIZ7aRp9yQpg==
X-Gm-Gg: ASbGnctQiHDZZHQJ1/HK9hbnaiGfTFv09sW16+IH2VqpzA/3RvML0FVG82AsVqkjVTz
	Nopa+kc3NP6O1vnmxKn5Vq4kXUO36/FDN5TnzmZHyRT5n5E3TUyLZCEcJhA6EobkfOziNICO5V5
	AVE+EniUlPYoMxPdyZdLN+9aF5xVmoYoBh7ZqbzTOJe7d9BAWQneEtMUv5e8jfKDi7bd5f9SR/W
	t7dwLhtjEOCT/E/k8zlLH/fQPlBqfGiP0SqtDFTJQ3+YbFukPSH7JJMykMR8MCcceMxuSnCn+pm
	Ig9/m5dgGodzi3zVOGV/wtOlSnHqmwnGdXBu3RYpesBAwOp8gtunIzHf09sA2qj2vK1RxJQLsdN
	FgUt5JQDC/60JlaaeVsSPKRnMMLjH8w==
X-Google-Smtp-Source: AGHT+IFNhBcdHyj20tEsizIFcK97MLoriVP6w1Dr62XMrnK4u6j3KiXisn9MgQ0GTm/kkt4YtpK0UA==
X-Received: by 2002:a05:600c:138b:b0:450:d4a6:79ad with SMTP id 5b1f17b1804b1-4538ee6e564mr117965735e9.23.1751279949555;
        Mon, 30 Jun 2025 03:39:09 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.218] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e59628sm9858422f8f.81.2025.06.30.03.39.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 03:39:08 -0700 (PDT)
Message-ID: <14f8aa18-1aab-4e40-9ee4-987793f08a33@linaro.org>
Date: Mon, 30 Jun 2025 12:39:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/26] arm: Fixes and preparatory cleanups for
 split-accel
To: qemu-devel@nongnu.org
Cc: Leif Lindholm <leif.lindholm@oss.qualcomm.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Roman Bolshakov <rbolshakov@ddn.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, Bernhard Beschow <shentey@gmail.com>,
 John Snow <jsnow@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 kvm@vger.kernel.org, Eric Auger <eric.auger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Cameron Esfahani
 <dirty@apple.com>, Cleber Rosa <crosa@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250623121845.7214-1-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250623121845.7214-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: FXVaFkN49lBx

Ping? (series fully reviewed)

On 23/6/25 14:18, Philippe Mathieu-Daudé wrote:

> Philippe Mathieu-Daudé (26):
>    target/arm: Remove arm_handle_psci_call() stub
>    target/arm: Reduce arm_cpu_post_init() declaration scope
>    target/arm: Unify gen_exception_internal()
>    target/arm/hvf: Simplify GIC hvf_arch_init_vcpu()
>    target/arm/hvf: Directly re-lock BQL after hv_vcpu_run()
>    target/arm/hvf: Trace hv_vcpu_run() failures
>    accel/hvf: Trace VM memory mapping
>    target/arm/hvf: Log $pc in hvf_unknown_hvc() trace event
>    target/arm: Correct KVM & HVF dtb_compatible value
>    accel/hvf: Model PhysTimer register
>    target/arm/hvf: Pass @target_el argument to hvf_raise_exception()
>    target/arm: Restrict system register properties to system binary
>    target/arm: Create GTimers *after* features finalized / accel realized
>    accel: Keep reference to AccelOpsClass in AccelClass
>    accel: Introduce AccelOpsClass::cpu_target_realize() hook
>    accel/hvf: Add hvf_arch_cpu_realize() stubs
>    target/arm/hvf: Really set Generic Timer counter frequency
>    hw/arm/virt: Only require TCG || QTest to use TrustZone
>    hw/arm/virt: Only require TCG || QTest to use virtualization extension
>    hw/arm/virt: Rename cpu_post_init() -> post_cpus_gic_realized()
>    hw/arm/sbsa-ref: Tidy up use of RAMLIMIT_GB definition
>    tests/functional: Set sbsa-ref machine type in each test function
>    tests/functional: Restrict nested Aarch64 Xen test to TCG
>    tests/functional: Require TCG to run Aarch64 imx8mp-evk test
>    tests/functional: Add hvf_available() helper
>    tests/functional: Expand Aarch64 SMMU tests to run on HVF accelerator
