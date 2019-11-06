Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp958692wri;
        Wed, 6 Nov 2019 08:09:29 -0800 (PST)
X-Google-Smtp-Source: APXvYqzQUCawdHbXmsYoe7kWGkpKun63dZyFsPMKgPeTQuPaBCLbj0dOrVx+Wv+XyAjGH8WiAxGY
X-Received: by 2002:ad4:42a8:: with SMTP id e8mr2039300qvr.217.1573056569795;
        Wed, 06 Nov 2019 08:09:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573056569; cv=none;
        d=google.com; s=arc-20160816;
        b=WPLnOxaBB9NFo3MWMB+bhYfLMN1P0WkKK+aMn6nuGuuSj0Tmn7koCk+tWN0it0ZkD+
         3B4bxovQ5vftErBtiVgXMVR1jHKWCldJyU29w3VcABeGaTqpHutnqs2WURZc6LcNelLH
         +oItBBONbt4d61vo9D04BahVhJjFK0u+HdjqxX7ymtpkBuCkpsO0oQnajqmy8IcYwSEZ
         3D5930OkZDLM0jupT3C6U6Jcx35z5IEJzfrqjlTiS3G3Ixk3Nbhv4orweJFz42J+mkrq
         aCieLlnAnh/i5PwXDbFm6p6yWUu7aTY9qlfCZIwdj7/BWiXXdc3/XZGwHPn1Dzr6QtIe
         pdeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Mb+cIu2m5Eg5v8F4DA9m2SMLw5jC+DsYUJoRSpkwWIw=;
        b=iesJXuh461Kd6ohPweup2wyiCgfHWOPu8Jpj/cJmfmOdQOFtQEA+MmxoV2eAQFKcIt
         +0bJCFddl0Jtk2hYO4lwFBqvumaG2f3t+9UYPPzOgzAcmuFXUzbSMHLNdWqJ/qU+VpX2
         2FcF+DEN98vz4AQ0/mLXyCe9a7YYnQuKRLbkMx18IV30Eg4n8pKAP15znAMTGgdBiCmq
         w3nlBHWVA3gQgyhzwPaLJ+GPvi7pSwE8LGb/BAROyf8f0BgaPEuPG9TcYoZYZjP9elGs
         h1qA95XwfZG7x1q6p8LgiQJAQiC4RP8i+9d9hfn+OYRZ6sl5rq9GbSY1cWLOyrpCBk8i
         B4SQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=h9o5rF4V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u36si16933522qtu.317.2019.11.06.08.09.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Nov 2019 08:09:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=h9o5rF4V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iSNs8-0006Co-I4
	for alex.bennee@linaro.org; Wed, 06 Nov 2019 11:09:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51218)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <estebanbosse@gmail.com>) id 1iSNdX-0007kt-1b
 for qemu-arm@nongnu.org; Wed, 06 Nov 2019 10:54:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <estebanbosse@gmail.com>) id 1iSNdV-00084s-Mr
 for qemu-arm@nongnu.org; Wed, 06 Nov 2019 10:54:22 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:45592)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <estebanbosse@gmail.com>)
 id 1iSNdV-00084B-Fm
 for qemu-arm@nongnu.org; Wed, 06 Nov 2019 10:54:21 -0500
Received: by mail-ed1-x52d.google.com with SMTP id b5so8915586eds.12
 for <qemu-arm@nongnu.org>; Wed, 06 Nov 2019 07:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=Mb+cIu2m5Eg5v8F4DA9m2SMLw5jC+DsYUJoRSpkwWIw=;
 b=h9o5rF4VItRnwHIr9UpDnQP9+XJWj2hxVvOjUQS+tvHZOwkL2fRHCAG2/CGuz2VhIh
 YPiJ1komJlVLqlH35mYlvarAg3XGg1ALHuCbAXcSBq+Tjvf/uztpCXaoz53vrIRhZIQg
 OxOF4d3oEm96SiTQ8Jyn+Ig/4uHBehhCT/NWwD3IMUCvoIVkGLgg6vQN+fMMa37/xLkj
 V5R9tXP3cbtbZE+lWFYg65g52HIJ/Ut9MyiS3OuZq1++tRhpqejRiS1MVLkQaF76vUHu
 W/TG1kQLf7cFct8pKBiIGEAG2z7OjpdSJhk8LP1nWF+8SAMFoutNXYr7QJqzEPx8vvN5
 m7Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=Mb+cIu2m5Eg5v8F4DA9m2SMLw5jC+DsYUJoRSpkwWIw=;
 b=JwoPNYGtabeh2undrkgOXg5BujP9zc85l96x9GOg6R5RgmCdIjMJdk7140A8VX4elW
 zDS+r7F6975KMqTWAsT7/TOWnVH2S8VCTMneIJDKS8c9jt2CjQXMVQRuuUvCD4VU22/t
 AhEba4HsTC3gQF4nIUAmCkeWDMVq9SHHJtp+Kfd+DLCnJtFx6+BKeYJ296ppMiqPsaq3
 cc4ZXOyldBis14QBlkQFNfGn7Ci1dwlllCEr8AJaTdCRRkS0qZqp+g68I7VI/GFJ+z7q
 yaDJXIKBhw/rKqYHAlfl4NnzCu6fF/f6xrS+U44T9RdrDCruGkrSbImKRCvOOsAJwhee
 UKLg==
X-Gm-Message-State: APjAAAWn9o+JrThLo+3e4hI+fBrWb4gcHDGXZLY+imwrsvqbUTELsvpy
 WqwdR0ekzPlxd8dJTKWKQnZHUE1VfxXtVLmxU7oauA==
