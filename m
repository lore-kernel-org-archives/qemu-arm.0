Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp5145254lfa;
        Tue, 3 Nov 2020 13:21:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw9ZIrzpZ9mRR1R3xhTyVyZqH2QxulRA6q/oeuftjTUrvyiiQnNkiL91YE4W9CvHBZdUvk/
X-Received: by 2002:a1c:55c1:: with SMTP id j184mr1118671wmb.180.1604438487083;
        Tue, 03 Nov 2020 13:21:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604438487; cv=none;
        d=google.com; s=arc-20160816;
        b=rzsbXfU3gPnH2rxoPS4HK9275K5AQ1BMNvYR8+oDO6XziAAEgY0nhSmmUR9WcMhnmb
         f4ESONh1DBJe1RXipkdGRu9MTokbNwH1wsU2gj9nY68c1nPaD6AD4UH6QiKsgYsSSfNm
         8lIbLyB5N9EUSoz0NMQvro4ZMnabvG6ySEA4m+rDqcOZnG1bFPseEIN75OGY2+KSLxWW
         GThXustpd37QKYWMv0OV7H6lsy/iP4jCFQUDgrtoIr6wvdo0yQB9gZjU+73tLnFbbsVR
         EgbtcnOIjJ8P+spxOj6/a6b0h6beSN0CLzafVvP0q4iWeOILcxRvZ+eeOz3yu0+ErEvO
         ce8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:organization:message-id:date
         :subject:to:from;
        bh=JNPo9Z0uSNLnJstUXKPJ+ERlT2d/QD8u5Mzo+T7hjJs=;
        b=H7rXqbVf6oPkbOQ8ZNvGzMb7UmUoDqqJolSXy/JQTydxT/wkOrtteVfGwOlpq31Euh
         P1Kf/jtZxerx5lAWJTv3RzQ0aDCzPApaUquvJjQx6HEZuY00J5QAcvTC1VpAdQbVm4wC
         Ybhaylr2JJB4MDeDdD2k2hhe/lX9F+DU98qZUGW2o7pU/lCrDod+b5qbFTYrOW8bVb6U
         n/B1BskGcOj6QudIVdpYIQB+HXII3yy9joDEJqAKCd7ox9+y5kIU4UqIdkUYuNQYFfk4
         md4Xd5uCQ/RWEhLrMUVJhjpKb2gr0eljgHQquxaaVVoXZBGPwuT+3RNI+oGfaYD1EFo6
         h2ew==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r18si20013948wrw.307.2020.11.03.13.21.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Nov 2020 13:21:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ka3k6-0004WL-1l
	for alex.bennee@linaro.org; Tue, 03 Nov 2020 16:21:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1ka3jw-0004W2-2s; Tue, 03 Nov 2020 16:21:16 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:57462
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1ka3js-00068e-7E; Tue, 03 Nov 2020 16:21:15 -0500
Received: from basile.remlab.net (dzyqn8ypzhx7l91mxjsvy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:a01a:be01:9434:f69e:d553:3be2])
 (Authenticated sender: remi)
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTPSA id 6A1465FB6A;
 Tue,  3 Nov 2020 22:21:08 +0100 (CET)
From: =?ISO-8859-1?Q?R=E9mi?= Denis-Courmont <remi.denis.courmont@huawei.com>
To: qemu-arm@nongnu.org
Subject: Re: [PATCH 10/14] target/arm: do S1_ptw_translate() before address
 space lookup
Date: Tue, 03 Nov 2020 23:21:05 +0200
Message-ID: <1855963.usQuhbGJ8B@basile.remlab.net>
Organization: Huawei Technologies, Finland
In-Reply-To: <8ebcf033-7044-ee14-8b84-3812ff041d5c@linaro.org>
References: <2172054.ElGaqSPkdT@basile.remlab.net>
 <20201102105802.39332-10-remi.denis.courmont@huawei.com>
 <8ebcf033-7044-ee14-8b84-3812ff041d5c@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 16:21:09
X-ACL-Warn: Detected OS   = ???
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0YA03rYikEpF

Le tiistaina 3. marraskuuta 2020, 21.54.48 EET Richard Henderson a =C3=A9cr=
it :
> On 11/2/20 2:57 AM, remi.denis.courmont@huawei.com wrote:
> > From: R=C3=A9mi Denis-Courmont <remi.denis.courmont@huawei.com>
> >=20
> > In the secure stage 2 translation regime, the VSTCR.SW and VTCR.NSW
> > bits can invert the secure flag for pagetable walks. This patchset
> > allows S1_ptw_translate() to change the non-secure bit.
> >=20
> > Signed-off-by: R=C3=A9mi Denis-Courmont <remi.denis.courmont@huawei.com>
> > ---
> >=20
> >  target/arm/helper.c | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/target/arm/helper.c b/target/arm/helper.c
> > index 4c86e4f57c..7c70460e65 100644
> > --- a/target/arm/helper.c
> > +++ b/target/arm/helper.c
> > @@ -10403,7 +10403,7 @@ static bool get_level1_table_address(CPUARMState
> > *env, ARMMMUIdx mmu_idx,>=20
> >  /* Translate a S1 pagetable walk through S2 if needed.  */
> >  static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
> >=20
> > -                               hwaddr addr, MemTxAttrs txattrs,
> > +                               hwaddr addr, bool *is_secure,
> >=20
> >                                 ARMMMUFaultInfo *fi)
> > =20
> >  {
> > =20
> >      ARMMMUIdx s2_mmu_idx;
> >=20
> > @@ -10415,6 +10415,9 @@ static hwaddr S1_ptw_translate(CPUARMState *env,
> > ARMMMUIdx mmu_idx,>=20
> >          int s2prot;
> >          int ret;
> >          ARMCacheAttrs cacheattrs =3D {};
> >=20
> > +        MemTxAttrs txattrs =3D {};
> > +
> > +        assert(!*is_secure); /* TODO: S-EL2 */
>=20
> Are you sure that you don't want to pass in txattrs via pointer instead?

That's possible too, and more like the existing code. Though I thought it=20
clearer to pass only a pointer to the secure bit in/out, seen as that's the=
=20
only in/out parameter.

> This change by itself looks questionable.  I guess I'll have to look
> forward to the other patch...


=2D-=20
R=C3=A9mi Denis-Courmont


