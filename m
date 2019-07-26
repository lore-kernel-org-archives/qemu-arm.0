Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp11516378wrv;
        Thu, 25 Jul 2019 23:44:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw0HnPvUgTf2gIC46ZKiJu46d4NKWZnbmJTX0BgG9qycPQ/bpIZ9BwmlRNKwK0RkX6cULjm
X-Received: by 2002:a50:b343:: with SMTP id r3mr78592827edd.16.1564123469712;
        Thu, 25 Jul 2019 23:44:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564123469; cv=none;
        d=google.com; s=arc-20160816;
        b=nZJLWTgGe6qR+UD28VKS7rGtGegPBw/sIdg8a5gYfkuCDkCn+k1aOTF0TkcYq/zJKx
         RvoR3fQXptJHdx1U+V9SplPs6rDWiCSvMopcVVXYNjCiTR6iHQ5oBCc75L8obXd07bfc
         W7z06XE6qx09iXcuqkUszAZVUZVH6hy8x1Q7wvXHoa5Mar/uDkPo8+futkP2+FfrItox
         KGWFXcNzG/vr4KP5yhvbr7bc4aWcA4ziYnOEACanDYVG+Ns3J4JA2+1YZDlYnbDfiSph
         T7UCJs6nKRe2r2vZ1C6wff5TlNad/l5wUEKvnC1l/kep6MJE0uxRr+I972uvrLC2fV3r
         b+nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:to:from;
        bh=Xdus5cAngGcequabN8UsEsnFy8hYyz3QjPyd6XrQAhg=;
        b=p8Gp4YiJkcVLQR8Yu1XGY73Rhc0FalsQr4AMGlJRsDNTB1GF3hrT/aNb7OJo5nPztM
         hmUEsS+Q7NXcYaKdGfhFFYuBc9jAgPSJQ/eFANqDD7gMcfp79KHxHaPgMTPaypvqDij0
         /KkDGV91rNUix0JKf8aYVs9ZGuIWpxEI76heO1mDE9BKt2JvIIM9EmmBWHvmK8Og5QX0
         IRFK0g8GgC/andGRHQ9qJfm7wTlar3wdK+VHIT9SKxF+aOHUptrEzPEN7Aqa6NTsGwlL
         851LltJKFREgxGDLaBcTv1iDP9Y75cccVqHrTUtCfveO4x+J2r3rGrlRhbgfwP4xoxXU
         Lpcg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a20si10186680ejr.109.2019.07.25.23.44.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jul 2019 23:44:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Received: from localhost ([::1]:36566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hqtxr-0001Mu-Pf
	for alex.bennee@linaro.org; Fri, 26 Jul 2019 02:44:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39196)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tony.nguyen@bt.com>) id 1hqtxm-0001A7-S1
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 02:44:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hqtxh-0006IC-Gx
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 02:44:20 -0400
Received: from smtpe1.intersmtp.com ([213.121.35.78]:4596)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hqtxQ-00051X-Va; Fri, 26 Jul 2019 02:44:01 -0400
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 BWP09926083.bt.com (10.36.82.114) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Fri, 26
 Jul 2019 07:43:50 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18e.domain1.systemhost.net (10.9.212.18) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Fri, 26 Jul 2019 07:43:55 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Fri, 26 Jul
 2019 07:43:55 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v5 02/15] memory: Access MemoryRegion with
 MemOp
