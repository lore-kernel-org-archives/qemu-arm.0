Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp2292611lfa;
        Sat, 5 Jun 2021 15:09:58 -0700 (PDT)
X-Received: by 2002:a63:4d47:: with SMTP id n7mr11490414pgl.82.1622930998083;
        Sat, 05 Jun 2021 15:09:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622930998; cv=none;
        d=google.com; s=arc-20160816;
        b=PhFaREnpCUjlp3IhcLN0lbqu1lKG2MYmZL9LxFUjgGnK6t+3cunhriXKj6lnyh8F1y
         3Tn4kip9TrOcaM/mi/OiqA7+Oi7C32v6lIK3MZdrcAt801SQBE+bAk3SiXiwXbh/njue
         e89rAl3kPRLDr3NrUuT+KMPqLH75QvUoqT05c9YJsGdsQlk3VBsFE3cKhMQmZqoBh0B6
         H0VJuW0CTN/mNZAIxcK8smfbV2pZN0nXHdXiGiN5vEC8uXaWc9SoT6+0nn1iPTCu4Fs/
         +xpzmXroorzzP0RYtWUIuFHLhauOMvarVJeVpTH422+bLPTslHy9XDbeYkItowVmNdnf
         uSNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=FwwkHnr5ceh/eyVGWKBm9xruBzMXRyv6IW6isaYIGYk=;
        b=fWmKhhgDprw2uGjE1V5G4koGKfLXnn56lJxjnkex0OUjcp7D6K1ms57npPqQKv0A7y
         xlBYIVRz7Qt6lX7DsH8X6A6aFrENAb+BQoh5p+FKLx3IkrdcwOPnvGmIoH48cYr6CJWv
         lVhW9UO1NV5ckXB7xFY+D+3yzECzcRE2or0V3JvZYWpxZh/UDJHTanUTqC3kKV30JH87
         VlDRUi3WrwQn658gZhE6/pdqFT67dGwJn8sIyoBb/ln3nPCADUpt07eYRWvgZUKUhc4e
         ihyxamNBXUT5hWEBkL09u2YIag98XbhAaT1+TBt/f/ra4XoA8tfAzpGenYmAELeMle0G
         p+PA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h4zcv9Rk;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x16sor1888610pjq.14.2021.06.05.15.09.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Jun 2021 15:09:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h4zcv9Rk;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=FwwkHnr5ceh/eyVGWKBm9xruBzMXRyv6IW6isaYIGYk=;
        b=h4zcv9RkQeYg3ttjOAtaSmNeqoTW43U7X6CFBFwSRru3KIQzt3eR2V+1K8Y7phHlOi
         G7ettbBUD5oSqITEx/T+qOYNJYhkAKuO3cs3WKYOx14gYaVmttcN1vJ+QO+tMqfQQtyn
         4nLcer//JvKkE+kaWmowVFvIqlmgvBUD5ugIa9wHRpD5xfl/EiMqEzI9h+Y9RT2b+ze7
         IqRjiCJUEVk2Zh+DAmMVIxEYw0W+k9nHfko2I/DWhV4h5tlXZ+w1BS3i4VLb/Y9FDQii
         wjVZQZOEITOaOnZ4Hvjn2RsZQ8Eb3NjEvVNl/lOPorXWpE2bSw9Prttilj8sSRBBrtx+
         XJxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FwwkHnr5ceh/eyVGWKBm9xruBzMXRyv6IW6isaYIGYk=;
        b=ZWV/BQvMPKEENTr8zjh1detvWR88wwngQr0cX6Y5pYO/v1nhZOeeYgXpVV5mPApi8i
         QGKHbG9mCg+FpbcUQ46eebsLmBGfioVQTpqHf1y3GqNJtUPUrXizVfcUP4UhJmk/6skA
         EXAbmI9Bixb4ssYiQzWhUeZiTEY9A+zhzmhhPPErKtLjmMrzWC1XoeQQ7PTfAgh1OsPx
         qT6Dv2YX4MWV78Brv7UOulvqYh3NdZEwGkputAyQtGpxqP3tURuA/yZUm8VZPB6F3UQ/
         TpwIjVXBXLuhQOk139vQD3yq6YB7K6vUs6SaqIU4yR2FK3Oal9FNg+NeSOPHDR5QcJ09
         0OsA==
X-Gm-Message-State: AOAM533edXSI3VItfsaLyZX02LIyQWGeEUVQQUq5UAd80Xw1rB3TqI24
	eIebdZpFtJfYRkEnZMQPfwRpIDj3
X-Google-Smtp-Source: ABdhPJwwLutTOyHrp3+pcNKipi8GRwRsqdoRnJbAi1Y4BGi3jkvIFtE/4VfFBIT31Df6XxrYuVbHIg==
X-Received: by 2002:a17:90b:400c:: with SMTP id ie12mr12253096pjb.107.1622930997655;
        Sat, 05 Jun 2021 15:09:57 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
        by smtp.gmail.com with ESMTPSA id p17sm7899975pjg.54.2021.06.05.15.09.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Jun 2021 15:09:57 -0700 (PDT)
Subject: Re: [PATCH v16 86/99] target/arm: cpu-pauth: change
 arm_cpu_pauth_finalize name and sig
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-87-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <aac4d09c-fa5b-4137-7323-bb01623799ef@linaro.org>
Date: Sat, 5 Jun 2021 15:09:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-87-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: BZMVnzSBZLDH

On 6/4/21 8:52 AM, Alex Bennée wrote:
> From: Claudio Fontana<cfontana@suse.de>
> 
> make arm_cpu_pauth_finalize return a bool,
> and make the name canonical for the module (cpu_pauth_finalize).
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   target/arm/tcg/cpu-pauth.h | 2 +-
>   target/arm/cpu.c           | 3 +--
>   target/arm/tcg/cpu-pauth.c | 5 ++++-
>   3 files changed, 6 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
