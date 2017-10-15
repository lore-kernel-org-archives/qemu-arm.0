Received: by 10.223.197.9 with SMTP id q9csp2700535wrf;
        Sun, 15 Oct 2017 09:13:11 -0700 (PDT)
X-Received: by 10.99.182.66 with SMTP id v2mr6261191pgt.325.1508083991594;
        Sun, 15 Oct 2017 09:13:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508083991; cv=none;
        d=google.com; s=arc-20160816;
        b=IKkexT7BnBnHxuKNUX2FsvuUvhuzH7gLfZ6tx2i/u6yZ2xjavgXJ9vQLhiy1iawq7a
         mp5tV7KxHKrBA/0AMRqewwZuamiabXFBnsg94EehHXUBIJHjBLqjvCoZ85356WmkSFCl
         aNNTuAvTew+fqaJNAHHQX7fJ9JxFBkOLwAJyeZZ2mA57A7P3qrJGPZvM18XivjJfeUy/
         r3i1uPA04dwnoHUYVm5Iu3E4+pY7l0FNJoUrgEJ+oaTZnbFulC6Mjr6oe8jNzQbsmJyL
         drcUWcXl/XCINSj6vqmNA/xGQsif+FGC2qrT0zfMK3vGiErfTm8GezSTCtfb+klsqTeg
         Ukng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=C2LKHnkZjY8LXIcrtW09uSQQnnkaUQldmy/Hb70rEEc=;
        b=croWuXNmujKd6MIo4/s3MGSOD4g9PfnEZXtsKii1Xfhl8t2Jf611TJ2U/+Z+ot0CIw
         6Kcl2W2+oDl3gUhqyDtIAGVxUo9JX/kztvl7KcdDkuzn/G+rXqvil5JM1W2kM1SpcVc0
         NlNW1CFVAl4FwHUq+NADIPEMh9T3UY76Uc6z9W+LNquh0aIFzjlz6pEGFo8+/G5ojydL
         YsroUUkpkUBzM8USk2yrxPmmJjwoGXDMlIxRUqOZ5A7gGA/jfRWLUVqjdr5GHTQg4g3H
         Nal/usDGMn8OCLwRNcHAKZl3mV6ZVFg+Ficv2AXyjeS0WeyF9Kr0LD3ecBigdeb3fAl3
         sHnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FNcg9SWJ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2sor27016pgc.144.2017.10.15.09.13.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 15 Oct 2017 09:13:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FNcg9SWJ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=C2LKHnkZjY8LXIcrtW09uSQQnnkaUQldmy/Hb70rEEc=;
        b=FNcg9SWJZ+siO5bkn1u9ccei0EJuGpxUMBdnZQBHccyBtQrJqxpoKNd0nxsuhq5hNw
         SwXNAJFwK0KrPGfvTA+1P+dh8LbSxlVdbIokeWRsG/N+dhEhCRalJ9w19olMEzY4SpSN
         ovx/WZdvyKbH4039Fw31d9/KVpvbjtf40cgF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=C2LKHnkZjY8LXIcrtW09uSQQnnkaUQldmy/Hb70rEEc=;
        b=CzN3tdrRdrsi3NWp99ydxk4uD8A5rw+TwUppnQ3szr5/W9CkhNRyW4MQmyWE0b46wk
         719JmZXHhIgSsZ/tAaZ09qayDsGhVJDUz2I7F3vNxDPROu5FY05qg2aDy9H+bcMAfRcM
         e8qgNSsVMxn6YtxCHrkH5Qa9s4uu8UOl72w/mdHdRqFBwa8PRA4oSvQVaRX1DhTNBmxQ
         uJQd5BsB4XO0Z5K8y3zp7RmiURTBiiKLQjLbaf/Mue5B65iszaM1SnaXhjMg+hBnOYIr
         BYb5XjToL19PnfQ7XBuzB/2QdqPUq1Vtv+z56X7Af8T10Z+mZQq7u+zVEoOBWSp/1X0u
         RBZw==
X-Gm-Message-State: AMCzsaVMa9m84SUjGRHZnSX43aFURxQjSS8nR1Hxz1O0iX6wiTyFQOGm
	oBRKv8zgq01g/1lKMRXJnUyo7ZVT
X-Google-Smtp-Source: AOwi7QAZ003OJiYGfa2PMsMAQR8IMcXqwbGLzWG4FpsLhGEWtgimVXZFf4+o88Vtlq3l4kBZSlrp/w==
X-Received: by 10.101.82.8 with SMTP id o8mr6065027pgp.404.1508083991025;
        Sun, 15 Oct 2017 09:13:11 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (97-126-104-76.tukw.qwest.net. [97.126.104.76])
        by smtp.gmail.com with ESMTPSA id d76sm13034707pfk.69.2017.10.15.09.13.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 15 Oct 2017 09:13:09 -0700 (PDT)
Subject: Re: [RFC PATCH 09/30] softfloat: propagate signalling NaNs in MINMAX
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20171013162438.32458-1-alex.bennee@linaro.org>
 <20171013162438.32458-10-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <035e1431-faa8-9c85-168a-6e7dfb377017@linaro.org>
Date: Sun, 15 Oct 2017 09:13:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171013162438.32458-10-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 8w8jKKWyMfUF

On 10/13/2017 09:24 AM, Alex Bennée wrote:
> -            if (float ## s ## _is_quiet_nan(a, status) &&               \
> +            if (float ## s ## _is_signaling_nan(a, status) ||           \
> +                float ## s ## _is_signaling_nan(b, status)) {           \
> +                propagateFloat ## s ## NaN(a, b, status);               \

Missing a return here?


r~
