Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp487525lfe;
        Mon, 16 Mar 2020 12:54:10 -0700 (PDT)
X-Received: by 2002:a65:4081:: with SMTP id t1mr1481580pgp.134.1584388450567;
        Mon, 16 Mar 2020 12:54:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584388450; cv=none;
        d=google.com; s=arc-20160816;
        b=tyWF2R9bfnFkpzEdb3wtw4BGs5SHOlbSfbacn9lPuo12HVFEbJ2ajijb0cZ0QEycIs
         M8d2lsyGvBnAyXlf7iVYCW2kINCe8L1ihnfDQQo8xb8y0kFH+iwGNV2IDMM7LczJ2S6b
         VhKWp/4AvvwFtnYxUbm9/vhFbeb5z0PVYCZ9F7FojDpi+oXbPqwbP7D5LS4MdjnE+WSY
         Quqs6WzN5VmVow68+6/LCASZzsLgY7D5rpVzrTHH7sXvFrGxm18+WMHfz3rJAGxh0r3I
         K2bYSQv+PioXrdglnS0qPg90s6MPmr0cKT0E5LEAJq4JfkAZ00JLXM3hRoKhhhqtvFKg
         46/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=J0uobKBgK4rHZ0hjWoBdZkci++dbIcJWriw2kCPQsXs=;
        b=rHY3h/v46JrZcNIsl061Ij9PrdOLiwu2mbc2TwHBJtI6mqQ8QJ4K6gWsLwyWX4JmO7
         nA5L7sIdO7hVsZHvWiTa+lSLijUzkLtrog1R53Kdav223Ml1iYXFiS79cRbtV8Cb1Kxd
         HTTgYzGJkm3+xj5dgoPeUaaL7aRC1mMkFNBnPL7ehOX7I77kNqgPdDF/d10B6EXknfC8
         k0wmoRNNX55b8nll3jdMJOqpGapjVPWVM3W4jc/MfYvvn2uI0nO8CWfXzz/F+wyrMvR4
         RdCLonckkSBlqMVmJKHpoAlI3hl8waIrvy6g3wnuo6KTBojPNrBrE3opzWFJg6KGqMuk
         zfbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VBoYJfmu;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id u16sor891183pga.3.2020.03.16.12.54.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 16 Mar 2020 12:54:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VBoYJfmu;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=J0uobKBgK4rHZ0hjWoBdZkci++dbIcJWriw2kCPQsXs=;
        b=VBoYJfmuvaGBrugdO/DrCXhiDIyTOTxyjk3+L+oRn/eFQXQK+YHtv4UMbvsiMAbZP2
         23y3Sgp5psLOea82yutv9iU8nulEA6PIOHKyZzWf3FYu1Eq9QTNxkrAQNXA/FusCZsBQ
         pHXuv/DnAeYNEjXoLBMtdhZIIkGq/8+0WKUUxFohhFFTycwg0kDBx7N6YJtoNa591ueC
         oHTG+OSIf/8BwaspwHEnXCwd/VNNyICWMyqEKj8CWBbVQGrC+E/A1JIBT2ZEuRN2WlDj
         548E5I0aeW/O+F0Goih6831O4k5Z12z5vrnW0pVVwihckLJPa6Z6W7huUE7ak0g3VmJz
         VCqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=J0uobKBgK4rHZ0hjWoBdZkci++dbIcJWriw2kCPQsXs=;
        b=bcfPg20aWBCMX7WfVW+1D3DMRk7HEAWBEq4PwFoSOrIJ2lvRP4NQYy6mYxZQkUgeRi
         xyoaEPZYR8IEyE+bm10eXYYlRgLCZ0aKIOCR1VdL6/wXXKCLCJi10eRaTMeFNtsUZCSF
         petQ7fr5eoBK1ZgMfGAswLMxZUa8iFWdihXGooOezm9DEGhmCt6IilsuVS1ULt0P9Eoq
         1kFdSRXJC6NUwCqAh48RT4d93fm9fCkD+wUR6r2m39Ds4UhqJTmlxn/Ll+0sbZn0NKAw
         QzI3ElnGNlJ4ViNH3hyXjU1BCtnTvtS9H7YO+LrmiXbwg4pPVWT7Aq6FTx5JRrzuFhaM
         uC8A==
X-Gm-Message-State: ANhLgQ2ziTXJlzmHCQvhqnWvhlaPvSAoTXVqsztRuQB/RaQ/PaisRRK+
	L2ph6cc8ZDCsWdvld7BGxbaLeg8D
X-Google-Smtp-Source: ADFU+vszr2eVMxAjcMPZzWWCPhhjw6Y5KImoake42lZ76b/FAthTjOmvFTNUgtos8pANIhHmIZiLgw==
X-Received: by 2002:a63:3547:: with SMTP id c68mr1425842pga.380.1584388450100;
        Mon, 16 Mar 2020 12:54:10 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id p9sm538444pjo.28.2020.03.16.12.54.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2020 12:54:09 -0700 (PDT)
Subject: Re: [PATCH v3 12/19] target/arm: Restrict ARMv6 cpus to TCG accel
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 kvm@vger.kernel.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20200316160634.3386-1-philmd@redhat.com>
 <20200316160634.3386-13-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e3728368-4c23-ac70-949e-d02ea698887a@linaro.org>
Date: Mon, 16 Mar 2020 12:54:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200316160634.3386-13-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: a7phaCyVQInv

On 3/16/20 9:06 AM, Philippe Mathieu-Daudé wrote:
> +static void arm_v6_cpu_register_types(void)
> +{
> +    const ARMCPUInfo *info = arm_v6_cpus;
> +
> +    while (info->name) {
> +        arm_cpu_register(info);
> +        info++;
> +    }
> +}

Likewise wrt ARRAY_SIZE, otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
