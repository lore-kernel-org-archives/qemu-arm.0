Received: by 2002:a17:907:2723:b0:a5a:9152:cbdc with SMTP id d3csp521212ejl;
        Wed, 15 May 2024 02:43:06 -0700 (PDT)
X-Received: by 2002:a05:600c:4714:b0:41b:13d5:7da9 with SMTP id 5b1f17b1804b1-41fead643famr195284625e9.38.1715766185911;
        Wed, 15 May 2024 02:43:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715766185; cv=none;
        d=google.com; s=arc-20160816;
        b=uTcXFM6t4DGepZfKn9ByipvFpDQP0ZoymV9sGxXYdoiSQv8JIS9UHFhTkzEVat0dB+
         qISA64/hQdbk27q6UgG/D+T4ZNG7UP10h2LR+z6Frr8nwNtgwZi2We9gSLx1KCJCtcEK
         lzBzJ/HyUM/zD3OKsyAjzT7ZaUXcsGmSceHWgD8PArFnzCbTkkEoV6gX2AmI5Su0ofHo
         9+FSnNhSueYu9qiVMe9/nU2Fuyab4IFnc99Fa4DxJ2Et0BIsKpGstC1IkniF4L7hALDe
         zGCQLecKQD+sTb4Er4XXu4hAjVj21Ud4ek/fGLu5K0QLQBPnjvq80EKOJn70K2d138ib
         L0jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=eYfCiVrp48YDjgh5bVg6h9xc6LBwA01N6tvBCTmiDF0=;
        fh=Cs/fbuvFiMkLdTGG5mnddmq74k2WmtJg3cMNRFm0Bsg=;
        b=bKrda3f+NtFTQun6EnQ4D0I+ep4aJXco5myTgZDemScHgByzyQmYnHeyoXemQVkX/m
         DOJyWcMLCtRqmb4R59ThL95wPJgj946rrX7oJHvi+N2uT8naJjyZEq2QHrdPcvS6e1Yg
         P5ETTbmHmZRmN1tOQ5ytccNekGLv6QDPoNxd4ZW3qzHg2stP/1F1qWqg8UqsHRDwTH/2
         cJdIXz/sxZWlbjeKF2iiuTCMl6Hp5PciZtfrbkQgMX4qnrGXFRvwYzfrIYc5ezS7TiRN
         Ul1eZtCMqLe76m0nqUtR3GpxHRugZTkCeAvBcK/WyVygpLM3vq7aLFLerIlJY+p2nnMj
         22bg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="x/WstA+j";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-41fce52c90fsor36107445e9.2.2024.05.15.02.43.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 15 May 2024 02:43:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="x/WstA+j";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715766185; x=1716370985; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eYfCiVrp48YDjgh5bVg6h9xc6LBwA01N6tvBCTmiDF0=;
        b=x/WstA+jVqBclG3vdpFdY79TN5VxV8agid35WPvsds8ElJJsipagfj0uj1InRQIIhm
         etvMRGBSE+zfvYApeFAlWmfO9vEU97rVnka31KfF8BKuiURztsObzK8YR5/xALe3SVTh
         0ocT2T8SkesXOLKm6/dV67oTWBvwXaSS2V8JGsCFD2sxXjLAT6XVDN1mzc1+ODoJtHFJ
         8gZqr8htDoAeF7gFVqAkxt64tbzkDuiU0LI3B69F76trRa3lGR+uk54NmD7jH8b+F2pQ
         x0PNtAI9whqRz/L/1+DO54WKQBLehW+E0rNPLFw0JpLqBWQGUZYUiJ18fw9uv8XFWQKV
         5sYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715766185; x=1716370985;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eYfCiVrp48YDjgh5bVg6h9xc6LBwA01N6tvBCTmiDF0=;
        b=SErfvELYoe5/BuCqL8u/sFgbj8OgyMM/aHeIFT02GrifLl+PAWJW8hhnY1VT1p4qbG
         3GXBgHE2x4rbxOM5hf2HVdaj2P/8L+FfgMaJ9mYVaBG0aXNQ6/7tS/58f3hmXlNXc61Q
         /FNnKfX97xeIgU4isxHbxmo3ZZ99GmPY6enBEI3PJlfuFtMVxlKNEqjIGG7Ga3tGCQEn
         z3Zr+3laKM/7QMMmTDtRY2Lo8fAiZoA64cv7ZqqP0ucpp34PnTkgFlC//v70JSXeA3u4
         Fn93vvG4cfvoijWjAEVh/txmQNzXgr0+bBT8P4Zusq4OdRY8NBkB5fVGxkdN3RiAmeu/
         F/LQ==
X-Gm-Message-State: AOJu0YwkCsuto7W2IIHxnumiEjgmmJvshPnGzIK4zw+r5rusrH8yp691
	v1sRjPf425dY5iNrouN4zi6vnfGULDFPsmE1qJOESS259/7PR277VcRej0k0mUok0k6CP2qhf/6
	gaUM=
X-Google-Smtp-Source: AGHT+IHkHHT6zVGscfFwesuBFVorANB7I4pbneSPJ5HRN5dM5iQa2eZCzTHHpnHdmxdqya6Z7aBjcA==
X-Received: by 2002:a05:600c:4690:b0:41a:c82c:1999 with SMTP id 5b1f17b1804b1-41feaa30816mr172125065e9.9.1715766185044;
        Wed, 15 May 2024 02:43:05 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [10.91.1.102] ([149.14.240.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccce24efsm225207445e9.19.2024.05.15.02.43.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 May 2024 02:43:04 -0700 (PDT)
Message-ID: <121a3f09-8f3d-4222-912a-661f90bf07c5@linaro.org>
Date: Wed, 15 May 2024 11:43:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/11] plugins: extract generate ptr for qemu_plugin_u64
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
References: <20240514174253.694591-1-alex.bennee@linaro.org>
 <20240514174253.694591-5-alex.bennee@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240514174253.694591-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: wS33Nd1B9Vr4

On 14/5/24 19:42, Alex Bennée wrote:
> From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> 
> Plugin operations can access a scoreboard. This function factorizes code
> generation for accessing entry associated to a given vcpu.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> Message-Id: <20240502211522.346467-3-pierrick.bouvier@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   accel/tcg/plugin-gen.c | 27 ++++++++++++++++++---------
>   1 file changed, 18 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
