Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp426644njj;
        Thu, 1 May 2025 12:36:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUMc6XpfFQq10//tkN6MPRK7v8eS3+Lqy72dOO160l4fvGSIzOGOUqyeHK0LhSmQptDjeqEa6TjBl6kNA==@linaro.org
X-Received: by 2002:a05:6602:6a8b:b0:85b:3f06:1fd4 with SMTP id ca18e2360f4ac-866b42b19b5mr61376839f.9.1746128167236;
        Thu, 01 May 2025 12:36:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746128167; cv=none;
        d=google.com; s=arc-20240605;
        b=IgVYDLZMvWUX/7ZNrc1s6Hw0heTweckvyDwkMdcz7mT+cj9z/p9QEDOQWa+Oe4CkuM
         5EDGPjAxJsugX3drenzQD6M+A+S1W+8k9j3/37P5VOZkQ7TBUk4fI7A4xdqbCZD53Qet
         HjGOHBSAt0txKAtmJ22u2sHLFayxBcYUPs+maGZqX0Ufv1sB6PCv4ATixtP6d92zkU2t
         e1aTuYnRYR6GRCJ2AV+vsA9Wf819Cafk1HkB0WZ4t+gMdaD8MdGD5S34CYRQQPKAVEwP
         4L3r1rV6bDx8lhvlA92kEKJWLeylo0Ezw3XbjV18nBdPCP3cVSUucOFfO3IdV6W3zJSx
         WB3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=QbG8B4F3h4q3N9mXDivZajjCwAknOK7U7lhDZ++KnKE=;
        fh=IuUJxXFbvveqXjB1wE3phHjLey1dW+W6MjbAKGUdmC8=;
        b=S1ot0VYTvCq/AommrR6AvRjjLS30tbBQxX/cPFaqwvsnKTFxpwiDb3fahC4SytezKD
         DQpofv4PTTMsAF+QNFwCt0QuDpljOjOvncqFlpdfX3p9BqdtXgUvizdZqh9bcQ06Q5Ki
         H+3dYrjzdW/RGElRFuYUr1bdo05T5lbciMEO+G80vTKWb7iLuOBUjdSxHe0Gb1HvNcGO
         ln8o5Ses+RccRfIhKmpXQAmJ7N5oeZGbbgGH9gCI7DIV0tNN0utDVFP3/Lnq0iuuSbUh
         CC/aPrt43cdCOj4em3VurjHfIIQs1NWF+luuJeoTa44u6aVP0Uii8Jx5FgdYNvAFoKd2
         YQ+g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C1a94Jfe;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ca18e2360f4ac-864aa56e93esor90071439f.8.2025.05.01.12.36.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 01 May 2025 12:36:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C1a94Jfe;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746128167; x=1746732967; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QbG8B4F3h4q3N9mXDivZajjCwAknOK7U7lhDZ++KnKE=;
        b=C1a94Jfe+eGdRXg5o4b+0RK/q+lTBJrq+s5KM6q7h+jaVtcg4o83dpJdzWV3wwlzqy
         buVIMnxaGok44og498PiUIskxadPfmnxenuOj0/Ar0U0PtGzOGRK8IwQ3PYgo9Dh9RJ9
         x9OgXNGMsl/8SXAgZBDJ1G0ftWTAVnALkEgZRLqG/zJRgWWHl1Lmc+Nd9a1Dm5q0f37n
         mskdd0GMPiLP4DDiCYXsrpyIcLCNjgRaXaBJ4LaChVRoDVqFhSMLnaA3DQ8HieuSifZo
         dzAU+tTKGnT6u1XeHTnsF/fhN4yP7GCZgLJxR37VupMBX3gJqe/6VMZX7tL2kMBK3/nI
         jruQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746128167; x=1746732967;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QbG8B4F3h4q3N9mXDivZajjCwAknOK7U7lhDZ++KnKE=;
        b=UdP2zLtsGIVAOkkhHA9sE5ufB/p147MLudEAwtSCuAq+iKcv9sYzzK05YHVHdFIVCW
         FZF9JlYcNYACVphfFyt6SSgNt7VhsjCtKSg5qm6NNwYtCCkiQbbkcqurlbm9S0vJxdC3
         nJ6MzVzGceV55aSiuD+tRQ+K2rPfaQy7IGnyeMXnStPs6DHjvsRsq4bk/kms5V0xsOTL
         5euD6tR3opUyVIDJkPLCmNq4T17JDMlszi4EQ++0kWPN7rthUhY7ivgncQaUaD8/jwXD
         0BvzMOIKy4SCIzD18wNn2KfUrxV+Usjp4aa8nRjD1ZZrVw8qoq3K3sHjQRMMHe18Lnhj
         qLrw==
X-Forwarded-Encrypted: i=1; AJvYcCWdRicVr+G8osKeHGmT8mk3e/GOSbDm0xNppLPculcQI9jNrizhF2deRPDttdlqIocKMOpz2eOJjZwvOA==@linaro.org
X-Gm-Message-State: AOJu0YzB7TefqmlmE8gH2+/T+trE1rdT6DQG0urX18+oi/IGf7xP+eVf
	0+2oR27Thv8qs0PmdrIpsmoBo/l07w+Kaj5B7iYvK2OPkOlJDk0uRHbMkIZwOtVw/g==
X-Gm-Gg: ASbGnctbZyvn5kPUW3ajbNl90m2fG/zHhrS/mNa9gHZ52xW6tUxF+SMGzsDPADfdM0x
	Q4gFYoxAu3MW1GCptJSytyENplbkr6x4bZl2uTnCOyGMCzd1E/dAThL5zRSJnsijJigkXet6LsF
	Mk6USZvtqYBu98h0VcuLlARC2txygHrCmSUuZFsBol26B72habRuw29AM1804becNvnYP+fuvbh
	E3an75X+rHdjLuOaYqV9tcWWGEqyu1t0bylJmemRqxmI64yxRh0VAGxtb8+R+4GAokQKaGlaz7E
	U1nShO4eM7iPP0ZY7cm3zWnqXK7kee/8AyVgXzDmsXK8KrSMXEiErLjGmsWYJ513uyoNmhUNspW
	zies9YmStR6MSCQ==
X-Google-Smtp-Source: AGHT+IFmEF1aOJSJyHbAQ0USlKrGSdhTT3r6lXu1PXo7h9NeRF/lMEW1uua1Y3ODC30grn2S/YfQZw==
X-Received: by 2002:a05:6602:276a:b0:864:4aa2:d796 with SMTP id ca18e2360f4ac-8669faecf3amr60612539f.8.1746128166917;
        Thu, 01 May 2025 12:36:06 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.244] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-864aa2ecd8fsm22427839f.12.2025.05.01.12.36.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 12:36:06 -0700 (PDT)
Message-ID: <305ce532-c7d6-41bd-89e8-833613546de3@linaro.org>
Date: Thu, 1 May 2025 21:36:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 33/33] target/arm/kvm-stub: compile file once (system)
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>, anjo@rev.ng, kvm@vger.kernel.org
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
 <20250501062344.2526061-34-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250501062344.2526061-34-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: wHZT+FVg7XO8

On 1/5/25 08:23, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/meson.build | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
