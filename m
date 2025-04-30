Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp787053njm;
        Wed, 30 Apr 2025 01:32:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX9itvRTs4D8L3rTiPhBSETbiLLG4EJTiIBQUzlVBqJ3dT0ahtN8xo4fCFGRY8KeYlU8facUtdEaPGaBg==@linaro.org
X-Received: by 2002:a05:600c:1d20:b0:43c:fe85:e4ba with SMTP id 5b1f17b1804b1-441b1f3a571mr21584255e9.15.1746001939572;
        Wed, 30 Apr 2025 01:32:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746001939; cv=none;
        d=google.com; s=arc-20240605;
        b=PmvY4i63Qb7T2+/AsDYfSEzd1E/xEK6vlFZqKj//GOkjewP77KWTT5ETwJwTNE2vXa
         1abonpfacTFloVRoXqM8gTEUNzb8rB8GEEiAcHGDp0f4e++M2y3L7E+hux2wUPBsCAP0
         mEG8oQHIz32iiKO6MkHZQyF1QENEE6sNy6+9Yh7o8PFN18ORJK3T0Ggbu6B5RHqo/CNx
         IRQmiUnWBvrDsmnCB3WSlDgUn65zfAQbsJvUTBr0GiZDWdHmsU/rko3jsmBll6XToJHQ
         SHZYchKk6wyCFlx240Uau7GOPSL2seMa4UjPcCfBNttXrjjkYhYE04hKmSt67EsTHstH
         J0Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=2qvonH+2UdIFy8nw1UMPJbLg1oAPPZJBDd5LZzjkU1c=;
        fh=OTpwQMj5S6sOLV/AGitbTiG6phKDm3TfXiHqxiHh6Fo=;
        b=cVJbGcjx68ZQ37ORMi4QdhGXIUK1v+Lq8WHrZVsjbfzzc5IaBQu9SrB/xJiiLF2Zem
         sNNnmQ8HZPXN3iF5DzQZPQ38wYYUJNjyvfboEDMTLlgvmB9KbY77EXlYRoUClzm36ozE
         t8/e/9oBmtuDHBnQFmw5FpUx18bzbaJViaumWzZ4g13GFeCpLh5CLMW2tE4eS8Wet9kw
         AbNufBc+/kSKvUnWEOpkBoE0IX2Vt9UX05BpSoO8LROmjU1qeK0ZLX08HKjToK0LcPul
         75XibELkyrLohETJGSrnHhUA0Vc0iZtyHIRRG6Y1IzClVTOc/QAwvMJDVLhDhJW87tV8
         vD6w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Pdy1JSTr;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4409c2aa3e8sor57836725e9.1.2025.04.30.01.32.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 30 Apr 2025 01:32:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Pdy1JSTr;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746001939; x=1746606739; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2qvonH+2UdIFy8nw1UMPJbLg1oAPPZJBDd5LZzjkU1c=;
        b=Pdy1JSTrTZxnBlftrM39oJWY/doBxC7Nox/Px2ej98PiiWVJ0MUVBA0c9mGlAdPFwf
         GuJxgXL5ZM4zw08JZeqO5zC1O8hzt5zTpn0S/Ofd4zIihGq1lP+qFFCeJ2OQSfA4SERE
         jcIRpSlOdZx26OSXtGS1bdUl3Uq8YF2rMZc8Tg7kuiDZlgJU0rBGD4KfbubCsR8Un//F
         yPfQYmeDTC4zIXlAvfrKuAE5K9Uvs2kHErZFGZiYM35Mu9ib4wwsM6Yb2gitGqKA5BMK
         GV3FhZ5YQIP/9u3go2gBNUVjZsdYsY2kVFyoiayjL/tWvjnxjJw/bKSO23GixHARvfxc
         m9Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746001939; x=1746606739;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2qvonH+2UdIFy8nw1UMPJbLg1oAPPZJBDd5LZzjkU1c=;
        b=b70JFShi0DDCNaEREOU/WSn102KKSw8CN/18jHSPc7rkg1w4PuIPLaU6frDgr3Owhk
         C7R5wfqAVy++3zxl6TyMhkUfidJl/9V0M6+0ouZZVJeUG/gswJmPty5eQX7bRd3wkYR/
         sg6rDJfbhNaTztHgorXmpOHl711XPA4HOHFG/tKygah+0ee9GdnT5cUyBetmjGmAQykl
         O39M2VjW6S/6arRSXpgmf7ThDOy8ih9wIdfenFgvEwuQFAPxiP+TvH6dF0jEgsua7rrA
         j7YBr9MzPREqiC8gXiPqK3uWmoaGqiCx1clwBtbMc7a5qLv+OKIhJRaYCHrXx3qCcL1W
         zUpg==
