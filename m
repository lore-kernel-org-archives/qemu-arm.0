Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp169606wrq;
        Tue, 22 Oct 2019 09:59:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyo3pCRhrK3nfxB2Qf8Vaj1bLzVe7iPFEUc9EcK/Ssq7go71mgTWBwCzLVRlJ1Z/Qs5hrlb
X-Received: by 2002:a17:906:79c9:: with SMTP id m9mr4046002ejo.297.1571763595484;
        Tue, 22 Oct 2019 09:59:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571763595; cv=none;
        d=google.com; s=arc-20160816;
        b=PGC8rgOXSDGCRR+mfAefUHVrwSNqQZkemeV47JWouJFhQkeBEmAI7NOtmD0uEBk4ag
         gJo0/qHjA49QYAD0t7gNm3t7NO7C9yMk/PhD2dB2LYJlrKqnUBc97LMjZMAmh9VvZVdb
         Ol404VJNG+PeRLj9gOhLHlbsAfNe++s93l4nZkV16zpzsFjABTh0K/pt0CvsS3vCvTVU
         XbKzG8aSKceyLvc0m0Fv20SSrpO4UMMsMef3KigNlXPfdErm0Hw3YAhYUVb+V8t8nN8a
         AngTWMRwYAAkTQJkvFkgvNgKQ5qFL+vBEvr6MD7ngRLDrvGlZAP0FRVSk33MxBf0qJSN
         2lxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=OCGkXFnU4OsZEBP/GIGg38T0H1SpL5cw+lVoLIDdrFk=;
        b=yCxOvIkqbWCDS4bkahz2R3SKtsvtlTCxV25jpb/+UiOyx21RWsBI7+W2pBvJwwoReE
         r7KFDEzQ7+20itc7drZ0k/UN1QUsClPiN6EApbKxSpenCnd4X2o109GDNh4nq8+uw2MX
         mxhsmLWYhfU2M+otLJHuRyRiO8hjf5D+3f4WMq0Py3CUowT5TJaZ++dR0dQpSlkud4rX
         Zvo97L3w8VS83sUVGEjPGIuh78foZH83dWSAKeLh1WZmEPw20x9gdNEfeTSVwFFI/W34
         66rQRTLmHMrA5H37t7Cazza9H0a3jE6MMNcA1QWfW1E0783gfxLbEiH6MUAaYvOmNpsh
         l7oQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E4S7QWXh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x4si1947733eju.197.2019.10.22.09.59.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Oct 2019 09:59:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E4S7QWXh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMxVh-0000br-Oz
	for alex.bennee@linaro.org; Tue, 22 Oct 2019 12:59:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42076)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iMxGN-0007EA-ND
 for qemu-arm@nongnu.org; Tue, 22 Oct 2019 12:44:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iMxGM-0008QC-IR
 for qemu-arm@nongnu.org; Tue, 22 Oct 2019 12:44:03 -0400
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:42521)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iMxGM-0008Ps-A1
 for qemu-arm@nongnu.org; Tue, 22 Oct 2019 12:44:02 -0400
