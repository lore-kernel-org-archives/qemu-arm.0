Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4325309wrm;
        Mon, 21 Oct 2019 02:43:34 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz+QSCuIKyz49EmJaEkVLbllw8ZAhjaNJ3BoxbWcKl/Hv3ZZGJFytzJBCbePxFoRJS1DXfF
X-Received: by 2002:ac8:22f1:: with SMTP id g46mr23476043qta.12.1571651014817;
        Mon, 21 Oct 2019 02:43:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571651014; cv=none;
        d=google.com; s=arc-20160816;
        b=m9XwDOenKWg7EzmC77lB96thFxEFhzRn5jgqGM9bAExkvrSy1J7xsCuevrdz7TLrbA
         4D+obGfjIFAgG4z53VpW7Q9BJW8nlly6LhGW96HfTsEut2NczrOMduv6Lr1UAgSrayDH
         PxRgaPxDWQQwP+T6umiTMq+rDGvUdrNhJEWHD6P9E5jLmdTJde5d1G+uoOPTdPWL9L9P
         tAX5IBeNmFV4qHT0GVm+40DIravEpqP8Fk7NOi94nz1Y4oKA6hRSlrIpVoRpJCfGwaCl
         8rcAx2u4vMK80sXn+TtkEzhkUzRKxbrz2dzjGDoDTztDnLwWi4WKPrK78ZBYe3kj+RDG
         zKnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=MtHnke2bzns6MDeKr83foHZX1HR+Uo5i8lrNykscWLo=;
        b=lmksPEnjETPLWKP+IQHSAol4njp1tl+1ByjhJzHk+YwC8RuKzzwplsxpv8ve6jPcOy
         xmWPqST3tFmno4Pf5qmL39P1cR4VqzhEGDD186q8c8ReGQ74z2GbymWW7+XjJXrFsbUb
         pxLLWfT64JXR1CB1zLSDscO70UaavJYaJ26JT6UiWBn9w4znzz3E2nvMvrQKCJ1Ck+Yl
         TSpWvBp8s8fDL1azkozFS1QkUi/uH4RYmliAdtl4WM2190rCccFBjvsIEj7mPWrsuJHa
         xQj01g0xc7b3AVeiD2xmDJuC+vi2GrYBwR7eyclRzGedbNEMJTfLnqgIhafg5CmKKHwG
         Ni7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=x7UBR0Wu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x26si13022371qkx.106.2019.10.21.02.43.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2019 02:43:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=x7UBR0Wu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMUDu-0000SZ-A2
	for alex.bennee@linaro.org; Mon, 21 Oct 2019 05:43:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36897)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iMU9n-0004k1-Tb
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 05:39:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iMU9m-0000Aq-Qh
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 05:39:19 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:39553)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iMU9m-00008X-AC
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 05:39:18 -0400
Received: by mail-ot1-x344.google.com with SMTP id s22so10403407otr.6
 for <qemu-devel@nongnu.org>; Mon, 21 Oct 2019 02:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MtHnke2bzns6MDeKr83foHZX1HR+Uo5i8lrNykscWLo=;
 b=x7UBR0Wu+o7Obcts6e3og/3YhlVdIChRP/0n1lJN4/hkfCoKHczbBk91e7PCzc8Mbp
 w/emH/xMqZvByceXTZMNMNV9EuL3k0W6asvsX0IzZCeJ7brTHAwLbxtsosLhsWDYbAD8
 PuASEAQYchwdNc5ihq9OE/Djk1zWhh2A+DrDoGkNbO/xGJQMkTXcA1V1/U0B7TA1NcUp
 gPlShpGNGHA6aVeW8kJbhQPY3xAWsuRYUTL0OLM1ayJHYB7HW+WFEKvqboAKDg320t6x
 iJKS/w/LfWRTjKaveaSOkeVnblRTxjmuno7zQnCKqOxGH41tPGwNw0tOYG/2b46nN96a
 r/iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MtHnke2bzns6MDeKr83foHZX1HR+Uo5i8lrNykscWLo=;
 b=idWGJk0ZZvqHEeyVGwdty5hJha5CCVHJ4Kn9oGNCLS4A0p+CRYueVABlUvrE8qU8WW
 U73sazoTZ4v0fqgT0LWfhQkBCdYmY/oMI8uT4/MsFTfksmU3KFia94jmOHQvvsDkIKD2
 X6o/QShqUO+4MrYd5Jrqaf3fbD3SNOAHfP1glrhxycg6zw/bj+fHL6xJWp0dy9x7EkRZ
 xjW5Cm/ggsG9wWOttzQJPwisUjA+SAemcLoVG15dLn+QEpmAFwzkv/rlKT1zy0URVBO8
 nVAw/sAc2Ie75Mu4k9Y9TGwFsBua8/YIzvvJ7EY4e35eEep8BWZ9PMg4kkloOoa09YJ4
 ZVSQ==
