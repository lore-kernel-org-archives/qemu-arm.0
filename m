Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp1992906njj;
        Sun, 4 May 2025 09:22:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXrLcZSvb9wiWrK3xEKMozrEshJ9SAH6pwl9SotqN0h2cTYU6KmzY4j+YjRwBYJlPDAo0yOhXJUqbd5rg==@linaro.org
X-Received: by 2002:a05:6a00:331b:b0:736:34a2:8a18 with SMTP id d2e1a72fcca58-7406f1958c6mr6697094b3a.24.1746375762152;
        Sun, 04 May 2025 09:22:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746375762; cv=none;
        d=google.com; s=arc-20240605;
        b=j639jT68CbKM3Z26i4f49skQhC79VLzo/AdSgi4z854xdXVksz5Eu3uw5Zk464mc6X
         wiXiH97p817W4cy+tmnsq59cwCEyFjCQCXgTMygZ89hNDqSu90ZPsrmJVdMsJ07Y39V9
         MfTSFq5ZLFV+EkcBA0pCfPcMEHjnypw21T/wUXM3JDGL+JORpku1o4paisPFLXSXlsZj
         oG5AsoDJufkluY93j98oAZ3emfXfowSa59li2u0g3iMvYOJh6qvl6IDaBHQMa98vvRdY
         binjcUawv+2EBuOCTsmQnO5n2wYKYodsaPcVyVG3QrfDO1aYrSNY1AarXKGjfYPmyQnt
         Qi8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=kgIX1vsZuDFUCgCQi+gmJJxCZwsyyNSVWctppGjoyyk=;
        fh=HshDKYd1vsowb+E4QY+zu5izVMfoharCYipbB+HR+XU=;
        b=g3QDHy9kBLYG0qKZXF7FEh1CVITgrJIZmqDl5XoOzfZ8VA0ehdl3aZHs4ac6dXud5p
         TFNZLgXvLX/2KdDuRyJy3BSVByW/6+ouduB8c3dUz8FdCSpvqZUd4cAs7uLiZ24ZlQPU
         8Fb+yeKLyfgkrjiSEY3v38Qziie50ivAoKmwwkhVrh6V3K4PPqT69/NVCB+3qgQkRlwB
         4KEEJJZ0Q0ItNmzo6KR3txdij4QbNjow7FtasES6dQXyFifUjsxwdEELclPGFTnLCM1/
         de6mxdjtz2yXBQ2Z0xx45E6dQbYgX39fvyd965ZvVnmQON+J+hIra26R6qkq2NpcWhfD
         0BxQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h3Paho+g;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404e5ab6casor5470653b3a.0.2025.05.04.09.22.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 04 May 2025 09:22:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h3Paho+g;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746375762; x=1746980562; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kgIX1vsZuDFUCgCQi+gmJJxCZwsyyNSVWctppGjoyyk=;
        b=h3Paho+gGALTH0yD9nokY9JYHy2/06pSRzYA4DfgyjZbQ2E8qvbG/aqi0wCYtrZwcA
         2JZoStG5wxqNsum9XIVg3lwwlWerVkBQLQZlUIXTu3bQLb2Z1ioVIQ0MK3gPUIKAvuGN
         e7b174YCTSizNKn07rPqrH5TIgqsBIod91pzVV1O5tTAX3k7un35/QyS4xHSGQcnomqM
         CPnJ4eLfnChuAX+Jn5CyIRTn+X9D4G5C330QF26aMVNCHt7P9VJgUjt0gg2L/5DUh/XS
         awfpT3FpVj2ZABqzRmGiqS33aG0SHldPza9ghJhqn2ODyliscNLJsIdGUOTmoXXj9Aay
         Nvug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746375762; x=1746980562;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kgIX1vsZuDFUCgCQi+gmJJxCZwsyyNSVWctppGjoyyk=;
        b=adCIoGYXo7BAMiV0GEGaAoOUDzFQvbQs1a6YUHPrSGjGiedQ3WHdPlukVt9NfBoJxn
         tWXPmSMr91Sm9zeH/jAJogbOF5Be2Zq2h23TzJ7XMSnjIBWW8nQD34fn+2H4rWuR23fh
         Xcigj8flNlXMVitkdOmMhcur+Yi2mPKAFVMv66etZndVD1NQaJn5rxdSmlsInSNV9M+m
         sZdtH0pyRpU3JqyyWVwxl/WpGFT5NZgtkmANuxWZRNc5Ogcgw4CsNkvqYkXgqFoQ/nQA
         eNxE5HftmsxcJXDnuBZFF7pi2P7mLycGj9i3axz9E0zN8ma7wkMdJUSW+AuelBZgE5N4
         b1zQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2tZO/q8SN5cmfXm7Xw3YvN2rkS0rnhwXPwRVnviczEKAGtafXPclNeWqYTT/It21HdiyzWWi+S1n3zw==@linaro.org
