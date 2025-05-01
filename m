Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp278509njj;
        Thu, 1 May 2025 08:22:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXxXjAJsaK1MZPysek0mCBQuwKp6Kua46jnXjVr0KF2nPdJ3XXBdDLHeR2Tl+lDjGYdYT9van3OynaHFg==@linaro.org
X-Received: by 2002:a05:6a00:1947:b0:73e:96f:d4c1 with SMTP id d2e1a72fcca58-740477a909fmr4562728b3a.13.1746112971612;
        Thu, 01 May 2025 08:22:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746112971; cv=none;
        d=google.com; s=arc-20240605;
        b=gEqNlqF6sLmE+VIUpUR0RlsyFiWIbFWHoj6+AReWitRTKLAPZNnPZ6hnTxQNJcLxOx
         qx0mWcE7/YW2PJlndiMZ61Dr7QVnXxYep9laF3ocvnv+F4UVSnwHasuIzGvo3cgCGXxH
         7D5u8HMLEFixZRkatXsBRmQa7A5wLA8WA9A9G3WHuKBBAA/L+vsyl9XikfXQIbyT9aP8
         +eonIQxaX0x3cz/fCHPNjCSkcxMErvkzlAEyWNljQZ2+xi21CrdEKervcZbXwRQrDBPI
         Pvl/Jj6lRgdOPsU9tl82R4ZH4T6waUQsqV0arJutDXiDZxcPIddq2P/Y3CqDQYTofYNI
         DJrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=VNk59ZUe6VB2+qVVwcJX9X+M3hgSClHFSRBg0Eem0Gs=;
        fh=GZ3nbuNH18aihsxscQy5+B/OkfV5wVenzRRy1W4TtS0=;
        b=lTZoHjHIdBBR26NL5LGhJpcHCwDEonkkd0SzO3Qid1aYCKo04aOIkrrNIJIZiXRiaF
         BgAqGtDcQRQOQKZbD0nEwPUgUu4GGP0ESaw6sWiMckG916QkY6kRAjcHqGs4QcybBjSL
         QGABbZyntwNkYfdxjwSpLwP35rsMGcqtkxwVND06H7rmExU9f5/EiL6TQpQ+Z2p6epk0
         hy8lypqCwFQvmMn8ZMMSXr3UJ+NMt2f2A5UqZ1akrEFUJH5P04meHyWiaFs4ZNhraAma
         JKHhAKUP7H6A7vSbYiOFvaI9XjZKAew5wQkGmYnia43h9zxdhTrcfEvOdSafM2QcNXXg
         JAmw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZgIj7Vw3;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404ef17ccdsor623184b3a.4.2025.05.01.08.22.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 01 May 2025 08:22:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZgIj7Vw3;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746112971; x=1746717771; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VNk59ZUe6VB2+qVVwcJX9X+M3hgSClHFSRBg0Eem0Gs=;
        b=ZgIj7Vw3dLmmV1YpdIeIgYJJFcQCgMeNb/T1Gif80yifWaf66bODwBXghHPpfsOAqk
         FSQIprYPgreEuREz+CQVtp7rL6nZkqfvxCz2vogkEuFw9gVJriTIhnkO9KwDWFPcIObx
         t2raEo/1aAGLY26ifQKmP3FusdDMDgasjqHmwyOaZWC8qV04pSanAGlAoV8IE5dgMrpF
         OSPrXJuwEAKmUjxJF1ES/q1bGTjmy32/NllDrZg77JsWL1zxIzmgrJDd5qBV1ObEEL8t
         rRCsbnAAn+wQA+SkIQ4/dxB5w2F+9mrv9s2uurFVDE3zpBuAXhCrnwzSac6rGgeo0Lc6
         E7ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746112971; x=1746717771;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VNk59ZUe6VB2+qVVwcJX9X+M3hgSClHFSRBg0Eem0Gs=;
        b=pMy0NuRGmyqGy2M2ykeNT+3M5eOBNswCMOUkf+ZgpU+IpsYl9VJIMmWKWdMIEjDciy
         qJmslBs9CECA+5zDFdEGqQbe5oRVvaDFXIFnAPy4TD+fOUxNXl5zrUaRXi5jK+1JqwDN
         GsRgnhxB86KKWSDHMbQZb/hea4L2KyYjjZu+m+x5o1wIkgRtAUFUDktioK/cigDZethG
         OJnF9VxPKIp0IVpWzmj7julbpq0rRUyseJnQWuHD2GWmtMKBtPRIyCCJ6oOVq9d1DwKJ
         2ASF2HiVWzLXZQrbqrwSZUfZgjGvy/y75SGWxA5AMCiQT9SjzfUWScPpaL+2bDHQz7T8
         As9g==
X-Forwarded-Encrypted: i=1; AJvYcCWxsgyqBC5ZlunNSCZXeh6PV6ZZYKNiJ+6G4HyxJtHYnabZrCzBj6j0QiceobFCmhtMd5huHz+3XlJ1WA==@linaro.org
X-Gm-Message-State: AOJu0YzdRx46oTD9aJwn9DgDo11EYqvxTx9/u0HAzwZP5aSBlgf6Vs1p
	aR26z+OlTKGQK3y1XemSc+h0odEl3NagBZy0NP9Nrg0fYuVPtgE/DNAUdxM4WPxiuw==
X-Gm-Gg: ASbGncuqS6TtAbzeWZJIZbc8S69UQ1cA0VUlcoqGEmti/w61Bw2Nw4fRLtsDacnE865
	XLnKuSz0fz96D9x6WyYpnW/caQDOUbdfkeltKChnRSaFXDKCqZiuFJ3Y5exaJUemfYXRkWo0T9Y
	+f94sAJr5H1spAAnUOEG041732Oem4e1KvCHJwfKGjrAliUEbL7qwtaiKjFlgQCzw7zWcr3Ztse
	gGCadT3fdzIpvPsrX1iZ7wAsdGbWhoqrfaJ5NpIfoT1iKqihe6vHg6K8LxFbi+nlRp7C5INu7Dv
	JT95dIoy8fp9DAD2kipHOXIAjR4FKKOxBXMu6rnZ/Ye8PwBT9I91sGEnw94v2tyPfuynH/ml8wg
	c9PPvhdw=
X-Google-Smtp-Source: AGHT+IHEkKsYHijqlvDmsJkdkB7qRhJgVhFklXe714vjVtUTqiyTUvUoNgHymuMuN/rnrtL7UgPMCQ==
X-Received: by 2002:a05:6a00:124a:b0:736:57cb:f2b6 with SMTP id d2e1a72fcca58-740477a8d24mr4786306b3a.12.1746112971170;
        Thu, 01 May 2025 08:22:51 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7404eeb194dsm928712b3a.21.2025.05.01.08.22.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 08:22:50 -0700 (PDT)
Message-ID: <aa169d85-c34b-48a7-98c3-cb44a31c878b@linaro.org>
Date: Thu, 1 May 2025 08:22:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 24/33] target/arm/vfp_fpscr: compile file twice (user,
 system)
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org, Paolo Bonzini <pbonzini@redhat.com>, anjo@rev.ng,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 kvm@vger.kernel.org
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
 <20250501062344.2526061-25-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250501062344.2526061-25-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: vGk2VnMvTiXe

On 4/30/25 23:23, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
> ---
>   target/arm/meson.build | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
