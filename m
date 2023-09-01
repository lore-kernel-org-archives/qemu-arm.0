Received: by 2002:a17:907:76b5:b0:9a1:fa4e:495e with SMTP id jw21csp593386ejc;
        Fri, 1 Sep 2023 05:37:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdaXYvEsV3qtt0Y7EHF1JG2U+pJi7O5l9B/tqXHA0yz2YaMGAOC0QcKEfU0Mq9qImByagM
X-Received: by 2002:a05:620a:372b:b0:766:4a28:69ed with SMTP id de43-20020a05620a372b00b007664a2869edmr2279352qkb.13.1693571851151;
        Fri, 01 Sep 2023 05:37:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693571851; cv=none;
        d=google.com; s=arc-20160816;
        b=vUM5a7Ajypg25TCr/yct8EkGYFKt7XtY3BICNf0JRyyo/btIjZ4zDDvpS6pqNJPWNT
         r6rpNQ69LU/A6g4XfDsCJblbmiDefN8nA/H2g+hOGZZm8X1TwQJYDoPmDSOarX7cEFup
         kqpNFV2IUS5+j5pyM4+Ah+7N+1tnsp14aio7PPQlCN72pu8r0/xt9aBDod69aVyzrnhF
         povow3b2FNI/Nwnh/UgudedlDJXVD+G0mutjbCNLjwMaCLMRq0f7rJKnn2/OOjUxYr/X
         qbOTqOhUSl9F2GFz06bOhtEzJhaRl4yL0e6w1aEpuNSfMeOf01f8A4i6b+b4o3jq+3DF
         jHtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=jqPBSktY+h3+PVVMWVySJ5BiK+kCaxaXqMZawPApyNQ=;
        fh=/ftcwOPYeEIhzseC7WF42kR+xVR/IJiWpLC1+A7SOWQ=;
        b=K1N5FolWOuNWwi1voDa21qrB0hyEpOJdeeqKKNvMpMgiDOYVj6JUEHZWJd4t1eAlYs
         WpAEcZ/XDpdlDxyk0kAbtFyejlH/aTmwD2o6j0awBuV7I7WGQKRZBVgar8oO63chjTKp
         9jI6TdQvkDEuPm7+YgP59l0T4Y30L9kMuQ8SqxiykKiuv6jalg2Zkn88+dI0C/+aVYB7
         e5IPSMMrzGOkSHrq05sjYw5+oVoU/xp6uGlOPh51b4qQeOqqyYPIAW/5+PgAFtQAZZgK
         RrtXXdeyL1v+ITZKS9jgGVcL1wyT2vxnh4b0Hup9jwjnn3/cplGUE5INbtwOz1A8cbN0
         lPdg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LI88z5Fl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bs34-20020a05620a472200b0076ef0da9545si2377255qkb.736.2023.09.01.05.37.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Sep 2023 05:37:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LI88z5Fl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qc3Oj-0000UO-5W; Fri, 01 Sep 2023 08:37:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qc3Og-0000U4-SI
 for qemu-arm@nongnu.org; Fri, 01 Sep 2023 08:37:10 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qc3Oe-0002CE-HY
 for qemu-arm@nongnu.org; Fri, 01 Sep 2023 08:37:10 -0400
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-50078eba7afso3583351e87.0
 for <qemu-arm@nongnu.org>; Fri, 01 Sep 2023 05:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693571826; x=1694176626; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jqPBSktY+h3+PVVMWVySJ5BiK+kCaxaXqMZawPApyNQ=;
 b=LI88z5FlFr/LB+yFA8stOwXqqJqGz+qfKW9PC/4dRyiDIRLdbzcJ7Wd6fBh1Hvevsf
 Tcr/2Q0kWL/mH+g32E1XJk06fvgYAHZEupxw2tZZMVgncKp37hL7GdML40bOApiz5cDi
 4DXv0Ymmw+HB5RnuLNb1KcEaxqW6e4J92MIlAhYsXNOhIWeipduaSufZNxpYRgGjHjjw
 PMAtEXGKbBxy+E3VXbvoKVPCVTzBsqPSe1OMbSwFwHP31YV1M6rIkuo+j1VcQdZIPNCZ
 LYe5laDVgODcksJcmrZNTmMDo6k4jbCYHPZUdJk5x0+gjqwf7RBGPqQvbJzNhqbc/87b
 p7xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693571826; x=1694176626;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jqPBSktY+h3+PVVMWVySJ5BiK+kCaxaXqMZawPApyNQ=;
 b=Tzsj7bDZu2QvUAI+p9ppa8HS7Cjf9hh/WC5XPgKqrRZcDCRHEH0m8FhgVA3/3jO2uZ
 NSGgn0cUN2+jFIUAJKEmMInMX2Ab9NXpmjuJk7q0xNuKqv/o0X6U2t21SDlSqaKqlmMA
 h7k03zJ1h27K9s1FqkKRt/3iA9xhWBET8s1MMvnuwapFOzYiPT5juclNRhSGZP1f5VTi
 +z9YvLl7rCX8izAns0XCHuPFtzCJfFizvYJzomctq1lf5pIy5b4K4ShSoH1POlIblczN
 JM+4zp8UDXh/2nVgmaqujGlrsg5uxZEt8z5XnXd/lrdjZ8vg0xEKKCMRtNWLaA1ChZPD
 CoQg==
