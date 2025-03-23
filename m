Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp1556774njc;
        Sun, 23 Mar 2025 12:28:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWS57pUNT4i/cYsS4+ISjXf19j8Vvo28d1mxso8BMVYkkfQvm5DdtorWEIkgNW+pMaege9WUhLAl0Flkg==@linaro.org
X-Received: by 2002:a17:902:f687:b0:216:3466:7414 with SMTP id d9443c01a7336-22780e25bd4mr155061855ad.44.1742758090662;
        Sun, 23 Mar 2025 12:28:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742758090; cv=none;
        d=google.com; s=arc-20240605;
        b=Eu/ijQnc0hoPTy/q9HItwFC1vuRZDf5CP2D0PH8BNm3HG3XvcEAqrsHdkAc7yXSBJj
         FftuxfWYYBY31dc7kRURtH6HDyWmPx1FdjI9GoHQ6USa+C3J2fIhczkeYIIui7fRzUog
         HjSOG/eJdwxqJLHEj56kY66sMqWAsYPTtkeRrFjjWGNvA4lXp7iSyzHQ2hJvkNPf5dmE
         ykaxNwkPVWpHCwaGy8Nn2JXBGDe8TpEbR+qoi2dAdpS8GirWGmzyHIc9W4Vffn3aMDKZ
         S7WjW817krUk4mKZefPPdMpT8kFVZvvoVd8XrctwvfQz+4rfsAQiXTCo/Lk0mcxu99jZ
         mpKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=k874A7awCV0W2Ydj0mIjddbFKT8kiobQ9PZe2gafaio=;
        fh=Td3VWvuC83qQ01sw5+Gy/+Xp845M8CskGi1cRssqbMc=;
        b=GygpjepyEDnpvg2S0u+42OdVirAEwSKFp2pqlCDSU+/ufM74jlFyH1o+zGK+dXkiCr
         UKx7Hwa75SYq2TlTXgrF7Q/vii4iZe3p5IL2tJH/clhZwWkOwz7HQXrFLvtyoq5hNJvR
         eTpRC2NBgotdQzXmBZvksVIpD8rJjf0Y3RT0etgqzYqeN3I5NMK+OtTX0auuEn8kwP7V
         0Ui2ASeylXFASnDAERwehEUa/IW4W6ojwmxr6lzYDiQVrfxGxo+hhJyYP9z3UNQTWzZb
         /kh9xhDTpgRjo5toU8cUia059PGFxT4WlDJJBVCjZ7AvF8j5jCaFfXbbcAOHZId4nw/h
         hc2Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XJuGooWr;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-af8a27d66e6sor2964836a12.1.2025.03.23.12.28.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 23 Mar 2025 12:28:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XJuGooWr;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742758090; x=1743362890; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k874A7awCV0W2Ydj0mIjddbFKT8kiobQ9PZe2gafaio=;
        b=XJuGooWrNxgQw6l2UQLBQic4E4qOjjO3QNs3aJ6iR+G6kXzgTBhv2JrpJikv/wUBNZ
         H2l/mj8swEJ8q2LEIz8IhDlrnJrXv23kTwL58FA6TrPmhfvqTQYbEkWp+6QtyuuOF1ns
         eYPyjZ9/gy59S+Q/Dm0iYXil9tmYhUFz8zI9SzQ2IXJQICcXQ+BRm6apWu+DaAKE5w5q
         UIVSv71EehZ7vIVPFUKXSv7jR+urEqavk1OylYCw2+fYo3+MRDbpnDPtA0OcoV1UfX/P
         5S+JGAHTAXLDmhuAxyqvcz3EbX9gkCpFPIXzoMY0GESTIqe86LwMFO2BYedhoHlFIGUc
         lzsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742758090; x=1743362890;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k874A7awCV0W2Ydj0mIjddbFKT8kiobQ9PZe2gafaio=;
        b=xGrR49LHCy1B+5Y9asgt8n4UoHgL/NAI4F4+Bm1OlVpEraKaYrKiWlqTOM4tSMAwEU
         AseZYUPvuX4VmKa04Vb+phmc0F/k88G90kDK8Ro0O8fNm9cv/eN8PlewfB4Gc/un2aGJ
         gHoLm48DEkpgkBBE4t464VQP8ZFeYnTXUEMX1u6JtYAE556Z2xlLJSQkmq43zd7PQwLg
         kWpuq4E8ECxMhbnXTzioQnwUgj46bUvieh3CxaaL+5Ucmn05eSjfOtWk2c8T3pckHSy0
         5zMTHnmYcAMNeSOSSOo4XKU2poK1rnRCnLmstO4oPogcmWkQ0nZFhMs2adKXT52tL3dU
         uWCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTNqonA/Of5XYllR38F57EZYv5nn//94cdp68COBGxG6a8yf5ZSN5IpKpQ/3iLMLtj0MrKmxCmV8PlbQ==@linaro.org
