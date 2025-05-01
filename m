Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp421851njj;
        Thu, 1 May 2025 12:26:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU134Lk3upxOMjp4JrwMqSiBcfUb6o+Ezxxm61W1FEzeHSI9kdviHRRRWtb3v4259PRw3nUzSClo6Z8IA==@linaro.org
X-Received: by 2002:a92:cdaa:0:b0:3d6:d18b:868c with SMTP id e9e14a558f8ab-3d97c1a6d15mr1467245ab.10.1746127573505;
        Thu, 01 May 2025 12:26:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746127573; cv=none;
        d=google.com; s=arc-20240605;
        b=W31KNx0QXKEzZ6nlQ+YGLzEIk6zZuOTy2OaPgfjweezOYuUU6UeVsEZiOgcJ1RJcP6
         aSqKN4sQJAvpnBI8q7V7aVB1vgW10mAx4xHHyaSKHdhiAGR8Q1WAdlWwRTudc5aTAU+Z
         C8mkvnFWt73LnvSio/Ld9OtBwDv8P8A8CcL7Ey4xX0zmg7VP+/4Y2OxQfiC14EZzKT68
         mNIixiU98Lvezut15mJhumFjUXugCV/eNoVgP04P6R5a+FewG1/s8yy53rCE2YqE1HyE
         C4/RpAcmI6qjTkBxVIq5+XDJcVgoxk5/Yf9ts2OlwO0NYosyZIMcfDLnQWazrFGx7o1D
         atwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=mOEvc0SSn4n4LmFVDeAobZ/gyH4Gzc1mitFhkjq5Fbs=;
        fh=pN6qRBPOFXLrp+6NO2uv4LvXb3xixODCMhtScG95Lc4=;
        b=Gl2ib8GR2goDsh6p8TiEZZY0YHweER+dntoLtVkki/Gv9G6eCbRwGs2fd3iVs339Ep
         Mb/I2dhs17FCqMzG252kAv5BOsdtrQsmus7Z0nWKwu76zUiJ/E4C5UFBRog2Pdgm208f
         zEURdiJOIwJ3lAuxbL1TqGC/8YxvE7QkiXk6mXiZLjtCG92N7749//DCLSeYLfPg9qEI
         5iZsf5Gh8FWP8EtYcJxxSukG84Xs8MfbexIZgt5vECF766VisI3EhFbGv7y3OjN4IYHB
         S40eIhG36ui1r9CpbOwhA9FLi2ljr+WNJ2Wh5ulFWGruKn7vfmSfIFrx1HbuOukNHifr
         9Omg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Riyxe45Z;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 8926c6da1cb9f-4f882fa264esor680640173.7.2025.05.01.12.26.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 01 May 2025 12:26:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Riyxe45Z;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746127573; x=1746732373; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mOEvc0SSn4n4LmFVDeAobZ/gyH4Gzc1mitFhkjq5Fbs=;
        b=Riyxe45ZQ6ynQXI+WnMXzQT+CeAN6HaPse3hW34TPS9O3+tIy162qH3mWgdvFtJs1C
         iBeCWLooHEeW81mapHizKl88zlWLO0SaVgpL1BmqCcT7tLVfiaUsA6dueaIVm7VMzbI0
         ZCZ+HhcGq8ZR+WErlQBWvzk4HZuVjzYcICQLYcxh7n3MvQFEjKhXkSGdxhHZIzN+Ox9r
         rAl6WGL2GK+MMsaV2v2vzZe0AwELPonj2EJwVnRMd7/CzViR4GiZnN4V4Zx/fdj0k3N6
         hwhCyTornvWK4ssimnIQWQViCtY+YzOG2H7jv0pMUfiR+AEwhxFyCdAl4in7fdA/dQ2o
         sS6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746127573; x=1746732373;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mOEvc0SSn4n4LmFVDeAobZ/gyH4Gzc1mitFhkjq5Fbs=;
        b=G7XEhql/7sRg9+bYA+dgiB7vfBYkzvYy4mFCRIlqRFjHiO9IFg8uRN5vMAD3MqD8x0
         UVijmG3mVXUgUQQHv05BzM3NmN7zdMHlFOml3SwEubBVa6awyOXRsO9Lvz7u5OE/+yyV
         pPhtSEjMKt2kFyIXQSy/o3h/JGw8Uzx61998i/2deS/gRQUciVtpKCGiJMYgfpS3dLPJ
         NMakNL9N1jikXHDe7nT7G65T3TZJP0My7BZrmdvUr3aAOoMm8APM106+87cLe7JlP468
         QBzkbDRwpiaH84MXSTqzEjNRv4sRRPf4V3M0BZfGgocB2sE2bm4XPVSe0ua1hBr13RTG
         yGMA==
X-Forwarded-Encrypted: i=1; AJvYcCU4lmexrnNtHP4gIZej8LtUnhP0hAX4KC1rgTFTBeJprUq1dKf9LGWHyYes3UWs1YKGpsfpE8VRBcKvmA==@linaro.org
X-Gm-Message-State: AOJu0YwbnU958kxKnHiCoGRTSaBOEiQmejZGoMXgb0TGB3pJe2MWnD7a
	Mc2uYZb8b6K5BW8VmAyOp57MQuG50EE0CXM1SkqHIBbf/63D2T7pGgPsNJl63cxpow==
X-Gm-Gg: ASbGncsaEcGOFXTgTy1DLIoQvPasocqnfAyxGmYGeyf2ViqFOOmBd09cR1XMfbgZJX9
	5RJuhYvYePr9I2eiWDDk4hQzJUhp+6bTGAW8dWBPS3V854h5f2dbecWSP8OhxCF474amw0uYE8m
	+m47TUi9v3n8Dr3Q/cHxrH5YdvtyZAZNXRCA6y8/SLqZxm+e+a2RqDIiq0KCDU3fWJgJOoVc8v0
	Vr1f8qq0G8TtwpeEzwfQeIWXe6X3CMUVL/Wn7oloelc9Uyge0JEPQMtECJFgw6i64AmMOhtPkjg
	MJ0iZ/TRe60om0XMNv6brJgoZ5BxVfK7SvgA0Q0dMSLLD7lD9W4Ozi0zMgMRbObYUjV3a/EcGnU
	Vc9tZ7bYqiCe5Sg==
X-Google-Smtp-Source: AGHT+IEnseijY1qZFqXaH/JWrG++6y+RPfgHvgSE0pN11DNLZSAd2eF21TBG53pPmJQRnKWTEfeZgQ==
X-Received: by 2002:a05:6602:6ccd:b0:861:c238:bf03 with SMTP id ca18e2360f4ac-8669f9bbb08mr51312739f.8.1746127573026;
        Thu, 01 May 2025 12:26:13 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.244] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f88aa591a6sm7263173.83.2025.05.01.12.26.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 12:26:12 -0700 (PDT)
Message-ID: <2ac29f3e-3026-4384-8f49-0549d7368043@linaro.org>
Date: Thu, 1 May 2025 21:26:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 17/33] target/arm/debug_helper: remove target_ulong
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>, anjo@rev.ng, kvm@vger.kernel.org
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
 <20250501062344.2526061-18-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250501062344.2526061-18-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: H+du5Nc1HzAi

On 1/5/25 08:23, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/debug_helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
