Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp2032236njd;
        Mon, 31 Mar 2025 04:20:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVDQ8x7iz+XccYYOzffHbD5oECo1oPuO8HNsZUVzRR54cj1RQn9GwyyHxYsPg6pmxcZTjThFvhUkfgFRA==@linaro.org
X-Google-Smtp-Source: AGHT+IG6sG5UpsHnhCHV1cYgCwALMR+AzkzW8LqyOjnfF6Jnw4bNthWeqipgHhWDvfttAEbHcRND
X-Received: by 2002:a05:620a:472c:b0:7c5:9a1b:4f22 with SMTP id af79cd13be357-7c690892efamr1387164685a.56.1743420037658;
        Mon, 31 Mar 2025 04:20:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743420037; cv=none;
        d=google.com; s=arc-20240605;
        b=aWYlIOGK1T4MqFqPv1ThxB6Qa2DdZXbgmEwXUQdpIGY8t4C5qCykaOvoKkwilv2E0S
         MiXe1eo6IsG0SxFAlV5TthWD2eb63uCTIJGf0354zcItmGjW3YeQb2L7nN5bSXAwP4J7
         6SYVMOK27whiGgQPwY6HYwpzHVUc91qnCLdJJ11S/+RRLjytdDXbQiHTDpjUmNV7yvJK
         aCg7KXRRuutv7g874Z0UucGwUFYjeL1t6Ip8G/gQ8gSxOYmxJihRY3rdT538cWegW0pK
         Yzi51lrKppHDlJlRx8f8tdJ0ObL3kIYhZcKDsJuYtfOth6Z+ZLEBaaVJh9kvaoe0RESs
         8lBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=FMVHqsTPretwWz7FUkx1jwwFQduMUsmy4P/isUnCU/c=;
        fh=EJp+Pv4qTfYfhvJRIMGT4Ch+t/DMJHD9202OSz+Ev8Y=;
        b=LYpYsdfO812VKuheFybUCSn9IodP1jsm/70BukEQubdk2euTzmiVLky7W6TXqTu/lp
         HuSbajqHrV8xpEAMnjpRISFI5QL/PAv5M4CZHwHchwFj2YTeTVqgYoQdbdNJOpWDNLzM
         BovdcVNut+iaAKf2n2nrR/LezmP3n58n8xHKGS/QynDq8fFPtNQl7I18stIqlifJVNpp
         jhQ4SPWu9Nw9Wvr+jHN8VZkehMLuMcylFazOyswKOolL+XbFd50sGHB7Iy1yZejHLMlt
         TrVfBUwbAweslYXqYp2XoRqd/mZ8pzpiRtencmj6at9Uw363+6lE/re+d2RpgCdnFz1Q
         Jucw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xVEcvzke;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c5f778cd9asi647886085a.404.2025.03.31.04.20.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Mar 2025 04:20:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xVEcvzke;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tzDBf-0003tU-V1; Mon, 31 Mar 2025 07:20:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tzDBd-0003sv-Fh
 for qemu-arm@nongnu.org; Mon, 31 Mar 2025 07:20:13 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tzDBb-0005Pv-P5
 for qemu-arm@nongnu.org; Mon, 31 Mar 2025 07:20:13 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-39c1efbefc6so198461f8f.1
 for <qemu-arm@nongnu.org>; Mon, 31 Mar 2025 04:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743420009; x=1744024809; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FMVHqsTPretwWz7FUkx1jwwFQduMUsmy4P/isUnCU/c=;
 b=xVEcvzke8PRAoW4JtX67Far7ieY82+u/iGAJ2PgBv2qp1lNcgbUVWIMSnYh1If85Wc
 n5lUJTkFaPtRBAXZDlQ2kQIn6TmIweAe230MwmQ7jD1RWxMPf+oHoXBonnM7CYwijl91
 eeurKigVH6DTsYlgTpnYnuvja/5h6xGCuGIjAdR815iaj0yTmvNjPxcAzwrXcQB0ZAcd
 yviaYcKn2LyCsApq+pg3NoEHc37c8vU+4fOT1Ak2DtGwVmZvM6X3iWgXXYizaJ5FsEJD
 ZHSv3M0AbojKYPl2v2xvAxFkCRm7CO0FAOyXGYGI4GDsGbumoyx4qvcLFOErQ+QoxvLa
 K5Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743420009; x=1744024809;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FMVHqsTPretwWz7FUkx1jwwFQduMUsmy4P/isUnCU/c=;
 b=mHwo5tA0Sdcq8yELuQubm55SRPN5jrFrIxXf0RYW9OGSI1JLSc0RqCclhwXlNKMV1H
 y4AOc14jGzeZXFyju8xy+70ArxpuITc4atgg7gJa+weST5MFaWxUB8inHKPMv8t2pbBR
 dti1uKu0w9+y1zkjL8nIoULCVm6ym2QFGVMGvxuyEsSCn7hORhLx1gDuFC2c3AhIExL/
 FkuWaxWX9FYW6cZBfC7utWbOs4lhHP70KAkuR0+o2124E+kTXs+zL/kAmqGkNamWDgFk
 +MfWrbGjWgtHZRgJDMkRl/SHCQYvwCLqu6DwXqW9F4qUVW8t4IiHXkEitT0dgTHg6zlr
 M2jg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhrjRBtLCMNIFvgqY0wfaUGpuV10bow2Qkbb4gT1b3YVnkJuXnMA2wABIVko7/vraiTLt3IkFcEw==@nongnu.org
