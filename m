Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp877644ejb;
        Fri, 1 Dec 2023 02:28:34 -0800 (PST)
X-Received: by 2002:a17:906:3bd1:b0:a12:a26f:558b with SMTP id v17-20020a1709063bd100b00a12a26f558bmr584654ejf.61.1701426514464;
        Fri, 01 Dec 2023 02:28:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701426514; cv=none;
        d=google.com; s=arc-20160816;
        b=VBC0Nh8HR106jPQPXGuoisQvOXgwmH8Tr+bE4JJuGkVl77qHZSN45yMvSPPfijE+uD
         cMPI5ZSIy0YNq7SFDgRAqCcPW+PhBi64Wx4rp6SX4wlHOjue0oSgRIPByuP2AgzREInz
         HDN2E1vZH0M5vEmzQQ6rm85c5REg0c373ZUYAKVeoJ444BA5BPnG1j7vshg5EUbTCZDl
         oAgS7lynO2p66AYBdgsxk7fM/ptiPOEKv2FjBVHVbR9M791W/T4OCWTYJ5TmyjhPaq7W
         Noy+jZ2WxyHnfDJGJ/z1g5GCELDKdPRMmvq6B1Sx9mdHt79JOknbLMJYTEiQxz6cVhyH
         TU3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=6kNy7wp9+mrUPguJa5BLXGCSuv3Qnf1ooSCECnFKbZA=;
        fh=IALMfbsh+WWBCAVBgwERHPoNFCNFVND+9+Jv4m3cM/M=;
        b=rlmZ8Q/X+HbeLE2P3Iq2SaYMMeaYA7But8KzsZ7hUSvfzIEZcxriwKq26yI5bTabIP
         STKZiBmtzSSMXIQ4RRayIUMNN4McYeDRxWlel0w+1wFvvz08x1UVFj2gnPymwJv+0ohy
         pPXNy6U1ki7ECwhGzucAVMKGGz4arNxdAbt/eYN6FmvxhaYtS3IYZoIPrpzK6x0qYqqq
         yPTtDFUQ4nU/RQAT9cYhMbW+pjuvrezlXL6ALsWuaijZdTaTkSCujYtnl6qSNBx5hjeI
         pFLWpou8ltoe64tWCGTPV224w4CUsQJV+9w9WML7K8tf53uFoccNQXOe/RAx2SX46Gmd
         cHGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F5fDQcxm;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 16-20020a170906019000b00a01cb87115asor102754ejb.7.2023.12.01.02.28.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 01 Dec 2023 02:28:34 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F5fDQcxm;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701426514; x=1702031314; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6kNy7wp9+mrUPguJa5BLXGCSuv3Qnf1ooSCECnFKbZA=;
        b=F5fDQcxm/aCPyTE9wMU4BJReCRBv+vztLieI/z7y9CuOg4KY8Ves+b0hmyMFjed9hk
         5nTh7QbfiOF4+eh3fH0/oOb9+Dhy31mHfqUjkgcrg/vyWyDojTpWm59mB71yAkwbgEXz
         Mw2HdvbNTHpIl7WpWFxQ4VcZhA3CWSdQQnA5ZHOX4gustz2LYN3GGgqg9XrXkTKzGmc3
         62HoNGNC1ji3QXv7lsTvEPjv1xqkLesnx7QasyFh/mP1Fh4RZggdRvgQwP4n6hPlWfUg
         ZszGlHUfToQvk1yiuPlTG0mpTMxBgqWg1AB8KrTS5FHg9AIS/a8+YCbcC5WbBL6TK+Fk
         aTTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701426514; x=1702031314;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6kNy7wp9+mrUPguJa5BLXGCSuv3Qnf1ooSCECnFKbZA=;
        b=Sp7HFKRcE7sGPdCTlwFnH4SH5NHPUbg1Jg6YSzMmIWD1+/hJ+MLrCLPDQ7GX7L5qbx
         SPuW/XLpOuVGbSujxDYb8VaC9shY2xV7xZOFes3tBoj9O5c4FJsgaZjb3lqrNICzX6f+
         obFo3c1Y/xRGgC358Gc7gVKOnV9n3druuq9FbqVJghqfYvJbZlBeRJocSnGBGnAv/RUz
         L/Ag5jgA0A+MIbfiylz+gmSfPNw/xoQnkTlWVlnYHVq82CyvCX9UVAFw2rugQVLPcO3C
         fJI4KGBwQEdQeiBr1SZLkUzA78iGRqRW0vGU1GR/SXBkUH2sFU49XliL0oYLGH+oIlsL
         xJpA==
