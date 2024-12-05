Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp433768njb;
        Thu, 5 Dec 2024 13:21:45 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWnCn4LEqUuJFJ6DJQiBDEj6r2dhGAmPRfobSFAiaK7HyccW958JgCLsLeAOrxpnWOqSNR1tvNRGxr2hg==@linaro.org
X-Google-Smtp-Source: AGHT+IG1moNGFVLoewkLORa6sMJqWx6jECw+wO2ayfVQAV+R0IlVX1lDdxG2oqqk51dT6ZPetG3Z
X-Received: by 2002:a05:620a:4507:b0:7b1:4caf:3750 with SMTP id af79cd13be357-7b6bcb975camr129686985a.53.1733433705199;
        Thu, 05 Dec 2024 13:21:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733433705; cv=none;
        d=google.com; s=arc-20240605;
        b=jeFfS269FNlcMQCfBfYnsbO6zMqS620bwdlv/8kqbEHeDQcL19iwCZYYsxWtEa3MNc
         NYYFVvYsv3xcYHsR0AFSdBDeER3c9WNwd6N1tPKwmNbWD6jytIerOhaRdpu1IB0y3T0H
         gl9wHg2w4o7VnDuUHXVKIrRTAX6BtudbBD7i3Y+dD1surW7E/FV9K0cMyDEn57YgeTTb
         TK84Mb4rl29m4QwURcI+iwC4S6tqNGa4GySdfRi20yga5J48rWJHMZig4VfMGDw1hh1o
         n09NntERi78DC0t0VN0wnI8oXPNjDG+XdlgPsIdT2WVutROsaoQLbDuzZ03vJW89SkwJ
         EagQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=x69C4o0AsEFB5rGZfzox+irwukcsUU/LreIYluVLRWM=;
        fh=ZcK4buDuLdlMgci0xQxSX/Cu04skQmxEZIX6vSkXZsM=;
        b=FPQJ99ch2WuW7Vq1Y3PyNo9Be+7Bq1tNDgjlCYOeieeLCGt9fMlpaEN4wsLBGrMmUv
         M4f7nqRzkPLU+Iihmpfz7/eMwhEN7Ey04bMY2PwXJzhfty+lr1fUYXA4MQ3sw4DMJD/o
         BF9T5jJ7r9ckxodo/zd7X/BsMY2LgfeEfNgALgN0VoRKs/1J6HrGoBWqCr0BzlOvXPk6
         WKZ8s5cp5jTaP/sbPjFQVlp4mUwXOjPEt7VpxjRS7oCphMVMzSDVroL1nNw9M+wlaQBn
         ZFSWtWkMXSDkHMT5GbBAv94ySz8C8vqWV7Yb6ZgU8pHLZwbG6Pc+rtRg/vw3zvp7g6Tk
         mdEw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zidHxGjx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6b5a4815asi248738085a.46.2024.12.05.13.21.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Dec 2024 13:21:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zidHxGjx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJJI6-0007ck-SD; Thu, 05 Dec 2024 16:21:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJJI5-0007c6-Ih
 for qemu-arm@nongnu.org; Thu, 05 Dec 2024 16:21:41 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJJI4-0004vp-2u
 for qemu-arm@nongnu.org; Thu, 05 Dec 2024 16:21:41 -0500
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5d0c098c870so2575063a12.1
 for <qemu-arm@nongnu.org>; Thu, 05 Dec 2024 13:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733433699; x=1734038499; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=x69C4o0AsEFB5rGZfzox+irwukcsUU/LreIYluVLRWM=;
 b=zidHxGjxUr1yOswp1HOoFnyRZctbxRtxmEeNMbmQ3oG0F/fR8QoYhSdX+4t+lTiVW2
 YFE0E4OKkYFQ3Wu4Yc+uigbQtkzNCHOZnJJ3UI1wQM/NsBsIdM/vKwjYeF01S2p8ZvUt
 nC/MRqqDMF8qGH2ylPpK89/dg2R9Bi+FB/ZHVB0dXntKOwK8kOPxhiGXOFsvXaKoXN4+
 d2ba9/i2+vSsXOrRwnB6VM6vYnDIo3pmBLy9MgAQGJEUCSPp6yEpxsjWXRkI35MhXiRW
 ByFZAG5IebQWhZfXEz+9uekqPnngJdQkQ4RZOYIs4f4Tl7uH8KDPyIRosh7T12AM7D1s
 qAug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733433699; x=1734038499;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=x69C4o0AsEFB5rGZfzox+irwukcsUU/LreIYluVLRWM=;
 b=wxmpAPGjW5chH1P2f+nN7DQejNFanBiusVNvNyBx6PpNzmO4wr3Df1AEIn/UzjycET
 Bv0J1LGFTQ78AdGcjazZT6uosZD3qmMw5+Faw4q55mKCiHTKOnqakOtCLrGjnXkmKog6
 cnFUqRLQyxmp1KYGcqDypdMNznq7s8tuYwBjgEAP+WfANVG+T3Rfs/Lp32tVh8ssJpbo
 AQnA0cgBL/8MnhNtHPxLsHckQDhwZpweZYETgKWArjE0v7QeQ3kzDmt4fBl1IiZttxcF
 PqFp2n7iOBP+IeO5wxqbYiRozUhCI2s/HamFcqwZLvC6cszsCwfhMH+hMKiYSqw6Zxpl
 9KPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8zm4JI2TnqPUoPl7u4YGhSCpwC38LSufOqB3iECZvwQB7KTarqPQSYi4D5eKJBCUqPW4D1xDFuw==@nongnu.org
