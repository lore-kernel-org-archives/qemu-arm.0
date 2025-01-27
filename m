Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2717068njk;
        Mon, 27 Jan 2025 13:12:52 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW1rU3I81kjSLbh618Q1LIYF442LylOjidRZy+hK+Vooz+5KB4euE36Ssngnd3fhKoD+HzzNCM5+xZ1AQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGOoKsyV1k7CYNBYsGngixgnJKAlE5uVnR2pmdhTOhB9GQIESVw7jkMgjo8LY+/ucKLR9TN
X-Received: by 2002:a05:6102:f84:b0:4b2:485b:e151 with SMTP id ada2fe7eead31-4b690bbc2a6mr35525802137.10.1738012371781;
        Mon, 27 Jan 2025 13:12:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738012371; cv=none;
        d=google.com; s=arc-20240605;
        b=Ow+w0adie3Ha1LFPrFst3ObRx0fUf2pzqatSNdLJATxHO0AT3u9QTOx7SCnMRwJROr
         aBvjHSCEmPxt0MKfK4mI8bpz+NVt/xEnS/JKM4qerI1sJB3S2ALvZnp0MOWdEZ70Hw89
         HKhCiBNiCr7OyHmF8oJPag0+5KOlJBg7RU5LnlHH5z5F7TjxgiJ0TF6axM+tncDBM+Cb
         XuldxYTWoI7KF1izqgwnGcL6+doJ9focZqjhJKcuhdgVGCHKAv0uZLj1ErG2MAiH5k0a
         3HTbP3o6E44oMzGy1b0SKyObI7a+YUQIDFgkXeesTqchH3SASj24WkHYkyIl2gh/W2C3
         yo3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=YHXrFO01udUWOdVZsXmElRITU+8+c7yUY0YpXp00ds8=;
        fh=tZ9T5CCkVAh3lozQasOYOJoayfcBS8FvZ/324OIwJpE=;
        b=D4cD2RQ7iEQRsPQVTLkdbUPU94rWAXKq+bRMrWWqNLEIuUNUEi6BP0wH4Us8qSdKl2
         K/wuIWuaVzZ19b055e7F+9/4KJvg4Cm9hdsc9JPlmtg/Gc32RhJvQH8fv3l1d7dK6VR6
         /HNl84x1YdaaYgrjjV1L8Fx3aUSQcbqzbeEzZBwmmdfmbBTkbIBMMdgfi2R06l/JRM68
         mOcIuPbn0OB2aHnER96Fc2y1QHttSblyMVWu0yofy7+UG0SjBBRktEZK7Q82FLY1ww7K
         leb8gJbdZPdtlqH276uNnXjD8WLYGzGarwgrEolYWNTu2ISDk4ty/lyLhHlWcmsQF3VW
         F0zw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R+fqc4w3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4b7099ac2basi2571034137.400.2025.01.27.13.12.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 13:12:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R+fqc4w3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcWOs-0003Sq-Sg; Mon, 27 Jan 2025 16:12:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tcWOo-0003Rh-9e
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 16:12:02 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tcWOl-0000XN-Lr
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 16:12:02 -0500
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-2166f1e589cso10600005ad.3
 for <qemu-arm@nongnu.org>; Mon, 27 Jan 2025 13:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738012315; x=1738617115; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YHXrFO01udUWOdVZsXmElRITU+8+c7yUY0YpXp00ds8=;
 b=R+fqc4w3NxculqNWk714sebQ6oV0VVhVdGv+cpF3p8OdYzUpIzKfEO4U8ER/2LGVJW
 v68lQxMBEAUaB7JkCdZ2m+fY1zpgqUBaxYOSbWDaa8YXoS0gNBBgbESxZp8E2Hvr+OL+
 yC1WrfNxUm2UQ58RNcepIEYgV+aJ4NRDnwHAHOXA0VogmuzVEl1spcEWpqQYAZhgtElT
 6u0TYbzSeThEX5loNn9i85Aqtk+hmwPar3OoNBBbetOz3kWN0mJseNzFye7GnnT7qzAR
 ORkSnNK5M0jai+TmLN26pJuFzAwLD6EwlJ/Y+VASBVni5pED1faPojOmaR6o6xnQZmEx
 Wdsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738012315; x=1738617115;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YHXrFO01udUWOdVZsXmElRITU+8+c7yUY0YpXp00ds8=;
 b=ZjbfuVF1ecBPXySKf8A3uARdVw71HOw3/eida15/Co2xLKFOXURi2U+LDcwIs3kTBv
 cARiK1qQuhRIRXwDJ5Rv+AyfMmKhUsx4AfbDktY0FGz9yACPDWRdbcDsQ9h4FYe3oUST
 TZzkIkdvIJvNzjo+nXy2EQpI7k8ede09MWyalr67s6WzXt5r0+TAhV4fVAVS98915yb4
 68Pm/R3P6AM0hn2u8qgAvHoDHBVxZ81fdje1aOp2aI7mq+XnM6w/nfuRpoAlWdvA4zaQ
 PYqYTl4rjb6wSTUXhtKgQJcLz0m7t8iDF+/PpZovmUr2JvE4gfFBFa2sS2aEP56y/obr
 doGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcwQhwG5PZ3AtTzZLLP4yLp9+bjg/bWtnzcVw0QXAI/fSmzfjuMSV8fwRBAqgPOBKSOKC+d+JBPw==@nongnu.org
