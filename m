Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp914988wrt;
        Thu, 22 Nov 2018 08:48:54 -0800 (PST)
X-Google-Smtp-Source: AJdET5eB49ppsvAx8Ld68u0snfqD90jk6VCI/yWyABuSe4QmEY7U9qF0X9xsCyYsqNcXRARK5tY5
X-Received: by 2002:a81:1153:: with SMTP id 80-v6mr12265392ywr.302.1542905333957;
        Thu, 22 Nov 2018 08:48:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542905333; cv=none;
        d=google.com; s=arc-20160816;
        b=NNWzTKwIzBGzT5gG33JGi8YE4YhYSBU6YhftGfqsR2yKb03rmwqcciQT+HsCQei0mT
         L9ES1GT3uktuhG2INAamjUEYocpPEapw2Nv83QVOWg9/2PYTmfpGitqPtB4G+YLAA3h6
         hJs1FZGxN7YNXfmGlEm2xLroqFGXD9BfPhOViil8b81OzL6wZhIgAZ8jEdLJM2tlfoo+
         yZrvde0WYTkM1C2jJoigWDu/s1M8f32iJomaz4seUhhampyhN//XBwYh/vu3JQAXxLhI
         91CLFIi2YBcnAVeQjS9AalFwVew5/WsiebRPQa5+CFsedIseunOtUi7n3TF2Qi1MiE97
         HvCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=AH+buOi4WR3oPVU16GfxhKaKg2JzZ5GTyVK+1p9mCsg=;
        b=JMEgWAOzhJiLbkpSe4pwmqcsL7WwNU6M2XUDUK95Ttr+u42n7wxYWza4dAjxMYM6Gm
         0A+DKTD8l4cier6Lr8E5MScEVGQoSS6z7ANjy7cequihSmbHoSUdsDc3PdhWcFo/jz+w
         kYlY61ts3KGb72eeopmOKXzbBcyH2Xwp3qQ9xK65RmyIDcMbxgf7ukkrlBorP9mUN8v5
         rHmWGMnyGGWKbZtpv0Q71khojqnf8+1FRyr1bMguIqcJVGY0hLfiSW+e+BEz58lp7ri/
         JMA5ucC1w4oFeUc0XpwfQbUJsN985g1+ZimoarATFvsZFBqcJ+vtCQO8uns8AgOiw7O6
         QO/w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g125si1446729ywh.69.2018.11.22.08.48.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Nov 2018 08:48:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47699 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gPs9t-0007Yu-2h
	for alex.bennee@linaro.org; Thu, 22 Nov 2018 11:48:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35385)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pmathieu@redhat.com>) id 1gPs9e-0007YW-M8
	for qemu-arm@nongnu.org; Thu, 22 Nov 2018 11:48:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pmathieu@redhat.com>) id 1gPs9a-0004YA-QW
	for qemu-arm@nongnu.org; Thu, 22 Nov 2018 11:48:38 -0500
Received: from mail-wm1-f44.google.com ([209.85.128.44]:40598)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pmathieu@redhat.com>) id 1gPs9a-0004Uv-Ib
	for qemu-arm@nongnu.org; Thu, 22 Nov 2018 11:48:34 -0500
Received: by mail-wm1-f44.google.com with SMTP id q26so9693183wmf.5
	for <qemu-arm@nongnu.org>; Thu, 22 Nov 2018 08:48:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=AH+buOi4WR3oPVU16GfxhKaKg2JzZ5GTyVK+1p9mCsg=;
	b=aCjdYQ9gl+f9eDuVc/9ckrURWCcy7UC5yHh/MxgaaEORjAjx2+nJLFz1IMzpRSdKZH
	dsA6+lhREspm3KIRELwUo/UQ6bPVPuy+og027z9Am3lAjByJOPPazWatB/n2QwTTB7XL
	Qjj/7JBABu2P/g0MU8UH+0xeKwMz6wFv67x8wGgYXMpRkNyBCSEAM8aLLO7/DbZJMuBf
	mazsStnpERZVP+0JwIPiY+0MamWAPoJ8Nh69InBBvtsz5+w7S5Rw7MBahfvAJa/ofnw+
	Jp62M8YS0OExfNFS8gAUqiJJnjJx9WPmmP2B9IfQP2gly16IaIlEK3Myo1T/jK4+9QSp
	mJog==
