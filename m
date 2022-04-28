Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp1628708lfu;
        Thu, 28 Apr 2022 03:41:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyfl8aUP9fYwNY09hqcf65pGxiHwfacoQl5DBXwB7wVqVvb2xC6PJjZAPPF82z+bUPbqyCb
X-Received: by 2002:a0c:ab09:0:b0:443:95d9:140c with SMTP id h9-20020a0cab09000000b0044395d9140cmr23519497qvb.84.1651142469942;
        Thu, 28 Apr 2022 03:41:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651142469; cv=none;
        d=google.com; s=arc-20160816;
        b=dji3OfrgckfvofGfwvr8ZhjgnoOX76v/S51hpcq435e+9aypVz3V2vr6wP9aGhGbM1
         yWBATOolSgGbwJa9rNUlOqJrlK1uQj6z0EYXa8pnfUPOFaze6TO/7d01eApl9qQPGFk6
         9xNzzSJgaprvCXdpeyU+G50NB6OUAq58mN2rytK+1NwdnOGkbcORQi1YhR0AK3rKy6PG
         zEEWudpJJfZ7s0M6CSEiqaNhlidkN8ZHmAwQB4oTCPSa2YVWT3nQlPpvtbMAr5BkUtUX
         YKWPThAVLxISCOZ/XwcOLJfkMgLajgmlYwEdhq4dyZWHHIUfhtws6Trp0z0gQTq+rePf
         nwvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IZRaRWIau/dzvEMUUkWTsujiYnz8AzW1fjbZ0KSb3Jc=;
        b=EpWzrvRemYsqzQT00dV9TX83OzDbrRmiYtW+6tSQ0W/YJx8NwmEwS4u1pmNi8Rjy14
         opIY5QMINEm2JWcMuUfDQhOeVPZTYsebUB7ReoSa+VEx41IGs33OAO2QYjzidevC988c
         muiRwup81AG2mF2lqxUzH6kjur5yI4SV+1NXcNbySR1Z62XJx9J9HVdP0Fi4G7bJGPcf
         +CEa8LnW9rI/SjyBHgXSrcRG9ao82kVFX0S6y/Ph+pIN+rAWfYBqbEOvA3Dl5TZrUOYK
         K8CHtxvT+hSOsYQpEcn/pvmKEHARgmoCYAL2M0FhcwfvYI/ZcOw2RzG0BhySZbgMU/Wi
         JKgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fAFuaIVh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s8-20020ac85cc8000000b002e2292981a3si1590355qta.710.2022.04.28.03.41.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Apr 2022 03:41:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fAFuaIVh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nk1a9-0000u3-CQ
	for alex.bennee@linaro.org; Thu, 28 Apr 2022 06:41:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1HU-00032W-3H
 for qemu-arm@nongnu.org; Thu, 28 Apr 2022 06:21:53 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136]:38006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1HS-00068Q-8t
 for qemu-arm@nongnu.org; Thu, 28 Apr 2022 06:21:51 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-2f7d7e3b5bfso47458177b3.5
 for <qemu-arm@nongnu.org>; Thu, 28 Apr 2022 03:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IZRaRWIau/dzvEMUUkWTsujiYnz8AzW1fjbZ0KSb3Jc=;
 b=fAFuaIVhB6bNcKD7Ii5CPlXkOLv9RyPJ74KC2cboIcmTqY1J2jR1SIHSdMt41iVbgy
 3K243yRH1662BEHX5QyX2YZPEgf7NDfJosAXpl6Ydt6QcR8ciWshcdGS3i/VX58lk+q8
 tTlN1QWm8g+nTw8YrSqattO35maAarjwRuf81wlf8H44mvQDFpfzGzecnhZvIbPYAnSw
 1bscDhI0fK7ydlIxQOqqnLvY3lqhPniXyOwnVev9rVxdwCwlVpHFWPXTaK607E8+UJQu
 RRg/bJ67xCeDQ4C2k1iWsDgsb0gr8gpMw6yD0g7oczoJSnc6x8RTkB5ANgARxPQ/28i0
 BJYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IZRaRWIau/dzvEMUUkWTsujiYnz8AzW1fjbZ0KSb3Jc=;
 b=Z0rdShzUNVYbdz2MtuDTdfLdTIVHFBvwF/7EMHaM7Jt1sDBX+kfizOoWwCF3EdFnyG
 1RciPkO9itBac4E5jtTWloUxIc/BvcT5uZFliC92tlpJnD2sWBvrlj3ROd1+Xyu/0eDw
 XdqGNbjQ2MYi2dDMOoM1oonUGCNUUAQLv66G+ERtO7PUL5XxiQRYMqTn3KvofaFWpSas
 8c+UpBE8BSfdaz1MQxnziC4UMUyJ1F/29h+AqfeMUezMupH+rQaUyofwk38f9XE9JVYq
 nv6yyPZiWtCeenQEcLqKE14Im7MpaWSOCWUp57LlJSrTa0PwCIEnNkkWVg9fTSA1uvLe
 Lbww==
X-Gm-Message-State: AOAM533TbfmZmIxjGbmLxIi9qMjZ0KhWz/LTB4A2W3abf2YMOdhP8k8s
 Z6dXebb+Du5AFong+Qf7SLz81gcXYClJMOfk6BKj/w==
X-Received: by 2002:a0d:fc83:0:b0:2e5:b0f4:c125 with SMTP id
 m125-20020a0dfc83000000b002e5b0f4c125mr32151188ywf.347.1651141309234; Thu, 28
 Apr 2022 03:21:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-23-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-23-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 11:21:38 +0100
Message-ID: <CAFEAcA9+m6LBNB=YVNA8Kw0362N55Nh_-ckUUeP5Jh7okPy1Xg@mail.gmail.com>
Subject: Re: [PATCH 22/47] target/arm: Use tcg_constant for aa32 exceptions
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wmnNbs/qyhYY

On Tue, 26 Apr 2022 at 17:49, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
