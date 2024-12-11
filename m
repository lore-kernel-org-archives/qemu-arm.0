Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4439813njb;
        Wed, 11 Dec 2024 15:53:52 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVWjgtaFZ+dET9q4r3usNJZe7TLn++RnklS0BmwpFmiaIkSA8YtzI8CeYWpXzvZ4bLpAHTzvnhT14C+5g==@linaro.org
X-Google-Smtp-Source: AGHT+IFCJuTFwJYTwC3+yaNWVNEvo9vDYjjeBBcun7G0ZBRKr1HFBEamUeJKHtpbn7FCf1Bdot7u
X-Received: by 2002:a05:620a:4706:b0:7b6:70b5:306c with SMTP id af79cd13be357-7b6f25b3445mr221066485a.61.1733961232210;
        Wed, 11 Dec 2024 15:53:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733961232; cv=none;
        d=google.com; s=arc-20240605;
        b=FdXYTQNSYtBRWmjTw59aONtm8atCv6+o7gBSLaD1rmn/2t3qypf5V430kXza72/Dbh
         rp0HMqxU5nSYdczP2pMqcuUcjtISwCUUjIS3Zgp71ozMHnkbeNy1kQI7Vj7KoKGu7w3Y
         Q2sVE4Jq4soRdZrTSKblSv6u5IkxlPC6RknhRpk4dkd50MSZlRdiJ0N1OuePPC0i6sNd
         aGOeR8YRkBRp7HPw8ilgYdsHYHX0tEXyEFQ87hr9CuSo5cPJQn/tJ2Zref6Gn/rF/AES
         qljtdSBKI3OI3lZoLLTz858SGaD1lHwzLn8YGPC/24a0lvcvsSiCwTgufYxbkC5ghfZs
         QVbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=JKyA9P5T/PzMjDSVhmu3JTNHYpd7/fpBHnZ2tHClu9o=;
        fh=AEDH7u8NIKfZlxtjzq3BjtD17RdxRmzrx8RuWq/w+zQ=;
        b=C/5TiBjnCWB555bEpSnvKLC/UqTGPOWasqTx9EvdTsQiGXgzyl3QU/SV1zQiMn9d72
         gOI2ylxGSZvKNWVTy/RmmN2W9t20103khynFFBE/MX0GUJoNZy+udgxH1qACiVUOQr9P
         85+hqOqa7+K2K5XUGQLFYzGe5NsXX479EQtJbmN50EYqKzANagDxEjZW5ou376eViLO4
         2kXzZVpYmYWMBIOWxAG+I+nGm2tyqhfnAvDz/y0sslGuwmnESEiRi5K9DskvOUdYrdmn
         AnH4DT2nhHn2BKbFyg+T62OKhr7g5U7dPBoCQZBl7U8lHNyiRGfpkw0vF9ZBZtzxbFou
         SqbQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OVm3IT5u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4675ab725c6si106510981cf.57.2024.12.11.15.53.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 15:53:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OVm3IT5u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tLWVw-0000iH-TW; Wed, 11 Dec 2024 18:53:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLWVu-0000ho-K6
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 18:53:06 -0500
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLWVs-00022r-W4
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 18:53:06 -0500
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-29e65257182so4189fac.2
 for <qemu-arm@nongnu.org>; Wed, 11 Dec 2024 15:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733961183; x=1734565983; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JKyA9P5T/PzMjDSVhmu3JTNHYpd7/fpBHnZ2tHClu9o=;
 b=OVm3IT5u9APm3nFuKvFti7fIIlKboOnOLxDr4u22tbJoZR3R1mq1Rt26YuqC+pNP8B
 NPmKM+P1q7Atd5Tz+wTwAu+zgl8escwNYm4N6zaFL29CbXTYveOdcKo1ZBelYZVY9Alk
 sN7ixBm4IKwYRdgDadQ1SHfVPzNFR0InZhFODazO7tk4IG/pYU3Wl0Fk/P8s5la+Aq3l
 347aIfi6i1djmV4DVtLlk7cc2igv4Ng8zvtjllzCnOkZVPE5PfEvWz9GqpQBOzjioZgY
 6P/Js0TbzJtnmq5Dj3dp8z2oXJOg4waA5mtVjPaxVnJCKfB3/ecQ/PvBuqIWLxeasqcK
 LeSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733961183; x=1734565983;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JKyA9P5T/PzMjDSVhmu3JTNHYpd7/fpBHnZ2tHClu9o=;
 b=DU5LDvfKopTB/7RxiNjPwH7LILy/IwY9R9N7hUe3d4KI9z+AanQFEWuFMDEZV9E5nH
 FhK9meA7xmU7LalrobOaw2hT6GkD+2d6ojTiDbbI1GosLIvXv7w0bl3q8Qv1c116CHUx
 /LI05fmXviuvmvqGfjFbjM9X5dkQGfRZeQSQD2muLEO3CA/SXrajYHJOX55/rJLZ473n
 miPq+vLqsNnsMZXv/4wzDiI9R5bxBgdQw84Jmw9dppx9xQCH08aQ+cEVEP/+l6kiP/0y
 w/MyFiHeMCOZG38fgo1ozmMWlojXBbAnep8YnxHy99cYVEt0NbAsplAnbkcLUVk9BzrJ
 KiVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYVCf8uXYWq4Ecjl9pv1EEX0/P9tqfRDBbrsRqEWy1kZH+Y0DAzMZas5NIQ1OYvVXVzwWsawo3mw==@nongnu.org