Thread-Index: AQHVQ31+je5B6RiCz0CzDAf0F7Tipg==
Date: Fri, 26 Jul 2019 06:43:55 +0000
Message-ID: <1564123434793.89101@bt.com>
References: <3106a3c959c4498fad13a5799c89ba7b@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <3106a3c959c4498fad13a5799c89ba7b@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.42]
Content-Type: multipart/alternative; boundary="_000_156412343479389101btcom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 213.121.35.78
Subject: [Qemu-arm] [Qemu-devel] [PATCH v5 02/15] memory: Access
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
Cc: peter.maydell@linaro.org, walling@linux.ibm.com, sagark@eecs.berkeley.edu,
 mst@redhat.com, palmer@sifive.com, mark.cave-ayland@ilande.co.uk,
 laurent@vivier.eu, Alistair.Francis@wdc.com, arikalo@wavecomp.com,
 david@redhat.com, pasic@linux.ibm.com, borntraeger@de.ibm.com, rth@twiddle.net,
 atar4qemu@gmail.com, ehabkost@redhat.com, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, stefanha@redhat.com, shorne@gmail.com,
 david@gibson.dropbear.id.au, qemu-riscv@nongnu.org,
 kbastian@mail.uni-paderborn.de, cohuck@redhat.com, alex.williamson@redhat.com,
 qemu-ppc@nongnu.org, amarkovic@wavecomp.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: F/D43ys8DEkP

--_000_156412343479389101btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Change memory_region_dispatch_{read|write} parameter "unsigned size"
to "MemOp op".

The endianness encoded in MemOp will enable the collapse of two byte
swaps, adjust_endianness and handle_bswap, along the I/O path.

Interfaces will be converted in two steps: first syntactically then
semantically.

The syntax change is usage of no-op MEMOP_SIZE and SIZE_MEMOP macros.
Being no-op there are no logical change, and we rely on coercion
between unsigned and MemOp.

The semantic change is implementing MEMOP_SIZE and SIZE_MEMOP to
logically convert an unsigned size to and from a size+sign+endianness
encoded MemOp.

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
---
 include/exec/memop.h  | 4 ++++
 include/exec/memory.h | 9 +++++----
 memory.c              | 7 +++++--
 3 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/include/exec/memop.h b/include/exec/memop.h
index ac58066..09c8d20 100644
--- a/include/exec/memop.h
+++ b/include/exec/memop.h
@@ -106,4 +106,8 @@ typedef enum MemOp {
     MO_SSIZE =3D MO_SIZE | MO_SIGN,
 } MemOp;

+/* No-op while memory_region_dispatch_[read|write] is converted to MemOp *=
/
+#define MEMOP_SIZE(op)  (op)    /* MemOp to size.  */
+#define SIZE_MEMOP(ul)  (ul)    /* Size to MemOp.  */
+
 #endif
