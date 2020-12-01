Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp378920lfb;
        Tue, 1 Dec 2020 09:41:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzL8YPs9DOOy0tjzIJgU1vuclYDxqb4Nt20deD7bg9HEKP18ZXS1yZb4Yv3zmGN8/oCdPVo
X-Received: by 2002:a25:d713:: with SMTP id o19mr4422684ybg.378.1606844514058;
        Tue, 01 Dec 2020 09:41:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606844514; cv=none;
        d=google.com; s=arc-20160816;
        b=IP8T0936BFZeQ7reD/iqGpoewdK9d1k394rKpubNtiO4cGEPUaI7wQ64E3vp4p5+Ro
         QsboM+1dcRVM4ldN+xO/gjR2FiCkAaBiabR7jxZJ8GZqkRnz0INEVwFFOZYriafasUXu
         WsYJc17f/sQMpB/2DvSbNX3TUciuynB1XKBwuZzkc7g5CbvQ0v98/rFImR/9qCV33PYk
         QosxseHWn0EWW3t+mSlLXy58Ndgnuns6VFA2OhmJwOZOziwqv38zlh6tEcSJ9gxxr05C
         xBy3X+oRZB3drzP15fwf5PfvinS29tpsXOC0RG7LKc+FXoWBYMkjnZbZE2J4F18WRzA4
         9kzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:organization:message-id:date
         :subject:to:from;
        bh=iPQzs8lNxed82U6DG5A7QUXJWwjPEwmv9xOdSErUtJg=;
        b=uXLzxTJANAah1JBpOTP84ifKo3oOfap97sVZlzm7VXjd3asfsdyM3POw2szeZoON2G
         k8Zo6MfQSWpUXegaasan2c6tqJZq7gl4QQpIiqsWw9rTanyXU0bknPoaSjnieod8X716
         V8OU0Amjz75DlznPC5klp47Z1KfWUBeZPH7LLRGOeMl+vxIZTwBCLQY0+MoeYWSoRzBA
         DA91r1KRuYYID0OAJ3nXE8DBHX9/8YLRl/rweg3BqsNbp62kwkTI2mHyr/vOmOXn9SdS
         Ha2zvdXtm0QKrQHYClGVEqHzpk5d4nlWQ+kSdONZlj1C3AuEfkV2BzZxZ8Qm9bYyqIri
         C1yA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a13si327241ybk.357.2020.12.01.09.41.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Dec 2020 09:41:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kk9ez-00033p-DA
	for alex.bennee@linaro.org; Tue, 01 Dec 2020 12:41:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kk9Ka-0006yv-8L; Tue, 01 Dec 2020 12:20:49 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:49416
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kk9KV-0002OL-7h; Tue, 01 Dec 2020 12:20:46 -0500
Received: from basile.remlab.net (dzyqn8ypzhx7l91mxjsvy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:a01a:be01:9434:f69e:d553:3be2])
 (Authenticated sender: remi)
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTPSA id B512B5FC79;
 Tue,  1 Dec 2020 18:20:36 +0100 (CET)
From: =?ISO-8859-1?Q?R=E9mi?= Denis-Courmont <remi.denis.courmont@huawei.com>
To: qemu-arm@nongnu.org
Subject: Re: [PATCHv3 00/17] ARMv8.4 Secure EL2
Date: Tue, 01 Dec 2020 19:20:35 +0200
Message-ID: <2747838.e9J7NaK4W3@basile.remlab.net>
Organization: Huawei Technologies, Finland
In-Reply-To: <CAFEAcA9J0t1UtrNqGxst7-9kCq_+M3+xA6-h+xo3x9Z6Ccc5bw@mail.gmail.com>
References: <3333301.iIbC2pHGDl@basile.remlab.net>
 <CAFEAcA9J0t1UtrNqGxst7-9kCq_+M3+xA6-h+xo3x9Z6Ccc5bw@mail.gmail.com>
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DUv7f6J2G5Km

Le tiistaina 1. joulukuuta 2020, 18.54.36 EET Peter Maydell a =C3=A9crit :
> On Mon, 23 Nov 2020 at 08:02, R=C3=A9mi Denis-Courmont
>=20
> <remi.denis.courmont@huawei.com> wrote:
> > The following changes since commit=20
8cc30eb1400fc01f2b139cdd3dc524f8b84dbe07:
> >   Merge remote-tracking branch 'remotes/mcayland/tags/qemu-sparc-202011=
22'
> >   into staging (2020-11-22 15:02:52 +0000)>=20
> > follow.
> >=20
> > Changes since version 2:
> > - Don't set HPFAR.NS in AT instruction in NS state.
>=20
> This series seems to break the 'make check-acceptance' tests. Specifically
> the vexpress-a9 image fails to boot:
>  (20/40)
> tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_vexpress=
a9
> : INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred:
> Timeout reached\nOriginal status: ERROR\n{'name':
> '20-tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_vexp=
res
> sa9', 'logdir':
> '/home/petmay01/linaro/qemu-from-laptop/qemu/build/arm-clang/tes... (90.23
> s)

The base tests fail without the patchset seem to assume an US American loca=
le,=20
which is frankly infuriatingly culturally insensitive.

As for the acceptance tests fail equally early without the patchset with a=
=20
completely helpless diagnostic about unresolved references. Wiki does not h=
elp=20
either.

So there you go: cannot reproduce.

=2D-=20
R=C3=A9mi Denis-Courmont


