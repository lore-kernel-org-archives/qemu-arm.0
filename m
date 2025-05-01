Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp319538njj;
        Thu, 1 May 2025 09:24:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXIVY+iW5ABdRf0QCSuozAWzTEJmZ4jrqOU7pERrL3DuKfXQvcNSW7MY+7dlfKGN1ru5ewvlASJBD0S5g==@linaro.org
X-Received: by 2002:a17:902:c94b:b0:223:2630:6b82 with SMTP id d9443c01a7336-22e0832d586mr53565455ad.10.1746116695238;
        Thu, 01 May 2025 09:24:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746116695; cv=none;
        d=google.com; s=arc-20240605;
        b=cbjyry5RgZvQ8DKJuOYhAQNfcdmofOzKvlJGjBcCAivAfGymKU//udKrdGvJueEX+B
         3hmTu2MNsRXLh7YJSMx1XFlwGpvLUkq/+Pbjcymi8fLu7nsZPX03viv80uEvIe2mW5RR
         JoafLhvgZUOaluyBrZnHF1EFqTkn4wOCtLgJt7+imH/5rc70/49KPQ8wrn++o0aLOumO
         qHgRGKPHiGYUoQWxBCB9PMCfArkN4EygFsjr1H/d4yyyDMKWfIH0tZYzs6mc0wicORpb
         DcI/9lYSmzDS/sU5Zgpn3VVUTRItV1kHUnIrYaqhEQb9CpqkvzaAoWQDGUPGhDCKoF9V
         hK+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=cIv3SYpt0KGIULJLpRzPxVIXo1I4QvmLyk6TDaXK/TU=;
        fh=Ea+IaToaDBj3VgRGKsuaiLKhxR5EWasAUuyu3gHbFKM=;
        b=Oe4xXSVEFyBHkVNaGyTcOmJcjzv3EIHjhYYDmom11wIi3cUWmnFKRTiRYua/kPTdmP
         5xxcuMyDoYM6fi8cEekUlakiZZ6TGMS11dzboGlpKWTUQlquhIOvRfm5fk6lwGzwd6AP
         CcpdHcqNwvOSLBPG3d04zK02CZ1oFYx7nBMZUhDy6em6QWpUwk/54oB54tghucFb54OG
         Z52hpMiPobu3sdfbz3F9E7BfLoihW4Min5WYj1RivwsAlphKtggpB67IR3Up/yZtwHPc
         +EqryBCaYlC56QMuwv07qTK429hhFZrp6jc7ul3bFs7l6dM0/xkTIYjSfKSfhu/WNYb2
         mkyw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nmhjR4bj;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bb1fcedsor7188205ad.5.2025.05.01.09.24.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 01 May 2025 09:24:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nmhjR4bj;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746116695; x=1746721495; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cIv3SYpt0KGIULJLpRzPxVIXo1I4QvmLyk6TDaXK/TU=;
        b=nmhjR4bj+nqm0a99lJo7dBqeSGtlEiq/MPzj+L5FjQVYT0CdJsV387ijywq/TZlKKR
         gyTrhlIgs3DkzwqxNgHcz9KJqrfgGX5GceTDq2dtwH0K/OOJdWkDK2GlclaIblYTytn4
         7FQBT+L0gLkwbxxsxmkCbWWrxjX1HEeQT2eH+A2DWs2YxkQue0ZW0MkO5q/WN8ARG1IB
         MktfumIA+3K0ep3p6zUTV5f12Q3HXqFTcLnwFMfNmhfyRzCR5jNJpmn9H9vDW/UBZBU4
         +ise3wmN6qJkp7J433xQmqhVVXaTRG29v4KIHXpQL9kMrtt7rFa70M9pI1mTVxjc4HJ2
         Xmtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746116695; x=1746721495;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cIv3SYpt0KGIULJLpRzPxVIXo1I4QvmLyk6TDaXK/TU=;
        b=AIjpPBaKjztdXArTKT+RGa0t/0du20wzhNT+P55tg3wbAnlZge5K36cHJxtg+FPT76
         0GWXm7rArzKTgIu5GqIk9mZyVOZW7NLwSPsfcSa5lPxQ1mkG6uO0aLkmwmEsK2xg0h3t
         4dFFaISz+WWTdufetPemrS8jqzCM2FfEAAU9gw1iGMko2zmbzZveTWxMxIuWjQZGsdw1
         4JsqYoym2gXYbi3ik5LA89sCsCGNThPIJbIG5YXlVBll0qcqyHQ8LrQbAT3606Wfa3Hc
         ERuogPann4JWgJBeCBqKroc+H8auhN8aSQIR+gU1GZ+bgHNOCtZkQszZHy26oprekJXj
         hdrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeZrmRn5wXtqoYi4pztbpDcxICeXLpaZz+S/NXgsazqo2k5fp1ovXLZ0A7C1jl7j5kpamdtOwoDIas+Q==@linaro.org
X-Gm-Message-State: AOJu0YyKZeANJU3RbeX5sjl9r1dtiNLzDVzzpYRHwrLhGtsNHCz644jD
	OO/n1YT4YzLSqgi0SJtvU16H+HvHwFuw2GyGzClj0PUk9fQD/p48GY8ZVOUFYgQZmg==
X-Gm-Gg: ASbGnctbLOeJRT7s05FwSH6FBcgbhUGh5fEkeHvdXiTMXLp6SzTO2ryck2YN3AjMXzU
	1AFRGTyzytGob6BMxSfA8odXvWxN/OsSz/sMeF6ImQj2nBx2Hv6CPZmt+6oKxoe/FRW5MVS4OT4
	kN3xe9hI50sCNemoG5sTmvGBWOrWG1OB5Unvzyfc/egmWd2GkUvFEEm6WAJYYgPmF0tw6exWq7t
	m1jIUk6E7cNGYKYUi/7loG72qSRr8MIGXjWYLmRSTLgBJEzovd3hd6BYoYbsxLuVWKXspyUkSPx
	r78IEdD8TLMXmnhP5Hgq7UTqpuMg55xXsbpBDbQRdaEuJOXcmHvKclYcuKcxLL8XZ2Hsm76+cur
	mfqbTtMc=
X-Google-Smtp-Source: AGHT+IGAKwM6RcxOtOkzEFIhOkFLa/b5bn90FuBPHURkl0wMDnKUkk3rI7DC/t+lusoNb8z3Bd9w2w==
X-Received: by 2002:a17:902:ccc1:b0:224:1c41:a4cd with SMTP id d9443c01a7336-22e0832d6f8mr50408735ad.3.1746116694875;
        Thu, 01 May 2025 09:24:54 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e0bc6dab4sm8608535ad.141.2025.05.01.09.24.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 09:24:54 -0700 (PDT)
Message-ID: <59d1bbbe-7f39-4022-80a6-945484508ce1@linaro.org>
Date: Thu, 1 May 2025 09:24:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 32/33] target/arm/meson: accelerator files are not
 needed in user mode
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org, Paolo Bonzini <pbonzini@redhat.com>, anjo@rev.ng,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 kvm@vger.kernel.org
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
 <20250501062344.2526061-33-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250501062344.2526061-33-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: xFOcLa3aFAsa

On 4/30/25 23:23, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
> ---
>   target/arm/meson.build | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
