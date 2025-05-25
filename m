Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp3731323njc;
        Sun, 25 May 2025 08:29:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXurrmuQzB67RIrj+jONsrFsBR0OW8FeyOGVBq3/7nIDG4GrocHoxz3Dwq6IdEfvs4/SOiJrpUFqSdUZg==@linaro.org
X-Google-Smtp-Source: AGHT+IEoy83vE2EQNkaLyfcaGPDWtkESyk5ExZQONszmiolgutVa0WU9XqfVvm+6/wH2MkKvxoYU
X-Received: by 2002:a05:6602:29a8:b0:867:3670:5d49 with SMTP id ca18e2360f4ac-86cbb813cf3mr611160039f.7.1748186983460;
        Sun, 25 May 2025 08:29:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748186983; cv=none;
        d=google.com; s=arc-20240605;
        b=BAnaIm4yRGOk6SyoMtXb2EVWBQWZxC37Kiiwqo3MncraOHAFxWNkr0C45aMQ/tBcuL
         XTFBwtkY1mWsMOBtzihXAWCY2OaRH0SEXf06rXYLELPNfKt4pdU4CEkxfsHmPZC0YIh9
         9QflkNcfZsQUuP0L1pmF5pEeNq4U+DlMKCVucCK726nFzkqF3F+FTTIwrqkzDSEXT+CS
         AB8f2cFRs/+1C/Z6Li30GUEFjVKK4hwiahDYKsvU5uUTtUrOhSq12I+8X/LbMaGGrQ1A
         YOn+xOak+QIkhbR0QWHme6xf4aJdnc7CjF2Ks4qAXss2aoC/08U4dtqBvivh4IsIVfu0
         zRZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=kNRV5007pB5JZY6Hx7pZSfOPig2zDQ44ViAP9ujmIzw=;
        fh=EE9RLSVZw42WVFnk4t/g4QNwl/5CWDcXqMvXCx+Gpgo=;
        b=ihOxs9zcY+YwUQ135UcyKtOE9VrsCSlP5uDRclk3+yyFSEn0QkQ4eIw5BFCZcqnn+B
         9t2lYVU70QepSEgEJPUi0uvSH4fKbkY8NtnsLXp7XgvW2IVU0UtsyzaKg0qAenojZgRQ
         UmdZ5oN6njqyZvxEeighJ+1BuTCgVFSwFFeyraU3o85mG+6gxMGJVahmybOBgJnVPSxq
         PKReRJJ+cbIEtG3r+lo5bQYLrD/N4NGn2hUkZmicsVDtKtadZV+3Kh9hruMLY3mXKlAN
         7SisrzUQgWn1fL0xiZz3i4pf/E3f38Ai232bZ78/282dcRvbDSjtUM6+D0+mELclT/+Y
         zOcA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mlOoh9v2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ca18e2360f4ac-86a23736ec5si2016663839f.104.2025.05.25.08.29.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 25 May 2025 08:29:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mlOoh9v2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uJDIA-0003L7-Kb; Sun, 25 May 2025 11:29:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uJDI8-0003EA-FW
 for qemu-arm@nongnu.org; Sun, 25 May 2025 11:29:36 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uJDI6-000820-J7
 for qemu-arm@nongnu.org; Sun, 25 May 2025 11:29:35 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a3798794d3so1521770f8f.1
 for <qemu-arm@nongnu.org>; Sun, 25 May 2025 08:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748186973; x=1748791773; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kNRV5007pB5JZY6Hx7pZSfOPig2zDQ44ViAP9ujmIzw=;
 b=mlOoh9v2VdC6KRK2CCVqinKfbeS09I4P3UTeztjalT7mtWydrSTDDqpRobK5MX2XJD
 yqsfBjnSsFqpeuwF/TvLqp4hn33bpEu9c9s+iq4VgH5rKfxQY3P9JVvDwcROi6mBmcWZ
 M3mYuRHdhK16f47EXd7ajhikP1+azXNnKcWzS7SaXexfh436RIlNWQfV+fmYKzKuqs7y
 /BohcGtYJsrj/yuDw0S1fF9rfToXfEP4Y5DwfP7xHAxBWMpXhkRbdd6ieBwIHN9jofxM
 dRCrvRUEsplh0X+ce5wFiUjjaZFQBBszIBjiDqbzeLzuU6ZZjCPGu5ayIpW93lZ9PyKw
 quyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748186973; x=1748791773;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kNRV5007pB5JZY6Hx7pZSfOPig2zDQ44ViAP9ujmIzw=;
 b=O/Xks+xp7W8/xGYuwFXuxqUHSlt+a3eP7i0VUPccIzQEQtLs35RkeV4KyQXyQGvont
 IdkjbNaxQLPSB/D0OrqmDeqTlZ2VjCm9oe0fc88CJhBcQa8RoTt0Ykumsu2eyQktrfzQ
 3f96NsvTHmjkeICBkLJMIIHkfK+W+C7aMv1Kac6ZGp/Xall0uYcUzUTKT3sY+lyZhahg
 ao7hT9o+n3MLDkr4IrktZJkV60lMD47o9eAdAo7fsi0rPpvauGHQbMfYOMVTxP6pFShp
 5fmjh1l2Uu45pfhpxXNRC64bFtJd5W1UYQHk1Aj2UQ0uWfk9mFQrYO7ZMVZAYQvGu7N5
 M/iA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrdVP/ZHfFzsr0tnbAoeqfc0kLq9HY2SlZ9NDwjnLPzGZGAGRVk5KQm2lPYDmnn4h7SN7VzBVAnQ==@nongnu.org
