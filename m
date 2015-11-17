Received: by 10.182.158.201 with SMTP id ww9csp740272obb;
        Tue, 17 Nov 2015 06:01:47 -0800 (PST)
X-Received: by 10.31.8.202 with SMTP id 193mr3572645vki.16.1447768907535;
        Tue, 17 Nov 2015 06:01:47 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h88si2805142vkc.188.2015.11.17.06.01.47
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Tue, 17 Nov 2015 06:01:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@pebble_com.20150623.gappssmtp.com
Received: from localhost ([::1]:58651 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZygpO-00009w-V9
	for alex.bennee@linaro.org; Tue, 17 Nov 2015 09:01:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33637)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <francois@pebble.com>) id 1ZycJv-000783-IQ
	for qemu-arm@nongnu.org; Tue, 17 Nov 2015 04:13:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <francois@pebble.com>) id 1ZycJu-0004Px-0y
	for qemu-arm@nongnu.org; Tue, 17 Nov 2015 04:12:59 -0500
Received: from mail-wm0-x230.google.com ([2a00:1450:400c:c09::230]:34203)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <francois@pebble.com>) id 1ZycJt-0004Pr-Np
	for qemu-arm@nongnu.org; Tue, 17 Nov 2015 04:12:57 -0500
Received: by wmvv187 with SMTP id v187so216487868wmv.1
	for <qemu-arm@nongnu.org>; Tue, 17 Nov 2015 01:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pebble_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to:cc:content-type;
	bh=x48wsHYhlyHcNMutUES+y/VadKD4N+qcnWRPPRl0A7E=;
	b=SRSTNhikl6l4tsaA6iKcEI0DXYSqvdGU5LVNusrDyvadv7sF8wQYZbiBSswiohiu5s
	012ACH/pb8P/GF8Recn4L53KlrGtu+TjHBEgGDccoDwVVJk3hOimJVNGXtx07PG/O8uH
	7+6uiTgqCr7aNa7cH+EATbAeRdnIV34AJNSmrCk4Z8CnyzvF2qvx6hVX2w8YpwaOsLmW
	OGyGiwBHorTxVq4EMX9oLEA4me77j3A6D46pOPjkfP0n/nXuFnaXABg4cai+mEgBHSB3
	GVMedLVSPgi/rvo678dEeJ05ZaMdwmGuGQn7oL/yK+Dd8Vnr3iYDxHra05Wvg6+lFXo0
	lA1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
	:content-type;
	bh=x48wsHYhlyHcNMutUES+y/VadKD4N+qcnWRPPRl0A7E=;
	b=EbRwcI/zzILdoKKi8Slk+zB3DhZ2NswdvLiVes/+C5I6D9b1dyGeXkF+o/b9mOZfGY
	aIZdItIM9nc+TMZZR+mtrrQYY4pnkwq3nRos7Zzp0hPP2ulEQZdD+ruFEHOQ7BDIachV
	9FtMQd26MKfC/hhUSAW3raUukgy0FHkB/4z9RPkiXgFJlZbT9+a02GlxN9nFoxqGbA18
	jfH1vb6p0utJUwm3uIrqj+Eta7ehCHXTSERDKWvQs0Bo/UZca0E5T8P5qGsy+xliTvZC
	AqAurAMhb+zvL8S4L9iy9YzeFsrYQEoztIoVQIUG6Zm02AydQxW8KyFvWzchAftpV3FO
	qysA==
X-Gm-Message-State: ALoCoQlmQ5XqAyJq+wUUBBxGl8OBDRnCoJuaDW2i4d7dKdHpUEAY1JfivpOKr78AmzC0yvAuzxr1
X-Received: by 10.28.88.203 with SMTP id m194mr1285886wmb.68.1447751576703;
	Tue, 17 Nov 2015 01:12:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.169.139 with HTTP; Tue, 17 Nov 2015 01:12:37 -0800 (PST)
