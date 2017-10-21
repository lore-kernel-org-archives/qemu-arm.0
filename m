Received: by 10.223.197.9 with SMTP id q9csp8780072wrf;
        Sat, 21 Oct 2017 04:10:45 -0700 (PDT)
X-Received: by 10.55.203.5 with SMTP id d5mr9993833qkj.189.1508584244936;
        Sat, 21 Oct 2017 04:10:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508584244; cv=none;
        d=google.com; s=arc-20160816;
        b=tuOW5wMroSgGW+AUBPAkOIU9xbtU0zXit0ZlRa1jgzM2WIV2RYZCNnIQbg+Kgq5ghY
         r/maV/BG8MYlJGR1qb5yAOZTWnfThLQ8kgHq82XUzVGwd+mr57eMyJtLtc0Tyc0kzk+E
         7rZouf1dPY+VMYVJKzEW44sQ4FcFe9xBuaWs+uBv2RcyyN2Y3zZ/vPVz2z88vn/fBo+j
         2SSq6r5ABdYyGZKbd2jx4kqNEZD48Q9GJ0mRaJ/5YihseFbsv60m069dNTnrZOdm+26A
         +2PzlAJxtFTn/c6wKwT5p1UVSlMDZOV0qN3QlhH7QWMM86/pIAtfXRIYL3W1ITOvXjAJ
         zKDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=68sUmoyw2rWJbj8oTuz6RD8032XdZ2zp4zxOGvTz9AU=;
        b=uyCU94WCktUweGpSMNpteuGUdLwCn9MPaKOYU4LokeqYxY0CWL9WEiFuqRyBAurAhP
         Xds6IX0otG/uckx2kLAFefRQRMzuQgXvbDsbqwAI72uL9OdGDtHjKZ7zUQikt9wzejzS
         vF1MNcwJT5lCL9+CV2zjIXTK0MKSdPu1Ak04y3rTjwIxX05hsZWsXMhhQdPcBCc4miXj
         FiCAofLwvvPF7CTLrcSUXP5TuC6TmFZ7l/CoXajE+P/NBnzQ6ZHqfeEQSWXvjn9BgFBD
         PatPo+F7WXunceivQeNfpL+CxBl7gcjNE58jiEonF280UDr9ZVb1sVE/RybJcIZS7n6M
         eLfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@aucklanduni.ac.nz header.s=google header.b=XtYbm1AT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s22si2558269qtc.233.2017.10.21.04.10.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 21 Oct 2017 04:10:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@aucklanduni.ac.nz header.s=google header.b=XtYbm1AT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57369 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e5rfu-0002YB-NJ
	for alex.bennee@linaro.org; Sat, 21 Oct 2017 07:10:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42469)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hteh703@aucklanduni.ac.nz>) id 1e5rfn-0002Xt-GR
	for qemu-arm@nongnu.org; Sat, 21 Oct 2017 07:10:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hteh703@aucklanduni.ac.nz>) id 1e5rfm-0002pj-DR
	for qemu-arm@nongnu.org; Sat, 21 Oct 2017 07:10:35 -0400
Received: from mail-wr0-x236.google.com ([2a00:1450:400c:c0c::236]:53381)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <hteh703@aucklanduni.ac.nz>)
	id 1e5rfl-0002p2-WD
	for qemu-arm@nongnu.org; Sat, 21 Oct 2017 07:10:34 -0400
Received: by mail-wr0-x236.google.com with SMTP id u40so7397156wrf.10
	for <qemu-arm@nongnu.org>; Sat, 21 Oct 2017 04:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=aucklanduni.ac.nz; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=68sUmoyw2rWJbj8oTuz6RD8032XdZ2zp4zxOGvTz9AU=;
	b=XtYbm1ATraTPgouvsNGQlLKQB5mID2so/+pyTKQVXfWp2yQi2XUZqr71huLKmKW5Ej
	vh6u6AwGLOsSSaAJzOLze6H2nNkz17RExKoicATX2dP100j3/AZV5wba6OonRrlo972N
	LmgdEuyX0qdowozlWqcfmPmXkCGO3dvMzU3cM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=68sUmoyw2rWJbj8oTuz6RD8032XdZ2zp4zxOGvTz9AU=;
	b=f4CLVL5dZXE9Jv/eq6nphGYeogwQc+J1/CdXfdJml9DGE9rQM+EblRLCtipjC08NMq
	h15j72pKzwcLXQesBDysEh67qOzOJkuwN8OjeTNeKPguzPXRyjCcjDqZagrANIURlgvB
	pz+kbFQw3BorYHYwtpFOce3XfKRss2u22W+afpQ6dCm+87+KKicML1s4DDWLha6Se3oD
	W9fYpusET6uTXGJ3B1Qb3mQ1Pp3Aq6qcwMDyyoopcEfU+4BQQDsGI6bnADFLZdqR184L
	e5825iGJKlCxtkC96sIzao2urdbR5U4KF7q33MeH723ZZnSeJz+EH0pytheMJdL7kefk
	6bFA==
X-Gm-Message-State: AMCzsaV9EG2rnKlOo1nOXGLtqRavoBApXNqY5x32mVvjiVhak3MI1IdB
	OkIleg9U26Hk6K2QuUv3331/GI/guzPLv39j6mcgNA==
X-Google-Smtp-Source: ABhQp+TK18jlc1KuTfdwkOYZL9HMp/jP1wqBcfE/brD+0LmbNugxVmcB8RnYvwohw8SQZOoFDrBmZlqJCieprZMWKjA=
X-Received: by 10.223.158.129 with SMTP id a1mr1359030wrf.179.1508584232477;
	Sat, 21 Oct 2017 04:10:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.102.214 with HTTP; Sat, 21 Oct 2017 04:10:31 -0700 (PDT)
