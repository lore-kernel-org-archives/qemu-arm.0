Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp5063354wrs;
        Tue, 27 Aug 2019 03:47:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzmP4LsUAjVXyQJkw/kgbjYse5zsOeAEu9Rfxb7XwhGFkTszgLIsWoSJiACFJTRYASaoD7z
X-Received: by 2002:ac8:5554:: with SMTP id o20mr22325493qtr.236.1566902825901;
        Tue, 27 Aug 2019 03:47:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566902825; cv=none;
        d=google.com; s=arc-20160816;
        b=gaLXDFJxmdW4SkUszThye1Pw6UCvMFLbJkcFI+ZAQVttxRir2+HLjVTlXqbGSsEdHA
         yPJQSMu/3Tu06TEwK8l8JbCREjlDU4Ob9nOfkVE2ly46IMn2eXNUreu4Fon9Wo1zRxUX
         o+gVIpST+y0N9BB5xnVGy8DIzynzGOXkyM4ovp1Jp75dXyhd0CeMFWKGOOjCSmaakb0R
         Xpa87IfHPbUNGMy3yCBdZuLuDFxXDxlTMVlNUqDZfTFyjxjUOave8Ce24nA4LOPjvn7u
         ROcBsq6kWwTavIgKkyK948o6cFp4coB/IwqLJxsorjqI8+ul0NJq3CHdoBXzxnupDDLh
         zPwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fMdFblafD94Pg7EdUX7Bt3ViF3OCQnoMFCqUfT0Ylhc=;
        b=G7eQRI3pQoh1NwUiwaESnqMd0aRr4CfBRO4+adYEOf3QwTLKi49yRgAiKhn8BcjBYd
         R6UTBGglxGpv+m+XV8zg0OgnqzwCELtN63kx4r12kH3dmHWF3LmspEr3MShwgbQ1nHri
         sXkO2SZlnPnBfJvn1EbFUqGXYlbEXMY/t28wdLigqeKmUb3zQi759N5o93FPiUFeN1Bw
         wYr3J6q9LL8d38fJqXLZg7UHFZxRD2DZ/mmOIMp7Dk5Cj+f5gtKo+KwGGZUUGDb/3pGB
         CGa+9EpEWOPPYO02RHPdgZ4d1e6X0FRxTOo8ZUazMpPvtZJTIfzrF3v9P8lDlnA7e4Z7
         puDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OYzdmrQ7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a30si10058336qvh.197.2019.08.27.03.47.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Aug 2019 03:47:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OYzdmrQ7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i2Z0C-0002p1-GY
	for alex.bennee@linaro.org; Tue, 27 Aug 2019 06:47:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34571)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i2Yzu-0002lo-GV
 for qemu-arm@nongnu.org; Tue, 27 Aug 2019 06:46:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i2Yzt-00025m-Fx
 for qemu-arm@nongnu.org; Tue, 27 Aug 2019 06:46:46 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:43741)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i2Yzt-00025X-A6
 for qemu-arm@nongnu.org; Tue, 27 Aug 2019 06:46:45 -0400
Received: by mail-ot1-x344.google.com with SMTP id e12so18191719otp.10
 for <qemu-arm@nongnu.org>; Tue, 27 Aug 2019 03:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fMdFblafD94Pg7EdUX7Bt3ViF3OCQnoMFCqUfT0Ylhc=;
 b=OYzdmrQ7NUlZI5AHNhnQeSe/nXlwYW7SgwRsA3b4L3D4bw/w+K2BVF3cPycscudlKe
 GhDWhkO4j2ZHqXOKB7/2/WQKWA01ljQ1bX14B36OvJiuRfL3kF7S2R4Tn2RHdtN3yyJ0
 nsUGlQ7F/hUWGIK2GQAQ+NdtrsQTESXKUmZQB1BGfB3/a5brBesXKgsJxKK5LDKBVxce
 e7I7SWNNu2NXn7hDYWAI/IznuRR3XVEpLZ7Z4FDTVFnqaiFnFMun72vRstwJ49MJvN+g
 ij0DnBFyy5WO7hEQwmNnUvEEp6g2+rLIbV/KUIfCST9sJa4ajKzHEYzzcjUcSLE8nXv1
 60Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fMdFblafD94Pg7EdUX7Bt3ViF3OCQnoMFCqUfT0Ylhc=;
 b=bAzRCKWTn+CBJT75FNMEDS/xWHmqdWUpugqKzEhuF/VEqDSHeZRrA3ohtm5QZK7QG+
 HQCP2dg1aiYcsP6s25w/G11t62trcfej5/Tc1Pn2ll5PHMZoTlGcvrkvEEflMrVflSwZ
 mdYzb/m/DuF8+Pb+WVTDuPf7ACi8w3g885ppc6Vc21GoZc47idof/jb2k9NOhWLTpSfN
 CtHQkFOaLTeN9787DjLIQuBZ0h9XU4HHGLiAlGWmfvm3d4D9MRMUR696mOi+Lqzks7jt
 9AEr6JUrYokKg4YYaiVRv4w5dpTHZofZaRdx2ryNF8+0FogzrxdHnpkm0K88Y1aKcgnV
 qx0w==
X-Gm-Message-State: APjAAAXiLP5j9SYoA6DO1EhZNMDyySjCYTBt4kADezylnbAK6S9oDyNa
 6VACpNbl+2Vw6PvmcTJWv3ccjPkif3ZC4GnI4AkWeg==
X-Received: by 2002:a9d:4817:: with SMTP id c23mr1098975otf.97.1566902804446; 
 Tue, 27 Aug 2019 03:46:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-22-richard.henderson@linaro.org>
 <CAFEAcA8saD6zkOA7-6nF5jQBMgKPLv0L3WXV2m0Y4WtHwVqWgw@mail.gmail.com>
In-Reply-To: <CAFEAcA8saD6zkOA7-6nF5jQBMgKPLv0L3WXV2m0Y4WtHwVqWgw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Aug 2019 11:46:33 +0100
Message-ID: <CAFEAcA-PG1Jd2F-DLp7yKQest3aWqb3pv4FjUB9movDf4VgWgA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [PATCH v2 21/68] target/arm: Convert Synchronization
 primitives
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bbZt9JmRcshM

On Tue, 27 Aug 2019 at 11:44, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Mon, 19 Aug 2019 at 22:38, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> > ---
> >  target/arm/translate.c | 560 ++++++++++++++++++++++-------------------
> >  target/arm/a32.decode  |  48 ++++
> >  target/arm/t32.decode  |  46 ++++
> >  3 files changed, 396 insertions(+), 258 deletions(-)
>
> > +static bool trans_STREXD_a32(DisasContext *s, arg_STREX *a)
> > +{
> > +    if (!ENABLE_ARCH_6K || (a->rt & 1)) {
> > +        return false;
> > +    }
> > +    a->rt2 = a->rt + 1;
> > +    return op_strex(s, a, MO_64, false);
> > +}
>
> I've just noticed that there's a bug in these checks -- the
> M-profile CPUs don't have the V6K feature, but they should
> still have STREXB/STREXH/STREXD, and with this test they'll
> incorrectly UNDEF them.

...OK, not this specific function, as I just noticed it's the _a32
one, but trans_STREXB(), trans_STREXH(), etc are wrong.

thanks
-- PMM
