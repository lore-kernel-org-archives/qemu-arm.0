Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp6396604njk;
        Fri, 27 Dec 2024 07:16:45 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXYWZawZibcV/QgHHqEierVpsNqu1+ZQkTOi/I0J9sCiYp1NTnLtGSGwNmsLy9/iGD1XR8xjV49GoRJpw==@linaro.org
X-Google-Smtp-Source: AGHT+IEos3WNccZpf/YKxn530UPdi0TRN1kQ2ZpTYOtu7MeFM3qpUsJzdhQ0rQ1s6UU0sAH2XnZA
X-Received: by 2002:a05:620a:440b:b0:7b6:6c33:994e with SMTP id af79cd13be357-7b9ba716aa9mr4245655785a.6.1735312604880;
        Fri, 27 Dec 2024 07:16:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735312604; cv=none;
        d=google.com; s=arc-20240605;
        b=Xxmu847+pI1CE7iltaNb45ePLL6RrXvMTtscSESzYCTepaKifxAL0u3YkT07Fc3XS2
         YzqqlS6jts4ZYaxcZTt/6q6BvXEB+dAvLubq+vC4Vfwv64BUnRsoKAjT43Lg+N40FiB6
         yGiW5r35hIIRbj90i1lM/b975l9J0yYmTj14+OcKdm9ts1PWJcX0ySm34gZDF8L+uzqj
         lOrh8BeeXZRi/YHnOF+UFgk5RXSohYZ4ua4Q+kA5a70Omcv2FynrLzwSmrii9hVKMEaz
         tm3p+hjY03YZ2RwyH/1SZjH9YDdWryQ4GXM3K+8knbkh23pwxX8oE1v5/E3Ysr6jGPnJ
         xLxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=+49uq6Owt+Wr3uOM6i+R/bpvzi6JUtTTruyFT4JG0c4=;
        fh=OO1WZ/0dpeBmp7I+UrycjlMK/7LyLzdHFJ68zXEpKUI=;
        b=aqaQvIsAbB7jlN01R5oz+BBqTIsIMqKmt464k/0xgcdNMbqnU73bQ4Wqn32l4BaCvf
         xYszpjhbhn0Ctd5VDFoWrSTG1/i8hyr/FnHX0Z3iMoRoANQdM28hns+V69iC32CaTTzm
         qZ9xAQLW2xtSLOvydDp++8NLQcouPykmZBxsz8qUufp8qmqCZrwXZj6Xt182w58FC7vP
         5SjjFdXeV8stqW6GwOTdeGXrhbbLRyHtNSRSo7kU9Dfk3DCWCRafnGmEmDTdIAJUKFPS
         5WFYgT56QXvGhw4ijpil+JBvN2VMiqx1MmiBDhQxk6fMUpvrp6qTehR1WrK8g97l4T+g
         K2Iw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BmkjIuXu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b9ac4786afsi2296170185a.307.2024.12.27.07.16.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Dec 2024 07:16:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BmkjIuXu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tRC4o-0000rU-JR; Fri, 27 Dec 2024 10:16:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tRC4l-0000qu-39
 for qemu-arm@nongnu.org; Fri, 27 Dec 2024 10:16:32 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tRC4i-0001QA-UN
 for qemu-arm@nongnu.org; Fri, 27 Dec 2024 10:16:30 -0500
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2165cb60719so90549685ad.0
 for <qemu-arm@nongnu.org>; Fri, 27 Dec 2024 07:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735312587; x=1735917387; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+49uq6Owt+Wr3uOM6i+R/bpvzi6JUtTTruyFT4JG0c4=;
 b=BmkjIuXu59tenGWWe2zxM6hCELoGciT4PIOMON/o1cVrWDY1JFoyhA9YrqASt4eJ4m
 btvLeVXR1sMAzMSYPE74CwOOcbVhITq7c6o33omKy+ol2IUpc4M9HyM5aaDaOO3vv6pu
 E57//WjhULA7nXAJ31xRAADPK/yFIR8H2vkEHpSt+gwfhTvTgyOznvit8tlPgS++z+IR
 7PAELfygo24rj685XkjTh7fU94KxyLE7RxNp4dXQFeWatCMvc5KsGv9Md8q+SVtujZEf
 RNFd9xa7g7XsuirY3BRyVT2AOvgxWdEjhUlCS4+qlOh4Pifs+h8XSLpvYWbk1QCbTjpR
 NqSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735312587; x=1735917387;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+49uq6Owt+Wr3uOM6i+R/bpvzi6JUtTTruyFT4JG0c4=;
 b=Sf2VgL2hujLfXRh0MGMMqcR8E0Ma1yLVP33aoYUvxSeZkNv7BFDu2ksxv17h37nmfa
 NFaEaaiAEM5PxJ/FBnsAHc2uO+tJe35ZprQyefZBJNgBhTQRyYp1MTEBK0AjeWr+0j5p
 DrkVKV4vZyA5BE9D5kEVeGpiD7aAy4YbfQPL/rFPoKUwYLd5exHtnS+o4i2w1UatgDjz
 WCUiq9E8FQilTsvAL/Fk8+t6+xAIGa8QY6pQjBeiUw6GwaU7o+l+Npsir1QixQxWZM1T
 w5BL7cz5ZzVXlXpotw2lxYWUn+tYPgEq+PEM+kLA9erHPvtk16UYCwvSPgrASeRtam3t
 EBFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeTAozdb47eDhtvEOtwPWDdoJ1STG79L0oDIHJRojeZva2tSoTUJ1aKxYZYHNyNDNAyQDbxrlNdQ==@nongnu.org
