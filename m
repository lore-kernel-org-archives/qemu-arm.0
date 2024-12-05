Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp308084njb;
        Thu, 5 Dec 2024 09:45:41 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVcoQWCQVR0JkyORM1knVDOWIGSv6iVp6gnmGI71uHBpXDss3LFMEzChQaegdIHuwi4GqPPjmUhzi8okw==@linaro.org
X-Google-Smtp-Source: AGHT+IFOoT0ExBZxS9PgMrmzDboY4ee7oZM/43DzIJj2Xwj4cuaCM/VUl4o2/AKITJOpNn8xrBdU
X-Received: by 2002:a05:6122:3c83:b0:50c:5683:ad56 with SMTP id 71dfb90a1353d-515fca07073mr253294e0c.3.1733420740916;
        Thu, 05 Dec 2024 09:45:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733420740; cv=none;
        d=google.com; s=arc-20240605;
        b=EON6HFCCe/JMK48xcM6Na6j9bKoY64/J0xvEOzXs8Ch1RGIDDEPvwDgc6JM0D8LVH8
         JpEQSHlGG/CEo6KVyV6aKvv56uIbcHDApDNW3TG/3UKx22ec25eNNvR2/HNqd1LYiX8i
         RaJ38z1cId4YVnxEOrc58kvDxBaRESa9bPefRXdJk2vDmBIETdhI4YMtCCm9s3qh5koT
         KjdRAYFwwP+Ixz4ntVm779YJTgDy8c/w6MjEmWMnIEeSxwZ7L5zlmqnHgkjQCrV367Vi
         G4plwfqXq63Y+b6OLR+HFmaoV8XiXRtxPyO4RIPW5euVR5qXAnJQTslH5AldB9KTC/e1
         6UdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ipdLw07BS/sO3vHv/p4tnDEU/uwUsHEk/607BUAv6jU=;
        fh=/XbTsKsm0i9wlcL4YMJYLXiSD/+/KFF2BYo5qRi2TEM=;
        b=NqvLYdQOg9WsWgafTcXbtg5u65pRRS7j5nw3+mSjzeTH2M7p6X2nP/L31mrIHeBWKZ
         uUX4TQ88N5mVm5+rplo/2230hpzVIDTRsuYlrOG+DwL8u3v7rBf4X5PIHjxTE1p7lU8D
         dKL23nnrNwmfu6+jZg7Iu9eg5n9jE/qgwJpn3B5nPY1JL7Z2ouq/EioNPFoEzDyqVuUB
         +QFfXvSzENFBAbSFpbXR/uXKzv7lz0sxwCiBjzWXYrcCZtwPBxY8r3sCMzkmVI5bKaCJ
         2ubFjxUQ8ArlQUgcXd9Hs/JX8r9QxTX4oFJGMd4tnyg+hF4gS+JEruMT1++icFovtx9j
         8E/g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yQdwd+Sb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-515eaf7b69dsi592812e0c.251.2024.12.05.09.45.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Dec 2024 09:45:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yQdwd+Sb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJFuw-0001Ar-Ua; Thu, 05 Dec 2024 12:45:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJFut-000192-UX
 for qemu-arm@nongnu.org; Thu, 05 Dec 2024 12:45:31 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJFuq-0000EQ-Ie
 for qemu-arm@nongnu.org; Thu, 05 Dec 2024 12:45:29 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4349fb56260so8555835e9.3
 for <qemu-arm@nongnu.org>; Thu, 05 Dec 2024 09:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733420727; x=1734025527; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ipdLw07BS/sO3vHv/p4tnDEU/uwUsHEk/607BUAv6jU=;
 b=yQdwd+SbiLHl+iqH7WMkBqyGx1sExmrWKq0K+NBOT3psog2rVMkxHHlHYdMK4c4a0F
 hENKrDQMbYv43aZZHLKWYk/FZKsettoDLNEWcR6+GuAuQ6B14TnFhYNTB+SqF5J2TstN
 IadLG77K2MJN5RW7eBl1gjICBB89zwHDY2cby7GIPGsJYb0LZ5WcO/rNFPHzfrz145qd
 BgxsrEe5CWspc62MFimH4DOMALp42kW2DfZ+F7b5M8klatPVGstluWpOoPVI6mq0ybJe
 E5+j5q/dH6fn3bGiLQlG5Tk+wEajzmwjVe8QMd0DdBcVaDdwzhi2paUF3atY6JVJPnwz
 pGaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733420727; x=1734025527;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ipdLw07BS/sO3vHv/p4tnDEU/uwUsHEk/607BUAv6jU=;
 b=ghfQYeeI5byipZA89dUAr6SF6Nj7Om1W4nvX3yYtgvqlblTI/Jz5YnxI7SkIiZluDD
 6VvKXL/HNfXzzId8No3WOdKl0d0yuZzcKfnoTix6ttEpnnjdnoxSe0y5hIaVlMp5787m
 wDSy85HPBYVKBJxcAFEZKmaAUICjdM3TDf6TJhE+PtAs/s54hSHVGyIJ0/Eye/5JbAms
 CXE0MRxTRQYRlYXsP4fSe7tyvPbnAI7VN3CK+QQK0DftyFPHKmch1E7ciEpAoof6V3oU
 CFSatCkIvHqf3RM+f5LSEo2Sc9aYGGaeWeG3OoPtADqWQSu9WC/LgBVXY8L+rWqPKMYv
 97gA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXB2wXQjjn3+TxFi52QWC+KoHFpBgsJlSOwuuufWdB5CWbHP7baLbY7unn1pMbDLFqsa7ec3hQ6cw==@nongnu.org
