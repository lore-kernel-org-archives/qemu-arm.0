Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1354467wru;
        Wed, 8 Aug 2018 19:06:32 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPxi0PsV6iZIrMD/G9PR10u1hs0mcG03vwZKmtCzf9tn9U1QB1OGT1w1bTR0pK1Ftr2T8V81
X-Received: by 2002:ac8:1a90:: with SMTP id x16-v6mr187202qtj.160.1533780392311;
        Wed, 08 Aug 2018 19:06:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533780392; cv=none;
        d=google.com; s=arc-20160816;
        b=dbEKhU8C8rMjlG9YlToRHzWUsSYp61iPmgO8dAK+msTQUmGo0wG2YnDziSIOuP5Xrk
         FxwzWGGlEtelmQyS3Y/40e+oHEw4nrRngmsrm9dH0BiyqVb2fzVgPLvIrqehO+wWiUk1
         HikXF+qj2K3HidyK7gb1t2ihqA9pD5vnuNk7QrwTTPwM3ruL5YNTqaSoTlx4JNIYIASo
         XheOV1+p1io+cIowG2OTRu6L3xkzadEQpvKhO0n4eNXNQz2WKibMllAGWYVZT8VJhip/
         xQbXpqwjofE/IPN1bcabeGtfGh8TzR+IbmEkHklraldh0Z9naCwck6dPRnFK6dOD+TA3
         i/XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature
         :arc-authentication-results;
        bh=SJRA/5ErV01BPJG41MBGpUcBMKuRQgBT5ke4LdqbRgQ=;
        b=DBjiu5fstOPxGWMnsvsX9S+jTXUC0Fzoyh7rf06ePwMJT77vImXQ/J46IhMksogoHm
         gMJ+LRwvsabAjRfaIMa+oLMHlZN31dGwY3G4GnlpFHrqlIIs1u1h9miKxvqtQ4E0qbmL
         MhOR7Yk+YJkYQF2c3y7kCuji6WSuQsDLZsBxXOS1jxUBF3ZQ9ghDHxtkAVJl5CVY8LeP
         FEL3zO7xBysJCaK09gXdnrftkfJyl6b/O9PoyUAkHpNpIceDOqKmD2fvyYt+YCOMDZ5t
         d5jVrio0YpKOMo/qx0OSQej4ul5FLKpnl8Y+ES6GfVMxsO5NecGdj8RWSSfHkPHfOpCd
         q2+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=CAlJEkfV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g26-v6si5728701qtf.118.2018.08.08.19.06.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 08 Aug 2018 19:06:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=CAlJEkfV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:46200 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fnaLP-0007X4-RH
	for alex.bennee@linaro.org; Wed, 08 Aug 2018 22:06:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46182)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sayandeep.iitkgp@gmail.com>) id 1fnaLJ-0007Wx-30
	for qemu-arm@nongnu.org; Wed, 08 Aug 2018 22:06:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sayandeep.iitkgp@gmail.com>) id 1fnaLI-0006h2-2t
	for qemu-arm@nongnu.org; Wed, 08 Aug 2018 22:06:25 -0400
Received: from mail-oi0-x22e.google.com ([2607:f8b0:4003:c06::22e]:41564)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sayandeep.iitkgp@gmail.com>)
	id 1fnaLH-0006gg-Qh
	for qemu-arm@nongnu.org; Wed, 08 Aug 2018 22:06:23 -0400
Received: by mail-oi0-x22e.google.com with SMTP id k12-v6so7211820oiw.8
	for <qemu-arm@nongnu.org>; Wed, 08 Aug 2018 19:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=SJRA/5ErV01BPJG41MBGpUcBMKuRQgBT5ke4LdqbRgQ=;
	b=CAlJEkfVJqk9TORrREwJdYumJcAKEHeGIKrz3fHeIwRss0ROOPmJtb+wSxlTlV1EhA
	58nY6BRuZNqBJ3zrL5b2Gw/6sOO6vWJ3w0IU59/YkNew6abohOkqXe+aLD9aGBhK8rse
	LvB/eHvCoERsrUf8YVH62VSAGNkzoB6aD61qimMLxl5c0g30nndHvxONClo3cSoN2qaX
	S2nEC+rv2Hjfgnj+mxXZAXZiBCnrMaT9IB/4IXXzXRJaF65R+Ig5JOPb9qjGtYjiteGj
	eimZTIi2OwOyEQp7PwAjYb50zIxzvinfaU3CE4thXGinFAsq3j7P3z5O5WzUKdiQ19Ju
	wwtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=SJRA/5ErV01BPJG41MBGpUcBMKuRQgBT5ke4LdqbRgQ=;
	b=LkI3j0cCc8Uk67fUu6VIC9TIMHKgUgg8JKxZ9l/OdJt4/OXBnx4rFRsFXPO25oOtGZ
	wX4DQGTQbKG0wUpJfzzVC0B1Rqnm82B/t05MgBXybhSE4B3GhlO+hltot5d6xu5+px8y
	CnU6hUeNIF6WfB6kQ/ZA+3eL8VskeX0/7n+molfuaQz6tJRVzow48pw0pJI+mNLfTh2d
	Ov8S4DIDvtL1cHysM+BdS77QS6AUpKft8vcYHiFrf+8yRVVdhe3UCKcsxjIZkC2baxdX
	tPSlBVSrmjmWUH/87GgHYtAdqk1uQNbJ4ACxFJjkYcUEdR4fG4qjTTbNF4faWGdyaB2E
	FieA==
