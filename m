Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp355834ejb;
        Thu, 30 Nov 2023 08:25:47 -0800 (PST)
X-Received: by 2002:a05:600c:354c:b0:402:cc5c:c98 with SMTP id i12-20020a05600c354c00b00402cc5c0c98mr16044833wmq.13.1701361547000;
        Thu, 30 Nov 2023 08:25:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701361546; cv=none;
        d=google.com; s=arc-20160816;
        b=CdrObinYZUxiHUfsTJiVEPGtZDWoS8wEiCpwAp5OTz+R4aHtcca8hfjjBaKJ57yuw8
         VSQX77yDI3G08Y644OoMgDdIZBHtfqzYtdMB0ssaET5kYko7n7vDXaCI711BJA6V679j
         SIXM/wmvrkH81ws1PLyK+RkMzxA2st7mdt8sgoALZTzTCiKIbMiDcLQH+rLICyWraj2m
         0/xOSEJaDXDYjy/H+Lhf+Zf/PMACTnN/CnEz6AWE+ZXlYTmFs3b2dR3984S2WugCdPaK
         i/K6V9CvEgUNxsRcBHCJtV1xr04y5xBxyV0s+JjSyNvHjxckQccnADR6ws4XwWnDTGuF
         23Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=vhuXMug3aQ5F/kxHcNOxvLvplcIDcKcJglsmAG7to0Q=;
        fh=i8TlUPWvtcWwDVlyQkd5I1FSOh/umfbg0WzFDCz7b7s=;
        b=d6dN07AP9m5L8hK5Y72IIBg+sxFaDdX7cJ6H4lUxbbFnBW3V9Rdj0Ib92gF4JqHFmF
         RyqPZPAS0FEiUu2krzua99O9wWfi+B4dAzXyroUu/N91JFvZ+4PtDgvMRSD92PuIXgHB
         yVwLe/Rh+J2jT5N829kLmB6ikqPvO0kOZAo+w9ih3v1R3nrSuW9/rAg/CLQKBl47oII1
         isBoQV6r705uMpQ6aA5EXUgIj45OeWO/mLgOwniJraNV0G9Gnq85QY02pH7l+eoXv8Nk
         nuIbWHFLpkFd7rm/ykAP49JU0e8RUQtirZtO+2dq4neCYbxjgWKJEUHwcz/yTmwf6lRh
         N6nw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qijpWOVc;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u8-20020a05600c19c800b0040b2b12143bsor549577wmq.0.2023.11.30.08.25.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 30 Nov 2023 08:25:46 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qijpWOVc;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701361546; x=1701966346; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vhuXMug3aQ5F/kxHcNOxvLvplcIDcKcJglsmAG7to0Q=;
        b=qijpWOVcpI5T6IP8lXN/iIOWZRHxRogQ2OYwpqnw9K+D+Z8X85gv5VH1P7v1zz8rBP
         jyBBEyicdQEgggSQDHef0ClPx958xMqlCxNAhpJ+7aXb/40vSMC4ifDWTCBtcZFlICJ8
         vcKr1NVObgnkF8Eb8OYpSqsKhxpFVqbsze2UNa5rtd7mQEvUEqLpo0WsTE0EC2oMYwsf
         SgFIWCvWOTbQ2aiX+7wYLxDeXqXG4fPIrOQgkDIVDDKhFpcTUJrkK0gUvUSClBJsfPqS
         hEhL+7e+ixNE+WacAmbiMUTodADv/wvjvR7HvPYfNon9tYb/m12sABoMdrJyBo5mJG0z
         BvqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701361546; x=1701966346;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vhuXMug3aQ5F/kxHcNOxvLvplcIDcKcJglsmAG7to0Q=;
        b=Q5G5Y6Y6aV0uH5NwyLZjMO7gcRH1rXus1dCq3mCBldmyU87ZPSPBYaCcIa4A2BuCdA
         oVjyykqFd6tZLoQ8kaIAR/hoq9kz1eKYQyP/TJrHMMFIF6bephSBfcZZymR3zZA6tpdw
         x9Wx0z/72qX55NLdGxQP96+m85W26krQAqcZ53N6pB0f+tsuqTSSlhjWbcaHrTREwlke
         KhHNWG9W7Q8Os3a1BZNI1GFe4LgZHfxHPzl3pzviopvMQk72lfTaHwnpSRwvLTxj2+Kl
         1eUMlf72ONCTbBuL38aEXf3NzlSKj3YMr2rdZgLnf+NjKVs0+hcndueabOHRmQ4GfEpb
         AZug==
