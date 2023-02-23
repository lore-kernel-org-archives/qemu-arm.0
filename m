Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp892973ejc;
        Thu, 23 Feb 2023 08:37:31 -0800 (PST)
X-Google-Smtp-Source: AK7set/nunQJU0eLA3g72SLHoyNlSww6q616Qw343FrNAy37Hy+hJP63nZJofLHL2T76DOie4GlN
X-Received: by 2002:ac8:7d91:0:b0:3b9:bc8c:c213 with SMTP id c17-20020ac87d91000000b003b9bc8cc213mr19761834qtd.30.1677170251671;
        Thu, 23 Feb 2023 08:37:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677170251; cv=none;
        d=google.com; s=arc-20160816;
        b=GBfbVnKtgYWD7ntVqrqw5DfIuwA2pCu/vkVaegI0GhWdE8/Zuh091GZvnqE66S9WNw
         crACjQ0wcxuOch18UnXy64vesnnwwjSe8LzCihGaMi6LF1qC3dboSG2B2ZhMFppzVTQ4
         FfGrHoAbnz0aGvCiNWD/fSDSQN3IB2tpn/6JXcTsDYsf7kUmP/Vwulq6oqnbg0olvN9c
         Ozc0SwU9U+YklQt98lV9cKVl+0leeGnQbYYKT4uZuL0u5rAFSYK5wvI9H6o6yRR0tJO7
         Tpfqn26uPfGzLRJPZfKPQGZZ2g2ohk2Pq3ID0WLMbO1O0D5dnGruPqCQCARPjNYajaW/
         9yKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=nSlzryF5KZJWLXPyGf6SJjUg8uAkeD/R4RAa93q3TBY=;
        b=wBlGxAj54M0S0k5jHqr6OtOJKqQkLjpL0L8fGlhOgycFGz2TVguipCNwI2T4dmcSHp
         gA8sDnnWKpE0l40lCwcG9/BfZupvCTlWSju52E7nehhN5gNQ34J5M4cZteyc78KHJHRi
         v8L71kBPF6CJ0wOOMg1wGTxnt9Cu8Tepk3mVIsPcVT9WOphbLoCJfTYG/OCoRqjgwRf7
         M863YEe2/m1qpe4uWA6fROBEZPmxJeTKNI0c8ufoeKdpugAwJjriht7/hbZCQ4md3Iyr
         VzdjWjKQlY2EMv+sGqA9mg2DTnnyXU9b/Q2uauBhBjl+vxMwC+ymDSD3qFjzmbSxLC7l
         nFiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GjEd9NzS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t9-20020a05620a450900b0073b41245a83si7574778qkp.333.2023.02.23.08.37.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Feb 2023 08:37:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GjEd9NzS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVEaj-00021U-Gi; Thu, 23 Feb 2023 11:37:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVEag-00020k-1W
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 11:37:06 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVEae-0000am-K6
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 11:37:05 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 x20-20020a17090a8a9400b00233ba727724so4299359pjn.1
 for <qemu-arm@nongnu.org>; Thu, 23 Feb 2023 08:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nSlzryF5KZJWLXPyGf6SJjUg8uAkeD/R4RAa93q3TBY=;
 b=GjEd9NzS4JVH+KzX27Tv1vA5kkd1OfIqvEpvoIqiVtIN/dnf8gcNGZOMztRbjJGQtg
 7RX8wCSy87QEjcwTnqoF9dcJOHCy63l9A5dyGRonuGHkYOA1++L/4KGT9r2NKfpvoLr2
 dnzSH97uqg07y7MJZd64cI9D/RIK9nEGOe1DKSHFRSRyI2q76GM8/UyDtegmzTdoAs1j
 w4TcuPNzV9XKTELf6vS1K67qx7fwS28Lz6/DRTgA732mvAnTxgbWGTfn1w6oFK8R6cly
 ho5owdudoGjbS3biYty0gw//f0xVp5VzVzfzAmZPdVoKip9Vtfj6Nr3sOHBQq+l+9mXH
 8ggQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nSlzryF5KZJWLXPyGf6SJjUg8uAkeD/R4RAa93q3TBY=;
 b=x4FrQPo+BxAkaGgTN4xBaIQEa60kANkQCDIX0qWG7mrYPoOmaLcd0+L9bKXyvkRkr/
 xYMz2DbI5rF2QP9fyH4bvO4wEbftMF+bo1Ri9uqrxv21SGkL6OBhdWSAlF36go/K+YGB
 NS/B5KKAoy8+8YYcHuBEcgv/evvBbeCyXXH+QEedaxaI5LlWBdTZM1YYgbCet7AQxCU4
 XDDcu4Wog++aDZ8LQclJZ1bzNeR2Lg4pYrULFmsSCA+9LcM8ePBeDMX8zTY/f5pQA4p9
 jOPpz3OcgoNqvnVUiyWN70yVjx24q3UlgQKSm7W9o8qgHj8bvbqqEPZiMsP89qbJP45W
 ZLgw==
X-Gm-Message-State: AO0yUKUWYGYFuKmdD99m14+kqD+N7iL/zuKYaQ3IFkE1blGxON3ygBbL
 nqwtrrWQ1NIiUm1jIvOYiREPNwYk+uXBV05gh4EEZw==
X-Received: by 2002:a17:90b:4d04:b0:237:50b6:984c with SMTP id
 mw4-20020a17090b4d0400b0023750b6984cmr1273721pjb.137.1677170223236; Thu, 23
 Feb 2023 08:37:03 -0800 (PST)
MIME-Version: 1.0
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
 <20230216030854.1212208-19-richard.henderson@linaro.org>
In-Reply-To: <20230216030854.1212208-19-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Feb 2023 16:36:52 +0000
Message-ID: <CAFEAcA_U31+vQC-58tffpzxreRgYC=TBzKRHrz=iJ0Sm9Szr2Q@mail.gmail.com>
Subject: Re: [PATCH v1 18/19] test/tcg/multiarch: Adjust sigbus.c
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1033.google.com
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
X-TUID: vrlkLb9K5qNV

On Thu, 16 Feb 2023 at 03:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> With -cpu max and FEAT_LSE2, the __aarch64__ section will only raise
> an alignment exception when the load crosses a 16-byte boundary.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
