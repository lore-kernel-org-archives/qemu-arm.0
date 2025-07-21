Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 185CEC83F25
	for <qemu-arm@archiver.kernel.org>; Mon, 21 Jul 2025 14:04:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1udr6z-0001jN-BA; Mon, 21 Jul 2025 10:03:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1udr6t-0000qe-HS
 for qemu-arm@nongnu.org; Mon, 21 Jul 2025 10:03:21 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1udr6q-0004Q6-PS
 for qemu-arm@nongnu.org; Mon, 21 Jul 2025 10:03:18 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-70e5e6ab7b8so36050647b3.1
 for <qemu-arm@nongnu.org>; Mon, 21 Jul 2025 07:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753106595; x=1753711395; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CYVQe0Mks7K6hEfZs7ov2VhXUKLZCR1ICDo08+Q05aY=;
 b=FoQRAXOfV4R1ih97sLggWiU1CPFtwdqYzrtEyC2pumOTRPd/gRGFICpkkIrV7eym/e
 QiO/2qeG8zVg6C5GbjOvznyRNye6OIWcWJqi6iyZPYYpbGAnBMgSRRReCTDwG4aIUWtP
 5phbS7C26DwyIsJh2qW+kNeUENJyXSmH/2WyG/wxuOLYPqHD4AiLaFIVyXSO+NQ73iOf
 W1Z1iW10zyfhV/WCv40Ph/KHc2LPRXn0duxRLrprskakZHJtbwVEouDoJux5uTwRU56g
 bF+YtYQUmtWu/KVsfGnyOo0EjXqfYSJMy0lgRHrNhwpPj+NUX2q5nKbfeVMnDe950ajO
 EZig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753106595; x=1753711395;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CYVQe0Mks7K6hEfZs7ov2VhXUKLZCR1ICDo08+Q05aY=;
 b=nAmE3yGFIwU6INQNL++l2Db3t8YhX6RGbo92epICbgYcdG6jBzX8ADN7c+lpy9o4/C
 W0JA2RYEoMIvN9AcxxPpfXyaPL16r5xw8Ho4Njy/fWYH0bSXGJjuilJz/R474Inj2jy8
 c8gkp/Htb32/yCDqR/WKIIH7k7rLo/uK064aMi25kGJKv8uNItNGSxzctYdkBalNyUiH
 z1LBFFIXyDkr5WpwzXH3Qsm99tbmjxemfqDpdQu2HhdnEEAV5GIhHYeEgZq5zo6GWYOc
 4AWoKD5uFp0Ok9macJP1GrLvrWFdwAZ30e0zw3VKJlFpYVm5cmcvzsTNlObneVKZ//mQ
 C5PQ==
X-Gm-Message-State: AOJu0YwhgNYpuVDSnHVaKFSDOIjvJR9R/kxU7eM4C3rGAd5xnOU8UVcp
 w3y/QyUgC9pweUbdNK561KdLd/qdN8quUGAzApOC3wigCrWUeYbfvkGFPIt2cyn5KaJ1nYfetY7
 nkkEMJ+UDS4/ZrUJzJK8ptqlVPA5jt46CyF1jS66GRS9NlFUQziJ9
X-Gm-Gg: ASbGnctdsJgyFtW7xENPRmoFr7o0n03YRvwMmjFdsbbqRG4I5NF4MQpot2sNM8mSFxg
 TP4wWcLOPnQMhIpmL2PprGzfzJaVMmrAYE81sjgio5sp5A9PnLZPlnJU6K6WcxY5EsGDo9zLrOg
 GHvGuYVUSQz1uHfFkloaqgTlYStZOMzcShwkd4SIfKWE3qhuGDsz9yalkH3UFYsOAdlfNslAnBR
 Eds6iB9
X-Google-Smtp-Source: AGHT+IHsG9Fmrl2imd+MQNO4Jhzw1CzGekKQ2Z/zJ+9wt9/QH9rKlHxu/bfzKU9FZMWix8CpXJ4g8LjI9mlRoUjt5nY=
X-Received: by 2002:a05:690c:4905:b0:70c:b882:305 with SMTP id
 00721157ae682-718351ae978mr280071237b3.36.1753106594747; Mon, 21 Jul 2025
 07:03:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250714165523.1956235-1-peter.maydell@linaro.org>
 <20250714165523.1956235-3-peter.maydell@linaro.org>
In-Reply-To: <20250714165523.1956235-3-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Jul 2025 15:03:03 +0100
X-Gm-Features: Ac12FXzQCJ_IkNMo4Ne1_A9_EHvTmQFabt3QlXuTagGeVCSyrmNR5nGgIe7mEyY
Message-ID: <CAFEAcA8pSTpOne-u6BaEABhxcCXn=BvX4U2VF=pw00WFAc8yTQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] hw/net/npcm_gmac.c: Unify length and prev_buf_size
 variables
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>, 
 Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Mon, 14 Jul 2025 at 17:55, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> After the bug fix in the previous commit, the length and prev_buf_size
> variables are identical, except that prev_buf_size is uint32_t and
> length is uint16_t. We can therefore unify them. The only place where
> the type makes a difference is that we will truncate the packet
> at 64K when sending it; this commit preserves that behaviour
> by using a local variable when doing the packet send.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Should the behaviour really be to truncate the packet at 64K
> rather than flagging an error if the guest assembles descriptors
> that combine to give a too-large packet?

I see Jason has picked this up in a pullreq, which is OK given
this isn't a behaviour change -- but it would still be good
if somebody with access to the datasheet for this device could
confirm what the actual correct behaviour for attempts to tx
very large packets should be.

thanks
-- PMM

