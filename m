Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp2114503lfq;
        Fri, 9 Oct 2020 02:35:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxpr/hIn4coW4duagbaOlh91HsZhgCjd+70y24cWe9YDJLBCNEmsAYFR94zh4IcR3TCnv6r
X-Received: by 2002:a25:3ce:: with SMTP id 197mr16096212ybd.233.1602236137850;
        Fri, 09 Oct 2020 02:35:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602236137; cv=none;
        d=google.com; s=arc-20160816;
        b=c/slGA8nHbJteVqjENS3/83fp3fn1SqRXfw3wF6cCDmlh453NL+L/iP4uQ9AiCB4sf
         m/kC9N4UVielHtB4Z8hM0Wv2s+8zwxLLG+3muG6ZbVLjGIUJ2cNk+qOM3EOJpVZ+ZDv8
         otN9fj+6T1yHjxrkZ4+TKzHX2zmTjcvFyiXMrU5tnkWWKXzt5Cf13AEkzbqijg9pVM8x
         85wruU36af65PGrN8/ssr6FRZ4NvQFLqKy9ctYZ5YGBuUhjHZpJZAbBPYvu9AxbbkDsM
         U3ZXjmTHhdGahQpmw6vUuZgOewQR4bvC/1FvHvaULbBDUpvjiT/oE+EzFj027hyUb6K3
         7p1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Px80NKFRN/Qhwq8fc/3pbACbxDFmAXwGiIdglnUmglk=;
        b=BsWKScDjFu1UiDrE0GEN4IcByX7c32RVC0WJE9T47/1id7CGeHcs3jsZarwM5qlLY3
         mDr6v4HkoOuYexbD8HY7VI83QakMV8xp0k/KGWy/s447dPy6Q5pCFWPLXra+ZygRWW57
         BZA/7gw/trfZT1I4TCKkwsTkBDv6s6Zg7VKim31T9p6gQ9+EeVc+eMfZlGP+dVmv6RUC
         IqL5lMna4hhIMTdnBda104mZ3xfM7ZI2gM44hHaeGvf1GAHfMulmgIHSEmpJl2QK0Ww8
         zZjbEq2i707LN68pBIbyTvJKMmukaGHGPvUONJlvC9oZZwym6haKx5qtxQtmMhK75IvZ
         ZKsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qiz5q2f0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s8si6164841yba.420.2020.10.09.02.35.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Oct 2020 02:35:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qiz5q2f0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kQooL-00088j-99
	for alex.bennee@linaro.org; Fri, 09 Oct 2020 05:35:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1kQooD-00088N-Iz
 for qemu-arm@nongnu.org; Fri, 09 Oct 2020 05:35:29 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:40326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1kQooB-0004bF-2L
 for qemu-arm@nongnu.org; Fri, 09 Oct 2020 05:35:29 -0400
Received: by mail-pg1-x542.google.com with SMTP id i2so6722201pgh.7
 for <qemu-arm@nongnu.org>; Fri, 09 Oct 2020 02:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Px80NKFRN/Qhwq8fc/3pbACbxDFmAXwGiIdglnUmglk=;
 b=qiz5q2f0D0j7UYcxqnlgnsFgrYxlGWfYJLzrDF06q/7Z2nYQyJuMno/lBZK54srW2e
 HZrM6j7t4sLLYumRB3jxYH4N+/6M/qOssCAxWsp0t5vpuUdp/+dXS64AzAKeozG3EoAw
 huGtF8AGUoPb2H+9s2XTHtbIGc/VZLPNF8UATDv5wt1HJ04saXtjiOVaFv+4CSP6ieVx
 IT8iX0CfUFhn2NT8ay6bIyORVFoJkp0q8/97Adu7+vj6hOM/Ij54M7nYHIB5WFq+dsCr
 pn8Bn9tiCYd7GtNWAe43i1WjzpUtoTZHQAs1FfEU/Xj0hEJUwmlBWJNOzJrl12Kr3CE3
 PrRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Px80NKFRN/Qhwq8fc/3pbACbxDFmAXwGiIdglnUmglk=;
 b=kHxd8raZGqWe9dGHuKdDeK74YKYSC7sBT1VRW9RfoOsamyLO6Ru4JzzBsHTL4dOEM6
 mra2W8VggDw9ndJk0dBpnVWDyHfqDeL0Gvb2YjIGtynPwi1FjTZeUBnPB+2b7rdnhBKN
 Xc8s1LQPPGnPpSPjc0TotnQmBBmDx4NOznN13cJUAHT4oN4/xlcg42XSlzRw/8sLYkaS
 qIMzA4rw1saf+vKWkqC078/m5cO88e0bgIie2WhtJGmaMkd8pZKlyFyGrU9S0N+VoOM+
 GfeMc7JXQRlULrC6MBhsWJ1/ubAJVzN1wvelpd2VbskXrlC3OcCH7NLYfA2+7nnlCci7
 NZ0g==
