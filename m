Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp480245wrs;
        Fri, 16 Aug 2019 00:39:43 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxmFPmpG7ROHFWY3MRfwEd8wUN2UAbsnAzjAeHci+v4ecjTuOKxHSz45TC5RwbnWI8S8EiH
X-Received: by 2002:a17:906:490d:: with SMTP id b13mr8083347ejq.16.1565941183880;
        Fri, 16 Aug 2019 00:39:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565941183; cv=none;
        d=google.com; s=arc-20160816;
        b=jQ8B3/sj+Hk18iao9ieO5a1G6VsSNlgi4b6EcPT1WPkDEpkfEb8NPuTjXxMjkLb3l0
         dcu9DdSI7La9nEBQ30PxYDjPzcTF8Z73vtgKdhuAuWotip+rtvjbE0FVDuTCrfMJryrK
         zMlFiA0VyWcTTMSquZ5ybWHUYKKiGRJAsqKntMWWLpOkcfC3d8917f+qjP70Ks5Jh6bl
         nUbE8POt/EI3saj6oS2BpWu7RN3xMZ/aLLKs6HgmIuMxjdidzNNtx8o1v+nGdjTMAnl9
         usBRhEIz/ARu5znzNV1zgT+yozmv5XzzHUIV7k/12RdKTfuDWctyJhdhSsDbNIBs7HtL
         EhsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:to:from;
        bh=DJu0ZJcVJfBlPogKAcDF5VTU0ggcLEsR64iqrAB0FSI=;
        b=Kczu4fXxl7dJ+Owtf34WD2p1IHf1JOsE12BfTXNGRBPK7iULI3tEJBXlPvbNdbaRZ3
         XDtLX7bIBvxIP/NVzHP/T7TZyYPY39WYGDKt10+6jBQJgnHgblRbZcc74B8RSDCx/Mw1
         WIO1wuTqWA3cAKT0swEE91mCae8Q8LVqvut8SbgfmUtsDM4FZbKRZuufCNogj9Egpd78
         ZYeAx8m/8o8NMwnfrK3P74eB4lx596g9d6YeBQX0f6LfuI/vQ4+2R1gbuEPcDQ5GRFdD
         NZEoN0sZG36PYWV93zBTcA8Y7lrqw1uT3lth8WWW9sGxJc2PjFfvnGyace8WCz8KBON1
         MIKA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b17si2952922edb.341.2019.08.16.00.39.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Aug 2019 00:39:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Received: from localhost ([::1]:50658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hyWpq-0004xv-Me
	for alex.bennee@linaro.org; Fri, 16 Aug 2019 03:39:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38036)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tony.nguyen@bt.com>) id 1hyWhA-0004b2-4t
 for qemu-arm@nongnu.org; Fri, 16 Aug 2019 03:30:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hyWh5-0007e0-QX
 for qemu-arm@nongnu.org; Fri, 16 Aug 2019 03:30:44 -0400
Received: from smtpe1.intersmtp.com ([62.239.224.237]:23503)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hyWh2-0007dD-5y; Fri, 16 Aug 2019 03:30:37 -0400
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 RDW083A010ED66.bt.com (10.187.98.36) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Fri, 16 Aug 2019 08:29:38 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18e.domain1.systemhost.net (10.9.212.18) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Fri, 16 Aug 2019 08:30:34 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Fri, 16 Aug
 2019 08:30:34 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v7 11/42] memory: Access MemoryRegion with
 MemOp
Thread-Index: AQHVVAR9ZYg90QpGjUeRa3ureurxuw==
Date: Fri, 16 Aug 2019 07:30:34 +0000
Message-ID: <1565940633026.69822@bt.com>
References: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.40]
Content-Type: multipart/alternative; boundary="_000_156594063302669822btcom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 62.239.224.237
Subject: [Qemu-arm] [Qemu-devel] [PATCH v7 11/42] memory: Access
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
X-TUID: LdZBfCzJga3i

--_000_156594063302669822btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Convert memory_region_dispatch_{read|write} operand "unsigned size"
into a "MemOp op".

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/memop.h  | 20 ++++++++++++++------
 include/exec/memory.h |  9 +++++----
 memory.c              |  7 +++++--
 3 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/include/exec/memop.h b/include/exec/memop.h
