Received: by 10.223.197.9 with SMTP id q9csp1125660wrf;
        Fri, 13 Oct 2017 13:49:04 -0700 (PDT)
X-Received: by 10.84.128.15 with SMTP id 15mr2450440pla.232.1507927744643;
        Fri, 13 Oct 2017 13:49:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507927744; cv=none;
        d=google.com; s=arc-20160816;
        b=VaavVapKCTynLw4ghFURmepRT1qKsxUxeaT+eD14tO5A7ArzvNk8LBCPCHBZgCgsNW
         WmXLWDxCTjNPGSejOv/MPPJpedx3HGp3kI5sZ3h75z4H3QKUJ54mJqQTknHyddHHNNUA
         KLQazWDMeRp1IdrPq/yRD/9J2r0UOCfhdWtU1Q9XtZSlwZ2YJYa9j8pS1y2AkM8YzSYv
         Y5gvlX9+4/Wws+s5OyQ3//yYcMYsaunZXuHnMl1FnLKd9A7EOgQGusePsXnc2aHRORsx
         4zgOcMuGa75lb3iuWUSbnNwhhYonNveN3JcIl/pwhpu1hYc2RS7C3BDOtqFKavhfk/ry
         2QKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=us1qI2DBeUEpV31rxxx/4w8m44FDgXlUvfYCZmUYftU=;
        b=uwk8Yajd6KNore3JkboN9tgCscl6DvcztYHbMAGCnWBpNBtvx2rpfUA/zaQoWAXxme
         5TeFGpz2DsGKgOOvdsX1BKpXt9c0DgVwNv0X96bPERK70aEn6zPM12P7HK9PHVk7IMcR
         lvj9na2vtKqgw8Afuzw8Dy7bCLA5vmx6SKd6fBzOag06eFOGSNWiBX63Ms8X55SmfaDM
         uMAp2LuQtaZN9Wnh/YJFAJWKOZM5OCgKFvHRoW+YinkeAooJb4JpcAsX/fxpOSI5hQ+u
         grfGC5QrqeWIk1W/Y23S86dVF0irxyklBjbRnLDh+zwC+hHYduISlLbF3MLrnE+qqe9L
         9NjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CQXykuy2;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c62sor452133pga.47.2017.10.13.13.49.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 13 Oct 2017 13:49:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CQXykuy2;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=us1qI2DBeUEpV31rxxx/4w8m44FDgXlUvfYCZmUYftU=;
        b=CQXykuy2LZryam7LZAzZjN8ScYtlEj7ZduZHr6DEJWGr2nfbVXELFyqniPKZqGYzgr
         4XAjs8fuXQEQNIDU/WgVh1za6Oq0BUNgvARpJbERvU+Qmut7NElyaF7Hgr0Z8TSAa78u
         NV5YDPaiJzlXSQljxB9+XHII3kk4x3ds44nf8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=us1qI2DBeUEpV31rxxx/4w8m44FDgXlUvfYCZmUYftU=;
        b=E6S5CAHeXt+GWnu7qF7glrvf0/N9SrpxFiNNiuUm6JQL/+bYiwAmHIjlIFIU/F8hVr
         2zv1FmSfCh/eFl2oaGEKFPWsON8p6pFSB4dMkgIxM9IrFHI4+7ALbi0XpiHc4qIaF7L+
         BKwKahPQnWA0izRaJtMiXQltSU0y//EbMg8IRNGGQTdymVp0+03pVOq/e9IgItYb690y
         Ez7r9GhKx+uthUg10ffotHY9iNAX0Ix1C7JiWsA+jNo1Wj1UZ5WGH9DVk7N0Vt2202kH
         yg8kUTWToQfPepR7JWfdB0GM0HNNk0d6WqMHs3hbpGcm6cgIE9CPM9PthTOglHDnfa1x
         G2Lw==
X-Gm-Message-State: AMCzsaUUdtyC8CqgfYO5ybGkuGuS0rwXJ/RbpC93n4sLlVeyvP96atXc
	E2FgJA9Zkpjl647CPTf9iPcMd//6
X-Google-Smtp-Source: AOwi7QDbZ55QeE1vCK1wxR/mjvOrhclRjV7CpIPDisA/VajL5fc27yPGrhDdgE3t/bla0WmKEMXuiw==
X-Received: by 10.99.44.208 with SMTP id s199mr2257219pgs.80.1507927744278;
        Fri, 13 Oct 2017 13:49:04 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from bigtime.twiddle.net (97-126-104-76.tukw.qwest.net. [97.126.104.76])
        by smtp.gmail.com with ESMTPSA id z86sm4439036pfk.34.2017.10.13.13.49.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Oct 2017 13:49:03 -0700 (PDT)
Subject: Re: [RFC PATCH 05/30] softfloat: implement propagateFloat16NaN
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20171013162438.32458-1-alex.bennee@linaro.org>
 <20171013162438.32458-6-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <504601ee-33d3-654a-75b7-6c097c9ae6fe@linaro.org>
Date: Fri, 13 Oct 2017 13:49:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171013162438.32458-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: LsQVbpvjVqnI

On 10/13/2017 09:24 AM, Alex Bennée wrote:
> This will be required when expanding the MINMAX() macro for 16
> bit/half-precision operations.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  fpu/softfloat-specialize.h | 43 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
