Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp15565605lff;
        Mon, 30 Dec 2019 07:49:06 -0800 (PST)
X-Google-Smtp-Source: APXvYqxs0O3jIRsnTwdG/tXU9X2zFnfuv7PeIDXJtQffMuVvbISpbGkEx+lFUnVxx7SWTfLFxq6f
X-Received: by 2002:a9d:1d02:: with SMTP id m2mr70093977otm.45.1577720946621;
        Mon, 30 Dec 2019 07:49:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1577720946; cv=none;
        d=google.com; s=arc-20160816;
        b=MJzKiXmYN/2RnQodlb3mrIbbMdbgGoNaLho5I0g/wrWBAMbQ7h1IJgca9XsGxS+B/3
         euiaeYPbHxTtz//Djnap7u6u5Azlh+XqRsCAY/JINf819gBPpDDXvSVlIFzxZLHK+lip
         JgRkhS8HUYeQ0rbiU05R+a9b7FqA7ftUG1/ZOLPROhAgvGpl4RsVgeHV1hfDvjM+TLCJ
         A+C8oJjG65+wtjjsRbitoXjwx8RdILjxW3q7FJzyr+tPNXo+NjWrRGEYpkdqa8mJcR59
         1jtbQ/+j7pSCK9y3MauCe4xt5BbBHSx/Do0dldU9tqCrfdEsDNACGJ7eo1ukVuykAU7h
         numg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=eie/6KGuYr/9B08JptfZ0j1vbtpHyZvG/k91jGibVJI=;
        b=THreONg3uFEZiHY7AXOZi+g7oEIycp2LK1UirALhYAOcSW2Nmv4qmGhQha4HPmehQh
         KUE7OZJVH3JO0Z0npV5u2fXN6+t+0Du+/pXJE0FFHfvcJQhkMDYPcmKlfJjkIrHt5HBO
         exCWKfNtx6+7vafGirbitArE2h5zg5ugJHhAY0OtBWniyalORNW+ojMZZbVvu58iWf16
         ASz752SzAlhuv/JkomsKel6ASWYQapB5rfDTPdOgxANnS6b+leiWhUtjLn0z+j6aGdrl
         I09iwPeYVb35bsiz7fwj0rrvl0Q8XclTis/Q7eO0fV26c5nJPHpxDiEpRV3OKTgnCoPE
         AE5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=U7SrG0GZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u12si23476796otq.51.2019.12.30.07.49.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Dec 2019 07:49:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=U7SrG0GZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ilxI1-0007BU-Oe
	for alex.bennee@linaro.org; Mon, 30 Dec 2019 10:49:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45661)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pmathieu@redhat.com>) id 1ilxHr-0007At-Es
 for qemu-arm@nongnu.org; Mon, 30 Dec 2019 10:48:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pmathieu@redhat.com>) id 1ilxHo-0005jV-Vn
 for qemu-arm@nongnu.org; Mon, 30 Dec 2019 10:48:54 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:38107
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pmathieu@redhat.com>) id 1ilxHo-0005jC-Rr
 for qemu-arm@nongnu.org; Mon, 30 Dec 2019 10:48:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577720932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eie/6KGuYr/9B08JptfZ0j1vbtpHyZvG/k91jGibVJI=;
 b=U7SrG0GZRALE9LI+quLHuM/1NPTegvkCuBNBq9M/1U1tpTo038WDe+8J7amnudxQ9E+M8k
 ApJ72Ab05Wkc5dsb54wUxQYqS9q49t8c3H+H3AUBLv+9qvYT1UTrXFZBJpXOwafUs0YR28
 /IoibORBlHh8JZrwX3MmeUcamhv1fw4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-Ea5d1odFO3yRl4YqTr75-A-1; Mon, 30 Dec 2019 10:48:50 -0500
Received: by mail-wr1-f72.google.com with SMTP id 90so17778541wrq.6
 for <qemu-arm@nongnu.org>; Mon, 30 Dec 2019 07:48:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eie/6KGuYr/9B08JptfZ0j1vbtpHyZvG/k91jGibVJI=;
 b=Ky4T9T1ZW0N3BYGz0T2Om7nTzJ5+HMwx2mPCdy34gikrHuUkpaiEjwfvkcexp15taz
 4Be49RD5XkKTm35ki0ldoRdqlMqcG26yyEII8NN+29tOWTduJz4NV+kVVzcQhP01wMOh
 CUUTcU+tIvsQekqoxKSUi2IhVPGmA48qgaIuZJgLHOvJ1uobTYdPq+h2HdVGFnHJHFK8
 KCywWpNebmyZSMJk9x34DcKnMZjb4GWWfN8DZPLE13xoGTIP3KN1eeHQP6xdf3NWF2re
 2szWanjPdfmt7pvkUXSuK9wmlwpAw07yHozoNg+5AuBMBf8JhSo6btwY2g3Mor3J5/eu
 R2YA==
