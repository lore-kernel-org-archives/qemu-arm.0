Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp248543lfq;
        Fri, 11 Dec 2020 08:48:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxe7qN9O4RTY9HuSaUm+rjixp1nJ6FYisu4VgiJVSo6WdHIzjped3NuMjDVMBxBBab+jezM
X-Received: by 2002:a25:374c:: with SMTP id e73mr20967708yba.376.1607705296042;
        Fri, 11 Dec 2020 08:48:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607705296; cv=none;
        d=google.com; s=arc-20160816;
        b=rQqOpg82xUbZv8X7oK1r/d/rncyE8pFN+yaigqb4/388ekJJ0igwP6B6hxJd5wAhe0
         Szq6wRbkwKjaO5ti+AZvXpfrCHflHO3M9kOdwVM42uJbbBjqhBnj9tdlm3zUX0u9TxYf
         Hk8R75+uWJjw3e0tMYQqls1Vuure11+iDPLmoHP0yFrERDanhMiVaip76pJKsfg32dHz
         mdLd485pfzq6t8eiUgGXXOTw/Y5DJ7tZtG8gjkR4DtMjfi+tHTpnDFEmZKSCeY5FFN7l
         7yTTuuavCHNlWRRCiMDqocSa1bHWg1qBIZZ76b/Xf75/7x+WGep00PyzklcEAdC2W0TD
         3GDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FtFahMWUkxRH3ltuNlCugR+DBs5lwmd7BUQy5DiOZ9c=;
        b=0mZtTwSVPDxVBjOzhKokwr6DF9cGyZU9moLXwFKVZOj82Z2WG76xEkhniEEnvoD4Q+
         xpaWcgTF2/OfE8gV6eMu7BftScp4NB2qbGWRfRZAQNso31z2/8tYYzd66kt4qVRosnPT
         dlF54vQdMnjpdNzh4JlxFBhE4AmnErxRAJF1Mf4uodCzfWtaaPtWwkK9DCek4O0cx86u
         oHkwFhIV21iFocc6+3WNLjHHU45+5okK0i7pYHkzj30AktpPP6mVROdNZEHwEMLeQZHk
         xZn9T4x/ix87+v1p+Vr2NgnbOJ4nOdq35/U1jCYaYS1tb9V93liPXEd4AEo8sQTTjSvf
         tDjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=oEhS7gSV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g11si9094482ybc.446.2020.12.11.08.48.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Dec 2020 08:48:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=oEhS7gSV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1knlaZ-0004ra-De
	for alex.bennee@linaro.org; Fri, 11 Dec 2020 11:48:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knlZp-0004p6-SX
 for qemu-arm@nongnu.org; Fri, 11 Dec 2020 11:47:30 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:37616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knlZn-0002BX-1Y
 for qemu-arm@nongnu.org; Fri, 11 Dec 2020 11:47:29 -0500
Received: by mail-ej1-x642.google.com with SMTP id ga15so13233990ejb.4
 for <qemu-arm@nongnu.org>; Fri, 11 Dec 2020 08:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FtFahMWUkxRH3ltuNlCugR+DBs5lwmd7BUQy5DiOZ9c=;
 b=oEhS7gSVpRHn5YciAEauWSPvNlb6NMI3u3nz+nSmMFdkU48Q0XTJQ5f46/YSJXRvhG
 DEHe8GGWNQTANnSttuCDUmIHvbkr8wP/U00AzbObK7VCTjzBQOLiiycmDAxMOZ11SoCW
 Zq8qH3MPEs4IEda/6YMxjQ8ZxRSXBDdjobDEc9YVSwY5AlRN4cY/CAPE2Xh3GQCYmeNV
 VOGfwDmIz1D2muoT/0Vz4cfLJ3cw6skyJ80ktaEd5XpIB+3D8qqNqVYXv99eVpc40MTe
 8c7YOZIWWXQnclZjAOOIvFpWyvSF9qIHe+hrsPDCf/yv8AH6xjR3V/4NuK3lDCuw72Fm
 DXAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FtFahMWUkxRH3ltuNlCugR+DBs5lwmd7BUQy5DiOZ9c=;
 b=a3x58yY9W+KnRHYSzvlTILGdpAy2ULlkm+YOt7d7A5t5yO4clmH/ukBxDVj3FRsA1q
 jLjgSfbfQgFU2Xs1TTL1BK7mBSOYP5PcA0AFXSMQ50KzObsOdjgEziLvOFx/LBJIBAge
 mlbR2srECkNoYXCIFWuWTX1Igi1EBHE6zdUG+MLbin/qEK3hIykWYydZ+Asnw4m5alfw
 6Z2gArc3+KpOKqRd03G+NfTBfNrA02bQ92Ve/bhIMMqHRfja9FhXrp+EBVM2ydfVgCa0
 DJurcSWxD8sK73XvOEwGfoGyo7WALPvQI8NGbqnTwSYbINDuIPs5BcYk33X/t21tiR0N
 1KNg==
