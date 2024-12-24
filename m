Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp4761741njk;
        Tue, 24 Dec 2024 07:27:33 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVh3bVWQykeW74IDfotnwaVGsxHneK+jTXy8EPkeRmcD0ov6wHCJWRAF9eVirdPcivmJSDRYHNfg2QrJw==@linaro.org
X-Google-Smtp-Source: AGHT+IEWour8H0VvYXLriHWrX6bff/SwfspY3zicvR6FRUoW3uipmoF8j1xtl53hPjAOM3Kwp4mE
X-Received: by 2002:ac8:59c8:0:b0:467:6dd9:c961 with SMTP id d75a77b69052e-46a4a9c7031mr278809701cf.48.1735054053349;
        Tue, 24 Dec 2024 07:27:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735054053; cv=none;
        d=google.com; s=arc-20240605;
        b=T1E0q9EA68NYnzTIVzs2KePYh6CkwiSogQ56h0IDhEbt1j6EVlR1ddMYavNSUCzc53
         tNvetV52mVJVCW+mo0n0sM9sXIKOIGJa1VB+O+lKSi1S0LT4CgB3ENll7qH4QCzwERJC
         9LacPV+c4LOny7DU/f/p9i8sQOZiUaXtbw8KP/7Yv7aIRt07YfoHhY/aL4PIOsMek0Vh
         Q4l/99MHUePqoGGFpkrBluciUcefMF9vdEUWqQuOtynoLUVIgwSgylC44ad481o3226Z
         L1Ij98d7KFL9ems3IyglgpPTKIt/QjyBZVkLj63mFBQtPoCAM9tc0G3IdIL76GC1NBJg
         55cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=JiLhIRHosJxOW+J0zPXeV5WBfWdG+502oCZ8WSyWqfQ=;
        fh=JWZmZT3fRjUImOAv6SBfCC9dFtm7ngdOqozPIb8R14A=;
        b=XW7BL8/sAkvzcWfLQ9ztcl9HyNyR+QmA1geJoBdLcbnC12ApEgRdZ6C2Podbo76v7a
         TrO4AtTZ77+zAEhPEhQc7enUiaMwzmRC2r4c7jd8B8vydG+dw7vE2EqG19EdjRZEQYzi
         zeZ9T0Quf6VMIyVdi6VzC37VFicD3hToVP+yBCBV01B02lY81BtAuc6rqaldFAL88Qpi
         S6gBFBo8G7OMeiBi+JrY1TtTik++MrGetNoisdBz43TsbXCB6sCW0JaCB4W0usp/IP+g
         uIMZI/A7jvBT7p/YRhJyFipOeIShwKULmqpTTastxa5zEKC7CrBtkDbApiWTA5MVZXQ4
         4Dyw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y8Ts4+wU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46a3ebc02d2si144654391cf.397.2024.12.24.07.27.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Dec 2024 07:27:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y8Ts4+wU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tQ6oQ-0003uE-O3; Tue, 24 Dec 2024 10:27:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tQ6oM-0003sd-Jd
 for qemu-arm@nongnu.org; Tue, 24 Dec 2024 10:27:06 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tQ6oK-0005Au-D7
 for qemu-arm@nongnu.org; Tue, 24 Dec 2024 10:27:05 -0500
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-21683192bf9so59394075ad.3
 for <qemu-arm@nongnu.org>; Tue, 24 Dec 2024 07:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735054022; x=1735658822; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JiLhIRHosJxOW+J0zPXeV5WBfWdG+502oCZ8WSyWqfQ=;
 b=y8Ts4+wUxpqP4HK0IQR2NdsJkn9VYL6xmqWGCrdlrExcP4EE8IAHGuK/8m9jHNMLH8
 rT9g1w0HC7W4I+QoNi7dyIAqrUvIroZLr0M/IN4ElvyafaYqArYIRgaeVT8C5WvBe4Mu
 oH0fywYLrNi6OkXAbn8ucZ6lzDW8z5CRugNgw+tpOXbqeQUEaMXa/fvcP6Kg4zT+iWDk
 qQD5vLwoAKq6OOEwYf1Obz/p8cUjduFHpqMm8pbVTJFF8X2xKadGBpyrHByg7rtapBJV
 pS5u1mWNR7d/cDaVwGoDSeMVn6lGxpoXcQAwRB1An4Ehu39qL5ojaOMZyPx7M8tIcdFF
 rY+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735054022; x=1735658822;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JiLhIRHosJxOW+J0zPXeV5WBfWdG+502oCZ8WSyWqfQ=;
 b=NkyIO1VfLqy+uSUhoRPMMOdqf4By1B/xKanAPxv9WbyngTi+u1tXVyZBu5OPe4TZVD
 PEdVouKSbKAUaJy2kdQ3KtxsAuPy7c7ySnVGc4gKy3LYTX3QI8ULcW1prymbejX/JLWD
 A6xdJg0G5W9d0R/GIFtPtyyUN1UD1BOVOQuWfP9skkOvjT1BLGyH/tqqzwwU7OlTA/MA
 vfs109VbfhmXyAbKsvdPvFnEHNEeCZ3OZrubWjGERJrlG+cyDiGS4Vb6EevQA3oRJu1H
 gOjCBw0u/rZuOQ/UvE3wP5PgpNn2v91Rpd34yxBUqn0VFsUyx12u604LboU9yu+nW1KJ
 bp3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtRAZ0ZfhzqNcpLJOVAZvYgKmFgA3gjsIgKSqTL12ySxeA4xHkXM7xvdA5g/Pxu2pJJtSIrp5AEw==@nongnu.org
