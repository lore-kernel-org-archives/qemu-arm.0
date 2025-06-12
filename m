Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp2447857njc;
        Thu, 12 Jun 2025 09:04:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCViSwm4yowyi8v8dnXd0jBkCSZpJRahYH9MYgB+qR6WBenEHQvd0YsUWX6sx07vhqQwq6FN7gB8/uaxPA==@linaro.org
X-Received: by 2002:a05:690c:4885:b0:709:197d:5d3c with SMTP id 00721157ae682-71161e549a4mr8286047b3.11.1749744284131;
        Thu, 12 Jun 2025 09:04:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749744284; cv=none;
        d=google.com; s=arc-20240605;
        b=QMemQtti/bH3sXG7vuM5fqXuXO7D66y5iVjHRogkSe3gU1WqmzRCzRYneK1TLrBHju
         D/2iFOtqEDYhhB2Pb4KJ2ctbIZ0fxrBi647aRn5lY8h5DNT3X7hbeyESr43/IlDqk4l1
         MoE7ttZSUYhlC+VCjge1yZ8RdWgKliQPtuX+ulcquZhXuQkRclwlguwUuZ5x6Y+l5wFg
         Gi+Qj0jRCCWstQGSKVSwlgQEoUNPGlxNmKEO7c8jBCTdGjpH0KZYmfSdQ9nWtdHRq4LL
         POcPcWWSRftTxxBv52I5W0HBsQbJQiVlZcDF3QabTERM/iPVHVHLP2fHTrywhY8wUK8b
         Td2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EefkG4AutVpnBM/hBmoXMzaEp175aj32Sbgg3k63XCY=;
        fh=bu9R9IfkD/mT1DyDkhsyYIETBCjJDybC933k7CJK8HE=;
        b=dLFikW3fXyqMroSCx3oalvqA2+xYyXVF5Fbat+OZZNX6KDBdr6+CkdjMr5Y6B3eSeI
         +ijFjmFU0PXizm8h5Kqx+sxG7pzHgaJSAlHiSul3t0bSYw7UEAFjm0ZkmqrGyUCvFaM3
         lZAxeoIlGlGuz8+g0KjOm18Pf1QWJigSeGQJj2nxSzBCBeQagyKOvqkT3U3z15URPBYx
         YNu8M4LVtxtBjJ2vQpnXnvxrfVdRMPU/dc2xJ7rrH7XzsWTntbRDIUndo5RGuZA2vKDa
         dBf6fjVQejII/tCcetL2IyVuatct64a1TCeFUJz31XI8r038a/7YYYqtPX6ExBiDdB5h
         0U+Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Bo1/eQxg";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-711515a8cf2sor11986717b3.5.2025.06.12.09.04.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Jun 2025 09:04:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Bo1/eQxg";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749744283; x=1750349083; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EefkG4AutVpnBM/hBmoXMzaEp175aj32Sbgg3k63XCY=;
        b=Bo1/eQxgng0YmK6gGVI74S+vX94TVR3GLNe7ghyhWzRZG9u5tHFAvyjRSeCl3GSWnV
         +pwp+i36ks9b+ySi1Si4PfSMFZez7KLQ2oRMh0OPG14ziImJGAml9joEPAYlQ4JtE8js
         bASXeGZDF+khFzlRFhVd6g6wuxFypHDA+IuUCBLXrCP2wmiFSoMa7VqoNXp6txqTM5E4
         MLD+Ss0rrQyADcK1GIQMY2GSZb6k/n0CH807845l/zDw+JDLYGmkSiFTlek97BmbK9dw
         U61pb/GhrIWJ2TMvmT4BZBk39SwjjHTJgra1z3RBTdldWdo9j+kXVU16JggxJxyFlX6F
         3a5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749744283; x=1750349083;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EefkG4AutVpnBM/hBmoXMzaEp175aj32Sbgg3k63XCY=;
        b=aD8cKReK6dZ1Ev57C6RowZNP5lMNRp+r6SODS4UMzY0UAHgUGb1+Y04imn8ETNwtSg
         xYSAqm4ChbcZoAfTzS0+4KVJI5oVKCzc/uT7qwETeX2K2poLzecDJM+rTnDK03pSsZxD
         +VAGXeBSi8JELGKrIDYlMQzrc8uMjKe9w23sou9L3XnSiUCXG0cKUaoIAyHmZCih4hzv
         5rcaQTV4IqgqoHZgWcfhfTKEyXGSLISJN4oH08unZo/IOans4FVQF51E8kkSjQR6OyvV
         jREJKud0Z3E/d5OOjVouYW6anF7H2OMh6mFEuIeuBShwBMhWqdvFJlbxXnyNSbL2yI3/
         CPkw==