X-Gm-Message-State: AOJu0YxloLWdQiY9r1nycEc06OjoDKKNZ+Z1o0u3BWyAEERFU1A+dxQO
 KQJuTh5fnfH6S99f6dO4ojcdNd095oTMCn8ohp8/EG0OuYq77319vR4eGK+nBwe08EA=
X-Gm-Gg: ASbGnctXb35JIl8QYvx7SvcCz5Li/lWlRwAgjM/4kz5rDGyEOxJ76KDph178frDX8i1
 2BdgxYwQkRgZRYXjtRFktdPB3mh71k10jT555/QUrL0860AjBipPA3xbziOkc9+9h4oUkojhiUt
 XFdZKQAIsbuYtY8I6dnd1rts56GijBAeO/NV3AtMxzDSDVIIcga63bel5kfaKdEyyNqMgZ+DCS2
 lPF05Pr8eXE3UwR6zTXuisAKHN2oGpOGNUr1aH7idc7i0NxkkC04z2arSc6sRePqPQFidZvgYXE
 rxWBDn0imcrO5gt1hWuABKmA8y1/Ldr9m2WwjP89MBS6QNpzDfiuP9p5TB1Wcgb1n5SXK0pNwrI
 5csAmZMlCjMZVPWHHeFjF90XPlaQ=
X-Received: by 2002:a05:6000:4282:b0:3a0:b4a7:6e56 with SMTP id
 ffacd0b85a97d-3a4cb4c59b7mr4766976f8f.56.1748186972913; 
 Sun, 25 May 2025 08:29:32 -0700 (PDT)
Received: from [10.132.0.213] (17.red-95-127-33.staticip.rima-tde.net.
 [95.127.33.17]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4cbb90a5bsm5305302f8f.56.2025.05.25.08.29.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 May 2025 08:29:32 -0700 (PDT)
Message-ID: <770ad604-f365-4f4d-b8a6-aec6412e5c4f@linaro.org>
Date: Sun, 25 May 2025 17:29:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/22] hw/i386/acpi-build: Make aml_pci_device_dsm() static
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 imammedo@redhat.com, anisinha@redhat.com, mst@redhat.com,
 shannon.zhaosl@gmail.com
Cc: pbonzini@redhat.com, Jonathan.Cameron@huawei.com
References: <20250514170431.2786231-1-eric.auger@redhat.com>
 <20250514170431.2786231-2-eric.auger@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250514170431.2786231-2-eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 7K6+wixWQPaz

On 14/5/25 18:00, Eric Auger wrote:
> No need to export aml_pci_device_dsm() as it is only used
> in hw/i386/acpi-build.c.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>   include/hw/acpi/pci.h | 1 -
>   hw/i386/acpi-build.c  | 2 +-
>   2 files changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

