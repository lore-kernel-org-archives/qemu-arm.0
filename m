Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp3159160njj;
        Tue, 6 May 2025 07:29:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV2eRIQnfiraT92fUqSC/gpVly8aPKmndfFQlw+xV/j3lWozcGLqANZu2PzhS/IUo+K9xZnVoTz5dUoAA==@linaro.org
X-Received: by 2002:a17:90b:1e4b:b0:2ff:4a8d:74f8 with SMTP id 98e67ed59e1d1-30a7dabd631mr4055768a91.6.1746541767516;
        Tue, 06 May 2025 07:29:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746541767; cv=none;
        d=google.com; s=arc-20240605;
        b=gSo1kZ7cSgA/hMeAdvgKy+1KtemJwSOnDRUla+kT55NpG8oAeObtAzS4tyg4u5Zo8o
         OqHLxxQGMs/G2lmGR7aI8r9fLsQwBAxa4wq7U57zxiX297VSBguz6IU+G6p8XquZwZQn
         ElrfunAQcV3/N9MK6l95Yccy0Cucm6knxGFlCZgR+/TfHy25LL6rGnOGpQcAEmCP5IM/
         aUvWqP7/i4ISQO2KfFtm9eZoPwybiOBFJRcWxYvRngPflMC0qP1JG0mKY1z4BrWrrJ70
         ZuD9jqLYKAy1lpQ7L4QyihaBGdB/oCW/Uth2Q1BeJOKfn2PIiHYf1gCcR+kW0jzYH4UW
         5+LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=+xINvCp1yuSIZKDy1B49HDPT1i1nZ7m9pEHLuJnqbng=;
        fh=A56wnuxJx2vDT7okM82nY2XeWfjl0SOd9uHp9+x+Jo4=;
        b=GJ2J/PsbX/2lYd0aYfZbtHaproJNd+zN89OJsGYDf+hLmK7XRq3SjM3RWCSuChNRok
         H2AYJktR2l/rGfsGTqIKoqHNAUJYmvsnKN6MuJ2EjZMg9BCnsfR+iyKib0ArHkEGquIT
         /K+hYVtpibq4z5TUvluisej2cQ+pamRZhLbVChWSe03mpx41NAIlaCAwzOhgRS/ItAbe
         bi4xhyMO5BCttESu9oVsGUY0TwvtPfza6wiIsoXG81m7i438pQTCOzdkwuiufsPJjtUN
         9FySgoxmLXUHip0AVXNKhhPy7r4oNsuA8JTK0JPCf4cwILQX0XwX6EFA4Mw2ijRSnZUk
         Ie4A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n2w1efzm;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-30a475deac4sor6773944a91.4.2025.05.06.07.29.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 06 May 2025 07:29:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n2w1efzm;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746541767; x=1747146567; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+xINvCp1yuSIZKDy1B49HDPT1i1nZ7m9pEHLuJnqbng=;
        b=n2w1efzmD45GF4C7GX0Qk7ltMkxjj5iuHfsdhONJttwuh3fWgr/nKVylxP2MV+e8h0
         PiajArr9ZXtcwayf7EO0+M4gq1Htsspag9sKy2dziKiT1x6duAI03/KoNxTia1sxE3yd
         yFBMRub1FvGgbJ0xaKbGM5hOmyG7zeF3VKkH2nFewm9A5v3bz3p0Qla8GCH8Mw4hdh3T
         nt5MTkQYoMAATFRfV3xAyBjB7ULp1IahisOdSgi5Na533+tMn43e5jhOi58G0GjyaLZx
         dDQyy/agefKR/PlN9BhhxBTTFXHqJPWV/uFrcwoZ0gHcopsMKwn337PIjwCgsubg9/sC
         iLOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746541767; x=1747146567;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+xINvCp1yuSIZKDy1B49HDPT1i1nZ7m9pEHLuJnqbng=;
        b=ObnEbNj9duc61JZ//sYHt2imvLrmwp/jJOQy5eX8XEsp9qhV/By3RslJdWMsifI2GM
         ZRo6H2AebHJ7GBMVWwJI4MPrFM/CldEWtUp7kRNRdcAhFg8F5OTPnP0q0wDR5rh0NgLa
         x9srb3DAT1dYcHvApVZH8Rv4z0/QIpOr/PzjDPqPpLAhghyse+FMP+JwjIVGrV9/7NvD
         9gJ41oKEDu8d7GxpL+brP0k63NYTAjboqAbeMD+mQ+CURduRxhhCI4zYq2yfK7ocxz/A
         313eH0JbXlQJOO+zdELhtTASBU6AUNfDzys7ajBUu9auNm1XFxkflc/BF//ViX1KHOfp
         VvzA==
X-Forwarded-Encrypted: i=1; AJvYcCUXR695THRV9lJEpSXKAGHqUkQvI87v0HDWeZ2a87bQyyEbc2WXw2kgsV3CTXor2aVD+4+920hLkZm7rw==@linaro.org
X-Gm-Message-State: AOJu0Yznml/OQI028Ndp6PERpsVcDvRyOkViwhuThe6WJRzun49oRO0T
	HTuFL6dVepT2KzRqb50VNGUvweyjPZLWDgmZtQakgk+ScEcL9hrno9BnOhqMu7fpCw==
X-Gm-Gg: ASbGncvwZOtFhh1mzXeaE131fZYaIOXLI/2YFV6rcEGlBieCq7MXUq86AoDealYZY00
	IT/NJtMLbFBJF2XddVxV3Ucg57H4ryEcOSApSRPwEAwZaGD7z2qjhbzPAlJFbYf+XpRF6IL9UUH
	giEATOXhk7uYu/fmxWBRh1YNLyTQpj3VTaptvSEApEh0/FI1xAqOGX2eLWzP5tf3KqKJmbV/lbb
	YRlO7gzKn8P4vrdOsPpgqrKZxT71zpnFb7M/lzNuefnL8pWUKqeOfi6FZvR1W0vambcUR9AxLfO
	0UWvRXXUromGcDwpx3PNs8o38JGoS/awIK//CSOjxVa2LF4er5UAI6wIXPed5zpe64XfwIpbX4V
	c9a9Z4GdNkXCgfqmu+g==
X-Google-Smtp-Source: AGHT+IEDUi/EnB86qhU+JzPrafWvDcjWRRJ/9Iulngyz+jMQjHs0VsEnY8G6lGAoNiN5TVAYA9PJ9Q==
X-Received: by 2002:a17:90b:2f10:b0:2ff:4e90:3c55 with SMTP id 98e67ed59e1d1-30a7f32ccc5mr4172774a91.27.1746541767000;
        Tue, 06 May 2025 07:29:27 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a892edbe0sm940979a91.1.2025.05.06.07.29.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 07:29:26 -0700 (PDT)
Message-ID: <c374415e-8c32-4ad9-b003-aa9064bc239a@linaro.org>
Date: Tue, 6 May 2025 07:29:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 50/50] target/arm/tcg/vfp_helper: compile file twice
 (system, user)
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: anjo@rev.ng, Peter Maydell <peter.maydell@linaro.org>,
 alex.bennee@linaro.org, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org
References: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
 <20250505232015.130990-51-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250505232015.130990-51-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: uYMgNh+xkUC1

On 5/5/25 16:20, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
> ---
>   target/arm/tcg/vfp_helper.c | 4 +++-
>   target/arm/tcg/meson.build  | 3 ++-
>   2 files changed, 5 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
