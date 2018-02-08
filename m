Received: by 10.28.71.27 with SMTP id u27csp2528972wma;
        Thu, 8 Feb 2018 12:48:19 -0800 (PST)
X-Received: by 10.36.60.203 with SMTP id m194mr609767ita.96.1518122899075;
        Thu, 08 Feb 2018 12:48:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518122899; cv=none;
        d=google.com; s=arc-20160816;
        b=zkp6LmtLNqYULV24vD2E4QRKT4oiDvDnerIiB857UmsgTkJBFGXjRC4/tVhIdsIPLE
         wnKsFX5cmxdy1OFD2eqGqfvQMMCXpRBaGRcamoms3L7Iw6oDWh7fzseAyRFKnNQUtruR
         +MVteUegTgwAwVev2vTQ1bbCcC53I2xmmwJuKBUDrq0d505oNGeacPGo7A4wK1Cx14VT
         zl5j6RxCIk3fxc52QVRYe9uCvIvvkIdtNjQtZLjiTsLWA3Jet/wvXXIUtGs8pnP2xwD5
         75phOZk/JnX+tfReEngaN6RBkKotFkXDSidxT+Oh5P4KJRZ2ZR7p7vV5FSVcG+2xYDz0
         e0Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=dxUhsITfWXdLjsMWTFSlTe0GUm3N8d8gW3ZOYrzIrvs=;
        b=hDQWRnq5IDmTWppDc8koZrBCuriTgPGAeFByFWabJZusOq2C7ixGcLC1uzvV9eG0wl
         krxf2raRdxkSaJNq+3BW9MU2WfHGSQKT7o0soTYIRzTudN6xUiWhAS6HelO87SzZT9Pl
         Ze6K+jx9DturZc1IimE30dJAXj7Y6IdfIquqTBOOzWidf+mujwPY+p5AnXCrN/NqvkbC
         ideith093adaTATCYxVd0bHwoV+E4UqPU56eGGkJsOUDmu0CNrIBU8xbcY9L4pV6qabn
         +0boMu/rjdmLH/IxJ+/4Jh+99MzQghhYPhbFCCkQ4D31DeOAQIRJRxGYizcbnvbHT3sn
         9yQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eb9of8Wi;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m74sor406401itb.126.2018.02.08.12.48.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 08 Feb 2018 12:48:19 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eb9of8Wi;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=dxUhsITfWXdLjsMWTFSlTe0GUm3N8d8gW3ZOYrzIrvs=;
        b=eb9of8WibDx9stjHpJJ2x4+QgOfWoaM7Ek6IkXkrKBlSY1YjK7stV9TZ0p/B0fwfr/
         eTPGrrz4pRYaaOxVCLy8xw/iaXRJLZBqt+KmLNum8iiuLWbSGiksOmkvyxllqtxLXTsD
         0cJjIW7oZbD+62Ky5JShYqTfoplZAfIeVPvNg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dxUhsITfWXdLjsMWTFSlTe0GUm3N8d8gW3ZOYrzIrvs=;
        b=t7APiD3xuQwjEWuqmOsYkvFyHGGt37YJcQuGFoNQWlXIWNnM6JWIQMb8voRqEDQgbl
         8Wzgnn4xHmxnf+8Vq1eGKD7SCaZ02TyOkHeMURSX6K6LULp2oActqeukcOmJPBvKWhnT
         yKPG5R6e8LkPlrozP4p6DI7gtUtD+Rbbxda4CJIp4fBIVZ7oTUCh0a3bba6ddo5Jfu/z
         VrGwhIFAGzjVx9n7NpHfsMXNvzxPAGIcdyjrAFohwoZzsdFJXlxUzUpoyWFYgkqSNb1y
         BMqNwYtKb/JKG1CV0liFt3eHf/wH7ILNj8NPB1UhJwpx4dg8VxzXkzoOR47B9rPmeleu
         A1GA==
X-Gm-Message-State: APf1xPC4ffbzpWO5KcAHk7Lg+8MiPETN2f7jgqXOD6BSMdgrJTFv7GZG
	QPqmRLBLppmkg8ePPG73gZmaRvuq
X-Google-Smtp-Source: AH8x225MoPrS8iGwdml3lIvqtUMI1v28sFETqup2s8Bz4/WgBGM0kN398bm2UZWTJ+4952w1D6/jBQ==
X-Received: by 10.36.207.67 with SMTP id y64mr631714itf.39.1518122898614;
        Thu, 08 Feb 2018 12:48:18 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (174-21-6-47.tukw.qwest.net. [174.21.6.47])
        by smtp.gmail.com with ESMTPSA id i17sm585346ioi.58.2018.02.08.12.48.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Feb 2018 12:48:17 -0800 (PST)
Subject: Re: [Qemu-devel] [PATCH v2 09/32] arm/translate-a64: initial decode
 for simd_three_reg_same_fp16
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20180208173157.24705-1-alex.bennee@linaro.org>
 <20180208173157.24705-10-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <259f8a58-a0ef-c414-464c-4ea504f581f1@linaro.org>
Date: Thu, 8 Feb 2018 12:48:15 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180208173157.24705-10-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 87b0CY/MlX42

On 02/08/2018 09:31 AM, Alex Bennée wrote:
> This is the initial decode skeleton for the Advanced SIMD three same
> instruction group.
> 
> The fprintf is purely to aid debugging as the additional instructions
> are added. It will be removed once the group is complete.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  target/arm/translate-a64.c | 77 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 77 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
