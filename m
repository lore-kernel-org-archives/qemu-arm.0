Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp445103njc;
        Fri, 21 Mar 2025 09:38:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXtMQzpR5OfhElJsrTz53eW1HhfmQ5FSP0vEKH1cK9pGbTnQ1pUTsMu0kzzmAkPGW8H9BE0Z7SF7vpyig==@linaro.org
X-Received: by 2002:a17:90b:53d0:b0:2ee:df70:1ff3 with SMTP id 98e67ed59e1d1-3030fd36f80mr7865747a91.0.1742575105703;
        Fri, 21 Mar 2025 09:38:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742575105; cv=none;
        d=google.com; s=arc-20240605;
        b=DQ9t0HKBd1mjxo8Zym50mVuTRsCYo1zXWZo6au+jp+3V22vgcL56mI1FQ88z0azthx
         vIdWD4p9DVYEfykFpT9b1tes7dLJgfN+X/Idxq6iykD1ijSkynCuD8FKyGR5qnBDbeHP
         Wt40iTp/oO8BcN8w7znqpE9jUjpuUIywpJyBPoz1GKeDWpM1RNtRfDdSSFI0epSwKY2A
         P1qWC4Qy/bWFKDEMXSvZm3VN8nGlZmpsLhuiEpQxLHGfhQ/nPPOoBV+mZ0jbC2fROz5g
         Bppx8bER/AXFFhzwHIy2ukgZi7ItMB+VMSX8lS0mUY9gbVYBGgXEy5rfHIxNoNMDVyOv
         Vswg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Po+8A7oIRxr9NXsNwzfrLWOQZJ6V+4VHyvpZcXsIsSY=;
        fh=zHikONdoGOJRDiPW/BVlxkdJRorg87DQ+zSxlH6Q1v0=;
        b=V103DLnr5G0eL5iKZhJX9d1Wwv/9TQXvlovsSzBHEZobxwwKrQI1tzL4yB273OxqUf
         mYl/6AVPR/n1to1/oWQdVVgVnqdzPK4CpQOh2QNvIHf0+B0danXDA08Ju/HpVUSUg3wH
         vAonQG19fMiVT/H1TrYWs89HBklLAJUUXeqFaVnEexjDmJuOyZ6QE8Yl3ySc3kuMNLhh
         /1+PGIsT46IIhpG8KfB8tWZXEmsVLSx652vj5PiDNGQFb+jwCYLmdrewEzPgj7g2+XyV
         2DbTZAOwF3xy1Hh+J+26ppPawDY5SA1AhhbpRaC/+tj3CY1g9/dkMlJEdteWr1y0TpM5
         QUWg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WtVz+h7L;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-3030f782d9asor2489188a91.3.2025.03.21.09.38.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 21 Mar 2025 09:38:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WtVz+h7L;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742575105; x=1743179905; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Po+8A7oIRxr9NXsNwzfrLWOQZJ6V+4VHyvpZcXsIsSY=;
        b=WtVz+h7LV/HCRAMblRvgEWrBljIf2v1lHb2WsTXNM3Qf/shUB5rdqNFtndU9AbyMT/
         uBf/KNi/bay725B/novurpHtMg0u8YEhzrjU+8Dl9mVroPxLxTov3/37NpBd53aUvjrT
         4a8kLqXMsAcTNamWqoQQmMxFqXc0qfmwh+wnA3oaXEBweEN/dizIdxPBOgwlyr7i8Bal
         nQWtKOZyWCFXLYS0IB3uHCBJsLrC5I36ABaM6jBX07vnVq0Uvh3VcZmmPxt7d+1WFTl6
         RK8P8fHTkwHuckCbudTfxGOs5htqjBZbJ96cuF/8jImfPUIcmC9T55PCXoU3ml3v0mPg
         6Caw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742575105; x=1743179905;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Po+8A7oIRxr9NXsNwzfrLWOQZJ6V+4VHyvpZcXsIsSY=;
        b=aElNMb8KJTTO02l4WLF0asDAJmqSbAeQHeUP0UlYuW1T3r7HUpjUhSwogKUV47assf
         NXY39cwZieJx2eg9m9RJxCCg14Z+AyMpcnUaRz6b2U99LNJO1XtOZ3NIvjfZUH4W9jCg
         7OddgGWIE45aDRKIXbxN1ycWVNO91g0KXU0s4vF8sqFnkfLkDm573DhcCDb/fgKmHxmL
         2DBmxtFpK/26DARTWu7NDD9ELPir1ObWlWFcArg+SM0nbKX/JMs1zIHa4z2psRzl6+Cq
         6FpoBMFCWyPr4fe1aAilQ7Bv1nXemtTQ0bnvG+0L+nfA62EeZqtw8FqduMVUEz4BaLVW
         E+Ng==
