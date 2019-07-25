Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp10426111wrv;
        Thu, 25 Jul 2019 02:57:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyuehAgTwTS56wkO7QAFkOKX0UH2Y8ON4kFJ40tDWhpxOW8R2dqUbzcoV2SquehhNTQvvDF
X-Received: by 2002:a50:ac07:: with SMTP id v7mr76223461edc.205.1564048674280;
        Thu, 25 Jul 2019 02:57:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564048674; cv=none;
        d=google.com; s=arc-20160816;
        b=ADXHciU/QJbmH+Xoh1gb6bamP96xLSpg1meE+c7a1vJlzsAJw/3LH6aL11xBZIYDkE
         gBp6mRX87bU4Mz279I5+Lp/1EerHNU2TB8xxt4SwZUh2VhQrGajeKJ376Tn//Ksz2N1N
         1De+lhrOTAUbKXmPsS7ftT7RjU0vQFb4cpQHfVAlvX3053DisfyA27Do+VoMj4rfEJNe
         +SwHiCIa2zjjd6o8aC+kn1TMQZP3TePINVduqUOeqMbQnAl3DMaGNDrShGyPgGAxSHW8
         BAUTQSvGIHuthl5veqmGOCH/3q9Zo68OsOOZkKHoSdQSX7asOq/oCoeiwW47GcAZLvq3
         O8Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:to:from;
        bh=2ASRPxvMjLfhatAhF7hvGnlbWUJq1TBTSeaUdLAlAaU=;
        b=xUFxzcHDkNVyk686XnK6dSHaLPKDFnVYvKgZLiWtw/46BCu6j5G/3VlKTquL0VwalA
         UdYl0z2MmkqRlpTP4X/h1wgjD74NG/DMv6JKfc0hpwVV5H+NFCq158dqR4IVKuUcgR7B
         v6EvOOlbumLTMoVJJsIsA059fRNi5a5AL7w7xPkgy+AFoIJe6bti/HaN7xs7GHd1GJ87
         5hIQKToH/qzFb1OLKvK7FaT7JpmaewHDr5aqi/vHvBBNQ7r1nOl+X6dok6mNto4rvoRU
         1cOXpHypeiZAdIJrmfhcVTLpFx7cgrlxRFn45whRJdhO2aF6GBoLinG49bjoTFdF0Lfa
         2MOw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 47si11459827edu.294.2019.07.25.02.57.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jul 2019 02:57:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Received: from localhost ([::1]:58010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hqaVV-0003Q0-BF
	for alex.bennee@linaro.org; Thu, 25 Jul 2019 05:57:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46411)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tony.nguyen@bt.com>) id 1hqaVR-0003Pu-2o
 for qemu-arm@nongnu.org; Thu, 25 Jul 2019 05:57:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hqaVP-0002J0-F1
 for qemu-arm@nongnu.org; Thu, 25 Jul 2019 05:57:49 -0400
Received: from smtpe1.intersmtp.com ([213.121.35.73]:25347)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hqaVE-00028U-8O; Thu, 25 Jul 2019 05:57:36 -0400
Received: from tpw09926dag18h.domain1.systemhost.net (10.9.212.42) by
 BWP09926078.bt.com (10.36.82.109) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Thu, 25
 Jul 2019 10:57:30 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18h.domain1.systemhost.net (10.9.212.42) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Thu, 25 Jul 2019 10:57:33 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Thu, 25 Jul
 2019 10:57:33 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v4 14/15] target/sparc: Add TLB entry with
 attributes
Thread-Index: AQHVQs9hBFfZMu5Us0GGh3/qvweb5w==
Date: Thu, 25 Jul 2019 09:57:33 +0000
Message-ID: <1564048653059.38024@bt.com>
References: <45d1ebe4b2ed4c039c9da20a738652df@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <45d1ebe4b2ed4c039c9da20a738652df@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.42]
Content-Type: multipart/alternative; boundary="_000_156404865305938024btcom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 213.121.35.73
Subject: [Qemu-arm] [Qemu-devel] [PATCH v4 14/15] target/sparc: Add TLB
 entry with attributes
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
 david@redhat.com, palmer@sifive.com, mark.cave-ayland@ilande.co.uk,
 laurent@vivier.eu, Alistair.Francis@wdc.com, arikalo@wavecomp.com,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, rth@twiddle.net,
 atar4qemu@gmail.com, ehabkost@redhat.com, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, stefanha@redhat.com, shorne@gmail.com,
 david@gibson.dropbear.id.au, qemu-riscv@nongnu.org,
 kbastian@mail.uni-paderborn.de, cohuck@redhat.com, alex.williamson@redhat.com,
 qemu-ppc@nongnu.org, amarkovic@wavecomp.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: u6fT5zUM9E/z

