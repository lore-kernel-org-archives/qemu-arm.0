Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp11937426lfc;
        Sun, 1 Dec 2019 14:31:47 -0800 (PST)
X-Google-Smtp-Source: APXvYqyDatXbsACjB/oNPNvKX+oidyMBIieF3fS0PkLj9vz5btAHzMXivZQSINfnA2l6nfG0qZon
X-Received: by 2002:a50:eb95:: with SMTP id y21mr29682622edr.212.1575239507632;
        Sun, 01 Dec 2019 14:31:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575239507; cv=none;
        d=google.com; s=arc-20160816;
        b=luJgcyGHrahhRG5VYJD+nlq7Blabh253OAxiqAbpdWy5tchU1iFQWxk3kEgtWUNl9k
         VmMY5tOQxU3/9kJmfKq890IvwgMzKk9uFWq/XzSXx8i5ZA14cdlFrej5m/QLkn+vxX4Z
         Ut9yJKE3qdo1YFlZ1atAARMFZ4HfsTrkS31BqYrqhuIJOp68cHhD063WUFzRRNidAo54
         07aK7D61mS7wPKjN/WjVgjphN2IBQ74E1MnAQWZA3xmygGY/j/pZyipoRyck0WI0HXvq
         XrfcsoqWlT4LQ0rgUNy9Ds0HO6eztnyXg20MYQpGlLZhGG9JZXrCkUJd2Vytq45XNFbB
         RqQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=w7F4VBjJzLVDVvrTxAEbhzicn/QifA6Kt+COVO7sJEY=;
        b=HzJzd7osJVezvTdGRbcBcMtdxyfmdRymkbeDbLR835fpZSOe3u1fkllBverbb/GmO7
         puZOOhAWIsmHW6QPpWcMe86aypIkwDCheLyHZ7+p4MzYKVVBcaelyq+BaDIA0I2GJ9fW
         vDNpvaQPuYoFveXRiVM4epTpTEHTsUYx1vd+RFSn6hjmJPRGqGXm8N55q3o3toU9s6vI
         ofhmcEcRudfdO9BxbOYM4GwdLgzJ6iu3hXAoGPMLA4y6rxSgC5qfEqHUGpJuY0k2w2hp
         tyJYwEiW8yQk+2zEdNjuVLdsGLSXHfmuF0mbeY1GMLadCtXuDuaP7zA25hB/CGeo05QA
         5hTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=z4ZGH9a1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b9si18757962ejq.218.2019.12.01.14.31.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 Dec 2019 14:31:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=z4ZGH9a1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ibXko-00040F-E7
	for alex.bennee@linaro.org; Sun, 01 Dec 2019 17:31:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60352)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1ibXke-000401-9Y
 for qemu-arm@nongnu.org; Sun, 01 Dec 2019 17:31:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1ibXkc-0006KT-U5
 for qemu-arm@nongnu.org; Sun, 01 Dec 2019 17:31:36 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:46572)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1ibXkc-0006KA-Ow
 for qemu-arm@nongnu.org; Sun, 01 Dec 2019 17:31:34 -0500
Received: by mail-oi1-x242.google.com with SMTP id a124so6998296oii.13
 for <qemu-arm@nongnu.org>; Sun, 01 Dec 2019 14:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=w7F4VBjJzLVDVvrTxAEbhzicn/QifA6Kt+COVO7sJEY=;
 b=z4ZGH9a1AFSpuYwTuzSu5tCiP/SwhHW8TzxS2JG04NJ0Ybbgrn2AyMDAY0MbJBr5AN
 THpWmOXpFG8icza/X3kyrQkOB0bekH7a3Rg9CYaGQE6UNcp3d/mINh2RajVursy+v1SP
 qgqhG3G8I1vQOg27kBqKUYw1vzMgY8CMquFI4z7aV9/c5BDM2nIi3ooEjLj+RRpiVZWY
 O/ZwbWPiT422GnMaQs6+4WGoBoCbR9HCDmJxDaW9ZwL1Huq4qNUel11Pn59pkh+DekvZ
 yVHQYY5wm167TE6tUw3g/yTKua2qkhgUCVyCCpQO0HSXj9irc5geQZ5Z9LrHf+I1VUmj
 EXmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=w7F4VBjJzLVDVvrTxAEbhzicn/QifA6Kt+COVO7sJEY=;
 b=QsQ05YASbM5XZGDQAb/IP1jT44vDr7c6xSvMxxnHaGQzSnejge66D/xuiSxTITI3QA
 tW2wgxQ/ukLRqs3G0M8JbR9MIM/WRDJeWS9K1Xx1SH28l2ULrceqqSSwBG9RB/xjxREE
 QO4Z8yK0s3ZamHJ+e+NEoW/zxaGJGUofTqxRFT5wxuzc7Vh/XDctr5AYE+CcDZsiZMvL
 n9nuugFs2+p8FPgTU22M1R6HNycTTpt3uVS58W/r88FctR38JHXcTUI4Lw1HLbjaly31
 XmJMORNj19mFFS0U7GWZtU7XATjEoBk2oOQcH/8Rx1hf2jpMvZcLA2rzmgnhpX6lUG3p
 +aKQ==