X-Forwarded-Encrypted: i=1; AJvYcCXbZ5QvkbYr2jjGLM69UNIWU/1mxP4H54VKe7eesSETHQEyI+TrER8nQ+FNhpO7UVGw6Yqe1OtQq9Jacg==@linaro.org
X-Gm-Message-State: AOJu0YwzcyfIu6M7AWFbl43SFNoof2YL6tBUxNuAJWKSPCyvf462oyZP
	3xWV0AXQDESCZAyMs/AuMg0Ob/2Z4t6UxJ8mF/IN39N3ajfI8jYDoWKMTru3eT6R10XZsJcHVum
	7iCc=
X-Gm-Gg: ASbGncuHiUaTBD/zlm1SetYUVB61NkLjE/N8qcwLHNBL97x1i3FdZ3vTXfXNwObsl/c
	9tQruzU60hKPOhQ7QZhZakBioacQ5qsmwN3uMbaJirVospybTNobNZ6z9U7oMRQ2PPlyA4/PbaE
	MdrtP9pUKMegngaH9o3ILaG0WtojHKyAUI2Vd+jXg2Dx3nD9JJayA6pRnvAwDeTyYXHzVii4UrC
	qxRRhoxetQZByg7XSbx1cUpoaiZlCs3aV++vVyCEFB8BnzkzaT9gPZiI3MMUvoicFWU/DiCufHL
	b/RExpVueBj7mzeXJ8H3YzbS4ToYZuSc9baCuqsmeSN4GxXDZMPoEI/nFkWFxeyv7Vahq2UhZTx
	hqNAKatvokCtlSfozvl8=
X-Google-Smtp-Source: AGHT+IHD+Sw1ed5DoL405gur8EOIIjes7eESLfyzMPwXXFmmPARwBWAqgfR5qqpOR1G7ogBZyIjHAg==
X-Received: by 2002:a17:90b:4c4a:b0:2f4:4003:f3ea with SMTP id 98e67ed59e1d1-3030ff21efdmr7057846a91.33.1742575105064;
        Fri, 21 Mar 2025 09:38:25 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-74-48.tukw.qwest.net. [174.21.74.48])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf61a44csm6295878a91.37.2025.03.21.09.38.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 09:38:24 -0700 (PDT)
Message-ID: <be360a66-fcb6-401b-911c-871601e7c726@linaro.org>
Date: Fri, 21 Mar 2025 09:38:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/30] exec/cpu-all: remove exec/cpu-interrupt include
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
 <20250320223002.2915728-9-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250320223002.2915728-9-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: XCstkj3vNn31

On 3/20/25 15:29, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
> ---
>   include/exec/cpu-all.h  | 1 -
>   target/alpha/cpu.h      | 1 +
>   target/arm/cpu.h        | 1 +
>   target/avr/cpu.h        | 1 +
>   target/hppa/cpu.h       | 1 +
>   target/i386/cpu.h       | 1 +
>   target/loongarch/cpu.h  | 1 +
>   target/m68k/cpu.h       | 1 +
>   target/microblaze/cpu.h | 1 +
>   target/mips/cpu.h       | 1 +
>   target/openrisc/cpu.h   | 1 +
>   target/ppc/cpu.h        | 1 +
>   target/riscv/cpu.h      | 1 +
>   target/rx/cpu.h         | 1 +
>   target/s390x/cpu.h      | 1 +
>   target/sh4/cpu.h        | 1 +
>   target/sparc/cpu.h      | 1 +
>   target/xtensa/cpu.h     | 1 +
>   accel/tcg/cpu-exec.c    | 1 +
>   hw/alpha/typhoon.c      | 1 +
>   hw/m68k/next-cube.c     | 1 +
>   hw/ppc/ppc.c            | 1 +
>   hw/xtensa/pic_cpu.c     | 1 +
>   23 files changed, 22 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