X-Gm-Message-State: APjAAAX+fSJCJb/MGj7EdglGjxsLaKsaGlVAZHaqoYF9P0JAkIYQudDP
 DstqAB5n418kyjCBlyXJpoXfp0h4SGosmKpVGACFZQ==
X-Received: by 2002:a05:6830:ca:: with SMTP id
 x10mr16984090oto.221.1571650757149; 
 Mon, 21 Oct 2019 02:39:17 -0700 (PDT)
MIME-Version: 1.0
References: <20191020225650.3671-1-philmd@redhat.com>
 <20191020225650.3671-13-philmd@redhat.com>
 <CAFEAcA8bhP9X-2AaTus9=GtEAqmnNA9me6hv8U=vXYwjQp_CnA@mail.gmail.com>
 <42944bea-4b15-7bdf-61a7-f1c73f5f7c2b@redhat.com>
In-Reply-To: <42944bea-4b15-7bdf-61a7-f1c73f5f7c2b@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Oct 2019 10:39:06 +0100
Message-ID: <CAFEAcA8hJ7bQeQNdWB6Rg4P7RzYmcXZmQKm7pnDAOutADHe9jA@mail.gmail.com>
Subject: Re: [PATCH 12/21] hw/arm: Let the machine be the owner of the system
 memory
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
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
Cc: Paul Burton <pburton@wavecomp.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Leif Lindholm <leif.lindholm@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Rob Herring <robh@kernel.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Helge Deller <deller@gmx.de>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Antony Pavlov <antonynpavlov@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Fabien Chouteau <chouteau@adacore.com>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Thomas Huth <huth@tuxfamily.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, Andrew Jeffery <andrew@aj.id.au>,
 Michael Walle <michael@walle.cc>, qemu-ppc <qemu-ppc@nongnu.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Peter Chubb <peter.chubb@nicta.com.au>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VZwpboxZKszA

On Mon, 21 Oct 2019 at 10:34, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> On 10/21/19 11:22 AM, Peter Maydell wrote:
> > On Mon, 21 Oct 2019 at 00:01, Philippe Mathieu-Daud=C3=A9 <philmd@redha=
t.com> wrote:
> >>
> >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> >> ---
> >
> >>   hw/arm/virt.c             | 2 +-
> >
> > I think from a quick code scan that this is ok, but did
> > you test that migration compat from old to new still works?
> > I vaguely recall that there are some cases when adding an
> > owner to a memory region changes the name string used for
> > identifying the ramblock in migration.
>
> It seems to still works:
>
> $ make check-qtest-aarch64 V=3D1

> This test migrate the virt machine.
>
> Is this enough?

No, you need to test migration from a QEMU binary without
this patchset to a QEMU binary that has it. Otherwise you're
only checking that the new version can migrate from itself
to itself. I find the easiest way to test this is just to
use the 'savevm' command to save a state snapshot to a
qcow2 disk image while running the old binary, and then run
'loadvm' with the new binary and check it restored OK.

thanks
-- PMM
