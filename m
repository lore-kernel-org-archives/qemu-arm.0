Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2653491njj;
        Mon, 5 May 2025 11:57:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVuOzZd+uu6ohZ22paW+9cAsf9t2RB+EAN/RR3Xta+UwINxc0rfZz/VAfU1LGYYpIPCBDxwTmRtP14O5g==@linaro.org
X-Received: by 2002:a17:903:2349:b0:220:be86:a421 with SMTP id d9443c01a7336-22e32f00884mr8365025ad.38.1746471439557;
        Mon, 05 May 2025 11:57:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746471439; cv=none;
        d=google.com; s=arc-20240605;
        b=WCSBzO4bnV5PNwbDBNSFOR14PTjxmnSjsvXPyCdmTn/6QliaGk5vcIsZ6gBQ8px3h9
         rqbRVnucTp/fCd9R+Kv4Dvbw5I2DxxxBqPEF14DjXaiRzaak/tsTChpf6Vti/pmQaIa0
         x40HKC/nATHoy+kea+MGV4pzqT5mzwfXP+IwzF6Z730xe9OWxMV5nJkY6FTwl3hQkJg8
         v0gfm34KKPGQGnJ8NGxhoEKPlVesxUnEI/dW9EaldZWoyUK+lzh340YG1c+6eL3N4eqm
         sVrG7HI2oniATJMy7zZXLdXuv4nDf/kcOQmi2BSJHQLD2q21gW7ea0E6aEI6HbUJvTfR
         T3Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=D3ND1SAC3lvQohdosheSraL5hqzXXgRa/d3DCKAxaiE=;
        fh=z1LFvMqFZeRG4LbRrVROXNCU7XpjC73QPDXyVaCLHqc=;
        b=XmWi0p9eFp/5mbhMfbz4nnptCkRVNxxW3RLIJF08c35MdIHYCjgth5VXCeL3yeefNB
         pw5FZIbtqaii1Bh38jWG4U+DXszEojyrNPrrqfoYh269dsxP/iHbU0Up46QBtX5qaPLI
         0yXqdDL79xig8V+9vLcSvWJlIkpqPa3Q+7+E37g0+/J/t0dN+2TtVBTNwMb0x39C73xe
         kwq4o+1tnr68+MLE1echF2KVbvrkGXBHTWFs8ZWmH62EHZUnH2Cb9sljW5ba9dxBX/bd
         U9Six7TNFu482Wf0rVUajKQWYxJZIP/kmun94qrLX07H4JQKntGsTyqOiUN4B6Q3enle
         CCGw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vL0QBDH+;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bb1a5cdsor65550295ad.2.2025.05.05.11.57.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 11:57:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vL0QBDH+;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746471439; x=1747076239; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D3ND1SAC3lvQohdosheSraL5hqzXXgRa/d3DCKAxaiE=;
        b=vL0QBDH+FTlT7X5LPq2BKg8HflBUhYhoQcaHywpuvBAYGVSTBQVPrkgC6qDrq60Luu
         twrsOSAtNkDri6wE1KkUt/YY6iDm62ALoUahxlW0xSJZAvFrs3rC7vtQoBRDOvwY4Sd0
         cjaRwof0jlPx8OOiAYc1aShO3Mt8l+lxqNrEd59tJ/y0pQflGV3wczx9ApCijySz5KDZ
         6An4507IWYH0RK3YCaDkwmzLseEoI5TRIVo/S9AXv+tUkEfAR/oNlpIxSSs93ZPPJCPr
         wSvgvOWMkw7cle+abdgB0mq4DoeI/kyiz8H32Rs2cG8bGFFmBslrmWY/PjflvizDwnIf
         cTMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746471439; x=1747076239;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D3ND1SAC3lvQohdosheSraL5hqzXXgRa/d3DCKAxaiE=;
        b=l5w+ldzuf6mcGVL6HwMHAqhpxT49vyMvaHH4Z3O0/6l6WJLwQLl2ecRIGjgDTMQ8nk
         Q68tqRStkNHxNsxUzhWcgDyAwj/tqBVxhu9dHfksJOWKJRakboVzqAs10dmTJzs6Zezd
         +YpQiu7YdQfc/gK3ApkNxNiW36WjXStbK1lNr2Awc3dUKe9h2yv42xmNW2Z9EbmeeDim
         czv8Th/zeQ3xeMmuZpRGBB5eM78aua2c9F5YAdxrtmmWcXYJ6gmHaefS2+b7m2gLe+2h
         i2ISn4WPTqu8bNOfpMqDpNgIHHpwCkuhfBiT1R7bQPIO/VMCOmyhGhNUU0f8VUh45ga5
         TGjg==
X-Forwarded-Encrypted: i=1; AJvYcCUDDHObqphAOfyPGdKIUYZVU/mBpzePpEezJKIbHPTqNVy2UdshjVFUcQtzR2wRa1Bi3dTaz3LurgpQYA==@linaro.org
X-Gm-Message-State: AOJu0YxyqXA54V3hbgK0VMfT4wGsrJzBnQ5CrgW5X2cZphStM7dJ/uhR
	chw0dcIbOKGHQ/iAh+7BQ7isJprOmDeLJobij9YiajMz2XzR5JGnmJG7+n/zI+Nxnw==
X-Gm-Gg: ASbGnctHWUG4qWf+Y+n+c/unMzUkoNkXN/VfzSa32HqQ+SdGIYOYyPgrD0uCMYb7Em2
	KDQCzR7fMUnyCs9mSojW5S9PmDPqEvvrjJVjydsKA3D20fvAfIByaRSaLMbICzwkQvmu0mXNwOi
	MuMjUnSTOzltIIlVTXvotNMEE4zduCJUHLOa3hHl5R+cTlyBvKPGRs87dzDdKbqg7bDhZD1N/Fm
	aL9GlIQQEKG1DScaWq2M6mCegxPuj3fDQP1on6R4zhtVYMuUIFauX4aA2I+DLjqjlrLsvJY9nPt
	Obcn4+D/fU1wzkMgjXoThI8E0gcLEt4OA34aQcQju+d0f1B9bbmXVjHPY8UCnz49qaA9cMLtwQg
	+ZDSVKJU=
X-Google-Smtp-Source: AGHT+IHBbFfWMdx6MOF3TzOMnofsi47UUFpxhoxY+MWXgZWqBLVhK3hrsAlK0As0A+dkEZOmLelXjg==
X-Received: by 2002:a17:903:1d1:b0:22d:b305:e082 with SMTP id d9443c01a7336-22e3311e8c8mr6072235ad.47.1746471439131;
        Mon, 05 May 2025 11:57:19 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058dbb5a6sm7188920b3a.45.2025.05.05.11.57.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 11:57:18 -0700 (PDT)
Message-ID: <3e69a6c2-f759-41f0-87f2-1eb88844e19e@linaro.org>
Date: Mon, 5 May 2025 11:57:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 48/48] target/arm/tcg/vfp_helper: compile file twice
 (system, user)
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org, kvm@vger.kernel.org,
 Peter Maydell <peter.maydell@linaro.org>, anjo@rev.ng,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
 <20250505015223.3895275-49-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250505015223.3895275-49-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: xF2DYpbu2z8+

On 5/4/25 18:52, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
> ---
>   target/arm/tcg/vfp_helper.c | 4 +++-
>   target/arm/tcg/meson.build  | 3 ++-
>   2 files changed, 5 insertions(+), 2 deletions(-)


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
