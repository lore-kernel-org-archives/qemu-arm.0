Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2078904njk;
        Sun, 26 Jan 2025 12:34:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU809Bp1TYrfGC6brp4QQDlqVucKMFFlpKnN8wOwxEh8zr2whQygN5ciLw2z4Jd3Vl0Ky+8HpfAYeOYgA==@linaro.org
X-Received: by 2002:a05:6a00:830d:b0:725:ce39:4516 with SMTP id d2e1a72fcca58-72f8b3c85a8mr14719284b3a.7.1737923666750;
        Sun, 26 Jan 2025 12:34:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737923666; cv=none;
        d=google.com; s=arc-20240605;
        b=PWEnUqKljme/u5wPPnBcYfMD40dTgK5a5kq1to19ErOpiQeyrTFFZE5hZJSWPO+GCu
         HdHfZr5YxswyN+dz3TlEF/2c7mNqhWD4ydMWMqYx+w/MoK27yozB/AV2syeBcUcWVKU3
         5sIWi6844P5mQHYR5rXSUx5GAEqXlUl3V8Hm5GXFuS5E7V+n/zMFpMngymyB4DPY/7Vg
         UB89KUPrBGHaInkqKSRd/jErdLlF7f66HFH702PmFZqmsyuwpmR1ZBrtNT5hj18XiOty
         zIf+5UE5Eoa4BZf+hkjvkt9HClicHPI+L30YWZg9z2PZGz8Vds/0s5puc7THwP8IXO1x
         KAcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=HV0rFwm2c/DiJ3VIFDuxU64dDw12Xibjr9C6hrIuIZM=;
        fh=ZAVbl1DpS86Z9982nOmVO2UZ7PtgyCrMb1kI5WEaEzc=;
        b=G34jESt5rsqrkHjOuNNkzNO9lWLZFLleXhXATczCfL+ByrdCuyCdZFM6mNoRs6JiOm
         xldt/+VyfqDRKLAx/xKla1m7faHx+gwYEPtnVInKu+uM70L0LNxH/06eiBWHQiwpWIfx
         y+oLlEQY47xPAyvpa0wfq+rHaP7vhcSm1O3uD0e3M/7p5KiY1BB6CJMDveEsMkVlSkKC
         bJPdxAMq5ceB4aVgYujj3SsF1J+BQv6Szv5L6drb/ygj3oMQKT62PZ5Fou8FAIz9EUEh
         LKn3L9Te0bwFfZPnsOYE4SQj29cdLCYblgNoZRsxP1M2ObEcyNBW6yRS62Cdes+3rCQI
         cGOA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tiU1b3s1;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-ac49473b64asor2806154a12.3.2025.01.26.12.34.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 26 Jan 2025 12:34:26 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tiU1b3s1;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737923666; x=1738528466; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HV0rFwm2c/DiJ3VIFDuxU64dDw12Xibjr9C6hrIuIZM=;
        b=tiU1b3s1KKhN0fzDR7GlOrd9DE+5douomKZSBYu+NP0wsTSuHIU67c3aV4c9bKYh92
         /t9Vyi44s8DOfsH1oNwOeoomqtFWoYjbknR9hme1ccSozIRx0l6CUvwlOk+s7zQ+vD0N
         q2cHL31kLhsYUXPSBA2qTHARQszFtvH5jfcDkPt7dJ8CPBRZGboal1gkXqrKuwtzb3OT
         +1wdDd5O2iZ8FSI7F6C2WvKqEenqvGeLc4LtiBWqMuCb6Lo8kZZgoiad32lnTXk6QbYt
         8O4hqz3NlpIL34+8R2orlDN2I5+eaZoiOxsvy/Efsn9xKP43GFbTXCNZSqN7Y3oV/zkW
         JNlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737923666; x=1738528466;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HV0rFwm2c/DiJ3VIFDuxU64dDw12Xibjr9C6hrIuIZM=;
        b=Kckij+lW1R6heO3nAelULiOi7DYA3S8Ijy0d5Re56zKkIaHb1vNvESI7mUxhhnzrRN
         NY2F9a8GE/9nOL/8gMK2C6XdAjNVbnh4ZtkOG4nA8EVqBA+lFLPGmUsgDjWgteUh9JjS
         z2k5DXDyaFAzY+lSjsQcLZZjVIOxoK+itVofI8jgHU3r4lk99BFav0U06j/qA/d0w2bJ
         szBOPo51lkPlf9wTCwdehuoiToxinByUI4dRnwA6025lMyA3Hxz4/Hkt5BM9qvN+FkD0
         UpIXB34eE6UIrquRc+fgcH0tveIENe8a69WIe7ABuVfv2yhIwTpTxq7EngAQWLdeQIqQ
         Lxag==
