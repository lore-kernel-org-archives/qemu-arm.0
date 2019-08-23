Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp821232wrs;
        Fri, 23 Aug 2019 10:01:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzGMEGZis0Io5JQ9P6XiX7c8vEuFzVirIHYzaMbW1lHf9HQXdWxPnMs8uXvC2GM+RFpwM+v
X-Received: by 2002:a05:620a:13f7:: with SMTP id h23mr5028164qkl.243.1566579713734;
        Fri, 23 Aug 2019 10:01:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566579713; cv=none;
        d=google.com; s=arc-20160816;
        b=OcNcoWzJNrvA8UGB+nHn2B3ozB0390YlNfe7V+hKdJ3vI37Wth23+/i4/blEKj76fJ
         LVw2Wu/isOexnNlYMlVzOIL0ESD3EvfJU6Xr3H+KcjYmUHFAcm06JfDjHByujEVy2KjP
         Ora8M0qwBGflkcb06l6KYGUMsBurDpFtr7OPRVv1U/BfsWTgbZds36l/JBOzfJXsGfS0
         k8ImPBcbvqHBAZEaE0hfEVds7ccswY4+tplO2197JLwJQD4XrawRo1khsQnHGR4z5KN4
         6JwZS3OmljdueVRqCq1T739Y3ChoalRwUqADb3KOZxUu9uFhSegkFG+B2tp94AgAt4VR
         rdGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3wECWcWTBB75jo4+e2zcF8qaISQpSOHbaWaV2xm/QlQ=;
        b=o3NWZyasY973R3xKAIvQifVeTQY7G5qUFOPUwK0WCOKQk/xZ7IGt/d42WZkPwVa6Fa
         riR/agmArQlk5vBfH0OWZhuOeu+DTImwWC/A9l9OEekDSRreFbUeqQpDbpi06omQUcZY
         XOPw6Tvy274o+5dpjKyshJmtKso4cvz/BFzK4A07oWx+TNZ8VmX2JKzVbSIB86L/84Wz
         +h0l/RMqy3HDTtHwtOPhpUXmVOh8wKlaTM8cSJvmBAJf+CjimTqdJu6Q1W/fxouit+FL
         FgVIKrORgCpitHupKFs3PPDy1dCoNBwfKV9csls8FhDojsemSTbq17P2S4s+O15V3yOf
         TD6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="eg6/hD2A";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q34si2383016qta.179.2019.08.23.10.01.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Aug 2019 10:01:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="eg6/hD2A";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i1Cwj-0004r4-1W
	for alex.bennee@linaro.org; Fri, 23 Aug 2019 13:01:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54181)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i1CvV-0004LJ-IS
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 13:00:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i1CvU-0007HG-EM
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 13:00:37 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:37517)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i1CvU-0007Gt-9u
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 13:00:36 -0400
Received: by mail-oi1-x243.google.com with SMTP id b25so7541800oib.4
 for <qemu-arm@nongnu.org>; Fri, 23 Aug 2019 10:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3wECWcWTBB75jo4+e2zcF8qaISQpSOHbaWaV2xm/QlQ=;
 b=eg6/hD2AtxS1XYMgIockhzsAtlBFgcsyRwesMJJC1Mx4TJdUm9lufJmtUzu6hBbAuQ
 cXHo/N/iRVKcT7y5L3/xEgvZgpi4pmWLJnc2xriDzSf612z63f7ZuR8bC7wq472reI6j
 OXDvB8g0Z0KlQ0U/Y4y3Rmw5iwn9K7+AW3nxJnded9JsWHjnFnxRnfQ50+/hYhLJKHXr
 Wd0dRIM/TxPoLZjCAlRjg95aaj93Ce1J2Iog5FFAgpxEBXjSvhQarklN0mmYzUk7/VSM
 lI1I0d8OnqJs1QGQAdb15gy4t9CfT4MyWMPuYUvyFDBypm2W+EjjXFObzSTbI2pti+Rx
 BKpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3wECWcWTBB75jo4+e2zcF8qaISQpSOHbaWaV2xm/QlQ=;
 b=XJ0DbNGmB3UYiQJX03jrxWoFF7H13dM0cOZ7vP8wq+0S9Cu1pnh8LE1K6RxZcV5oK5
 V0NPlc7ItykQEI2RnhKr6z6p4F7XZmjNr2JWRWQ+7RbTy0BFURx9WAooYwtY2U/KO1yq
 Y7wZKsQP2wME8RHjryscorc+gxuKyE8ZsRlvEu2sLOxdsryPuFQqA6R6uE3+IIcUp01S
 3GCm3EesvEhwylj/lJ1/kaY+z5Ai8CsQZNWqEGj9P912xHhdQcB96jpNQaJfOE2tQuUE
 iFkt15i2z7puEVjxT2iWzB7NGDrnQvwcFp5GR5TdMkl3AuBrnnTp7R7DBUpV5RfyeBik
 VYcg==
X-Gm-Message-State: APjAAAW2MNobg10JiMQllRF2HuECKVZlPHG42k8IGmZw2v6yuf3+XmTT
 dK2O1+3gYzF81G0eu6tgvNDD/w0e3yk6LEk42Hcomg==
X-Received: by 2002:aca:50cb:: with SMTP id e194mr3667916oib.48.1566579635251; 
 Fri, 23 Aug 2019 10:00:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-26-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-26-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Aug 2019 18:00:24 +0100
Message-ID: <CAFEAcA-gsP30Be2wZi-UeUUjond05A3HuFKN3znz60WmPPnCxA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
Subject: Re: [Qemu-arm] [PATCH v2 25/68] target/arm: Convert Signed multiply,
 signed and unsigned divide
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1nGigBAePTjB

On Mon, 19 Aug 2019 at 22:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 463 ++++++++++++++++++-----------------------
>  target/arm/a32.decode  |  22 ++
>  target/arm/t32.decode  |  18 ++
>  3 files changed, 247 insertions(+), 256 deletions(-)
>

> +static bool op_smmla(DisasContext *s, arg_rrrr *a, bool round, bool sub)
> +{
> +    TCGv_i32 t1, t2;
> +
> +    if (s->thumb
> +        ? !arm_dc_feature(s, ARM_FEATURE_THUMB_DSP)
> +        : !ENABLE_ARCH_6) {
> +        return false;
> +    }
> +
> +    t1 = load_reg(s, a->rn);
> +    t2 = load_reg(s, a->rm);
> +    tcg_gen_muls2_i32(t2, t1, t1, t2);
> +
> +    if (a->ra != 15) {
> +        TCGv_i32 t3 = load_reg(s, a->ra);
> +        if (sub) {
> +            tcg_gen_sub_i32(t1, t1, t3);
> +        } else {
> +            tcg_gen_add_i32(t1, t1, t3);
> +        }
> +        tcg_temp_free_i32(t3);
> +    }
> +    if (round) {
> +        tcg_gen_shri_i32(t2, t2, 31);
> +        tcg_gen_add_i32(t1, t1, t2);

Can we keep the comment the old decoder had for this case?


> +    }
> +    tcg_temp_free_i32(t2);
> +    store_reg(s, a->rd, t1);
> +    return true;
> +}
> +

This one:

> -                if (insn & (1 << 4)) {
> -                    /*
> -                     * Adding 0x80000000 to the 64-bit quantity
> -                     * means that we have carry in to the high
> -                     * word when the low word has the high bit set.
> -                     */
> -                    tcg_gen_shri_i32(tmp2, tmp2, 31);
> -                    tcg_gen_add_i32(tmp, tmp, tmp2);
> -                }

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