X-Gm-Message-State: AGRZ1gKsjz5lYYtCFzuNfvlWR4zatkKmu1AGUoWJoyCCO6S3aBYg07eA
	PGuHSeQdY7nZ5Znq6N0yBFWYrNCmO/YEskaCxLs8Dw==
X-Received: by 2002:a1c:48d:: with SMTP id 135mr10094180wme.1.1542905311549;
	Thu, 22 Nov 2018 08:48:31 -0800 (PST)
MIME-Version: 1.0
References: <20181122133507.30950-1-peter.maydell@linaro.org>
In-Reply-To: <20181122133507.30950-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Date: Thu, 22 Nov 2018 17:48:20 +0100
Message-ID: <CAP+75-UQhpz3kXvGN3vP69QqyiPg0PpGLAuj+EFXsfzhoAU2CQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000047853057b43a318"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.44
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-4.0 0/2] Rename
 cpu_physical_memory_write_rom() to address_space_write_rom()
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
Cc: patches@linaro.org, Richard Henderson <richard.henderson@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tX41fJmicgNV

--000000000000047853057b43a318
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 22 nov. 2018 14:36, Peter Maydell <peter.maydell@linaro.org> a
=C3=A9crit :

> The API of cpu_physical_memory_write_rom() is odd, because it
> takes an AddressSpace, unlike all the other cpu_physical_memory_*
> access functions. We note this oddity as a TODO in the
> docs/devel/loads-stores.rst documentation.
>
> Rename cpu_physical_memory_write_rom() to address_space_write_rom(),
> and give it an API that matches address_space_write().
> We also adjest the cpu_physical_memory_write_rom_internal()
> function which is local to exec.c similarly.
>
> thanks
> -- PMM
>
> Peter Maydell (2):
>   exec.c: Rename cpu_physical_memory_write_rom_internal()
>   Rename cpu_physical_memory_write_rom() to address_space_write_rom()
>

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

--000000000000047853057b43a318
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div class=3D"gmail_quote"><div dir=3D"ltr">Le jeu. =
22 nov. 2018 14:36, Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linar=
o.org">peter.maydell@linaro.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">The API of cpu_physical_memory_write_rom() is odd,=
 because it<br>
takes an AddressSpace, unlike all the other cpu_physical_memory_*<br>
access functions. We note this oddity as a TODO in the<br>
docs/devel/loads-stores.rst documentation.<br>
<br>
Rename cpu_physical_memory_write_rom() to address_space_write_rom(),<br>
and give it an API that matches address_space_write().<br>
We also adjest the cpu_physical_memory_write_rom_internal()<br>
function which is local to exec.c similarly.<br>
<br>
thanks<br>
-- PMM<br>
<br>
Peter Maydell (2):<br>
=C2=A0 exec.c: Rename cpu_physical_memory_write_rom_internal()<br>
=C2=A0 Rename cpu_physical_memory_write_rom() to address_space_write_rom()<=
br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto"><=
span style=3D"font-family:sans-serif;font-size:13.696px">Reviewed-by: Phili=
ppe Mathieu-Daud=C3=A9 &lt;</span><a href=3D"mailto:philmd@redhat.com" styl=
e=3D"text-decoration:none;color:rgb(66,133,244);font-family:sans-serif;font=
-size:13.696px">philmd@redhat.com</a><span style=3D"font-family:sans-serif;=
font-size:13.696px">&gt;</span></div></div>

--000000000000047853057b43a318--