--_000_156404865305938024btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Append MemTxAttrs to interfaces so we can pass along up coming Invert
Endian TTE bit on SPARC64.

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
---
 target/sparc/mmu_helper.c | 32 ++++++++++++++++++--------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/target/sparc/mmu_helper.c b/target/sparc/mmu_helper.c
index cbd1e91..826e14b 100644
--- a/target/sparc/mmu_helper.c
+++ b/target/sparc/mmu_helper.c
@@ -88,7 +88,7 @@ static const int perm_table[2][8] =3D {
 };

 static int get_physical_address(CPUSPARCState *env, hwaddr *physical,
-                                int *prot, int *access_index,
+                                int *prot, int *access_index, MemTxAttrs *=
attrs,
                                 target_ulong address, int rw, int mmu_idx,
                                 target_ulong *page_size)
 {
@@ -219,6 +219,7 @@ bool sparc_cpu_tlb_fill(CPUState *cs, vaddr address, in=
t size,
     target_ulong vaddr;
     target_ulong page_size;
     int error_code =3D 0, prot, access_index;
+    MemTxAttrs attrs =3D {};

     /*
      * TODO: If we ever need tlb_vaddr_to_host for this target,
@@ -229,7 +230,7 @@ bool sparc_cpu_tlb_fill(CPUState *cs, vaddr address, in=
t size,
     assert(!probe);

     address &=3D TARGET_PAGE_MASK;
-    error_code =3D get_physical_address(env, &paddr, &prot, &access_index,
+    error_code =3D get_physical_address(env, &paddr, &prot, &access_index,=
 &attrs,
                                       address, access_type,
                                       mmu_idx, &page_size);
     vaddr =3D address;
@@ -490,8 +491,8 @@ static inline int ultrasparc_tag_match(SparcTLBEntry *t=
lb,
     return 0;
 }

-static int get_physical_address_data(CPUSPARCState *env,
-                                     hwaddr *physical, int *prot,
+static int get_physical_address_data(CPUSPARCState *env, hwaddr *physical,
+                                     int *prot, MemTxAttrs *attrs,
                                      target_ulong address, int rw, int mmu=
_idx)
 {
     CPUState *cs =3D env_cpu(env);
@@ -608,8 +609,8 @@ static int get_physical_address_data(CPUSPARCState *env=
,
     return 1;
 }

-static int get_physical_address_code(CPUSPARCState *env,
-                                     hwaddr *physical, int *prot,
+static int get_physical_address_code(CPUSPARCState *env, hwaddr *physical,
+                                     int *prot, MemTxAttrs *attrs,
                                      target_ulong address, int mmu_idx)
 {
     CPUState *cs =3D env_cpu(env);
@@ -686,7 +687,7 @@ static int get_physical_address_code(CPUSPARCState *env=
,
 }

 static int get_physical_address(CPUSPARCState *env, hwaddr *physical,
-                                int *prot, int *access_index,
+                                int *prot, int *access_index, MemTxAttrs *=
attrs,
                                 target_ulong address, int rw, int mmu_idx,
                                 target_ulong *page_size)
 {
@@ -716,11 +717,11 @@ static int get_physical_address(CPUSPARCState *env, h=
waddr *physical,
     }

     if (rw =3D=3D 2) {
-        return get_physical_address_code(env, physical, prot, address,
+        return get_physical_address_code(env, physical, prot, attrs, addre=
ss,
                                          mmu_idx);
     } else {
-        return get_physical_address_data(env, physical, prot, address, rw,
-                                         mmu_idx);
+        return get_physical_address_data(env, physical, prot, attrs, addre=
ss,
+                                         rw, mmu_idx);
     }
 }

@@ -734,10 +735,11 @@ bool sparc_cpu_tlb_fill(CPUState *cs, vaddr address, =
int size,
     target_ulong vaddr;
     hwaddr paddr;
     target_ulong page_size;
+    MemTxAttrs attrs =3D {};
     int error_code =3D 0, prot, access_index;

     address &=3D TARGET_PAGE_MASK;
-    error_code =3D get_physical_address(env, &paddr, &prot, &access_index,
+    error_code =3D get_physical_address(env, &paddr, &prot, &access_index,=
 &attrs,
                                       address, access_type,
                                       mmu_idx, &page_size);
     if (likely(error_code =3D=3D 0)) {
@@ -747,7 +749,8 @@ bool sparc_cpu_tlb_fill(CPUState *cs, vaddr address, in=
t size,
                                    env->dmmu.mmu_primary_context,
                                    env->dmmu.mmu_secondary_context);

-        tlb_set_page(cs, vaddr, paddr, prot, mmu_idx, page_size);
+        tlb_set_page_with_attrs(cs, vaddr, paddr, attrs, prot, mmu_idx,
+                                page_size);
         return true;
     }
     if (probe) {
@@ -849,9 +852,10 @@ static int cpu_sparc_get_phys_page(CPUSPARCState *env,=
 hwaddr *phys,
 {
     target_ulong page_size;
     int prot, access_index;
+    MemTxAttrs attrs =3D {};

-    return get_physical_address(env, phys, &prot, &access_index, addr, rw,
-                                mmu_idx, &page_size);
+    return get_physical_address(env, phys, &prot, &access_index, &attrs, a=
ddr,
+                                rw, mmu_idx, &page_size);
 }

 #if defined(TARGET_SPARC64)
--
1.8.3.1




--_000_156404865305938024btcom_
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
<div><span style=3D"font-size: 12pt;">Append MemTxAttrs to interfaces so we=
 can pass along up coming Invert</span><br>
</div>
<div>Endian TTE bit on SPARC64.</div>
<div><br>
</div>
<div>Signed-off-by: Tony Nguyen &lt;tony.nguyen@bt.com&gt;</div>
<div>---</div>
<div>&nbsp;target/sparc/mmu_helper.c | 32 &#43;&#43;&#43;&#43;&#43;&#43;&#4=
3;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;--------------</di=
v>
<div>&nbsp;1 file changed, 18 insertions(&#43;), 14 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/target/sparc/mmu_helper.c b/target/sparc/mmu_helper.c</di=
v>
<div>index cbd1e91..826e14b 100644</div>
<div>--- a/target/sparc/mmu_helper.c</div>
<div>&#43;&#43;&#43; b/target/sparc/mmu_helper.c</div>
<div>@@ -88,7 &#43;88,7 @@ static const int perm_table[2][8] =3D {</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static int get_physical_address(CPUSPARCState *env, hwaddr *phys=
ical,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;int *prot, int *access_index,</d=
iv>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;int *prot, int *access_index=
, MemTxAttrs *attrs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;target_ulong address, int r=
w, int mmu_idx,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;target_ulong *page_size)</d=
iv>
<div>&nbsp;{</div>
<div>@@ -219,6 &#43;219,7 @@ bool sparc_cpu_tlb_fill(CPUState *cs, vaddr ad=
dress, int size,</div>
<div>&nbsp; &nbsp; &nbsp;target_ulong vaddr;</div>
<div>&nbsp; &nbsp; &nbsp;target_ulong page_size;</div>
<div>&nbsp; &nbsp; &nbsp;int error_code =3D 0, prot, access_index;</div>
<div>&#43; &nbsp; &nbsp;MemTxAttrs attrs =3D {};</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;/*</div>
<div>&nbsp; &nbsp; &nbsp; * TODO: If we ever need tlb_vaddr_to_host for thi=
s target,</div>
<div>@@ -229,7 &#43;230,7 @@ bool sparc_cpu_tlb_fill(CPUState *cs, vaddr ad=
dress, int size,</div>
<div>&nbsp; &nbsp; &nbsp;assert(!probe);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;address &amp;=3D TARGET_PAGE_MASK;</div>
<div>- &nbsp; &nbsp;error_code =3D get_physical_address(env, &amp;paddr, &a=
mp;prot, &amp;access_index,</div>
<div>&#43; &nbsp; &nbsp;error_code =3D get_physical_address(env, &amp;paddr=
, &amp;prot, &amp;access_index, &amp;attrs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;addres=
s, access_type,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;mmu_id=
x, &amp;page_size);</div>
<div>&nbsp; &nbsp; &nbsp;vaddr =3D address;</div>
<div>@@ -490,8 &#43;491,8 @@ static inline int ultrasparc_tag_match(SparcTL=
BEntry *tlb,</div>
<div>&nbsp; &nbsp; &nbsp;return 0;</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>-static int get_physical_address_data(CPUSPARCState *env,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; hwaddr *physical,=
 int *prot,</div>
<div>&#43;static int get_physical_address_data(CPUSPARCState *env, hwaddr *=
physical,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; int *prot, Me=
mTxAttrs *attrs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; target_ulong=
 address, int rw, int mmu_idx)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;CPUState *cs =3D env_cpu(env);</div>
<div>@@ -608,8 &#43;609,8 @@ static int get_physical_address_data(CPUSPARCS=
tate *env,</div>
<div>&nbsp; &nbsp; &nbsp;return 1;</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>-static int get_physical_address_code(CPUSPARCState *env,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; hwaddr *physical,=
 int *prot,</div>
<div>&#43;static int get_physical_address_code(CPUSPARCState *env, hwaddr *=
physical,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; int *prot, Me=
mTxAttrs *attrs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; target_ulong=
 address, int mmu_idx)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;CPUState *cs =3D env_cpu(env);</div>
<div>@@ -686,7 &#43;687,7 @@ static int get_physical_address_code(CPUSPARCS=
tate *env,</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;static int get_physical_address(CPUSPARCState *env, hwaddr *phys=
ical,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;int *prot, int *access_index,</d=
iv>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;int *prot, int *access_index=
, MemTxAttrs *attrs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;target_ulong address, int r=
w, int mmu_idx,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;target_ulong *page_size)</d=
iv>
<div>&nbsp;{</div>
<div>@@ -716,11 &#43;717,11 @@ static int get_physical_address(CPUSPARCStat=
e *env, hwaddr *physical,</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;if (rw =3D=3D 2) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;return get_physical_address_code(env, phy=
sical, prot, address,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;return get_physical_address_code(env,=
 physical, prot, attrs, address,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; mmu_idx);</div>
<div>&nbsp; &nbsp; &nbsp;} else {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;return get_physical_address_data(env, phy=
sical, prot, address, rw,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; mmu=
_idx);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;return get_physical_address_data(env,=
 physical, prot, attrs, address,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 rw, mmu_idx);</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>@@ -734,10 &#43;735,11 @@ bool sparc_cpu_tlb_fill(CPUState *cs, vaddr =
address, int size,</div>
<div>&nbsp; &nbsp; &nbsp;target_ulong vaddr;</div>
<div>&nbsp; &nbsp; &nbsp;hwaddr paddr;</div>
<div>&nbsp; &nbsp; &nbsp;target_ulong page_size;</div>
<div>&#43; &nbsp; &nbsp;MemTxAttrs attrs =3D {};</div>
<div>&nbsp; &nbsp; &nbsp;int error_code =3D 0, prot, access_index;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;address &amp;=3D TARGET_PAGE_MASK;</div>
<div>- &nbsp; &nbsp;error_code =3D get_physical_address(env, &amp;paddr, &a=
mp;prot, &amp;access_index,</div>
<div>&#43; &nbsp; &nbsp;error_code =3D get_physical_address(env, &amp;paddr=
, &amp;prot, &amp;access_index, &amp;attrs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;addres=
s, access_type,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;mmu_id=
x, &amp;page_size);</div>
<div>&nbsp; &nbsp; &nbsp;if (likely(error_code =3D=3D 0)) {</div>
<div>@@ -747,7 &#43;749,8 @@ bool sparc_cpu_tlb_fill(CPUState *cs, vaddr ad=
dress, int size,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; env-&gt;dmmu.mmu_pr=
imary_context,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; env-&gt;dmmu.mmu_se=
condary_context);</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;tlb_set_page(cs, vaddr, paddr, prot, mmu_=
idx, page_size);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;tlb_set_page_with_attrs(cs, vaddr, pa=
ddr, attrs, prot, mmu_idx,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;page_size);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return true;</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp;if (probe) {</div>
<div>@@ -849,9 &#43;852,10 @@ static int cpu_sparc_get_phys_page(CPUSPARCSt=
ate *env, hwaddr *phys,</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;target_ulong page_size;</div>
<div>&nbsp; &nbsp; &nbsp;int prot, access_index;</div>
<div>&#43; &nbsp; &nbsp;MemTxAttrs attrs =3D {};</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp;return get_physical_address(env, phys, &amp;prot, &amp;=
access_index, addr, rw,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;mmu_idx, &amp;page_size);</div>
<div>&#43; &nbsp; &nbsp;return get_physical_address(env, phys, &amp;prot, &=
amp;access_index, &amp;attrs, addr,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;rw, mmu_idx, &amp;page_size)=
;</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;#if defined(TARGET_SPARC64)</div>
<div>--&nbsp;</div>
<div>1.8.3.1</div>
<div><br>
<br>
</div>
<p><br>
</p>
</body>
</html>

--_000_156404865305938024btcom_--
