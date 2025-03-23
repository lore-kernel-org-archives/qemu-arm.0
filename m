Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp1562564njc;
        Sun, 23 Mar 2025 12:46:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUk1dxhmfznpG1efQ9xSiz3cK9cZYTtKS/5eai4yXkcgrrz3EHDeXXsSQZ+yLIJX60XYvN6R6Tq7+5UWw==@linaro.org
X-Received: by 2002:a05:6a00:170b:b0:737:6e1f:29da with SMTP id d2e1a72fcca58-73905a3599dmr17766347b3a.21.1742759185836;
        Sun, 23 Mar 2025 12:46:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742759185; cv=none;
        d=google.com; s=arc-20240605;
        b=cnLj80HEHtrbz31HE06oNblzGtv1TFsdjLO082Y+NulrvadlqjtFBxN5UZ5SU78RX+
         Q1HtG5FGVen7fDGBLVXQLpMAb5kcsuoBMLvUBgkGMUIQdkmm2Uw0Xl9j4nbbfOnf7vho
         L/L2sKH7RvUCwvzXTjHJFXox3zAQThsQ6HvXGqnLK6GbeOG56crZIIuf6vCxk24bvMIy
         7PS/GW48Y1lgOvmi13jfKwe94IeVTYG344epL6+iQFZp6tcz4JDllo/7OI0JkDqpO5Fx
         uiYwY7OnQC/6tMBAhmXJhIf43+OjNimzoezoN92y1biMGU9rHHoDdOBjMgkQD3TB0VUh
         vcGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=73JOrMrH0Z6OmECYIAcKVMV0A81i86UDdhTtHjzTSVw=;
        fh=6iA7A10o9leTd1YVnjVOVL94nCrRqOFQTMzBS2Kdd6A=;
        b=iKuNqmLJhLWGjQ//7R2QldJRnhDMnD7x5n279n0B6hluZwvBm4iQc6wz0Gkdd1C/+A
         h5f+d7ioR9lDJNkKwtM+K8Pt30xu58s5UBW9Rkj3eqtSL8z0FdxZASildB/1yBG+viJc
         HXeaCEOrqfUy13MrSuBm2sharEXsuuK3pnJgqtJK+f12Xowfdby3JeisrkGUBmFbWzdk
         Z+gC1wk3q1BQcaSfGvpAmIdxENvwOnyibqgHUb/2xXrfElLVPHA+XlswzlGYDUNcEYRn
         KKWtn/LjgVlZHbBoA4Z1mHOaLp3b6HweKea8ge7iAxy0zJI6Vr9YVfo4raWRlX32n4a4
         mE7w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nKhPa9j9;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7390610225fsor4947349b3a.8.2025.03.23.12.46.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 23 Mar 2025 12:46:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nKhPa9j9;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742759185; x=1743363985; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=73JOrMrH0Z6OmECYIAcKVMV0A81i86UDdhTtHjzTSVw=;
        b=nKhPa9j9PUP9CT86wGqJd4uaImyPl3/yTZZH72kbQ5M71GZAo2rf08bgWBVKXgRIRx
         LVTxJon3WrZqanhcr37yeas6FIoBzmzoftFR30NKuHH2h0HhzYM7EFjyyboaDczehW3Z
         Zq2owq7kbT2ITgQm8+WHQNlhr9IuT8b8f9/00lUwWaEjUAN+V6bDz3mcAtJpQkD4trJq
         W2C/FDAl0rygZZn/fsjXxhveMbMBCb6xQTeVe0LSn6yOEwiQxJy+Xw9McTnYxRkWvU11
         /oLVUgj51ZpOtnifpUZh0atqUO7w75sHkav/X6DfKKL4y/UCymx9621zJqR6A8JQduwh
         wuoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742759185; x=1743363985;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=73JOrMrH0Z6OmECYIAcKVMV0A81i86UDdhTtHjzTSVw=;
        b=Nnrlluf6bOevxwvzbnsCvlITO/VMKQTqb/+f2GM4+8XYbwVJRajscRMS2avphoD3lZ
         ZGS1Oy90I3Vm8/HL7v5BewMwjLBnPCc8zVddgczKdoxE1kmNAQqch60ujHTWYSyRW1Kt
         9r9+nfSvDEoxW/1l9NlPRC/DXB9u2kVmyhpDN77I86X/sekEhig+hftOyNlBdZBHGPwX
         5r7GNLlFUvxHMWJwCkWYHLKUNWcGS54e3DK33jiH4RhdbK+vhw4x1aDG9B1mjieFni/g
         9YC7O8ebTticI6oHHsoCtn/pgGCJnEyPOkhJNh4wIST3oV2zBrUBqu1GrySh90wTcTsb
         YScQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNIWFOgvstcwKvjndRSXRK5ixIpHcQtMCkBPeneRxhFma9Ee9B/Km5M9s2ZpLHcSF58l4XNetCIxiv+A==@linaro.org
X-Gm-Message-State: AOJu0YzYh7wQBsymIAjchirhdWXyWzCl7ei5gEJLQdNG3n6H2ZlKtweB
	M15TB57qWLaynRL8bcdHepHRwfTPINvTb/f4gB5VKp0lH8ULvsCEG2fLuvhidvuEAQ==
X-Gm-Gg: ASbGncttkdPOL38yHqmHgc3N7cLCPVKU4mcQWTVNbaoZqMVFlYeE9Tsml2s/di/xFOd
	qo9TaHao4c4E0tTTI5h6+7E3SxfDGQJlbjHAPyjlOfd7G9VLp0123637BwARIq29/4qtSSIh7+S
	MJy4kGYCQgj/Vs3H4VqG9Y1R6Ek0nKRBXD82FRPmM/4xs28zMcd2I7a67cZbbRWcj6kiEljk2yu
	taI/4ZzgZOPpNmLHGiij0Mu5qNU3ckf+/LBwELAR9HXULrF560oJtiy85sJlLIkPo6sdt3Et5bw
	4m0yQ9olVTT3BG+N1mZM/6dMsRMpkwkULhiDb1OKG4/tjNP3qFYoOneV/oLb/fqKg7Ns75tLzRn
	ZkTYz7i+A
X-Google-Smtp-Source: AGHT+IEXe8eNk0NgU5CdcxMFcebpHj1eWStPLTJQqO2Dczl9u1LAA+GgRQQHbdld1zjwLLMjIng0og==
X-Received: by 2002:a05:6a00:84b:b0:730:95a6:3761 with SMTP id d2e1a72fcca58-73905955da4mr17330953b3a.3.1742759185310;
        Sun, 23 Mar 2025 12:46:25 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-74-48.tukw.qwest.net. [174.21.74.48])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73905faa5d3sm6441657b3a.15.2025.03.23.12.46.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Mar 2025 12:46:24 -0700 (PDT)
Message-ID: <279d069c-8bad-4cf5-b673-1237eabccade@linaro.org>
Date: Sun, 23 Mar 2025 12:46:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 25/30] hw/arm/boot: make compilation unit hw common
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
 <20250320223002.2915728-26-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250320223002.2915728-26-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: gQZLLH+DoNfG

On 3/20/25 15:29, Pierrick Bouvier wrote:
> Now we eliminated poisoned identifiers from headers, this file can now
> be compiled once for all arm targets.
> 
> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
> ---
>   hw/arm/boot.c      | 1 +
>   hw/arm/meson.build | 5 ++++-
>   2 files changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
