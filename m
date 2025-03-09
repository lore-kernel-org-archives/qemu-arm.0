Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp436360njc;
        Sat, 8 Mar 2025 21:24:25 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU4o48J2dlxG0RvE5RElDXfymKSms49M5lTAL6mUlu+I79UMPfsqQSlLgX1uqDosLyPWwY+i4X90jwdkQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHuKCDTccz2fgabkQMMwdV99UHRKtM0omj7RvBDFzvVJf7bRSkR9SXILlBWe32oyOrM91is
X-Received: by 2002:a05:6512:39c7:b0:545:54b:6a05 with SMTP id 2adb3069b0e04-549910b7c1bmr3968411e87.45.1741497864929;
        Sat, 08 Mar 2025 21:24:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741497864; cv=none;
        d=google.com; s=arc-20240605;
        b=FHHF08UCPEMwpkFMgPRippc+C6WuZNJN9X/RGONqqZmFA/5j5M8TWTd+TmOgypU+3Y
         aVVaqoEPCUAo9SkODlpLv4PR6HvAH7dnU3GgcvbSpx1oowHcDXYkbDVOQpNFmv4JVxpW
         2jeBjR0lKzdgPw8w4eiWf82TUyve4vd6AzSuhmW0Ym1/Y4JVRpc+K2plSXUN1eWFmtwB
         HGfvddcCPj4eAZYmO4+6pdKs08hhmIgiDp+WikQ+7YlQN1mIIYTzr5P0ORQTKKB9BNA8
         BcF5MRW0uWGm8NFGjhNRFWvZHXFCy1sY2XEAvPsdICudJ0wUhDePs82tIjDQyefwwthD
         1U1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id;
        bh=NjXovxroH4NEfEc6kPT9O4mF+/feQF1ubGAIhi7t5cI=;
        fh=bwNPwCdRufgAfv1G73BgInx0SXOI+C3FLI+33Trf+lU=;
        b=aPExGC0rnWoHqO5c/WcxaLAAuPBC9j5QivR0CGQQFsz9bDcplUaVGzYaQUx4XFtZ7M
         dEEE7DZMqIuQ/yn1O2WXYZ894rUkYaynDFgmGjWU1YXsv+ObkKSyfC58+bdXV4d6euEA
         g+/+aHnM0eo6auHsOaKf/op39JYKeTaIzofYRzSpl13FXNBfnLART6Gv5MP4IdIORgHO
         QYyKWQ/PmKhmXWmxeTnnGS3NWi2kAyVUNQ3I5UPq+Itd1Ya+cCvp5VgyehQHp1zbfZjB
         tkdZzsLZe3UdXoe+aO1WUY4XJNZq9xFxeFOKrBVNJj5UE5pXVHhnSVVw7L9JbmFnWTYn
         uNkg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of mjt@tls.msk.ru designates 86.62.121.231 as permitted sender) smtp.mailfrom=mjt@tls.msk.ru
Return-Path: <mjt@tls.msk.ru>
Received: from isrv.corpit.ru (isrv.corpit.ru. [86.62.121.231])
        by mx.google.com with ESMTPS id 2adb3069b0e04-5498ae445dcsi3195307e87.34.2025.03.08.21.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 21:24:24 -0800 (PST)
Received-SPF: pass (google.com: domain of mjt@tls.msk.ru designates 86.62.121.231 as permitted sender) client-ip=86.62.121.231;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of mjt@tls.msk.ru designates 86.62.121.231 as permitted sender) smtp.mailfrom=mjt@tls.msk.ru
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 62ACDFB6B2;
	Sun, 09 Mar 2025 08:23:39 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
	by tsrv.corpit.ru (Postfix) with ESMTP id 83C371C70C1;
	Sun,  9 Mar 2025 08:24:23 +0300 (MSK)
Message-ID: <e5c5e542-f28c-4f4d-884d-ee3defd0a330@tls.msk.ru>
Date: Sun, 9 Mar 2025 08:24:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/9] target/arm: Implement SEL2 physical and virtual
 timers
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>
References: <20250204125009.2281315-1-peter.maydell@linaro.org>
Content-Language: en-US, ru-RU
From: Michael Tokarev <mjt@tls.msk.ru>
Autocrypt: addr=mjt@tls.msk.ru; keydata=
 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
In-Reply-To: <20250204125009.2281315-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: ucqgHr2RoTaW

04.02.2025 15:50, Peter Maydell wrote:
> This patchset is a respin of Alex's patches, with some extra fixes
> for bugs I discovered along the way in our existing code (and
> a bit of refactoring to make the fixes straightforward). It is:
> 
> Based-on: 20250130182309.717346-1-peter.maydell@linaro.org
> ("target/arm: Clean up some corner cases of sysreg traps")
> 
> because it wants to use the renamed CP_ACCESS_* constants that
> that patchset introduced.
> 
> The bugfixes are not super exciting as they mostly are oddball
> corner cases, but I've cc'd them to stable anyway. The actual
> implementation of the missing SEL2 timers also should go to stable.
> 
> Alex Bennée (4):
>    target/arm: Implement SEL2 physical and virtual timers
>    target/arm: document the architectural names of our GTIMERs
>    hw/arm: enable secure EL2 timers for virt machine
>    hw/arm: enable secure EL2 timers for sbsa machine
> 
> Peter Maydell (5):
>    target/arm: Apply correct timer offset when calculating deadlines
>    target/arm: Don't apply CNTVOFF_EL2 for EL2_VIRT timer
>    target/arm: Make CNTPS_* UNDEF from Secure EL1 when Secure EL2 is
>      enabled
>    target/arm: Always apply CNTVOFF_EL2 for CNTV_TVAL_EL02 accesses
>    target/arm: Refactor handling of timer offset for direct register
>      accesses

Hi!

Which stable series this patchset is supposed to be applied to?
(Current active stable series are 7.2, 8.2 and 9.2)

Or put it in other words, is it supposed to go earlier than the
most recent stable series, 9.2?

For example, the very first patch, "Apply correct timer offset when calculating
deadlines", does not apply to 8.2 because it lacks v8.2.0-2122-g2808d3b38a
"target/arm: Implement FEAT_ECV CNTPOFF_EL2 handling" which touches the same
line in target/arm/helper.c:gt_recalc_timer().

Thanks,

/mjt
