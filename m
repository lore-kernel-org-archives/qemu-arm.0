Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp1376421njb;
        Sun, 28 Jul 2024 08:27:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXjrKLz9uoYa8XrhWJqMfHe1P8QJ4eHe+3mM/ek+3xRiHtkbb17F3l54nSSFlpHayNH3lDWRXrgnPFc0idRs1epW+p1nbAa
X-Received: by 2002:a05:6808:3028:b0:3d6:71d4:e90d with SMTP id 5614622812f47-3db23d38bcbmr5055653b6e.50.1722180468566;
        Sun, 28 Jul 2024 08:27:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722180468; cv=none;
        d=google.com; s=arc-20160816;
        b=dpWNj99Br/CCxtFCmAG4sOoyLhf+KTWurXkdKsLTXSEMcpZTPq9grJulTcv2zRgrCj
         0V3rGniTNfVXDpD++W2mEeo7FqnxJjquNJB51zU0UBiw3m0TqoFRzP3NzzpwW7SABfDw
         luw5dq3W8mz2UsJcGyOhnxs81xxS3VoVYp3HPzfl8c0Kn7g+Gp3GwWagmZM3iGAVOOHK
         vATNJAHGPPzgmioFQMgcAPpRiTGdi2DUH6F6G2R8A2bBhqFSnefIBBvAxxAADvyNBqvC
         pJnoFnhWHJkzCK56sbO5+xUg0YwyDT2AdwKNzTdlaefhrzSeFCoI5cECfy9b4DqOHeJD
         c6FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=RLNZtX5NhiWjh8pTpiHyCLdAqm/MusJQss3pc8cjtvA=;
        fh=FLKZkjxXHG9kcZkPXNhvvBeQp++KSbuNAqNYFbM/5zc=;
        b=0zPNQjsbjLjLP/FOh1CEf9F98M7tGrhxiUA6QXT7DHvDg9a2aOswV2VmahUr65tdpB
         ywRmF4uCnKfxfJ9uTcXAbIVhVywFuegwdx1CmTeBDwAD7WqjyNv8KhYotrtU1ixdn/d5
         iI9/ZjL+MYzk+AJfMHCUiNrcVAC2izpeU6txZolfUNfqXAIiPdEBf1uoYDxFywXQnODT
         nHBpegbV5RSvHshF/ihs2dM1Op2vSiCJEoOWBU+b7j2TvSFkMaxl9qr6WnMp5QXoQ4le
         4Jch1Ow5Tf11WGIZPgJdp2EL4fGot4U5ZgUTZkBYY44usyyY1fi/Rb8ACW3ymUr5RnTZ
         vuIA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=WY8LRkcH;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-70ead71f7ebsor5568065b3a.4.2024.07.28.08.27.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 28 Jul 2024 08:27:48 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=WY8LRkcH;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1722180468; x=1722785268; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RLNZtX5NhiWjh8pTpiHyCLdAqm/MusJQss3pc8cjtvA=;
        b=WY8LRkcHYu/WX6cH1OnphxFixiw7EBytAoSSgNhbB2iUffuLei3DRfLYB5Aeyo2yJq
         qxMTAJd+StTg9dRVKycNEkM1dQ+iQ2OLOdeshDz/ec1Np+WsIDuBuvxBwk2jmFs6Sq9m
         DGIC/fzh3tXC2im809zlu4bkBts4+W11Bhr+V9HeKxvl5iU/WXqXsbDI9+CY+YsUYix9
         eSxVXsLELH5X7uuvpjeinhxdptaL66xxdGPSFJ0qRLFn6mSNKtUZ8DU4H4LSNr1USRGU
         ePBN1p03tl584G5CVNFIMWilsjS+OaXD2tb0tDlBBn0AjuwKD0eADJsA8r5Bk/ctRHJr
         k8Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722180468; x=1722785268;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RLNZtX5NhiWjh8pTpiHyCLdAqm/MusJQss3pc8cjtvA=;
        b=o7O3kG9Gu71Kxqn2/t0LuiIFkYstvv7npqNadS02z9X4majXfSDeiRHlgMVjjNJjmg
         lmzYQM3U+zk48gV2o9Lrz8jz29mjLRCg8M3LDWaWk771TKkpaqUqbhGYm7K/XL/x5brU
         stKsflFYGLcN2Si4UpmPCrRS9WVbLvTUeNwIlF55crpTOLnspoUzMQ7zzk/R8116OMtu
         450+L0UJeHr6Xft1mPWaSC3wtGg4EDFtXtSCxr0nX8sFGQxTQreRZKUoxv8aHKrz0VM2
         zQOppziDyUzXB7vCj6Z8Orew3mwjX17DQjGnLwTBX67Ur71e2uPGDzQcsWvVPpSCpeo3
         WaqQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2Q9jebCMjjejC4IafoMz8rjfI4PydkhN/cxwz7GYAf19kpY1KjeEK21PoxHqU7V/fcdPbQrOmh66PkUA7uPVKln1Kv7mM
