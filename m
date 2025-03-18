Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp3245446njb;
        Tue, 18 Mar 2025 15:22:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWeMFN7aCYDS7f0qlutIJLQUfG8B6jthTkuo8TZLcWuJ+oVbrzX7oddhlyOJSQCR64Zz1FZUvP2HEAP3w==@linaro.org
X-Received: by 2002:a17:90b:394b:b0:2fe:8282:cb9d with SMTP id 98e67ed59e1d1-301be205a44mr473527a91.28.1742336538510;
        Tue, 18 Mar 2025 15:22:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742336538; cv=none;
        d=google.com; s=arc-20240605;
        b=VG24wOa8nmLsBtE4ydJvF8cwCJUgQ2APvmAcmYKL+Dhsu7EPPvRj4CNRpn9WikAHtX
         gbwd6Wad7sTUBzcs6g9/YGOanTRbch7n3J6e2AnNHyeTrDYORk/iQUq95uJwwfBcORJ5
         YprPb/Ebf8U14TIVf9AoL1S0pVSSlN8wYzmujIn6gvSBeUUD8sh61yYxNCt9lyNzrq/3
         uRL5fAA3f6+Uttkp5IQeMdsej51IpnbAmzOuA6rE5ps++b4zFLbGT1oV3xAcGS4czgxl
         ULo0FtPwo7AAA6quEd6omoknfAf7sQcP4MUAZ3ggPRGuc73nZUvxtqn+Dhc7120fO4ap
         YSEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=x68VORxlBgR+vaVz63DYy5hXfdc/JnPHU4P/9E+3mn4=;
        fh=GJNnknMkbbD2GP4AQi3rQpfyWuxZyaa7O21N2FSMQo0=;
        b=fe7j8pc7O3xuSXbqt2lEImQBn9oPhlMie4ZSynqtQYwDivIcJBRfMGYnzonvBtMtIq
         M9wR0x2pR8dm//gtzg9N6iJKQPYwJu0kD0t9xcEdwOIj7QIH3umCxYBxf/UNvMDtrGfF
         sPAV7mckf256JP4OkXAQzF5Ils4S5SrPg9/nt3KOAJiJXp00/5hBq9y5AJ/OVcgvmOPF
         gh8hxoz2w8JJO+1YSOh70am6EPdstryRN+KlLqarTzns1VC+y8EPybfmliscqj+uh+ig
         4/S/tI+QMETcKE3Lk2gheE0fiTGqT8bQm54VMIu1cIfIRdihcbPN5h4HkLp11cSInVOy
         7yYw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RKwCVnnx;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-301536172bfsor7357284a91.6.2025.03.18.15.22.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 18 Mar 2025 15:22:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RKwCVnnx;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742336538; x=1742941338; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x68VORxlBgR+vaVz63DYy5hXfdc/JnPHU4P/9E+3mn4=;
        b=RKwCVnnx5BKeUHJETpGn/hVm9OHujhHSZlVru9/Tn/nyUGjup1CUOtOyS9rZHGKHir
         swFck9Xr0x/3ujVA8et8I6573Zr26IRqIdJOFpzfsFz/INCVTEM7kPsHMvJrlg4uZZT+
         65vMr91Fs1w4l9wkk68XjWB3nJtIdhtIjkVCALuNLaXEYEDCovqGd9bx6mMajQBhZ24M
         T+Q9wuyyWA7IEc/VnUclFomU+34ljiXK3LeGqOsqEzB8m76vmGrNZhmFt8QWR7wpaKpm
         Zgbu2LYANnUoknvJejmaP1M/v8DWoeQMLRkSDFJwE0S4JNN+H7TlMWUpyTTBy76Ehiin
         TIzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742336538; x=1742941338;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x68VORxlBgR+vaVz63DYy5hXfdc/JnPHU4P/9E+3mn4=;
        b=FsjRYxX9UWpE5l4Ia22jPjCyG4pFHMD/JA4B5aCUp6czFo6NmXXx2lFZRGJ5ctCoW0
         KYJtsCrDDi26ojbFbKzS4AWBN4l6BY4gMrDwQ50UNp2udT+n5m6M6P9rKRJNxKe9lNMK
         K5EJ+0U6PmsnyEeMKOdwGc5ZzrUqt8ICFbC45iBJQK3rE87wgqDADWT61VkvoBCN9KJl
         xS1/kp4ZQRwtwy8/5J9yKKun3ChEGkCxJZdD7SCXS6VcXkxuFpYGrZXiptf7lfEdPbdy
         951bZ2k7/YQd2MBZUJuWzvH+SQp2cOyhaJcPolVoHhIRkoBPMIVV+yrYTjAj445Uz1bZ
         DcSg==
X-Forwarded-Encrypted: i=1; AJvYcCXHaYsBtevN2rNNnObYd5+zm1zU/9bHTgsAb+Ne9Spxge/q4f8ie0OC61ET6erV0YFkvh19RRf42EJcWA==@linaro.org
X-Gm-Message-State: AOJu0YzzxbH7/VAQ/7RxxHEirLPckQ4IRUnkOhk9Awro03qhEqx7GtVK
	W958dUy1cPPlpK/vn9bJTkCeCpgHmgHpz/iNWCEdc+ITVTnvhfuvkxBSph2csgTl3w==
X-Gm-Gg: ASbGncu28KTWUt2ZVs21ZlcmISVePKE6bTN60fNhuIF5l23+ztPEUA+TF4nJEaAoWzV
	cEBwGwvHENJ8dFKBYoEqFVjSWMlW+Qmsj/YGdnQt9MfTkCDjQeD0t9Jo7qJQBU6319S5tCzjMM8
	PdO4rjIb0cUTdB38brgFSQz3HNd6hG866RNdbGFov+YkzTQBZZIxKiZB3+i1L3DPpiXDPFf9zTQ
	u+u7cgkJqVb2eK/8p3xiL9EU6QUqX753k7HLoMsKOzB+B/LjqP5ZAFE1KjrxrcP+TQKdhDxthgw
	0qSbjXdnYZIc0sv1zk+SZFKLp1G5v48ZClcZ+DvbYnz7sZmAUKdbpPdbTpu/tR7FucEm1X7v20J
	ikDiP0S08
X-Google-Smtp-Source: AGHT+IGHOPLTv3C8biqU57+QSpWJ1D+6cb2Vab07bfb4qaxvU3/KRShK+UJOqz2p7OL3amQORqXatA==
X-Received: by 2002:a17:90b:3b88:b0:2ff:5a9d:9390 with SMTP id 98e67ed59e1d1-301bde749cdmr500107a91.8.1742336538060;
        Tue, 18 Mar 2025 15:22:18 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-74-48.tukw.qwest.net. [174.21.74.48])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf5cfd9dsm19227a91.44.2025.03.18.15.22.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 15:22:17 -0700 (PDT)
Message-ID: <c71143a0-2759-4c9f-b7ac-6a1d580dbec0@linaro.org>
Date: Tue, 18 Mar 2025 15:22:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/13] exec/poison: KVM_HAVE_MCE_INJECTION can now be
 poisoned
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, alex.bennee@linaro.org,
 Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20250318045125.759259-1-pierrick.bouvier@linaro.org>
 <20250318045125.759259-7-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250318045125.759259-7-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: +hviBkE2g7i9

On 3/17/25 21:51, Pierrick Bouvier wrote:
> We prevent common code to use this define by mistake.
> 
> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
> ---
>   include/exec/poison.h | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
