Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp426317lfb;
        Tue, 1 Dec 2020 10:39:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzA1+HovYWFn5JB2mfs67xKYTFe+mmOYBVgbMXLbdqlmD+51fDWloSyNuRZ9Xdh84kzb7oZ
X-Received: by 2002:a25:ad0e:: with SMTP id y14mr6888883ybi.499.1606847978323;
        Tue, 01 Dec 2020 10:39:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606847978; cv=none;
        d=google.com; s=arc-20160816;
        b=kiPqSTkGS2K4AUcPW+5aQsgyLXad8pRMrFtMHGOS/HKKwDRlwsFpHKGs+OMWUbAqJ1
         ck7vgZsbaB/eHUNhwzVygrJniWXzjJCuZ+9OkQ0Yu7zzQ8SDBlbTCrnnE6nYC55idWlg
         hMJLnatVtTpm3A783xVtoQFZ0JG3Zo2E3WD/KVXB5C84RL09SHaREe00TdWaMHlWFmRF
         XF6uF8EdHvQEXjHd0fB6Ff1N8aoI3DIRuBcem7qeBFM0KhYZyW5l9j9/S0MeH4bpW7bE
         8aSXDdDR6HEQv2pPi4JnLRSrUruBV0fnRhjt0opClq6+4YkSP/oF00BJ3fbLPRbRKwp+
         EjCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:organization:message-id:date
         :subject:to:from;
        bh=pt7hAgifZ3xMUYG942kX/LV9Cf5L319+QkjysnlfLmc=;
        b=IDGyfL1c3CfD6yN4jXFmNijBdLX8j7+7fwEQ45DrQMJfrrBRASipSvXmT09ByO+NaB
         DGU4y4SPSqbvi3aPSLBMV7KFMNSlv8pnSLFM/S4lkqI16pk2chyHwO/Ajkzyfp4Iezia
         dDUOoB0h4LuZmzfivIMp7guhsIGChHYhsZ75T9scaDrRtX7koLKytRZS8NUnGBt8OEZ9
         X/OudLGWbJkRfbcCkTloaVEL952bSiySCV1rh6AlIm9hBINV2g/0wacGa+OwQaJQYMuF
         KJriivxbFnCAXuy4hJBAcpCaJU12avdHCiDP5oRvxMzHbVu4nQYqu+5qUyLARZkMysy7
         Znlw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c11si455952ybl.170.2020.12.01.10.39.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Dec 2020 10:39:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kkAYr-0008FA-Ny
	for alex.bennee@linaro.org; Tue, 01 Dec 2020 13:39:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kkAWx-0007HI-35; Tue, 01 Dec 2020 13:37:39 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:50030
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kkAWu-0005Ib-WB; Tue, 01 Dec 2020 13:37:38 -0500
Received: from basile.remlab.net (dzyqn8ypzhx7l91mxjsvy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:a01a:be01:9434:f69e:d553:3be2])
 (Authenticated sender: remi)
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTPSA id C08235FC79;
 Tue,  1 Dec 2020 19:37:33 +0100 (CET)
From: =?ISO-8859-1?Q?R=E9mi?= Denis-Courmont <remi.denis.courmont@huawei.com>
To: qemu-arm@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [PATCHv3 00/17] ARMv8.4 Secure EL2
Date: Tue, 01 Dec 2020 20:37:32 +0200
Message-ID: <2120950.iZASKD2KPV@basile.remlab.net>
Organization: Huawei Technologies, Finland
In-Reply-To: <CAFEAcA8j9ZPLt95ObzMGF=yei_FLzduMSnFyS9MoDgQYPvGrhQ@mail.gmail.com>
References: <3333301.iIbC2pHGDl@basile.remlab.net>
 <2747838.e9J7NaK4W3@basile.remlab.net>
 <CAFEAcA8j9ZPLt95ObzMGF=yei_FLzduMSnFyS9MoDgQYPvGrhQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /s1HudqcB74N

	Hi,

Le tiistaina 1. joulukuuta 2020, 20.23.46 EET Peter Maydell a =C3=A9crit :
> > The base tests fail without the patchset seem to assume an US American
> > locale, which is frankly infuriatingly culturally insensitive.
>=20
> I run them with en_GB.UTF-8, which works fine for me, but it's a bug
> in the test suite if something's locale dependent and not ensuring
> it is set correctly.

=46or a start, it seems to be barfing on strsignal() localisation by the sh=
ell,=20
printing French instead of "Killed" on SIGKILL.

% locale
LANG=3Dfr_FR.UTF-8
LANGUAGE=3Dfr:en_GB:fi
LC_CTYPE=3D"fi_FI.UTF-8"
=2E..

> > As for the acceptance tests fail equally early without the patchset wit=
h a
> > completely helpless diagnostic about unresolved references. Wiki does n=
ot
> > help either.
>=20
> I just run "make -C my-build-dir check-acceptance"; I don't know anything
> about the internals. It would help if you quoted the error messages
> you see.

 AVOCADO tests/acceptance
Unable to resolve reference(s) 'tests/acceptance' with plugins(s) 'file',=20
'tap', 'external', try running 'avocado list -V tests/acceptance' to see th=
e=20
details.
make: *** [/home/remi/dev/qemu/tests/Makefile.include:125 : check-acceptanc=
e]=20
Erreur 2

% avocado list -V tests/acceptance
bash: avocado : commande introuvable

% tests/venv/bin/avocado list -V tests/acceptance
usage: avocado list [-h] [--loaders [LIST.LOADERS ...]]

Wiki implies that dependencies are automatically installed, but I guess not?

Br,

=2D-=20
R=C3=A9mi Denis-Courmont


