Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp10275727wrv;
        Thu, 25 Jul 2019 00:11:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwPzru9ggy5RalhKkL+2uOIVVtm4xKXFDxBl0Qkkdtb7V9wqSylc+IJeeq9IO/XX+UWopmO
X-Received: by 2002:a50:b34a:: with SMTP id r10mr74805318edd.84.1564038684745;
        Thu, 25 Jul 2019 00:11:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564038684; cv=none;
        d=google.com; s=arc-20160816;
        b=VOFfDsghMvyHI/GTYDbVpHTPOxsnUXE655+DJqyciL81pfcM7X82X72tEjLpJbK46V
         WAuyVjC2uBHU9Df2i56MgPP4ZEqA2jB4C5vrdBmST3N2MGBU8g4TFe+oehH5HK3CFru6
         Bi7PnVKG2hBMnICvsKPeuQfYUVU+jJL9K5Up0xwYfPhLa29MNzL3TZeHynwR1e9v7ai5
         F7hD3WMtbozLHP1MYYkjY1ek4cIQGZ7kXN9bOVr3DMN6WoVy6VAGhqgQPbmSxhEuEREe
         ED2CRAIdEEAhnhFKftaqV6Z6qu0RbiJ51gVXS47KuX89sldvJVgatApFuFzL3olhoc4t
         IX7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:to:from;
        bh=POX28RjwOah+3WoGTujIPCwjp5Zb2pAngXs4aINN+C8=;
        b=uZjGqYwH7p7Wx8pkbghnZICXkJKMvtrbePp4Pch7AGq1uaeeFdJ9NXdsgIfGUe+HwP
         TW+abNRZzocS44LqpNMc3iNmFnp/qhhPDWXy3Fo6vrbCZVxCUTz/8ifzkR1adkf20KWG
         ouXvlSWSyUvzs2Ffgqc8XY5OrKDQ3Lr3bsTFmnr62vSEZztZZrdalAI+DCXz1kKGbt/3
         aSrWUlXk4uw/JriekONgaF+RVNmIcvzI7e2GYOB2nsgpSVzCJvYd+NMHyvw9Tnt03Rlh
         miQ0LddFs71wB+zdib1vr0vM1PzQCwXET9sYmvGiDj+p04zeWCkjYdjL44dQokU3puP8
         wbqw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h14si8856485ejx.140.2019.07.25.00.11.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jul 2019 00:11:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Received: from localhost ([::1]:56380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hqXuN-00010Z-Qi
	for alex.bennee@linaro.org; Thu, 25 Jul 2019 03:11:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54029)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tony.nguyen@bt.com>) id 1hqXuJ-0000tm-QB
 for qemu-arm@nongnu.org; Thu, 25 Jul 2019 03:11:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hqXuI-0004lo-Iv
 for qemu-arm@nongnu.org; Thu, 25 Jul 2019 03:11:19 -0400
Received: from smtpe1.intersmtp.com ([62.239.224.235]:1901)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hqXuD-0004dA-Jq; Thu, 25 Jul 2019 03:11:13 -0400
Received: from tpw09926dag18f.domain1.systemhost.net (10.9.212.26) by
 RDW083A011ED67.bt.com (10.187.98.37) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Thu, 25 Jul 2019 08:16:19 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18f.domain1.systemhost.net (10.9.212.26) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Thu, 25 Jul 2019 08:11:11 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Thu, 25 Jul
 2019 08:11:11 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v3 13/15] cputlb: Byte swap memory
 transaction attribute
Thread-Index: AQHVQrgj3lFqGc7qHUC7G4brIcZ9XQ==
Date: Thu, 25 Jul 2019 07:11:11 +0000
Message-ID: <1564038671025.43293@bt.com>
References: <e9c6e5310b1a4863be45d45bf087fc3d@tpw09926dag18e.domain1.systemhost.net>, 
 <1563810716254.18886@bt.com>,<1564038073754.91133@bt.com>