From: Francois Baldassari <francois@pebble.com>
Date: Tue, 17 Nov 2015 01:12:37 -0800
Message-ID: <CAHpaMEYsvr7374EO2Pufu3epfFZXDh7iE6ctyXHiSnqJNVa8Cw@mail.gmail.com>
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary=001a114431ac73eca10524b8eed3
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c09::230
X-Mailman-Approved-At: Tue, 17 Nov 2015 09:01:46 -0500
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Subject: [Qemu-arm] [PATCH] hw/arm_gic: Correctly restore nested irq priority
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: v8oxYkGHMtQo

--001a114431ac73eca10524b8eed3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Upon activating an interrupt, set the corresponding priority bit in the
APR/NSAPR registers without touching the currently set bits. In the event
of nested interrupts, the GIC will then have the information it needs to
restore the priority of the pre-empted interrupt once the higher priority
interrupt finishes execution.

Signed-off-by: Fran=C3=A7ois Baldassari <francois@pebble.com>
---
First time submitter here - I tried to follow
http://qemu-project.org/Contribute/SubmitAPatch as best I could but do let
me know if I missed anything.

 hw/intc/arm_gic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index d71aeb8..13e297d 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -254,9 +254,9 @@ static void gic_activate_irq(GICState *s, int cpu, int
irq)
     int bitno =3D preemption_level % 32;

     if (gic_has_groups(s) && GIC_TEST_GROUP(irq, (1 << cpu))) {
-        s->nsapr[regno][cpu] &=3D (1 << bitno);
+        s->nsapr[regno][cpu] |=3D (1 << bitno);
     } else {
-        s->apr[regno][cpu] &=3D (1 << bitno);
+        s->apr[regno][cpu] |=3D (1 << bitno);
     }

     s->running_priority[cpu] =3D prio;
--=20
2.4.0

--001a114431ac73eca10524b8eed3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Upon activating an interrupt, set the correspond=
ing priority bit in the APR/NSAPR registers without touching the currently =
set bits. In the event of nested interrupts, the GIC will then have the inf=
ormation it needs to restore the priority of the pre-empted interrupt once =
the higher priority interrupt finishes execution.<br><br>Signed-off-by: Fra=
n=C3=A7ois Baldassari &lt;<a href=3D"mailto:francois@pebble.com">francois@p=
ebble.com</a>&gt;<br>---<br></div>First time submitter here - I tried to fo=
llow <a href=3D"http://qemu-project.org/Contribute/SubmitAPatch">http://qem=
u-project.org/Contribute/SubmitAPatch</a> as best I could but do let me kno=
w if I missed anything.<br></div><div><div><div><br>=C2=A0hw/intc/arm_gic.c=
 | 4 ++--<br>=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br><br>d=
iff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c<br>index d71aeb8..13e297d=
 100644<br>--- a/hw/intc/arm_gic.c<br>+++ b/hw/intc/arm_gic.c<br>@@ -254,9 =
+254,9 @@ static void gic_activate_irq(GICState *s, int cpu, int irq)<br>=
=C2=A0=C2=A0=C2=A0=C2=A0 int bitno =3D preemption_level % 32;<br>=C2=A0<br>=
=C2=A0=C2=A0=C2=A0=C2=A0 if (gic_has_groups(s) &amp;&amp; GIC_TEST_GROUP(ir=
q, (1 &lt;&lt; cpu))) {<br>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s-&g=
t;nsapr[regno][cpu] &amp;=3D (1 &lt;&lt; bitno);<br>+=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 s-&gt;nsapr[regno][cpu] |=3D (1 &lt;&lt; bitno);<br>=
=C2=A0=C2=A0=C2=A0=C2=A0 } else {<br>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 s-&gt;apr[regno][cpu] &amp;=3D (1 &lt;&lt; bitno);<br>+=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s-&gt;apr[regno][cpu] |=3D (1 &lt;&lt; bitno=
);<br>=C2=A0=C2=A0=C2=A0=C2=A0 }<br>=C2=A0<br>=C2=A0=C2=A0=C2=A0=C2=A0 s-&g=
t;running_priority[cpu] =3D prio;<br>-- <br>2.4.0<br><br><br></div></div></=
div></div>

--001a114431ac73eca10524b8eed3--