X-Gm-Message-State: AOAM532zFnJzNBaOqSX6Q/LJ/Z5RRe7IH2JGGAxlkSufgfBzZPJzgbXE
 WP6/ui/dZqL7/p31FpV+GIlgT2rBh1qeLGFD7G4edg==
X-Received: by 2002:a17:906:6b88:: with SMTP id
 l8mr11831626ejr.482.1607705245328; 
 Fri, 11 Dec 2020 08:47:25 -0800 (PST)
MIME-Version: 1.0
References: <20201208122306.8933-1-leif@nuviainc.com>
 <20201208122306.8933-4-leif@nuviainc.com>
 <CAFEAcA-vT4eAxn7K=ULu7wGomfW7akEG=eSVGp4j7CSKtksuHg@mail.gmail.com>
 <20201211161236.GT1664@vanye>
In-Reply-To: <20201211161236.GT1664@vanye>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Dec 2020 16:47:13 +0000
Message-ID: <CAFEAcA-aqTt4zsd0Eq8dpyJJ7hArZHKx_ge8=Us8DVMpHeXBSA@mail.gmail.com>
Subject: Re: [PATCH 3/5] target/arm: add descriptions of CLIDR_EL1,
 CCSIDR_EL1, CTR_EL0 to cpu.h
To: Leif Lindholm <leif@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x642.google.com
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
Cc: Rebecca Cran <rebecca@nuviainc.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aXR707tx2GGR

On Fri, 11 Dec 2020 at 16:12, Leif Lindholm <leif@nuviainc.com> wrote:
>
> On Fri, Dec 11, 2020 at 14:45:55 +0000, Peter Maydell wrote:
> > On Tue, 8 Dec 2020 at 12:23, Leif Lindholm <leif@nuviainc.com> wrote:
> > >
> > > Signed-off-by: Leif Lindholm <leif@nuviainc.com>

> > > +FIELD(CCSIDR_EL1, ASSOCIATIVITY, 3, 20)
> >
> > The ASSOCIATIVITY field is bits [23:3], so it's
> > 21 bits long, not 20, right ?
>
> Err, indeed.
>
> > > +FIELD(CCSIDR_EL1, NUMSETS, 32, 23)
> >
> > Similarly, NUMSETS is [55:32] so 24 bits long.
>
> Sorry, brain must have taken holiday.
>
> Would you like a v2 of this patch, fixing those?

Yes please.

> > > +
> > > +FIELD(CTR_EL0,  IMINLINE, 0, 4)
> > > +FIELD(CTR_EL0,  L1IP, 14, 2)
> > > +FIELD(CTR_EL0,  DMINLINE, 16, 4)
> > > +FIELD(CTR_EL0,  ERG, 20, 4)
> > > +FIELD(CTR_EL0,  CWG, 24, 4)
> > > +FIELD(CTR_EL0,  IDC, 28, 1)
> > > +FIELD(CTR_EL0,  DIC, 29, 1)
> > > +
> > >  FIELD(MIDR_EL1, REVISION, 0, 4)
> > >  FIELD(MIDR_EL1, PARTNUM, 4, 12)
> > >  FIELD(MIDR_EL1, ARCHITECTURE, 16, 4)
> >
> > Any reason not to define the other fields here?
> > FIELD(MIDR_EL1, VARIANT, 20, 4)
> > FIELD(MIDR_EL1, IMPLEMENTER, 24, 8)
>
> Those are just context, not added by this patch.
> (Glad to see I'm not the only one making that mistake...)

Doh!

thanks
-- PMM
