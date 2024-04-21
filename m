Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp3721026ejd;
        Sun, 21 Apr 2024 09:49:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWEEuXOtSOwcS+FFqDDNgGTnUBpfD3V2AW09R+R1cprqAMT/EqGpUenuztqcqFVZSo/r6nGQB07VOUsPmW1WnULh0LcvAe0
X-Received: by 2002:a17:902:f78b:b0:1e2:1915:2479 with SMTP id q11-20020a170902f78b00b001e219152479mr9949472pln.12.1713718153835;
        Sun, 21 Apr 2024 09:49:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713718153; cv=none;
        d=google.com; s=arc-20160816;
        b=OU3k+gCRjoy7bJbYX9AQJRfqS1tnmQZGyOeq3u1LN4g0JC+rDzkdCXDWMW+OPGlGHj
         2vHvzKHiHySyhi5uCoGj5BbbRrNnz7qT99f2IUV0ANC0Tb/NvdJbiMxQxBDp0sHtJBRo
         gjhNQ4XaQ38/0cwDgMMGHTRKMyKtaxBfmdCk1WxvgMZC/e1NLVPgw4arqHTxMFa7io8P
         VJ5MBX8rWlQIjyQ6mAi89AScZeQ9sdVopzuPrKYq5TVdK4EBVjt7bXl9EvoYoY+IfTTx
         pp0CJFvbzDDQ/Kf3esXcoyKIWb3bS7mkXAfzXrPa7mV3QvwYj8umj7Jt+p0kC7UohA84
         TrIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=/C8hv0IOFd/awOPzjrquTue1IcmbsUX9nXzs73BETrg=;
        fh=Mjrt0ARdEPwkgn4hi/QcBl268dV3ko9/3oXuhMffgZ0=;
        b=cHqc27XfXjQPtHVTCzzopdcgkAffelapAWeD9roxjKbAuA06QYZyieIx56KiMN5KfB
         ptpLQoD2wJpd2IzIMt6t+72yl5I3zR0hce3dXtjET9c+WUrGWqcYXfQsb7lzKZctg3/t
         Hc5gYUN36bc6HUJdIRGsUO9k9l6PYwMgY/jGwOx1jAr/NXOUL495MDy7Qtxf9ojHW2qS
         YOcOIFDqCg06Uv412hAwT56KejA/kIJAVGkxZyYTltUkHyux3R66MffWqdtLhj3IN5Fe
         Xyu66R/Ii6xY+xqA4Y5ZYEWTcj9QHYiIqICFCU0XsvWRqBRsbGk8NLU3hmm2zNvmRnJQ
         3giA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="u/kVFr4J";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e10-20020a170902784a00b001e79bbfe7f3sor7454981pln.6.2024.04.21.09.49.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 21 Apr 2024 09:49:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="u/kVFr4J";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713718153; x=1714322953; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/C8hv0IOFd/awOPzjrquTue1IcmbsUX9nXzs73BETrg=;
        b=u/kVFr4JzJgRG8lMQUdwn0yntjY6fZjkdGd5uWDjv6SesXWvfalcVSJR6JYlEOpt/X
         LjE1+a6GDVrWk5NjK2zHBOdzBh81lgZOnZwbni7gdjw0LsO+XVHeYZWh0y4LwMZ59Znf
         bqIQncd42WBqwXTrpBAkVLG/uf7xzFFergWH+VpiUst2DGpRBeIWpzobps9lY5HlcNxv
         Vu83Qwki0L+a2P2VcQoyrwdnU6uG8qY3kqH1O5uw1ueQXdxNXNx41lqCyubOSy1N+KR+
         rwrvCymzwm5vWp/XDJBTdGeC/ljNNShY8iAyHoSSFu5ecKhVHOMpVhUNNarIgnp4YIE/
         hIaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713718153; x=1714322953;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/C8hv0IOFd/awOPzjrquTue1IcmbsUX9nXzs73BETrg=;
        b=lMEFBXZ9Xj6DUH2DjFbEq1mUDGrZXQ+6tBT9QGoV5oRwczsOL2o9RPRszjjPRAdBCK
         Nvge53fZPnw0uJADM3ht3jLLxt4tvdsWqWoeKFe9LcVzG1df/dpBwhBHeQFejryJkTe3
         pMEpxFRKonJOOpKovLXxX7iOaOgetC0Gx9MMcgHPdBIFSK6ZVq4qqa/vcTIi4R1eyACR
         hrNQJHRblgCaTwFbKt3GkdSbchUMxR58tDm/RX1VWa0pN9hTndOGaGkIcDaDgrCV/bi1
         XS9K7/ZKmZfcw96QYUJhca/YUGcWxqIAz9LfKjldKatjrfuFhUfUv4XAwOHUbO5k6npl
         gVXg==
X-Forwarded-Encrypted: i=1; AJvYcCWAitN/7dPvX1S/1p4OgLM2k+JA6PJnuktIVC9YTleOAIg/Jbjjzw9iXJTdNF/W1a8zz4qxuvcSybtZkemO5IHRvT8LtrXY
X-Gm-Message-State: AOJu0YwDM/18AUIVs/tvl8jQEzg9NGosB0byGOVHy7gzbwKwOsgSQTJb
	4uw+zAXx+aGExcJf5q4buk4gqzeoekLxX9IGDhwj5i5IrSJFf3yF9wKex3IJGgri/w==
X-Google-Smtp-Source: AGHT+IHtYrEaKSQb0pIMA7tUJm/1G4nF1gQ3bdx26rUJeKYeIVxZkY6OmPxhhvIYkAhIe/WUwQYjyg==
X-Received: by 2002:a17:903:32cf:b0:1e2:23b9:eb24 with SMTP id i15-20020a17090332cf00b001e223b9eb24mr9181869plr.33.1713718153276;
        Sun, 21 Apr 2024 09:49:13 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.91.227] ([156.19.246.23])
        by smtp.gmail.com with ESMTPSA id l15-20020a170903120f00b001e45b3539dbsm6523586plh.41.2024.04.21.09.49.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Apr 2024 09:49:12 -0700 (PDT)
Message-ID: <777db3c8-30cc-460d-875d-cf25ab873ca0@linaro.org>
Date: Sun, 21 Apr 2024 09:49:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/24] gdbstub: Avoid including 'cpu.h' in
 'gdbstub/helpers.h'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Anton Johansson <anjo@rev.ng>,
 Michael Rolnik <mrolnik@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20240418192525.97451-1-philmd@linaro.org>
 <20240418192525.97451-20-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240418192525.97451-20-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: +y9nvJYtOnnH

On 4/18/24 12:25, Philippe Mathieu-Daudé wrote:
> We only need the "exec/tswap.h" and "cpu-param.h" headers.
> Only include "cpu.h" in the target gdbstub.c source files.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   include/gdbstub/helpers.h | 3 ++-
>   target/avr/gdbstub.c      | 1 +
>   target/tricore/gdbstub.c  | 1 +
>   3 files changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
