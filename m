Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp1826684njb;
        Mon, 29 Jul 2024 07:40:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV586U46y28rRj0pOVgRlYYOxHcKE80eMNUKYbwGGWxPmqOZmvwWFY7TOLm3Z2YmL6w6d7njvwtExrG+Qfv1x7y/G1qypyE
X-Received: by 2002:adf:fa06:0:b0:368:4bc0:9210 with SMTP id ffacd0b85a97d-36b5d0237a8mr4684333f8f.25.1722264041533;
        Mon, 29 Jul 2024 07:40:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722264041; cv=none;
        d=google.com; s=arc-20160816;
        b=ar4PbktcVEJteWCcU3yzG/u6tGYhB7PsOboJfiIbFAHjVpQCf0vnXaregKq//o6GYh
         UxVrABzxggTa3YDYOSI5jn2byuUtT3zfhr0CkFuLXobYgvRLkx9ecn3suIdEKYaa80zT
         jsx703emMyMl7INaqvlALE2soYye83lLaTGGylnH1PXK4Z0wzuGB742EiJIhSATde/E5
         /iBgScCM8mb12fwP4HpwnAKrpBRYPoktR8soApewnhG/VtuespKZNdPzDtY1rLPwsiFv
         S/szduAKNF1VdAM3ECTtSkFZ2ZarSOZHpGHBEGT3aJApO8qhPvYMd5HBr0uNlO+YdXGT
         fn7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=j3e9b1ZbsCUPjFEgRqJ+hwXbs28Kkpn08+Yw7FV+otA=;
        fh=ceBK8SmtfnKm7QEIc7rodq9AvIhycUkXCL7GAVPat1Q=;
        b=M9T/0GKtGsYUlmlRWyoRzeyMTuaOmPsl57biLGMBee6IhToflWUi/1Gla13sJL/pvX
         QRZMctqoG7R+gBVQa5UTm5qoY9BIgeKWwCEVhISxg2YBh2DmeWfetAjrwwK3vFhwY5id
         n28LDeYUbolZZzdQOfy+KXnYZbathm0BNg6LRPmeVz/T9of1tRHrcJ60tY7/F/sxqT33
         B3FDCtPHyX24NSWny7UhBA3qHzjvQ24yNkoAtgpF0YPxaRkjhRJBKU+p3Nv4sgYkvdyZ
         K+rDgC5C+Bgj5GCulKs42k0sUkk1m12JUNQ6Utp4GrRV6U5IUBmwfX4r/O5qq5HjSN1u
         fVGA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A137PeAl;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-42808e85532sor22913285e9.3.2024.07.29.07.40.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 29 Jul 2024 07:40:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A137PeAl;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722264040; x=1722868840; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j3e9b1ZbsCUPjFEgRqJ+hwXbs28Kkpn08+Yw7FV+otA=;
        b=A137PeAl+tocJrWSnuxKr3d52YydI5KZldUhrsqv6Hw/Tbp0tb6NNs4T8RAzTCEgc4
         S1SZmA6xUjdDehfjTSd3nuS89mv+LJ5AK24ODWbHF3YkQqLy5tvYGyWs+ADfgvQsExpH
         kbtTD+Nv9m8EFwpSaPioUgRE/sxbqQx17cp78zz7QUQYp4F1Oebpg9uzq74fRa3KULsM
         BOc9hcHLG6blXnmbWpZAWB6hr06aelALXY5TfjHh1oINrlMTYQyr8s4kNBBRj0IRI/UN
         sws6b82MSTB5w20BPSMlffLkDeTNWsxyQLfHV3QiMRksLCKeY8odyyV4hfq12kO6KH/O
         Scjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722264040; x=1722868840;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j3e9b1ZbsCUPjFEgRqJ+hwXbs28Kkpn08+Yw7FV+otA=;
        b=u3xyCV4SQfJV63tfdUG7bUh20MIvEL9jU6TXMs+FpkEYoKI1YZ9WUXqVc7QUR3wB7B
         L/4oK5NPmBinkHC8zHgE3peY30qalxxLQKsi+8fzWF4I3BRPPIqygLcSaSUrOMBaw//L
         sNsjoG+Es/olH340hWahBFtrezKY8NVdsQs03W4iW/gH8QW5oPz6U7YnS0YKW8wwI3xg
         k4NCKeb28MoASGK7cfhsEg0bgLdmfIL9UYFz9PqrR55aTQ66cRs9650JguOmFSeedO0M
         5yK1MbpqPfEmVi37n0ZaWcsiRvLT0zPr/y+DHu0ZDcKS98zSFDa8oRMa+WfeBlHN7Zj8
         W2Ag==
X-Forwarded-Encrypted: i=1; AJvYcCXAilf69wlsQWqEp3QVqw58Ko23f1beiGqhG6jYMnDAPUSfu/BCSYaZD5alEKt25XTub9WQRMW6L3WjrDLA/sulstRU3ONr
X-Gm-Message-State: AOJu0Yx+hGmlLYSzncPv2E4x5qcJwMkecJIxrRKurHunvF4j5b7NVhUq
	LMd/Q0bkdO6k1PRYbRbfLWt2bb0L/5lz/Yi+karq/0YGa/UKLlBqetytldLtq7+6uA==
X-Google-Smtp-Source: AGHT+IFHgcVZBSsqx+kJWyuBFGP6dDtPg8rYuEWdm5awfdO3TlQSRElWHr7IrKK+DGDGkjwxVHIITg==
X-Received: by 2002:a05:600c:3ba6:b0:426:6667:bbbe with SMTP id 5b1f17b1804b1-42811d89a5bmr62687045e9.9.1722264039627;
        Mon, 29 Jul 2024 07:40:39 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.176.173.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-428218a3934sm2651625e9.45.2024.07.29.07.40.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jul 2024 07:40:39 -0700 (PDT)
Message-ID: <0977da6d-53c9-4ea4-a099-531d76258dfd@linaro.org>
Date: Mon, 29 Jul 2024 16:40:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/13] Bump Avocado to 103.0 LTS and update tests for
 compatibility and new features
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, kvm@vger.kernel.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Radoslaw Biernacki <rad@semihalf.com>, Paul Durrant <paul@xen.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Akihiko Odaki <akihiko.odaki@daynix.com>
References: <20240726134438.14720-1-crosa@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240726134438.14720-1-crosa@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 11KNoKw0BYk0

On 26/7/24 15:44, Cleber Rosa wrote:

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

Queuing patches #1, #2 and #8. Unfortunately #10 depends on Avocado
101.0 so can't be merged at this point.
