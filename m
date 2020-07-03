Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2814886lfm;
        Fri, 3 Jul 2020 14:16:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwStMPc5QpWU0Z727r3lSuWwqns32Kvt07RZRGReA/bOViTMKq2+wjmiAgONwF5dTq5WVGe
X-Received: by 2002:a25:808a:: with SMTP id n10mr44772691ybk.434.1593810961384;
        Fri, 03 Jul 2020 14:16:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593810961; cv=none;
        d=google.com; s=arc-20160816;
        b=Kzfe18MU5SJSBzyjv6p2dpGenhrLzO05xoSyJjka6eb4kS7uaPWaJoLwvumQnPE3mM
         n5uVJfhSwPUhLPtqGa8cDi3TVkoVVF5lsC6wDJFXTtejlTcqipDHA9ePdyEJGZ+yrHze
         74WTz9dY3SmBnmU2P4NBR457+zJ9bQxzCSwDu/93yaD2bs+4nksaK9Gjca0LT0+GrFKL
         M8p2iOgxOlgPDyHO7hi+l2D4SJFHeV1JBHUvfaWMThtslpTfCyVw93n4sJmgL6kFIU/r
         87RLGLT97O6CKBmmrv1k41KB5u061nugs+4QKRj4qpRaCRpTpZDH6X9MuERIWN3czNfG
         J8fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=QVYdKW8LXPkxZL2KE6aWM7nk/9iW09YPv1n3yc1coT4=;
        b=eRtDgIr4SBlMq4sHRWtmwDckvcJYJbuvGxvrcwP2FN4DRYHAjfEd8M1GNUr7R3ABYO
         dkz7R4+bCsO1LiWY+H8LRXkESlEqg9tZI1lFyuWenU+j1rBTrXtLx4UeQjzlzAu4egfe
         9TS9IHwD2OBXQHyCU0qFplFT7GElMFADChYrvPnlDcVY3icGlmtLW8zpQuZ5ippUBR7w
         cuSr8ohtD6CHN2kVj3zZa5Iz2B7Jq9KX0OLeR8ue1LBSs2Xyh3bT1oM2kafv04Gv0YBf
         yk9YirJN2WHQsAKJ3jXdqpVSdTdlJIiZId+ye3itf4Qve9KlHGWeVHgPYYqO5JVWTF/n
         bNdg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=vUUsb1n0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i140si1459375yba.71.2020.07.03.14.16.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Jul 2020 14:16:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=vUUsb1n0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:59910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jrT2O-0000fA-JI
	for alex.bennee@linaro.org; Fri, 03 Jul 2020 17:16:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1jrT2G-0000f0-MO
 for qemu-arm@nongnu.org; Fri, 03 Jul 2020 17:15:52 -0400
