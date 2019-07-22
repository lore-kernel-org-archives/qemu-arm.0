Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp7043969wrv;
        Mon, 22 Jul 2019 08:49:48 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy9mtU2cl/Id+GbiOjzkvtqkdBj7bMONxhF9huvVe8frC0A6Nyq57uwSnB22B/xVoWvWRY/
X-Received: by 2002:a67:c914:: with SMTP id w20mr16712831vsk.110.1563810588010;
        Mon, 22 Jul 2019 08:49:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563810588; cv=none;
        d=google.com; s=arc-20160816;
        b=BA6iUdDVcGhEyiU3icNH0jZW+5kTnp8Qn+AmmRFaCGWJvwZq2LQCGCKVpW0KEBmTXZ
         6nIQ4/qUA1VAi/Q7apvE1rLGq8b0Zb3cOjz9C4a99a+OO1XJEjpuTkmYJcS6F5lWFenn
         9hhItFzxsG1p7ZM5QST3xkBK6oNiQ6dHgF0jNDJY1t8+ZXFYtylDu8I/6/kocFEl78Pd
         T1MZn6/m3CAYb/j9h4JIEzRDr0fsDUgg7tvaxs6/Wdy6297H27vylcCeoCou126a8F2U
         ZqPMrg33G78Apeslylsj4G2O9ahM1mZmJ2GrVF3hh30mPbkVHEBwOSibw35tO41MIsZD
         IF1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:to:from;
        bh=2zOB5yZUAJO5SIE3f7AkajalGJwEwpIrmP9ea16YQB0=;
        b=QfbPkC2LaCd561fQ7lqmQzJKkCcIVeC0BSFFMU8hr6OyAytMjOgtHbBoiW6rmbwtG/
         QOsDf5e7U/ZiG8SFh8ZrpNtJQLgnYSMMZ/RlQOYrewcugkehK4oukc5VN/Ovdbo2V4wZ
         BhCInVXTwiluJuUiFbGTEv3hGkncM16OMpyZYJj1Xm3CgAyo1JBbpvloqwXmUMZ64SWw
         AgjIqWXdiy3hDwIXpJQkqUSPTKtAFxzMYmC/MHEcu0KymTYmP03ZYa7RJDg1AB8oe+D+
         x0YCoyFgLnVXeBaTND8LdSW6P/QOmhtG/lGOvsrINBFxmnMlXMQSyPVblrY+9sMH5ZpD
         bs0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w5si7424897vse.274.2019.07.22.08.49.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jul 2019 08:49:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Received: from localhost ([::1]:35052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hpaZP-0007CF-HD
	for alex.bennee@linaro.org; Mon, 22 Jul 2019 11:49:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54140)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tony.nguyen@bt.com>) id 1hpaZI-0006xM-Mn
 for qemu-arm@nongnu.org; Mon, 22 Jul 2019 11:49:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hpaZG-0000Cq-TE
 for qemu-arm@nongnu.org; Mon, 22 Jul 2019 11:49:40 -0400
Received: from smtpe1.intersmtp.com ([213.121.35.77]:3202)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hpaZ2-0008H7-Ey; Mon, 22 Jul 2019 11:49:24 -0400
Received: from tpw09926dag18h.domain1.systemhost.net (10.9.212.42) by
 BWP09926082.bt.com (10.36.82.113) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Mon, 22
 Jul 2019 16:49:21 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18h.domain1.systemhost.net (10.9.212.42) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Mon, 22 Jul 2019 16:49:22 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Mon, 22 Jul
 2019 16:49:21 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v2 13/20] exec: Access MemoryRegion with
 MemOp