X-Gm-Message-State: AOJu0Ywr4YV4V8zE4AnQON5W5fm336+XKIzwTuRi7CGbKalvkDXQlgqy
 TvXjTRultjlaut65nN9FHpRyRFzr1QcR108UEVO3HA==
X-Received: by 2002:a05:6512:522:b0:500:977d:a4e1 with SMTP id
 o2-20020a056512052200b00500977da4e1mr1223724lfc.40.1693571826499; Fri, 01 Sep
 2023 05:37:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230727162621.445400-1-richard.henderson@linaro.org>
 <CAFEAcA_wYBSiBRy6HQaRh7k=UFrnQ=EwSQQ2e=7PJUzfyVp-ng@mail.gmail.com>
 <97884811-7b78-286e-fcec-248430a877b1@linaro.org>
In-Reply-To: <97884811-7b78-286e-fcec-248430a877b1@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Sep 2023 13:36:55 +0100
Message-ID: <CAFEAcA-7GkP-BeqF6tr6GEzkpmz_o1F3QSm2n_bR6KP9M2o7-g@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Do not use gen_mte_checkN in trans_STGP
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x136.google.com
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
X-TUID: dPVImYwg9eIS

On Thu, 3 Aug 2023 at 15:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 8/3/23 06:10, Peter Maydell wrote:
> > On Thu, 27 Jul 2023 at 17:33, Richard Henderson
> >> -    mop = MO_128;
> >> -    if (s->align_mem) {
> >> -        mop |= MO_ALIGN_8;
> >> -    }
> >> -    mop = finalize_memop_pair(s, mop);
> >> +    mop = MO_128 | MO_ALIGN | MO_ATOM_IFALIGN_PAIR;
> >
> > So here we're implicitly assuming TAG_GRANULE is 16 and
> > then relying on the codegen for a MO_128 | MO_ALIGN
> > operation to give us the alignment fault if the guest
> > address isn't aligned to the tag granule, right ?
>
> Yes.
>
> >
> > Previously we also put s->be_data into the MemOp
> > (via finalize_memop_pair() calling finalize_memop_atom()).
> > Don't we still need to do that ?
>
> Whoops, yes.

I think you still need to respin this one, right?

(I re-found it because I remembered this "writes tags,
doesn't check them" thing and that it ought to apply to
the FEAT_MOPS SETG block-tag-set that I'm writing also.)

thanks
-- PMM