X-Gm-Message-State: AOJu0Ywg914Rsbm0/jG+fTiUyw1BbCfIRuKmhsmt/G6PW5c0I4iSznSV
 ispV3mib+D9AzZMlAcfgw7Cb1qX2AQNJn1kg9GyD7xNZHBawYlTR05eu2juXMEeklhzNTCPX9ON
 M9N0txC8IVeULupfyHS0sUzCi/LihYb9DivT4FBPogE9RNJVC
X-Gm-Gg: ASbGncswcb7dswSRVXQn/5Vxy/f/N/noWVZD2HpzuqBJhgLZZMRVzWLrPSPc04Z+5Qp
 43IsokvMcfTul2CLc0A9NwhVYSVDtXsXH
X-Received: by 2002:a5d:6c6d:0:b0:385:fac7:89ba with SMTP id
 ffacd0b85a97d-385fd43734amr8911797f8f.47.1733420726868; Thu, 05 Dec 2024
 09:45:26 -0800 (PST)
MIME-Version: 1.0
References: <20241201150607.12812-1-richard.henderson@linaro.org>
 <20241201150607.12812-14-richard.henderson@linaro.org>
In-Reply-To: <20241201150607.12812-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Dec 2024 17:45:15 +0000
Message-ID: <CAFEAcA9rOEUPUaj=UNPc-nAKGjOcJVKuaON-PBsQfLK32sPWyA@mail.gmail.com>
Subject: Re: [PATCH 13/67] target/arm: Convert disas_add_sub_reg to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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
X-TUID: 1Ojaul5FSnHL

On Sun, 1 Dec 2024 at 15:15, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This includes ADD, SUB, ADDS, SUBS (shifted register).
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


> diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
> index b4ccad34fb..4d422a7191 100644
> --- a/target/arm/tcg/a64.decode
> +++ b/target/arm/tcg/a64.decode
> @@ -718,7 +718,7 @@ XPACD           1 10 11010110 00001 010001 11111 rd:5
>  # Logical (shifted reg)
>
>  &logic_shift    rd rn rm sf sa st n
> -@logic_shift    sf:1 .. ..... st:2 n:1 rm:5 sa:6 rn:5 rd:5
> +@logic_shift    sf:1 .. ..... st:2 n:1 rm:5 sa:6 rn:5 rd:5  &logic_shift

I think this change needed to be in some previous patch.

>
>  AND_r           . 00 01010 .. . ..... ...... ..... .....  @logic_shift
>  ORR_r           . 01 01010 .. . ..... ...... ..... .....  @logic_shift
> @@ -726,6 +726,15 @@ EOR_r           . 10 01010 .. . ..... ...... ..... .....  @logic_shift
>  ANDS_r          . 11 01010 .. . ..... ...... ..... .....  @logic_shift
>
>  # Add/subtract (shifted reg)
> +
> +&addsub_shift    rd rn rm sf sa st
> +@addsub_shift    sf:1 .. ..... st:2 . rm:5 sa:6 rn:5 rd:5  &addsub_shift
> +
> +ADD_r           . 00 01011 .. 0 ..... ...... ..... .....  @addsub_shift
> +SUB_r           . 10 01011 .. 0 ..... ...... ..... .....  @addsub_shift
> +ADDS_r          . 01 01011 .. 0 ..... ...... ..... .....  @addsub_shift
> +SUBS_r          . 11 01011 .. 0 ..... ...... ..... .....  @addsub_shift
> +
>  # Add/subtract (extended reg)

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
