Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp854546wrs;
        Fri, 23 Aug 2019 10:33:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwIHXLAOH+HSjbc+nlYA1Bl7gPdoZb/4uXT5zZkE0a+Kbz5+i0QZ+xrmE34IGXSTSs/bSFk
X-Received: by 2002:a37:5347:: with SMTP id h68mr5120681qkb.236.1566581634789;
        Fri, 23 Aug 2019 10:33:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566581634; cv=none;
        d=google.com; s=arc-20160816;
        b=aUjFO8BJ9hPk0Y4n2ngCUPej+79TmKIb/m1dWdG38vGvZI0qcQtxATZUpSnOL79Xgw
         Ooncn/zqf5Hs7E12wrJGhbM78dA93eYAWmLqrcn3hNYmSI2jwgV7ULV9O6AtQN95r7GE
         v1Fj3VyB3RSH3nod3LIHnF/MoDu/ff5btmo0vaB+rmeZl22jAoXMqhsk+lb6y2Q5PHm1
         P03sAZTQcnNP5KJc2ftCGBCfZf4S85uEfUtQVGAYAhHJxlwNIUNsdD67zmbEFk+4AQDj
         urlPYWBjYYv7EZ0EjJDT93nk5/KMYr5dfmOxGsJknR6p9tx0Ls4G0wbR2w2wtvDiLBbY
         az3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a/1PZznsLdjjJH0BWG9qHgCgdaqy2MydQV0cqzggrB0=;
        b=XrqsrqQuo07OeLnernNqFqFnjgkTlTmirKoXKDYe+xpt6oiQv3a++EtLlHZnp+9MXU
         nlsPaCWdYFyME3vvLN7yXObpbff+uH5aS/+/Lb+RxUaF/MXK7fGVuQlriENPIgeKQ8d7
         IaQtIedb3oUbnQ9pNRkudOIA5GdUv55LvzdpV9c0VCVnS2txnh92/NtPRixZon8hRPWm
         wcRyxdy9E1JSJ6CAWaPCMKVUAIXW/BkcDy6OSlmy/5c7I7sCKQ8elOynJsJbJ3EzJ/YO
         yrmVoiNWYEPrhGKgj1MQGlKLTrhSsZ3eC9RUQWpVJx7J/MP8ooXquxXWsOGRhmvyIAvg
         bvzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Fccf4bIN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y30si2314315qve.167.2019.08.23.10.33.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Aug 2019 10:33:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Fccf4bIN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i1DRi-0000P9-07
	for alex.bennee@linaro.org; Fri, 23 Aug 2019 13:33:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58736)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i1DOd-0006Gd-Kp
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 13:30:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i1DOc-0005QN-Mh
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 13:30:43 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:41116)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i1DOc-0005Py-HV
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 13:30:42 -0400
Received: by mail-ot1-x342.google.com with SMTP id o101so9442769ota.8
 for <qemu-devel@nongnu.org>; Fri, 23 Aug 2019 10:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a/1PZznsLdjjJH0BWG9qHgCgdaqy2MydQV0cqzggrB0=;
 b=Fccf4bINf5GviOwS/vCjzvJMRWWh0G6W6w49sZi/JCLAoRqzqD6my9Mx5Qzc3C/3tu
 SphqCFb3c1v+ZHWgt3ZLngagZhiqF7Oxf7YG2pdLMdJb/znIkckNt3rA3LzLivdULF0K
 r9eicWQ0Tw/yy/jXNM58PzGS9zmYNnTmlbZYsi2Quseq49/+XsQa3XF5q37fmbnLBlyx
 pukANNyFhif7sNwn//t1sDKzppcW9XytYxKku6VaJ8a3y+ISUuAsjPuNd3eypYonv5+/
 GOd1p6Jp5OSHSiuoT6lBtfIQefyAH5hg2BzSkeWuSI2pay0A8N4POFoJYcqmJCAJ3nMM
 GmzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a/1PZznsLdjjJH0BWG9qHgCgdaqy2MydQV0cqzggrB0=;
 b=igzj3k8MJSwBph231FXBb21UMSPDo8JEFtyjBVJSl6TcoqO8Ae4TE+JZUlqvIT9sQs
 X4gWVsRGJ++yhngQUty77Vu+6fUr/x8UwkqWr00bnJCvZpl9yWOY8eJXe5ehl5D2/e6p
 KTRLb8eYXXGm+SyXWNBA/HqLbR9t1hFamfrJe2zBnfLcnhtjbf8ZiNmgI27PWaJdokXm
 Em+o3AkgcWJdvegsr2hEkPhiKXTuIiDTnqXFjk2uXfwPA0EPC6dDL2hRKFVeYhET68X9
 z5M9zX1rSvI5UflnjTQ6wYD9e0FNIznLc5bVY6QtqKbFQZYKIsKFxl2dvToe7YAJ/00K
 bMXQ==
X-Gm-Message-State: APjAAAUiA+4pu9mdd1ZYKkhESLJPaBAYKQuZ37cHgZmIUdk2swYGh+fI
 qUZij/M9SDt0gAGOMioPLAdTw4/K4q0x3r4+7ucBZA==
X-Received: by 2002:a9d:4817:: with SMTP id c23mr2197839otf.97.1566581441777; 
 Fri, 23 Aug 2019 10:30:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-30-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-30-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Aug 2019 18:30:30 +0100
Message-ID: <CAFEAcA_p-FWaToeKiTW-_hBnD3-yzJpi4qm4WqD=6aRQnauD6g@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-devel] [PATCH v2 29/68] target/arm: Diagnose too few
 registers in list for LDM/STM
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: leGSiqH7Bx17

On Mon, 19 Aug 2019 at 22:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This has been a TODO item for quite a while.  The minimum bit
> count for A32 and T16 is 1, and for T32 is 2.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 24 ++++++++++++++++--------
>  1 file changed, 16 insertions(+), 8 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