X-Gm-Message-State: AOJu0Yw0LAXju50axtTBl53cnteK1YCybtL3PBaVRoPeAoR61O9T6AZa
	/wx5MLxv0IEZ+22n2Wn7CxfYSQopo3xmSzSfGubjFAmmi3BMpFyZCt0EPyzEiEVAyA==
X-Gm-Gg: ASbGncuQkvqKupmrELsJOwxepZQM3/CIN0R40yu5U3ndhbNeeqoH2e0E0X4vGuC3u7C
	IeveUFCTUZHsl9aCU1XJh4tM6CKmApmDErPDHr8fMRb0AT3JUgWGGpldVIudp6Mg8ezzrhgtrUX
	BKANSPvnbbbuHmt/6OsVy6IW/kMjkDyr09GP+qyqVVyan8z7mMx4ana44+9ybxpcHf+Hv8n/OC8
	Zf71FOWuPP966PfctufhACIAsYplPTmdbqvs+75umAQe8SznPgfByhu8dXHI/VxBH9Bi6KycTNG
	wTBz21+X/dOOw7eaYL9pWBYoGGpMPmW1U6xIGEAPDNeodysTbN3FvBuw5JDqjoJKBVJLrWnoq/E
	yzpE112GY
X-Google-Smtp-Source: AGHT+IGcnxhYb5NggH77kYiJNWz2MXC3uuzdnoOzrp4gOG0fkOpqkEDKVm3D3Tgc9B5jqbrgiwVAbQ==
X-Received: by 2002:a17:90b:2647:b0:2f7:7680:51a6 with SMTP id 98e67ed59e1d1-3030fe6a058mr13981930a91.6.1742758090161;
        Sun, 23 Mar 2025 12:28:10 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-74-48.tukw.qwest.net. [174.21.74.48])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf64aca3sm10427246a91.49.2025.03.23.12.28.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Mar 2025 12:28:09 -0700 (PDT)
Message-ID: <7296aa89-95d2-449c-b2ae-a9281d760fde@linaro.org>
Date: Sun, 23 Mar 2025 12:28:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/30] exec/cpu-all: extract tlb flags defines to
 exec/tlb-flags.h
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
 <20250320223002.2915728-3-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250320223002.2915728-3-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: YmmYmkIfMff1

On 3/20/25 15:29, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
> ---
>   include/exec/cpu-all.h               | 63 --------------------
>   include/exec/tlb-flags.h             | 87 ++++++++++++++++++++++++++++
>   accel/tcg/cputlb.c                   |  1 +
>   accel/tcg/user-exec.c                |  1 +
>   semihosting/uaccess.c                |  1 +
>   target/arm/ptw.c                     |  1 +
>   target/arm/tcg/helper-a64.c          |  1 +
>   target/arm/tcg/mte_helper.c          |  1 +
>   target/arm/tcg/sve_helper.c          |  1 +
>   target/i386/tcg/system/excp_helper.c |  1 +
>   target/riscv/op_helper.c             |  1 +
>   target/riscv/vector_helper.c         |  1 +
>   target/s390x/tcg/mem_helper.c        |  1 +
>   target/sparc/mmu_helper.c            |  1 +
>   14 files changed, 99 insertions(+), 63 deletions(-)
>   create mode 100644 include/exec/tlb-flags.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
