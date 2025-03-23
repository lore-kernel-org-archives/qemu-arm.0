Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp1563695njc;
        Sun, 23 Mar 2025 12:50:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWU518Xw5YI9QcuIy7wlPuoY5PSK1BUpTgA7OjCsi6YStft32L1ed/M3B7H8aO8LHGqR2MvITYThGJR9w==@linaro.org
X-Received: by 2002:a17:902:fc4b:b0:223:4d7e:e52c with SMTP id d9443c01a7336-22780c689f7mr200492185ad.5.1742759424066;
        Sun, 23 Mar 2025 12:50:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742759424; cv=none;
        d=google.com; s=arc-20240605;
        b=KhvVSHkEl8i4gODtJApatf6wj7FKgV6b8I5t8Lf0Qh4unQ40/IO1qwITUx1P6g6m+b
         7CIEFtKuaaMxGNGcDNS4QKOreElVpUuaEHpxRFFHqRVv2CjScfLMhqZEKCn1G5nEexPN
         V+x2sfc+r4ry4Cbda9Q3c8lcv7Kh8mAjVBqeoGseJWwJB4aMu1UTl8M8XYcC9yrXKpnt
         BRWgAqBIXlzltwh5xW6vXC/LH+w0lGW1TTj2laseQCnrx0dTmGxq0+4pbigumJ1gNPiF
         CymEEVxb4LNZrdA9ZE8iGd31uOJXdjHK1y84j6xVsY0JRCx02Pejunx8Cs6MXC2uFRy1
         oWpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=p4xRAN0m6ZdO4gtnL2+ABu6HfCfeJ4P1/qPsWE+BDIw=;
        fh=+ti7VcSiV3ETitmWceAD8upKZnXw1bFfD+dp6CIz29A=;
        b=TMhENxuuZxGZo/Qed6W7J1O1+SIqx1q6DWNEnvuoUP0ua99Nk4gYglhBStWU0edc+6
         rYoncXNOZyv+xgT9CbArWyXkPZOjfJdPyN2DV0KuzMIdcOQ0Vy5Tz0HkYUr/AdNO+dV3
         3VKWCFR4QYtVOyA9sMTQsMo7aopjj6Rg9vbJbx8C746nDv/qx6bJ4GlGgMFO8G8AedXH
         6s/yaeZ/niV3x2tWu6FTWt+PWk/Li9y3vPWRON9zlUfhkt3m3WYBldqLgrRGJGynE8gx
         ST5kPHLqlKIWHKwEv4gOZCKzEjiu1JYDr9KLYa6xzxFTAXOvdJWaz6P8SWzWsWA/6eho
         uD4A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Vw0jwPKu;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-2278121f02dsor31066545ad.12.2025.03.23.12.50.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 23 Mar 2025 12:50:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Vw0jwPKu;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742759423; x=1743364223; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p4xRAN0m6ZdO4gtnL2+ABu6HfCfeJ4P1/qPsWE+BDIw=;
        b=Vw0jwPKuEAFXoP+9HJTPlbEJq991HsUHTyQBsyD+T9B4COBHjsRxzchyJVcfLEn0gw
         1gxHypMYbN4lzOLtjDONCnB5JlkljNc22OWWxMLqp1zn1jL8CaxWzLmBFNEpquPJG8MM
         wpemcWo9Sc1JTh479pC38UVcXerLPWDuyYhgOALPmNql0c6XnrHM7MlSTo3e/0uiIXsC
         a2Tf6tMeFO4h/yfszgJLw5GM7VIOsGRYXDcRb1v8NYevtLClDxoksJnsDjpAbHSGfhhw
         YY2kGyV6R/3e43V926X5RTmyZ2+yqHdOeMM21rXik9v895FJZ6kKBKyy1oK871jOpx/e
         0aKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742759423; x=1743364223;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p4xRAN0m6ZdO4gtnL2+ABu6HfCfeJ4P1/qPsWE+BDIw=;
        b=WEOUkBnFGyG3hn9KKPJ5b8udNCdLqA8PA4vsTtnn1287rzogdvPtTcHAgy+XVTsCoe
         zVvVPYs2wiuKrWt9KZYi0MCwyWNBrQWrR6LLOrR0f4xrWMhg8mZYrxpYOCnJrjZZbjyp
         W3QLBJqjhd+koW9Zw67gEpDV9ULVgc70/ATOKlTuFK0RCOKdguO8zuOmHA12S1SajmcZ
         /94a4GeAvhXvu9Sge9Dh6SaU/mRcxGnIG7hmwptJZjmRyXRC+RAmI0HCQ7TOjkpxE6/z
         NoxmwpY9wZxu7NX0FJVm+yRYVPPOerGxSI5RlzdzR8sRMcxy5M+IYr5bzMG6udsHeeck
         njEA==
