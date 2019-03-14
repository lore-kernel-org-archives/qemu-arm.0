Received: by 2002:adf:f011:0:0:0:0:0 with SMTP id j17csp805850wro;
        Thu, 14 Mar 2019 05:50:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxoSNXtcF/IJnl3MJCzYyl05dAFQJ6moToLkBG54jQNy5atPy0dqsr+Bafvm2oVZ+XXs1zE
X-Received: by 2002:a0d:fd47:: with SMTP id n68mr11835742ywf.407.1552567811564;
        Thu, 14 Mar 2019 05:50:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552567811; cv=none;
        d=google.com; s=arc-20160816;
        b=VMGPseeyl2QEkLSPOf7DAXdQabHWvTmPua51HZSSwFe7nOIIt1Tn88TiSggZJgWk0w
         OGdf6WjejYcdSIMTpTyzfCVHYBF0th2Rur5RqMLEWGqHWtkBvueVyZagknaa3Xb4FsXW
         +EV1mpSyHH+rr0bFOZ39pVIqyacOl9m/rXYtRGH4kZ2cR0plmM4tOJnIWGLCqEvRZLuJ
         kT4mtBLKyyn7/6Zk67r3Ct+tHYS+5Syb9Ni7V5oo9GpBYQ0ZIxg/ScL9QKEonJp0lMC/
         qRPbGo6HxbAC8a1KhHsUodCq8C8z6YVSJmKMjUJ0HIkBi+yAcddyKw3Nc3JwMPoaJ5lJ
         P62A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:from:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:subject
         :to:message-id:date:in-reply-to:references:mime-version
         :dkim-signature;
        bh=TYGO+2koI0FGlpeyywjAnSgYBEv5+BWjllHtyfD9pZY=;
        b=CAdP75r3q3jHoDtCNzrBIujvLFHZRyXTRoBgcgWoayJUhlqizYhpxqL2RptuSoOC0A
         V3/Pr7jwL8fivxkEVDReCsr0GQ59srQbGKz5oL5hb7JSl9wYI+pu96xCPDCXZxUMaRCx
         /7imwGongKu5zUoEFLrphZ4KepIrAlazlXBLpdcmSFL7Lb/tmpUt7CuSxk/zhrRvwsEy
         Zxc1B6r+JzTJXoP+jSMDWZlQDvhVnL5Jxk7X/SgLwXAvoYlqiQCJ4GaBkoBk89KMzkvk
         pCYVvoo4KO2qNDx3nXDI/W5jQfOMb1s6motTmKA/BnHbbvPXl2BNMcgE56f2nk96T8Hw
         2HnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=hKL2vXd4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v13si8634995ybp.189.2019.03.14.05.50.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Mar 2019 05:50:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=hKL2vXd4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:36278 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h4PoI-0002os-TR
	for alex.bennee@linaro.org; Thu, 14 Mar 2019 08:50:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33316)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bluecmd@google.com>) id 1h4MgN-00043U-0N
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 05:29:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bluecmd@google.com>) id 1h4Mag-00072M-Cj
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 05:23:55 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:37856)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bluecmd@google.com>) id 1h4Maf-00071r-W6
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 05:23:54 -0400
Received: by mail-oi1-x241.google.com with SMTP id n7so3663552oic.4
	for <qemu-arm@nongnu.org>; Thu, 14 Mar 2019 02:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=TYGO+2koI0FGlpeyywjAnSgYBEv5+BWjllHtyfD9pZY=;
	b=hKL2vXd4dyDT1D2KirDWCPP+ncsZKtL3t9ZpA1b4TBfrMs/4qYj3NidqzoAR2z0jsw
	bzpOJnV1AtU6SojfCznh2GaW6L8Qq6TPRaXx9KFqx3rWHXgkiiq2599aNUBDlbTeFa/6
	8/MedIekgrSUwpwOVvwxp8AvIKO46n6jdeXI2pSUb3/WjguxflkZBwmmgm5CjNxloCVj
	tPtLXVfh6wQrs1/UAEHpR59nwTk89Ypd8su9V4F1oWmUXqDl+YT3zbQnyKjqIWO/U8sg
	zDVmz7ShUV0kcxJ0MiNfXk2yNL9j6Uw6ZBHufoa2RdiE4Wzx0hFiUitcrBgjgibV5oZl
	+Jgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=TYGO+2koI0FGlpeyywjAnSgYBEv5+BWjllHtyfD9pZY=;
	b=hDXGTloe11CrJ2iamyaTE3ZUHrQEjUh6Au86qRGsOxdeki7QZxpabWy75rpsBj4Jaq
	KfXeIwfjCO6F9CWN3Q8XKYzueySzOGNrFyRcnwGuESqH93r8ziATPDosPTloMBN4Hgsc
	YRTaipOhrh3y56ZToORWCoBOExjPzXb+XzQbIh28x41x42s29FpGTwc7LdIBe3pGmOCm
	JDzmahDpaa0QSZHQcptB3FUOfpgE8duwWJUN9lcXuTNrfQez3BwbwPTO0wOAWYFOFxgw
	WMS5F3AfXyCB2Ih//764n+9Bk6w9FFuVlQIVNq2nDT29J3G2NjHRQYmmFv8Y2koGmnRe
	wc3w==
