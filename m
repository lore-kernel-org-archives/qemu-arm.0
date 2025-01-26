Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2065267njk;
        Sun, 26 Jan 2025 11:55:40 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXpNuwJBt6pSyJ+IGh1yBetuwEUp0GkOfS3qO66D68/e3fMIpYSPtBWZzTJmlUvo73Hx6laKmpk3BFGSQ==@linaro.org
X-Received: by 2002:a05:6a20:6a07:b0:1e1:aef4:9cd0 with SMTP id adf61e73a8af0-1eb2144d77emr63524739637.3.1737921339972;
        Sun, 26 Jan 2025 11:55:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737921339; cv=none;
        d=google.com; s=arc-20240605;
        b=agnO0mLMl/LgRtIutFPHZOCsSokICokKkuiqtwU5DMypaam6Ywvj62z5dz8j2Dp4JW
         bQQ7fR5v/A/QaNMlJ7x8/lfbHrzDp633QkpihA3uJW4PnEDEqvUbeZMxv7ERLWTR7QDL
         N2+1pF8Q7TXcxGpxFcl5dFSFBVg+V1q2qQCeOm3axwe7Hwhx3HZyLohc6ZSvSSs9WDDX
         FbW06ERUj2ECWm3yXN12fn1NQ+vVQfEXxwfzAzETXMLajN5Ejv0DoOeLi1S/IzJ/ZDyF
         4qHHtYCDput0if1IbB+gtrkE/+S5WkWrw3yWcvC7xmTeyl8gSWsOiMDVLP3/JTCI++Qg
         b+mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=k/VcBzCgSZMRn5BGbBxU096iXq4FkgwntnoR7v0hF60=;
        fh=31cHImpcWIBtyftPwQtjaGxfQiv1DJrUnpz8Q1lAaA0=;
        b=UMADox2oojvyh1x+BdByPAMgBfBUoVa94l36JZmm/189usI3U84ed3xBNRreCt8rE3
         P6NQ2qsaot7vtM64LuNwUpFdhJZ92Y/GRvZDvUQbOsANsP2LM6/rW4LRhAeRv9Z5xhb9
         pkvQVr+3E48gl6UhxqtVctocW42CcqHxoZM8dWn5/SSNXQSL9BWE51DCV5h7aGhCJ771
         OC/QvV7EhlqzTlRgiSAJOoULIZZZ9qeAjLIkxQZixljAhryJDyiUFZb1Jk/nndqVA23y
         htxXdYsOD/nKqfRftlbUp74nK0O0ws++5wtuyf3BfZlFvK0GZHSMUoCi8A21IoJrrSDV
         GkCA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dvmYO9Ax;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-72f8a6b3f98sor3746521b3a.3.2025.01.26.11.55.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 26 Jan 2025 11:55:39 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dvmYO9Ax;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737921339; x=1738526139; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k/VcBzCgSZMRn5BGbBxU096iXq4FkgwntnoR7v0hF60=;
        b=dvmYO9AxDiPdMWgdGjopvWANTnRB2opONXbckSJkcWHXwhPFzcIw1DHtxJn6rRB1qn
         +1rrd3WecFhEgkfkVegTNHpnHYQdAfqDgdvA/JkYT138YipzjO1vP71riODDbs2hAorb
         e8P/RDg3F2RI8t9NfbSTIAbt8DJOgvU3ZhpRNl/Vins/OCkW4Kb8nmvUel7m38Mfl+9F
         ti0fjngHFEcVUwpF8vk924N1SMsR3apNNzQowlVRRiC8MalwO8X9h3K1HxSEjAUM3tT/
         qh8nH/YSoR+2Pam6h3lsBdoNzruszkNj18t0DVJ9Y/J/sK3vsuzQug56h7wDqstVLGCa
         QjhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737921339; x=1738526139;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k/VcBzCgSZMRn5BGbBxU096iXq4FkgwntnoR7v0hF60=;
        b=Vnt7lqZYCblkmORtItHqd/aRo7j3bYyJQPXurq6xLMXMQuoZrZyiYzHZ9Rm88olnwL
         U6lX3YpoXUnMGQlAEkl7fA5GNHIThXpcd4JNqsXq69bNPq0kiLcraWbq6Y5vC6OO0VRT
         Iybgd63aRFxMahzTyYXKAJIpoF9Vcw1Fd45wLArx88NyHwvoqJh1bE69jaJUcgVmomuA
         TL5VB6BWoC2mNjpc7ggy/hJkZ58ykAdaRsTBWLZ8FYfRuDT40yy8UZ/RwHv+J9nT8NVJ
         322lHpKphEnmnCb5tCpy2T7X+8wjJTLJrn7D8iRF0HQzI0AvsCp31LtKmZfES2fnjonM
         LzJA==