X-Gm-Message-State: APjAAAVdVA0krRuyc2QCOvabf4f9/iVlQvw8aTP8N1XyytjW22i+ZleH
 9Hl/ptXqUGX5wPZD4CPigHHkXRR95ZwkVKxbER6i6iTVMK239XOc2QAEMZHRB213BhhK+SeXYIc
 /mtcGDDWvV/mZjj4nBPP2khJuc9vU
X-Received: by 2002:adf:f20b:: with SMTP id p11mr65711242wro.195.1577720929381; 
 Mon, 30 Dec 2019 07:48:49 -0800 (PST)
X-Received: by 2002:adf:f20b:: with SMTP id p11mr65711205wro.195.1577720929179; 
 Mon, 30 Dec 2019 07:48:49 -0800 (PST)
MIME-Version: 1.0
References: <20191230090900.446-1-philmd@redhat.com>
 <20191230090900.446-2-philmd@redhat.com>
 <273bf2e5-1223-3d01-f930-394195c037e4@weilnetz.de>
 <64c2434d-3b2b-1a3e-5358-e4b5acfbe8e8@redhat.com>
 <CABgObfYahQbbteCAsMfKAYjPLDUpGJExO9mWyRw15mm=VWHsbQ@mail.gmail.com>
 <cd2746d2-8f88-2012-def9-dfce47d8e764@redhat.com>
In-Reply-To: <cd2746d2-8f88-2012-def9-dfce47d8e764@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Date: Mon, 30 Dec 2019 16:48:38 +0100
Message-ID: <CAP+75-WjOfJeFooQnrhC8y73dCWrfJbHhtYUG3LzZRxpbhTwCA@mail.gmail.com>
Subject: Re: [PATCH 1/2] tcg: Search includes from the project root source
 directory
To: Paolo Bonzini <pbonzini@redhat.com>
X-MC-Unique: Ea5d1odFO3yRl4YqTr75-A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-devel <qemu-devel@nongnu.org>, Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
 Marek Vasut <marex@denx.de>, Markus Armbruster <armbru@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Andrzej Zaborowski <balrogg@gmail.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Riku Voipio <riku.voipio@iki.fi>,
 Richard Henderson <richard.henderson@linaro.org>,
 "open list:S390 Virtio-ccw" <qemu-s390x@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Stafford Horne <shorne@gmail.com>,
 Richard Henderson <rth@twiddle.net>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Claudio Fontana <claudio.fontana@huawei.com>,
 Laurent Vivier <laurent@vivier.eu>, Michael Walle <michael@walle.cc>,
 "open list:sPAPR" <qemu-ppc@nongnu.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pF2hVVQyJweM

On Mon, Dec 30, 2019 at 3:02 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
> On 12/30/19 11:33 AM, Paolo Bonzini wrote:
> > Il lun 30 dic 2019, 09:59 Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m
> > <mailto:philmd@redhat.com>> ha scritto:
> >
> >      > I'd prefer not changing those files.
> >
> >     OK, I'll wait to see what Richard/Markus prefer.
> >
> >
> > I think it's best if you keep the include directives as-is for files
> > only needed from tcg/, and move the other headers (those that are neede=
d
> > from other directories only) to include/tcg.

Assuming we don't want to add include/tcg/ in the path search list, we
still need to update the tcg/*.c include directives to use "tcg/":

tcg/tcg-op-gvec.c:21:10: fatal error: tcg.h: No such file or directory
   21 | #include "tcg.h"
      |          ^~~~~~~
compilation terminated.
make[1]: *** [rules.mak:69: tcg/tcg-op-gvec.o] Error 1
make[1]: *** Waiting for unfinished jobs....
  CC      mips64el-softmmu/accel/tcg/translate-all.o
tcg/optimize.c:27:10: fatal error: tcg-op.h: No such file or directory
   27 | #include "tcg-op.h"
      |          ^~~~~~~~~~
compilation terminated.
make[1]: *** [rules.mak:69: tcg/optimize.o] Error 1
tcg/tcg-op-vec.c:22:10: fatal error: tcg.h: No such file or directory
   22 | #include "tcg.h"
      |          ^~~~~~~
compilation terminated.
make[1]: *** [rules.mak:69: tcg/tcg-op-vec.o] Error 1
tcg/tcg-common.c:35:10: fatal error: tcg-opc.h: No such file or directory
   35 | #include "tcg-opc.h"
      |          ^~~~~~~~~~~
compilation terminated.
make[1]: *** [rules.mak:69: tcg/tcg-common.o] Error 1
tcg/tcg-op.c:28:10: fatal error: tcg.h: No such file or directory
   28 | #include "tcg.h"
      |          ^~~~~~~
compilation terminated.
make[1]: *** [rules.mak:69: tcg/tcg-op.o] Error 1
tcg/tcg.c:51:10: fatal error: tcg-op.h: No such file or directory
   51 | #include "tcg-op.h"
      |          ^~~~~~~~~~
compilation terminated.

> I thought moving headers to include/tcg would diverge too much from
> libtcg, but this project already did it, so why not:
> https://github.com/S2E/libtcg/tree/master/include/tcg

