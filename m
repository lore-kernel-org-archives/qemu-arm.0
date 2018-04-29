Received: by 10.28.4.212 with SMTP id 203csp3181091wme;
        Sun, 29 Apr 2018 16:03:41 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZo8WAT3xbr5HO8mJHMWnKQag3METcYvBAXH58+cRhlkA4/tjyBhDdQ4hmdcVkqrnKmXvKpP
X-Received: by 2002:ac8:7355:: with SMTP id q21-v6mr9839273qtp.27.1525043021716;
        Sun, 29 Apr 2018 16:03:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525043021; cv=none;
        d=google.com; s=arc-20160816;
        b=sgNEhTJ9PSKAFuBoD0UKQxmPg/RQvIWy87rxYviuvKQcL9nz/VMmNOfZ0MkVNtczWF
         EnoADypa7YLpbcfFO4mntIjxC5xxfeJaB024BNboz+obMpz9jnw5fxUEq2puAfhoWjMV
         cAqt04V1nYKvt69vYUQGndNsRnoddEw4MP7WZiWT09EUe4CVgaHo1es0M50CEv+r5YNa
         q4Q7djv37iB70q5wEw0VMGHd7nR0d3WZmlTOu2G2E6xaCWf0xLNJoBTnxWUSATYmJcbe
         fqpKKYm3gGhYvXXl9DAgQxANonNUMmwTugKxUZ3I4HiAelR9n1PlD+9/6O3DQIMxdEql
         xXHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=9Ts9yWEL6HKT8pSr5XARfPFBwYJvo8rCD9KgI96cPro=;
        b=ApEjgAW4Dx5uyG329FLJ7R9+tadJWfYy8kuw3Y9hF58SsYuWW/PDhH3Jtc9lusqT8G
         yL3WK1BpjDQtp5i8HVO8xYht68ZBQdE9Cvxtwxy+4g1GzpvZd7VjL2N2BcO98xl8H+in
         ZEF4v6g4i92Qy2ydUQ99qeJpUp4dkLsasJr36DlXflNF/nAa/n1Mdal695Cvq1qulAf6
         Ealgs2GZgplt4vH1OHNZT63u1zxg6Y+UCLEI7pbAWlqH9Fuk9oTx8rtMNUC6plQ9+gVi
         f78+rlkMsfIFArA+S/sxN3sZn/+pCvmDiLsFo2uDZax8JVedV1jcclfDQeY4rpbovecz
         9Klg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@sifive.com header.s=google header.b=i5j30r8o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k5-v6si1397523qvg.278.2018.04.29.16.03.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 29 Apr 2018 16:03:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@sifive.com header.s=google header.b=i5j30r8o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57148 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fCvM5-0005PS-7Z
	for alex.bennee@linaro.org; Sun, 29 Apr 2018 19:03:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43937)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjc@sifive.com>) id 1fCvLw-0005PF-MY
	for qemu-arm@nongnu.org; Sun, 29 Apr 2018 19:03:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjc@sifive.com>) id 1fCvLv-0007qQ-Cs
	for qemu-arm@nongnu.org; Sun, 29 Apr 2018 19:03:32 -0400
Received: from mail-oi0-x230.google.com ([2607:f8b0:4003:c06::230]:40323)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mjc@sifive.com>) id 1fCvLv-0007q8-5h
	for qemu-arm@nongnu.org; Sun, 29 Apr 2018 19:03:31 -0400
