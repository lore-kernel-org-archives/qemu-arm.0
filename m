Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp3415339lfh;
        Tue, 31 May 2022 05:26:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxWSDFapIrHP/96WNwp50m70yc4XXZEJ5UijZFQvYpGEjDrDyVYEuP/dcSy8VfoTu7wiv72
X-Received: by 2002:ac8:5746:0:b0:2f9:3193:13e2 with SMTP id 6-20020ac85746000000b002f9319313e2mr36566613qtx.458.1654000016445;
        Tue, 31 May 2022 05:26:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654000016; cv=none;
        d=google.com; s=arc-20160816;
        b=AIecdGHT7taYD//3/h/r9vDUT8yCowaW7NtKwURB366YTqtP1IwaHDAb00iycd/vWz
         6CA1WraG4NWH/qTe0W1IJRBiZWeSKNSe4DTPnIYQf8HySVWIXF6NXSU5azNpysfnyT0h
         mpPxg7bgbY4C9t9hpthn3nxSsu1k05A3jzwNo8iYQe7LbM3NkoBX8yMmsNXpsPRgCBds
         k+JU5XQZnLf8+0wxg8uU5Gv/efpKJVYROYZF0C+poZh43ii6zPpo/lR/c3wr0Ub74vq5
         2DJqab/ViGgTXfqIJODeaTcxUloK3llRtyK5uYqCDIIDG0qv5N+j3H3vQJc9YYTcVW7u
         Ibbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=V26HY/9VF8ODuHXz9F+jHlygqpe2qt7pIzbunt/RCXc=;
        b=H1ipfv4RW1c4zXRSaOMXstzqk6Wpppq1EgHJVwIpefUm1IOznKzgC2M6AcluyEVSlW
         TGVXnMRK2NygDJMzRssrns4Xm14nmu3MCUhDqVQxmVACf6ryz/mxKgo37AjEnVeEWCs8
         10U4Yxq+A0Tyn4W8bcq+CHeHAMFbvSYlaUBMkdqaoIRLpuib3fFFiZBAteJ3SPQBAR5J
         STNr7ZDJsNw3f9XPkFS+A1Tn/Yl8SYtY7ENzlqLqap0Jl8NkfmoaCRqImGkAKsr57Ggz
         VVzUBFj6yfhbmutcptLpRgfHkIKBhT0L1HbHgRSRoZrwkuOBfcxaDIyvT8NP3Iry/c5Z
         OUvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J4b6w8cT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ed8-20020ad44ea8000000b00464618273a0si789224qvb.143.2022.05.31.05.26.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 May 2022 05:26:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J4b6w8cT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nw0xb-0005pP-Tz
	for alex.bennee@linaro.org; Tue, 31 May 2022 08:26:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nw0nH-0005lS-Eg
 for qemu-devel@nongnu.org; Tue, 31 May 2022 08:16:15 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134]:33312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nw0nB-00040q-TW
 for qemu-devel@nongnu.org; Tue, 31 May 2022 08:16:15 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-300312ba5e2so137731127b3.0
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 05:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V26HY/9VF8ODuHXz9F+jHlygqpe2qt7pIzbunt/RCXc=;
 b=J4b6w8cTRvLcK1yfeIwJcpCe2Owi7O/zEgAHUgw/4340dsgt4x0QjbwBlSDjAp9seb
 EkixUI0sGVkFePimNzzS2Y3kxGST/ERRyU70bUTNglPJ3l4MLUFUWUqhnt4lQi3RKCLz
 mqnsPN9URHB4B0KtkWVCV48bN/mZzMjtQaF34vGVYGeolOKyvvU6ZnltXnl21XAD9+Ve
 MVRfdJU6daqOtIVAB2mHL3IiDs7GAVk8GX1vFH7qlO3kxAtfMZe/KZOyyYecXjxHEvHT
 t5XTRnwNFMGML7j4wyqA6NPdUMaxP/r0HHpp51+tQPhEoRgFxiqh5OyDwwNFkypgDChx
 8EQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V26HY/9VF8ODuHXz9F+jHlygqpe2qt7pIzbunt/RCXc=;
 b=T2VMK57/LcXvjLPiWusZKFpP399VkUkaTiuC4dzQ7n6WtSxBG8aU6fh9VsnG6MOM6n
 PoUOtwjwXw+DIMxAhFCofrp/Ozpc/QyokAHAJQeaeyOnVInW8u37tWhldOOdV8DSr7gb
 PwEhzW+XmpOPpcweI+xMW8iQXNip/KPEvmsoByRh7LuggzNvZCNKIJKxKutecLispubg
 4faCuqu6Rb22j72V08bvc8yoyS2uKMsKBnoiUqqwcr++lh0IvmlEDBJiGv8eVOv8tYJ5
 Kh0sIcjDeRrHVeMTZX49MTdUB+5c7eoig26y21gmufYi2eZseJswC0kcrUTnGzkWDFjg
 sEjQ==
X-Gm-Message-State: AOAM533om/i0R4gIG5p2OWs0xjjILDab5z6EGVyDxyu3RoTMAWPJX0iN
 rvKcfm2/DdZV5VshR/1BE5y3YmQaVGBIsPVpHBYJJw==
X-Received: by 2002:a05:690c:808:b0:30c:4f5c:b319 with SMTP id
 bx8-20020a05690c080800b0030c4f5cb319mr10554112ywb.64.1653999369029; Tue, 31
 May 2022 05:16:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220527180623.185261-1-richard.henderson@linaro.org>
 <20220527180623.185261-4-richard.henderson@linaro.org>
In-Reply-To: <20220527180623.185261-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 May 2022 13:15:58 +0100
Message-ID: <CAFEAcA8XTYwjshU1cUNtW0uzFQBa2rBJd+5JbraFP6iJ3g1Fwg@mail.gmail.com>
Subject: Re: [PATCH v3 03/15] target/arm: Do not use
 aarch64_sve_zcr_get_valid_len in reset
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uJvmVJcltFoS

On Fri, 27 May 2022 at 19:07, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We don't need to constrain the value set in zcr_el[1],
> because it will be done by sve_zcr_len_for_el.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index d2bd74c2ed..0621944167 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -208,8 +208,7 @@ static void arm_cpu_reset(DeviceState *dev)
>                                           CPACR_EL1, ZEN, 3);
>          /* with reasonable vector length */
>          if (cpu_isar_feature(aa64_sve, cpu)) {
> -            env->vfp.zcr_el[1] =
> -                aarch64_sve_zcr_get_valid_len(cpu, cpu->sve_default_vq - 1);
> +            env->vfp.zcr_el[1] = cpu->sve_default_vq - 1;
>          }

I'm still not a fan of the zcr_el[] value not actually being
a valid one. I'd rather we constrained it when we write the
value into the field.

thanks
-- PMM
