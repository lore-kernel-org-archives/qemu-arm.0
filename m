Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp472681wrs;
        Fri, 16 Aug 2019 00:29:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz2X4ZXE6fh/J3sh+n1dv19SJDlVeXJZKSKrq20IT2f2qvvv+iBpa/WqAAXMrdk99kFFTIE
X-Received: by 2002:ac8:19c4:: with SMTP id s4mr7374065qtk.301.1565940563373;
        Fri, 16 Aug 2019 00:29:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565940563; cv=none;
        d=google.com; s=arc-20160816;
        b=ykhvXwE2zrgwzKEagEcZq3WsAtqN4rGeume4KdS4D/lZI9q9DzwsMNOlg5Of6m0Wzb
         Pn1vieqi7rCKfeXW/hcmOnIQAehVVO0PpACt/jyUJfNiz0kyT77zG6WYnQnLVgfpZlN1
         p9Dn2qr16i0h3iiy4F0MAa0xnyAr0ByFwA0LvRIwyhbUHfDOu5175YoeFXJQBY8MD8Yz
         4cj6HTpOf3pPi2n2JBU5UjSnnq4Yuz9MsK2SL/T8YXN7ZkF1xhSXwlusliDo406OqqdL
         302O1dUtNRSPtvuIcPbbI4AGxtqQpkSYN386lJv817dhVOqSYjSCUM5Z9EWx1tErg5zg
         PzMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:to:from;
        bh=GAu+Pglvw2y2iuDna1mPKOExIK6tWZMFsAEF4j7G6QU=;
        b=GvAxehNYky2BUiXzVlvn3Jj0F9AyfnwG2hwr1eDW+FokzpU9Yjb3ZOZJh4adzj18SA
         BLpKv078gQ3a6HK9M4nB7mL7su+/lj5sDKn9Vw0J5JhFo+DM1VYOXbHMgJYy2DQtTUIi
         RR6gGTHVU4Hzo1EhDR3ONhuhRPycJYH8L2GdppR+KHKek6/f7OzbHAUD7OYBKBnfLxfh
         RZtRoqF/OGIeWl44yW7TiQQQcBNIUVscznLz8+UjJojn2LKJjaGAdy5CojgHJ/IejsHn
         Yt9ca2f5RpGYqWnIxQkRDzKWw0OTdqQIHjMsbXlJFu0Arwpr4IpEXRlpKzxlFx2G8tWz
         sm9A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v81si2922196qka.27.2019.08.16.00.29.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Aug 2019 00:29:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Received: from localhost ([::1]:50124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hyWfq-0002PG-3g
	for alex.bennee@linaro.org; Fri, 16 Aug 2019 03:29:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37442)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tony.nguyen@bt.com>) id 1hyWfO-0001yS-2g
 for qemu-arm@nongnu.org; Fri, 16 Aug 2019 03:28:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hyWfK-0006wr-Sf
 for qemu-arm@nongnu.org; Fri, 16 Aug 2019 03:28:53 -0400
Received: from smtpe1.intersmtp.com ([213.121.35.75]:51510)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hyWf1-0006q1-4J; Fri, 16 Aug 2019 03:28:31 -0400
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 BWP09926080.bt.com (10.36.82.111) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Fri, 16
 Aug 2019 08:28:03 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18e.domain1.systemhost.net (10.9.212.18) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Fri, 16 Aug 2019 08:28:29 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Fri, 16 Aug
 2019 08:28:29 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v7 06/42] hw/intc/armv7m_nic: Access
 MemoryRegion with MemOp