Received: from mail-ua1-x943.google.com ([2607:f8b0:4864:20::943]:44726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1jrT2E-0005FR-DZ
 for qemu-arm@nongnu.org; Fri, 03 Jul 2020 17:15:52 -0400
Received: by mail-ua1-x943.google.com with SMTP id g14so10406984ual.11
 for <qemu-arm@nongnu.org>; Fri, 03 Jul 2020 14:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QVYdKW8LXPkxZL2KE6aWM7nk/9iW09YPv1n3yc1coT4=;
 b=vUUsb1n0lSWcmNOf5Sk8UNiBFR7zj+Tq3t/aivM9P/JCaywIHf6M/Wt3aBMh3J/4Od
 rjmi7Iy2+8ZvK+M0SGrw02QWfToeMS5/vy4NY0kSvl6pxIOZ8JkCQ8OKiArdZsaIj7gs
 RAaMXFouUeLktaz1SNz7nDkECWvUyi9rGBcSYOuZi/xa+rh/zDKJ0LGvpkgMCOFgg9yN
 nKVPEtbI9v21jH0CB2Ksg6+iQWoYDboWpviRTqcBzzVcfF7bivsUOr1mvwWYB9SwCUmC
 YOAtMIwObUqZ13JH70/roTVb82/3VQK9nS46T+ZrqC+XpH+42pZWsajOslhMDjZWeNIw
 DvyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QVYdKW8LXPkxZL2KE6aWM7nk/9iW09YPv1n3yc1coT4=;
 b=EfDK3i1G+OD4HxRF4fGQ0FmGV5P7cua385gk7whdkC+RqPszM+jBv2bK9pypnUAW23
 eawHHEfkJpDarDKI2AYQdyNBDWgA3ZZL9Y4IQRHz8MYsjEfNEz633XjwQTlcxoE+KZIM
 xMobmsdFRq8ALOLfGS4MrUcxfhYumQsotzHwmixyIBP5946AnhOgEG4AMF3MmF/p0wQW
 GMwdTnuAcorzrBG1HppKzAzn3qc1CB//MAPRGhqzQ0jGdD3f+5VCfoQ0+S1Zwb45w0pN
 w9aX/YqbzKBEP2WSiDK2aobAP3/zQqzMYV2K/2DwD/pJ91CwNhs5Xq4eHns1IP8wZXHp
 LGfg==
X-Gm-Message-State: AOAM5331YGb0yE1viyvg6vkQedlp2QP59J/3riB4UVWJWWxCXM4ySdAY
 N1D0PJiZ3pu1mOgk2pUNfLi0J9Q0NoLSrzD75GVrAQ==
X-Received: by 2002:ab0:2b08:: with SMTP id e8mr17248847uar.119.1593810949038; 
 Fri, 03 Jul 2020 14:15:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200626235519.591734-1-hskinnemoen@google.com>
 <CAFEAcA_3y3XoF6BsYUt19f2CvyseahSEZWfY0iQxByJKaMA29w@mail.gmail.com>
 <296f281f-e045-e794-1a1b-4e311b6408b2@redhat.com>
In-Reply-To: <296f281f-e045-e794-1a1b-4e311b6408b2@redhat.com>
From: Havard Skinnemoen <hskinnemoen@google.com>
Date: Fri, 3 Jul 2020 14:15:37 -0700
Message-ID: <CAFQmdRbOKFxxxgR0hqcnABxn+jSBr349159m45TJLawVmnhR3Q@mail.gmail.com>
Subject: Re: [PATCH v3 00/12] Add Nuvoton NPCM730/NPCM750 SoCs and two BMC
 machines
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, 
 QEMU Developers <qemu-devel@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 CS20 KFTing <kfting@nuvoton.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 IS20 Avi Fishman <Avi.Fishman@nuvoton.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::943;
 envelope-from=hskinnemoen@google.com; helo=mail-ua1-x943.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -185
X-Spam_score: -18.6
X-Spam_bar: ------------------
X-Spam_report: (-18.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=_AUTOLEARN
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c1cdq2LWNKEl

On Fri, Jul 3, 2020 at 6:35 AM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
>
> On 7/3/20 2:27 PM, Peter Maydell wrote:
> > On Sat, 27 Jun 2020 at 00:55, Havard Skinnemoen <hskinnemoen@google.com=
> wrote:
> >>
> >> Time for another refresh of this patchset. Sorry it took so long -- I'=
ve been
> >> trying to figure out why the Winbond flash model isn't working with
> >> npcm750-evb, and I'm fairly convinced the number of dummy cycles in DI=
O mode
> >> should be 4, not 1. Unfortunately, I don't see any other machines usin=
g Winbond
> >> flash in DIO mode, so it's hard to prove that it's correct. I'm planni=
ng to
> >> post a libqos-based test suite separately.
> >>
> >> I'm also planning to add the vbootrom to qemu as a submodule, similar =
to the
> >> other roms, but not in this pathset (let me know if you do want me to =
include
> >> this in the series).
> >
> > Hi; it looks like codewise this patchset is ready to go in
> > and it's all been reviewed. I see however that all the
> > new files are GPL-v2-only. We usually prefer GPL-v2-or-later
> > for new code: is it possible to use that license instead ?
>
> This series has been posted before Markus qdev & error cleanups.
> Maybe some newer error patterns should be used now instead?

I'm not sure if I understand exactly what you're referring to, but
I'll do 'git log origin/master --author=3Darmbru@redhat.com' to see if I
can apply any similar fixes or cleanups to this series.

Havard