X-Forwarded-Encrypted: i=1; AJvYcCVUM5vWdU8ShmPuyF8RNd/9F1j5agvvFC86YZkF3NMqt5TjKsn62eeMGzFVAPY1Jj2EUJxTydQiVg1vmA==@linaro.org
X-Gm-Message-State: AOJu0YwZEtnJWTP2H0ku0p8HClKvVhxwnGNMdTYeLeNLfriMbeN2jYgd
	OzfhxceCxxyHIvDk78as62+x/V9dMC2Y4t+vRdru99CmiJ7uurfafpenXdy/l/nbw91lLK77vmc
	jmgUVz9ZXZrwzlhP/3lzIvSSP+uqUFdLPQ5N8iuczLoC2
X-Gm-Gg: ASbGnctHVfWtiIz4QvnguX4gfnwRx4+v8qqdnJqisSb/81g+b9ewghfEGZXHNtJiv31
	kLywtKVk481qkY/a6TTylyMDZhLv6Ld/A6HVeEn9t4dhC+ApWRlfAwOGfO1EsH6VsOdXAEvmHaX
	8cP1gMFWmFG5Nb+7rXeANjnenfo+6YCgM3pWu/O3ziujmB2yQNi48/86c=
X-Google-Smtp-Source: AGHT+IG/sKTyln7/Rh9ZAyvgO3cTqV7x3+t7YPsMib12hMamHWC1vsfheBF6RN59okgSiPTyIy/EYdtm8QgDURCe6mQ=
X-Received: by 2002:a05:690c:46c6:b0:70e:7663:8bb4 with SMTP id
 00721157ae682-71161f3b72dmr6621557b3.25.1749744283371; Thu, 12 Jun 2025
 09:04:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250612134338.1871023-1-Jonathan.Cameron@huawei.com>
In-Reply-To: <20250612134338.1871023-1-Jonathan.Cameron@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Jun 2025 17:04:32 +0100
X-Gm-Features: AX0GCFsVkhB-NNCIPuW5Ihp7pcwAXu-4Z1zJIMp9UK--qP27Z1yH3-eqLOzVB4c
Message-ID: <CAFEAcA9CuQWL2b63+XCe+vZCGR7hRSx8SkTR0LDa+Ra1Z5ur7w@mail.gmail.com>
Subject: Re: [PATCH v15 0/4] arm/virt: CXL support via pxb_cxl
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: qemu-devel@nongnu.org, Fan Ni <fan.ni@samsung.com>, mst@redhat.com, 
	Zhijian Li <lizhijian@fujitsu.com>, Itaru Kitayama <itaru.kitayama@linux.dev>, linuxarm@huawei.com, 
	linux-cxl@vger.kernel.org, qemu-arm@nongnu.org, 
	Yuquan Wang <wangyuquan1236@phytium.com.cn>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Alireza Sanaee <alireza.sanaee@huawei.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: gY84M8UqmT8J

On Thu, 12 Jun 2025 at 14:43, Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
>
> v15:
>   - Split the address map calculations and mmio setup into separate
>     functions in patch 2, allowing v14 patch 3 to be dropped as not
>     x86 and arm make the same calls.  Note I felt this was a sufficient
>     change to trigger dropping tags. (Zhijian Li)
>   - A few other minor tweaks.
>   - TLB issue mentioned in v14 now fixed upstream so dropped reference
>     in this cover letter.
>
> Thanks to Itaru Kitayama and Zhijian Li for testing + reviews.

Hi Jonathan -- I forget where we are on this. Do you think this
series is OK to go upstream at this point, or is there still
stuff you're iterating on here ?  (Put another way, should I
review it and consider queueing it?)

thanks
-- PMM
