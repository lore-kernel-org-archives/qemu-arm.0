Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp1030545ejv;
        Thu, 28 Mar 2024 03:47:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVQceLuqw9oABTqBTQUr8JQCgZC5v+0+g0Xr7j8K4U9Zv3EG5LzR1b0bfuL8NpRoLGYH41EtP9xKQ903xtWqVza/3gKadYA
X-Google-Smtp-Source: AGHT+IFX08UrB8z8r1TeTc5YCDUp62DOkUgbpg7XK6d8wTKO1Pzy51zbsOTdAeeD7oDfZiLCtbLQ
X-Received: by 2002:a05:622a:1307:b0:431:38ea:1d42 with SMTP id v7-20020a05622a130700b0043138ea1d42mr2754406qtk.30.1711622850862;
        Thu, 28 Mar 2024 03:47:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711622850; cv=none;
        d=google.com; s=arc-20160816;
        b=aeMwBtUGICxoYOgix0G75Cw/Hhq7e9vYk3kXaVUfK01R3sOfcL9fQdewEGuamXHyDj
         9hyX0w5VGobUQtEtLnAvUDxlEv83p7c2pE+pwoHO/bxlsO51927ba4cjS+SZ2QqYm2ax
         H0UmLY9NifPlr0BYr1ZZBY1ZrJ2/z6gDKyr5MOWaR2Dpv9tzuPTJQTDXQjYToNBaU4QM
         IkxqNpyMDg5X2gjS1NB/rThnNfw02FmM+xpwJTv79Qw5aiUYvdavUZkP9aaW4kItug7i
         L5oapQpe9+G7z3MjosA8/H6jzBWLd08SojPY3WIkDuGnT6/x5lpiJDDjXS0FyPANYK9R
         GImQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=mtgrdYN8FimGo8IhYUXXXHISMt6fwqAisk0ui8/+sbo=;
        fh=rrC0IiwZluTb6ts1GmE/blsieFw36DGKkcd/wb/Vg/8=;
        b=V2WpfYlZRE4Gtwe0mZHO3ZyPV1Fw6TEWvaDZYCYRUx6fi4ttZ/c1PQLjEzWDPq1ZwW
         ifh939NAOu+y00Kh2Z5ot5gDHGmCJuwQ4fajm/Oipz0TRvifjv5/+spRhvtBtnw4/gU4
         75MYdfxKb0fgTm6tJtYI18C/F4J9EttzeqQna62xZQgLeAbthWzFAM65egIrdZD2fkjA
         cyfNyPonHhruH+Ae8pvphAUjCJxOuAz++vId4G8MTdrnZg3cqGTCHkjtJ3k1gK95Q4Oz
         RcZ2N8Jogtsw6x2AexS0MIj+3snZAV8iP6A1HN2poNtsfWA1JpV4WbpqqOk9D9/qZlz5
         hT0w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Dvu8YM9J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o11-20020a05622a044b00b0043175068184si1116056qtx.76.2024.03.28.03.47.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Mar 2024 03:47:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Dvu8YM9J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rpnHs-0007ka-Q4; Thu, 28 Mar 2024 06:47:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rpnHn-0007j9-6m
 for qemu-arm@nongnu.org; Thu, 28 Mar 2024 06:47:07 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rpnHk-0003qi-T3
 for qemu-arm@nongnu.org; Thu, 28 Mar 2024 06:47:06 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-568c714a9c7so871712a12.2
 for <qemu-arm@nongnu.org>; Thu, 28 Mar 2024 03:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711622815; x=1712227615; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mtgrdYN8FimGo8IhYUXXXHISMt6fwqAisk0ui8/+sbo=;
 b=Dvu8YM9J3sh9Jmm+T4oLfnLis1tfjZdsJ2wZTjNgGurN+nz/OZD0jh+DrbKIIPII8l
 2tgauzR17U+cZUf1wWO4MtDg31NuPIsfoz9zcpaGKVSUuA9KWHAsTlVz3HxwgvKtCeVW
 SRXRRvXCFOUHUsbZcF3dEZ6hSTjlRrssvptGCFHhy1/vvCNNpla0tmEpol+t29xOmeiU
 41OVgnYTmtUz44TYX6EMTm1x4Oi13BBNS96ek+EwJy9XgfiG8DoDdLBYEC2mBEFhRM7l
 W3G935wNR5WC1hjf+L+s+nnqvGp1JtjI61N2efYUL7uciCMw+y28gBvSpUyEoGIPgGFN
 C3iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711622815; x=1712227615;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mtgrdYN8FimGo8IhYUXXXHISMt6fwqAisk0ui8/+sbo=;
 b=T+3MDvQ+VqCIF6Z8O03DUg/OVP8TWqttH0/7YQsyHxV1NYTr6EFWKj1s8hv9AKOGCi
 8kguXWO+suVTZqIinHhX8/9zNW3//IyVgswvdrq3u+vJrPK+/yPtS1xBU4NF2/LGamZh
 jhY6BkFhmao7QN/06lAizrOMrCqy3GkuY/5OcIBqx91aDq9amC9wrgztLrurYNNtOH1H
 dJsdnJvzmgkvGw+s908F1Dw6XnDGv1pCaSuK79aoHWOUQGLqObjGIQNy+vSE+l1GdCuz
 c2eJoKPibvXcn6DUOlL248syCUOlZStY/KJ1vX5G3J4n1lNiLO5RqwAfNe6k9Sf5BNph
 PhVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFNvRQIH+L9m13bcbVgE/zcqY1+k5lWvm/p7+tSx4QLvFjTHs/+9hGr8wWQyWeFfat+eeUJ/DujSUWeVmSk/ULLtON
