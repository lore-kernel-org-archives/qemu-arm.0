Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4443695njb;
        Wed, 11 Dec 2024 16:02:15 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUpwZk7B5fc89+iPJpZDU6gzrlOdE31S9r8vdL+3cDdZ2QY1Xz6vilWC9BLt7TaSLTKBQY8a8QZl3Izjg==@linaro.org
X-Google-Smtp-Source: AGHT+IGVVzAdRmg3n03mx1HOTvwPUI43j7jWg3mGB2JI6VUSs2w4ZT58Kjx3yGgVeZkJKv+D6fM2
X-Received: by 2002:ad4:5e86:0:b0:6d8:981d:529 with SMTP id 6a1803df08f44-6dae39abc68mr16655556d6.48.1733961734790;
        Wed, 11 Dec 2024 16:02:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733961734; cv=none;
        d=google.com; s=arc-20240605;
        b=lzSMinQSnzk7IOvMW4K4/VyljMC+DUfZ44/CZkNV5W6EQlKqMooX9/mE39jO0nHyk0
         ervs/+DzDc/2YIGY+LYPX6Anvyl5DI67M4qx3SOFQz068P/LVd88oH0nvPb8DbxnqboC
         3OBOTRKN/OCnsWCJc7erIIx7r0EN1hhVa58JTOGCqdtCZ7hblvCb2IWFwlvWbXH4tvXQ
         Nrf9BUr2oJRdVRfpX4xPPIBTvw64SAyVF63/+r/Zi3E1NkjShibZKFAs+eEdlTE7qwFD
         oNFs00AccpjDQnYQv9IQ0j8cCrnGi7SJ6KMFA/wvEGusWrOMVIOd8p8U7BgrIK1tdsC8
         iPxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=sVRgGvy5d/JHfX1dJN26eVayscbgTqwadYHspFmQe6Q=;
        fh=ee/CqfGKSRc4UKWltQ7wat97JaLwfyCwptyfOD7v62c=;
        b=QJBvyKQe+pjTJFRTvdp2rEE9T1yoUt4ATxWTVEguG7dN5vO/9S3F+jDc9yxY6j+rAC
         WvtdZnH6GVNwP394UtnbaX5gdiWDh9mDnjnoURI8hl3zC5vcTIEDRZuJu9xyBDJ2zHXC
         Ji3zIpC4IU+F1cH+BuJOXxK0kdxnMOBP74bzvJlLmTcFI50RWTmeIHB390LPKaZlNLPK
         EnOB73IvQ/0e/zm97lfxKDYIiVZiYatBpOE/B6XTwn9c2o9+NaIbpHdqc1V6fsg2uzj6
         6n6F2KfB1I4nqcDd0LLwyPtPAE48qu7zo4n7sKS/xw+oI9+YjA18ItPA4XhON+8Nmi/P
         zuYQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="yFa8Sg/9";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d8e6b89f69si157325626d6.40.2024.12.11.16.02.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 16:02:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="yFa8Sg/9";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tLWec-0003iU-El; Wed, 11 Dec 2024 19:02:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLWeZ-0003bd-3H
 for qemu-devel@nongnu.org; Wed, 11 Dec 2024 19:02:03 -0500
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLWeW-00032f-I8
 for qemu-devel@nongnu.org; Wed, 11 Dec 2024 19:02:02 -0500
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-71e1e051e50so25223a34.0
 for <qemu-devel@nongnu.org>; Wed, 11 Dec 2024 16:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733961719; x=1734566519; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sVRgGvy5d/JHfX1dJN26eVayscbgTqwadYHspFmQe6Q=;
 b=yFa8Sg/9SMczmF23Wxh/Icvcsmpa181xiNnqbQ4Df33WILIZR3bqMR5b79gQtvSTIB
 cRYgh9gOQJsRcrbDv+QLlBhpKQ7gOcaAL9i7lJujC+1TgI6ATOJB4HLoEFkBvSBKgAxR
 4Uxr6hbS4bm5imRxKIXYoR3D6Q5FI3MLFSj0cgTPPbTEMOr1T1z6RjnesFJ8wJibR3Gg
 WGgq5avzg9l0nIIBemXNzC66GakX/rTPmTq1ZSouKwxCUtOyJTGFDx7VmE1MLg6Edy//
 vLQkSPmwv3iDtu1ItOJRVZDdGoxaYW2//qyEhWigYDr6+PM68x70pyS5MvM2Q27Y9HYK
 B1xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733961719; x=1734566519;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sVRgGvy5d/JHfX1dJN26eVayscbgTqwadYHspFmQe6Q=;
 b=MXvMpGbHHVThDBiV/0vCkq2EZd/Mn2vi01qTVD5BrFhqtw5lkP7P9L4I9N0WS1M+jT
 /u46CR4umCJ/t4KHTo88OelYXxDUiGF172IMEOkSV+Kcu8Sc3kjleTlS9Wn+WHkE5yU6
 hYdxP25zZKsr6s+YQ3Hz1OtlYNT2uxrf6oWdjR7z/kinodBpXDqaM/xLtDNJevFmPs1l
 XG8BdldRhEeA4Ic+Cc/MpEPOLRAH6vpI+TC1r1u8tTWrWWGKf5RtWPh7/oM51d4OrcMF
 TOJ6GuuLoV7XWbOxtC84K1uPtULQzFUkeLNkCgftUM/txSworwDTokKso7seKbRyEW7D
 LHwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMbjv95SWlRkJCQbWa50GFfCdVNdeyYX4bo05A81K3NhrUQfgbvBXSlsutPaEB0Ci6L2gRfdLsJxmP@nongnu.org