Thread-Index: AQHVVAQz1Hp3QYGkDE2cota8L+Pz4g==
Date: Fri, 16 Aug 2019 07:28:29 +0000
Message-ID: <1565940508263.42701@bt.com>
References: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.40]
Content-Type: multipart/alternative; boundary="_000_156594050826342701btcom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 213.121.35.75
Subject: [Qemu-arm] [Qemu-devel] [PATCH v7 06/42] hw/intc/armv7m_nic: Access
 MemoryRegion with MemOp
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
Cc: frederic.konrad@adacore.com, berto@igalia.com, qemu-block@nongnu.org,
 arikalo@wavecomp.com, pasic@linux.ibm.com, hpoussin@reactos.org,
 anthony.perard@citrix.com, xen-devel@lists.xenproject.org, lersek@redhat.com,
 jasowang@redhat.com, jiri@resnulli.us, ehabkost@redhat.com,
 b.galvani@gmail.com, eric.auger@redhat.com, alex.williamson@redhat.com,
 stefanha@redhat.com, jsnow@redhat.com, rth@twiddle.net, kwolf@redhat.com,
 andrew@aj.id.au, claudio.fontana@suse.com, crwulff@gmail.com,
 laurent@vivier.eu, sundeep.lkml@gmail.com, michael@walle.cc,
 qemu-ppc@nongnu.org, kbastian@mail.uni-paderborn.de, imammedo@redhat.com,
 fam@euphon.net, peter.maydell@linaro.org, david@redhat.com, palmer@sifive.com,
 balaton@eik.bme.hu, keith.busch@intel.com, jcmvbkbc@gmail.com, hare@suse.com,
 sstabellini@kernel.org, andrew.smirnov@gmail.com, deller@gmx.de,
 magnus.damm@gmail.com, marcel.apfelbaum@gmail.com, atar4qemu@gmail.com,
 minyard@acm.org, sw@weilnetz.de, yuval.shaia@oracle.com, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, jan.kiszka@web.de, clg@kaod.org, shorne@gmail.com,
 qemu-riscv@nongnu.org, i.mitsyanko@gmail.com, cohuck@redhat.com,
 philmd@redhat.com, amarkovic@wavecomp.com, peter.chubb@nicta.com.au,
 aurelien@aurel32.net, pburton@wavecomp.com, sagark@eecs.berkeley.edu,
 green@moxielogic.com, kraxel@redhat.com, gxt@mprc.pku.edu.cn, robh@kernel.org,
 borntraeger@de.ibm.com, joel@jms.id.au, antonynpavlov@gmail.com,
 chouteau@adacore.com, balrogg@gmail.com, Andrew.Baumann@microsoft.com,
 mreitz@redhat.com, walling@linux.ibm.com, dmitry.fleytman@gmail.com,
 mst@redhat.com, mark.cave-ayland@ilande.co.uk, jslaby@suse.cz, marex@denx.de,
 proljc@gmail.com, marcandre.lureau@redhat.com, alistair@alistair23.me,
 paul.durrant@citrix.com, david@gibson.dropbear.id.au,
 xiaoguangrong.eric@gmail.com, huth@tuxfamily.org, jcd@tribudubois.net,
 pbonzini@redhat.com, stefanb@linux.ibm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Bzf4igofkwML

--_000_156594050826342701btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The memory_region_dispatch_{read|write} operand "unsigned size" is
being converted into a "MemOp op".

Convert interfaces by using no-op size_memop.

After all interfaces are converted, size_memop will be implemented
and the memory_region_dispatch_{read|write} operand "unsigned size"
will be converted into a "MemOp op".

As size_memop is a no-op, this patch does not change any behaviour.

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/intc/armv7m_nvic.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 9f8f0d3..237ccef 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -18,6 +18,7 @@
 #include "hw/intc/armv7m_nvic.h"
 #include "target/arm/cpu.h"
 #include "exec/exec-all.h"
