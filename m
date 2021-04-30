Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp341108lfb;
        Fri, 30 Apr 2021 03:10:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyAJQN2DlMYpzr6U5zASpp/IiLlUiTRrZUkATpTN2GBD31sI3uUAl6i6HhUu3JWiD9oI/5u
X-Received: by 2002:a2e:9707:: with SMTP id r7mr3322602lji.181.1619777430065;
        Fri, 30 Apr 2021 03:10:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619777430; cv=none;
        d=google.com; s=arc-20160816;
        b=T5WASGxjj+NXSfhTknR22DJ74ELTX1JCLiIU3IYWWz4jIKI787z52pubOAHueU4RNO
         5kiRON9Lz/yaiFGZSyLdVCgDWyEe1xq643r/IQtlU3bU1/HGgJmVbWJSynU185kiKN57
         OdEfYPGwVPYj87Yt9nTpmhGd2lOF/mT0qz/m0OYxC2K68CSJ++60XBLR6gCnfxWPR0Ut
         BLgNRzFc39MFkz6efIN1Nm/SbfC8PycRGpHBUcHV8dtllea4iXPRat3lgeuQeVq20ju9
         VuSOrZ3pavrN4XGIvBaG2GNNAWO4gF2EbD7J/cgHkVi59JP6lFkNcZCSV2LDFAV47gtZ
         qjmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f+RCmHzIM+Ky487r6vtrtuO5U07tnTRET80SM5/e2X4=;
        b=M+LBFUUiNULRquQrKmKjJD2oV6fUTmoCZA/P0iI4CNhv0P+2NTujR29YK9RuC3Fu1+
         ikgw31SvMDHC+43Gmjhfetr1zzBdzXlwHUzqCDNAtmHJOq0Uho7yn3KzpFxZZu4+Y0CG
         wtYtgfp/IrlS2163dsRVYpkQ6eYCVVGQNXLcUBwJ9DBxfgqEAndtJKG5QXIkeVrWxkoD
         7l2wBhUbr36wlQ1z0GazWYoac3GKxsnTZI2uSOVL965s19FySlPcnHfbmLfphLxX2qVt
         PWPTKDExWq9SmtWn0lmd1q7f4MH8HnO3CbOWNFvI7Y0YtV08OOohoQVXsEVUCjGRs0ft
         BJfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Dr6ePxGL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m12si1988436ljp.198.2021.04.30.03.10.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Apr 2021 03:10:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Dr6ePxGL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcQ6P-0007T4-5A
	for alex.bennee@linaro.org; Fri, 30 Apr 2021 06:10:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQ6H-0007SO-Bp
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 06:10:21 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:41766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQ6F-0003fF-H5
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 06:10:21 -0400
Received: by mail-ej1-x630.google.com with SMTP id zg3so22811645ejb.8
 for <qemu-arm@nongnu.org>; Fri, 30 Apr 2021 03:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f+RCmHzIM+Ky487r6vtrtuO5U07tnTRET80SM5/e2X4=;
 b=Dr6ePxGLHN//G+MuBRjGjY46OcFtq+cujBA3t24W25skYUPCgFsaHCqIz71lJUw5X9
 wS2JUUHcSZ2Cr+hRrqXdJla5ob5pA+9tVyYeefmPQUZLiTOs/nnewgZQ4wCrUfnZQtuE
 8K8scX46iSIfun7vwb4cdd0Ky5jmrnk/vlfeAdK6BgGpKcEvxzt6Nrswf/33If0P9SQ2
 x7mdINNS4ShiV3X4i4m3iB5HFlqp2HNSTxLIykCfp5uCgK+5rZoK+g27aKIVsK6GAHpl
 9MLB6ySS9/7bidyp4vhruciPflJPv7auelwzzGhuetfTWEj1dQMJhwGnBk2+UlKfN80l
 3iXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f+RCmHzIM+Ky487r6vtrtuO5U07tnTRET80SM5/e2X4=;
 b=MLqWKqrsB68+70YrpJMtUjbjv5B0h8z1VK2CHWEMU3/GhGjLsghK00T7rWu7ToKZ52
 HrHDUhWJRoZopQ95FBTiwtpilK4KjTtzsTyRvPZz0cSbqLcK5vWZh1TedLPwWoc/rqPP
 EkmiekluRaxgRKbg4jU/c5C5wDlFcbLJzhg9+B5qXpa5mKQNZZX8gMdjaR8mUcKmAZ0x
 bCZbL5fjcUhJ/YVVq2s2BTFM80jlAQuDxds6RFAbJyCDQFFZqHcE9B+NAoGqBpHhVd1x
 t4I9vBO3ZUlUe+ttvp7xkFgj146JHqV5yc/ZOgD9YMZc0cBWLzD5YSD7q5Je9zzKpmoT
 HSPQ==
X-Gm-Message-State: AOAM531DV2OHYmi+NYKFykn/5McG9ByNzDivAByPGJCAd+0I3p4xJJ8N
 O6SA4M/MREl1D3cHcsjy83q6KYQM76gaPtI+ieWwqA==
X-Received: by 2002:a17:906:eced:: with SMTP id
 qt13mr3438649ejb.382.1619777416803; 
 Fri, 30 Apr 2021 03:10:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210401024152.203896-1-shashi.mallela@linaro.org>
 <20210401024152.203896-2-shashi.mallela@linaro.org>
 <CAFEAcA8OCs-sL1Zu-PwkadTvto3pJWO8VLcxfqmH7JGHXdeQuw@mail.gmail.com>
 <6e91d0458e38b4e782dc8e61de3ee0f875f8a56a.camel@linaro.org>
In-Reply-To: <6e91d0458e38b4e782dc8e61de3ee0f875f8a56a.camel@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Apr 2021 11:09:15 +0100
Message-ID: <CAFEAcA8EXUu8nfqz2Xn_Rke4Nk+cvdOuZOoFSfGkN6FFeTJ=yQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] hw/intc: GICv3 ITS initial framework
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Leif Lindholm <leif@nuviainc.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Radoslaw Biernacki <rad@semihalf.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XIieA2hqP/Np

On Fri, 30 Apr 2021 at 00:36, <shashi.mallela@linaro.org> wrote:
>
> On Fri, 2021-04-16 at 18:21 +0100, Peter Maydell wrote:
> > On Thu, 1 Apr 2021 at 03:41, Shashi Mallela <
> > shashi.mallela@linaro.org> wrote:
> > > +#define GITS_PIDR2       0xFFE8
> >
> > You probably don't want an offset for GITS_PIDR2 specifically.
> > Compare handling of GICD_IDREGS in the distributor emulation.
> > Tried re-using the GICD_IDREGS offset for GITS_PIDR2,but from testing
> > observed that the linux kernel driver and kvm-unit-tests both relied
> > on using the 0xFFE8 offset instead of 0xFFD0 (used by GICD & GICR) to
> > complete ITS initialization and setup

I didn't mean "just put PIDR2 at the GICD_IDREGS offset", which
obviously won't work, I meant "implement the whole set of ID registers
(of which PIDR2 is one in the middle) in the same way we implement that
set on the other GIC components".

-- PMM
