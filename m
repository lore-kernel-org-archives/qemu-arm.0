Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp11520837wrv;
        Thu, 25 Jul 2019 23:49:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyVvSsg4Z5O92lT3QHbqq5jb0XlVzkj7X03d4emZIJ5tl6rr01CLcUho0nYDX+Ll5IJiA9N
X-Received: by 2002:a17:906:c802:: with SMTP id cx2mr61554826ejb.114.1564123794278;
        Thu, 25 Jul 2019 23:49:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564123794; cv=none;
        d=google.com; s=arc-20160816;
        b=sbmWvRqqcuP6IsibNmTdd4YiZgzGHKG9PZY8NcttfY81hXbarv553reM8Vu6O1X/Gg
         xGDSatDCX71zutGH+C+5WtFWvf8iEboNBJ/9gCtXL+6MeoNHHHil/QH1VOTFpjpc7C7B
         xGpF90iTmz/3IpRZ5hGli2imvTVhl5I5IwSkUcV6u466F/4K5wNCdl9P9kVcFiUZhk3+
         Oa/QeaYaJ96dR2Wj6Y0dFlZYgi4mU/dwM7V7LLsDxGC+NA0fgtXj3eE91E/znqIFjXXH
         xn6wbnw9OjGrPJ5M9GXOfJDNHEK4claGdqz9qt0q70uDIg+ixgXlbGgNbgaONmSH+0ny
         J87g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:to:from;
        bh=w9KDinuvfVEotgmoL0bcV8JKCCKXFX8COO16dNLR9ig=;
        b=TiWQ05xo1gmdH9AsXIIy1YaXJua0E+nwE+w0tjAis/ldyDHa+sQgTDT7FeI/xaEi96
         z1Ju34PnR5gFXljipPh3fMrbFuEl9qCpfEe+r0v4ho8I7aXOdYPYh3qW12MpdRq2BaYz
         Klz47HMgct70e3YLmdCnQNNgHrXYaDaQ/6T4DXpi4fpISZf0kYmasGzmOGcr5QlcLHkA
         2yKpLlq3PJ70yS0mjQyO0/SIYxRqJtpLEsHlX9dc+WOE0Tq0Kf2Am/N+eO7rGb22osmq
         F9TgI6pAMmP7uBXBeoWHMYt+iPjS5x6TXK49GHTxmrS3I7i+/Ccfd0QqXiDlqfaZ0KpU
         XrPg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s41si11583564edd.252.2019.07.25.23.49.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jul 2019 23:49:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Received: from localhost ([::1]:36810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hqu33-0001C9-Sy
	for alex.bennee@linaro.org; Fri, 26 Jul 2019 02:49:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35149)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tony.nguyen@bt.com>) id 1hqu2q-0000fJ-G4
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 02:49:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hqu2n-0000T0-WB
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 02:49:36 -0400
Received: from smtpe1.intersmtp.com ([62.239.224.234]:31151)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hqu2f-00087t-Ql; Fri, 26 Jul 2019 02:49:26 -0400
Received: from tpw09926dag18g.domain1.systemhost.net (10.9.212.34) by
 RDW083A012ED68.bt.com (10.187.98.38) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Fri, 26 Jul 2019 07:48:41 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18g.domain1.systemhost.net (10.9.212.34) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Fri, 26 Jul 2019 07:49:19 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Fri, 26 Jul
 2019 07:49:19 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v5 15/15] target/sparc: sun4u Invert Endian
 TTE bit
Thread-Index: AQHVQ34/izZ9UnNjhk+VqYg3zB4dlw==
Date: Fri, 26 Jul 2019 06:49:19 +0000
Message-ID: <1564123758372.45776@bt.com>
References: <3106a3c959c4498fad13a5799c89ba7b@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <3106a3c959c4498fad13a5799c89ba7b@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.42]
Content-Type: multipart/alternative; boundary="_000_156412375837245776btcom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 62.239.224.234
Subject: [Qemu-arm] [Qemu-devel] [PATCH v5 15/15] target/sparc: sun4u Invert
 Endian TTE bit
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
X-TUID: F8gZInDckq+J

--_000_156412375837245776btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

This bit configures endianness of PCI MMIO devices. It is used by
Solaris and OpenBSD sunhme drivers.

Tested working on OpenBSD.

Unfortunately Solaris 10 had a unrelated keyboard issue blocking
testing... another inch towards Solaris 10 on SPARC64 =3D)

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
---
 target/sparc/cpu.h        | 2 ++
 target/sparc/mmu_helper.c | 8 +++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
