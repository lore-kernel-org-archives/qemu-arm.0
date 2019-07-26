Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp11519596wrv;
        Thu, 25 Jul 2019 23:48:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyQ68U+xFfEP4F0bbUvB8AI7CYIPbEuW4csHCMuM8EMOHe5FpzkUnlumWAILmGFBEw3sz3/
X-Received: by 2002:a0c:ff25:: with SMTP id x5mr8482633qvt.88.1564123700405;
        Thu, 25 Jul 2019 23:48:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564123700; cv=none;
        d=google.com; s=arc-20160816;
        b=hXzTIOjmgXjgbVI7YK1ywRF+w8JUTYNAVVHUQWHtzJxppgORGLPVBmlRqZUptrG9oR
         UArySmiVGEat6/JgtEguoY98XW0VaIf/gEeF8kn/6hX1SaQROAZmwdIxoZVWuje2GN6N
         BysxMUM93j87f224z0dm/aL86PND1feC5Wjqo3EwYQkJadehj28HxvqIBkPOIbQzojFv
         MceXNfF2hYXF6pm4ub0Gu+pF91Na2eZSMpJnPO67/Jmk0B36DBlfUrdrNPlw5a5sv9Yg
         gZ+rwQ6r7xf0vepirXvJfmSHVFiA6viw+FyT8i6hE2QKVv+93m1epJgWBSBG8KfFm3Zr
         2FIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:to:from;
        bh=J6Ch3mSY22CbU+eW0TOyQE2W154WPh3WwizR77M+x+g=;
        b=kJlaWTGNGicOk1xIAy+HBdJjVDBPzyaZWTHJO8sz03oQUsY5hi61cX1lGs5KicxfpB
         vg7ecmGHwnRjHO8eKsqcE0fG4+imQIQjRWoM3N4xoVr5E2trUygvLB+X4OJFfAOCkgYV
         ap0k8GwrEzJXxjcU/TMhDUN7sojbjm47NsajeK6iUSKp5XSs7AdEKmhjuZc0cvgHUFmh
         Oxdk7yU9JLr3iIo8rqMRY/b8eTVOqK8LG8cP2HyicynctIqNsDhgs1jc3ZaVoRDPfkBX
         8ZOcdVGwb0nbXZX9wxaExcwFFb5m+pSECYc6NZZAqVyGVAyyjQO6h1vRijhHuEJar9hK
         i0+A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s16si23917482qte.92.2019.07.25.23.48.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jul 2019 23:48:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Received: from localhost ([::1]:36734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hqu1b-0004pR-VD
	for alex.bennee@linaro.org; Fri, 26 Jul 2019 02:48:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54091)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tony.nguyen@bt.com>) id 1hqu0y-0002lP-34
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 02:47:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hqu0v-0004uA-KA
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 02:47:38 -0400
Received: from smtpe1.intersmtp.com ([62.239.224.236]:41124)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hqu0m-0004Ed-Qq; Fri, 26 Jul 2019 02:47:29 -0400
Received: from tpw09926dag18g.domain1.systemhost.net (10.9.212.34) by
 RDW083A009ED65.bt.com (10.187.98.35) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Fri, 26 Jul 2019 07:43:28 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18g.domain1.systemhost.net (10.9.212.34) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Fri, 26 Jul 2019 07:47:24 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Fri, 26 Jul
 2019 07:47:24 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v5 10/15] memory: Access MemoryRegion with
 MemOp semantics
Thread-Index: AQHVQ337z2ux/Jk5eUK0KMuToV5GXA==
Date: Fri, 26 Jul 2019 06:47:24 +0000
Message-ID: <1564123643791.27023@bt.com>
References: <3106a3c959c4498fad13a5799c89ba7b@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <3106a3c959c4498fad13a5799c89ba7b@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.42]
Content-Type: multipart/alternative; boundary="_000_156412364379127023btcom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 62.239.224.236
Subject: [Qemu-arm] [Qemu-devel] [PATCH v5 10/15] memory: Access
 MemoryRegion with MemOp semantics
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
X-TUID: dQ5kXvYXEZJg

--_000_156412364379127023btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

To convert interfaces of MemoryRegion access, MEMOP_SIZE and
SIZE_MEMOP no-op stubs were introduced to change syntax while keeping
the existing semantics.

Now with interfaces converted, we fill the stubs and use MemOp
semantics.

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
---
 include/exec/memop.h  | 5 ++---
 include/exec/memory.h | 4 ++--
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/include/exec/memop.h b/include/exec/memop.h
index 09c8d20..f2847e8 100644
--- a/include/exec/memop.h
+++ b/include/exec/memop.h
@@ -106,8 +106,7 @@ typedef enum MemOp {
     MO_SSIZE =3D MO_SIZE | MO_SIGN,
 } MemOp;

-/* No-op while memory_region_dispatch_[read|write] is converted to MemOp *=
/
-#define MEMOP_SIZE(op)  (op)    /* MemOp to size.  */
-#define SIZE_MEMOP(ul)  (ul)    /* Size to MemOp.  */
+#define MEMOP_SIZE(op)  (1 << ((op) & MO_SIZE)) /* MemOp to size.  */
+#define SIZE_MEMOP(ul)  (ctzl(ul))              /* Size to MemOp.  */

 #endif