X-Forwarded-Encrypted: i=1; AJvYcCUFs+Ouddmwf5YwAE7xiXsf+pVmwZzIuPibb7ugrszV9HhEF6y+HkkYVeuex/G+wwWvyQEAWK3pIIcijw==@linaro.org
X-Gm-Message-State: AOJu0Yx/CLcmbYgdqefBcd8m7gIi0Mg/XPHLcwl76QBjwFaTivUOqYqu
	OkaDJZOvp/dxn0vnUncjEWXoLk+vGnHIpC3pYfkaOek9lBWL3xCQsd2lJbr3vwk+Qg==
X-Gm-Gg: ASbGncsGMF7f/OB2NoDuL6bJrbVO16WVldaLgwdB4lfNjYS68DAldmw7isTcJroHI/k
	FWZLM3RNkxppxEKuzY/lDZAzsQfHicX1oQuKQauA0GMvm7HgFCPGQ0s7X/CZf9mShsRiLh5teFQ
	61XxSRzKMu++bzVQwAT9GnVDb+4s7tcUEudfADjaYjKlzgDPsUg2VVSgcm5aK1kf1jJoQzTyx6E
	dLDGM7A/A48mpik8dQYSCTY0dy7qMHsOrW0Ytzk6s+Bv7j2jIWePHG0icXtVmaxgXrlrjnBseuk
	WbQCUTeulQ1OG5tlehHUjyeyCuN+zoxU3voeXpSIngBm9YufsLz0zwmLb+7MRCWVuS84pVyY2rf
	1L31S27vMRpMjFmknsLTbSF1f
X-Google-Smtp-Source: AGHT+IERAra2NjcLKE4jV51pt8p4zQVzESu3IBG3Q1PyFrG6gIshOZrE95suQGiFVeUO2wpirjpSCg==
X-Received: by 2002:a05:600c:1385:b0:43c:e8a5:87a with SMTP id 5b1f17b1804b1-441b1f3a597mr21245755e9.16.1746001938912;
        Wed, 30 Apr 2025 01:32:18 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.226] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2bbc0a2sm15637755e9.30.2025.04.30.01.32.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 01:32:18 -0700 (PDT)
Message-ID: <dbc62384-b05e-4f30-b82a-395a82812f65@linaro.org>
Date: Wed, 30 Apr 2025 10:32:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/13] target/arm/cpu: compile file twice (user, system)
 only
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 alex.bennee@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, anjo@rev.ng, richard.henderson@linaro.org
References: <20250429050010.971128-1-pierrick.bouvier@linaro.org>
 <20250429050010.971128-13-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250429050010.971128-13-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: PLhDfpST2nF6

On 29/4/25 07:00, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/meson.build | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/target/arm/meson.build b/target/arm/meson.build
> index c39ddc4427b..89e305eb56a 100644
> --- a/target/arm/meson.build
> +++ b/target/arm/meson.build
> @@ -1,6 +1,6 @@
>   arm_ss = ss.source_set()
> +arm_common_ss = ss.source_set()

Unused AFAICT.

>   arm_ss.add(files(
> -  'cpu.c',
>     'debug_helper.c',
>     'gdbstub.c',
>     'helper.c',
> @@ -20,6 +20,7 @@ arm_ss.add(when: 'TARGET_AARCH64',
>   )
>   
>   arm_system_ss = ss.source_set()
> +arm_common_system_ss = ss.source_set()
>   arm_system_ss.add(files(
>     'arch_dump.c',
>     'arm-powerctl.c',
> @@ -30,6 +31,9 @@ arm_system_ss.add(files(
>   ))
>   
>   arm_user_ss = ss.source_set()
> +arm_user_ss.add(files('cpu.c'))
> +
> +arm_common_system_ss.add(files('cpu.c'), capstone)
>   
>   subdir('hvf')
>   
> @@ -42,3 +46,5 @@ endif
>   target_arch += {'arm': arm_ss}
>   target_system_arch += {'arm': arm_system_ss}
>   target_user_arch += {'arm': arm_user_ss}
> +target_common_arch += {'arm': arm_common_ss}
> +target_common_system_arch += {'arm': arm_common_system_ss}
