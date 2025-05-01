Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp412212njj;
        Thu, 1 May 2025 12:06:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVIo467JsMLynQcrAbmgqNME+9TRaJuzmMYueMpzOPHzEj6b62D7PpckseGNm/YNujML1NdGPZ9eszdDg==@linaro.org
X-Received: by 2002:a92:c242:0:b0:3a7:820c:180a with SMTP id e9e14a558f8ab-3d97c2604afmr454325ab.19.1746126416026;
        Thu, 01 May 2025 12:06:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746126416; cv=none;
        d=google.com; s=arc-20240605;
        b=SGmssz2xg3wQFCMjZqFb/M+iFVp623HAo5CBZiDGEwouIczkX6ZRfLTtTEtbs/LiAW
         MaPHgoJkUa/KRcJ9Clw9wNOwdThfzIrx34S4/ad5jBdLThP4wCLZCFFPsW55J/YIkiUp
         RL162UtXnZp7qyZDYdfmK5T5fGBbZB06nIQUQ/v59Th2OcSJ3dXadTKGC87F3B2ebV/F
         uqR14GYhEMYXGCiwjd1PxqJ5OeFKWNBmBbQ7mcdq/g5MIVvkyrzPNwQLsJ+0o3IKOGHb
         iBqo9dcsdDJrXxHCsNeG2Hvns71EYOrh87AacmbaCTyLFGBoe9qS/Fh+oO9XSvEAKEiZ
         JBgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=6Pr0ZTtrxxWlbqRuc7hGMdv9IMHjrV4fkbELicrr/5Y=;
        fh=bx9mSkO3ZhjIXEK5CKaLEWM6zAtDTiYrCDFLv0XdFGg=;
        b=ElKsX14q7rT6+9d5NmRNiSbQ+QSHxNdmIZTQjBmAET3yMx7jP23hYTjrWVvIExO0/L
         TLseX7QGk+4LKMRnu5lCH2Yix0H/W1ixrnvcylgO86TejoSZu/ase+Pd6wyomWwgLzvd
         IFlcw90wgkIwY1Ym2Hblr9aqfAloE6oYbVkVQuKH8nKjtjELKGMfp1lgTw8k9gQlYWK9
         kk+yFuTIfF9gmnD0JsjGWQLlN80L5/aCVfGBYci0a15CZPJz2oMBw+9P4w4PicPyVQZL
         oXdPjg7/BCUTss5C7Ok0CBGQg1YEL57L5mQYV6osEWDwHe4PTm0wMJQ+vyiuKFxateCa
         Uj/w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UmXLyipT;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e9e14a558f8ab-3d975e99220sor5831685ab.6.2025.05.01.12.06.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 01 May 2025 12:06:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UmXLyipT;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746126415; x=1746731215; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6Pr0ZTtrxxWlbqRuc7hGMdv9IMHjrV4fkbELicrr/5Y=;
        b=UmXLyipTH7AYnnrqQJEJKNz0XLuulJBSDNftZRt3cdml0hQb4okD5ukqXfLZPi2A/z
         MnK0lMdHgjuAmrPhsGnsk8rmuE9pSTnPKs/uikwQGbk5t/pZRzv9RWYsB8JYX76sMvJW
         H/EobLQvGMJ1azWvr3Ud9qbv3Qodtb6vGghpnDKI/PO53Y0bsdDXxx46JA6L1MLqQuiw
         rPKb5eK992Rax4lNWbZmZGcH6OjVkHXzu2x4tDt3QI4hEetFsfo9FntMtvl6a8QGl//y
         NDVY9+BFV8qe9W3GDC3pWTUi3MbcPBnCD221iBsywq28DlQoTH7bhWYdhBtvOnKtgJiZ
         bGcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746126415; x=1746731215;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6Pr0ZTtrxxWlbqRuc7hGMdv9IMHjrV4fkbELicrr/5Y=;
        b=OaiiVa4ADl2v3Y0kiqu7GBMYOsqjvcM4YyIIHEnVagTz9xOXwVa71/hyv+ACyO4kWD
         ySSGebpF1QM8EyfFfdAL8fYwAgl5A/2OIMAbRJipTscnPIMAJtVhxN/hSLbLvZyzHbDd
         5vWN610sWb9wy89FvzF++c+BKjkNaSlj5gp6pprl3056lQJDXfmOfACgmA0rD664t+Iw
         wmAxP3SoA6gHCaAOwJ6yjBzvWriBJCnexcoL8PMKQhZ3Ua9qdUWn7cBIjRWUW5tI9C0l
         xmbnXwgAWvAzpX6K4cAkPqL70qprgyU3n4H3kchWEbHVfXQ5ryXBvsbBzw/l/LFJFtV6
         kO7g==