In-Reply-To: <CAFEAcA8TfRzsP2TuK9_MeP=puPV-+3ivL=R8F3LkGcnMCDLEQA@mail.gmail.com>
References: <CAPLZ2xMgcbiJr+rbQwZxbP6chMzZ7fBcJ1q35tEbjhccQHPsow@mail.gmail.com>
	<CAFEAcA8TfRzsP2TuK9_MeP=puPV-+3ivL=R8F3LkGcnMCDLEQA@mail.gmail.com>
From: Hui Yie Teh <hteh703@aucklanduni.ac.nz>
Date: Sun, 22 Oct 2017 00:10:31 +1300
Message-ID: <CAPLZ2xM+1MwjYgmLYWo_gWctN_B10zma+X1iUKB-0G4iau_=zQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="089e082111604a79ea055c0ca3ce"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::236
Subject: Re: [Qemu-arm] .bss more than LM3S6965evb RAM size
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4RmdtkPUuxdl

--089e082111604a79ea055c0ca3ce
Content-Type: text/plain; charset="UTF-8"

I see, thanks for your reply Peter!

What if I have a stack size of 2048*4 as I'm using 4 threads with that
stack size? Will that be in the RAM as well?

Also, this is the memory map of my linker:

MEMORY {
> RAM_INT (AIW) : ORIGIN = 0x20000000, LENGTH = 16M
> ROM_INT (RX)  : ORIGIN = 0x00000000, LENGTH = 64M
> }


I was wondering if it means that I have 16MB of RAM and 64MB of ROM? Or
does it not affect the original RAM and ROM sizes?


On 21 October 2017 at 23:38, Peter Maydell <peter.maydell@linaro.org> wrote:

> On 21 October 2017 at 08:31, Hui Yie Teh <hteh703@aucklanduni.ac.nz>
> wrote:
> > Hi,
> >
> > As far as I'm aware, the LM3S6965evb board on qemu has 64kB of RAM.
> However,
> > my application has the following sizes:
> >
> >>    text        data       bss         dec         hex     filename
> >>  77540      1544     64032  143116   22f0c   o-optimize/test.exe
> >
> >
> > The bss and part of the data, I believe, will be located in the RAM.
> > However, that is more than 64kB, but my program still runs fine on the
> > emulated board. Is there a reason why? Or am I missing something here?
>
> If the data runs off the end of the RAM, the image write will silently
> write the data into nothingness, and reads will read as zeroes. If
> your program doesn't actually use the data that's got lost it won't
> notice, or maybe it behaves wrongly but not in ways you've noticed.
> In this case it looks like your data+bss is 65576 bytes, which is only
> 40 bytes off the end, so it depends what the linker has put in those
> last 40 bytes.
>
> thanks
> -- PMM
>

--089e082111604a79ea055c0ca3ce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I see, thanks for your reply Peter!=C2=A0<br><br>What if I=
 have a stack size of 2048*4 as I&#39;m using 4 threads with that stack siz=
e? Will that be in the RAM as well?<br><br>Also, this is the memory map of =
my linker:=C2=A0<br><br><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">M=
EMORY {<br><span style=3D"white-space:pre">	</span>RAM_INT (AIW) : ORIGIN =
=3D 0x20000000, LENGTH =3D 16M<br><span style=3D"white-space:pre">	</span>R=
OM_INT (RX)=C2=A0 : ORIGIN =3D 0x00000000, LENGTH =3D 64M<br>}</blockquote>=
<div><br></div><div>I was wondering if it means that I have 16MB of RAM and=
 64MB of ROM? Or does it not affect the original RAM and ROM sizes?<br><br>=
</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 21=
 October 2017 at 23:38, Peter Maydell <span dir=3D"ltr">&lt;<a href=3D"mail=
to:peter.maydell@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On 21=
 October 2017 at 08:31, Hui Yie Teh &lt;<a href=3D"mailto:hteh703@aucklandu=
ni.ac.nz">hteh703@aucklanduni.ac.nz</a>&gt; wrote:<br>
&gt; Hi,<br>
&gt;<br>
&gt; As far as I&#39;m aware, the LM3S6965evb board on qemu has 64kB of RAM=
. However,<br>
&gt; my application has the following sizes:<br>
&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 text=C2=A0 =C2=A0 =C2=A0 =C2=A0 data=C2=A0 =C2=A0 =C2=
=A0 =C2=A0bss=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dec=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0hex=C2=A0 =C2=A0 =C2=A0filename<br>
&gt;&gt;=C2=A0 77540=C2=A0 =C2=A0 =C2=A0 1544=C2=A0 =C2=A0 =C2=A064032=C2=
=A0 143116=C2=A0 =C2=A022f0c=C2=A0 =C2=A0o-optimize/test.exe<br>
&gt;<br>
&gt;<br>
&gt; The bss and part of the data, I believe, will be located in the RAM.<b=
r>
&gt; However, that is more than 64kB, but my program still runs fine on the=
<br>
&gt; emulated board. Is there a reason why? Or am I missing something here?=
<br>
<br>
</span>If the data runs off the end of the RAM, the image write will silent=
ly<br>
write the data into nothingness, and reads will read as zeroes. If<br>
your program doesn&#39;t actually use the data that&#39;s got lost it won&#=
39;t<br>
notice, or maybe it behaves wrongly but not in ways you&#39;ve noticed.<br>
In this case it looks like your data+bss is 65576 bytes, which is only<br>
40 bytes off the end, so it depends what the linker has put in those<br>
last 40 bytes.<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div><br></div>

--089e082111604a79ea055c0ca3ce--