X-Gm-Message-State: APjAAAWwSx+4SK+dg5SBYF2OtRhFY+wvfsj67cdrGlGPZmUpLqkKVgIa
 /LCkVWW1hkgD35OujppxrJFO9AXVHTRtxcxlq/WJ4Q==
X-Received: by 2002:aca:edd5:: with SMTP id l204mr10040049oih.98.1575239493528; 
 Sun, 01 Dec 2019 14:31:33 -0800 (PST)
MIME-Version: 1.0
References: <20191125124055.19286-1-jean-hugues.deschenes@ossiaco.com>
 <3e2857fd-aa5e-acc5-edd6-359715a636a6@linaro.org>
In-Reply-To: <3e2857fd-aa5e-acc5-edd6-359715a636a6@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 1 Dec 2019 22:31:22 +0000
Message-ID: <CAFEAcA90u0GsZZTX6EB0AzrS+A-ErTEGE2XVeJH8wvSmfF80tQ@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Allow loading elf from aliased ROM regions
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
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
Cc: "thuth@redhat.com" <thuth@redhat.com>,
 "martin.galvan@tallertechnologies.com"
 <martin.galvan@tallertechnologies.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Jean=2DHugues_Desch=C3=AAnes?= <Jean-Hugues.Deschenes@ossiaco.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: r65y0A070tjd

On Sun, 1 Dec 2019 at 20:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 11/25/19 12:41 PM, Jean-Hugues Desch=C3=AAnes wrote:
> >              initial_msp =3D ldl_p(rom);
> >              initial_pc =3D ldl_p(rom + 4);
> >          } else {
> > -            /* Address zero not covered by a ROM blob, or the ROM blob
> > -             * is in non-modifiable memory and this is a second reset =
after
> > -             * it got copied into memory. In the latter case, rom_ptr
> > -             * will return a NULL pointer and we should use ldl_phys i=
nstead.
> > -             */
> > -            initial_msp =3D ldl_phys(s->as, vecbase);
> > -            initial_pc =3D ldl_phys(s->as, vecbase + 4);
> > +            /* See if the ROM blob is aliased somewhere */
> > +            hwaddr len =3D 0, xlat =3D 0;
> > +            MemoryRegion *mr =3D address_space_translate(s->as, vecbas=
e, &xlat,
> > +                    &len, false, MEMTXATTRS_UNSPECIFIED);
> > +
> > +            if (mr) {
> > +                rom =3D rom_ptr(mr->addr + xlat, 8);
> > +            } else {
> > +                rom =3D NULL;
> > +            }
> > +
> > +            if (rom) {
> > +                initial_msp =3D ldl_p(rom);
> > +                initial_pc =3D ldl_p(rom + 4);
> > +            } else {
> > +
> > +                /*
> > +                 * Address zero not covered by a ROM blob, or the ROM =
blob
> > +                 * is in non-modifiable memory and this is a second re=
set after
> > +                 * it got copied into memory. In the latter case, rom_=
ptr
> > +                 * will return a NULL pointer and we should use ldl_ph=
ys
> > +                 * instead.
> > +                 */
> > +                initial_msp =3D ldl_phys(s->as, vecbase);
> > +                initial_pc =3D ldl_phys(s->as, vecbase + 4);
> > +            }
> >          }
>
> Can this entire section, including the rom_ptr thing just above, be repla=
ced
> with two address_space_read()?

No. This is a reset ordering problem. The CPU reset happens
before the 'rom blob loader' reset, so at this point the
rom data (usually an ELF file segment) has not been written
into ram, and doing an address_space_read() will just read
zeroes. This is also why the aliasing issue happens at all --
the rom blob is at a particular address, but if the address
we use here to try to read the data is an aliased variant
of it then rom_ptr() does the wrong thing.

My preference for fixing this properly is:
 * get Damien's three-phase-reset patchset into master
 * make the ROM blob loader write its data into ram
   in phase 2 ('hold')
 * make the arm CPU reset read the data in phase 3 ('exit')

This last matches better what the hardware does -- the
M-profile CPU reads the vector table in the first couple
of clock cycles when it *leaves* reset, not while the
CPU is being *held* in reset. This kind of thing is
always awkward to model in an emulator, especially if
you were hoping to also handle allowing the PC to be
set from an ELF file entrypoint or by the user in the
gdbstub on startup...

thanks
-- PMM
