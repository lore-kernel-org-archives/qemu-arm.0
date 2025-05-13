Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp406629njb;
        Tue, 13 May 2025 03:06:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXo5C1xPHEmRY8ipJQyPGmIn5Lgvq5f44juUiPRWgacIwHZh9byky5skg//J88TNiOec/KgUJEeAaPUHg==@linaro.org
X-Received: by 2002:a05:600c:3c87:b0:43c:e9f7:d6a3 with SMTP id 5b1f17b1804b1-442d6d44d1cmr166288565e9.13.1747130794094;
        Tue, 13 May 2025 03:06:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747130794; cv=none;
        d=google.com; s=arc-20240605;
        b=jKIVm73MftZZrByOWdKM3VJeKGfDJ6uyNmJ6BpmWiU6J0R7q+vc8irSbOBvhrB1yyd
         UaLxoGEgETrT+f230XwJPe+/Yp+IrgnPjgQln4OAuw64R+O80/vPOju49sehWuhNBuJ8
         wepHF264KG5VLtmcZVc1Jj+agujy2/dGGXLpy0hzCSyOJt5JvXojMlLIb7qUblYZZDGu
         VHbN074WjnBkRoQ9l4cBQ9v3tKNu20Ibfd2wPf4NT1tdOFnbdcOLYFX3w5A+FDn/Se74
         54FTKOD9RjOKKThjBY3yMAySqBBx+xA+TeijRbLGuWkQ+DeNcuJ89OBk//+fPsTz3wc2
         rA7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=J4FOJ3+jCdkOTdzBlJQDGCZ0Aj6URs9ripel+V7MJhs=;
        fh=MLqzvsY7kvb/7/K5qhYSsO4bZyC9+Zs0svKARJk3pDE=;
        b=Ixlx5jyDu3F72JkZWGfJ4RjxYcWCeNKJ/L3zzQCJ41CEkTWgI2we3oz035uye/zJ2k
         oNsCEKcfd6bs037skg6Z401sfSilTq1fKrWxltSb7kTmmsVspzWl4XNf8QN6RUTLsZF0
         g/3bxzfCDqgwRJSrbH4Yml83niA+CEt2h7s+78BRehNT3TSUgXgS1V7Abeg9f9K4oC4G
         io6pcNENorcOubzLbzq7RQxRfVXwJgNt+9CK8WikeAze/3ZdEVwFd9fHk12BH9y4yyfN
         /5Xnk2RdPtdbogrmbQjxAkIPJ/o5nbvBFnwWaZoWU+uAPWrqSlZFpzDmp2PtFQkwjlhZ
         II8g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mSEDtv8n;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3a1f5a33c96sor3130292f8f.8.2025.05.13.03.06.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 13 May 2025 03:06:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mSEDtv8n;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747130793; x=1747735593; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J4FOJ3+jCdkOTdzBlJQDGCZ0Aj6URs9ripel+V7MJhs=;
        b=mSEDtv8nv7KDBnmQ/sWepGAatKfEznPhxgZajrFwXamnu2G5tMfEJ6QI82JAJD6awv
         Lpm9fqzsamn92I7b+4+F2tqlCZkouAbsrpt4SGWnj1pGiLO1Vwp5fwAu5QWqkshqnMVc
         aBjmiA5YOyyMUKhYGvEPa5U6wSc8i/C0Hess2qAEgHf9jZ8+L93sa5av4/Qg6z4kXBX3
         B7yZzlP3Ckgk/W6C8yMI126/U4ceZeF03xDvFHPnpE0EBfT41S6BYkv2tc6HfJUKSQtQ
         qt47F4FVWsLkbZuHSaVcwO/bpjv3kcDlsbifADE10J3p/o7T2KORHI+v0vK+XTH9cKTq
         u4HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747130793; x=1747735593;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J4FOJ3+jCdkOTdzBlJQDGCZ0Aj6URs9ripel+V7MJhs=;
        b=eTrW7emfiCWTGlLs45mpvhlTZT9RVOJu5mRIwUIwf3rlfcLgbl2vidzQIgRAoVyjU6
         8Ct0athTRZZ135+VEBwIyh94kyyx07Df75xFHB/OTgEbjiv4xE+XwDbfyClJj86jIwhU
         qzLvYs2RbSqK2RBxHDqSRzQqQUfqcalJJuDG0Z35HvshE860kQbhvLGAlJNH+crAFTpp
         g3V1yvrzxMaPfPXXRze39nebmysxD8WzTTQXVLI2Ko3yG8sFvkzQz/uTWTa6JRcc5Ed+
         KfJlAHrU0tFs5WGa9J52+nkSLP/7NVzleQoZdMkvt4OoZ9BZRoQvrL0zigJrY2HtVUK/
         Nwug==
X-Forwarded-Encrypted: i=1; AJvYcCX0z/kKUa9qiJLOQl7zctqY+PjiDcBBsJiEKhNqr9XHbjLMtyEyTwR60koOyaD1E5HRmN/jP4W4nEwvCQ==@linaro.org
X-Gm-Message-State: AOJu0YznhB4A4poaFD0TutP6vezqolZy0xG4iDFnwI1X1rhEbsH6FT81
	55g66BrC8sGBxFkQgVYS9JpJmBYPc/LJ2dlzIxjot5GQNvXX2FuXhokL/m9A3OgOh2bz7uFR91u
	Ohp9zPeBrMFw=
X-Gm-Gg: ASbGncs8I/7gcWUZaucnOwxfWAbVyON8DkbynNzLoP7l9BxhSOm3I6+QbcFP77jsIls
	nDZHnA7ASFDiq0lskYuiEbgVBVRVdQ3MFADjTt746eI49M6t/nwdt+PaYWi61W/Hv5TNZ7YcilE
	SiJ25IeleHyjNlDEB9bXBr0iK+DmaOgpFo6qQ0wbQVpi3U6fBAEaqVugCKWpc2RgN6ApCo3ge0j
	tNWRUMGI5aTJSWf93+hrR1hiZc9GxjZyjxOBTDiVC/BUnwam5p62+qloltELgmElKTV5QHO1/C7
	2AF1g0bId+XDY0G9RuZorlvV3Wq70C6m0ZhALB7aM+1/Tl78/ZvXOIm+XGIVQgCRH2ob5mmLCeT
	LoUtnPMVi3QUSm3Bqhw==
X-Google-Smtp-Source: AGHT+IFHLrSF9XA++jfCq5+p5aY1/NBqp7sUwHhhZmRH0EhB15YL0OESBl1s/DFkWQ+4RjFm1GwXZQ==
X-Received: by 2002:a05:6000:401e:b0:390:f9d0:5e3 with SMTP id ffacd0b85a97d-3a1f6429791mr13293184f8f.1.1747130793581;
        Tue, 13 May 2025 03:06:33 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [10.61.1.197] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a4d0dbsm15346027f8f.88.2025.05.13.03.06.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 03:06:33 -0700 (PDT)
Message-ID: <e5c421d4-2e8a-440f-ab1c-87aa642f529b@linaro.org>
Date: Tue, 13 May 2025 11:06:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 22/48] target/arm/helper: remove remaining
 TARGET_AARCH64
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, alex.bennee@linaro.org, anjo@rev.ng,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
 <20250512180502.2395029-23-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250512180502.2395029-23-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: fhCujViivh04

On 12/5/25 20:04, Pierrick Bouvier wrote:
> They were hiding aarch64_sve_narrow_vq and aarch64_sve_change_el, which
> we can expose safely.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/helper.c | 9 +--------
>   1 file changed, 1 insertion(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