X-Received: by 2002:aa7:c3d0:: with SMTP id l16mr3510097edr.18.1573055660010; 
 Wed, 06 Nov 2019 07:54:20 -0800 (PST)
MIME-Version: 1.0
References: <CAGbAg_CAh-U-xRh+d6wNLQVWoHXEA0xcW6021Qd4WsMJBGfgOg@mail.gmail.com>
In-Reply-To: <CAGbAg_CAh-U-xRh+d6wNLQVWoHXEA0xcW6021Qd4WsMJBGfgOg@mail.gmail.com>
From: Esteban Bosse <estebanbosse@gmail.com>
Date: Wed, 6 Nov 2019 16:54:09 +0100
Message-ID: <CAGbAg_AUwSs2Wd_Xbwd1-8PdzPAyEfYj8b1EbzowC3iav9JaFw@mail.gmail.com>
Subject: Fwd: BeagleBone support, omap1, omap2, omap3, etc.
To: qemu-arm <qemu-arm@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000d3b20f0596af8f6b"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::52d
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7smXmNdxh71r

--000000000000d3b20f0596af8f6b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

---------- Forwarded message ---------
De: Esteban Bosse <estebanbosse@gmail.com>
Date: mi=C3=A9., 6 nov. 2019 a las 16:04
Subject: BeagleBone support, omap1, omap2, omap3, etc.
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>, Peter Maydell <
peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>


Hello!

Some months ago I started to work trying to port the Beaglebone support
from the old qemu-linaro fork to the new QEMU mainstream.

During my work I found that the Beaglebone have an OMAP3 mpu this mpu has
very strong relation with the OMAP2 and OMAP1 in qemu, they implement a lot
of functions in common.

Then I understood that the omap1 and omap2 don't implement things like QOM
and needs a lot of work to upgrade it, at the same time they are some
boards like: omap1_sx, palm, nseries that implement this mpus.

Looking the datasheet of the omap1 I realized that it's an very old device
and some questions like "make sense work with this old device?" comes to my
mind.

When I went to the KVM Forum the last week I talked with some of you, and
you help my with different ideas and proposal to make this task, but I
can't see the right way to make this work because it is a lot of work.

My motivation is learn more about embedded devices, architecture, kernel,
etc. and of course contribute to the community.

I would love to hear your opinions about this 3 related devices with they
respected boards.

Maybe someone is interested to work with me.
I dream to make this work beautiful (like the musca board with the armsse
and armv7m modules) with a good variety of tests. And in the same time I
would like to write some documentation about the process with the final
idea to "make an easier way for new contributors".

If someone want to work with me in this task, should know that I don't have
to much experience and I'm doing this job in my free time (this means that
I work only in my free time).

I appreciate any kind of comment or advice.

Thanks for your time ;)
EstebanB

--000000000000d3b20f0596af8f6b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">---------- Forwarded message ---------<br>De: <strong class=
=3D"gmail_sendername" dir=3D"auto">Esteban Bosse</strong> <span dir=3D"auto=
">&lt;<a href=3D"mailto:estebanbosse@gmail.com">estebanbosse@gmail.com</a>&=
gt;</span><br>Date: mi=C3=A9., 6 nov. 2019 a las 16:04<br>Subject: BeagleBo=
ne support, omap1, omap2, omap3, etc.<br>To: QEMU Developers &lt;<a href=3D=
"mailto:qemu-devel@nongnu.org">qemu-devel@nongnu.org</a>&gt;<br>Cc: Philipp=
e Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.com">philmd@redhat=
.com</a>&gt;, Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org"=
>peter.maydell@linaro.org</a>&gt;, Paolo Bonzini &lt;<a href=3D"mailto:pbon=
zini@redhat.com">pbonzini@redhat.com</a>&gt;<br></div><br><br><div dir=3D"l=
tr">Hello!<br><br>Some months ago I started to work trying to port the Beag=
lebone support from the old qemu-linaro fork to the new QEMU mainstream.<br=
><br>During my work I found that the Beaglebone have an OMAP3 mpu this mpu =
has very strong relation with the OMAP2 and OMAP1 in qemu, they implement a=
 lot of functions in common.<br><br>Then I understood that the omap1 and om=
ap2 don&#39;t implement things like QOM and needs a lot of work to upgrade =
it, at the same time they are some boards like: omap1_sx, palm, nseries tha=
t implement this mpus.<br><br>Looking the datasheet of the omap1 I realized=
 that it&#39;s an very old device and some questions like &quot;make sense =
work with this old device?&quot; comes to my mind.<br><br>When I went to th=
e KVM Forum the last week I talked with some of you, and you help my with d=
ifferent ideas and proposal to make this task, but I can&#39;t see the righ=
t way to make this work because it is a lot of work.<br><br>My motivation i=
s learn more about embedded devices, architecture, kernel, etc. and of cour=
se contribute to the community.=C2=A0<br><br>I would love to hear your opin=
ions about this 3 related devices with they respected boards.<br><br>Maybe =
someone is interested to work with me. <br>I=C2=A0dream to make this work b=
eautiful (like the musca board with the armsse and armv7m modules) with a g=
ood variety of tests. And in the same time I would like to write some docum=
entation about the process with the final idea to &quot;make an easier way =
for new contributors&quot;.<br><br>If someone want to work with me in this =
task, should know that I don&#39;t have to much experience and I&#39;m doin=
g this job in my free time (this means that I work only in my free time).<b=
r><br>I appreciate any kind of comment or advice.<div><br>Thanks for your t=
ime ;)<br><div>EstebanB</div></div></div>
</div></div>

--000000000000d3b20f0596af8f6b--
