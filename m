Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp3147687njk;
        Mon, 2 Dec 2024 11:32:00 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVtoQUIUTyZBp5tGYdesbbyBPB5pK6E5XzmjUaFZKHZ1ysxflNRiJXdZPH6wXYTqXiM9WlFYEkTXN81dg==@linaro.org
X-Google-Smtp-Source: AGHT+IHukpXBqX/DAC9q2PIay2g7yo41IdH+Ed0BYnDmTMXPCR+5frZD9C5WKVcRoEaVSlh3kMnm
X-Received: by 2002:a05:6214:2309:b0:6d4:22fc:ce3e with SMTP id 6a1803df08f44-6d864dace51mr367606996d6.44.1733167920285;
        Mon, 02 Dec 2024 11:32:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733167920; cv=none;
        d=google.com; s=arc-20240605;
        b=F6Ei8px0KrJ5hmkv9gUD3aJp5uptqFYIT6TDcnw89EwXgn2xjKILWoOKvVjkLkhWQ0
         F1yFQcOnFhKECZ7xrCoQVUGlVaKIyOYql7FlKRV5FhYJtsoNP2EgKCoEBNk1t8rktc6m
         OklYgDBLHu1lzpYDt4Kjvf670TXRena+OhZmVYR4f3U1lDn8ENDBfAWeYMJ/eOaaaDq0
         o2AooKES94V+7K5pbr47Xcyh8/K6gFfUNzQ8dUFI5T0ofp1TP5GkWzr4cXZzd1/O+NIk
         anP19OyBgUNu92NLVmR0mnV5P0UIQTHcNe+hvJk1Gd6uevtqwLFl3bBnYVP3JtWGXL2D
         L6iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=dJKDN6jr8ySadvZWVKnSe65KLieSaHaKpkpZnZuooYA=;
        fh=UMlouvVl3Ph4Ne7UvGTvosqVcNxKyKMHDiGsZppDwks=;
        b=Ju68TOtHJfIAUSeo3zyZoVxGhIUwWtteLl0fXTq5QPk3sCLc801RBpj866p9CYNdq0
         YT7V0f84d9Urfb7bzxF698ietVXcvkG7J/3XosHzcsk2sbL+p+AXR6aZkPsF3uvqa+ML
         THTJClxdrXzl0gkOhF2r/EHmC7PEAMDIC0rrTF5+2VGCu9GFlft3VSiW3oTeLTX0tJpU
         5U/7Sd8Jj857Nour+xZ8eGloaALcZrh5eQUzGkTTjTNgRsknquiY+r3mqq31iuQqzE92
         QUJuEydYOjOEZ+E60a2AX8kdRUDNgpIpKCWUyqr9wc1tsw2XXX9ukElz8ZeBdoP0XQ2G
         ANjQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HgpX1y9p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d8aaf64264si29542536d6.526.2024.12.02.11.32.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Dec 2024 11:32:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HgpX1y9p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tIC91-0003UI-5f; Mon, 02 Dec 2024 14:31:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIC8z-0003TA-1G
 for qemu-arm@nongnu.org; Mon, 02 Dec 2024 14:31:41 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIC8x-00031K-Fu
 for qemu-arm@nongnu.org; Mon, 02 Dec 2024 14:31:40 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-434aa472617so39656515e9.3
 for <qemu-arm@nongnu.org>; Mon, 02 Dec 2024 11:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733167897; x=1733772697; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dJKDN6jr8ySadvZWVKnSe65KLieSaHaKpkpZnZuooYA=;
 b=HgpX1y9p1pxyooKQQLmeE5barmtU3jKZ74qY1ClqweqYk/sEr3vnO++s0JkL0XeYWH
 Gum6mIodv+pbefS8JMLIaQE6IPOpSSD4pfeoBCyyf7j2XJFtpRP9qiGU1OTYUVSVDV4x
 xJbTAgOJBJk3XSQGRtyQ8c7WpRC6eLLbajI7lsKWK1gYBrmi6ecjT95WmYwyTVPGggkk
 puuL8LZv4FR9QMAg4C2GQYvagPwIFy5DoNpDAAmSAvHfFvezd9GpQ+euRcw0cL1s5mCh
 FCvggSkJERD/dzNLBH9XXzXX1pTYED6k/ZYIBpqYo0kSLI+vZZH5HFDPZ2hnOJ5xnY6z
 DVZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733167897; x=1733772697;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dJKDN6jr8ySadvZWVKnSe65KLieSaHaKpkpZnZuooYA=;
 b=tH5ElC7zQPURX07cF59blce8Vr+1y0qw1CNG101SbxrDZzyO2EDtYOOtIwWWdAqFv2
 rhkVlhlwHnNvMT7RB1jDd1dJIa3hniTlmQaXUToQJeZOjSiBIFhdQmnms1l5uswfkZSp
 UG1fuRsW2mndm1Tzo+jnCYxEzWaGDfFUcvamVfPzD0d9O5tFeuAM3Uzy08wfWJIonFO8
 cfrwpxKQmqtCpS1/9AmzZhbxpogTGaaVUjDlJKW76fHfPZ4JqsqztFIBchHwrM+Vma82
 LYlBXpYovdA64r1pgEvSSrEWxga3nXWOwgZBn4XMZsbXTmsP6XfGMU2bOOQU59OXhApZ
 hzZA==
X-Gm-Message-State: AOJu0YyHTgmxnVX1Cc/tCn1nnN5nunQkptNJYUg3W48adA6zMxhP2fsG
 n7mO0ujMAppG1kWzByti3/A6jE9UNnOIn5MIOLioY1Q99bQuvt6kZpUJNiu5q4Se614NfWaEtpH
 K7wg=
X-Gm-Gg: ASbGncs8eg5qQxQQkNQTQEI4zaPw5d9Rj3h2Ji3tbdEWq+FcY5r9GY6SAR2T0VMcmmu
 skMrSWpDN10/Vt6Exp7s2A2AHNb60eK1D2xszSqEAvnFzssh0qcnh9l7wsFTa5OHkvYpOb2a5Bp
 LR64SqPYdCRcnLRt4osakCDKPL8WE6HD8S24pd3W34WYKOyARwoCt7i0Y1VCYM9i9FLDevxKwHG
 JOoJ6/8RKtY3YuvQ/k9s1d4zXpY/Pn+tgeHMIHbS+AMElvI8EZON9SLP4LiGXk7tAnsEtX8yIJ8
 3Rl+Bi6BxohONf3MPdxo
X-Received: by 2002:a05:600c:5102:b0:432:d797:404a with SMTP id
 5b1f17b1804b1-434a9de3947mr203187505e9.22.1733167897561; 
 Mon, 02 Dec 2024 11:31:37 -0800 (PST)
Received: from [192.168.1.74] (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434aa76b52bsm194768095e9.18.2024.12.02.11.31.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Dec 2024 11:31:37 -0800 (PST)
Message-ID: <faa05fd2-f343-4bf7-8403-5aeadd87fc79@linaro.org>
Date: Mon, 2 Dec 2024 20:31:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/67] target/arm: Convert LSLV, LSRV, ASRV, RORV to
 decodetree
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20241201150607.12812-1-richard.henderson@linaro.org>
 <20241201150607.12812-4-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241201150607.12812-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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
X-TUID: y36R8QgI8txN

On 1/12/24 16:05, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/translate-a64.c | 46 ++++++++++++++++------------------
>   target/arm/tcg/a64.decode      |  4 +++
>   2 files changed, 25 insertions(+), 25 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

