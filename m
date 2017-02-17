Received: by 10.25.77.65 with SMTP id a62csp359113lfb;
        Fri, 17 Feb 2017 13:24:42 -0800 (PST)
X-Received: by 10.55.48.140 with SMTP id w134mr8810959qkw.253.1487366682009;
        Fri, 17 Feb 2017 13:24:42 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k49si8311785qtc.21.2017.02.17.13.24.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 17 Feb 2017 13:24:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56088 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ceq1B-0002dr-Fb
	for alex.bennee@linaro.org; Fri, 17 Feb 2017 16:24:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51315)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mallachiev@ispras.ru>) id 1cen7e-0001f5-SQ
	for qemu-arm@nongnu.org; Fri, 17 Feb 2017 13:19:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mallachiev@ispras.ru>) id 1cen7Z-0003or-FU
	for qemu-arm@nongnu.org; Fri, 17 Feb 2017 13:19:10 -0500
Received: from mail.ispras.ru ([83.149.199.45]:34884)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mallachiev@ispras.ru>)
	id 1cen7U-0003bn-Du; Fri, 17 Feb 2017 13:19:05 -0500
Received: from [10.10.132.59] (pluton2.ispras.ru [83.149.199.44])
	by mail.ispras.ru (Postfix) with ESMTPSA id 8B14A54006C;
	Fri, 17 Feb 2017 21:18:22 +0300 (MSK)
From: Kurban Mallachiev <mallachiev@ispras.ru>
To: qemu-devel@nongnu.org
Message-ID: <076b0d94-738e-252c-1ed8-4640a864ac34@ispras.ru>
Date: Fri, 17 Feb 2017 21:18:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.1
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="------------5E405D72970ED2A7C58E65B7"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 83.149.199.45
X-Mailman-Approved-At: Fri, 17 Feb 2017 16:15:32 -0500
Subject: [Qemu-arm] [PATCH] ARM i.MX timers: fix software reset
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
Cc: qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jNu2Pv84Lg+W

This is a multi-part message in MIME format.
--------------5E405D72970ED2A7C58E65B7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello!

i.MX6 RM says that setting software reset bit in CR register of GPT 
(general purpose timers) should resets all of the registers of GPT to 
their default reset values, except for the CLKSRC, EN, ENMOD, STOPEN, 
WAITEN, and DBGEN bits in CR. But current implementation does the 
opposite for CR register (it clears CLKSRC and friends bits and 
preserves the others).

Most importantly this leads to that software reset bit doesn't clears 
automatically.

I have a look at git history and found that software reset bit was being 
cleared before 462566fc5e3 commit.

I have doubts about the correct fixing of this problem. I don't really 
understand the nature of the "/Soft reset doesn't touch some bits; hard 
reset clears them/" comment in /imx_gpt_reset/ function, does it mean 
that /imx_gpt_reset/ performs a hard reset or soft reset? I see two 
possible fixings:

1. If /imx_gpt_reset/ purpose is to do a software reset of device, then 
we should fix this function. My patch at the end of email fixes this 
function.

2. If /imx_gpt_reset/ purpose is to do a hard reset of device? then 
there should be another function to software reset of device. If so I 
can create a new patch.


---

 From e12f689a2f41d18a29714771d83e343ca5195b61 Mon Sep 17 00:00:00 2001

From: Kurban Mallachiev <mallachiev@ispras.ru>

Date: Fri, 17 Feb 2017 20:30:49 +0300

Subject: [PATCH] i.MX timers: fix software reset

Software reset function clears CR bits that should not clear and

preserves bits that should clear.

Signed-off-by: Kurban Mallachiev <mallachiev@ispras.ru>

---

  hw/timer/imx_gpt.c | 4 ++--

  1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/timer/imx_gpt.c b/hw/timer/imx_gpt.c

index 010ccbf207..9777160f49 100644

--- a/hw/timer/imx_gpt.c

+++ b/hw/timer/imx_gpt.c

@@ -306,8 +306,8 @@ static void imx_gpt_reset(DeviceState *dev)

      /*

       * Soft reset doesn't touch some bits; hard reset clears them

       */

-    s->cr &= ~(GPT_CR_EN|GPT_CR_ENMOD|GPT_CR_STOPEN|GPT_CR_DOZEN|

-               GPT_CR_WAITEN|GPT_CR_DBGEN);

+    s->cr &= GPT_CR_EN|GPT_CR_ENMOD|GPT_CR_STOPEN|GPT_CR_DOZEN|

+               GPT_CR_WAITEN|GPT_CR_DBGEN;

      s->sr = 0;

      s->pr = 0;

      s->ir = 0;