X-Gm-Message-State: AOJu0Yyx3ssdTsRnpSQ9HAuk9CvtH/6i7YFu4siLqvXHdfLSBZuKdzl0
	PQ4Nhxb3MlI2rLLt1AzjXd/35RutPwZFDQl+pugabMzg
X-Google-Smtp-Source: AGHT+IFFC/5lq7wNrm9U4utXLnX75AbJipWqKHAFuTWgS/56LgaYefY8KUKkUZflCXpL5Rf1SnqarQ==
X-Received: by 2002:a17:906:1c4b:b0:a19:a1ba:8cd1 with SMTP id l11-20020a1709061c4b00b00a19a1ba8cd1mr733858ejg.111.1701426513761;
        Fri, 01 Dec 2023 02:28:33 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.176.160.225])
        by smtp.gmail.com with ESMTPSA id l22-20020a1709067d5600b00a1a4b4feef3sm95885ejp.120.2023.12.01.02.28.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Dec 2023 02:28:33 -0800 (PST)
Message-ID: <cf039383-600b-49b3-bb94-8592a2b3d003@linaro.org>
Date: Fri, 1 Dec 2023 11:28:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] gitlab: add optional job to run flaky avocado
 tests
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Eric Farman <farman@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>, Beraldo Leal <bleal@redhat.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, Radoslaw Biernacki <rad@semihalf.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Eric Auger <eric.auger@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 qemu-s390x@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Cleber Rosa <crosa@redhat.com>,
 Joel Stanley <joel@jms.id.au>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20231201093633.2551497-1-alex.bennee@linaro.org>
 <20231201093633.2551497-8-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231201093633.2551497-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: P0K8P9o/pD/N

On 1/12/23 10:36, Alex Bennée wrote:
> One problem with flaky tests is they often only fail under CI
> conditions which makes it hard to debug. We add an optional allow_fail
> job so developers can trigger the only the flaky tests in the CI
> environment if they are debugging.
> 
> Message-Id: <20231130153333.2424775-4-alex.bennee@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v2
>    - add missing ppc64/aarch64 build
> ---
>   docs/devel/testing.rst                   | 15 ++++++------
>   .gitlab-ci.d/buildtest.yml               | 30 ++++++++++++++++++++++++

This should be split, first add the 'flaky' infrastructure, then
mark tests as flaky, referencing the GitLab issue URL.

>   tests/avocado/boot_linux.py              |  2 ++
>   tests/avocado/boot_linux_console.py      |  1 +
>   tests/avocado/intel_iommu.py             |  1 +
>   tests/avocado/linux_initrd.py            |  2 ++
>   tests/avocado/machine_aspeed.py          |  2 ++
>   tests/avocado/machine_mips_malta.py      |  2 ++
>   tests/avocado/machine_rx_gdbsim.py       |  2 ++
>   tests/avocado/machine_s390_ccw_virtio.py |  1 +
>   tests/avocado/replay_kernel.py           |  2 ++
>   tests/avocado/reverse_debugging.py       |  2 ++
>   tests/avocado/smmu.py                    |  1 +
>   tests/avocado/tuxrun_baselines.py        |  1 +
>   14 files changed, 57 insertions(+), 7 deletions(-)
