Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp958131lfg;
        Thu, 11 Mar 2021 22:35:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx4Nmj2+EOx/IXuMwJ36PKxjcQ9N6Kd/ee0ft8ruWL+nFPD1OnIjyd+jHd1w07eGUICKIBg
X-Received: by 2002:a25:c793:: with SMTP id w141mr17278446ybe.29.1615530928618;
        Thu, 11 Mar 2021 22:35:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615530928; cv=none;
        d=google.com; s=arc-20160816;
        b=MgU2s9ha1G2LHBLtWp6SUFByItntoVrHipM1hNZY0NdjeAeuZNipKwjwdgjOLT2rbZ
         qHD51VPOPwTzg0vLJkjcrYwZh2ZQzPp4xThgmZJ9a3K+jZzkRIuwGzrV32PCVtqgmdwb
         RFcar+odIVUlc4ByZCo9fQqBQkYUsjje1qy/oEcVlt9Q+2YQ2RxRw32shSUBJkGJSYqh
         OpktR8X63HKxXuUQO6Rw/OfyO+CDagADPyLCVNjv7Jrdtl1gBS8N08QUhN4pmlKJEpLq
         A/frgoDR/TOzJ0cGDKrcK8R4IBh9Z18yWBVDCQ/KknVhVi+Mq83HoI4QrramvWvGA2c2
         ylNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=51MDElGIrd0gOlrw0iLGZfFcICmNZ9NXvYc8V3cZNZE=;
        b=lkl1JGySE8ozit2xaGFpTE6Miyxlv0veLrzNW7lecWLiesa3kf+DxYYUc2DDLUhQ7q
         BrlorTOK9JE4igJQL6tSS3JJ2HSiONj0+8VjsU7V3jAf1BAuOtpnXHW5mVy5kJ//PT6A
         W/oLrgRbKx+mnm2x6SIBgfDe1ZESVP4cHj8PRc8ZEU7x92sfbsk+2fQ9EX7NnR3zITPZ
         hHh9ZaBMZDPxC7tujnBx3KM4ABZaMTkewNEhe6gN3tl77m6FkInwKqEsrGtsIho5Hxf9
         dbc4ItyIKPYjt7CGNuJhr7kxNfPvazsvmPobRBUynL/4cK1dZ044vJckvKo9xyjtxvq+
         pI2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=GamGiyYC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k125si4924390ybf.221.2021.03.11.22.35.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Mar 2021 22:35:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=GamGiyYC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lKbOR-0006V9-Qi
	for alex.bennee@linaro.org; Fri, 12 Mar 2021 01:35:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lKbMT-0004vQ-JJ; Fri, 12 Mar 2021 01:33:25 -0500
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:44770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lKbMP-0007lM-Hb; Fri, 12 Mar 2021 01:33:23 -0500
Received: by mail-qk1-x736.google.com with SMTP id 130so23258404qkh.11;
 Thu, 11 Mar 2021 22:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=51MDElGIrd0gOlrw0iLGZfFcICmNZ9NXvYc8V3cZNZE=;
 b=GamGiyYCwWgPnNyp8jg/1x2zTAHWXJ+OpZ/rGaH5W3OQnm1nKTZViTFc9P5SQhDBHC
 SDsumfW6rXeeyAEDdG9VpgYcYIwCvKcOjhkZb5+D3/wsNCtE6MWLMm4UI0OPrBtidSFF
 djTJAyjl/Ozn13y3N+u/AT9okqqbZOAaBbi1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=51MDElGIrd0gOlrw0iLGZfFcICmNZ9NXvYc8V3cZNZE=;
 b=mIq2fkkLRXpp835CEcVSQ9uIMfwqiMfI3BgOqSc1xeBmcY35uyavKYb4GBdE2606Dr
 kxC9HkbA4RmteGDkbeJaiPTeutCFPwb4sXokZ/j/X3MVBXDvUN8If6bqRNyvnKuFvRsA
 pNhao6q5/o4NgDm5n2U7nQ3KXxgHytEpQnvsX88KzXrmoR65w0Rqx94O66f+xxZNn1Ck
 ibbZOlzRi2U3aIU99JISKwC5xA/sWKf1N+tBuy+COOeva+zgGkdXCYhap3HhZeq8F4tj
 rzyBzEQWVmSnQDSgT8huNTRAjoP+yE7J116Z3AmIB3Ma1NpNH6u5Gtv7h2dyS4AWJcya
 DbDw==
