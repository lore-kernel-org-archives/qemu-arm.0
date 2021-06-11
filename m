Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp313880lfa;
        Fri, 11 Jun 2021 01:31:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOZOsZJ0vMxM2HHc3tlghuiZoR1NR1zGZnIXX5gO9g0qkj6QfIUsMFMuQd5BZkaU+T/0Fn
X-Received: by 2002:ac8:544:: with SMTP id c4mr2721765qth.299.1623400296631;
        Fri, 11 Jun 2021 01:31:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623400296; cv=none;
        d=google.com; s=arc-20160816;
        b=qU8M/7UKQWGNgGWA+8ENOee8MhFKfTLtw3H83OpCxi0f9GN4bB/agi4QdHBA1sn1N9
         e6HjzD5/Lz++dl+VRci6YGYsc4IFBvpnfO2Or5fCZ7qhlLuvOzTjDJ2JXcY5r8te2i6N
         FcH6PrSQpE9TdzQN7VUySYcw4FdSs/EisGHftsOng5X5GfzikbM/fC72cRQfomnc2f9W
         oTWY2Inroq5j0ufv2mUx8VP2Jqvy9D+3R06DcS86uuJafP9/JzUgDfK9RmaK+6lMNJCe
         Xf7cP4V7vqdKsb6l+Tm9nxt1/C5mvKTXM43raGZOvdw+3ds/2US8PC3CPIXavqsypdIK
         f2bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=os1Zi9gB9AmbSY+oAb903lickpXSZxQY7RdNqWuC4b4=;
        b=eA9HPCqvVPh11MSgX1rgbWSMO90xVmtGMWpGo18Rfz4srpko6qGd1t2Nmx1zVXTs5A
         LOuiM6znOli1CnXx+2HnZBHiOKRdxU31YpoQSOKAx1Bx2CRjnKN+sSkF79+3i8FX7B30
         fd7BK3yWYBfoDA+ED6jtmsKlo6kWdjKXxT2hWAD/Qtd2PtT4GSx+nW990kUuVM8/Fyi7
         ZdFIYBsdKc2orgroIG8+eE/KiyhRRcTd6PTh+itQKvcNpRj47jckcJA8nONTnEyi+YAm
         ypHFXAqRkEeHbUbslQs+ajQa3HBLh0rLtak0BlIqWkLkb5JJVrSizGmdaRucqSs3Kri+
         ZOXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LJmLZ9G4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y6si1862391qtn.329.2021.06.11.01.31.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Jun 2021 01:31:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LJmLZ9G4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lrcZj-0005YC-TH
	for alex.bennee@linaro.org; Fri, 11 Jun 2021 04:31:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lrcZR-0005W4-0C
 for qemu-arm@nongnu.org; Fri, 11 Jun 2021 04:31:17 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:44690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lrcZN-0003oy-BQ
 for qemu-arm@nongnu.org; Fri, 11 Jun 2021 04:31:16 -0400
Received: by mail-ej1-x62c.google.com with SMTP id c10so3311555eja.11
 for <qemu-arm@nongnu.org>; Fri, 11 Jun 2021 01:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=os1Zi9gB9AmbSY+oAb903lickpXSZxQY7RdNqWuC4b4=;
 b=LJmLZ9G4EnMG4p5x/yvBBbb+ErjgJGZ2zipZjNtLOKDIIuBPQKyt0jhZy9myT+dJoM
 U4Be0ip2hWmLbAf+//U4pKEi+zoF5xESvpKFY8GbMUsWH98n6porHpsVrqct51+A/Hcn
 ndFpvtaxLnaEKyDsoeSBpqOr1xKuklC1kU6irdPWJeNxjF261DEtH6bu2ZqN7DLl/x/a
 UUbD3TyK0/Ga1gBzVKcowxRU4wbzLU1xWjyhFKIn2+2T/GCsOB3eonX3j6EXKqXTl9tZ
 0cbaZBJMeZObSizL5Rg/LbsCA8kk/eeRgQKZQj4cq/YWHNTrNTnYTWOZ9o7q69SHTkkB
 2yXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=os1Zi9gB9AmbSY+oAb903lickpXSZxQY7RdNqWuC4b4=;
 b=uOZbiHOfXj9ypPJtUXrRatOlvUzGSvfxoMAHR7V75hHpfziw9+QWwO9+1i6sSHHQx6
 tst+ru+NyVQY9lUAZbMKcKvpvI+4GqDTE6s1timYrUCmG9mDyhXo9siK0filWUzSDhyA
 Tol+wcmS/UMAHE+rCU6Doao9ouU5f9x+PGwzVb0td/Lw69OYouy6V4TD/ZgE8v2Zsxun
 46488skz8Vny2JYvqIqs9K1/45CdARON9/TGRmHMkJPy5ZgG1J3c5RsfsEYkGCGV3D+o
 CVV+5z33mlqZgxRhO1BGzYWCyKYrO2Jt5jkEkLwPqgLNJ0QDYo0LdXMRqB9ZBLVkgWVy
 vs7w==
