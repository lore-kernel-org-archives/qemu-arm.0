Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4437550njb;
        Wed, 11 Dec 2024 15:48:03 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVvFi0yKkdcJ/S9zLZeeMxF+VLgBoi95mlGCRVpNBO+qY2/uElARfwFoE96bUz1RwtMJVkX4mGy0miClQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGQP6B7n/dvxxVp6P9WlqmeUg+PpKNQt8n8PogN4nvQG6kIQWaS0XgdGY66rOLrQqAuR3cv
X-Received: by 2002:ad4:5cae:0:b0:6d4:211c:dff0 with SMTP id 6a1803df08f44-6dae390bab0mr21575986d6.29.1733960882892;
        Wed, 11 Dec 2024 15:48:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733960882; cv=none;
        d=google.com; s=arc-20240605;
        b=QaFuGwPFHnKUgrvaDgt/SfyNqJwyLlgv71LoNre+tk0YEha7hLb7+4wadqno/NI9mE
         rcc8bJQScFmQxbSlwX1mMD/jKY5syQHPJ+bqmjVsVtSqEqZPwUajWik8n0XmxIpsVdhI
         AMyus4GTRkIlDWW1S4f+qrskGHM74rE6WMVvn3zkg6QJiAa7jw2H8GZx2GSvPdD0xThy
         oRTQXb6+aJZ35xmvinczJzQfxhUgkw1GdX4s/Q6LOZxf+rDWlhpT17EDftKf9k3v/Efl
         Om3S8W/TnxR4FFgl0bHjcupEEVjZ1EfH+azINdYM0DMGMEhmySO3JQzmCSmaBI8F2tSs
         MDrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Qkb8oD9u4TgqN+pxR7Frz6fjPra88BkSdEWP5k4hn+g=;
        fh=wDg+dCU61c2i/HZAqQAcKv041JKHkyzO31sFdAE9tqw=;
        b=LrORLfQpTZLGuIEHXuq3JZmbv63JFfzQ9ab4cUYKunmxzZYFQEgvjwKVQfnTXBsw/L
         2+LJxm1/jwzlbmgIXCw80vT2zI+dNHf9rKhJHpbdy0Vj8Jc4RW60gIdb7IKXNBDs3BIG
         5+wKTaz4mnCw7dlHiqWQxf0/cf6Tr8mUOw6p0x5Rqn14Ylz5fcK6EgVfSuxkaHZit3/D
         ngGVw0z4HXzwGoBmkm5zJHJHolbw0ZEmj7gAie3OjtPZntIS/WZM0cIl8JACY/fRZ1Hm
         MKrR8PRhpcUQv0X5XXDij9kSQOgpszs6vxI+9R58e36Tve4//7KclDt3aTddSrcizyDh
         MWjA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jvUIE2VC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d9016e113bsi117980896d6.543.2024.12.11.15.48.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 15:48:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jvUIE2VC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tLWQT-0007Lx-4q; Wed, 11 Dec 2024 18:47:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLWQQ-0007LU-9C
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 18:47:26 -0500
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLWQO-0000dW-SE
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 18:47:26 -0500
Received: by mail-oi1-x231.google.com with SMTP id
 5614622812f47-3ea55a2a38bso20859b6e.1
 for <qemu-arm@nongnu.org>; Wed, 11 Dec 2024 15:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733960842; x=1734565642; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Qkb8oD9u4TgqN+pxR7Frz6fjPra88BkSdEWP5k4hn+g=;
 b=jvUIE2VCbD1f7SIbnNqE2qDMtUtx3M3QQ5sCEpd9+qrruUARu1S7dd1XDcII1JD6gz
 qOGMJcq+D+TTQ+Yy8qNAco6mU2enPlaeKuEzIxP5xA+WpPsQFpU0OLHEK0yyqRAzWR6U
 VbA1r5NddAbi1Ot/1FGpO0k4J3K1Yl79aOxSDxk5+CbxSMrJT07K/dkVWPieNJgGr0iN
 qTNiN0bHRL8XO5mANfvGNelrA3RscT3EqqygyeB6HbzvTqlqcigQ7bSIKHmxlxuabqrr
 wRc/5+Q0QpbqI2dwJ2hEnHvCDt3pr0t3b6t2vBR/z/iSyVSodHFLRauiayr1MsQWW+3H
 TD2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733960842; x=1734565642;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Qkb8oD9u4TgqN+pxR7Frz6fjPra88BkSdEWP5k4hn+g=;
 b=Cqo9txRr24kmfVfGI87htQh+zWvL+jgAT+2YtsvVd87mqM5QvUnhBshxiTrn6jQmV7
 R/AN+Ks7L6Ysl8Y6gs53LqqxyNO/6GbwAOT8gGJHPFSnn6enO6vJ2YmRVaVeBpGHaGX1
 /EXNBacnS3UFLyFzK1Vm5LZ25dgU8WOTUQiAotNYKtNDRkU7DoHlXlK2eW/qUDot9t9N
 3UGNkErkcGJvYH1IFuYMvSDDh1PpnIWmojCsYNHG+suMT34bpG+mkc6WT/Ck0PWuSWi4
 IonqfQrIYi1h3QM2659+zgyoclqy/jZcFkxxUy93Ntekq+02XQMmorvoRPaAeAWLHqVA
 7bpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrcWaAlQgrDOGzLY6yx5LJo5BwyaEMonHDcy1WhS/0K0AjpEUAVs1NQUOxIxkOBkyXfHwgSPPK0g==@nongnu.org