Thread-Index: AQHVQKUHXZphlpC32U+r70UVQuqlvQ==
Date: Mon, 22 Jul 2019 15:49:21 +0000
Message-ID: <1563810561191.16853@bt.com>
References: <e9c6e5310b1a4863be45d45bf087fc3d@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <e9c6e5310b1a4863be45d45bf087fc3d@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.37]
Content-Type: multipart/alternative; boundary="_000_156381056119116853btcom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 213.121.35.77
Subject: [Qemu-arm] [Qemu-devel] [PATCH v2 13/20] exec: Access MemoryRegion
 with MemOp
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
Cc: peter.maydell@linaro.org, walling@linux.ibm.com, mst@redhat.com,
 palmer@sifive.com, mark.cave-ayland@ilande.co.uk, Alistair.Francis@wdc.com,
 arikalo@wavecomp.com, david@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, rth@twiddle.net, atar4qemu@gmail.com,
 ehabkost@redhat.com, sw@weilnetz.de, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, david@gibson.dropbear.id.au, qemu-riscv@nongnu.org,
 cohuck@redhat.com, claudio.fontana@huawei.com, alex.williamson@redhat.com,
 qemu-ppc@nongnu.org, amarkovic@wavecomp.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c9G1JxoP6l7N

--_000_156381056119116853btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
---
 exec.c            |  6 ++++--
 memory_ldst.inc.c | 18 +++++++++---------
 2 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/exec.c b/exec.c