X-Gm-Message-State: AOAM531JAdyBE7N128szf/6STbSf6xaHqxDGU+Qvoqp5xHepoy9syZ1f
 op9ZDpjGBEns1KYykYVDh1PpbbACRwKiJzC7VUQv6A==
X-Received: by 2002:a17:906:b294:: with SMTP id
 q20mr2579808ejz.382.1623400270748; 
 Fri, 11 Jun 2021 01:31:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA-=w8WA5o-nnR4VuEDV28n65aCzM9M0Km8yTDGy=NHL+A@mail.gmail.com>
 <551DAA51-CB17-423D-896F-AF0443A5E7AE@getmailspring.com>
In-Reply-To: <551DAA51-CB17-423D-896F-AF0443A5E7AE@getmailspring.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Jun 2021 09:30:36 +0100
Message-ID: <CAFEAcA8aPy9kwLhSOk+VjBf_44ktS_VhTAAah_N2nOH_gJuOkw@mail.gmail.com>
Subject: Re: [PATCH v4 6/8] hw/intc: GICv3 redistributor ITS processing
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
X-TUID: 8/BaLIgWUJ/Y

On Fri, 11 Jun 2021 at 00:39, Shashi Mallela <shashi.mallela@linaro.org> wr=
ote:
>
> Have addressed all comments except the ones with responses(inline) below:=
-
>
> On Jun 8 2021, at 9:57 am, Peter Maydell <peter.maydell@linaro.org> wrote=
:
>
> > + cs->lpivalid =3D false;
> > + cs->hpplpi.prio =3D 0xff;
> > + gicv3_redist_update_lpi(cs);
>
> You can avoid doing a full update a lot of the time:
> * if this LPI is worse than the current value in hpplpi
> (where by "worse" I mean lower-priority by the same kind of
> comparison irqbetter() does) then we haven't changed the best-available
> pending LPI, so we don't need to do an update
> * if we set the pending bit to 1 and the LPI is enabled and the priority
> of this LPI is better than the current hpplpi, then we know this LPI
> is now the best, so we can just set hpplpi.prio and .irq without
> doing a full rescan
> * if we didn't actually change the value of the pending bit, we
> don't need to do an update (you get this for free if you take the
> simplification suggestion I make above, which does an early-return
> in the "no change" case)
>
> > Accepted the code simplification,but by not calling gicv3_redist_update=
_lpi(cs) here ,the scenario of an activated LPI fails because
> this LPI's priority (which could be lower than current hpplpi) is never c=
hecked/updated and gicv3_redist_update_noirqset() fails to present a valid =
active high priority LPI(if applicable) to the cpu,since it is always check=
ing against a stale hpplpi info.

If the LPI is lower priority (higher number) than the current
hpplpi then it would not change the existing hpplpi info in
a full-scan. If the LPI being activated is higher priority
(lower number) than the current hpplpi then that is my point 2 above,
and we set it as the hpplpi without needing the full-scan. And for
the other cases (eg highest-priority LPI being deactivated) we
should fall through to the default "call update_lpi" case.

So I don't really understand why this wouldn't work.

-- PMM