X-Gm-Message-State: AOJu0YzaIkaF3lHsfGVJdJIOQ4IvEDmJm5QJqnAaUvSSxobVjBEWsj7b
 eDcNcYP3TazelUYH2Uk75rqazLCAEAoIZcFhUUgt/RkZi3vc4/W0dfbBy4zGKpc=
X-Gm-Gg: ASbGncvtjHJ571VOfx40aTFJCPa6mVMDm5cc0VdFAJJhFheqNsGc52C+QRoIXudbAf6
 1mK3QDrSctigExgJOqT/H5OcvRVmzW16mAdDf7HsolKF56T3Tq+6V6sONcDACy8c5UWhT14azxm
 ie9r6Vunp0ucJVb+m0QzpwzIG09Yf4cTXC58JH+PfqARCuL0SDlFURUSl7sac0CRkqU37XsRKXI
 yXzYYgUwKY50CY8RIozCUWQxNuGfAYjXEQQkRdwlxoTL4HvKh5+N5K3DpDyeEak6j0tVyXj7fVM
 wPB2jYy93DfaELgb41K/Y5Ni3P2Kf7BKLzltm3I=
X-Received: by 2002:a05:6a00:410d:b0:725:e5a7:fdac with SMTP id
 d2e1a72fcca58-72abe1ad517mr24785590b3a.26.1735054022504; 
 Tue, 24 Dec 2024 07:27:02 -0800 (PST)
Received: from [192.168.125.227] (syn-156-019-246-023.biz.spectrum.com.
 [156.19.246.23]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72aad8fb9fcsm9833136b3a.164.2024.12.24.07.27.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Dec 2024 07:27:02 -0800 (PST)
Message-ID: <ec72358e-76ab-48f6-ad07-adc6f6504ab3@linaro.org>
Date: Tue, 24 Dec 2024 07:26:59 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hw/loongarch/boot: Support Linux raw boot image
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
 "open list:ARM" <qemu-arm@nongnu.org>
References: <20241224-la-direct-kernel-boot-v2-1-3e8336c54c60@flygoat.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241224-la-direct-kernel-boot-v2-1-3e8336c54c60@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
X-TUID: qkGmuvYsnX9d

On 12/24/24 07:06, Jiaxun Yang wrote:
> +static int64_t load_loongarch_linux_image(const char *filename,
> +                                          uint64_t *kernel_entry,
> +                                          uint64_t *kernel_low,
> +                                          uint64_t *kernel_high)
> +{
> +    gsize len;
> +    int size;
> +    uint8_t *buffer;
> +    struct loongarch_linux_hdr *hdr;
> +
> +    /* Load as raw file otherwise */
> +    if (!g_file_get_contents(filename, (char **)&buffer, &len, NULL)) {
> +        return -1;
> +    }
> +    size = len;

This truncates from size_t to int, which will start to fail in odd ways at 2GB.

The code in load_aarch64_image has the same problem, so the best fix would be to change 
unpack_efi_zboot_image to take size_t.

> +
> +    /* Unpack the image if it is a EFI zboot image */
> +    if (unpack_efi_zboot_image(&buffer, &size) < 0) {
> +        g_free(buffer);
> +        return -1;
> +    }


r~