X-Gm-Message-State: AOJu0YxHqio0kYHMsuusvbR5+o/QhG7xATjikp4PSlPDZyZe44VzlXq3
 u0sE5etBEB3xppNeYnOR4H+pCEmq5w48WxumV+FEChbwF/8iEStQopo+QtQqznyV5fUksLeJyZ2
 x2ZNHqdvY
X-Gm-Gg: ASbGnctXhsC1mgQ8jLTjeLMnWTf/b0yg2l/HPtdtBcmmilGJUMHoDom+9pR1ilcYK9N
 /j1JPPN6CigqNhx7kzvVPKMm+N/S6ntzhJqrObShLTqmOrzLe7NPrwxtxWH+hOa3Y4m4SL+Z6Jv
 EKIlKiFPVcWg0LZTxZBPh6OACnVKMxMgk7t3U+oxiyD2YyUy99O/fXVn5uiICd+JkO2XUuCNzhO
 X91IRx7HhCRrTXbsd0v3Ggrg047KOM/TT1dVxFG5BfPTvUFtD1VMexOLnNj+0X0OZyK2NCj4gM1
 LCCObeCa0uBBr05QhUFuRjclqbwajjR/
X-Received: by 2002:a05:6830:3695:b0:71d:e0b8:5f0f with SMTP id
 46e09a7af769-71e29ef9945mr876345a34.29.1733961719265; 
 Wed, 11 Dec 2024 16:01:59 -0800 (PST)
Received: from [192.168.4.112] (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-71de2a7767fsm2388689a34.2.2024.12.11.16.01.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 16:01:58 -0800 (PST)
Message-ID: <a2df2f59-0cd0-4e62-ba9b-3ad2cd4db3f3@linaro.org>
Date: Wed, 11 Dec 2024 18:01:56 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/9] hw/mips: Include missing 'exec/tswap.h' header
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org
References: <20241211230357.97036-1-philmd@linaro.org>
 <20241211230357.97036-7-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241211230357.97036-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 9FdSs/SiQUf+

On 12/11/24 17:03, Philippe Mathieu-Daudé wrote:
> Some files indirectly get "exec/tswap.h" declarations via
> "exec/cpu-all.h". Include it directly to be able to remove
> the former from the latter, otherwise we get:
> 
>    hw/mips/malta.c:674:22: error: call to undeclared function 'tswap32'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>      674 |                      tswap32((1 << 31) /* ConfigEn */
>          |                      ^
>    hw/mips/fuloong2e.c:89:23: error: call to undeclared function 'tswap32'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>       89 |     prom_buf[index] = tswap32(ENVP_VADDR + table_addr);
>          |                       ^
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/mips/fuloong2e.c | 1 +
>   hw/mips/malta.c     | 1 +
>   2 files changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