In-Reply-To: <1564038073754.91133@bt.com>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.42]
Content-Type: multipart/alternative; boundary="_000_156403867102543293btcom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 62.239.224.235
Subject: [Qemu-arm] [Qemu-devel] [PATCH v3 13/15] cputlb: Byte swap memory
 transaction attribute
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
 ehabkost@redhat.com, sw@weilnetz.de, alex.williamson@redhat.com,
 qemu-arm@nongnu.org, david@gibson.dropbear.id.au, qemu-riscv@nongnu.org,
 cohuck@redhat.com, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 amarkovic@wavecomp.com, pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gd16spXYZqEO

--_000_156403867102543293btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Notice new attribute, byte swap, and force the transaction through the
memory slow path.

Required by architectures that can invert endianness of memory
transaction, e.g. SPARC64 has the Invert Endian TTE bit.

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
---
 accel/tcg/cputlb.c      | 11 +++++++++++
 include/exec/memattrs.h |  2 ++
 2 files changed, 13 insertions(+)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index e61b1eb..f292a87 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -738,6 +738,9 @@ void tlb_set_page_with_attrs(CPUState *cpu, target_ulon=
g vaddr,
          */
         address |=3D TLB_RECHECK;
     }
+    if (attrs.byte_swap) {
+        address |=3D TLB_FORCE_SLOW;
+    }
     if (!memory_region_is_ram(section->mr) &&
         !memory_region_is_romd(section->mr)) {
         /* IO memory case */
@@ -891,6 +894,10 @@ static uint64_t io_readx(CPUArchState *env, CPUIOTLBEn=
try *iotlbentry,
     bool locked =3D false;
     MemTxResult r;

+    if (iotlbentry->attrs.byte_swap) {
+        op ^=3D MO_BSWAP;
+    }
+
     section =3D iotlb_to_section(cpu, iotlbentry->addr, iotlbentry->attrs)=
;
     mr =3D section->mr;
     mr_offset =3D (iotlbentry->addr & TARGET_PAGE_MASK) + addr;
@@ -933,6 +940,10 @@ static void io_writex(CPUArchState *env, CPUIOTLBEntry=
 *iotlbentry,
     bool locked =3D false;
     MemTxResult r;

+    if (iotlbentry->attrs.byte_swap) {
+        op ^=3D MO_BSWAP;
+    }
+
     section =3D iotlb_to_section(cpu, iotlbentry->addr, iotlbentry->attrs)=
;
     mr =3D section->mr;
     mr_offset =3D (iotlbentry->addr & TARGET_PAGE_MASK) + addr;
diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
index d4a3477..a0644eb 100644
--- a/include/exec/memattrs.h
+++ b/include/exec/memattrs.h
@@ -37,6 +37,8 @@ typedef struct MemTxAttrs {
     unsigned int user:1;
     /* Requester ID (for MSI for example) */
     unsigned int requester_id:16;
+    /* SPARC64: TTE invert endianness */
+    unsigned int byte_swap:1;
     /*
      * The following are target-specific page-table bits.  These are not
      * related to actual memory transactions at all.  However, this struct=
ure
--
1.8.3.1




--_000_156403867102543293btcom_
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
<div><span style=3D"font-size: 12pt;">Notice new attribute, byte swap, and =
force the transaction through the</span><br>
</div>
<div>memory slow path.</div>
<div><br>
</div>
<div>Required by architectures that can invert endianness of memory</div>
<div>transaction, e.g. SPARC64 has the Invert Endian TTE bit.</div>
<div><br>
</div>
<div>Signed-off-by: Tony Nguyen &lt;tony.nguyen@bt.com&gt;</div>
<div>---</div>
<div>&nbsp;accel/tcg/cputlb.c &nbsp; &nbsp; &nbsp;| 11 &#43;&#43;&#43;&#43;=
&#43;&#43;&#43;&#43;&#43;&#43;&#43;</div>
<div>&nbsp;include/exec/memattrs.h | &nbsp;2 &#43;&#43;</div>
<div>&nbsp;2 files changed, 13 insertions(&#43;)</div>
<div><br>
</div>
<div>diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c</div>
<div>index e61b1eb..f292a87 100644</div>
<div>--- a/accel/tcg/cputlb.c</div>
<div>&#43;&#43;&#43; b/accel/tcg/cputlb.c</div>
<div>@@ -738,6 &#43;738,9 @@ void tlb_set_page_with_attrs(CPUState *cpu, ta=
rget_ulong vaddr,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;address |=3D TLB_RECHECK;</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&#43; &nbsp; &nbsp;if (attrs.byte_swap) {</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;address |=3D TLB_FORCE_SLOW;</div>
<div>&#43; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp;if (!memory_region_is_ram(section-&gt;mr) &amp;&am=
p;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;!memory_region_is_romd(section-&gt;m=
r)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* IO memory case */</div>
<div>@@ -891,6 &#43;894,10 @@ static uint64_t io_readx(CPUArchState *env, C=
PUIOTLBEntry *iotlbentry,</div>
<div>&nbsp; &nbsp; &nbsp;bool locked =3D false;</div>
<div>&nbsp; &nbsp; &nbsp;MemTxResult r;</div>
<div>&nbsp;</div>
<div>&#43; &nbsp; &nbsp;if (iotlbentry-&gt;attrs.byte_swap) {</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;op ^=3D MO_BSWAP;</div>
<div>&#43; &nbsp; &nbsp;}</div>
<div>&#43;</div>
<div>&nbsp; &nbsp; &nbsp;section =3D iotlb_to_section(cpu, iotlbentry-&gt;a=
ddr, iotlbentry-&gt;attrs);</div>
<div>&nbsp; &nbsp; &nbsp;mr =3D section-&gt;mr;</div>
<div>&nbsp; &nbsp; &nbsp;mr_offset =3D (iotlbentry-&gt;addr &amp; TARGET_PA=
GE_MASK) &#43; addr;</div>
<div>@@ -933,6 &#43;940,10 @@ static void io_writex(CPUArchState *env, CPUI=
OTLBEntry *iotlbentry,</div>
<div>&nbsp; &nbsp; &nbsp;bool locked =3D false;</div>
<div>&nbsp; &nbsp; &nbsp;MemTxResult r;</div>
<div>&nbsp;</div>
<div>&#43; &nbsp; &nbsp;if (iotlbentry-&gt;attrs.byte_swap) {</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;op ^=3D MO_BSWAP;</div>
<div>&#43; &nbsp; &nbsp;}</div>
<div>&#43;</div>
<div>&nbsp; &nbsp; &nbsp;section =3D iotlb_to_section(cpu, iotlbentry-&gt;a=
ddr, iotlbentry-&gt;attrs);</div>
<div>&nbsp; &nbsp; &nbsp;mr =3D section-&gt;mr;</div>
<div>&nbsp; &nbsp; &nbsp;mr_offset =3D (iotlbentry-&gt;addr &amp; TARGET_PA=
GE_MASK) &#43; addr;</div>
<div>diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h</div>
<div>index d4a3477..a0644eb 100644</div>
<div>--- a/include/exec/memattrs.h</div>
<div>&#43;&#43;&#43; b/include/exec/memattrs.h</div>
<div>@@ -37,6 &#43;37,8 @@ typedef struct MemTxAttrs {</div>
<div>&nbsp; &nbsp; &nbsp;unsigned int user:1;</div>
<div>&nbsp; &nbsp; &nbsp;/* Requester ID (for MSI for example) */</div>
<div>&nbsp; &nbsp; &nbsp;unsigned int requester_id:16;</div>
<div>&#43; &nbsp; &nbsp;/* SPARC64: TTE invert endianness */</div>
<div>&#43; &nbsp; &nbsp;unsigned int byte_swap:1;</div>
<div>&nbsp; &nbsp; &nbsp;/*</div>
<div>&nbsp; &nbsp; &nbsp; * The following are target-specific page-table bi=
ts. &nbsp;These are not</div>
<div>&nbsp; &nbsp; &nbsp; * related to actual memory transactions at all. &=
nbsp;However, this structure</div>
<div>--&nbsp;</div>
<div>1.8.3.1</div>
<div><br>
<br>
</div>
<p><br>
</p>
</body>
</html>

--_000_156403867102543293btcom_--