diff --git a/include/exec/memory.h b/include/exec/memory.h
index 0ea4843..975b86a 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -1732,7 +1732,7 @@ void mtree_info(bool flatview, bool dispatch_tree, bo=
ol owner);
  * @mr: #MemoryRegion to access
  * @addr: address within that region
  * @pval: pointer to uint64_t which the data is written to
- * @op: size of the access in bytes
+ * @op: size, sign, and endianness of the memory operation
  * @attrs: memory transaction attributes to use for the access
  */
 MemTxResult memory_region_dispatch_read(MemoryRegion *mr,
@@ -1747,7 +1747,7 @@ MemTxResult memory_region_dispatch_read(MemoryRegion =
*mr,
  * @mr: #MemoryRegion to access
  * @addr: address within that region
  * @data: data to write
- * @op: size of the access in bytes
+ * @op: size, sign, and endianness of the memory operation
  * @attrs: memory transaction attributes to use for the access
  */
 MemTxResult memory_region_dispatch_write(MemoryRegion *mr,
--
1.8.3.1




--_000_156412364379127023btcom_
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
<div><span style=3D"font-size: 12pt;">To convert interfaces of MemoryRegion=
 access, MEMOP_SIZE and</span><br>
</div>
<div>SIZE_MEMOP no-op stubs were introduced to change syntax while keeping<=
/div>
<div>the existing semantics.</div>
<div><br>
</div>
<div>Now with interfaces converted, we fill the stubs and use MemOp</div>
<div>semantics.</div>
<div><br>
</div>
<div>Signed-off-by: Tony Nguyen &lt;tony.nguyen@bt.com&gt;</div>
<div>---</div>
<div>&nbsp;include/exec/memop.h &nbsp;| 5 &#43;&#43;---</div>
<div>&nbsp;include/exec/memory.h | 4 &#43;&#43;--</div>
<div>&nbsp;2 files changed, 4 insertions(&#43;), 5 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/include/exec/memop.h b/include/exec/memop.h</div>
<div>index 09c8d20..f2847e8 100644</div>
<div>--- a/include/exec/memop.h</div>
<div>&#43;&#43;&#43; b/include/exec/memop.h</div>
<div>@@ -106,8 &#43;106,7 @@ typedef enum MemOp {</div>
<div>&nbsp; &nbsp; &nbsp;MO_SSIZE =3D MO_SIZE | MO_SIGN,</div>
<div>&nbsp;} MemOp;</div>
<div>&nbsp;</div>
<div>-/* No-op while memory_region_dispatch_[read|write] is converted to Me=
mOp */</div>
<div>-#define MEMOP_SIZE(op) &nbsp;(op) &nbsp; &nbsp;/* MemOp to size. &nbs=
p;*/</div>
<div>-#define SIZE_MEMOP(ul) &nbsp;(ul) &nbsp; &nbsp;/* Size to MemOp. &nbs=
p;*/</div>
<div>&#43;#define MEMOP_SIZE(op) &nbsp;(1 &lt;&lt; ((op) &amp; MO_SIZE)) /*=
 MemOp to size. &nbsp;*/</div>
<div>&#43;#define SIZE_MEMOP(ul) &nbsp;(ctzl(ul)) &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;/* Size to MemOp. &nbsp;*/</div>
<div>&nbsp;</div>
<div>&nbsp;#endif</div>
<div>diff --git a/include/exec/memory.h b/include/exec/memory.h</div>
<div>index 0ea4843..975b86a 100644</div>
<div>--- a/include/exec/memory.h</div>
<div>&#43;&#43;&#43; b/include/exec/memory.h</div>
<div>@@ -1732,7 &#43;1732,7 @@ void mtree_info(bool flatview, bool dispatch=
_tree, bool owner);</div>
<div>&nbsp; * @mr: #MemoryRegion to access</div>
<div>&nbsp; * @addr: address within that region</div>
<div>&nbsp; * @pval: pointer to uint64_t which the data is written to</div>
<div>- * @op: size of the access in bytes</div>
<div>&#43; * @op: size, sign, and endianness of the memory operation</div>
<div>&nbsp; * @attrs: memory transaction attributes to use for the access</=
div>
<div>&nbsp; */</div>
<div>&nbsp;MemTxResult memory_region_dispatch_read(MemoryRegion *mr,</div>
<div>@@ -1747,7 &#43;1747,7 @@ MemTxResult memory_region_dispatch_read(Memo=
ryRegion *mr,</div>
<div>&nbsp; * @mr: #MemoryRegion to access</div>
<div>&nbsp; * @addr: address within that region</div>
<div>&nbsp; * @data: data to write</div>
<div>- * @op: size of the access in bytes</div>
<div>&#43; * @op: size, sign, and endianness of the memory operation</div>
<div>&nbsp; * @attrs: memory transaction attributes to use for the access</=
div>
<div>&nbsp; */</div>
<div>&nbsp;MemTxResult memory_region_dispatch_write(MemoryRegion *mr,</div>
<div>--&nbsp;</div>
<div>1.8.3.1</div>
<div><br>
<br>
</div>
<p><br>
</p>
</body>
</html>

--_000_156412364379127023btcom_--