X-Gm-Message-State: AOJu0YwBfuuqtms7O7sPpw5jZNAkH7QBff0uQQFJxuteSUWMptOyb9oy
	3mB1LzrcSeb2/IzoCmWZaQPiwO7wdGF1wDM5OiXMiQnNtPbm/n+KjYUvmJlJz/s=
X-Google-Smtp-Source: AGHT+IF3ctAx7D4BmK/J3K8ksZbvsUjXa+3JPF7azc14f59vwyWxf75VXj4f3Ql1F8QaYpsSFuIiqQ==
X-Received: by 2002:a05:6a00:4fd2:b0:70b:3175:1f4f with SMTP id d2e1a72fcca58-70ecea40e8amr3771492b3a.16.1722180468007;
        Sun, 28 Jul 2024 08:27:48 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from ?IPV6:2400:4050:a840:1e00:32ed:25ae:21b1:72d6? ([2400:4050:a840:1e00:32ed:25ae:21b1:72d6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead814233sm5419684b3a.124.2024.07.28.08.27.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jul 2024 08:27:47 -0700 (PDT)
Message-ID: <27dda662-baef-4f09-86e0-168ab1d47a87@daynix.com>
Date: Mon, 29 Jul 2024 00:27:43 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/13] Bump Avocado to 103.0 LTS and update tests for
 compatibility and new features
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 David Woodhouse <dwmw2@infradead.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, kvm@vger.kernel.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Radoslaw Biernacki <rad@semihalf.com>, Paul Durrant <paul@xen.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20240726134438.14720-1-crosa@redhat.com>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20240726134438.14720-1-crosa@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: ILQ2mfbAdSYk

On 2024/07/26 22:44, Cleber Rosa wrote:
> This is a *long* overdue update of the Avocado version used in QEMU.
> It comes a time where the role of the runner and the libraries are
> being discussed and questioned.
> 
> These exact commits have been staging on my side for over 30 days now,
> and I was exceeding what I should in terms of testing before posting.
> I apologize for the miscalculation.
> 
> Nevertheless, as pointed out, on the ML, these changes are needed NOW.
> 
> Some examples of runs in the CI can be seen below:
> 
> * Serial with 103.0 LTS (https://gitlab.com/cleber.gnu/qemu/-/jobs/7074346143#L220):
>     RESULTS    : PASS 46 | ERROR 0 | FAIL 0 | SKIP 2 | WARN 0 | INTERRUPT 0 | CANCEL 0
>     JOB TIME   : 432.63 s
> 
> * Parallel with 103.0 LTS (https://gitlab.com/cleber.gnu/qemu/-/jobs/7085879478#L222)
>     RESULTS    : PASS 46 | ERROR 0 | FAIL 0 | SKIP 2 | WARN 0 | INTERRUPT 0 | CANCEL 0
>     JOB TIME   : 148.99 s
> 
> Cleber Rosa (13):
>    tests/avocado: mips: fallback to HTTP given certificate expiration
>    tests/avocado: mips: add hint for fetchasset plugin
>    tests/avocado/intel_iommu.py: increase timeout
>    tests/avocado: add cdrom permission related tests
>    tests/avocado: machine aarch64: standardize location and RO access
>    tests/avocado: use more distinct names for assets
>    tests/avocado/kvm_xen_guest.py: cope with asset RW requirements
>    testa/avocado: test_arm_emcraft_sf2: handle RW requirements for asset
>    tests/avocado/boot_xen.py: fetch kernel during test setUp()
>    tests/avocado/tuxrun_baselines.py: use Avocado's zstd support
>    tests/avocado/machine_aarch64_sbsaref.py: allow for rw usage of image
>    Bump avocado to 103.0
>    Avocado tests: allow for parallel execution of tests
> 
>   docs/devel/testing.rst                   | 12 +++++++
>   pythondeps.toml                          |  2 +-
>   tests/Makefile.include                   |  6 +++-
>   tests/avocado/boot_linux_console.py      | 24 ++++++++------
>   tests/avocado/boot_xen.py                | 13 ++++----
>   tests/avocado/cdrom.py                   | 41 ++++++++++++++++++++++++
>   tests/avocado/intel_iommu.py             |  2 ++
>   tests/avocado/kvm_xen_guest.py           | 30 +++++++++++------
>   tests/avocado/machine_aarch64_sbsaref.py | 11 +++++--
>   tests/avocado/machine_aarch64_virt.py    | 14 ++++----
>   tests/avocado/netdev-ethtool.py          |  3 +-
>   tests/avocado/tuxrun_baselines.py        | 16 ++++-----
>   12 files changed, 125 insertions(+), 49 deletions(-)
>   create mode 100644 tests/avocado/cdrom.py
> 

Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