X-Gm-Message-State: AOJu0YzSdcKD1xBtSgZwVq7j4Tashown9cGtGNinxJYMJ3+BNVGEO30R
 3RuoslkbQoiY3srZs6TfvSZKWnkjADcsIaQalQ/8pucl+A15InGzf6Lx+8lApnY69qNL/biyQm9
 c
X-Gm-Gg: ASbGnctTVxR8JbFN7FoLhRMD0TRnCaFvZmQ2ksDZYGKh4KcZD336iOTBA/CpPVKeKWn
 tsZaTH3HF7qUXXENHRf4ambi6ODf+mAq4j26Xoyv9Y2kriof83hFFD4TJvlsuKLZHPNtneZOJGy
 c+Hp3IWPT4n6QZmMPI48fc8mVhPV/VMtt6WUyBaZi8OSN3fFkiyrd2fTCC945lk8AWJWrYL5EWZ
 ENpKGfTx9Q7JiKeFb2f+SGXSyA94JIoWgW00hpH9tsNnTuAzAXS6zOUAZKYmOM5AUI0UcKtqYwh
 xCGJPfk+oIIgfbKI/DMswz0bVY1quGFgkKEJP08kO8Bl+Pk=
X-Received: by 2002:a17:902:e546:b0:216:281f:820d with SMTP id
 d9443c01a7336-21c3553b6famr677739495ad.11.1738012315608; 
 Mon, 27 Jan 2025 13:11:55 -0800 (PST)
Received: from [192.168.0.4] (174-21-71-127.tukw.qwest.net. [174.21.71.127])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21da3ea3b3asm68426265ad.85.2025.01.27.13.11.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 13:11:55 -0800 (PST)
Message-ID: <44cb9946-c49e-4695-9ec2-7f3b415626eb@linaro.org>
Date: Mon, 27 Jan 2025 13:11:53 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] hw/avr/boot: Replace load_elf_ram_sym() ->
 load_elf_as()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20250127113824.50177-1-philmd@linaro.org>
 <20250127113824.50177-2-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250127113824.50177-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 1zqODp8uLA45

On 1/27/25 03:38, Philippe Mathieu-Daudé wrote:
> load_elf_ram_sym() with load_rom=true, sym_cb=NULL is
> equivalent to load_elf_as(). Replace by the latter to
> simplify.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/avr/boot.c | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