X-Forwarded-Encrypted: i=1; AJvYcCWgw2NYt+/7UWgSTTI/QH/OD1s1Cp7ZnRBE1yZi6pjPiXJQKqPrCGppFCqhQbpiIkHhikvzunx0jYx2Zg==@linaro.org
X-Gm-Message-State: AOJu0YwtwMUkcqUqzkXdzOj6RGyo1k4J2DXPT998WS7NzmI77BI8VrFV
	RH1agJEqAoZWhMqei3Z7bYNF+wDV39If4R7HCJxE6ENn+Y15ptOIkBQZECM33bijyA==
X-Gm-Gg: ASbGncvIsgrLuol/t1B2fZntNcdxb+w+ixzlcgf4A59mdgHGTnKIQy+6HiR8MO5FDfp
	gMX4ELzh5D8clWQzoFexvwfjsFbJDu5mf/rRuQM3kUuiJBkpprGtX+GqVVxyv/hLVQrvQBb3ar3
	IlmM+zmWKV/aSh9pPYoLzEj4xPzslG5Cp2ZE3HUF5/8UWkQaK3JdmhatfOIlrh+n0EqdH5iX5RL
	v6vW2u0lcXkyaDPZOvg0r6T/IfqoY4dNsPeyT2po893LeurZdIdTG9E7keHRyAgN52ceoa3DB+M
	NkgpI0O/aIyXx2QrQvpjeySPpFqMdtck3n46HdEpZQ6Ce05aqLShBw4fcOFKQVgN1uPEwXzsa80
	QAp9aslQx/dKeyw==
X-Google-Smtp-Source: AGHT+IFWe47sTKQaDKHadNBexo5LU2njaufHJh/pzZ8fp/gyYC1c73rGYd7uWAJ2tQ0v6YOC57URfA==
X-Received: by 2002:a05:6e02:1fef:b0:3d9:64e7:959f with SMTP id e9e14a558f8ab-3d97c2607demr498335ab.21.1746126415659;
        Thu, 01 May 2025 12:06:55 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.244] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f88aa5896asm355173.86.2025.05.01.12.06.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 12:06:55 -0700 (PDT)
Message-ID: <39751e9c-ab4c-4daf-bbb0-d9ed01943370@linaro.org>
Date: Thu, 1 May 2025 21:06:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/33] target/arm/cpu: remove TARGET_AARCH64 in
 arm_cpu_finalize_features
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>, anjo@rev.ng, kvm@vger.kernel.org
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
 <20250501062344.2526061-11-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250501062344.2526061-11-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: GHBryfRfEhQo

On 1/5/25 08:23, Pierrick Bouvier wrote:
> Need to stub cpu64 finalize functions.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/cpu.c         |  2 --
>   target/arm/cpu32-stubs.c | 26 ++++++++++++++++++++++++++
>   target/arm/meson.build   | 11 +++++++----
>   3 files changed, 33 insertions(+), 6 deletions(-)
>   create mode 100644 target/arm/cpu32-stubs.c

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