index 8ed2250..77e8e07 100644
--- a/target/sparc/cpu.h
+++ b/target/sparc/cpu.h
@@ -277,6 +277,7 @@ enum {

 #define TTE_VALID_BIT       (1ULL << 63)
 #define TTE_NFO_BIT         (1ULL << 60)
+#define TTE_IE_BIT          (1ULL << 59)
 #define TTE_USED_BIT        (1ULL << 41)
 #define TTE_LOCKED_BIT      (1ULL <<  6)
 #define TTE_SIDEEFFECT_BIT  (1ULL <<  3)
@@ -293,6 +294,7 @@ enum {

 #define TTE_IS_VALID(tte)   ((tte) & TTE_VALID_BIT)
 #define TTE_IS_NFO(tte)     ((tte) & TTE_NFO_BIT)
+#define TTE_IS_IE(tte)      ((tte) & TTE_IE_BIT)
 #define TTE_IS_USED(tte)    ((tte) & TTE_USED_BIT)
 #define TTE_IS_LOCKED(tte)  ((tte) & TTE_LOCKED_BIT)
 #define TTE_IS_SIDEEFFECT(tte) ((tte) & TTE_SIDEEFFECT_BIT)
diff --git a/target/sparc/mmu_helper.c b/target/sparc/mmu_helper.c
index 826e14b..77dc86a 100644
--- a/target/sparc/mmu_helper.c
+++ b/target/sparc/mmu_helper.c
@@ -537,6 +537,10 @@ static int get_physical_address_data(CPUSPARCState *en=
v, hwaddr *physical,
         if (ultrasparc_tag_match(&env->dtlb[i], address, context, physical=
)) {
             int do_fault =3D 0;

+            if (TTE_IS_IE(env->dtlb[i].tte)) {
+                attrs->byte_swap =3D true;
+            }
+
             /* access ok? */
             /* multiple bits in SFSR.FT may be set on TT_DFAULT */
             if (TTE_IS_PRIV(env->dtlb[i].tte) && is_user) {
@@ -792,7 +796,7 @@ void dump_mmu(CPUSPARCState *env)
             }
             if (TTE_IS_VALID(env->dtlb[i].tte)) {
                 qemu_printf("[%02u] VA: %" PRIx64 ", PA: %llx"
-                            ", %s, %s, %s, %s, ctx %" PRId64 " %s\n",
+                            ", %s, %s, %s, %s, ie %s, ctx %" PRId64 " %s\n=
",
                             i,
                             env->dtlb[i].tag & (uint64_t)~0x1fffULL,
                             TTE_PA(env->dtlb[i].tte),
@@ -801,6 +805,8 @@ void dump_mmu(CPUSPARCState *env)
                             TTE_IS_W_OK(env->dtlb[i].tte) ? "RW" : "RO",
                             TTE_IS_LOCKED(env->dtlb[i].tte) ?
                             "locked" : "unlocked",
+                            TTE_IS_IE(env->dtlb[i].tte) ?
+                            "yes" : "no",
                             env->dtlb[i].tag & (uint64_t)0x1fffULL,
                             TTE_IS_GLOBAL(env->dtlb[i].tte) ?
                             "global" : "local");
--
1.8.3.1




--_000_156412375837245776btcom_
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
<div><span style=3D"font-size: 12pt;">This bit configures endianness of PCI=
 MMIO devices. It is used by</span><br>
</div>
<div>Solaris and OpenBSD sunhme drivers.</div>
<div><br>
</div>
<div>Tested working on OpenBSD.</div>
<div><br>
</div>
<div>Unfortunately Solaris 10 had a unrelated keyboard issue blocking</div>
<div>testing... another inch towards Solaris 10 on SPARC64 =3D)</div>
<div><br>
</div>
<div>Signed-off-by: Tony Nguyen &lt;tony.nguyen@bt.com&gt;</div>
<div>---</div>
<div>&nbsp;target/sparc/cpu.h &nbsp; &nbsp; &nbsp; &nbsp;| 2 &#43;&#43;</di=
v>
<div>&nbsp;target/sparc/mmu_helper.c | 8 &#43;&#43;&#43;&#43;&#43;&#43;&#43=
;-</div>
<div>&nbsp;2 files changed, 9 insertions(&#43;), 1 deletion(-)</div>
<div><br>
</div>
<div>diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h</div>
<div>index 8ed2250..77e8e07 100644</div>
<div>--- a/target/sparc/cpu.h</div>
<div>&#43;&#43;&#43; b/target/sparc/cpu.h</div>
<div>@@ -277,6 &#43;277,7 @@ enum {</div>
<div>&nbsp;</div>
<div>&nbsp;#define TTE_VALID_BIT &nbsp; &nbsp; &nbsp; (1ULL &lt;&lt; 63)</d=
iv>
<div>&nbsp;#define TTE_NFO_BIT &nbsp; &nbsp; &nbsp; &nbsp; (1ULL &lt;&lt; 6=
0)</div>
<div>&#43;#define TTE_IE_BIT &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(1ULL &lt;&l=
t; 59)</div>
<div>&nbsp;#define TTE_USED_BIT &nbsp; &nbsp; &nbsp; &nbsp;(1ULL &lt;&lt; 4=
1)</div>
<div>&nbsp;#define TTE_LOCKED_BIT &nbsp; &nbsp; &nbsp;(1ULL &lt;&lt; &nbsp;=
6)</div>
<div>&nbsp;#define TTE_SIDEEFFECT_BIT &nbsp;(1ULL &lt;&lt; &nbsp;3)</div>
<div>@@ -293,6 &#43;294,7 @@ enum {</div>
<div>&nbsp;</div>
<div>&nbsp;#define TTE_IS_VALID(tte) &nbsp; ((tte) &amp; TTE_VALID_BIT)</di=
v>
<div>&nbsp;#define TTE_IS_NFO(tte) &nbsp; &nbsp; ((tte) &amp; TTE_NFO_BIT)<=
/div>
<div>&#43;#define TTE_IS_IE(tte) &nbsp; &nbsp; &nbsp;((tte) &amp; TTE_IE_BI=
T)</div>
<div>&nbsp;#define TTE_IS_USED(tte) &nbsp; &nbsp;((tte) &amp; TTE_USED_BIT)=
</div>
<div>&nbsp;#define TTE_IS_LOCKED(tte) &nbsp;((tte) &amp; TTE_LOCKED_BIT)</d=
iv>
<div>&nbsp;#define TTE_IS_SIDEEFFECT(tte) ((tte) &amp; TTE_SIDEEFFECT_BIT)<=
/div>
<div>diff --git a/target/sparc/mmu_helper.c b/target/sparc/mmu_helper.c</di=
v>
<div>index 826e14b..77dc86a 100644</div>
<div>--- a/target/sparc/mmu_helper.c</div>
<div>&#43;&#43;&#43; b/target/sparc/mmu_helper.c</div>
<div>@@ -537,6 &#43;537,10 @@ static int get_physical_address_data(CPUSPARC=
State *env, hwaddr *physical,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (ultrasparc_tag_match(&amp;env-&g=
t;dtlb[i], address, context, physical)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;int do_fault =3D 0;</d=
iv>
<div>&nbsp;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (TTE_IS_IE(env-&gt;d=
tlb[i].tte)) {</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;attrs-&gt=
;byte_swap =3D true;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&#43;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* access ok? */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* multiple bits in SF=
SR.FT may be set on TT_DFAULT */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (TTE_IS_PRIV(env-&g=
t;dtlb[i].tte) &amp;&amp; is_user) {</div>
<div>@@ -792,7 &#43;796,7 @@ void dump_mmu(CPUSPARCState *env)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (TTE_IS_VALID(env-&=
gt;dtlb[i].tte)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;qemu_pri=
ntf(&quot;[%02u] VA: %&quot; PRIx64 &quot;, PA: %llx&quot;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;&quot;, %s, %s, %s, %s, ctx %&quot; PRId64 &qu=
ot; %s\n&quot;,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;, %s, %s, %s, %s, ie %s, ctx %&quot;=
 PRId64 &quot; %s\n&quot;,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;i,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;env-&gt;dtlb[i].tag &amp; (uint64_t)~0x1f=
ffULL,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TTE_PA(env-&gt;dtlb[i].tte),</div>
<div>@@ -801,6 &#43;805,8 @@ void dump_mmu(CPUSPARCState *env)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TTE_IS_W_OK(env-&gt;dtlb[i].tte) ? &quot;=
RW&quot; : &quot;RO&quot;,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TTE_IS_LOCKED(env-&gt;dtlb[i].tte) ?</div=
>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;locked&quot; : &quot;unlocked&quot;=
,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TTE_IS_IE(env-&gt;dtlb[i].tte) ?</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;yes&quot; : &quot;no&quot;,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;env-&gt;dtlb[i].tag &amp; (uint64_t)0x1ff=
fULL,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TTE_IS_GLOBAL(env-&gt;dtlb[i].tte) ?</div=
>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;global&quot; : &quot;local&quot;);<=
/div>
<div>--&nbsp;</div>
<div>1.8.3.1</div>
<div><br>
<br>
</div>
<p><br>
</p>
</body>
</html>

--_000_156412375837245776btcom_--