Received: by mail-oi0-x230.google.com with SMTP id c203-v6so6042783oib.7
	for <qemu-arm@nongnu.org>; Sun, 29 Apr 2018 16:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9Ts9yWEL6HKT8pSr5XARfPFBwYJvo8rCD9KgI96cPro=;
	b=i5j30r8oBE0gVgy5lRxjhCl3I4dKPBHSgszqJG0Cho5rw9TagKNjr/dTPDN2xdYkWr
	EZoBM70rlXxtmO92KesJMgjdxoQIA5QEXeA2qgkP0z9at8Ikl65wAV9zJCErf01AxbsU
	W2PzsjZCUMUOSk/Cd39B7rczJ14Ab17wAgeMNtZhz6ntj7UmYx89fSc0kCaq5pqXwF8r
	wEcYRo+T4nSbQl1pYqUx0pa1mFjkgnnNxsL3S8maX9xam/enoyodaSErZZHGR3D3nMFW
	/PqfkGKL8O4ftPZzOnQ0gUCBPYwo1pN0cCKBciJTrnMad0D32w1844cXwZW1XpEe1VlW
	kdpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9Ts9yWEL6HKT8pSr5XARfPFBwYJvo8rCD9KgI96cPro=;
	b=RnocLsDrgbCg+rw5dNvnsA/MMx+o6GXwmeqzLCDye/iauUR0Woii0alOo/ZZIPJACs
	BigM+S1KHBykT3Yp3mVRwhycTkiecD46dqnPbNPLhR2Qpoxgmpd+IB2jcFBhv6+0boft
	e3pDpZCkzjVak2y/u2oKK4DAIeYNRjYpI+GT4KGT6FXtqktDSHghST/N2ckabSgOaWtk
	yQf3ufxFfCcWEJC/Uod7Go/ke9Mkz4SkNPK249axbRSBXoUfwtxqUvy4LSrrQmSIILqR
	5uTIEPjmaCW3T0ogcFVoLGpVsCy3Fqr1Z96bQ7OZSSRXyudmMdS1xC5g3dpAs2u4Fmvy
	56xg==
X-Gm-Message-State: ALQs6tBed+u1r1hJRTFB3wkmpcJTs8ZE7kOZTE+vFWwE5VI2dxEBu1py
	FH3Jz7Of7iMpeX/zfzyUM9i4HHH2iMbN6HSXIXNopQ==
X-Received: by 2002:aca:170d:: with SMTP id
	j13-v6mr6478381oii.113.1525043010055; 
	Sun, 29 Apr 2018 16:03:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.74.25.195 with HTTP; Sun, 29 Apr 2018 16:03:29 -0700 (PDT)
In-Reply-To: <45076b60-a2d2-281a-3c85-6c21d87a49ff@linaro.org>
References: <20180427002651.28356-1-richard.henderson@linaro.org>
	<20180427002651.28356-6-richard.henderson@linaro.org>
	<CAHNT7NujtwKtCtsxG91DtgriDd2sjVZwyqKhAp03LR=eJjdMtQ@mail.gmail.com>
	<45076b60-a2d2-281a-3c85-6c21d87a49ff@linaro.org>
From: Michael Clark <mjc@sifive.com>
Date: Mon, 30 Apr 2018 11:03:29 +1200
Message-ID: <CAHNT7NtDL2v8svSR3YvT14quz3MOJB-=_3CuTc8HfDkfMHMhBQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000e1c729056b04be3a"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::230
Subject: Re: [Qemu-arm] [PATCH 5/9] target/riscv: Use new atomic min/max
 expanders
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
Cc: "Emilio G. Cota" <cota@braap.org>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Palmer Dabbelt <palmer@sifive.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UvgZzsgf5U8e

--000000000000e1c729056b04be3a
Content-Type: text/plain; charset="UTF-8"

On Sat, Apr 28, 2018 at 5:53 AM, Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 04/26/2018 09:24 PM, Michael Clark wrote:
> >
> >
> > On Fri, Apr 27, 2018 at 12:26 PM, Richard Henderson
> > <richard.henderson@linaro.org <mailto:richard.henderson@linaro.org>>
> wrote:
> >
> >     Cc: Michael Clark <mjc@sifive.com <mailto:mjc@sifive.com>>
> >     Cc: Palmer Dabbelt <palmer@sifive.com <mailto:palmer@sifive.com>>
> >     Cc: Sagar Karandikar <sagark@eecs.berkeley.edu
> >     <mailto:sagark@eecs.berkeley.edu>>
> >     Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de
> >     <mailto:kbastian@mail.uni-paderborn.de>>
> >     Signed-off-by: Richard Henderson <richard.henderson@linaro.org
> >     <mailto:richard.henderson@linaro.org>>
> >
> >
> > Reviewed-by: Michael Clark <mjc@sifive.com <mailto:mjc@sifive.com>>
> >
> > If you give me a remote I can pull into my local workspace and test. The
> change
> > looks pretty straight-forward. There are tests for amos in riscv-tests
> but no
> > parallel tests (i.e. contended case).
>
> git://github.com/rth7680/qemu.git tgt-arm-atomic-2


