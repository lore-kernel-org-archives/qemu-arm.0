Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp15687221lff;
        Mon, 30 Dec 2019 09:47:51 -0800 (PST)
X-Google-Smtp-Source: APXvYqwK2vlD4f1VmBZphqT2cgMp6uxbBWrutwfAJbb1CP2Sw8ovGlyrq8F8gRaREiEL8/+TlcNW
X-Received: by 2002:ae9:e710:: with SMTP id m16mr50316991qka.242.1577728071319;
        Mon, 30 Dec 2019 09:47:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1577728071; cv=none;
        d=google.com; s=arc-20160816;
        b=d7I7W7B30PCe1VmgVl7U/JRcsUYzpgbQf+l/IU4cNlzCv2CTJDUaEOjoUscULYPDld
         D06mU/J1Fm/Tn3YVW5hEKEK0iq5iRk0tV7Ve6EM27tamEWl5zm4qru+81Nx98hC5ovaO
         R3NKdl4svFzNOn55sppHcQXCVb6FOv6EHe2qQA/Bd4PG9esrk0qUpvBV2LqarIdBkt/4
         nbK0J1mhpZQadsbmhtD2O33OJNyQWCeMXjig1b5PSl57C38hZCcRrT0zG4mGsiWq0qrY
         jtGVsmLyCeilNnquYU9V+j59hZbuKRJKjAV9+VJ/ZkPvFGnWAng7AWkVxD653miR7T+a
         h2eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MJStdeV/YujZAu6ZNEHr5cAMDE1K9kOphOPj3BCNNbs=;
        b=EVrN/01ItgqAbkl3gD/tCiDCWvImHnFo+6ya5DthhHKlYnNRJq5XGGoJ51bFlNi7uv
         HH6Bjsglk3lgeWKykVqYxrhrtSQKl2AVD1Q2YOMp+dGOqF9mQS4y7D44MCwyQeCrKPfT
         3iyDoCkTUTx7H8mG3hpyZpMpNhtB1E+U+epD7oDdckfKPqxWK4jrQKQwE2w1zSbX5gAD
         w7dWkv6T2pLDmBl+JdM6PWbNO4KpQ0NAya9PjTyQqWfg6RJ2jqyzCGXGZ2XRYOnn3wzp
         3t7wKY+lxQrO0Brv8r5F6Va/u3jlM9FpQi8BniuJCbuSTiSwOinWf+2LA24haqVV0SDf
         XMNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XueBamnL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l16si17724409qtp.30.2019.12.30.09.47.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Dec 2019 09:47:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XueBamnL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ilz8w-0001Jl-K4
	for alex.bennee@linaro.org; Mon, 30 Dec 2019 12:47:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58348)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1ilz8e-00018r-Ti
 for qemu-arm@nongnu.org; Mon, 30 Dec 2019 12:47:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1ilz8d-00089I-3o
 for qemu-arm@nongnu.org; Mon, 30 Dec 2019 12:47:32 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:37778
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1ilz8d-00088w-0b
 for qemu-arm@nongnu.org; Mon, 30 Dec 2019 12:47:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577728050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MJStdeV/YujZAu6ZNEHr5cAMDE1K9kOphOPj3BCNNbs=;
 b=XueBamnL8bybun48zCS8NyN3nWMA5IhnH/a4IGTKu5PxK28aYGGk1uMr+WqSweP0Qef7U9
 09ch9GU62ejee9Sj/zOSrItocEzwC/R+Oz7OotqNXlSOisC+TitA82bKSjoWEWYITgwLH/
 Bo7IUain5MW4caRloAZL7zUsrKhaAUo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-0D84hdv-PDOOVJBHYMj4YA-1; Mon, 30 Dec 2019 12:47:27 -0500
Received: by mail-ed1-f70.google.com with SMTP id cy24so18952895edb.12
 for <qemu-arm@nongnu.org>; Mon, 30 Dec 2019 09:47:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MJStdeV/YujZAu6ZNEHr5cAMDE1K9kOphOPj3BCNNbs=;
 b=gjeg+ejoIDeQnHlUlSNU2n1t9wbZZqb/9RFaqhNbuGQ+KTsG6dXnOUZQNdlwIy/gid
 SSIzcgGziwB6k1nRLZFiPWzBQbcTqnPZTwPcNLcHBkitlIdafEtTPtmK5IncUqJUUwtF
 hV9HABaQEr5t57oYy0dh7vPijN+nUrrN1CqF/OQzl3J0OjiufFS6qbnoCvRVHi2VjKdg
 A/891QzQ6EBUihpw66FjRBr8RjWGHbNlcBcpF21ElWXTI4wKN1a5QYyqAkmIJXcL0A85
 zJ1PRrhVhwZ4xY0+t1zSn2OwmBYouWmj/34wqNf9+3UbMw1mGmH/zcG+MTeQ+BbtoIiZ
 xNuw==