index dfd76a1..0a610b7 100644
--- a/include/exec/memop.h
+++ b/include/exec/memop.h
@@ -12,6 +12,8 @@
 #ifndef MEMOP_H
 #define MEMOP_H

+#include "qemu/host-utils.h"
+
 typedef enum MemOp {
     MO_8     =3D 0,
     MO_16    =3D 1,
@@ -107,14 +109,20 @@ typedef enum MemOp {
     MO_SSIZE =3D MO_SIZE | MO_SIGN,
 } MemOp;

+/* MemOp to size in bytes.  */
+static inline unsigned memop_size(MemOp op)
+{
+    return 1 << (op & MO_SIZE);
+}
+
 /* Size in bytes to MemOp.  */
-static inline unsigned size_memop(unsigned size)
+static inline MemOp size_memop(unsigned size)
 {
-    /*
-     * FIXME: No-op to aid conversion of memory_region_dispatch_{read|writ=
e}
-     * "unsigned size" operand into a "MemOp op".
-     */
-    return size;
+#ifdef CONFIG_DEBUG_TCG
+    /* Power of 2 up to 8.  */
+    assert((size & (size - 1)) =3D=3D 0 && size >=3D 1 && size <=3D 8);
+#endif
+    return ctz32(size);
 }

 #endif
diff --git a/include/exec/memory.h b/include/exec/memory.h
index bb0961d..975b86a 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -19,6 +19,7 @@
 #include "exec/cpu-common.h"
 #include "exec/hwaddr.h"
 #include "exec/memattrs.h"
+#include "exec/memop.h"
 #include "exec/ramlist.h"
 #include "qemu/queue.h"
 #include "qemu/int128.h"
@@ -1731,13 +1732,13 @@ void mtree_info(bool flatview, bool dispatch_tree, =
bool owner);
  * @mr: #MemoryRegion to access
  * @addr: address within that region
  * @pval: pointer to uint64_t which the data is written to
- * @size: size of the access in bytes
+ * @op: size, sign, and endianness of the memory operation
  * @attrs: memory transaction attributes to use for the access
  */
 MemTxResult memory_region_dispatch_read(MemoryRegion *mr,
                                         hwaddr addr,
                                         uint64_t *pval,
-                                        unsigned size,
+                                        MemOp op,
                                         MemTxAttrs attrs);
 /**
  * memory_region_dispatch_write: perform a write directly to the specified
@@ -1746,13 +1747,13 @@ MemTxResult memory_region_dispatch_read(MemoryRegio=
n *mr,
  * @mr: #MemoryRegion to access
  * @addr: address within that region
  * @data: data to write
- * @size: size of the access in bytes
+ * @op: size, sign, and endianness of the memory operation
  * @attrs: memory transaction attributes to use for the access
  */
 MemTxResult memory_region_dispatch_write(MemoryRegion *mr,
                                          hwaddr addr,
                                          uint64_t data,
-                                         unsigned size,
+                                         MemOp op,
                                          MemTxAttrs attrs);

 /**
diff --git a/memory.c b/memory.c
index 5d8c9a9..89ea4fb 100644
--- a/memory.c
+++ b/memory.c
@@ -1439,9 +1439,10 @@ static MemTxResult memory_region_dispatch_read1(Memo=
ryRegion *mr,
 MemTxResult memory_region_dispatch_read(MemoryRegion *mr,
                                         hwaddr addr,
                                         uint64_t *pval,
-                                        unsigned size,
+                                        MemOp op,
                                         MemTxAttrs attrs)
 {
+    unsigned size =3D memop_size(op);
     MemTxResult r;

     if (!memory_region_access_valid(mr, addr, size, false, attrs)) {
@@ -1483,9 +1484,11 @@ static bool memory_region_dispatch_write_eventfds(Me=
moryRegion *mr,
 MemTxResult memory_region_dispatch_write(MemoryRegion *mr,
                                          hwaddr addr,
                                          uint64_t data,
-                                         unsigned size,
+                                         MemOp op,
                                          MemTxAttrs attrs)
 {
+    unsigned size =3D memop_size(op);
+
     if (!memory_region_access_valid(mr, addr, size, true, attrs)) {
         unassigned_mem_write(mr, addr, data, size);
         return MEMTX_DECODE_ERROR;
--
1.8.3.1

?


--_000_156594063302669822btcom_
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
<div><span style=3D"font-size: 12pt;">Convert memory_region_dispatch_{read|=
write} operand &quot;unsigned size&quot;</span><br>
</div>
<div>into a &quot;MemOp op&quot;.</div>
<div><br>
</div>
<div>Signed-off-by: Tony Nguyen &lt;tony.nguyen@bt.com&gt;</div>
<div>Reviewed-by: Richard Henderson &lt;richard.henderson@linaro.org&gt;</d=
iv>
<div>---</div>
<div>&nbsp;include/exec/memop.h &nbsp;| 20 &#43;&#43;&#43;&#43;&#43;&#43;&#=
43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;------</div>
<div>&nbsp;include/exec/memory.h | &nbsp;9 &#43;&#43;&#43;&#43;&#43;----</d=
iv>
<div>&nbsp;memory.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp=
;7 &#43;&#43;&#43;&#43;&#43;--</div>
<div>&nbsp;3 files changed, 24 insertions(&#43;), 12 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/include/exec/memop.h b/include/exec/memop.h</div>
<div>index dfd76a1..0a610b7 100644</div>
<div>--- a/include/exec/memop.h</div>
<div>&#43;&#43;&#43; b/include/exec/memop.h</div>
<div>@@ -12,6 &#43;12,8 @@</div>
<div>&nbsp;#ifndef MEMOP_H</div>
<div>&nbsp;#define MEMOP_H</div>
<div>&nbsp;</div>
<div>&#43;#include &quot;qemu/host-utils.h&quot;</div>
<div>&#43;</div>
<div>&nbsp;typedef enum MemOp {</div>
<div>&nbsp; &nbsp; &nbsp;MO_8 &nbsp; &nbsp; =3D 0,</div>
<div>&nbsp; &nbsp; &nbsp;MO_16 &nbsp; &nbsp;=3D 1,</div>
<div>@@ -107,14 &#43;109,20 @@ typedef enum MemOp {</div>
<div>&nbsp; &nbsp; &nbsp;MO_SSIZE =3D MO_SIZE | MO_SIGN,</div>
<div>&nbsp;} MemOp;</div>
<div>&nbsp;</div>
<div>&#43;/* MemOp to size in bytes. &nbsp;*/</div>
<div>&#43;static inline unsigned memop_size(MemOp op)</div>
<div>&#43;{</div>
<div>&#43; &nbsp; &nbsp;return 1 &lt;&lt; (op &amp; MO_SIZE);</div>
<div>&#43;}</div>
<div>&#43;</div>
<div>&nbsp;/* Size in bytes to MemOp. &nbsp;*/</div>
<div>-static inline unsigned size_memop(unsigned size)</div>
<div>&#43;static inline MemOp size_memop(unsigned size)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;/*</div>
<div>- &nbsp; &nbsp; * FIXME: No-op to aid conversion of memory_region_disp=
atch_{read|write}</div>
<div>- &nbsp; &nbsp; * &quot;unsigned size&quot; operand into a &quot;MemOp=
 op&quot;.</div>
<div>- &nbsp; &nbsp; */</div>
<div>- &nbsp; &nbsp;return size;</div>
<div>&#43;#ifdef CONFIG_DEBUG_TCG</div>
<div>&#43; &nbsp; &nbsp;/* Power of 2 up to 8. &nbsp;*/</div>
<div>&#43; &nbsp; &nbsp;assert((size &amp; (size - 1)) =3D=3D 0 &amp;&amp; =
size &gt;=3D 1 &amp;&amp; size &lt;=3D 8);</div>
<div>&#43;#endif</div>
<div>&#43; &nbsp; &nbsp;return ctz32(size);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;#endif</div>
<div>diff --git a/include/exec/memory.h b/include/exec/memory.h</div>
<div>index bb0961d..975b86a 100644</div>
<div>--- a/include/exec/memory.h</div>
<div>&#43;&#43;&#43; b/include/exec/memory.h</div>
<div>@@ -19,6 &#43;19,7 @@</div>
<div>&nbsp;#include &quot;exec/cpu-common.h&quot;</div>
<div>&nbsp;#include &quot;exec/hwaddr.h&quot;</div>
<div>&nbsp;#include &quot;exec/memattrs.h&quot;</div>
<div>&#43;#include &quot;exec/memop.h&quot;</div>
<div>&nbsp;#include &quot;exec/ramlist.h&quot;</div>
<div>&nbsp;#include &quot;qemu/queue.h&quot;</div>
<div>&nbsp;#include &quot;qemu/int128.h&quot;</div>
<div>@@ -1731,13 &#43;1732,13 @@ void mtree_info(bool flatview, bool dispat=
ch_tree, bool owner);</div>
<div>&nbsp; * @mr: #MemoryRegion to access</div>
<div>&nbsp; * @addr: address within that region</div>
<div>&nbsp; * @pval: pointer to uint64_t which the data is written to</div>
<div>- * @size: size of the access in bytes</div>
<div>&#43; * @op: size, sign, and endianness of the memory operation</div>
<div>&nbsp; * @attrs: memory transaction attributes to use for the access</=
div>
<div>&nbsp; */</div>
<div>&nbsp;MemTxResult memory_region_dispatch_read(MemoryRegion *mr,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;hwaddr addr,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;uint64_t *pval,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;unsi=
gned size,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
MemOp op,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;MemTxAttrs attrs);</div>
<div>&nbsp;/**</div>
<div>&nbsp; * memory_region_dispatch_write: perform a write directly to the=
 specified</div>
<div>@@ -1746,13 &#43;1747,13 @@ MemTxResult memory_region_dispatch_read(Me=
moryRegion *mr,</div>
<div>&nbsp; * @mr: #MemoryRegion to access</div>
<div>&nbsp; * @addr: address within that region</div>
<div>&nbsp; * @data: data to write</div>
<div>- * @size: size of the access in bytes</div>
<div>&#43; * @op: size, sign, and endianness of the memory operation</div>
<div>&nbsp; * @attrs: memory transaction attributes to use for the access</=
div>
<div>&nbsp; */</div>
<div>&nbsp;MemTxResult memory_region_dispatch_write(MemoryRegion *mr,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; hwaddr addr,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; uint64_t data,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; uns=
igned size,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 MemOp op,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; MemTxAttrs attrs);</div>
<div>&nbsp;</div>
<div>&nbsp;/**</div>
<div>diff --git a/memory.c b/memory.c</div>
<div>index 5d8c9a9..89ea4fb 100644</div>
<div>--- a/memory.c</div>
<div>&#43;&#43;&#43; b/memory.c</div>
<div>@@ -1439,9 &#43;1439,10 @@ static MemTxResult memory_region_dispatch_r=
ead1(MemoryRegion *mr,</div>
<div>&nbsp;MemTxResult memory_region_dispatch_read(MemoryRegion *mr,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;hwaddr addr,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;uint64_t *pval,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;unsi=
gned size,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
MemOp op,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;MemTxAttrs attrs)</div>
<div>&nbsp;{</div>
<div>&#43; &nbsp; &nbsp;unsigned size =3D memop_size(op);</div>
<div>&nbsp; &nbsp; &nbsp;MemTxResult r;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;if (!memory_region_access_valid(mr, addr, size, fa=
lse, attrs)) {</div>
<div>@@ -1483,9 &#43;1484,11 @@ static bool memory_region_dispatch_write_ev=
entfds(MemoryRegion *mr,</div>
<div>&nbsp;MemTxResult memory_region_dispatch_write(MemoryRegion *mr,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; hwaddr addr,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; uint64_t data,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; uns=
igned size,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 MemOp op,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; MemTxAttrs attrs)</div>
<div>&nbsp;{</div>
<div>&#43; &nbsp; &nbsp;unsigned size =3D memop_size(op);</div>
<div>&#43;</div>
<div>&nbsp; &nbsp; &nbsp;if (!memory_region_access_valid(mr, addr, size, tr=
ue, attrs)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;unassigned_mem_write(mr, addr, data,=
 size);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return MEMTX_DECODE_ERROR;</div>
<div>--&nbsp;</div>
<div>1.8.3.1</div>
<div><br>
&#8203;<br>
</div>
<p><br>
</p>
</body>
</html>

--_000_156594063302669822btcom_--