+#include "exec/memop.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "trace.h"
@@ -2345,7 +2346,8 @@ static MemTxResult nvic_sysreg_ns_write(void *opaque,=
 hwaddr addr,
     if (attrs.secure) {
         /* S accesses to the alias act like NS accesses to the real region=
 */
         attrs.secure =3D 0;
-        return memory_region_dispatch_write(mr, addr, value, size, attrs);
+        return memory_region_dispatch_write(mr, addr, value, size_memop(si=
ze),
+                                            attrs);
     } else {
         /* NS attrs are RAZ/WI for privileged, and BusFault for user */
         if (attrs.user) {
@@ -2364,7 +2366,8 @@ static MemTxResult nvic_sysreg_ns_read(void *opaque, =
hwaddr addr,
     if (attrs.secure) {
         /* S accesses to the alias act like NS accesses to the real region=
 */
         attrs.secure =3D 0;
-        return memory_region_dispatch_read(mr, addr, data, size, attrs);
+        return memory_region_dispatch_read(mr, addr, data, size_memop(size=
),
+                                           attrs);
     } else {
         /* NS attrs are RAZ/WI for privileged, and BusFault for user */
         if (attrs.user) {
@@ -2390,7 +2393,8 @@ static MemTxResult nvic_systick_write(void *opaque, h=
waddr addr,

     /* Direct the access to the correct systick */
     mr =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->systick[attrs.secure]=
), 0);
-    return memory_region_dispatch_write(mr, addr, value, size, attrs);
+    return memory_region_dispatch_write(mr, addr, value, size_memop(size),
+                                        attrs);
 }

 static MemTxResult nvic_systick_read(void *opaque, hwaddr addr,
@@ -2402,7 +2406,7 @@ static MemTxResult nvic_systick_read(void *opaque, hw=
addr addr,

     /* Direct the access to the correct systick */
     mr =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->systick[attrs.secure]=
), 0);
-    return memory_region_dispatch_read(mr, addr, data, size, attrs);
+    return memory_region_dispatch_read(mr, addr, data, size_memop(size), a=
ttrs);
 }

 static const MemoryRegionOps nvic_systick_ops =3D {
--
1.8.3.1

?


--_000_156594050826342701btcom_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none"><!-- P { margin-top: 0px; m=
argin-bottom: 0px; } .EmailQuote { margin-left: 1pt; padding-left: 4pt; bor=
der-left-width: 2px; border-left-style: solid; border-left-color: rgb(128, =
0, 0); }--></style>
</head>
<body dir=3D"ltr" style=3D"font-size:12pt;color:#000000;background-color:#F=
FFFFF;font-family:Calibri,Arial,Helvetica,sans-serif;">
<p></p>
<div><span style=3D"font-size: 12pt;">The memory_region_dispatch_{read|writ=
e} operand &quot;unsigned size&quot; is</span><br>
</div>
<div>being converted into a &quot;MemOp op&quot;.</div>
<div><br>
</div>
<div>Convert interfaces by using no-op size_memop.</div>
<div><br>
</div>
<div>After all interfaces are converted, size_memop will be implemented</di=
v>
<div>and the memory_region_dispatch_{read|write} operand &quot;unsigned siz=
e&quot;</div>
<div>will be converted into a &quot;MemOp op&quot;.</div>
<div><br>
</div>
<div>As size_memop is a no-op, this patch does not change any behaviour.</d=
iv>
<div><br>
</div>
<div>Signed-off-by: Tony Nguyen &lt;tony.nguyen@bt.com&gt;</div>
<div>Reviewed-by: Philippe Mathieu-Daud=E9 &lt;philmd@redhat.com&gt;</div>
<div>Reviewed-by: Richard Henderson &lt;richard.henderson@linaro.org&gt;</d=
iv>
<div>---</div>
<div>&nbsp;hw/intc/armv7m_nvic.c | 12 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#=
43;----</div>
<div>&nbsp;1 file changed, 8 insertions(&#43;), 4 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c</div>
<div>index 9f8f0d3..237ccef 100644</div>
<div>--- a/hw/intc/armv7m_nvic.c</div>
<div>&#43;&#43;&#43; b/hw/intc/armv7m_nvic.c</div>
<div>@@ -18,6 &#43;18,7 @@</div>
<div>&nbsp;#include &quot;hw/intc/armv7m_nvic.h&quot;</div>
<div>&nbsp;#include &quot;target/arm/cpu.h&quot;</div>
<div>&nbsp;#include &quot;exec/exec-all.h&quot;</div>
<div>&#43;#include &quot;exec/memop.h&quot;</div>
<div>&nbsp;#include &quot;qemu/log.h&quot;</div>
<div>&nbsp;#include &quot;qemu/module.h&quot;</div>
<div>&nbsp;#include &quot;trace.h&quot;</div>
<div>@@ -2345,7 &#43;2346,8 @@ static MemTxResult nvic_sysreg_ns_write(void=
 *opaque, hwaddr addr,</div>
<div>&nbsp; &nbsp; &nbsp;if (attrs.secure) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* S accesses to the alias act like =
NS accesses to the real region */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;attrs.secure =3D 0;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;return memory_region_dispatch_write(mr, a=
ddr, value, size, attrs);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;return memory_region_dispatch_write(m=
r, addr, value, size_memop(size),</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;attrs);</div>
<div>&nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* NS attrs are RAZ/WI for privilege=
d, and BusFault for user */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (attrs.user) {</div>
<div>@@ -2364,7 &#43;2366,8 @@ static MemTxResult nvic_sysreg_ns_read(void =
*opaque, hwaddr addr,</div>
<div>&nbsp; &nbsp; &nbsp;if (attrs.secure) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* S accesses to the alias act like =
NS accesses to the real region */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;attrs.secure =3D 0;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;return memory_region_dispatch_read(mr, ad=
dr, data, size, attrs);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;return memory_region_dispatch_read(mr=
, addr, data, size_memop(size),</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; attrs);</div>
<div>&nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* NS attrs are RAZ/WI for privilege=
d, and BusFault for user */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (attrs.user) {</div>
<div>@@ -2390,7 &#43;2393,8 @@ static MemTxResult nvic_systick_write(void *=
opaque, hwaddr addr,</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;/* Direct the access to the correct systick */</di=
v>
<div>&nbsp; &nbsp; &nbsp;mr =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(&amp;=
s-&gt;systick[attrs.secure]), 0);</div>
<div>- &nbsp; &nbsp;return memory_region_dispatch_write(mr, addr, value, si=
ze, attrs);</div>
<div>&#43; &nbsp; &nbsp;return memory_region_dispatch_write(mr, addr, value=
, size_memop(size),</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
attrs);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;static MemTxResult nvic_systick_read(void *opaque, hwaddr addr,<=
/div>
<div>@@ -2402,7 &#43;2406,7 @@ static MemTxResult nvic_systick_read(void *o=
paque, hwaddr addr,</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;/* Direct the access to the correct systick */</di=
v>
<div>&nbsp; &nbsp; &nbsp;mr =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(&amp;=
s-&gt;systick[attrs.secure]), 0);</div>
<div>- &nbsp; &nbsp;return memory_region_dispatch_read(mr, addr, data, size=
, attrs);</div>
<div>&#43; &nbsp; &nbsp;return memory_region_dispatch_read(mr, addr, data, =
size_memop(size), attrs);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;static const MemoryRegionOps nvic_systick_ops =3D {</div>
<div>--&nbsp;</div>
<div>1.8.3.1</div>
<div><br>
&#8203;<br>
</div>
<p><br>
</p>
</body>
</html>

--_000_156594050826342701btcom_--