index 3e78de3..5013864 100644
--- a/exec.c
+++ b/exec.c
@@ -3334,7 +3334,8 @@ static MemTxResult flatview_write_continue(FlatView *=
fv, hwaddr addr,
             /* XXX: could force current_cpu to NULL to avoid
                potential bugs */
             val =3D ldn_p(buf, l);
-            result |=3D memory_region_dispatch_write(mr, addr1, val, l, at=
trs);
+            result |=3D memory_region_dispatch_write(mr, addr1, val,
+                                                   SIZE_MEMOP(l), attrs);
         } else {
             /* RAM case */
             ptr =3D qemu_ram_ptr_length(mr->ram_block, addr1, &l, false);
@@ -3395,7 +3396,8 @@ MemTxResult flatview_read_continue(FlatView *fv, hwad=
dr addr,
             /* I/O case */
             release_lock |=3D prepare_mmio_access(mr);
             l =3D memory_access_size(mr, l, addr1);
-            result |=3D memory_region_dispatch_read(mr, addr1, &val, l, at=
trs);
+            result |=3D memory_region_dispatch_read(mr, addr1, &val,
+                                                  SIZE_MEMOP(l), attrs);
             stn_p(buf, l, val);
         } else {
             /* RAM case */
diff --git a/memory_ldst.inc.c b/memory_ldst.inc.c
index acf865b..e073cf9 100644
--- a/memory_ldst.inc.c
+++ b/memory_ldst.inc.c
@@ -38,7 +38,7 @@ static inline uint32_t glue(address_space_ldl_internal, S=
UFFIX)(ARG1_DECL,
         release_lock |=3D prepare_mmio_access(mr);

         /* I/O case */
-        r =3D memory_region_dispatch_read(mr, addr1, &val, 4, attrs);
+        r =3D memory_region_dispatch_read(mr, addr1, &val, SIZE_MEMOP(4), =
attrs);
 #if defined(TARGET_WORDS_BIGENDIAN)
         if (endian =3D=3D DEVICE_LITTLE_ENDIAN) {
             val =3D bswap32(val);
@@ -114,7 +114,7 @@ static inline uint64_t glue(address_space_ldq_internal,=
 SUFFIX)(ARG1_DECL,
         release_lock |=3D prepare_mmio_access(mr);

         /* I/O case */
-        r =3D memory_region_dispatch_read(mr, addr1, &val, 8, attrs);
+        r =3D memory_region_dispatch_read(mr, addr1, &val, SIZE_MEMOP(8), =
attrs);
 #if defined(TARGET_WORDS_BIGENDIAN)
         if (endian =3D=3D DEVICE_LITTLE_ENDIAN) {
             val =3D bswap64(val);
@@ -188,7 +188,7 @@ uint32_t glue(address_space_ldub, SUFFIX)(ARG1_DECL,
         release_lock |=3D prepare_mmio_access(mr);

         /* I/O case */
-        r =3D memory_region_dispatch_read(mr, addr1, &val, 1, attrs);
+        r =3D memory_region_dispatch_read(mr, addr1, &val, SIZE_MEMOP(1), =
attrs);
     } else {
         /* RAM case */
         ptr =3D qemu_map_ram_ptr(mr->ram_block, addr1);
@@ -224,7 +224,7 @@ static inline uint32_t glue(address_space_lduw_internal=
, SUFFIX)(ARG1_DECL,
         release_lock |=3D prepare_mmio_access(mr);

         /* I/O case */
-        r =3D memory_region_dispatch_read(mr, addr1, &val, 2, attrs);
+        r =3D memory_region_dispatch_read(mr, addr1, &val, SIZE_MEMOP(2), =
attrs);
 #if defined(TARGET_WORDS_BIGENDIAN)
         if (endian =3D=3D DEVICE_LITTLE_ENDIAN) {
             val =3D bswap16(val);
@@ -300,7 +300,7 @@ void glue(address_space_stl_notdirty, SUFFIX)(ARG1_DECL=
,
     if (l < 4 || !memory_access_is_direct(mr, true)) {
         release_lock |=3D prepare_mmio_access(mr);

-        r =3D memory_region_dispatch_write(mr, addr1, val, 4, attrs);
+        r =3D memory_region_dispatch_write(mr, addr1, val, SIZE_MEMOP(4), =
attrs);
     } else {
         ptr =3D qemu_map_ram_ptr(mr->ram_block, addr1);
         stl_p(ptr, val);
@@ -346,7 +346,7 @@ static inline void glue(address_space_stl_internal, SUF=
FIX)(ARG1_DECL,
             val =3D bswap32(val);
         }
 #endif
-        r =3D memory_region_dispatch_write(mr, addr1, val, 4, attrs);
+        r =3D memory_region_dispatch_write(mr, addr1, val, SIZE_MEMOP(4), =
attrs);
     } else {
         /* RAM case */
         ptr =3D qemu_map_ram_ptr(mr->ram_block, addr1);
@@ -408,7 +408,7 @@ void glue(address_space_stb, SUFFIX)(ARG1_DECL,
     mr =3D TRANSLATE(addr, &addr1, &l, true, attrs);
     if (!memory_access_is_direct(mr, true)) {
         release_lock |=3D prepare_mmio_access(mr);
-        r =3D memory_region_dispatch_write(mr, addr1, val, 1, attrs);
+        r =3D memory_region_dispatch_write(mr, addr1, val, SIZE_MEMOP(1), =
attrs);
     } else {
         /* RAM case */
         ptr =3D qemu_map_ram_ptr(mr->ram_block, addr1);
@@ -451,7 +451,7 @@ static inline void glue(address_space_stw_internal, SUF=
FIX)(ARG1_DECL,
             val =3D bswap16(val);
         }
 #endif
-        r =3D memory_region_dispatch_write(mr, addr1, val, 2, attrs);
+        r =3D memory_region_dispatch_write(mr, addr1, val, SIZE_MEMOP(2), =
attrs);
     } else {
         /* RAM case */
         ptr =3D qemu_map_ram_ptr(mr->ram_block, addr1);
@@ -524,7 +524,7 @@ static void glue(address_space_stq_internal, SUFFIX)(AR=
G1_DECL,
             val =3D bswap64(val);
         }
 #endif
-        r =3D memory_region_dispatch_write(mr, addr1, val, 8, attrs);
+        r =3D memory_region_dispatch_write(mr, addr1, val, SIZE_MEMOP(8), =
attrs);
     } else {
         /* RAM case */
         ptr =3D qemu_map_ram_ptr(mr->ram_block, addr1);
--
1.8.3.1




--_000_156381056119116853btcom_
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
<div><span style=3D"font-size: 12pt;">Signed-off-by: Tony Nguyen &lt;tony.n=
guyen@bt.com&gt;</span><br>
</div>
<div>---</div>
<div>&nbsp;exec.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp;6 &#43;&=
#43;&#43;&#43;--</div>
<div>&nbsp;memory_ldst.inc.c | 18 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&=
#43;---------</div>
<div>&nbsp;2 files changed, 13 insertions(&#43;), 11 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/exec.c b/exec.c</div>
<div>index 3e78de3..5013864 100644</div>
<div>--- a/exec.c</div>
<div>&#43;&#43;&#43; b/exec.c</div>
<div>@@ -3334,7 &#43;3334,8 @@ static MemTxResult flatview_write_continue(F=
latView *fv, hwaddr addr,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* XXX: could force cu=
rrent_cpu to NULL to avoid</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; potential bugs=
 */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D ldn_p(buf, l);=
</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;result |=3D memory_region_d=
ispatch_write(mr, addr1, val, l, attrs);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;result |=3D memory_regi=
on_dispatch_write(mr, addr1, val,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; SIZE_MEMOP(l), attrs);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* RAM case */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ptr =3D qemu_ram_ptr_l=
ength(mr-&gt;ram_block, addr1, &amp;l, false);</div>
<div>@@ -3395,7 &#43;3396,8 @@ MemTxResult flatview_read_continue(FlatView =
*fv, hwaddr addr,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* I/O case */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;release_lock |=3D prep=
are_mmio_access(mr);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;l =3D memory_access_si=
ze(mr, l, addr1);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;result |=3D memory_region_d=
ispatch_read(mr, addr1, &amp;val, l, attrs);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;result |=3D memory_regi=
on_dispatch_read(mr, addr1, &amp;val,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;SIZE_MEMOP(l), attrs);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;stn_p(buf, l, val);</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* RAM case */</div>
<div>diff --git a/memory_ldst.inc.c b/memory_ldst.inc.c</div>
<div>index acf865b..e073cf9 100644</div>
<div>--- a/memory_ldst.inc.c</div>
<div>&#43;&#43;&#43; b/memory_ldst.inc.c</div>
<div>@@ -38,7 &#43;38,7 @@ static inline uint32_t glue(address_space_ldl_in=
ternal, SUFFIX)(ARG1_DECL,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;release_lock |=3D prepare_mmio_acces=
s(mr);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* I/O case */</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_read(mr, add=
r1, &amp;val, 4, attrs);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_read(mr,=
 addr1, &amp;val, SIZE_MEMOP(4), attrs);</div>
<div>&nbsp;#if defined(TARGET_WORDS_BIGENDIAN)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (endian =3D=3D DEVICE_LITTLE_ENDI=
AN) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D bswap32(val);<=
/div>
<div>@@ -114,7 &#43;114,7 @@ static inline uint64_t glue(address_space_ldq_=
internal, SUFFIX)(ARG1_DECL,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;release_lock |=3D prepare_mmio_acces=
s(mr);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* I/O case */</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_read(mr, add=
r1, &amp;val, 8, attrs);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_read(mr,=
 addr1, &amp;val, SIZE_MEMOP(8), attrs);</div>
<div>&nbsp;#if defined(TARGET_WORDS_BIGENDIAN)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (endian =3D=3D DEVICE_LITTLE_ENDI=
AN) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D bswap64(val);<=
/div>
<div>@@ -188,7 &#43;188,7 @@ uint32_t glue(address_space_ldub, SUFFIX)(ARG1=
_DECL,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;release_lock |=3D prepare_mmio_acces=
s(mr);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* I/O case */</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_read(mr, add=
r1, &amp;val, 1, attrs);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_read(mr,=
 addr1, &amp;val, SIZE_MEMOP(1), attrs);</div>
<div>&nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* RAM case */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ptr =3D qemu_map_ram_ptr(mr-&gt;ram_=
block, addr1);</div>
<div>@@ -224,7 &#43;224,7 @@ static inline uint32_t glue(address_space_lduw=
_internal, SUFFIX)(ARG1_DECL,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;release_lock |=3D prepare_mmio_acces=
s(mr);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* I/O case */</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_read(mr, add=
r1, &amp;val, 2, attrs);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_read(mr,=
 addr1, &amp;val, SIZE_MEMOP(2), attrs);</div>
<div>&nbsp;#if defined(TARGET_WORDS_BIGENDIAN)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (endian =3D=3D DEVICE_LITTLE_ENDI=
AN) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D bswap16(val);<=
/div>
<div>@@ -300,7 &#43;300,7 @@ void glue(address_space_stl_notdirty, SUFFIX)(=
ARG1_DECL,</div>
<div>&nbsp; &nbsp; &nbsp;if (l &lt; 4 || !memory_access_is_direct(mr, true)=
) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;release_lock |=3D prepare_mmio_acces=
s(mr);</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_write(mr, ad=
dr1, val, 4, attrs);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_write(mr=
, addr1, val, SIZE_MEMOP(4), attrs);</div>
<div>&nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ptr =3D qemu_map_ram_ptr(mr-&gt;ram_=
block, addr1);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;stl_p(ptr, val);</div>
<div>@@ -346,7 &#43;346,7 @@ static inline void glue(address_space_stl_inte=
rnal, SUFFIX)(ARG1_DECL,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D bswap32(val);<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;#endif</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_write(mr, ad=
dr1, val, 4, attrs);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_write(mr=
, addr1, val, SIZE_MEMOP(4), attrs);</div>
<div>&nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* RAM case */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ptr =3D qemu_map_ram_ptr(mr-&gt;ram_=
block, addr1);</div>
<div>@@ -408,7 &#43;408,7 @@ void glue(address_space_stb, SUFFIX)(ARG1_DECL=
,</div>
<div>&nbsp; &nbsp; &nbsp;mr =3D TRANSLATE(addr, &amp;addr1, &amp;l, true, a=
ttrs);</div>
<div>&nbsp; &nbsp; &nbsp;if (!memory_access_is_direct(mr, true)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;release_lock |=3D prepare_mmio_acces=
s(mr);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_write(mr, ad=
dr1, val, 1, attrs);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_write(mr=
, addr1, val, SIZE_MEMOP(1), attrs);</div>
<div>&nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* RAM case */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ptr =3D qemu_map_ram_ptr(mr-&gt;ram_=
block, addr1);</div>
<div>@@ -451,7 &#43;451,7 @@ static inline void glue(address_space_stw_inte=
rnal, SUFFIX)(ARG1_DECL,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D bswap16(val);<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;#endif</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_write(mr, ad=
dr1, val, 2, attrs);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_write(mr=
, addr1, val, SIZE_MEMOP(2), attrs);</div>
<div>&nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* RAM case */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ptr =3D qemu_map_ram_ptr(mr-&gt;ram_=
block, addr1);</div>
<div>@@ -524,7 &#43;524,7 @@ static void glue(address_space_stq_internal, S=
UFFIX)(ARG1_DECL,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D bswap64(val);<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;#endif</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_write(mr, ad=
dr1, val, 8, attrs);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_write(mr=
, addr1, val, SIZE_MEMOP(8), attrs);</div>
<div>&nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* RAM case */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ptr =3D qemu_map_ram_ptr(mr-&gt;ram_=
block, addr1);</div>
<div>--&nbsp;</div>
<div>1.8.3.1</div>
<div><br>
<br>
</div>
<p><br>
</p>
</body>
</html>

--_000_156381056119116853btcom_--