Received: by mail-io1-xd41.google.com with SMTP id i26so11925754iog.9
 for <qemu-arm@nongnu.org>; Tue, 22 Oct 2019 09:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OCGkXFnU4OsZEBP/GIGg38T0H1SpL5cw+lVoLIDdrFk=;
 b=E4S7QWXhEMhUEowZIKmBh7NtC3VYJWELeOO4z0RVid7wdrxSOFh39pgpux5Wwb91m6
 1Zt9ZwUEKD8X31S/fSLz7qikhRt67ZpKqxqZbCTRhb1fgvC2ZdpjjW3YDIpIdGv6gSxj
 tuvng9E6F+BQtqjsLSaX2eGVf3pt3Pd2vqfAQ/hZzHExeygo0r4a+ChoDahtt90ud7OK
 dGlpHvXN6gJOC/SqbgmTOcxGiJClU+e5OwPhzNpz4mZzXpdE01DX0YEj7Y4w2JxDwyzR
 lFZuXxX24/LaQJgBQQEeEK34b3kEdAxj0j8zdj9GThRQYQgdVY349nJYgy8/ZKZ9gltY
 qEDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OCGkXFnU4OsZEBP/GIGg38T0H1SpL5cw+lVoLIDdrFk=;
 b=enTrHVOnnd+28pwuSfc0jNVndonwGirSoY6YpcbWKsPwOKaixjsLeVAb7alHoOisRz
 5/0mCZgDnRCcKMgJp1W+elLzB6up/eGzFGGgH1lCpKcKVVy1eodvJ4lkIAVQZGGCYG+s
 yJBn1NhDWPUKRjedrMNhi9aisYOzRWdpQUA39689dHFrxiVm2lFWLPfZ6pEBetyjl9D7
 6yTJuMoEh+DiDkhD06QVQwwSxsos5/nyBntRHkiwN3DFIsmLsYsHlIj3e1uEvq0YpU64
 Di2wOhiNmdDXcoRP5odVaOPagoT0NYZ5TWw9amm5sUM0C0ly3EVSeupnTjXnxM4Flrlj
 eIRQ==
X-Gm-Message-State: APjAAAU/My2fT6JH5U9NHUo+8RoWWx0i4xp9BS1noNkK4+RTE9Qb6O2r
 Ag0vXsKmlTjaXbi3vWW9iqONn0N8DVpkuVfjv6fpdu/Nlp8=
X-Received: by 2002:a5d:9a98:: with SMTP id c24mr4760068iom.203.1571762641397; 
 Tue, 22 Oct 2019 09:44:01 -0700 (PDT)
MIME-Version: 1.0
References: <20191016090745.15334-1-clg@kaod.org>
 <CACPK8XdT0_JCxzfxd4dCafK0Ae9+18ZWcusuXV+d4eEmwwBnkA@mail.gmail.com>
 <CAFEAcA_6yxaanT2N6Twos_FxjJNgvVKShwgq=pR4fqmcZUsQFA@mail.gmail.com>
In-Reply-To: <CAFEAcA_6yxaanT2N6Twos_FxjJNgvVKShwgq=pR4fqmcZUsQFA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Oct 2019 17:43:49 +0100
Message-ID: <CAFEAcA8py1obBXc1o02wTRkXms9NwCnCT6Q9ZZ-4W=NzNocLrQ@mail.gmail.com>
Subject: Re: [PATCH] aspeed: Add an AST2600 eval board
To: Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d41
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AVAo2sTG+Gu6

On Thu, 17 Oct 2019 at 14:54, Peter Maydell <peter.maydell@linaro.org> wrot=
e:
>
> On Thu, 17 Oct 2019 at 07:33, Joel Stanley <joel@jms.id.au> wrote:
> >
> > On Wed, 16 Oct 2019 at 09:08, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
> > >
> > > Define the board with 1 GiB of RAM but some boards can have up to 2
> > > GiB.
> > >
> > > Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> > > Reviewed-by: Joel Stanley <joel@jms.id.au>
> > > ---
> > >
> > >  Changes since AST2600 patchset:
> > >
> > >  - lowered the RAM size to 1 GiB as it was breaking the tests on some
> > >    hosts.
> >
> > Peter,
> >
> > After chatting with C=C3=A9dric I agree we should merge this patch.
> >
> > As it turns out the EVBs have differing amounts of RAM; his has 1GB
> > while mine has 2GB. So we are not being inaccurate by setting 1GB as
> > the default here.
>
> That's convenient, means we don't have to figure out how to
> special-case the test infrastructure for it :-)

This is now OK on the 32-bit boxes, but still fails 'make check'
on my OSX system:

manooth$ QTEST_QEMU_BINARY=3Daarch64-softmmu/qemu-system-aarch64
tests/qom-test -p /aarch64/qom/ast2600-evb
/aarch64/qom/ast2600-evb: Broken pipe
/Users/pm215/src/qemu-for-merges/tests/libqtest.c:149: kill_qemu()
detected QEMU death from signal 6 (Abort trap: 6)
Abort trap: 6

Dropping from the pullreq again :-(

thanks
-- PMM