X-Gm-Message-State: AOUpUlGeoexFrkzJmHX+H9zdvNnY75hmqDLl4ATa14rLdTYdbcWBFwCw
	gQxBM6lmSzqFfnpLwRTE3sdzNSeX6+3mbQEwdgU=
X-Received: by 2002:aca:d846:: with SMTP id p67-v6mr218027oig.42.1533780383066;
	Wed, 08 Aug 2018 19:06:23 -0700 (PDT)
MIME-Version: 1.0
References: <CALxeBVBJxfD_UNE=9JZ0qn_VXF1fYU=m0WyFQqwJhCbqN7-k5Q@mail.gmail.com>
	<CAFEAcA-C9AXLqFj9_8QQmnZ=2+KbSWqgpgySsbbYMTJ-u79KAg@mail.gmail.com>
In-Reply-To: <CAFEAcA-C9AXLqFj9_8QQmnZ=2+KbSWqgpgySsbbYMTJ-u79KAg@mail.gmail.com>
From: Sayandeep Saha <sayandeep.iitkgp@gmail.com>
Date: Thu, 9 Aug 2018 07:36:11 +0530
Message-ID: <CALxeBVBBma5ZhFapsQ+bCaJU69F_U-w4L7AHbymBgoh6qu=zHQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000e56dd90572f712bc"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::22e
Subject: Re: [Qemu-arm] Regarding some issues with gdb
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
X-TUID: Gnd+UUVg0Qvw

--000000000000e56dd90572f712bc
Content-Type: text/plain; charset="UTF-8"

I tried this thing by modifying the permission of the ELF. Precisely, I
used the flags -Wl, -N during compilation and also used static linking.
Also, I tried objcopy --writable-text and modified the write permission of
the .text section of the ELF. But that did not worked. Is there any other
thing to try with?

On Thu, Aug 9, 2018, 12:23 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On 8 August 2018 at 17:50, Sayandeep Saha <sayandeep.iitkgp@gmail.com>
> wrote:
> > I successfully made all these changes on my X86-64 Intel machine.
> However,
> > for ARM I tried with QEMU. The test case was a simple C program for
> > calculating factorials using loops. I ran the following commands:
> >
> > Compilation:
> > arm-linux-gnueabi-gcc -g -static -Xlinker -N -mthumb -masm-syntax-unified
> > factorial.c -o factorial
> >
> > Run:
> > qemu-arm -g 1234 -L /usr/arm-linux-gnueabihf/ ./factorial
> >
> > Next, I invoked gdb-multiarch from another shell to debug the program.
> >
> >
> > However, when I try to change some instruction using "set" command of
> GDB,
> > it says "The memory location cannot be accessed".
> > Surprisingly, I can print the already existing contents of those memory
> > locations using gdb's print command. Also, I could modify register values
> > successfully.
> >
> > I am really confused and wander whether it is possible to change memory
> > contents within QEMU, or not. If it is possible, what is the step by step
> > procedure for that.
>
> I don't think that this should vary between guest architectures.
> Is the memory area you are trying to modify actually writable?
> If it is part of the ELF executable you are running, then it
> might depend on what the memory permissions the ELF file sets up
> are (ie if it's read-only). I haven't checked that.
>
> thanks
> -- PMM
>

--000000000000e56dd90572f712bc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I tried this thing by modifying the permission of the ELF=
. Precisely, I used the flags -Wl, -N during compilation and also used stat=
ic linking. Also, I tried objcopy --writable-text and modified the write pe=
rmission of the .text section of the ELF. But that did not worked. Is there=
 any other thing to try with?</div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr">On Thu, Aug 9, 2018, 12:23 AM Peter Maydell &lt;<a href=3D"mailto:=
peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">On 8 August 2018 at 17:50, Sayandeep Saha &l=
t;<a href=3D"mailto:sayandeep.iitkgp@gmail.com" target=3D"_blank" rel=3D"no=
referrer">sayandeep.iitkgp@gmail.com</a>&gt; wrote:<br>
&gt; I successfully made all these changes on my X86-64 Intel machine. Howe=
ver,<br>
&gt; for ARM I tried with QEMU. The test case was a simple C program for<br=
>
&gt; calculating factorials using loops. I ran the following commands:<br>
&gt;<br>
&gt; Compilation:<br>
&gt; arm-linux-gnueabi-gcc -g -static -Xlinker -N -mthumb -masm-syntax-unif=
ied<br>
&gt; factorial.c -o factorial<br>
&gt;<br>
&gt; Run:<br>
&gt; qemu-arm -g 1234 -L /usr/arm-linux-gnueabihf/ ./factorial<br>
&gt;<br>
&gt; Next, I invoked gdb-multiarch from another shell to debug the program.=
<br>
&gt;<br>
&gt;<br>
&gt; However, when I try to change some instruction using &quot;set&quot; c=
ommand of GDB,<br>
&gt; it says &quot;The memory location cannot be accessed&quot;.<br>
&gt; Surprisingly, I can print the already existing contents of those memor=
y<br>
&gt; locations using gdb&#39;s print command. Also, I could modify register=
 values<br>
&gt; successfully.<br>
&gt;<br>
&gt; I am really confused and wander whether it is possible to change memor=
y<br>
&gt; contents within QEMU, or not. If it is possible, what is the step by s=
tep<br>
&gt; procedure for that.<br>
<br>
I don&#39;t think that this should vary between guest architectures.<br>
Is the memory area you are trying to modify actually writable?<br>
If it is part of the ELF executable you are running, then it<br>
might depend on what the memory permissions the ELF file sets up<br>
are (ie if it&#39;s read-only). I haven&#39;t checked that.<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div>

--000000000000e56dd90572f712bc--
