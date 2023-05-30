Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2259146ejb;
        Tue, 30 May 2023 08:29:29 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5zSLpM4UP74UgbyHQkvjaUjHxrSfkG6yvA+kafNbSraOuwvkeWj+DfqKSjqmFsjPNrvUbt
X-Received: by 2002:a05:6214:230f:b0:626:1be5:176b with SMTP id gc15-20020a056214230f00b006261be5176bmr2781727qvb.42.1685460569292;
        Tue, 30 May 2023 08:29:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685460569; cv=none;
        d=google.com; s=arc-20160816;
        b=1CqISHUGXipU2JMPzWVm4SMSQnjdDiJmmyoOAERUBAqCqrGgRO+3Ha7dRSXhhoiJQS
         BIx90EdJCEAqdZuG6ZbJZLu55kjvTpLhITZmvd7dIlOc34VcgMsqaU/HFx0OJBRKslKN
         YVhGqSLRLzZyJfsIVFHAeDdBvmb3oa30TLf/IzKpgnl2UMJ8j19nKD3cr4KAgfWYAD6o
         1iaN+kbkJGwvt9FYSvmqUogxJ+UYhVrlxs8P30iZB/NL712Z24W+60fA2Afr4aVRST2w
         lbVeJPFMF2CNeUHYNTjCNMwnn0GtPl94yABtU6Cnsx+FKxoxff5U5lumapLW7OLFOLeZ
         eJ4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=9+mbQDFX68G3E3jQzlb7cQlWENF/+5t9iERv400eN7M=;
        b=Bqlx6c1gPnOcgtrXP8N3QttKgb1IoVCWszrUnIps07cVY4mcNnsYFBp+o8mieDwd4u
         /0zpEPuWAJD9k0n7cvr1+atR/PT22CAI1v77PZ3HyvT0ptdY4vsEOPFujW0G92Xm3JLN
         lQnxysBUQvF6y1XJbNQyTBtq3leZcrVvEhxL9U5kt3VnMY2jzKwklXrZhBip0C/rEPu4
         RouU00Jpsk6nAHRQ7J2ca1L8ylB/F7lVs+Fpqk8kj0LZzEoKUovAAEmsRg5B3ZvAzhzh
         R1idmmB14/8vpCquryLcMxhtySt+n2tmnZwGpYVdQXltBbtSMdy6Inb5SjLsyB3/H6qR
         U1Ww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TyOkjxG+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a10-20020a056214062a00b0062576fb8e11si6746002qvx.599.2023.05.30.08.29.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 08:29:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TyOkjxG+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q41Hq-0004BT-OX; Tue, 30 May 2023 11:29:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q41Hp-0004Ax-R6
 for qemu-arm@nongnu.org; Tue, 30 May 2023 11:29:25 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q41Ho-0001pa-2t
 for qemu-arm@nongnu.org; Tue, 30 May 2023 11:29:25 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5148f299105so6970133a12.1
 for <qemu-arm@nongnu.org>; Tue, 30 May 2023 08:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685460562; x=1688052562;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9+mbQDFX68G3E3jQzlb7cQlWENF/+5t9iERv400eN7M=;
 b=TyOkjxG+LSacde180KuEKktGIpb1AAM/6HmCPzVCWXfQPB52/nDbYjc2LA27Gh4kpH
 ige2A3mNcZQjZ7ic8K7Fs3ELqau++XT5hUYBJqNCS76GFgIpx8F1FQiaynybGR5Om9C9
 Q2GS3xYv/UXawLUOLQh5eqBrmeD7HUC3MfL8PXib7cHATuOOqlsJXeoPKPjppGJwf8a1
 GDR4bncrM6Csa2vXA/S3pyi2wAAzF59VP3cFq2/YuKygxsx7yGdp3bOwb8vz9lbAHVBg
 kfdxt3Taw6oHM0QBUuEEuCiEd5JH56oxw3gDy47kXB/if1fqkYT69rc6BjVjUGsascEJ
 Wl0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685460562; x=1688052562;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9+mbQDFX68G3E3jQzlb7cQlWENF/+5t9iERv400eN7M=;
 b=YzmDUh/dh5ASw5pGZnGjMvtWfDT+QvrogUTfkvQ43IOryX3vlFyPRRVzQ3IyscXfeG
 JlAWifWuJgJUi4Jg3Sm4csGUwGX79qq5GJ/s4EONwG67eQruDzc6AQljgtO1d3jJePBl
 pBlBnLdIAyjAxgn9gtQLzIbvdjPintCzBTbNZoUOj4iYHEoBpJVvERGElqRsT+Ozb8sg
 DZuQdxaJ6lYNtWh6qRJO2IW1xaQ4DepPy7HIRffTx9O2ZKNePPOlUAWmMBf28jQOJ2oC
 WJLOwx0lCcT5nW7Ty9lm0EWd8aM0xSytz8DonfH2X12DIy1NWTPE6aKiHiAHECQxdJos
 skdg==
X-Gm-Message-State: AC+VfDw7kOsOtSoFnO4EK5aiHCkJkjV3va20OWZQLM+1e9Ohkny4jjGI
 DudN+8Tx3kP9fO9bMygK33ni3Uct2+2zUkL94AEQog==
X-Received: by 2002:a05:6402:2038:b0:514:9e47:4319 with SMTP id
 ay24-20020a056402203800b005149e474319mr2845808edb.5.1685460562231; Tue, 30
 May 2023 08:29:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230525232558.1758967-1-richard.henderson@linaro.org>
 <20230525232558.1758967-6-richard.henderson@linaro.org>
In-Reply-To: <20230525232558.1758967-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 May 2023 16:29:11 +0100
Message-ID: <CAFEAcA-7PK53g+m4atTfOh1cHBZUqZxynqocL85M_0F1FoupNA@mail.gmail.com>
Subject: Re: [PATCH v2 05/20] target/arm: Use tcg_gen_qemu_{st, ld}_i128 for
 do_fp_{st, ld}
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
X-TUID: uLA65wYAoFQL

On Fri, 26 May 2023 at 00:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> While we don't require 16-byte atomicity here, using a single larger
> operation simplifies the code.  Introduce finalize_memop_asimd for this.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate.h     | 24 +++++++++++++++++++++++
>  target/arm/tcg/translate-a64.c | 35 +++++++++++-----------------------
>  2 files changed, 35 insertions(+), 24 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
