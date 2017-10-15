Received: by 10.223.197.9 with SMTP id q9csp2701564wrf;
        Sun, 15 Oct 2017 09:14:46 -0700 (PDT)
X-Received: by 10.84.209.238 with SMTP id y101mr6573369plh.211.1508084086372;
        Sun, 15 Oct 2017 09:14:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508084086; cv=none;
        d=google.com; s=arc-20160816;
        b=OJMXnTpngNwemyus5DBj6PWJ2aul2efzrI1+ua2B5Ja4xFQWaqEyi4qOJ7NUeA7T07
         bj8ddNeAHDBH6eMYqHOfCoVhToXtoMHn/8HpBNCaDrNrJofOcImZJUqx6GSJpYU1mmfJ
         6tHJPumI4WsHNFRRO4pLEZOg/EmMQ48h8XRKlKf2XP/8PUV3RShaQmO9DT1Q7wz3zEqQ
         S+lDV+glPQacU0y8O6mlxZ2NXqmuyS2kYt52gF+6qt/7fNi1w6gpFH/3v7VDUIo+Yl4C
         M23Fyd0xVxNwn/PbTkT3/ZkUiBzvCZgw86UsnmzhTTtLKmSbjR9csPpitvyJaKmYdDz6
         upfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=kQKgsXQQ79AEJ1pF+QuPzq9aZIaYspx7w3CrDX7ycAU=;
        b=g646G55FPXRlueq5HddDabLCM4OUPpRExM3JohNwsoXwc4aBZy+w5yGNB6/WF1abav
         mK2WRtJBYR/zoVjkksAOYkdkCB+soZxNDOtSBifyZXWdj0WV7NAt0uQkFq1Q4WWepKzj
         YmGGcpBTrkzQgRdexvQ4QHrOxy1XB6Vf0TZW59lXgNi/UUzWRdEuyNHOwScdjotaC/fA
         oWw+Zd1HKLKGq6kMhTuj5kd07P+jNBhon4K7YBxW9eqAAHQawGq0EYvzTpNywqOVuLpf
         0zAojuAxyV9pqCuzqHV4iEexayZAXNuPvorx7UuWNghASIayrZ0Kwi8a4lqoKgZjVu1e
         sBwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GS5LUGQl;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d4sor1621006pln.91.2017.10.15.09.14.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 15 Oct 2017 09:14:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GS5LUGQl;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kQKgsXQQ79AEJ1pF+QuPzq9aZIaYspx7w3CrDX7ycAU=;
        b=GS5LUGQliMeYwkGIPEjemiv+avN9V71jnpM/Bwh6wG/zoiMxzFc+UlUdYTyp/RzTbE
         czTOC3EjYEudI7fv0Dci72hsD5A6EyKq3JCeCSLP96z9JYh9pITvhvUUljt3MnOBwyFs
         lt8xXPxQMUA2x2PLhCVhhLQvLGJ9r6tyrMOMI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kQKgsXQQ79AEJ1pF+QuPzq9aZIaYspx7w3CrDX7ycAU=;
        b=YFm3ieqyp4QIDkW6S5rkbsYe3wWl/PSL38MXZUrZrxQTYbz12qtlDT92/PQ2n/Gw9R
         wkQbenoKIWPM2+CZimJc3OtV8Zi9QfSC+rypi0hJABhvW588QIqut+ZcQxZO61mqDuxB
         sePw+xi3IBMtSRgKs56uKkc9XU4PbmZDeuzps18BPE37s94RJSWyp0gxzSRTRZhEKFYz
         ErlV70mlM6j2Ay1MMieUmoAcSk19DqJbI+MlxXn+k7leIvOZ/t+J1awCqxC8djWYSd+Y
         Sflc029NYFpXShjr+j0jRE7ncLSSly38LrLIp/OB7E2wk+odz63n/hKuOusjjaZlGSL1
         mSrw==
X-Gm-Message-State: AMCzsaVUMX7as2OLoI+QW7fYK6x5WPcR2//NZEK19tY6SM+I8a0vgiOT
	jogs4Ka6kV/LcdtvBYmWpf+gi4tezxTzyQ==
X-Google-Smtp-Source: AOwi7QCSOxMT2s7/irfaR3r/zUToXOTzlhplLvmoFC+IYaDzteAh+4VXta71aKdUIfYpZofP7FzAmg==
X-Received: by 10.159.246.12 with SMTP id b12mr6715835pls.380.1508084085869;
        Sun, 15 Oct 2017 09:14:45 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (97-126-104-76.tukw.qwest.net. [97.126.104.76])
        by smtp.gmail.com with ESMTPSA id w9sm10815985pfl.19.2017.10.15.09.14.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 15 Oct 2017 09:14:44 -0700 (PDT)
Subject: Re: [RFC PATCH 10/30] softfloat: improve comments on ARM NaN
 propagation
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20171013162438.32458-1-alex.bennee@linaro.org>
 <20171013162438.32458-11-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0362dbe5-ed7b-067b-18a7-02baab7afff5@linaro.org>
Date: Sun, 15 Oct 2017 09:14:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171013162438.32458-11-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: zEKLHF9Bm+aq

On 10/13/2017 09:24 AM, Alex Bennée wrote:
> Mention the pseudo-code fragment from which this is based and correct
> the spelling of signalling.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  fpu/softfloat-specialize.h | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
