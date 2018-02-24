Received: by 10.28.71.27 with SMTP id u27csp1220685wma;
        Fri, 23 Feb 2018 16:34:23 -0800 (PST)
X-Received: by 10.101.83.76 with SMTP id w12mr2632066pgr.95.1519432462938;
        Fri, 23 Feb 2018 16:34:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519432462; cv=none;
        d=google.com; s=arc-20160816;
        b=UjJwi9n8KAdx0BvzCTypOjAn8mdhjHD3WRNO4ly2CG3TE/yzwl8DdJzCFE77uJmZNL
         3ts+VXaDhW2ToLIC7GGCMAcZ3YtLlEEnmh67hYNzSMNUB8Z965T1sbOcWCx078cEEi6P
         jxzTc3s75mPRoyroYg/L18aKRapuJTom7V33PFWfUqgBxW2BVk2dqmgjHkal+sCUTjU7
         QRpdNPwNMON/tmT98zkJDzR2UyVvNhOmOeNuHG4fh/N/uI1xRtjIxXfwzGKU4+stboqR
         OcO4qaDFFJYjGADlC/Iwz+9pA4NjEg0BhvXhWoFgRbtDR617ZiDbpHei4Ma9HijJxg5L
         0spg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=UXsPNtKSsZQJZIK8WAj+LAtdr06ZCxyVkXoKbsbiWhQ=;
        b=gFmFwVC9YniVj/dqbHGLI0KKKHnr3TBNdzVOnR/WBc8AS4+wYA0i+RZEEDPJKv9cN1
         IA8GQfJqPIWC+EOCcNUd/Ylf5IWkDrT8wrE/mBlOPdPWymBW7QVvsxzFS7zaw8FtOC20
         myy2WSkOuhCglg8rfMd+W74xFF8pKfM6TNlQoR0d+JypJEftove0eAl7PuRKc1Rmr7wC
         xVu9HXV+8D0EufRueJBJWB1GxgKiAwEwIQ8uVY1IlIc78BHzETJB7y96uCwl52L2/XUb
         xSRAYGb4/o7MrBkxQRHiqvEfyA7S0hvkIPFZuZYJPjZLtIN1EfELWRJA8OdpVZXfYye3
         3tYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ezM6u4om;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v5-v6sor1221616plg.116.2018.02.23.16.34.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 23 Feb 2018 16:34:22 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ezM6u4om;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UXsPNtKSsZQJZIK8WAj+LAtdr06ZCxyVkXoKbsbiWhQ=;
        b=ezM6u4omvBebaGgr3qdbacWQMqAiOaLb2aKYh+84e+gep+OIeJydHmxLpppl8mjt9k
         +wExSM/sPDeim2/iKVLtrC2xE/38KHr4VfHmyVgb5LtAK0KGWYkoOp79IEVakRvbhpUa
         FTyWLZFptmI7jZxwsR2ZfpKTcK3KxjHMBXRJI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UXsPNtKSsZQJZIK8WAj+LAtdr06ZCxyVkXoKbsbiWhQ=;
        b=dN1RuGO61BnaUjfLkC7Y/fZnagMCyVr6A4oYTv04ksKUdxlw0xoEAA8Ve/gqk7R2Ry
         yVS7p8s4Js9heuKFr994DbuU9bPYMB0fY0+8eM0qNf99qGk7AezXv1Fv0hmR1oOPjywP
         HMLNKGtBr3+VAhMh+tnfm9W/I+7HRuOrq1VZ7UpqTBAzgP3ULRA8Nh0X0ouGrxkzln1D
         4iQjev5lAYow2YxCLcnDe6h/tHVxAvE4E0tpWLTiiroLFY7+XkhMHPBjmkH73Qjaag7M
         TsgC8Rw+H90bs3Xjcfi526jNSl36oCS0xiUUEMpWfQNtqwAkJykGZ+Y3s+pF5SR93FJK
         gm5A==
X-Gm-Message-State: APf1xPCqflv5jkYA6ZLCayi1i9v/xJDFDOVOOkrD06lKkuB6+tR+XSbR
	Rcr5kVlNznavDQ0uR/cTaM3Ed7wq
X-Google-Smtp-Source: AH8x227+vv4tfOkrkJQniCelsThkwurNBvqH2LtniybGyXxfTvDAXN5y5C8+Niv3Auc0YBZYueo7GA==
X-Received: by 2002:a17:902:34f:: with SMTP id 73-v6mr3213849pld.55.1519432462464;
        Fri, 23 Feb 2018 16:34:22 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net. [97.113.169.147])
        by smtp.gmail.com with ESMTPSA id 184sm6558109pfg.87.2018.02.23.16.34.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Feb 2018 16:34:21 -0800 (PST)
Subject: Re: [PATCH v3 22/31] arm/helper.c: re-factor recpe and add recepe_f16
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20180223153636.29809-1-alex.bennee@linaro.org>
 <20180223153636.29809-23-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <936e2bf8-e254-20fc-cfba-11fdff64a957@linaro.org>
Date: Fri, 23 Feb 2018 16:34:19 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180223153636.29809-23-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: +VphDi0qwPBq

On 02/23/2018 07:36 AM, Alex Bennée wrote:
> It looks like the ARM ARM has simplified the pseudo code for the
> calculation which is done on a fixed point 9 bit integer maths. So
> while adding f16 we can also clean this up to be a little less heavy
> on the floating point and just return the fractional part and leave
> the calle's to do the final packing of the result.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v3
>   - fix comment 2.0^-16
>   - f16_exp >= 29 (biased)
>   - remove confusing comment about fpst
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
