Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA57EC53209
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Jul 2026 19:04:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1woQcQ-00050a-VH; Mon, 27 Jul 2026 15:04:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1woQcP-00050L-DN
 for qemu-arm@nongnu.org; Mon, 27 Jul 2026 15:04:05 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1woQcK-0006sX-3K
 for qemu-arm@nongnu.org; Mon, 27 Jul 2026 15:04:01 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-81e6f0b4610so31549257b3.2
 for <qemu-arm@nongnu.org>; Mon, 27 Jul 2026 12:03:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785179039; cv=none;
 d=google.com; s=arc-20260327;
 b=OLy70oHRaRzC3RM9P8Bml3YzwKGLiKZ+iV3GJEATkfX/vXn6vP99u7sTE+24oyxQGZ
 VByNxhpSu3xkSlX9MJSn1hHPPpZ+2aKGFp/Euybq9HEDizTFbPge9jjmj7F8fF08OGkR
 6tjP0xHdU4fTNkLdSr70ZwXx/A1IJ5XNeRy1dTpw1NXxdAlwccvSRUG/mQaRYyMDSRmz
 5kzdGTYovOAneBT0gtUhRzEqqAP4suhRWGm8QZ7ObqLv/pWaoxBav9RPLOnodLrpnp5x
 tFC1UNCYKAJsQ+5VuPMoxRBU+gJeNOwPLG+k3Eku3kYj7jrPSoCM7tBZC1Ru3kJ2SPSz
 KGyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=zJ8q2SLa3qghmGJcmXM5jcnGMHbox8dZJ6QngwBQRxI=;
 fh=E0b2s+f7g6FlxI48lpsRx1A7Rz2hu+Gy2TVWIXnL744=;
 b=X4KlfK4QqDSso79EE30H4aSc3p1quRtXjk6Yjzvz1w0xgLYv4ekMYFvr+jLidZB8b3
 p/ce89/qbxyGewYt7L204ODL91AMyzBuFlHjyoHCO9itsu/DAN9SmnuEAHCryaPuZZOP
 satHgpjuF0MKQroX+DENKel4Lj3XBq6DQhMNd6SQhTCpPqzMf+25Kw6SIGF+KqCzRcxt
 lOx0j1EU7xDxdWHaDMo4ovUejtMq9nijC53bZGzxH18Vu/nfxIoe4D9vOXXD9CKwuch5
 pWXcxXZAS50zoX21QmKUkb+VW2nK3rpCrhoxGuotfkYJvWYqQ8HGZZHvO1BBTwZ/eTmG
 5pOg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785179039; x=1785783839; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=zJ8q2SLa3qghmGJcmXM5jcnGMHbox8dZJ6QngwBQRxI=;
 b=glmOittwxCB62/aEO8R8Vrf2TaXIozM7XDwVIIDJy+zrZFvMQS3UMLVNgin+ps7pFv
 /KLlG8ntxgH/Oj2SNKJ/2XJdq/OEqdkj6QJRJXZwhVdvqSjpsrfsHoSYYBUMLHyr6Obk
 iITE/JXkCXUrXOinPz/AbFxOuFYLsmCuBNeX3SQ2MwePjY0XjNnsTPy7KGAzfTh1/d55
 Ik5Wj4uOBHRr1sLD4gFO1FFc5c+6BKQ+DBGe/7/eCi+1YCIFS9ZSb8G2OSdkjfU+ShXa
 SJt09gNrdgdLX8ydvEJMOYfaj6adOAwlsuOly5bQyL5DxqyRUAR1ijxvmkJErCeLFuY4
 oHmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785179039; x=1785783839;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=zJ8q2SLa3qghmGJcmXM5jcnGMHbox8dZJ6QngwBQRxI=;
 b=UXtlGEHOobx8EgdwLsAQioAw8Nff3cVQLt/fvPiF9leIW5DYVb0qsVbvx/T0s7+jhE
 l0Cou/1KiVrlULkFo8grISv4cKkH+r9X2sV9FkhnhlanJTI5C4vZQznUIzlgcwmDJDsN
 G5pWQEBczqQJB4J6G06PJ2xO5Ucqs8qQzcdcT8YdDsOVNmE8xUZMcQqFF9wzPRctuYVM
 wd529VBFRuXV04S44OSFX8YwZFhekv7p/o0KmcU9nPUsSaVbmc3wa4UTbgVrmdDWF5u9
 MX1C7iNIG2WP+EBdk40lsu8mepd02jJGpYy3YjsC+M3UMB+ljP3r9ovpgyWd081yK7w4
 YkXw==
