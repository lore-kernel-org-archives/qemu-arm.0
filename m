Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp512570njc;
        Thu, 19 Jun 2025 14:18:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVMATbCzDMdvG9rNmkjU2LNaURTWgGNaP8fE+7tjx0Jlr6bkULSftxeNZWEhdALN37wTtuN8P3+3rUZeg==@linaro.org
X-Received: by 2002:a05:6000:1448:b0:3a4:dd8e:e16d with SMTP id ffacd0b85a97d-3a6d12a3bc0mr375777f8f.15.1750367913061;
        Thu, 19 Jun 2025 14:18:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750367913; cv=none;
        d=google.com; s=arc-20240605;
        b=fHAD5Wh4x6im8lexVG/+2/R1V/RPaWGLx56jLVzWmPy2T9auDqE6rGuX7Ja0TvqkMf
         jLfwZNraDk4VOLi+M+gPduKU5GKFvMoPnxUGHfb8MX3DCiq+2e3lgGr6DmUUL1svjtem
         ex7tY7Fd0clPG+3Qs9rvTUIQ4zGVTLKHn+e5ICIhSYomHzpjmyy7sRXnyx7ngDfJq+PH
         7YC1cVrK/PGBfmGlhsBLEopOynVByxP3qEVPKS9MqTwcaIU3sYNanN7EK/tGwjvZsraV
         Lmu7wf/S8l5MbD1S+Mh/9fEYEKgx6EtIEfrsQirFBZoapUWyhjTmwjEFTc3DucWmUbG8
         oVqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=xJApBPtmtRS7y1RSET1/MQvgQfsp6CfckDvWTToLESk=;
        fh=S1qKgPAAE/ZY4k1WFqM77HEKEor/RiRvUKeDjIc0YFk=;
        b=RVAGCVu6cse41OSsXdnzrnSq/LHDwaXZJtQFmt4wd2yq8vcficgKlaoLr+j5dTa99p
         tEFM9TlyIPLtNAVVpbs9dWa2GqphjNQAGTcFBy5pLpNRLL4Lim23j7FqrfgxCImHhLZ2
         7YUtHfTUs+Q+dLAcDdCzRSoLxdatE6YA6x0QC0tIbXiB3Fyk8SaNY1BGvkB9unkuKnX7
         vy9bR7/PVXNdcLGTripxYpUbRvbymUeu9+mNyG3CJ34nshoXEADkOqJ2V5iIeNlLRbva
         Rh8R5b49B8x1olf4RAKZVQ8XLIjbezwLak2/n3hSmYEGdDenGdgHoUvNTpW+ExftKWaB
         zOPA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZQIgg5YT;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3a6d114b414sor95396f8f.7.2025.06.19.14.18.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 19 Jun 2025 14:18:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZQIgg5YT;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750367912; x=1750972712; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xJApBPtmtRS7y1RSET1/MQvgQfsp6CfckDvWTToLESk=;
        b=ZQIgg5YTTmt2EtWrzEOqrZKWeTfnTL/T+NqIY+eejWcqUg7XtmqeIkoSTBsTEN4LTh
         oOAPbue3Hh6LEyChLdF3XjnDH8DEa27/uP/Hz9/I97a7EIorMa6h/o6+ZAm66QyFamcp
         PIJmL5H5ALUbahTiqhY6C7LiAQ1xptSOruap4/4bcXZJwNtVyaT0ZOVYSp6GKcSD5vw2
         NuUZ4ZysTKUmVyqAWz7wqHchKExS8GH8JIHy0itylBYHAzC9ObmcGkYuifhLIuorg3Jp
         OO6iS76hnXJJJqMTKOXrXhCenIN7pMJYanR5++p2N1I1qabFg3nNsMdmYyTbVWhXPR30
         P+bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750367912; x=1750972712;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xJApBPtmtRS7y1RSET1/MQvgQfsp6CfckDvWTToLESk=;
        b=T0h29YkUTbKlafF82ClVF+Fc+lKZT2ofEjVjRnarBvhteKaBjNHLAHmSl68t5PsTOl
         7HNkAiJC+jhZVRGIO+lTTRcSwRCXx3joVy6PJrt4OUIymYCPd5RF+re6nuEqzbw1RuAn
         SPX2EW+Hwhx8+xTv+Z/0NtW6bTeyHaDZxeIncDNP0lRfeLpyWY2PvstaThh/1WDQOICP
         fdewIZIFAwzpPZRFgVHd3xAYZGJMwKttq27UzPidCsDgPeypfcOiWigGE+lrBNVAybSS
         CmO4cxALdhtGbCcxzd3qrQV//XhqxzX8Mvci1VIV2Nc1Qx9Wu/njUHg86vqk8lAVzMBP
         rFfw==
