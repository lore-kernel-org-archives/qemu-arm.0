Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp344328ejb;
        Thu, 8 Jun 2023 06:38:43 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4gGOJqDkEDjwzdUgC5sTcYKkTdp7CBbfloPyjT9PF+01rjW5d9eEgB6/+VvWLsdAfMeGAu
X-Received: by 2002:a05:620a:6089:b0:75b:23a0:dec0 with SMTP id dx9-20020a05620a608900b0075b23a0dec0mr5817010qkb.62.1686231523043;
        Thu, 08 Jun 2023 06:38:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686231523; cv=none;
        d=google.com; s=arc-20160816;
        b=iskyfss56UTvOW/FUOdw9gQn9lwtJv2GiyYNb1WtN8LV6JVyNTC1T2uFTO6+Fc2F1P
         eHuhyW/Czc8dikroIkZknEhgK/XHRZ6bFkTpxxDykqWgd3cQLs4Zr8DrtlJOSj6Egi4Z
         SYYXZ+yPYFkgCMDAzt0z03Hx+5n3GWqFFH0vpphYiXa3Aoako8Mla4/jtT2b1xObZx5i
         boL+494UUlgiQF9sFF0TDteY+g9QPgn9V/LdncF6edV7NLX6s2aOn9jX78/sNxJU8sp1
         fwTe/AXRZmwAtB4rf88H3mpdaanYN/b6O0GA2YfU3NncC/EvlDP4SToEuChshTWkNNfl
         8vvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=JWPM0coYAwF+P1JPUn1ZunbnoWAEakvKFYNJSePMiSM=;
        b=M1KRE2lgsFQ0/d1ct+sobxLd4GqFotlBqZxxzrqKhiPkKrG/dqJHriah+WR+Aqnc/x
         urhO7Nr9LLjzL05zqfNF5be2hfL0KJqJ1AvFK9eqf3gkzbTb5N8XfOzzi8CxrLT5UWUJ
         k83m90vVpmp1VzY5xrliMgu43kGx857DGhhM9IFlP/7MYLnjVkNd5QGUPeQlDNuLVyEl
         YnHJFJMexeFLQ/WL+xq3OC7ilevki8O+2xKSqaLtaShrenHJaTcmKQHUIgQb/RLT5NId
         R5P5aThXiKUDeu/XugaFXJxKPEkhLoLt+XJfJjm+iEAwZvRPN2nQCuB2WM7J7dQUKpcO
         n9wQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jTX7NOsw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m12-20020ae9e70c000000b0075e8016bc91si598841qka.383.2023.06.08.06.38.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Jun 2023 06:38:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jTX7NOsw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q7FqX-0002Hr-7W; Thu, 08 Jun 2023 09:38:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q7FqC-0002CY-EM
 for qemu-arm@nongnu.org; Thu, 08 Jun 2023 09:38:19 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q7Fq5-0007xw-DO
 for qemu-arm@nongnu.org; Thu, 08 Jun 2023 09:38:14 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-977e7d6945aso121276066b.2
 for <qemu-arm@nongnu.org>; Thu, 08 Jun 2023 06:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686231483; x=1688823483;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JWPM0coYAwF+P1JPUn1ZunbnoWAEakvKFYNJSePMiSM=;
 b=jTX7NOsweJLfZEvLkQpC1XK9RYp23LI/rC8nOTnH0SVJI6Ul7gcIE0oUFuYdTR1hZw
 5gBqGl5HPBEy4XZJZSRyoEalB26j8QwgyWaq5+cpfvEQu4L0peMikgj85NiGX7qQQCZC
 HYpE97q2IQWdq9fYr7ejvWYRQuQeo51PW1wCRlkGhjAmVoG5Is9XDCopQgkPEz6RAvKe
 7pFZdwJt1RqH4UQzupdNrmaOZLFNdk+WEdKOyCt6Gkuco8EbZh/yBWqf8tDODkZ2PZDJ
 UWE60x+d4xXoFy0eSfSXjGrCO+Vp+UvP77Siu12/8aZysqUuvVpTjenPk0ZEx4JhAJ5Z
 a5Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686231483; x=1688823483;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JWPM0coYAwF+P1JPUn1ZunbnoWAEakvKFYNJSePMiSM=;
 b=P5LwLilGaLG5nQAra1gctp2E0fUjIGwRxmxe5btciJfEbDG9G+4MxdKcmff5cWaMok
 O7doqOGXjZu6fbFOgozZ3Gx8163pnaFzMJrxa9odBaHRkagAJCidQ6c6HUuZ/oEPcN+n
 XMAQA2T2s1i/nqzQ/eY5doGWl5OjY94XK7ooDE5WwdiZ6jWDzOdTGsChKp5zwcNoV4/j
 1FDdwjRHd1+rAb/FwJ1LpeMQy5Z9RfNkzkdYoXwYG9/6QFceieExF7Vl7DduXiUS7J27
 SYGYWnAWu/jIdpTNdxsdF360X8y4fM5ri3rZuCm1nn8Q+yKDw2o1tA8xYVWf/VJ4c4cx
 n5ow==
X-Gm-Message-State: AC+VfDwaRoiNfyag+VeM3vjBn91Y8BgzyzR01gkWzBFXrxyedAESqx2L
 sF9D/QcAVK43g8F6gKojMOeiHyl0lDAR+vfLAd/SPQ==
X-Received: by 2002:a17:907:2cc2:b0:974:e767:e1db with SMTP id
 hg2-20020a1709072cc200b00974e767e1dbmr10918035ejc.46.1686231483581; Thu, 08
 Jun 2023 06:38:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230517081204.30333-1-m.elsayed4420@gmail.com>
 <20230517081204.30333-4-m.elsayed4420@gmail.com>
In-Reply-To: <20230517081204.30333-4-m.elsayed4420@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Jun 2023 14:37:52 +0100
Message-ID: <CAFEAcA_go63+_J3BKNtnXTkF1uy4351njkejGWY+R+WyFLwvOA@mail.gmail.com>
Subject: Re: [PATCH 3/8] tiva c gpio implementation
To: Mohamed ElSayed <m.elsayed4420@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: ASP14NKtzq8s

On Wed, 17 May 2023 at 09:14, Mohamed ElSayed <m.elsayed4420@gmail.com> wrote:
>
> Signed-off-by: Mohamed ElSayed <m.elsayed4420@gmail.com>
> ---
>  hw/gpio/tm4c123_gpio.c         | 372 +++++++++++++++++++++++++++++++++
>  hw/gpio/trace-events           |   4 +
>  include/hw/gpio/tm4c123_gpio.h | 127 +++++++++++
>  3 files changed, 503 insertions(+)
>  create mode 100644 hw/gpio/tm4c123_gpio.c
>  create mode 100644 include/hw/gpio/tm4c123_gpio.h

Again, TI are quietly reusing the PL061 GPIO controller here, so
we should add support for this variant to hw/gpio/pl061.c rather
than defining a completely separate implementation for it.

thanks
-- PMM
