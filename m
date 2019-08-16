Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp497558wrs;
        Fri, 16 Aug 2019 01:04:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqztCFtJxkfOP9X4CqD8FoSFKknWButAOkWvk56R0qQ42o/Wggo5PpDDkOPYcBJnZDo8MdIl
X-Received: by 2002:a17:906:cd1a:: with SMTP id oz26mr7981507ejb.141.1565942642563;
        Fri, 16 Aug 2019 01:04:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565942642; cv=none;
        d=google.com; s=arc-20160816;
        b=x4G4zVNVx4tOb21Ghwx2nGTqZOBxUW/d0cgGzlsC7M5DOMIUyMhGA4iaoygEK5xDYe
         mgSMq3YG1RhJdXfdD9Oj0tPvlb4ubAUuAa3/6oCdCk1HucchycwGe4gnKDlLtBKYU2FK
         7JjF1J7rqC2TzM3jbuVsO9Jqhu5jMSKWlbpq0vMU3rIxzQpUVHB9o16ZCfHJyo1GXyCP
         7SJebX0LHvQBa66VCAcw2+xd3fRIP5Dp8e2vMOjotHbWXe+dEFR7QZKjOBJv4yA4Z+5v
         hpJEJhBxmusgfk3AogPhj2Z42Zlmq/PVBepu3Jqh7wVJzFT7vWKw7Ypm0SxujE6XRZ6e
         2E2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:to:from;
        bh=c4h2KBoExzQzHkRuLumz8GrHpRUlTp83ARAdWlXX2Fw=;
        b=08e2nx4CU8qknr8i2fYokFCkS4KEe1tJ1jXXGoegfROYix7C69nnWS0EoOSirVvU1I
         EhiLwIgQBQ5OYPKiYudbnvlj4dB5E1gcA8uE95aLuluUKTWMyiuzpzwWjqB5SB9HS+eJ
         Z097rTnBsId0QJLlMP4JdZcwUq+1AyylmnhXIYuSKhLVn4CO2w9Y/uzxiue7TMZxpxVq
         GqBn0jxzON0qKMpnRpmI+v39oJb90ZmcnX0q2XxY2T/FpOe6Sd5XWrWDo1oGPTEcLCEh
         6AlhhRBTbhUurYnwXaInqH5t3iB9wWgV2ktgs+xh6nv6fsCxt6XTiaigj9irQiuKl2Pj
         ohYA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w40si3107754edd.319.2019.08.16.01.04.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Aug 2019 01:04:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Received: from localhost ([::1]:51210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hyXDN-0002wf-Cr
	for alex.bennee@linaro.org; Fri, 16 Aug 2019 04:04:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40513)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tony.nguyen@bt.com>) id 1hyWnO-0002AM-8K
 for qemu-arm@nongnu.org; Fri, 16 Aug 2019 03:37:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hyWnL-0002oW-9v
 for qemu-arm@nongnu.org; Fri, 16 Aug 2019 03:37:10 -0400
Received: from smtpe1.intersmtp.com ([213.121.35.75]:31104)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hyWn4-0002ip-PD; Fri, 16 Aug 2019 03:36:51 -0400
Received: from tpw09926dag18f.domain1.systemhost.net (10.9.212.26) by
 BWP09926080.bt.com (10.36.82.111) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Fri, 16
 Aug 2019 08:36:23 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18f.domain1.systemhost.net (10.9.212.26) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Fri, 16 Aug 2019 08:36:49 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Fri, 16 Aug
 2019 08:36:49 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v7 32/42] exec: Map device_endian onto MemOp
Thread-Index: AQHVVAVcj7v8OSMGTEisQqFe4KBohg==
Date: Fri, 16 Aug 2019 07:36:48 +0000
Message-ID: <1565941007979.10549@bt.com>
References: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.40]
Content-Type: multipart/alternative; boundary="_000_156594100797910549btcom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 213.121.35.75
Subject: [Qemu-arm] [Qemu-devel] [PATCH v7 32/42] exec: Map device_endian
 onto MemOp
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
X-TUID: hOpmDe1JxHQr

--_000_156594100797910549btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Preparation to replace device_endian with MemOp.

Mapping device_endian onto MemOp limits behaviour changes to this
relatively smaller patch.