-- 

2.11.1




--------------5E405D72970ED2A7C58E65B7
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>

    <meta http-equiv=3D"content-type" content=3D"text/html; charset=3Dutf=
-8">
  </head>
  <body bgcolor=3D"#FFFFFF" text=3D"#000000">
    <p>Hello!</p>
    <p>i.MX6 RM says that setting software reset bit in CR register of
      GPT (general purpose timers) should resets all of the registers of
      GPT to their default reset values, except for the CLKSRC, EN,
      ENMOD, STOPEN, WAITEN, and DBGEN bits in CR. But current
      implementation does the opposite for CR register (it clears CLKSRC
      and friends bits and preserves the others).</p>
    <p>Most importantly this leads to that software reset bit doesn't
      clears automatically.</p>
    <p>I have a look at git history and found that software reset bit
      was being cleared before 462566fc5e3 commit.</p>
    <p>I have doubts about the correct fixing of this problem. I don't
      really understand the nature of the "<i>Soft reset doesn't touch
        some bits; hard reset clears them</i>" comment in <i>imx_gpt_rese=
t</i>
      function, does it mean that <i> imx_gpt_reset</i> performs a hard
      reset or soft reset? I see two possible fixings:<br>
    </p>
    <p>1. If <i>imx_gpt_reset</i> purpose is to do a software reset of
      device, then we should fix this function. My patch at the end of
      email fixes this function.<br>
    </p>
    <p>2. If <i>imx_gpt_reset</i> purpose is to do a hard reset of
      device? then there should be another function to software reset of
      device. If so I can create a new patch.<br>
    </p>
    <p><br>
    </p>
    <p>---<br>
    </p>
    <pre>From e12f689a2f41d18a29714771d83e343ca5195b61 Mon Sep 17 00:00:0=
0 2001</pre>
    <pre>From: Kurban Mallachiev <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:mallachiev@ispras.ru">&lt;mallachiev@ispras.ru&gt;</a></pre>
    <pre>Date: Fri, 17 Feb 2017 20:30:49 +0300</pre>
    <pre>Subject: [PATCH] i.MX timers: fix software reset</pre>
    <pre>
Software reset function clears CR bits that should not clear and</pre>
    <pre>preserves bits that should clear.</pre>
    <pre>
Signed-off-by: Kurban Mallachiev <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:mallachiev@ispras.ru">&lt;mallachiev@ispras.ru&gt;</a></pre>
    <pre>---</pre>
    <pre>=C2=A0hw/timer/imx_gpt.c | 4 ++--</pre>
    <pre>=C2=A01 file changed, 2 insertions(+), 2 deletions(-)</pre>
    <pre>
diff --git a/hw/timer/imx_gpt.c b/hw/timer/imx_gpt.c</pre>
    <pre>index 010ccbf207..9777160f49 100644</pre>
    <pre>--- a/hw/timer/imx_gpt.c</pre>
    <pre>+++ b/hw/timer/imx_gpt.c</pre>
    <pre>@@ -306,8 +306,8 @@ static void imx_gpt_reset(DeviceState *dev)<=
/pre>
    <pre>=C2=A0=C2=A0=C2=A0=C2=A0 /*</pre>
    <pre>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Soft reset doesn't touch some b=
its; hard reset clears them</pre>
    <pre>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */</pre>
    <pre>-=C2=A0=C2=A0=C2=A0 s-&gt;cr &amp;=3D ~(GPT_CR_EN|GPT_CR_ENMOD|G=
PT_CR_STOPEN|GPT_CR_DOZEN|</pre>
    <pre>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 GPT_CR_WAITEN|GPT_CR_DBGEN);</pre>
    <pre>+=C2=A0=C2=A0=C2=A0 s-&gt;cr &amp;=3D GPT_CR_EN|GPT_CR_ENMOD|GPT=
_CR_STOPEN|GPT_CR_DOZEN|</pre>
    <pre>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 GPT_CR_WAITEN|GPT_CR_DBGEN;</pre>
    <pre>=C2=A0=C2=A0=C2=A0=C2=A0 s-&gt;sr =3D 0;</pre>
    <pre>=C2=A0=C2=A0=C2=A0=C2=A0 s-&gt;pr =3D 0;</pre>
    <pre>=C2=A0=C2=A0=C2=A0=C2=A0 s-&gt;ir =3D 0;</pre>
    <pre>-- </pre>
    <pre>2.11.1</pre>
    <p><br>
      <br>
    </p>
  </body>
</html>

--------------5E405D72970ED2A7C58E65B7--