X-Gm-Message-State: AOJu0YzusCjkRNtXBHSBjBKrULLaEomwc4UR/mNxNqTMUYEodpQiUwCf
 58qdgueijJrDZuQGWcISgLCntIj6TrCFUYvAyeS0Vve4wVkdvnobQKxrz8FBUwS5P5AyRQ5Shvv
 onRezHfTG
X-Gm-Gg: ASbGncs2BLFP8zfM1P8iUTc9TJJP2+hxp+NGs+1I1XmKCY9p92WZcT9EN7Ge0jxVfgO
 StI29K5eSIgAtwUwOcBtrULdFfwDqELT5klnHkWUiS6LXh1WgSbvsPSYOcOCi9OzXGIsXV86/TD
 OMdvecV/O/3gfewKli/ngwAEwIZRST6Wcq8wLYqvx3XoVgNEXoUZucWyKmH4P0/CmCsVorAJ15I
 Z8h+1OXPWqw3QNtlyoZjPd6Gv9GrqT6IRDIGETVmlcBDEtLYElRjHLM2MhFwRn+xHfJzwZd7eur
 pAbke16madRvosX/Z//Vk1o7ZZAS89Ys
X-Received: by 2002:a05:6808:448b:b0:3ea:3db5:ffd4 with SMTP id
 5614622812f47-3eb85d4c48amr3027896b6e.32.1733960842106; 
 Wed, 11 Dec 2024 15:47:22 -0800 (PST)
Received: from [192.168.4.112] (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-3eb076f8bbasm3517013b6e.30.2024.12.11.15.47.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 15:47:21 -0800 (PST)
Message-ID: <ff4153d8-89de-4e9f-b0d7-7ffa58ce7b11@linaro.org>
Date: Wed, 11 Dec 2024 17:47:19 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/9] accel/tcg: Include missing 'exec/tswap.h' header
 in translator.c
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org
References: <20241211230357.97036-1-philmd@linaro.org>
 <20241211230357.97036-4-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241211230357.97036-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x231.google.com
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
X-TUID: 5L/ViWK5IntA

On 12/11/24 17:03, Philippe Mathieu-Daudé wrote:
> translator.c indirectly gets "exec/tswap.h" declarations via
> "exec/cpu-all.h". Include it directly to be able to remove the
> former from the latter, otherwise we get:
> 
>    accel/tcg/translator.c:433:15: error: call to undeclared function 'tswap16'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>      433 |         tgt = tswap16(raw);
>          |               ^
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   accel/tcg/translator.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