X-Gm-Message-State: AOJu0Yz7IE5RI/AKhrTURMG2MTjj/kYJa4ln+Zvc+giuNJ/jd/ed0Jaj
 yAhHSrskFHSZjs4mlF1t1RdFnYx5QR7vkvMOSTzDyMzR1zylO9KMFihr2EPmqa4=
X-Gm-Gg: ASbGncuLxB/pbwagH6rNjy06YEh0XRAGLlGzvrPkKWy7gmXMrTwygwMDbYCWmDdQAV4
 cDOaG7J5c1yQwMI5aArQcpRmj5M0y+LW+itDTtLW0SlR1F8pQIy1QeNHMQIx6avFQL3GcTCnbg+
 TEAvfVVPYmj5hGbUquUs1OcKlXqi0KCFHWfVn0BV/rm/uG/9cnxsS7dPjoCibov2/KoavCAGG06
 xPgLcdj3OzPz/+E4TA3H0EjUArS0t8XiDrT9Uezo2ULg1SNG/NGCf6e2hSowgJkONAKIXt0FI5N
 4TNeX0uPx5s7z57cNL6Lx3ywkCwWQnpR
X-Received: by 2002:a05:6870:9109:b0:29e:5bb8:fb35 with SMTP id
 586e51a60fabf-2a38271be13mr965228fac.37.1733961183379; 
 Wed, 11 Dec 2024 15:53:03 -0800 (PST)
Received: from [192.168.4.112] (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-29f569a698dsm4123504fac.49.2024.12.11.15.53.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 15:53:02 -0800 (PST)
Message-ID: <0cd4b1da-eebe-425c-9a6b-b712e0a877e0@linaro.org>
Date: Wed, 11 Dec 2024 17:53:00 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/9] hw/arm: Include missing 'exec/tswap.h' header
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org
References: <20241211230357.97036-1-philmd@linaro.org>
 <20241211230357.97036-5-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241211230357.97036-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: LlKSXNqoG1TP

On 12/11/24 17:03, Philippe Mathieu-Daudé wrote:
> Some files indirectly get "exec/tswap.h" declarations via
> "exec/cpu-all.h". Include it directly to be able to remove
> the former from the latter, otherwise we get:
> 
>    hw/arm/boot.c:175:19: error: call to undeclared function 'tswap32'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>      175 |         code[i] = tswap32(insn);
>          |                   ^
>    hw/arm/npcm7xx.c:326:26: error: call to undeclared function 'tswap32'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>      326 |         board_setup[i] = tswap32(board_setup[i]);
>          |                          ^
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/arm/boot.c    | 1 +
>   hw/arm/npcm7xx.c | 1 +
>   2 files changed, 2 insertions(+)
> 

These could all be cpu_to_le32, since TARGET_BIG_ENDIAN is always false for qemu-system-arm.


r~