X-Gm-Message-State: AOJu0YwlEqfKDV8s7Rir/LQgiReM7nXpLdMt3z3HuZ0zq9r/9zwfhag4
	bmmCkI+FZ9mVta31vyd50kxgvWmLtpuQ1klVeDlmEn/o
X-Google-Smtp-Source: AGHT+IHKxKxb4EUuifFNnpudxEMfeakPbcfxSrAXjC/Scj1wDLLA5zqCykeRk/HcdCreOoOrm+VQhQ==
X-Received: by 2002:a05:600c:354c:b0:402:cc5c:c98 with SMTP id i12-20020a05600c354c00b00402cc5c0c98mr16044811wmq.13.1701361546366;
        Thu, 30 Nov 2023 08:25:46 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] (sev93-h02-176-184-17-116.dsl.sta.abo.bbox.fr. [176.184.17.116])
        by smtp.gmail.com with ESMTPSA id r12-20020a05600c458c00b0040b4b66110csm2488544wmo.22.2023.11.30.08.25.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Nov 2023 08:25:45 -0800 (PST)
Message-ID: <6678fa66-22f7-45f3-b83f-453faddd7d45@linaro.org>
Date: Thu, 30 Nov 2023 17:25:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] docs/devel: rationalise unstable gitlab tests under
 FLAKY_TESTS
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Eric Farman <farman@linux.ibm.com>, Cleber Rosa <crosa@redhat.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, =?UTF-8?Q?C=C3=A9dric_Le_Goate?=
 =?UTF-8?Q?r?= <clg@kaod.org>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>, Pavel Dovgalyuk
 <pavel.dovgaluk@ispras.ru>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-s390x@nongnu.org, Beraldo Leal <bleal@redhat.com>,
 Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>
References: <20231130153333.2424775-1-alex.bennee@linaro.org>
 <20231130153333.2424775-3-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231130153333.2424775-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: IoeOVTU/RWL4

On 30/11/23 16:33, Alex Bennée wrote:
> It doesn't make sense to have two classes of flaky tests. While it may
> take the constrained environment of CI to trigger failures easily it
> doesn't mean they don't occasionally happen on developer machines. As
> CI is the gating factor to passing there is no point developers
> running the tests locally anyway unless they are trying to fix things.
> 
> While we are at it update the language in the docs to discourage the
> QEMU_TEST_FLAKY_TESTS becoming a permanent solution.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   docs/devel/testing.rst                   | 31 +++++++++++++++---------
>   tests/avocado/boot_linux.py              |  8 +++---
>   tests/avocado/boot_linux_console.py      |  5 ++--
>   tests/avocado/intel_iommu.py             |  5 ++--
>   tests/avocado/linux_initrd.py            |  5 ++--
>   tests/avocado/machine_aspeed.py          |  8 +++---
>   tests/avocado/machine_mips_malta.py      |  8 +++---
>   tests/avocado/machine_rx_gdbsim.py       |  8 +++---
>   tests/avocado/machine_s390_ccw_virtio.py |  2 +-
>   tests/avocado/replay_kernel.py           |  5 ++--
>   tests/avocado/reverse_debugging.py       | 14 +++++++----
>   tests/avocado/smmu.py                    |  5 ++--
>   tests/avocado/tuxrun_baselines.py        |  4 +--
>   13 files changed, 67 insertions(+), 41 deletions(-)


> diff --git a/tests/avocado/boot_linux.py b/tests/avocado/boot_linux.py
> index be30dcbd58..9e9773e6e1 100644
> --- a/tests/avocado/boot_linux.py
> +++ b/tests/avocado/boot_linux.py
> @@ -12,7 +12,7 @@
>   
>   from avocado_qemu import LinuxTest, BUILD_DIR
>   
> -from avocado import skipIf
> +from avocado import skipUnless
>   
>   
>   class BootLinuxX8664(LinuxTest):
> @@ -93,7 +93,8 @@ class BootLinuxPPC64(LinuxTest):
>   
>       timeout = 360
>   
> -    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
> +    @skipUnless(os.getenv('QEMU_TEST_FLAKY_TESTS'), 'Test is unstable on GitLab')

Later we could move that to a @flakyTest decorator around QemuBaseTest.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> +
>       def test_pseries_tcg(self):
>           """
>           :avocado: tags=machine:pseries