X-Forwarded-Encrypted: i=1; AJvYcCUhorXxGASJUKixeFIG6UQw36LvPtQGcjaKrZIefasR5dU/FYN2lq6dTxsw55qvfWofE9dJf81KD/0ilQ==@linaro.org
X-Gm-Message-State: AOJu0Yyje0umn7SNhnsUzHAL585wJWKHjl0O8/EeDaDTZ+NLtmgFKutl
	Mu3+JqRodPpK603PFqe9AasEXBVvTFRk58uyEwlmW65il+i6zI7g77dYVig3ZKGHU74Axw==
X-Gm-Gg: ASbGnctopTZbsWRm0IFY0jzBRMOu9aP/3yX/8dqBiVnsQIzlMhy4RqEODvIyQQchEOc
	lvtVXyZiLJmL8LrAivwFQ/H79S9AsIFVMzQz9UTx5s4wG8mSmDGgZ4Skn4fkUDq3GBclvQJFVTL
	GIErAkwF+JJlA0agNiUXmtqzzETV2oOsyAMREc8g7KfNgIYRRwlIc2u4WWPk9+whF40jQgCikMH
	936T4pd9S8sdtxzCcGLEFh4Vm3+IISE9E6XnTfkf7reAaYSeyIkR4Bf4vBkonRLcn9dFsUM5Cf7
	uaRH7TGbYqfDflv06ECYdAAi2VqFZj2CmdCBeS/JIksw01zznuy2j3aUBhX5utr4MwqDl9DiQm1
	rayjvVsIoCJuPgBL9a8z92KBHBoSAEA==
X-Google-Smtp-Source: AGHT+IHgjW754Ix3/O/6V9bL66G7hqdE8u5RD4c3rIRemB3+kpmqlA3k9iNLm107VjOdv1rcvj3n7A==
X-Received: by 2002:a05:6000:4a01:b0:3a5:2599:4183 with SMTP id ffacd0b85a97d-3a6d12b0e97mr365219f8f.25.1750367912501;
        Thu, 19 Jun 2025 14:18:32 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.167] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535969dc4bsm30313095e9.0.2025.06.19.14.18.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 14:18:31 -0700 (PDT)
Message-ID: <a1bf2f2d-f7c7-4922-971f-c4e7b1f5cf84@linaro.org>
Date: Thu, 19 Jun 2025 23:18:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/20] target/arm: Restrict system register properties to
 system binary
To: qemu-devel@nongnu.org
Cc: Cameron Esfahani <dirty@apple.com>,
 Julian Armistead <julian.armistead@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Roman Bolshakov <rbolshakov@ddn.com>, Alexander Graf <agraf@csgraf.de>
References: <20250619131319.47301-1-philmd@linaro.org>
 <20250619131319.47301-11-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250619131319.47301-11-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: JZF7AgbF/JlY

On 19/6/25 15:13, Philippe Mathieu-Daudé wrote:
> Do not expose system-specific properties on user-mode binaries.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/arm/cpu.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index eb0639de719..c99981d88f8 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1500,6 +1500,7 @@ static void arm_cpu_initfn(Object *obj)
>    * 0 means "unset, use the default value". That default might vary depending
>    * on the CPU type, and is set in the realize fn.
>    */
> +#ifndef CONFIG_USER_ONLY
>   static const Property arm_cpu_gt_cntfrq_property =
>               DEFINE_PROP_UINT64("cntfrq", ARMCPU, gt_cntfrq_hz, 0);
>   
> @@ -1509,7 +1510,6 @@ static const Property arm_cpu_reset_cbar_property =
>   static const Property arm_cpu_reset_hivecs_property =
>               DEFINE_PROP_BOOL("reset-hivecs", ARMCPU, reset_hivecs, false);
>   
> -#ifndef CONFIG_USER_ONLY
>   static const Property arm_cpu_has_el2_property =
>               DEFINE_PROP_BOOL("has_el2", ARMCPU, has_el2, true);
>   
> @@ -1532,6 +1532,7 @@ static const Property arm_cpu_has_neon_property =
>   static const Property arm_cpu_has_dsp_property =
>               DEFINE_PROP_BOOL("dsp", ARMCPU, has_dsp, true);
>   
> +#ifndef CONFIG_USER_ONLY
>   static const Property arm_cpu_has_mpu_property =
>               DEFINE_PROP_BOOL("has-mpu", ARMCPU, has_mpu, true);
>   
> @@ -1544,6 +1545,7 @@ static const Property arm_cpu_pmsav7_dregion_property =
>               DEFINE_PROP_UNSIGNED_NODEFAULT("pmsav7-dregion", ARMCPU,
>                                              pmsav7_dregion,
>                                              qdev_prop_uint32, uint32_t);
> +#endif

Sorry, this patch is incomplete...