X-Gm-Message-State: AOJu0YyCwJho8ZYTwmBj5+D52te4/7Yi2XZJoCZvPcOfWxBncwQoKnim
 lAF9MjPPT5PyOzMUqeWMGkoUHyXiTz6zKsTBQP35pOQMbeCeJj2FNHIzxz7bX/70qU7B8PZCW2Z
 m/Q/jgm0YIGAiC7ry1MNoZ0JsF6despSNUuhzhg==
X-Gm-Gg: ASbGncvBk5iqfDBSrIuaWVvijy2XERmJxLS/FLHKZ7llH8tltqR0dv3k2tIsE6AEHmX
 WxEreRt6rRHSFSSE+a5QoALpLSsddWUNS
X-Received: by 2002:a05:6402:234d:b0:5d0:cfd0:8816 with SMTP id
 4fb4d7f45d1cf-5d1250094f0mr5165135a12.12.1733433698641; Thu, 05 Dec 2024
 13:21:38 -0800 (PST)
MIME-Version: 1.0
References: <20241201150607.12812-1-richard.henderson@linaro.org>
 <20241201150607.12812-23-richard.henderson@linaro.org>
In-Reply-To: <20241201150607.12812-23-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Dec 2024 21:21:27 +0000
Message-ID: <CAFEAcA-2nA_UYVt+U5hkngxxNEEUmLa6EBkt18v2=zv6PUMMnA@mail.gmail.com>
Subject: Re: [PATCH 22/67] target/arm: Convert FCMP, FCMPE, FCCMP,
 FCCMPE to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
X-TUID: XOfNc9CTujgv

On Sun, 1 Dec 2024 at 15:17, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-a64.c | 287 +++++++++++++--------------------
>  target/arm/tcg/a64.decode      |   8 +
>  2 files changed, 116 insertions(+), 179 deletions(-)


> +/* FCMP, FCMPE */
> +static bool trans_FCMP(DisasContext *s, arg_FCMP *a)
> +{
> +    int check;
> +
> +    if (a->z && a->rm != 0) {
> +        return false;

We did not check this case before, and the pseudocode in the
Arm ARM doesn't check it either (there's a comment for the rm
field that says "ignored when opc<0> == '1'").

> +    }
> +    check = fp_access_check_scalar_hsd(s, a->esz);
> +    if (check <= 0) {
> +        return check == 0;
> +    }
> +
> +    handle_fp_compare(s, a->esz, a->rn, a->rm, a->z, a->e);
> +    return true;
> +}

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