X-Gm-Message-State: AOJu0YwpApL/YOLz1u7pBatfiyBPB16l5aFlpkoEKM46fJQLNelBMA7H
	/d0kxVun1OVf+WpjzC9MLWBOFLmYM+gaJgxI8ClPXuz8qZ9ZheszMeEJrL8hzQc0PQ==
X-Gm-Gg: ASbGncuPHbI2S7mpa1IWp1OHzhkhUgXSF1jLbXDGzBOA2g4Ft3FSllc5q288CL28/Bg
	WtulOiJdWdRIOEzOs8ZJCOxuFMDcE+whgfbrBM4VGIqIrHQ+2Q3k46SDBsjWOw4Orbi9Ie5qt6/
	7HB0E62sk8Pe1ZFdx5RbeJizXnHRl5RyGTK+flvrlef6j4kZhNToVHwUYeQa2yb9k/rhlbxhaJY
	sPjyOqaOCzetmlFzIbW9a7fOFS1UNfcZk608Vjw4F+NnHZzG5lEbnK5pccypRe9oX2685lwCE2Y
	eNERMNku+U9wTEXbf20BygAL61a3tfzM0EtAVG4ABJDwSE80kBxo31uvkWgvXQyUcAUHmsQpa8c
	2LOOlZBU=
X-Google-Smtp-Source: AGHT+IHRYk5QgI7VMX8dTjZoYjvU+aCIcTnL50+b27cw+8DBfiz6tjKw/RO839BAj82CBUKEpNuImA==
X-Received: by 2002:a05:6a00:1d0a:b0:736:46b4:bef2 with SMTP id d2e1a72fcca58-7406f09cfb1mr5345964b3a.6.1746375761753;
        Sun, 04 May 2025 09:22:41 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74059020fe7sm5186235b3a.102.2025.05.04.09.22.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 May 2025 09:22:41 -0700 (PDT)
Message-ID: <3fc7e2c5-12bd-4a6e-be17-303bc870a0f9@linaro.org>
Date: Sun, 4 May 2025 09:22:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 39/40] target/arm/kvm-stub: add missing stubs
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, anjo@rev.ng,
 kvm@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 alex.bennee@linaro.org
References: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
 <20250504052914.3525365-40-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250504052914.3525365-40-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 6FCTDgdSpAyq

On 5/3/25 22:29, Pierrick Bouvier wrote:
> Those become needed once kvm_enabled can't be known at compile time.
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/kvm-stub.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


> 
> diff --git a/target/arm/kvm-stub.c b/target/arm/kvm-stub.c
> index 4806365cdc5..34e57fab011 100644
> --- a/target/arm/kvm-stub.c
> +++ b/target/arm/kvm-stub.c
> @@ -109,3 +109,13 @@ void arm_cpu_kvm_set_irq(void *arm_cpu, int irq, int level)
>   {
>       g_assert_not_reached();
>   }
> +
> +void kvm_arm_cpu_pre_save(ARMCPU *cpu)
> +{
> +    g_assert_not_reached();
> +}
> +
> +bool kvm_arm_cpu_post_load(ARMCPU *cpu)
> +{
> +    g_assert_not_reached();
> +}