X-Forwarded-Encrypted: i=1; AJvYcCVH4iUkD18nhYSPdzbM9w4oCjGG9Rsz3tBjC8eW95f9kux9gN1XAFHeu+pjHJ2Pbc9T/t5x+RRkSw70xQ==@linaro.org
X-Gm-Message-State: AOJu0YwdqxthvOMWClf8JmsXxE/MNq3XxwlsPbKi6GYfafH1EXtdbHcd
	f6XRmiXUyfn1EtrfYcLMh++ldK8BvTXTCkSGhooAP//0s4STVXx8nrNE9+XyYl+VhwSz812hKOn
	nEwY=
X-Gm-Gg: ASbGncvN47Orw/a6lDm3/V4nz336/Tv5xmReDh1MT4ZVadg1J1s8laZX0s/RUYMesI7
	9XqcqI0p1trRkVtA4CcmM0i63cAhF7VPWbjljRw+AvAAKKWZy4hUwCGb0uzgstc99BKNqJJO0b0
	9CbbivUuft02I/8kG1MN9qWik5Csd8nKKUeVu0QYrnGTrtEr7je7/86Etj2z6mPK3r+CQlDAdtH
	qOt7GiismY/CjjdFi257r4EjfusiuqrsYbx/cix5xve50QWhR2p1HOR69x4xRqXg8yaUtt6hAbE
	38NMRziMd9woZB1u6BLicGMZ45u62Mg6DPCxhKuWPeV210XxCpcq9iZDnG3LhBmHajnx1kI8uof
	evEXfvW/OIBqUBTvhzso=
X-Google-Smtp-Source: AGHT+IEoiDtt6a1ykboyilBoUshUC/k+wEAxCTAGIoHLpjWxBrvqlCRFeDRuXaIruzZ+uU3zM2Vntg==
X-Received: by 2002:a17:902:dad0:b0:223:f408:c3cf with SMTP id d9443c01a7336-22780d80033mr180962705ad.21.1742759423505;
        Sun, 23 Mar 2025 12:50:23 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-74-48.tukw.qwest.net. [174.21.74.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-227811da32fsm54954315ad.182.2025.03.23.12.50.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Mar 2025 12:50:23 -0700 (PDT)
Message-ID: <2a7a2a78-02cc-4954-85cf-b72f37678f36@linaro.org>
Date: Sun, 23 Mar 2025 12:50:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 28/30] hw/arm/xlnx-zynqmp: prepare compilation unit to
 be common
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
 <20250320223002.2915728-29-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250320223002.2915728-29-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: FdHz32EvbPoJ

On 3/20/25 15:30, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   hw/arm/xlnx-zynqmp.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index d6022ff2d3d..ec2b3a41eda 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -22,9 +22,7 @@
>   #include "hw/intc/arm_gic_common.h"
>   #include "hw/misc/unimp.h"
>   #include "hw/boards.h"
> -#include "system/kvm.h"
>   #include "system/system.h"
> -#include "kvm_arm.h"
>   #include "target/arm/cpu-qom.h"
>   #include "target/arm/gtimer.h"
>   

Is a better description that these headers are unused?

Anyway,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
