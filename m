Received: by 2002:a17:505:d21:b0:1be9:327d:8ee3 with SMTP id vh1csp1585994njb;
        Thu, 9 Jan 2025 06:53:18 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWZ6FJUK42k/qiTviOeS58OcHcrNbAkPxLXwIwNukIz6IPWCOMchs5HIzWcZmRKwvVkKDkmChzrEG4fmg==@linaro.org
X-Google-Smtp-Source: AGHT+IHF0CVR/cp/nOk4114a7mj2G9S8JI8IIUvpx00eHm7fDyjoNyXvt80LwVvRvDxsxk2Xfm+j
X-Received: by 2002:a05:6214:5290:b0:6d8:9dad:e167 with SMTP id 6a1803df08f44-6df9b1e400amr50384566d6.15.1736434397944;
        Thu, 09 Jan 2025 06:53:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736434397; cv=none;
        d=google.com; s=arc-20240605;
        b=fBTtOv3VeFx+1xfO87A8FyQCWGOcDZxg3ryszyuA0yiXVMIOoTJ5ItcwfhWrGbraOP
         yeP28fiSVEc/1bmFO29jDc0gdszQPul9fQ/xVdkZ3U59ia/O+/RXWcnhH4tSKma04n7m
         LSoaZfQSPWLTYPDmY5+Oi5+a1TQPQgZ253FPoDhQa6A9857AG7vwWDLqh/GiNnL8vpo3
         MbR4Q3I20LUe4H9/LIUlhWPc0fV6dldU9GsZfphB2qIeNipI912T3TBagGqd+TaEM7WN
         /0kmpfDIBdr2nj6wNGRTBTtQfUPGW26pGyVe6VIjIXt4MCfbe4XkZUh4Kj05JvbqbYw/
         p50g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=8QsK4KXF1E7/X6QsB304xmd1cWqss5CHHaY4U1DLHv0=;
        fh=MSfbeBEp7VIFPOZZbqcxG2yfYINTxzNFQEsXl+MFaI8=;
        b=W8qNIO3YjB12FDSI3RXARxv/UrA7ua11gxy0fnAYXd7TjMSujZ8f60LnpUPkY14a19
         3PaCgN9ahvScNQazBULBPS4+xPJyWEUPcwtX3SjYbYq4bB+gSp/Og4qE+ttUTIBeXVWV
         a5n7iYhgU84nlrMHXhot48ZTiMYTC9k0InksVljMOvdO0hW1elj9/bUD7HYQZqiV7PXY
         Dp3EIHvUXQFiEArsP90A7KXUOUCXfcLO7MvVjRaXZIczgWspcw5B04qKCHbeY5e8ums8
         rsfQUJn8B3lk96j8H2y3UcxBIglSDOLNxkeo6vbo4Hb8IB+qGSeTVC/CgVa+vgK43Htw
         PNFQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=frlrzmY6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6dd1835a4dfsi492491506d6.415.2025.01.09.06.53.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jan 2025 06:53:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=frlrzmY6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tVttj-00069I-Rw; Thu, 09 Jan 2025 09:52:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tVttg-00068p-8M
 for qemu-arm@nongnu.org; Thu, 09 Jan 2025 09:52:32 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tVtte-0000QT-L6
 for qemu-arm@nongnu.org; Thu, 09 Jan 2025 09:52:32 -0500
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-aaf57c2e0beso201891266b.3
 for <qemu-arm@nongnu.org>; Thu, 09 Jan 2025 06:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736434349; x=1737039149; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8QsK4KXF1E7/X6QsB304xmd1cWqss5CHHaY4U1DLHv0=;
 b=frlrzmY665syEJ6q8kvxY8iPFXaNB2KII8Jy/TPp28IffIfADS33fUjlOsZqawO+7H
 2NfCni6PMeMeI9X1VhIk5hnboBYR4DjGAxL6qgZlCBFDd9seXiVlUX6futdF0Fc0fB8/
 8J09rrnjjJ1g2xpf9kbROyQaZc4lYecaCaYhGUMyr9kQriutt9yJIN758+H1HFFS9gMR
 0QR6ISYHJ5EqL4x7WuGU/gEEcGIA7FPw6m5yx0zvqnNN9VBfV83M5syXcOP+pko/xM+J
 s4CeRmx43oKzoMr4MdUsDlu4uapilDvZptzsiHMe13/mP59Dj56p7Yo5Gof4u/3okz/y
 FI1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736434349; x=1737039149;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8QsK4KXF1E7/X6QsB304xmd1cWqss5CHHaY4U1DLHv0=;
 b=cyrHJ4DOWclvpZyshL/1zr1aI/EdTIsGiDGjFdp33GyZYMP9kOb0zwZILIHIAsfO7T
 UhHeXoKephx0B0g0Ub8DLZRn4iLPwZjMxSU4Dx2Mw2Ei9LTXIxdcIAXecXYFuCy2JEZX
 9gVyBxGnhnX/7M4KqvKIIbSSi8XtLi1nVJXB4oHkA1H0F8zvFz5ZjxJ5JmoU8Fa5cNvR
 K3wCL0ZQvIRgkdBRnuRXlOI+JKSzc9+kooojHn8AvvVjMGvkMOdUzpYo3297CPqeL1rs
 Hg3EWauCgzm61h608kO0tvuVjAumADzuenKpIjnBiAMQZU0zyC7Dk16sRYSw/NSeTsSP
 LNqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXlELZHSc/K4+lKaPKSBhLaQszdQv1rDPgBMGIE3UbkYIskVqHCujMXDD459wJNjXyZAFKJq32Ow==@nongnu.org
