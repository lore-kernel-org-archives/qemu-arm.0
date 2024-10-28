Received: by 2002:a17:504:82cc:b0:1be9:327d:8ee3 with SMTP id m12csp36572njj;
        Mon, 28 Oct 2024 23:10:31 -0700 (PDT)
X-Received: by 2002:a05:6000:104a:b0:37d:377f:da4f with SMTP id ffacd0b85a97d-38061159595mr7630076f8f.27.1730182231193;
        Mon, 28 Oct 2024 23:10:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730182231; cv=none;
        d=google.com; s=arc-20240605;
        b=VRW5+M/Tl5KrWbt76JXatO7KokHVQt7cZKqfHuaMMkoNTrQvokq+sa1x6ACUTtcr0h
         srjAZG9eYt5vaD7oMUffZJffoNhfvfWNJgkFpQkb0sw3hwUIsa4pxhOkwOBs/sFXuoZ0
         JPHe67e8STPrkoQkQiDp08wlMBo68xPT+zj5mSvcPe4pSHPSq27nyB9L5J1H7NCSaUnX
         QTUhFBzIbgzIbKO5lwlytOVvFYu6CsjtztU7DT67/QIkQITpnXnmlIKMcdo3VJgYadSq
         C0K5bX24Hp7UxKYadIuQeZMH18DuTJEk1YiQ+4reIlbgofCTWPrwd0Y6sa931atqUqEB
         Icfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=dKWEdO2S5aw/JSzKgSCFRrq4eJQgzUdy3Wu8jQfmul0=;
        fh=cV0x2MJ9gtIrfnrUMYB6k0QkF3vl+EU6F4WwtejqRuE=;
        b=CHb7IIXnmPLsK6JNgT/8cs/NIeCVTA/y2G3HmLPqw1irM0tgYVoUkw5pY2seGRa7AV
         13U3rc2fVj8A3mEDHZ346ks2xts73OadZBFECey0fHkNJ6nz1Vd1D1CA17iGX1K74GS2
         7RrqG3WdvJWb1x4Ap5CrBoHI4miQtpA3snmu5jU6Q6yiNizYVA0Pd0XSAu+qCOGoUKbh
         QSRhsumtiuLTNFccoDUp8aXTiBG/8cMtG0nFxNJqD9hDvNkcQmolAvUyvS+OR2eNBZMR
         WZGzxiwU6yjuULbxt61BpZLtjAK2M7Rmc4IRdkr/yrJWr9ur8lk5MnZVBUm18l+n41dN
         XTWA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X7qy+5wu;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3808282eb90sor319006f8f.7.2024.10.28.23.10.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 28 Oct 2024 23:10:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X7qy+5wu;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730182231; x=1730787031; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dKWEdO2S5aw/JSzKgSCFRrq4eJQgzUdy3Wu8jQfmul0=;
        b=X7qy+5wunAqteX45ahUVZDNJF0L0Vj1T68FeJtZj1Sm4TVm9xTRddJrc6Hm0AG4EwI
         7DsbC6Dl2ME2YH55lE/S/NsUn7jvDNmzuwffoR/R5pTNGKjWNT99Lkw+CFYUVlHK+Fom
         If8bnSB9GQBGGjnhRpoVR9/vQ+/OTYdpz0ETne2tuG8oAGw40a3XVsMT53umtYHl6Jpg
         EoXKAgDld5OCQKJjkOwwvaMT1f+iwMHTu++8gmT89VYfxLW7CeJmEqxxGdQ0ioEDBhjI
         42cquM9CMEOY8zP7LxETqSlxP0sUHpDD02C+XWMFdwm0oU5niSbzyu2JAvOCU5Nrr/Tu
         Nf7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730182231; x=1730787031;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dKWEdO2S5aw/JSzKgSCFRrq4eJQgzUdy3Wu8jQfmul0=;
        b=Hbol3Ps6krC+R1RV+LE8ze/OUBJpXDlNo+40Uhz6fVTY58msL+2OyIzCfJcv4AO7q0
         HfYIu0hNRUXMvAEOjbuEWO477sKTr5ny4IGhzl9JhlEqsSHpwkOVbnpQawovNqhazMXs
         Q+NfCKBrRzufI+JFtdZrtZtq743WEd5uOBv16kaRT64ABDA1ek8YMCivBHUTqrZ21HcC
         ZjbCrc1qDJERUWeu3UvOYqg6dMTUAsQ95lijWn0DloVeev5otVX2iAwy/rvOxkj4YecB
         kl3eXE/S6SqJvlZPtgK6osi1jVSfP/ij9qfnynAiem+8T+5B5KEiYGHzHR9WZFEiZ63n
         9bLg==
X-Gm-Message-State: AOJu0YyULbxKthZtei93ovDIuh8lHFVZBKRQ5Vx9Kubc9dI2Arc3DjH7
	P6SSQ/cNdUCZQsrzwKK8vSx2SsZNvmJKXj/45aN+6DaPvsQllf0hSzs0OrSFp56HLw==
X-Google-Smtp-Source: AGHT+IGGy0H/FlmH2GUISdMS+4yeXD6bznqQY22mE1VDSljWmF9uQ/5LJb5oAfoIAEYon5L6JvB13A==
X-Received: by 2002:a05:6000:104a:b0:37d:377f:da4f with SMTP id ffacd0b85a97d-38061159595mr7630058f8f.27.1730182230553;
        Mon, 28 Oct 2024 23:10:30 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.21.227] ([90.197.151.65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b70bc1sm11560253f8f.70.2024.10.28.23.10.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 23:10:30 -0700 (PDT)
Message-ID: <a229e630-954e-4681-87d0-6b64983369b9@linaro.org>
Date: Mon, 28 Oct 2024 12:10:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/21] target/arm: Explicitly set 2-NaN propagation rule
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Eduardo Habkost <eduardo@habkost.net>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Aleksandar Rikalo
 <arikalo@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-ppc@nongnu.org, qemu-s390x@nongnu.org
References: <20241025141254.2141506-1-peter.maydell@linaro.org>
 <20241025141254.2141506-4-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241025141254.2141506-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 1gGImgn4VqAH

On 10/25/24 15:12, Peter Maydell wrote:
> Set the 2-NaN propagation rule explicitly in the float_status words
> we use.  We wrap this plus the pre-existing setting of the
> tininess-before-rounding flag in a new function
> arm_set_default_fp_behaviours() to avoid repetition, since we have a
> lot of float_status words at this point.
> 
> The situation with FPA11 emulation in linux-user is a little odd, and
> arguably "correct" behaviour there would be to exactly match a real
> Linux kernel's FPA11 emulation.  However FPA11 emulation is
> essentially dead at this point and so it seems better to continue
> with QEMU's current behaviour and leave a comment describing the
> situation.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   linux-user/arm/nwfpe/fpa11.c   | 18 ++++++++++++++++++
>   target/arm/cpu.c               | 25 +++++++++++++++++--------
>   fpu/softfloat-specialize.c.inc | 13 ++-----------
>   3 files changed, 37 insertions(+), 19 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
