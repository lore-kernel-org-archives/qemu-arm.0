Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp276307njj;
        Thu, 1 May 2025 08:19:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVEjQZfu0fTJWqXkgn3sotPLIClcoiLrCCNRJVfF1TE7wVoDohpaPuYXobsfj8R2IGhA2JxbCGVRTMx8w==@linaro.org
X-Received: by 2002:a17:902:cec2:b0:224:376:7a21 with SMTP id d9443c01a7336-22e086444a9mr42315125ad.42.1746112776582;
        Thu, 01 May 2025 08:19:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746112776; cv=none;
        d=google.com; s=arc-20240605;
        b=BPcy0GX0awh+eOBVodPwQCqDb7yenNlyS0mcP5ra82uN+omL7X5exqq+lMY055D7Qp
         pDRpsISMRg5BRklsoODYmLyPH1+wBXhCsHLZkjrVtLSlD5ibXz/yKpKqlSma55q3sPFV
         qAGCWdYg1kjQNzBYuSVkgw+8saEZxe1V6E9+Tal1oICrR0e7P4/sjeaIYZgemGtaGX6O
         UMm351w5r9L/N75stoX4XqHJ6EW2KJPhtkIJx/qU+4LrJZ1kepHibgKa3RrrnaFZzv0r
         IVr8h8gjfGHLv07UDn6FhukffxKIUkOius3CoVN4LJvx01hg5E7l0aqqRh2nYf5vpPD5
         MOCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=VNk59ZUe6VB2+qVVwcJX9X+M3hgSClHFSRBg0Eem0Gs=;
        fh=ENZVqfFaCBg+C1iNEEPu9l3fZJsmTrUb5O0/F5UrvAk=;
        b=P16rl9JlF8K8sSkp/NVPnJvf+ON8F+XEcnGGFZj7SIafQqcKWgsUTRHTAJccl80c+t
         PE//rpn060kEXXkyoBefTaCXiPuiph5Ypv+ONyFaE8LsTXf8Zl4xKJrgEDRLTgyY+Blf
         1YHzBO0BBSheYC1950pysckqFGqDZbry4MbPlEwC6L3vGcLko6jjA4xKZd0h86cRp204
         3KuE8UFJz2RW2mi2fbzJJHGHe3pMaqg8NC47ie2BQOxjXzL6DeQoUv4bTOkTUfaeWYxn
         Rw7XB8K7DbS3XF/15ZFmRhN2oBBnRRxUcaFPCq7CIpZj6+L5dnZE8eM6Hj9TfmqzgXJl
         Inxw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=s2f+KQs9;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0be8c60dsor6701275ad.17.2025.05.01.08.19.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 01 May 2025 08:19:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=s2f+KQs9;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746112776; x=1746717576; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VNk59ZUe6VB2+qVVwcJX9X+M3hgSClHFSRBg0Eem0Gs=;
        b=s2f+KQs96qmmJG/HZmZ61026ejLrmAadRqgk8gCrmV/AlpDRe0Ly/qTURAXosyST3s
         2zKO+x8cbTq76Ft+YO04ySHv1wXrZp5w6bVAfD3VyXEyjX7n8LQUr/2FauIBNhHQG0hr
         P4ucLncBJvyweBBdNSkh96PMwBp7AByOpyniDAciRhxIRX1cA9Gu1PFWcUL9Q/o93Agh
         PDr17RkyiqJKD1FFxVE+IskB6AWfJw+86AeJpE0wGYqCpuo5+/k4aIC4OWntYsApm3qb
         vE18YB8kOLYkQuGQmqKn5Q9HEFRP9ywFmp9hZNjdg+yHieH1DtHqvCgvfXtbE1Yx4pe4
         MhKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746112776; x=1746717576;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VNk59ZUe6VB2+qVVwcJX9X+M3hgSClHFSRBg0Eem0Gs=;
        b=GwnNT30g39NSNkV26rUxPcI157t0wDWqwKNmS+iKKoX5gLc/aumadaRH4U2qPnKUX5
         z4Me34o3I+4OyoRqqWGuySlIsFB1tJHUNmWFaNnII9R4slBcR7yaJSuYnYKpbr9CKtN8
         nyAf2Ob9U5eo/nDmA5nv1xs4nePj9GjB17sc4uvR1tRvfsx1COeurkGPt1c11q/xIA2f
         lNoCjXHdaw2k/TV9ZwqoAD5Y0QKh8eUUNsD/DCsaIXf+Ods1/DcKlOdymhA14HmajjD1
         ft3bD4dwtiA8Hf99kG+MqHZZsCeY9d1tlGsFXksP7NuockU8LP014ALQUOBY6j80PbYd
         +yag==
X-Forwarded-Encrypted: i=1; AJvYcCW+sMroQB/s/tWxVfNHTJ2ixDH6d907vg4HCecVIUq0yx0tQwxVDjMr9Sz9UsLRXMZhDPnSG9hEz2ATuA==@linaro.org
X-Gm-Message-State: AOJu0Yz/AJCykxaHumPb2Dw6kohFdYCS/cDccfE4BDymLUlcqxvukGfY
	OcEgkagBciIKIWhCIGQ3rcKzP0TYBXEYSAVEIukxUjspZlOIZJ4KrRjUTdv3GZpWWg==
X-Gm-Gg: ASbGnctBoylhprHqcedgDf5jT/UvuEZFdZfiT9dsB4o36osDy6zFwPZPjERqAduARrb
	1yckAh8HmMJXBHoOlzYvYnsEbPDrHltiUa29163que3W/pMIlS1UVGBWd0j/478cjz9jeIOvWb1
	rchltX6Djw1ot0W5vn3fD6drff1mLa6wZ/giariUFERuUCMvpJYyXVKBr/awdDJibu6PC7idIxD
	i2PwxaKfRn1TV7o4ANT0qPEervTbVIUyAL3yB/0VBmKvCgXd/aDzTZRG7QJY8Zks6hAF88eqT2G
	dsHRMAQUP01HY+WonT+FXsQ5SmTEH6ghwcY/sL/kPtK/vHqCssEcZ10K+2zkxyXv3mDDjcA1OW+
	NEk/xqdc=
X-Google-Smtp-Source: AGHT+IFiodq2dkzmVTJTMEgLtvCWG8RgNPy29GZm5v093C6tYwxz1yLGHlH2+5H29iUlSMv3iqh/fw==
X-Received: by 2002:a17:903:1247:b0:223:f408:c3f7 with SMTP id d9443c01a7336-22e08429b98mr46957485ad.16.1746112776216;
        Thu, 01 May 2025 08:19:36 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e0bc6d4e2sm7796945ad.149.2025.05.01.08.19.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 08:19:35 -0700 (PDT)
Message-ID: <f3b1cd1c-3ef5-4d63-a2d3-96bbd186ff3e@linaro.org>
Date: Thu, 1 May 2025 08:19:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 23/33] target/arm/helper: compile file twice (user,
 system)
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org, Paolo Bonzini <pbonzini@redhat.com>, anjo@rev.ng,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 kvm@vger.kernel.org
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
 <20250501062344.2526061-24-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250501062344.2526061-24-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: m3OY3uZUY7XL

On 4/30/25 23:23, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
> ---
>   target/arm/meson.build | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