X-Gm-Message-State: AOJu0YzidcB9+40d/2PokjmBIFOX27/i1caCdIFT+OrLoGzUy0joeXe0
 /nxx5gNFqwxjqr1rDz7N5KIXDSO7f5u6ywXyfGDm8Rq7ZdXH0Ung7CF/iMrtIIWjFQRhQq7IxyO
 ihRvLpARg2rU13dEMaD7Ngrh2fRZ1kj+HYqcDviLNtQ==
X-Gm-Gg: AR+sD13JMUwyqh8CV4JX+UA+5CFU2UU6LMgz+pHz1BxnvFcLk2v3rsZtZm1FQmmZrxe
 L4W2CBPfn7ohq67E5G9C2A6jTx2eQFPetydgvsBVGhoFo34gvEabwiO9UiJ18D7Qbid95c+qvKU
 lJpy2RCd0F5D9O+GfgWS1KowK1ADY8wnHFX4AlLkI+UhBM5sYd+hCUnAnthMVbOnOcicarUsIk2
 DqPPpFuG1SGtOvYvc/IFtcZToXTpJyGsBZAkEDeRRu0w0X0s4wDfOMz3IyOzW76R23DtjCnqZr/
 EokiRXjAvxYEpj+eEmRh3hOUlCBZvrnDw4DKWfcfAdU1Qw==
X-Received: by 2002:a05:690c:3681:b0:7b2:1bf1:8016 with SMTP id
 00721157ae682-81f93930c80mr3524567b3.2.1785179038579; Mon, 27 Jul 2026
 12:03:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260727151325.1428686-1-peter.maydell@linaro.org>
 <ad7b0a31-5bca-420c-9c75-6e90a930d15c@linaro.org>
In-Reply-To: <ad7b0a31-5bca-420c-9c75-6e90a930d15c@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Jul 2026 20:03:46 +0100
X-Gm-Features: AUfX_mw2WVUznsmippAjrRhNSCKmUW6SKIqqI7862M3-wAHoRV9CusfHtMSe-sg
Message-ID: <CAFEAcA-kGnCVZtAXXQP0UHR0W641P9zE0XFD0qX-L3qbtjZOFg@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Don't NOP the SEV insn on v6K CPUs
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
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

On Mon, 27 Jul 2026 at 18:48, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 7/27/26 08:13, Peter Maydell wrote:
> > When we implememented SEV to do something on A-profile rather than
> > being a nop, we got the condition slightly wrong, and made it only
> > effective from v7.  In fact the instruction's Arm encoding has
> > non-NOP behaviour from ARMv6K.
> >
> > The effect is that a kernel boot may hang on a v6K CPU like the
> > ARM11MPCore.
> >
> > (This wouldn't have been so noticeable if we feature checked the WFE
> > instruction, and had made the same mistake for the condition on both
> > instructions.  But we never have done the feature checks that we
> > ought on WFE, so the mistake on SEV meant that we showed the 11mpcore
> > guest a WFE that did something and a SEV that was a NOP.)
> >
> > The v7A Arm ARM is not entirely clear about whether v6K has the Thumb
> > SEV encoding or not: it says "ARMv7 (executes as NOP in ARMv6T2)",
> > leaving v6K not stated.  The 11MPCore TRM says it has at least WFI in
> > both Arm and Thumb, and the v7A Arm ARM uses the same condition text
> > for WFI, so I make the assumption that WFI, WFE, and SEV all get
> > their functionality for both Thumb and Arm in v6K.  It's possible
> > that this differed between v6K CPUs -- the 1176 TRM says it has the
> > v6K STREXD/STREXH/STREXB etc, but the WFI is the old-style cp15 one.
> >
> > Keeping the condition check the same for both Thumb and Arm encodings
> > is the conservative choice: if guests try to execute the Thumb SEV
> > insn it will be because they want SEV, not because they want a NOP.
> >
> > Resolves:https://gitlab.com/qemu-project/qemu/-/work_items/4044
> > Fixes: 60e7ee5bb7cd ("target/arm: implements SEV/SEVL for all modes")
> > Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> > Picking this one up because I think we should fix it for 11.1
> > and Alex is on holiday. The "WFI and WFE should have a feature
> > check" part we can leave for 11.2.
>
> Really?  I'm tempted to call the mismatch between wait and signal to be the "real" bug.

Well, it's not great, but the lack of feature guard on WFI and
WFE has been that way since forever. I suppose we've only
recently made WFE do something and as you say it's the paired
wait/signal where things can go wrong.

I'll have a look at a patch for that part tomorrow I guess.

-- PMM