X-Gm-Message-State: AOAM530MY8qFo5N81iGacvzU0DB+p9EJQ/udi/a6NTivGpFZAG+PyoeY
 tTM9IiwW/92ns0z5wya4CYPiVY/sntfvF1dxpYo=
X-Received: by 2002:a05:620a:4055:: with SMTP id
 i21mr11237475qko.55.1615530796929; 
 Thu, 11 Mar 2021 22:33:16 -0800 (PST)
MIME-Version: 1.0
References: <20210311234726.437676-1-joel@jms.id.au>
 <20210311234726.437676-4-joel@jms.id.au>
 <ee8d96c5-fc66-79f5-7ac7-f3bb443eb724@redhat.com>
In-Reply-To: <ee8d96c5-fc66-79f5-7ac7-f3bb443eb724@redhat.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 12 Mar 2021 06:33:04 +0000
Message-ID: <CACPK8XcDmchL_UX=RoyC88+QJj3e3wi_QrLjEfh_S3jpNDbCnA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] tests/qtest: Add test for Aspeed HACE
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=joel.stan@gmail.com; helo=mail-qk1-x736.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: H0lApwsYilzs

On Fri, 12 Mar 2021 at 05:53, Thomas Huth <thuth@redhat.com> wrote:
>
> On 12/03/2021 00.47, Joel Stanley wrote:
> > This adds a test for the Aspeed Hash and Crypto (HACE) engine. It tests
> > the currently implemented behavior of the hash functionality.
> >
> > The tests are similar, but are cut/pasted instead of broken out into a
> > common function so the assert machinery produces useful output when a
> > test fails.
> >
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > ---
> >   tests/qtest/aspeed_hace-test.c | 215 +++++++++++++++++++++++++++++++++
> >   MAINTAINERS                    |   1 +
> >   tests/qtest/meson.build        |   3 +
> >   3 files changed, 219 insertions(+)
> >   create mode 100644 tests/qtest/aspeed_hace-test.c
> >
> > diff --git a/tests/qtest/aspeed_hace-test.c b/tests/qtest/aspeed_hace-test.c
> > new file mode 100644
> > index 000000000000..52501ee37afb
> > --- /dev/null
> > +++ b/tests/qtest/aspeed_hace-test.c
> > @@ -0,0 +1,215 @@
> > +/*
> > + * QTest testcase for the ASPEED Hash and Crypto Engine
> > + *
> > + * SPDX-License-Identifier: GPL-2.0-or-later
> > + * Copyright 2021 IBM Corp.
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +
> > +#include "libqtest-single.h"
>
> Bonus points for writing the test without "libqtest-single.h" and using only
> "libqtest.h" instead. We should try to avoid libqtest-single.h in new code
> since such code can not be shared with tests that run multiple instances of
> QEMU. But if it's too cumbersome, I do not insist.

This wasn't too hard, so I went ahead and did it. I'll send a new version.

>
> > diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> > index 2688e1bfad7f..2eec06b10094 100644
> > --- a/tests/qtest/meson.build
> > +++ b/tests/qtest/meson.build
> > @@ -156,12 +156,15 @@ qtests_npcm7xx = \
> >      'npcm7xx_timer-test',
> >      'npcm7xx_watchdog_timer-test'] + \
> >      (slirp.found() ? ['npcm7xx_emc-test'] : [])
> > +qtests_aspeed = \
> > +  ['aspeed_hace-test']
>
> Do you plan to add more aspeed tests later? If not, I think you could simply
> do it without this variable and use ['aspeed_hace-test'] below.

I intend on sending more, but they are not ready yet. I will leave it
like this in readiness for those future tests if that's okay.

Thanks for the review.

Cheers,

Joel