X-Gm-Message-State: AOAM533ZjkHry5JL7vxlwZcrWJNzHv8lzl9A2D0l0E2lElvoJ0aKxSPf
 aI6r+7mZQ3IKu5vcMQpxnarlkKQV2LL4KW4NMmKgbQ==
X-Received: by 2002:a65:64c1:: with SMTP id t1mr2660395pgv.55.1602236125529;
 Fri, 09 Oct 2020 02:35:25 -0700 (PDT)
MIME-Version: 1.0
References: <20201008024203.112303-1-shashi.mallela@linaro.org>
 <20201008024203.112303-2-shashi.mallela@linaro.org>
 <CAD8XO3ZRGqNbr1GM6jMAdhm=pPXXr6K7m_F0MKRDQMnrDw=yDA@mail.gmail.com>
 <CAFEAcA9QRJhorL1XtWBCQk9uo21OtMHUrH7ipG3tiFbOBGizPQ@mail.gmail.com>
 <CAD8XO3YaavVfz6yaAx2N95B8a87tkp=-GKt814Zou4e7B+cVvg@mail.gmail.com>
 <CAFEAcA__EG5Ou9W0H24oEKFA9Ft11n6pjcSwD-ZG4Bir8=3Xhw@mail.gmail.com>
In-Reply-To: <CAFEAcA__EG5Ou9W0H24oEKFA9Ft11n6pjcSwD-ZG4Bir8=3Xhw@mail.gmail.com>
From: Maxim Uvarov <maxim.uvarov@linaro.org>
Date: Fri, 9 Oct 2020 12:35:14 +0300
Message-ID: <CAD8XO3bNhRpsHF40KLWJNayL-FoX3vSyubAyUUPC++Btpdt6QQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] hw/watchdog: Implement SBSA watchdog device
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=maxim.uvarov@linaro.org; helo=mail-pg1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 Leif Lindholm <leif@nuviainc.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Rados=C5=82aw_Biernacki?= <rad@semihalf.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: djFQnedJ+NWs

On Thu, 8 Oct 2020 at 17:09, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Thu, 8 Oct 2020 at 11:43, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
> >
> > On Thu, 8 Oct 2020 at 13:27, Peter Maydell <peter.maydell@linaro.org> wrote:
> > >
> > > On Thu, 8 Oct 2020 at 11:21, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
> > > > Interesting why gcc does not warn on  64bit signed to 32bit unsigned
> > > > truncation here. Looks like it's too smart to understand
> > > > that value fits in 32 bits.
> > >
> > > What truncation? 1000000000 in decimal is 0x3B9ACA00 in hex:
> > > the number fits in an 32 bit integer without truncation.
>
> > I meant that LL is an long long int which is 64 bit size type. And
> > then you pass it to uint32_t.
>
> Yes, that's fine, because it fits. The LL ensures that if
> you do a calculation like:
>  uint64_t max_timeout = 16 * NANOSECONDS_PER_SECOND;
> it isn't incorrectly done as 32-bit arithmetic.
>
> thanks
> -- PMM

Ok. Thanks.