X-Forwarded-Encrypted: i=1; AJvYcCX7yFHlZF3OGqNMbLkwyOqwLywbkdDPKXfdvXbkBbai7g9/uD4g30x8OzmngqhPZDXL/Hl6rqltdQRJGA==@linaro.org
X-Gm-Message-State: AOJu0Yyjv8BeUo1kRJMhbBnZz6Z9rrL5Izgvc7dCayhJiljHfKKKRJiP
	Ej2SX7FMkO7r6pmnzFQ1L6eewbuDRKX4asINDsI++beQBg0xG5zDnwEYP0OMihPIOg==
X-Gm-Gg: ASbGnct8AXwaUupDFuIk+JBP63uyGALawQx/576c7nG81GYnHqDX6G86lkDcEg87xG5
	787tmGFrSc3NaFC+rGSa/WdzSPWCZ1JTHOwZoSoYBgSsF/HGq/PGFgW9ZrNoY1Og2Oj/8j83HHo
	6dMJu71CTd4+ZlFji5GwR/lsWyUJYkmcTOpwhG66QIkS026b4wUZHAQ5ls1rP204L+uA21E51nm
	7vp2ql9+Ya7mMu3H9G5zGkSh6F03oyI2fp4qyLf6O2rGUUYymnsyWjqhABTK9Kr8QtvGkVySULz
	twG2wvxMCwlkPjVGtpM0qrIsLdl2gs7ewI/cpli1s7EzLdE=
X-Google-Smtp-Source: AGHT+IEnuvCpks4R8m2CWUAxXqy7OUK3I7qmzF32T6Ls9afPXbIvlOOo7wFmoCIeuE1afURwxObJ8g==
X-Received: by 2002:a17:90b:5488:b0:2ee:7e53:bfae with SMTP id 98e67ed59e1d1-2f7f177c6b3mr23097382a91.10.1737923666307;
        Sun, 26 Jan 2025 12:34:26 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-71-127.tukw.qwest.net. [174.21.71.127])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffaf8b27sm5519409a91.37.2025.01.26.12.34.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jan 2025 12:34:25 -0800 (PST)
Message-ID: <2641e9da-db13-490e-9bae-64ecde1f9352@linaro.org>
Date: Sun, 26 Jan 2025 12:34:24 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/20] accel/tcg: Restrict 'icount_align_option' global to
 TCG
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org
References: <20250123234415.59850-1-philmd@linaro.org>
 <20250123234415.59850-10-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250123234415.59850-10-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: NsECtBgRh+qe

On 1/23/25 15:44, Philippe Mathieu-Daudé wrote:
> Since commit 740b1759734 ("cpu-timers, icount: new modules")
> we don't need to expose icount_align_option to all the
> system code, we can restrict it to TCG. Since it is used as
> a boolean, declare it as 'bool' type.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   accel/tcg/internal-common.h | 2 ++
>   include/system/cpus.h       | 2 --
>   accel/tcg/icount-common.c   | 2 ++
>   system/globals.c            | 1 -
>   4 files changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