X-Gm-Message-State: AOJu0YzbpHer7enfgg/g5CUS56gDhAWhCT1JGMYKmxh7bHAz0N1uBiwq
 YJyqatu8L1pdmYCVgUXJzYrTef/zGLcFUKr6UNbQZNLDnkA3+9sJ0ZNFl17isqU=
X-Gm-Gg: ASbGnctarv+6BZWQEsI46n9lG8QJNX5rXm0TsZD1X+dRJfxRJdtOtieYVYijjdW5WEo
 1Unm2dIdKxoztBWeNwnhWijE+DQQvbl1yHVvD7+ng+RxhvWuMzQOk64x9R7cm9pd39OJ3XWVX3N
 M7vsUQS/OXUFXwZdmeOs1u/JD/dcpnzA4zVyS9KHY4obCUsLllvGNkvYNu8y5CeAJq2MuO5pW8Y
 jvNz0OXZbU/k4BedMF4jUzP9yMg6r0QGLZpDNKZgFa+B/QpB4NUvijf/O9B9irgx6Ue8GLsA+4U
 M/xnwh/hfENNY8kL5Bwk7JPvrwgD6dW+kXtEIfw5xiq9mztTrq3VCMFVlMQum/MUvZTWmMmoSvy
 AfzYl8kLPqINO
X-Received: by 2002:a5d:59a5:0:b0:391:4743:6dc2 with SMTP id
 ffacd0b85a97d-39c120e3bd7mr6316117f8f.25.1743420008844; 
 Mon, 31 Mar 2025 04:20:08 -0700 (PDT)
Received: from [192.168.69.235] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b662736sm10812996f8f.22.2025.03.31.04.20.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Mar 2025 04:20:08 -0700 (PDT)
Message-ID: <7c4beda4-7f0f-46fa-98bc-52d6abe21ab4@linaro.org>
Date: Mon, 31 Mar 2025 13:20:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/char/bcm2835_aux: Fix incorrect interrupt ID when RX
 disabled
To: Chung-Yi Chen <yeechen0207@gmail.com>, qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, marcandre.lureau@redhat.com,
 pbonzini@redhat.com, qemu-devel@nongnu.org
References: <20250328123725.94176-1-yeechen0207@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250328123725.94176-1-yeechen0207@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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
X-TUID: HTrb79GCfAZ+

On 28/3/25 13:37, Chung-Yi Chen wrote:
> This patch fixes a misconfiguration issue in the read implementation of
> the AUX_MU_IIR_REG register. This issue can lead to a transmit interrupt
> being incorrectly interpreted as a receive interrupt when the receive
> interrupt is disabled and the receive FIFO holds valid bytes.
> 
> The AUX_MU_IIR_REG register (interrupt ID bits [2:1]) indicates the
> status of mini UART interrupts:
> 
>      - 00: No interrupts
>      - 01: Transmit FIFO is empty
>      - 10: Receive FIFO is not empty
>      - 11: <Not possible>
> 
> When the transmit interrupt is enabled and the receive interrupt is
> disabled, the original code incorrectly sets the interrupt ID bits.
> Specifically:
> 
>      1. Transmit FIFO empty, receive FIFO empty
>          - Expected 0b01, returned 0b01 (correct)
>      2. Transmit FIFO empty, receive FIFO not empty
>          - Expected 0b01, returned 0b10 (incorrect)
> 
> In the second case, the code sets the interrupt ID to 0b10 (receive FIFO
> is not empty) even if the receive interrupt is disabled.
> 
> To fix this, the patch adds additional condition for setting the
> interrupt ID bits to also check if the receive interrupt is enabled.
> 
> Reference: BCM2835 ARM Peripherals, page 13. Available on
> https://datasheets.raspberrypi.com/bcm2835/bcm2835-peripherals.pdf
> 
> Signed-off-by: Chung-Yi Chen <yeechen0207@gmail.com>
> ---
>   hw/char/bcm2835_aux.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Queued to hw-misc, thanks!