X-Gm-Message-State: APjAAAVrtWNxrl6s92uXYAK2vHNWJKfV0e/7gMQ33B885sSMr+9jaEFC
 lLMlMorM81fonlyuR9BVc8oaNc1LBl0/RXtjZHsvILJtkD6hlvormrIlVtfbh6pkPSbuTDcoQ57
 RNHe/ihmLx533kBRsGRSk9FCY/wHF
X-Received: by 2002:aa7:d9c6:: with SMTP id v6mr72198552eds.107.1577728046184; 
 Mon, 30 Dec 2019 09:47:26 -0800 (PST)
X-Received: by 2002:aa7:d9c6:: with SMTP id v6mr72198492eds.107.1577728045890; 
 Mon, 30 Dec 2019 09:47:25 -0800 (PST)
MIME-Version: 1.0
References: <20191230090900.446-1-philmd@redhat.com>
 <20191230090900.446-2-philmd@redhat.com>
 <273bf2e5-1223-3d01-f930-394195c037e4@weilnetz.de>
 <64c2434d-3b2b-1a3e-5358-e4b5acfbe8e8@redhat.com>
 <CABgObfYahQbbteCAsMfKAYjPLDUpGJExO9mWyRw15mm=VWHsbQ@mail.gmail.com>
 <cd2746d2-8f88-2012-def9-dfce47d8e764@redhat.com>
 <CAP+75-WjOfJeFooQnrhC8y73dCWrfJbHhtYUG3LzZRxpbhTwCA@mail.gmail.com>
In-Reply-To: <CAP+75-WjOfJeFooQnrhC8y73dCWrfJbHhtYUG3LzZRxpbhTwCA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 30 Dec 2019 18:46:37 +0100
Message-ID: <CABgObfaVHsdmRxN4eE=QhUmMGtMM5gZ1uuQ+LUfsB4EWvBTsJw@mail.gmail.com>
Subject: Re: [PATCH 1/2] tcg: Search includes from the project root source
 directory
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
X-MC-Unique: 0D84hdv-PDOOVJBHYMj4YA-1
X-Mimecast-Spam-Score: 0
Content-Type: multipart/alternative; boundary="000000000000ba6063059aef6f6f"
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
X-TUID: Q6EKCa9bJ137

--000000000000ba6063059aef6f6f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, of course (I thought it would be clear from the message, but perhaps
it was a bit implicit).

Paolo

Il lun 30 dic 2019, 16:48 Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> h=
a
scritto:

> On Mon, Dec 30, 2019 at 3:02 PM Philippe Mathieu-Daud=C3=A9
> <philmd@redhat.com> wrote:
> > On 12/30/19 11:33 AM, Paolo Bonzini wrote:
> > > Il lun 30 dic 2019, 09:59 Philippe Mathieu-Daud=C3=A9 <philmd@redhat.=
com
> > > <mailto:philmd@redhat.com>> ha scritto:
> > >
> > >      > I'd prefer not changing those files.
> > >
> > >     OK, I'll wait to see what Richard/Markus prefer.
> > >
> > >
> > > I think it's best if you keep the include directives as-is for files
> > > only needed from tcg/, and move the other headers (those that are
> needed
> > > from other directories only) to include/tcg.
>
> Assuming we don't want to add include/tcg/ in the path search list, we
> still need to update the tcg/*.c include directives to use "tcg/":
>
> tcg/tcg-op-gvec.c:21:10: fatal error: tcg.h: No such file or directory
>    21 | #include "tcg.h"
>       |          ^~~~~~~
> compilation terminated.
> make[1]: *** [rules.mak:69: tcg/tcg-op-gvec.o] Error 1
> make[1]: *** Waiting for unfinished jobs....
>   CC      mips64el-softmmu/accel/tcg/translate-all.o
> tcg/optimize.c:27:10: fatal error: tcg-op.h: No such file or directory
>    27 | #include "tcg-op.h"
>       |          ^~~~~~~~~~
> compilation terminated.
> make[1]: *** [rules.mak:69: tcg/optimize.o] Error 1
> tcg/tcg-op-vec.c:22:10: fatal error: tcg.h: No such file or directory
>    22 | #include "tcg.h"
>       |          ^~~~~~~
> compilation terminated.
> make[1]: *** [rules.mak:69: tcg/tcg-op-vec.o] Error 1
> tcg/tcg-common.c:35:10: fatal error: tcg-opc.h: No such file or directory
>    35 | #include "tcg-opc.h"
>       |          ^~~~~~~~~~~
> compilation terminated.
> make[1]: *** [rules.mak:69: tcg/tcg-common.o] Error 1
> tcg/tcg-op.c:28:10: fatal error: tcg.h: No such file or directory
>    28 | #include "tcg.h"
>       |          ^~~~~~~
> compilation terminated.
> make[1]: *** [rules.mak:69: tcg/tcg-op.o] Error 1
> tcg/tcg.c:51:10: fatal error: tcg-op.h: No such file or directory
>    51 | #include "tcg-op.h"
>       |          ^~~~~~~~~~
> compilation terminated.
>
> > I thought moving headers to include/tcg would diverge too much from
> > libtcg, but this project already did it, so why not:
> > https://github.com/S2E/libtcg/tree/master/include/tcg
>
>

--000000000000ba6063059aef6f6f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Yes, of course (I thought it would be clear from the mess=
age, but perhaps it was a bit implicit).<div dir=3D"auto"><br></div><div di=
r=3D"auto">Paolo</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">Il lun 30 dic 2019, 16:48 Philippe Mathieu-Daud=C3=A9=
 &lt;<a href=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt; ha scri=
tto:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">On Mon, Dec 30, 2019 at 3:02 P=
M Philippe Mathieu-Daud=C3=A9<br>
&lt;<a href=3D"mailto:philmd@redhat.com" target=3D"_blank" rel=3D"noreferre=
r">philmd@redhat.com</a>&gt; wrote:<br>
&gt; On 12/30/19 11:33 AM, Paolo Bonzini wrote:<br>
&gt; &gt; Il lun 30 dic 2019, 09:59 Philippe Mathieu-Daud=C3=A9 &lt;<a href=
=3D"mailto:philmd@redhat.com" target=3D"_blank" rel=3D"noreferrer">philmd@r=
edhat.com</a><br>
&gt; &gt; &lt;mailto:<a href=3D"mailto:philmd@redhat.com" target=3D"_blank"=
 rel=3D"noreferrer">philmd@redhat.com</a>&gt;&gt; ha scritto:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; I&#39;d prefer not changing those files.=
<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0OK, I&#39;ll wait to see what Richard/Markus p=
refer.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; I think it&#39;s best if you keep the include directives as-is fo=
r files<br>
&gt; &gt; only needed from tcg/, and move the other headers (those that are=
 needed<br>
&gt; &gt; from other directories only) to include/tcg.<br>
<br>
Assuming we don&#39;t want to add include/tcg/ in the path search list, we<=
br>
still need to update the tcg/*.c include directives to use &quot;tcg/&quot;=
:<br>
<br>
tcg/tcg-op-gvec.c:21:10: fatal error: tcg.h: No such file or directory<br>
=C2=A0 =C2=A021 | #include &quot;tcg.h&quot;<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~<br>
compilation terminated.<br>
make[1]: *** [rules.mak:69: tcg/tcg-op-gvec.o] Error 1<br>
make[1]: *** Waiting for unfinished jobs....<br>
=C2=A0 CC=C2=A0 =C2=A0 =C2=A0 mips64el-softmmu/accel/tcg/translate-all.o<br=
>
tcg/optimize.c:27:10: fatal error: tcg-op.h: No such file or directory<br>
=C2=A0 =C2=A027 | #include &quot;tcg-op.h&quot;<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~<br>
compilation terminated.<br>
make[1]: *** [rules.mak:69: tcg/optimize.o] Error 1<br>
tcg/tcg-op-vec.c:22:10: fatal error: tcg.h: No such file or directory<br>
=C2=A0 =C2=A022 | #include &quot;tcg.h&quot;<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~<br>
compilation terminated.<br>
make[1]: *** [rules.mak:69: tcg/tcg-op-vec.o] Error 1<br>
tcg/tcg-common.c:35:10: fatal error: tcg-opc.h: No such file or directory<b=
r>
=C2=A0 =C2=A035 | #include &quot;tcg-opc.h&quot;<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~<br>
compilation terminated.<br>
make[1]: *** [rules.mak:69: tcg/tcg-common.o] Error 1<br>
tcg/tcg-op.c:28:10: fatal error: tcg.h: No such file or directory<br>
=C2=A0 =C2=A028 | #include &quot;tcg.h&quot;<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~<br>
compilation terminated.<br>
make[1]: *** [rules.mak:69: tcg/tcg-op.o] Error 1<br>
tcg/tcg.c:51:10: fatal error: tcg-op.h: No such file or directory<br>
=C2=A0 =C2=A051 | #include &quot;tcg-op.h&quot;<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~<br>
compilation terminated.<br>
<br>
&gt; I thought moving headers to include/tcg would diverge too much from<br=
>
&gt; libtcg, but this project already did it, so why not:<br>
&gt; <a href=3D"https://github.com/S2E/libtcg/tree/master/include/tcg" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/S2E/libtcg/=
tree/master/include/tcg</a><br>
<br>
</blockquote></div>

--000000000000ba6063059aef6f6f--