The next patch will replace all device_endian usages with the
equivalent MemOp. That patch will be large but have no behaviour
changes.

A subsequent patch will then delete unused device_endian.

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/char/serial.c          | 18 ++++++------------
 include/exec/cpu-common.h | 10 +++++++---
 2 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/hw/char/serial.c b/hw/char/serial.c
index 7c42a2a..521c76b 100644
--- a/hw/char/serial.c
+++ b/hw/char/serial.c
@@ -1012,22 +1012,15 @@ static void serial_mm_write(void *opaque, hwaddr ad=
dr,
     serial_ioport_write(s, addr >> s->it_shift, value, 1);
 }

-static const MemoryRegionOps serial_mm_ops[3] =3D {
-    [DEVICE_NATIVE_ENDIAN] =3D {
-        .read =3D serial_mm_read,
-        .write =3D serial_mm_write,
-        .endianness =3D DEVICE_NATIVE_ENDIAN,
-        .valid.max_access_size =3D 8,
-        .impl.max_access_size =3D 8,
-    },
-    [DEVICE_LITTLE_ENDIAN] =3D {
+static const MemoryRegionOps serial_mm_ops[2] =3D {
+    [0] =3D {
         .read =3D serial_mm_read,
         .write =3D serial_mm_write,
         .endianness =3D DEVICE_LITTLE_ENDIAN,
         .valid.max_access_size =3D 8,
         .impl.max_access_size =3D 8,
     },
-    [DEVICE_BIG_ENDIAN] =3D {
+    [1] =3D {
         .read =3D serial_mm_read,
         .write =3D serial_mm_write,
         .endianness =3D DEVICE_BIG_ENDIAN,
@@ -1053,8 +1046,9 @@ SerialState *serial_mm_init(MemoryRegion *address_spa=
ce,
     serial_realize_core(s, &error_fatal);
     vmstate_register(NULL, base, &vmstate_serial, s);

-    memory_region_init_io(&s->io, NULL, &serial_mm_ops[end], s,
-                          "serial", 8 << it_shift);
+    memory_region_init_io(&s->io, NULL,
+                          &serial_mm_ops[end =3D=3D DEVICE_BIG_ENDIAN],
+                          s, "serial", 8 << it_shift);
     memory_region_add_subregion(address_space, base, &s->io);
     return s;
 }
diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index f7dbe75..c388453 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -16,10 +16,14 @@ void tcg_flush_softmmu_tlb(CPUState *cs);

 #if !defined(CONFIG_USER_ONLY)

+#include "exec/memop.h"
+
 enum device_endian {
-    DEVICE_NATIVE_ENDIAN,
-    DEVICE_BIG_ENDIAN,
-    DEVICE_LITTLE_ENDIAN,
+#ifdef NEED_CPU_H
+    DEVICE_NATIVE_ENDIAN =3D MO_TE,
+#endif
+    DEVICE_BIG_ENDIAN =3D MO_BE,
+    DEVICE_LITTLE_ENDIAN =3D MO_LE,
 };

 #if defined(HOST_WORDS_BIGENDIAN)
--
1.8.3.1

?


--_000_156594100797910549btcom_
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
<div><span style=3D"font-size: 12pt;">Preparation to replace device_endian =
with MemOp.</span><br>
</div>
<div><br>
</div>
<div>Mapping device_endian onto MemOp limits behaviour changes to this</div=
>
<div>relatively smaller patch.</div>
<div><br>
</div>
<div>The next patch will replace all device_endian usages with the</div>
<div>equivalent MemOp. That patch will be large but have no behaviour</div>
<div>changes.</div>
<div><br>
</div>
<div>A subsequent patch will then delete unused device_endian.</div>
<div><br>
</div>
<div>Signed-off-by: Tony Nguyen &lt;tony.nguyen@bt.com&gt;</div>
<div>Reviewed-by: Richard Henderson &lt;richard.henderson@linaro.org&gt;</d=
iv>
<div>---</div>
<div>&nbsp;hw/char/serial.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 18 &#43;&#4=
3;&#43;&#43;&#43;&#43;------------</div>
<div>&nbsp;include/exec/cpu-common.h | 10 &#43;&#43;&#43;&#43;&#43;&#43;&#4=
3;---</div>
<div>&nbsp;2 files changed, 13 insertions(&#43;), 15 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/hw/char/serial.c b/hw/char/serial.c</div>
<div>index 7c42a2a..521c76b 100644</div>
<div>--- a/hw/char/serial.c</div>
<div>&#43;&#43;&#43; b/hw/char/serial.c</div>
<div>@@ -1012,22 &#43;1012,15 @@ static void serial_mm_write(void *opaque, =
hwaddr addr,</div>
<div>&nbsp; &nbsp; &nbsp;serial_ioport_write(s, addr &gt;&gt; s-&gt;it_shif=
t, value, 1);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>-static const MemoryRegionOps serial_mm_ops[3] =3D {</div>
<div>- &nbsp; &nbsp;[DEVICE_NATIVE_ENDIAN] =3D {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;.read =3D serial_mm_read,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;.write =3D serial_mm_write,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</di=
v>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 8,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;.impl.max_access_size =3D 8,</div>
<div>- &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp;[DEVICE_LITTLE_ENDIAN] =3D {</div>
<div>&#43;static const MemoryRegionOps serial_mm_ops[2] =3D {</div>
<div>&#43; &nbsp; &nbsp;[0] =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.read =3D serial_mm_read,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.write =3D serial_mm_write,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN=
,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 8,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.impl.max_access_size =3D 8,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp;[DEVICE_BIG_ENDIAN] =3D {</div>
<div>&#43; &nbsp; &nbsp;[1] =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.read =3D serial_mm_read,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.write =3D serial_mm_write,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</=
div>
<div>@@ -1053,8 &#43;1046,9 @@ SerialState *serial_mm_init(MemoryRegion *ad=
dress_space,</div>
<div>&nbsp; &nbsp; &nbsp;serial_realize_core(s, &amp;error_fatal);</div>
<div>&nbsp; &nbsp; &nbsp;vmstate_register(NULL, base, &amp;vmstate_serial, =
s);</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp;memory_region_init_io(&amp;s-&gt;io, NULL, &amp;serial_=
mm_ops[end], s,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;&quot;serial&quot;, 8 &lt;&lt; it_shift);</div>
<div>&#43; &nbsp; &nbsp;memory_region_init_io(&amp;s-&gt;io, NULL,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;&amp;serial_mm_ops[end =3D=3D DEVICE_BIG_ENDIAN],=
</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;s, &quot;serial&quot;, 8 &lt;&lt; it_shift);</div=
>
<div>&nbsp; &nbsp; &nbsp;memory_region_add_subregion(address_space, base, &=
amp;s-&gt;io);</div>
<div>&nbsp; &nbsp; &nbsp;return s;</div>
<div>&nbsp;}</div>
<div>diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h</di=
v>
<div>index f7dbe75..c388453 100644</div>
<div>--- a/include/exec/cpu-common.h</div>
<div>&#43;&#43;&#43; b/include/exec/cpu-common.h</div>
<div>@@ -16,10 &#43;16,14 @@ void tcg_flush_softmmu_tlb(CPUState *cs);</div=
>
<div>&nbsp;</div>
<div>&nbsp;#if !defined(CONFIG_USER_ONLY)</div>
<div>&nbsp;</div>
<div>&#43;#include &quot;exec/memop.h&quot;</div>
<div>&#43;</div>
<div>&nbsp;enum device_endian {</div>
<div>- &nbsp; &nbsp;DEVICE_NATIVE_ENDIAN,</div>
<div>- &nbsp; &nbsp;DEVICE_BIG_ENDIAN,</div>
<div>- &nbsp; &nbsp;DEVICE_LITTLE_ENDIAN,</div>
<div>&#43;#ifdef NEED_CPU_H</div>
<div>&#43; &nbsp; &nbsp;DEVICE_NATIVE_ENDIAN =3D MO_TE,</div>
<div>&#43;#endif</div>
<div>&#43; &nbsp; &nbsp;DEVICE_BIG_ENDIAN =3D MO_BE,</div>
<div>&#43; &nbsp; &nbsp;DEVICE_LITTLE_ENDIAN =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;#if defined(HOST_WORDS_BIGENDIAN)</div>
<div>--&nbsp;</div>
<div>1.8.3.1</div>
<div><br>
&#8203;<br>
</div>
<p><br>
</p>
</body>
</html>

--_000_156594100797910549btcom_--
