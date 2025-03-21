Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp496028njc;
        Fri, 21 Mar 2025 11:02:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUfI8apnHTmJRInrbRc6zeHKXRErOEmJk/T+yua1fmlv3WjA+bQeV+ObLFKdDfWoZ89JRm2uZw6/zjctA==@linaro.org
X-Received: by 2002:a17:902:da8c:b0:21f:988d:5758 with SMTP id d9443c01a7336-22780e0ae4amr60332285ad.35.1742580160205;
        Fri, 21 Mar 2025 11:02:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742580160; cv=none;
        d=google.com; s=arc-20240605;
        b=ArShMp8rWjPx+ebb9AYczClk542iNtdDMI0lsFnmq/OAkFUIzu7OxmEGWS5qKSKvZQ
         zJuIq7MsS7TvLYK2nK/6YuIfIqvPwsJoOJ1F8XBrdyrNMtAntI4/NfhqcqxiQq8KV3Wk
         s60kt/uzEwW4QnkQzisDEl0I404FDyYzKt9cgwOCS9waE09rY+zB17OS/EqgJzpR8TbQ
         bsdULuR/Te5FQ+Pj/KCN5fYN/OGDHfUXLbkOKWio4D44uH8RYqYzuEn3LunoOXhEGF3u
         W0MxGNncqcZgLeJ/nlMjEPI1GFXPq+MqqsY3aCeb2lsIFdiZM+5IwrHqLG0s5Jb1YBI3
         JjhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ZQx1MYwR5XGQhoOob8K5fBrwsUBCr9fmoIlVhl+BMyI=;
        fh=WKpGatdh2bown0tfexQhlm+amwizQKe8DL0PTLslZa8=;
        b=EmELGsELx+6CTmsN/z7qma2GlXhzozCcBYhYa3I69kR80lKIHhC8lXUI7DSZU34p5H
         R2Hq231xHWiXVS4uGbm7rwbvaI3WGDsrR+rt3AqrceHjjaZZqFNuYDZCzfW1wXolqgL5
         Aut2FchY0cgDXmaa39KgvShM6hi3YHiM6wp2hMY2JdcQ5htDPhL9SI/ULdUdQJm/2KZc
         t6G+Br6oRqVwW+bAm6rnWwpUoYS7pLdj3IWc/rRbAncwLDDIchaM5WVX4G53t9DJjjrL
         PweTmHVFqd3CqgwJ2NjPMznZv80BmSewbKdLkdHSK07VgvqZ/gpZbLGd1aF0KimjIP8d
         6G3g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qRrvcUdT;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22780f1cb0csor16753785ad.6.2025.03.21.11.02.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 21 Mar 2025 11:02:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qRrvcUdT;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742580160; x=1743184960; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZQx1MYwR5XGQhoOob8K5fBrwsUBCr9fmoIlVhl+BMyI=;
        b=qRrvcUdTOUBj35jnjEf0uvEme0Ev7p2HvrOkApCu80VSUcuBUE8cnV7dKevWNAufd3
         MUq4AOQI+gDPH9fG9xWuX7U3fdnmG9lYIQcBchDypYLtKroMKDWE/ZUZ3F2Bo/TS5OnF
         Gi/a/tWaXKA2RqjeFdSfEf/m8dhIw8ayu7S9AP4PMaRzd4FJEmKQpATaMI2plnrPkjQY
         NF8bqaFAd/dc6HQv9ABKHKSyMIbYqbzP9e3mmpayT0+D3jkgUWUj0zQYzKN+JZBKfd5u
         vbCnpyXdNUJyNEnqqK8EQMzwa7KqXU7fitISQlpDBIDJK7NywSpdxUEmTETqH7eru6gs
         h2qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742580160; x=1743184960;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZQx1MYwR5XGQhoOob8K5fBrwsUBCr9fmoIlVhl+BMyI=;
        b=ozQpmUbSccq2dcB1wA1LaJZ++6KkIqodX+8TcsPbRqhPchI3Gqj7JcxucIpFR7FooK
         s4IShctcUdAvLKyYIlIWluQOesF0iKMJCqlGeJRfxzz+mjbNATerj7efqtQQZ9B53hn9
         7ZTpAzp81/LJ7HVejKjGAdSc4L6j6lzXsR93IP2jGfRLs5fVKOAH4qKRrrdmSJreyS2q
         e/nt/x3yLBq6DIwjHJRrF8VHtJ3FQWzXAsJ6iGZxpBVIZw6uJOTCBTpDdHrjlOJqk6lr
         37ol7RVF9dyM34qIHWPIgQXL3MRCifKPs57MB0EeP/SuI/neOcv6eKAbOPWyJilhmTip
         Uz2g==
X-Forwarded-Encrypted: i=1; AJvYcCUyXGZsv2LOyrTjeyjf0zK/qbaYhauAd9J9SbiIVHudXacifrkeCOyEid+Th2eauqzjiC4UykPSfZcxAw==@linaro.org
X-Gm-Message-State: AOJu0YzTGU25p3k8aPUicZuZV+/E6vqQTICPsOkJ3yW4ahTXRq0eGqMO
	xOCaR5uOFL9FTrI1VDBQ89TSuRyrFeO1vuGsJR0V2+ZU93+kuC7kprThrAgr8OLlGw==
X-Gm-Gg: ASbGncuvKtFeYkG0UQ2nb6LjS6LeOrMHXNg9l9HEQElXBITIhpUNqn4QrptVZyzbBL/
	lygOCRH92g2oiS5e7K1arpx74hyd4Sp0tX6LY1Wd4b++WiaOY6FAOMeSkmW8X2t1s9v2eXRO71c
	I0ygPblcmgz8dvBXsxSOJZSkIZgpJyOwT2/Bn9zdwmL062VGizHSKnhcJBZMLx0DAE1gOU6MhOc
	EuV2dMzFTObTU9HJgK4niU+vC2Q7n/zRd1WroO2pq1weBA/kd0irrEspveGkdMmHVVNaV8BtG0T
	hlB6GrwUSMVZwoXii+OtZcmOx4ZqK9/9UvmmGC2dXD9X+sQ9g4cl+BmT8dJpOLW+e2xVpwzvSI+
	awk25aV9E
X-Google-Smtp-Source: AGHT+IHeHBnqsyQDfPVC5c6M9WveDyjBqtnNjS+sN49PBUiT/Etyamb3XA0J7Wn3GsZAAWnCbxJzNw==
X-Received: by 2002:a17:903:228c:b0:224:1ec0:8a16 with SMTP id d9443c01a7336-22780d81298mr74015835ad.21.1742580159551;
        Fri, 21 Mar 2025 11:02:39 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-74-48.tukw.qwest.net. [174.21.74.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-227811da561sm20161365ad.185.2025.03.21.11.02.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 11:02:39 -0700 (PDT)
Message-ID: <5d76ef18-f284-443c-b7ec-468246fd2a79@linaro.org>
Date: Fri, 21 Mar 2025 11:02:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/30] exec/cpu-all: remove cpu include
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
 <20250320223002.2915728-15-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250320223002.2915728-15-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: PHGPT7a/93hH

On 3/20/25 15:29, Pierrick Bouvier wrote:
> Now we made sure important defines are included using their direct
> path, we can remove cpu.h from cpu-all.h.
> 
> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
> ---
>   include/exec/cpu-all.h | 2 --
>   accel/tcg/cpu-exec.c   | 1 +
>   2 files changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