X-Forwarded-Encrypted: i=1; AJvYcCU2zS762Uy+LCPf9xjQTodJGse2lPYt3D2rHnQE3JrD2ruBawk9l3y+ZAfPi9fMBVv8CA8MNNqXkyVuEA==@linaro.org
X-Gm-Message-State: AOJu0YyDyo3WMxj96OOXwuIDY5zf4zvDSV75fvLl1+tdpqteAYbusoIs
	RyCSWwkjsiHfVXCBfsGSNO5YPAyQ/YfH3AQXqYqjp768VyjH8fAIYgKbdm4CVsSNZg==
X-Gm-Gg: ASbGncunFZBCBTbiBEnB+ViVtYnDd/VtE6W4lk1YUlQq4AvFpA4pn0pd1609ov1RTdF
	9sS7evvq3QK5DehnbOFE9b4k1DxWJ2V6iacjgJDmABYDfu4PYh1xK9EAI31Rbw0hXhar1OaANdw
	xShYjiqy0Tmr/mtR9g22aP7omlojgQv4qPZQJeC9FM0ZPRyjUGTpyCRA/EbKpwNks+r3gmQhsV0
	GiqbHrD61MzdeMWRqXim9zNIooRBMhQWoMU+o3L2iqC0IMinpBviA/YypVvRIo673phTI59hud/
	S2xLxtyToaakDayBAbvinugfalmq+js18QWkyuNIs1RKQYVy2p5eE+kCLg==
X-Google-Smtp-Source: AGHT+IHkPOqmTCjp5vaq/+XEVF4ezQ8MyiAJ8YKEj+eBpJYARUzB5sl2GUtr7fAvVdhnF62+x0fMUA==
X-Received: by 2002:a05:6a00:a09:b0:72d:80da:aff with SMTP id d2e1a72fcca58-72daf9c1dfcmr48758529b3a.9.1737921339455;
        Sun, 26 Jan 2025 11:55:39 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-71-127.tukw.qwest.net. [174.21.71.127])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a77c4ecsm5519455b3a.121.2025.01.26.11.55.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jan 2025 11:55:38 -0800 (PST)
Message-ID: <ea6edd46-f1f6-40b0-bf89-c7f6f68bee87@linaro.org>
Date: Sun, 26 Jan 2025 11:55:36 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/20] user: Extract common MMAP API to 'user/mmap.h'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org
References: <20250123234415.59850-1-philmd@linaro.org>
 <20250123234415.59850-3-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250123234415.59850-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 47AN9+IfqmSY

On 1/23/25 15:43, Philippe Mathieu-Daudé wrote:
> Keep common MMAP-related declarations in a single place.
> 
> Note, this disable ThreadSafetyAnalysis on Linux for:
> - mmap_fork_start()
> - mmap_fork_end().
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   bsd-user/qemu.h        | 12 +-----------
>   include/user/mmap.h    | 32 ++++++++++++++++++++++++++++++++
>   linux-user/user-mmap.h | 19 ++-----------------
>   3 files changed, 35 insertions(+), 28 deletions(-)
>   create mode 100644 include/user/mmap.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