X-Gm-Message-State: AOJu0YzsBnuLZIAoqXm7r3i76MON7IPqGEjYhPN3ZcYTasRLxQLDq63v
 EQqVTeAjJGcsQi1DLYf4NRckdg1XK1vOaGh4Q/qP6Jt/m8GCLjIKyp1M4hhLzGQ=
X-Gm-Gg: ASbGncuH4Lh2hNvm0iGKMyiT7wDGd/NYb1fCrsgopj/ew+En2URNzM0HxHv2mA/ymSf
 uaCUBNkmICX5pHJK61VSHcxGYRwRtsnQ7aPHmuZmsW1rCqSEv1uroFHaqwgzjJfdEpiLWvuGHGp
 FQGB1WKIWLs+BjdzDXW39Ll7dHyrM7AAcobwt+uwe0/9ppfO5mvwIOfUZVKV23bd2ITlfwPbH7i
 smag35Et8JoadcJGXVnPA3ja2iDAFsmg0BVNN6Sv4BfOqeTfrWyN+Nk5jQ89OB8vS2gB8iAwxJq
 TIkSPCe8jg7VCjN9Tl7aa0oIIJAI2I+3z9uQ6WE=
X-Received: by 2002:a05:6a00:4485:b0:724:e80a:33a with SMTP id
 d2e1a72fcca58-72abdebc149mr43208812b3a.23.1735312586750; 
 Fri, 27 Dec 2024 07:16:26 -0800 (PST)
Received: from [192.168.125.227] (syn-156-019-246-023.biz.spectrum.com.
 [156.19.246.23]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72aad816540sm15185407b3a.22.2024.12.27.07.16.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Dec 2024 07:16:26 -0800 (PST)
Message-ID: <8ff6dac5-067a-430e-90c2-67e07ba221a2@linaro.org>
Date: Fri, 27 Dec 2024 07:16:22 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hw/misc: use extract64 instead of 1 << i
To: Tigran Sogomonian <tsogomonian@astralinux.ru>, peter.maydell@linaro.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, sdl.qemu@linuxtesting.org
References: <20241227104618.2526-1-tsogomonian@astralinux.ru>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241227104618.2526-1-tsogomonian@astralinux.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
X-TUID: RvjQPnjgz2Of

On 12/27/24 02:46, Tigran Sogomonian wrote:
> 1 << i is casted to uint64_t while bitwise and with val.
> So this value may become 0xffffffff80000000 but only
> 31th "start" bit is required.
> Use the bitfield extract() API instead.

Again, I < 32.  There is no overflow.  The type of value is irrelevant.


> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Signed-off-by: Tigran Sogomonian <tsogomonian@astralinux.ru>
> ---
>   hw/misc/mps2-fpgaio.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/misc/mps2-fpgaio.c b/hw/misc/mps2-fpgaio.c
> index d07568248d..04a3da5db0 100644
> --- a/hw/misc/mps2-fpgaio.c
> +++ b/hw/misc/mps2-fpgaio.c
> @@ -198,7 +198,7 @@ static void mps2_fpgaio_write(void *opaque, hwaddr offset, uint64_t value,
>   
>               s->led0 = value & MAKE_64BIT_MASK(0, s->num_leds);
>               for (i = 0; i < s->num_leds; i++) {
> -                led_set_state(s->led[i], value & (1 << i));
> +                led_set_state(s->led[i], extract64(value, i, 1));
>               }
>           }
>           break;