X-Gm-Message-State: AOJu0YxbQO4+bJIL7SjgtpreoA3x3k8lZfyo9tp34+zGSgmiR8IDe8hL
 JSSQHdJVbT1srtiex8ry0mwttfBFkzzgdhMP2zd4YeFWswc7ftovET0mELBx/9nYy00sLBmLucw
 FBTPslfsFsIYC/lOeTb5+NzDw/j6r8A/JKKDzZA==
X-Received: by 2002:a50:d743:0:b0:569:e401:42db with SMTP id
 i3-20020a50d743000000b00569e40142dbmr1877814edj.9.1711622815303; Thu, 28 Mar
 2024 03:46:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240318093546.2786144-1-ruanjinjie@huawei.com>
 <20240318093546.2786144-10-ruanjinjie@huawei.com>
 <CAFEAcA8_2U6bydhixx+j84FUBY3tT5rN8Y4c6KHGjbbAX+1v3Q@mail.gmail.com>
 <1a10de26-97aa-260a-7c5b-dfb9a4949790@huawei.com>
In-Reply-To: <1a10de26-97aa-260a-7c5b-dfb9a4949790@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Mar 2024 10:46:44 +0000
Message-ID: <CAFEAcA9R2yBs5Qm4shBp8K+aEFC4uc6=dWKACUMLRRsibqdcbA@mail.gmail.com>
Subject: Re: [RFC PATCH v8 09/23] target/arm: Handle PSTATE.ALLINT on taking
 an exception
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org, 
 wangyanan55@huawei.com, richard.henderson@linaro.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
X-TUID: yLqQGjdlFQx/

On Thu, 28 Mar 2024 at 08:57, Jinjie Ruan via <qemu-arm@nongnu.org> wrote:
>
>
>
> On 2024/3/20 0:47, Peter Maydell wrote:
> > On Mon, 18 Mar 2024 at 09:37, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
> >>
> >> Set or clear PSTATE.ALLINT on taking an exception to ELx according to the
> >> SCTLR_ELx.SPINTMASK bit.
> >>
> >> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> >> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> >> ---
> >> v3:
> >> - Add Reviewed-by.
> >> ---
> >>  target/arm/helper.c | 9 +++++++++
> >>  1 file changed, 9 insertions(+)
> >>
> >> diff --git a/target/arm/helper.c b/target/arm/helper.c
> >> index 4bc63bf7ca..81f4a8f194 100644
> >> --- a/target/arm/helper.c
> >> +++ b/target/arm/helper.c
> >> @@ -11705,6 +11705,15 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
> >>          }
> >>      }
> >>
> >> +    if (cpu_isar_feature(aa64_nmi, cpu) &&
> >> +        (env->cp15.sctlr_el[new_el] & SCTLR_NMI)) {
> >
> > This shouldn't be checking the value of SCTLR_NMI here:
> > the new PSTATE.ALLINT is set to !SPINTMASK even if NMI == 0.
> > (The SPINTMASK bit description is a bit confusing, but
> > the correct behaviour is clear in the AArch64.TakeException()
> > pseudocode.)
>
> It seems unreasonable to remove the SCTLR_NMI check, because if the
> hardware supports FEAT_NMI but the kernel do not enable it, the ALLINT
> bit in pstate will also set or clear when an exception is caught, which
> seems unreasonable.

Whether we personally think it is "unreasonable" or not does not
matter here. The architecture says that we must not check SCTLR_NMI,
and therefore we must not check SCTLR_NMI, or we will be implementing
the wrong behaviour.

thanks
-- PMM