X-Gm-Message-State: APjAAAUM+hOcrVSdb3hGI2ZnJryy4rbp1dWj/hzGIQLpxojjgR+ExZ9N
	TYonh+s8O9gW3gHGyCXnx9rXkwylZ+sHRztpSFKgpg==
X-Received: by 2002:aca:3a57:: with SMTP id h84mr1369187oia.162.1552555431575; 
	Thu, 14 Mar 2019 02:23:51 -0700 (PDT)
MIME-Version: 1.0
References: <155255399748.14224.8340819987953765086@00e3a2c681c7>
	<b240943d-9294-6894-1295-6110278e81cb@kaod.org>
In-Reply-To: <b240943d-9294-6894-1295-6110278e81cb@kaod.org>
Date: Thu, 14 Mar 2019 10:23:40 +0100
Message-ID: <CAEfeXva7-cjogOsV3Q3na_i2XZj5376gcFhScFmPZQKXPSpuzQ@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: multipart/alternative; boundary="000000000000ff165305840a7af2"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::241
X-Mailman-Approved-At: Thu, 14 Mar 2019 08:49:53 -0400
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 0/5] aspeed/timer: Fix slowdowns
 in recent Linux
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
From: Christian Svensson via Qemu-arm <qemu-arm@nongnu.org>
Reply-To: Christian Svensson <bluecmd@google.com>
Cc: fam@euphon.net, peter.maydell@linaro.org, Andrew Jeffery <andrew@aj.id.au>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OKWR8SkJkytL

--000000000000ff165305840a7af2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

My apologies, I don't know how I missed those warnings.
I'll create a new patch.

- Chris


On Thu, Mar 14, 2019 at 10:06 AM C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:

> Hello,
>
> For the time being, we can drop patch 5 from this series.
>
> Thanks,
>
> C.
>
> On 3/14/19 9:59 AM, no-reply@patchew.org wrote:
> > Patchew URL:
> https://patchew.org/QEMU/20190314084235.9887-1-clg@kaod.org/
> >
> >
> >
> > Hi,
> >
> > This series failed the docker-mingw@fedora build test. Please find the
> testing commands and
> > their output below. If you have Docker installed, you can probably
> reproduce it
> > locally.
> >
> > =3D=3D=3D TEST SCRIPT BEGIN =3D=3D=3D
> > #!/bin/bash
> > time make docker-test-mingw@fedora SHOW_ENV=3D1 J=3D14 NETWORK=3D1
> > =3D=3D=3D TEST SCRIPT END =3D=3D=3D
> >
> >   CC      migration/xbzrle.o
> >   CC      migration/postcopy-ram.o
> > /tmp/qemu-test/src/hw/timer/aspeed_timer.c: In function
> 'aspeed_timer_set_value':
> > /tmp/qemu-test/src/hw/timer/aspeed_timer.c:279:19: error: '__int128_t'
> undeclared (first use in this function); did you mean '__int128'?
> >                  ((__int128_t)delta * NANOSECONDS_PER_SECOND / rate);
> >                    ^~~~~~~~~~
> >                    __int128
> > /tmp/qemu-test/src/hw/timer/aspeed_timer.c:279:19: note: each undeclare=
d
> identifier is reported only once for each function it appears in
> > /tmp/qemu-test/src/hw/timer/aspeed_timer.c:279:30: error: expected ')'
> before 'delta'
> >                  ((__int128_t)delta * NANOSECONDS_PER_SECOND / rate);
> >                  ~            ^~~~~
> >                               )
> > /tmp/qemu-test/src/hw/timer/aspeed_timer.c:276:22: error: unused
> variable 'rate' [-Werror=3Dunused-variable]
> >              uint32_t rate =3D calculate_rate(t);
> >                       ^~~~
> > /tmp/qemu-test/src/hw/timer/aspeed_timer.c:275:21: error: unused
> variable 'delta' [-Werror=3Dunused-variable]
> >              int64_t delta =3D (int64_t) value - (int64_t)
> calculate_ticks(t, now);
> >                      ^~~~~
> > cc1: all warnings being treated as errors
> >
> >
> > The full log is available at
> >
> http://patchew.org/logs/20190314084235.9887-1-clg@kaod.org/testing.docker=
-mingw@fedora/?type=3Dmessage
> .
> > ---
> > Email generated automatically by Patchew [http://patchew.org/].
> > Please send your feedback to patchew-devel@redhat.com
> >
>
>

--000000000000ff165305840a7af2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>My apologies, I don&#39;t know how =
I missed those warnings.</div><div>I&#39;ll create a new patch.</div><div><=
br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signature" data-smart=
mail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">- Chris</di=
v></div></div></div></div><br></div></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 14, 2019 at 10:06 AM C=C3=
=A9dric Le Goater &lt;<a href=3D"mailto:clg@kaod.org">clg@kaod.org</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hello,<br=
>
<br>
For the time being, we can drop patch 5 from this series. <br>
<br>
Thanks,<br>
<br>
C. <br>
<br>
On 3/14/19 9:59 AM, <a href=3D"mailto:no-reply@patchew.org" target=3D"_blan=
k">no-reply@patchew.org</a> wrote:<br>
&gt; Patchew URL: <a href=3D"https://patchew.org/QEMU/20190314084235.9887-1=
-clg@kaod.org/" rel=3D"noreferrer" target=3D"_blank">https://patchew.org/QE=
MU/20190314084235.9887-1-clg@kaod.org/</a><br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; Hi,<br>
&gt; <br>
&gt; This series failed the docker-mingw@fedora build test. Please find the=
 testing commands and<br>
&gt; their output below. If you have Docker installed, you can probably rep=
roduce it<br>
&gt; locally.<br>
&gt; <br>
&gt; =3D=3D=3D TEST SCRIPT BEGIN =3D=3D=3D<br>
&gt; #!/bin/bash<br>
&gt; time make docker-test-mingw@fedora SHOW_ENV=3D1 J=3D14 NETWORK=3D1<br>
&gt; =3D=3D=3D TEST SCRIPT END =3D=3D=3D<br>
&gt; <br>
&gt;=C2=A0 =C2=A0CC=C2=A0 =C2=A0 =C2=A0 migration/xbzrle.o<br>
&gt;=C2=A0 =C2=A0CC=C2=A0 =C2=A0 =C2=A0 migration/postcopy-ram.o<br>
&gt; /tmp/qemu-test/src/hw/timer/aspeed_timer.c: In function &#39;aspeed_ti=
mer_set_value&#39;:<br>
&gt; /tmp/qemu-test/src/hw/timer/aspeed_timer.c:279:19: error: &#39;__int12=
8_t&#39; undeclared (first use in this function); did you mean &#39;__int12=
8&#39;?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((__int1=
28_t)delta * NANOSECONDS_PER_SECOND / rate);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^=
~~~~~~~~~<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _=
_int128<br>
&gt; /tmp/qemu-test/src/hw/timer/aspeed_timer.c:279:19: note: each undeclar=
ed identifier is reported only once for each function it appears in<br>
&gt; /tmp/qemu-test/src/hw/timer/aspeed_timer.c:279:30: error: expected &#3=
9;)&#39; before &#39;delta&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((__int1=
28_t)delta * NANOSECONDS_PER_SECOND / rate);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)<br>
&gt; /tmp/qemu-test/src/hw/timer/aspeed_timer.c:276:22: error: unused varia=
ble &#39;rate&#39; [-Werror=3Dunused-variable]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t rate =3D calc=
ulate_rate(t);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0^~~~<br>
&gt; /tmp/qemu-test/src/hw/timer/aspeed_timer.c:275:21: error: unused varia=
ble &#39;delta&#39; [-Werror=3Dunused-variable]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int64_t delta =3D (int=
64_t) value - (int64_t) calculate_ticks(t, now);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ^~~~~<br>
&gt; cc1: all warnings being treated as errors<br>
&gt; <br>
&gt; <br>
&gt; The full log is available at<br>
&gt; <a href=3D"http://patchew.org/logs/20190314084235.9887-1-clg@kaod.org/=
testing.docker-mingw@fedora/?type=3Dmessage" rel=3D"noreferrer" target=3D"_=
blank">http://patchew.org/logs/20190314084235.9887-1-clg@kaod.org/testing.d=
ocker-mingw@fedora/?type=3Dmessage</a>.<br>
&gt; ---<br>
&gt; Email generated automatically by Patchew [<a href=3D"http://patchew.or=
g/" rel=3D"noreferrer" target=3D"_blank">http://patchew.org/</a>].<br>
&gt; Please send your feedback to <a href=3D"mailto:patchew-devel@redhat.co=
m" target=3D"_blank">patchew-devel@redhat.com</a><br>
&gt; <br>
<br>
</blockquote></div>

--000000000000ff165305840a7af2--