X-Gm-Message-State: AOJu0YzgZmNTC47xE8YLCLlGEF5/znwzjnfZdvmipb9V++GsEBugSTuK
 1P0MtGMK6+/8rrWTM2IrXJMsNDlN4T77zmnKYYyRMsSUT73ZrJk9MAIFWF2CV7A=
X-Gm-Gg: ASbGncs5ihsQhW8qk6EWDwrvpl2cmbP43E5aiWRBA20jV1TEI6lcRqTmOQSTwOAK/mm
 mkjps+XKQ26/lf6f8fZN66DZBjgx3NYfCz+vUsDZGjlUSCd0qu6kBsyLuSilOWYUs9HqelpR+Ib
 13ioVJC1BtKT/dKHMcxPRmPTvvxFmrxZlKeBlnVRX8Rkv90gheHv7ycS5z2ImBgN9l+jTzOiP7A
 pJVMwnqbg8wlMi5Fz8PeVK/2GzwYcyTq9LdBdH9GXyr4+HNYecGW6kjE0AvUCuxJqWDUBp/+NsR
 VfijKMMD3xaofg87tntyIFPWmfY=
X-Received: by 2002:a17:907:d87:b0:aa6:7a81:3077 with SMTP id
 a640c23a62f3a-ab2abdc3649mr739964066b.54.1736434348935; 
 Thu, 09 Jan 2025 06:52:28 -0800 (PST)
Received: from [192.168.1.74] (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c905ec66sm80158666b.18.2025.01.09.06.52.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2025 06:52:28 -0800 (PST)
Message-ID: <1d775199-1182-44ad-9545-74c58ba057d2@linaro.org>
Date: Thu, 9 Jan 2025 15:52:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hw/char: stm32f2xx_usart: replace print with trace
To: Nikita Shubin <nikita.shubin@maquefel.me>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: Nikita Shubin <n.shubin@yadro.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20241220084623.1889-1-nikita.shubin@maquefel.me>
 <20241220111756.16511-1-nikita.shubin@maquefel.me>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241220111756.16511-1-nikita.shubin@maquefel.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62e.google.com
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
X-TUID: ZqguTSAmPcaD

On 20/12/24 12:17, Nikita Shubin wrote:
> From: Nikita Shubin <nshubin@yadro.com>
> 
> Drop debug printing macros and replace them with according trace
> functions.
> 
> Signed-off-by: Nikita Shubin <n.shubin@yadro.com>
> ---
> v1->v2:
> Phil:
> - fix typo s/recieve/receive/
> - initialize 'retvalue' with zero
> 
> ---
>   hw/char/stm32f2xx_usart.c | 49 ++++++++++++++++++---------------------
>   hw/char/trace-events      |  6 +++++
>   2 files changed, 29 insertions(+), 26 deletions(-)
Patch queued, thanks.