diff --git a/include/exec/memory.h b/include/exec/memory.h
index bb0961d..0ea4843 100644
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
+ * @op: size of the access in bytes
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
+ * @op: size of the access in bytes
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
index 5d8c9a9..6982e19 100644
--- a/memory.c
+++ b/memory.c
@@ -1439,10 +1439,11 @@ static MemTxResult memory_region_dispatch_read1(Mem=
oryRegion *mr,
 MemTxResult memory_region_dispatch_read(MemoryRegion *mr,
                                         hwaddr addr,
                                         uint64_t *pval,
-                                        unsigned size,
+                                        MemOp op,
                                         MemTxAttrs attrs)
 {
     MemTxResult r;
+    unsigned size =3D MEMOP_SIZE(op);

     if (!memory_region_access_valid(mr, addr, size, false, attrs)) {
         *pval =3D unassigned_mem_read(mr, addr, size);
@@ -1483,9 +1484,11 @@ static bool memory_region_dispatch_write_eventfds(Me=
moryRegion *mr,
 MemTxResult memory_region_dispatch_write(MemoryRegion *mr,
                                          hwaddr addr,
                                          uint64_t data,
-                                         unsigned size,
+                                         MemOp op,
                                          MemTxAttrs attrs)
 {
+    unsigned size =3D MEMOP_SIZE(op);
+
     if (!memory_region_access_valid(mr, addr, size, true, attrs)) {
         unassigned_mem_write(mr, addr, data, size);
         return MEMTX_DECODE_ERROR;
--
1.8.3.1




--_000_156412343479389101btcom_
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
<div><span style=3D"font-size: 12pt;">Change memory_region_dispatch_{read|w=
rite} parameter &quot;unsigned size&quot;</span><br>
</div>
<div>to &quot;MemOp op&quot;.</div>
<div><br>
</div>
<div>The endianness encoded in MemOp will enable the collapse of two byte</=
div>
<div>swaps, adjust_endianness and handle_bswap, along the I/O path.</div>
<div><br>
</div>
<div>Interfaces will be converted in two steps: first syntactically then</d=
iv>
<div>semantically.</div>
<div><br>
</div>
<div>The syntax change is usage of no-op MEMOP_SIZE and SIZE_MEMOP macros.<=
/div>
<div>Being no-op there are no logical change, and we rely on coercion</div>
<div>between unsigned and MemOp.</div>
<div><br>
</div>
<div>The semantic change is implementing MEMOP_SIZE and SIZE_MEMOP to</div>
<div>logically convert an unsigned size to and from a size&#43;sign&#43;end=
ianness</div>
<div>encoded MemOp.</div>
<div><br>
</div>
<div>Signed-off-by: Tony Nguyen &lt;tony.nguyen@bt.com&gt;</div>
<div>---</div>
<div>&nbsp;include/exec/memop.h &nbsp;| 4 &#43;&#43;&#43;&#43;</div>
<div>&nbsp;include/exec/memory.h | 9 &#43;&#43;&#43;&#43;&#43;----</div>
<div>&nbsp;memory.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 7 &#4=
3;&#43;&#43;&#43;&#43;--</div>
<div>&nbsp;3 files changed, 14 insertions(&#43;), 6 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/include/exec/memop.h b/include/exec/memop.h</div>
<div>index ac58066..09c8d20 100644</div>
<div>--- a/include/exec/memop.h</div>
<div>&#43;&#43;&#43; b/include/exec/memop.h</div>
<div>@@ -106,4 &#43;106,8 @@ typedef enum MemOp {</div>
<div>&nbsp; &nbsp; &nbsp;MO_SSIZE =3D MO_SIZE | MO_SIGN,</div>
<div>&nbsp;} MemOp;</div>
<div>&nbsp;</div>
<div>&#43;/* No-op while memory_region_dispatch_[read|write] is converted t=
o MemOp */</div>
<div>&#43;#define MEMOP_SIZE(op) &nbsp;(op) &nbsp; &nbsp;/* MemOp to size. =
&nbsp;*/</div>
<div>&#43;#define SIZE_MEMOP(ul) &nbsp;(ul) &nbsp; &nbsp;/* Size to MemOp. =
&nbsp;*/</div>
<div>&#43;</div>
<div>&nbsp;#endif</div>
<div>diff --git a/include/exec/memory.h b/include/exec/memory.h</div>
<div>index bb0961d..0ea4843 100644</div>
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
<div>&#43; * @op: size of the access in bytes</div>
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
<div>&#43; * @op: size of the access in bytes</div>
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
<div>index 5d8c9a9..6982e19 100644</div>
<div>--- a/memory.c</div>
<div>&#43;&#43;&#43; b/memory.c</div>
<div>@@ -1439,10 &#43;1439,11 @@ static MemTxResult memory_region_dispatch_=
read1(MemoryRegion *mr,</div>
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
<div>&nbsp; &nbsp; &nbsp;MemTxResult r;</div>
<div>&#43; &nbsp; &nbsp;unsigned size =3D MEMOP_SIZE(op);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;if (!memory_region_access_valid(mr, addr, size, fa=
lse, attrs)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;*pval =3D unassigned_mem_read(mr, ad=
dr, size);</div>
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
<div>&#43; &nbsp; &nbsp;unsigned size =3D MEMOP_SIZE(op);</div>
<div>&#43;</div>
<div>&nbsp; &nbsp; &nbsp;if (!memory_region_access_valid(mr, addr, size, tr=
ue, attrs)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;unassigned_mem_write(mr, addr, data,=
 size);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return MEMTX_DECODE_ERROR;</div>
<div>--&nbsp;</div>
<div>1.8.3.1</div>
<div><br>
<br>
</div>
<p><br>
</p>
</body>
</html>

--_000_156412343479389101btcom_--