I just did a fetch and only saw tgt-arm-atomic. Maybe you haven't pushed
tgt-arm-atomic-2.

In any case the tgt-arm-atomic branch passes riscv-tests.

Michael.

--000000000000e1c729056b04be3a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Sat, Apr 28, 2018 at 5:53 AM, Richard Henderson <span dir=3D"ltr">&l=
t;<a href=3D"mailto:richard.henderson@linaro.org" target=3D"_blank">richard=
.henderson@linaro.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex"><span class=3D"gmail-">On 04/26/2018 09:24 PM, Michae=
l Clark wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Fri, Apr 27, 2018 at 12:26 PM, Richard Henderson<br>
</span>&gt; &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.hen=
derson@linaro.org</a> &lt;mailto:<a href=3D"mailto:richard.henderson@linaro=
.org">richard.henderson@<wbr>linaro.org</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Cc: Michael Clark &lt;<a href=3D"mailto:mjc@sifive.=
com">mjc@sifive.com</a> &lt;mailto:<a href=3D"mailto:mjc@sifive.com">mjc@si=
five.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Cc: Palmer Dabbelt &lt;<a href=3D"mailto:palmer@sif=
ive.com">palmer@sifive.com</a> &lt;mailto:<a href=3D"mailto:palmer@sifive.c=
om">palmer@sifive.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Cc: Sagar Karandikar &lt;<a href=3D"mailto:sagark@e=
ecs.berkeley.edu">sagark@eecs.berkeley.edu</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:sagark@eecs.berkeley.e=
du">sagark@eecs.berkeley.<wbr>edu</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Cc: Bastian Koppelmann &lt;<a href=3D"mailto:kbasti=
an@mail.uni-paderborn.de">kbastian@mail.uni-paderborn.<wbr>de</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:kbastian@mail.uni-pade=
rborn.de">kbastian@mail.uni-<wbr>paderborn.de</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Richard Henderson &lt;<a href=3D"mai=
lto:richard.henderson@linaro.org">richard.henderson@linaro.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:richard.henderson@lina=
ro.org">richard.henderson@<wbr>linaro.org</a>&gt;&gt;<br>
&gt; <br>
&gt; <br>
&gt; Reviewed-by: Michael Clark &lt;<a href=3D"mailto:mjc@sifive.com">mjc@s=
ifive.com</a> &lt;mailto:<a href=3D"mailto:mjc@sifive.com">mjc@sifive.com</=
a>&gt;&gt;<br>
<span class=3D"gmail-">&gt; <br>
&gt; If you give me a remote I can pull into my local workspace and test. T=
he change<br>
&gt; looks pretty straight-forward. There are tests for amos in riscv-tests=
 but no<br>
&gt; parallel tests (i.e. contended case).<br>
<br>
</span>git://<a href=3D"http://github.com/rth7680/qemu.git" rel=3D"noreferr=
er" target=3D"_blank">github.com/rth7680/qemu.<wbr>git</a> tgt-arm-atomic-2=
</blockquote><div><br></div><div>I just did a fetch and only saw=C2=A0tgt-a=
rm-atomic. Maybe you haven&#39;t pushed tgt-arm-atomic-2.</div><div><br></d=
iv><div>In any case the=C2=A0<span style=3D"color:rgb(34,34,34);font-family=
:arial,sans-serif;font-size:small;font-style:normal;font-variant-ligatures:=
normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-=
align:start;text-indent:0px;text-transform:none;white-space:normal;word-spa=
cing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;te=
xt-decoration-color:initial;float:none;display:inline">tgt-arm-atomic branc=
h passes riscv-tests.</span></div></div><br></div><div class=3D"gmail_extra=
">Michael.</div></div>

--000000000000e1c729056b04be3a--
