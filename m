Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6248152wrv;
        Wed, 7 Aug 2019 01:26:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwwI+o0Cj6332hdIc8kb6KUzCBmmNB7nzScdZuNZa/zprJX7d04ocjBYgD5LHbMkuFSgVfs
X-Received: by 2002:ae9:e10e:: with SMTP id g14mr6944546qkm.486.1565166360182;
        Wed, 07 Aug 2019 01:26:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565166360; cv=none;
        d=google.com; s=arc-20160816;
        b=leLLhbQmDJcZGdJsYRvLHqMw4Z+hP1SCdWQ1sn+vijcA4hE5gxCpNvyK6glDItkyxm
         acOmsrTRCOQBQL7ivUfRXlesOTh6ZnNVHiIdPIlkO0RhpE04e0y9UnDmp/4rOe4TKT1h
         4zBonfRiJKOgiy39cnYSZVWIQcR0wPHIE3dI7EWoCQXi1Z1oHXwhWOPmSdevO3Y0gM6/
         vcVS5x9UPToY/S/RMa+TuZSFGRfiQwV7uaS88pCO5RzAftop8AZMeXADRRIEV5ucMKcp
         eGyZtmKtQDsNfAcojjcddLa4BNdtMorjh5xMnUSir65/qrKyEgjJ9Y1+lf+assO9ZvKd
         0Mng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:to:from;
        bh=9ynqttxq1EB69y3V62aWet27R6DF/Rjr81+4ZCRUDCg=;
        b=b0bPGqZK3QyIcgm0bCYtqZZo2MeOnDIhadcfTsArRSA9sBexAhh9I1CrTuImWS6zYi
         j5yZZQQJje0Mc5XrtKe3ZNZzF5VSxuEUrh3IPERQkVdoeg6aZs7kO6mN5L00vAv2Qlwe
         W4c3NLi+U9fcOh9s8HzMLnePo8VUC3QZuM/V1x2kUUIApHEE9hb2TblN5XlyymPfCyg9
         0rkuWEYpp7yNNtCdHRs1jWdMWtXLCil4WSsDAMExR22rlxrhA0nLTxs79EmGMK3LM8HX
         t2vQRxvvqT7XM6ZWpaBF4C8LAQY5pCqySKsXzJ59RJcQEE4d3tfJ1Sc6frEQFN34Both
         fO5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x5si23422501qki.281.2019.08.07.01.26.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2019 01:26:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Received: from localhost ([::1]:38228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvHGh-0005iB-N5
	for alex.bennee@linaro.org; Wed, 07 Aug 2019 04:25:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43134)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tony.nguyen@bt.com>) id 1hvHGV-0005hp-4T
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 04:25:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hvHGT-0007SC-6f
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 04:25:47 -0400
Received: from smtpe1.intersmtp.com ([213.121.35.74]:37073)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hvHGO-0007Q4-19; Wed, 07 Aug 2019 04:25:40 -0400
Received: from tpw09926dag18h.domain1.systemhost.net (10.9.212.42) by
 BWP09926079.bt.com (10.36.82.110) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Wed, 7 Aug
 2019 09:25:30 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18h.domain1.systemhost.net (10.9.212.42) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Wed, 7 Aug 2019 09:25:37 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Wed, 7 Aug 2019
 09:25:37 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v6 01/26] configure: Define
 TARGET_ALIGNED_ONLY
Thread-Index: AQHVTPmwA9I8SFw7ZEyFe+TCySKK0g==
Date: Wed, 7 Aug 2019 08:25:37 +0000
Message-ID: <1565166336833.46550@bt.com>
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.44]
Content-Type: multipart/alternative; boundary="_000_156516633683346550btcom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 213.121.35.74
Subject: [Qemu-arm] [Qemu-devel] [PATCH v6 01/26] configure: Define
 TARGET_ALIGNED_ONLY
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
Cc: fam@euphon.net, peter.maydell@linaro.org, walling@linux.ibm.com,
 cohuck@redhat.com, sagark@eecs.berkeley.edu, david@redhat.com,
 jasowang@redhat.com, palmer@sifive.com, mark.cave-ayland@ilande.co.uk,
 i.mitsyanko@gmail.com, keith.busch@intel.com, jcmvbkbc@gmail.com,
 frederic.konrad@adacore.com, dmitry.fleytman@gmail.com, kraxel@redhat.com,
 gxt@mprc.pku.edu.cn, pburton@wavecomp.com, xiaoguangrong.eric@gmail.com,
 peter.chubb@nicta.com.au, philmd@redhat.com, robh@kernel.org, hare@suse.com,
 sstabellini@kernel.org, berto@igalia.com, chouteau@adacore.com,
 qemu-block@nongnu.org, arikalo@wavecomp.com, jslaby@suse.cz, deller@gmx.de,
 mst@redhat.com, magnus.damm@gmail.com, jcd@tribudubois.net,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, mreitz@redhat.com,
 hpoussin@reactos.org, joel@jms.id.au, anthony.perard@citrix.com,
 xen-devel@lists.xenproject.org, david@gibson.dropbear.id.au, lersek@redhat.com,
 green@moxielogic.com, atar4qemu@gmail.com, antonynpavlov@gmail.com,
 marex@denx.de, jiri@resnulli.us, ehabkost@redhat.com, minyard@acm.org,
 qemu-s390x@nongnu.org, sw@weilnetz.de, alistair@alistair23.me,
 yuval.shaia@oracle.com, b.galvani@gmail.com, eric.auger@redhat.com,
 alex.williamson@redhat.com, qemu-arm@nongnu.org, jan.kiszka@web.de,
 clg@kaod.org, stefanha@redhat.com, marcandre.lureau@redhat.com,
 shorne@gmail.com, jsnow@redhat.com, rth@twiddle.net, kwolf@redhat.com,
 qemu-riscv@nongnu.org, proljc@gmail.com, pbonzini@redhat.com, andrew@aj.id.au,
 kbastian@mail.uni-paderborn.de, crwulff@gmail.com, laurent@vivier.eu,
 Andrew.Baumann@microsoft.com, sundeep.lkml@gmail.com, andrew.smirnov@gmail.com,
 michael@walle.cc, paul.durrant@citrix.com, qemu-ppc@nongnu.org,
 huth@tuxfamily.org, amarkovic@wavecomp.com, imammedo@redhat.com,
 aurelien@aurel32.net, stefanb@linux.ibm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GCl0AhoXBg/L

--_000_156516633683346550btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Rename ALIGNED_ONLY to TARGET_ALIGNED_ONLY for clarity and move
defines out of target/foo/cpu.h into configure, as we do with
TARGET_WORDS_BIGENDIAN, so that it is always defined early.

Poisoned TARGET_ALIGNED_ONLY to prevent use in common code.

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 configure             | 10 +++++++++-
 include/exec/poison.h |  1 +
 include/qom/cpu.h     |  2 +-
 target/alpha/cpu.h    |  2 --
 target/hppa/cpu.h     |  1 -
 target/mips/cpu.h     |  2 --
 target/sh4/cpu.h      |  2 --
 target/sparc/cpu.h    |  2 --
 target/xtensa/cpu.h   |  2 --
 tcg/tcg.c             |  2 +-
 tcg/tcg.h             |  8 +++++---
 11 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/configure b/configure
index 714e7fb..482ba0b 100755
--- a/configure
+++ b/configure
@@ -7431,8 +7431,13 @@ for target in $target_list; do
 target_dir=3D"$target"
 config_target_mak=3D$target_dir/config-target.mak
 target_name=3D$(echo $target | cut -d '-' -f 1)
+target_aligned_only=3D"no"
+case "$target_name" in
+  alpha|hppa|mips64el|mips64|mipsel|mips|mipsn32|mipsn32el|sh4|sh4eb|sparc=
|sparc64|sparc32plus|xtensa|xtensaeb)
+  target_aligned_only=3D"yes"
+  ;;
+esac
 target_bigendian=3D"no"
-
 case "$target_name" in
   armeb|aarch64_be|hppa|lm32|m68k|microblaze|mips|mipsn32|mips64|moxie|or1=
k|ppc|ppc64|ppc64abi32|s390x|sh4eb|sparc|sparc64|sparc32plus|xtensaeb)
   target_bigendian=3Dyes
@@ -7717,6 +7722,9 @@ fi
 if supported_whpx_target $target; then
     echo "CONFIG_WHPX=3Dy" >> $config_target_mak
 fi
+if test "$target_aligned_only" =3D "yes" ; then
+  echo "TARGET_ALIGNED_ONLY=3Dy" >> $config_target_mak
+fi
 if test "$target_bigendian" =3D "yes" ; then
   echo "TARGET_WORDS_BIGENDIAN=3Dy" >> $config_target_mak
 fi
diff --git a/include/exec/poison.h b/include/exec/poison.h
index b862320..955eb86 100644
--- a/include/exec/poison.h
+++ b/include/exec/poison.h
@@ -35,6 +35,7 @@
 #pragma GCC poison TARGET_UNICORE32
 #pragma GCC poison TARGET_XTENSA

+#pragma GCC poison TARGET_ALIGNED_ONLY
 #pragma GCC poison TARGET_HAS_BFLT
 #pragma GCC poison TARGET_NAME
 #pragma GCC poison TARGET_SUPPORTS_MTTCG
diff --git a/include/qom/cpu.h b/include/qom/cpu.h
index 5ee0046..9b50b73 100644
--- a/include/qom/cpu.h
+++ b/include/qom/cpu.h
@@ -89,7 +89,7 @@ struct TranslationBlock;
  * @do_unassigned_access: Callback for unassigned access handling.
  * (this is deprecated: new targets should use do_transaction_failed inste=
ad)
  * @do_unaligned_access: Callback for unaligned access handling, if
- * the target defines #ALIGNED_ONLY.
+ * the target defines #TARGET_ALIGNED_ONLY.
  * @do_transaction_failed: Callback for handling failed memory transaction=
s
  * (ie bus faults or external aborts; not MMU faults)
  * @virtio_is_big_endian: Callback to return %true if a CPU which supports
diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h
index b3e8a82..16eb804 100644
--- a/target/alpha/cpu.h
+++ b/target/alpha/cpu.h
@@ -23,8 +23,6 @@
 #include "cpu-qom.h"
 #include "exec/cpu-defs.h"

-#define ALIGNED_ONLY
-
 /* Alpha processors have a weak memory model */
 #define TCG_GUEST_DEFAULT_MO      (0)

diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
index aab251b..2be67c2 100644
--- a/target/hppa/cpu.h
+++ b/target/hppa/cpu.h
@@ -30,7 +30,6 @@
    basis.  It's probably easier to fall back to a strong memory model.  */
 #define TCG_GUEST_DEFAULT_MO        TCG_MO_ALL

-#define ALIGNED_ONLY
 #define MMU_KERNEL_IDX   0
 #define MMU_USER_IDX     3
 #define MMU_PHYS_IDX     4
diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 21c0615..c13cd4e 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -1,8 +1,6 @@
 #ifndef MIPS_CPU_H
 #define MIPS_CPU_H

-#define ALIGNED_ONLY
-
 #include "cpu-qom.h"
 #include "exec/cpu-defs.h"
 #include "fpu/softfloat.h"
diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
index aee733e..ecaa7a1 100644
--- a/target/sh4/cpu.h
+++ b/target/sh4/cpu.h
@@ -23,8 +23,6 @@
 #include "cpu-qom.h"
 #include "exec/cpu-defs.h"

-#define ALIGNED_ONLY
-
 /* CPU Subtypes */
 #define SH_CPU_SH7750  (1 << 0)
 #define SH_CPU_SH7750S (1 << 1)
diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
index 8ed2250..1406f0b 100644
--- a/target/sparc/cpu.h
+++ b/target/sparc/cpu.h
@@ -5,8 +5,6 @@
 #include "cpu-qom.h"
 #include "exec/cpu-defs.h"

-#define ALIGNED_ONLY
-
 #if !defined(TARGET_SPARC64)
 #define TARGET_DPREGS 16
 #else
diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index 2c27713..0459243 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -32,8 +32,6 @@
 #include "exec/cpu-defs.h"
 #include "xtensa-isa.h"

-#define ALIGNED_ONLY
-
 /* Xtensa processors have a weak memory model */
 #define TCG_GUEST_DEFAULT_MO      (0)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index be2c33c..8d23fb0 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1926,7 +1926,7 @@ static const char * const ldst_name[] =3D
 };

 static const char * const alignment_name[(MO_AMASK >> MO_ASHIFT) + 1] =3D =
{
-#ifdef ALIGNED_ONLY
+#ifdef TARGET_ALIGNED_ONLY
     [MO_UNALN >> MO_ASHIFT]    =3D "un+",
     [MO_ALIGN >> MO_ASHIFT]    =3D "",
 #else
diff --git a/tcg/tcg.h b/tcg/tcg.h
index b411e17..529acb2 100644
--- a/tcg/tcg.h
+++ b/tcg/tcg.h
@@ -333,10 +333,12 @@ typedef enum TCGMemOp {
     MO_TE    =3D MO_LE,
 #endif

-    /* MO_UNALN accesses are never checked for alignment.
+    /*
+     * MO_UNALN accesses are never checked for alignment.
      * MO_ALIGN accesses will result in a call to the CPU's
      * do_unaligned_access hook if the guest address is not aligned.
-     * The default depends on whether the target CPU defines ALIGNED_ONLY.
+     * The default depends on whether the target CPU defines
+     * TARGET_ALIGNED_ONLY.
      *
      * Some architectures (e.g. ARMv8) need the address which is aligned
      * to a size more than the size of the memory access.
@@ -353,7 +355,7 @@ typedef enum TCGMemOp {
      */
     MO_ASHIFT =3D 4,
     MO_AMASK =3D 7 << MO_ASHIFT,
-#ifdef ALIGNED_ONLY
+#ifdef TARGET_ALIGNED_ONLY
     MO_ALIGN =3D 0,
     MO_UNALN =3D MO_AMASK,
 #else
--
1.8.3.1




--_000_156516633683346550btcom_
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
<div><span style=3D"font-size: 12pt;">Rename ALIGNED_ONLY to TARGET_ALIGNED=
_ONLY for clarity and move</span><br>
</div>
<div>defines out of target/foo/cpu.h into configure, as we do with</div>
<div>TARGET_WORDS_BIGENDIAN, so that it is always defined early.</div>
<div><br>
</div>
<div>Poisoned TARGET_ALIGNED_ONLY to prevent use in common code.</div>
<div><br>
</div>
<div>Signed-off-by: Tony Nguyen &lt;tony.nguyen@bt.com&gt;</div>
<div>Reviewed-by: Philippe Mathieu-Daud=E9 &lt;philmd@redhat.com&gt;</div>
<div>Reviewed-by: Richard Henderson &lt;richard.henderson@linaro.org&gt;</d=
iv>
<div>Reviewed-by: Aleksandar Markovic &lt;amarkovic@wavecomp.com&gt;</div>
<div>---</div>
<div>&nbsp;configure &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | 10 &#43;&#=
43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-</div>
<div>&nbsp;include/exec/poison.h | &nbsp;1 &#43;</div>
<div>&nbsp;include/qom/cpu.h &nbsp; &nbsp; | &nbsp;2 &#43;-</div>
<div>&nbsp;target/alpha/cpu.h &nbsp; &nbsp;| &nbsp;2 --</div>
<div>&nbsp;target/hppa/cpu.h &nbsp; &nbsp; | &nbsp;1 -</div>
<div>&nbsp;target/mips/cpu.h &nbsp; &nbsp; | &nbsp;2 --</div>
<div>&nbsp;target/sh4/cpu.h &nbsp; &nbsp; &nbsp;| &nbsp;2 --</div>
<div>&nbsp;target/sparc/cpu.h &nbsp; &nbsp;| &nbsp;2 --</div>
<div>&nbsp;target/xtensa/cpu.h &nbsp; | &nbsp;2 --</div>
<div>&nbsp;tcg/tcg.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp;2 &#=
43;-</div>
<div>&nbsp;tcg/tcg.h &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp;8 &#=
43;&#43;&#43;&#43;&#43;---</div>
<div>&nbsp;11 files changed, 17 insertions(&#43;), 17 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/configure b/configure</div>
<div>index 714e7fb..482ba0b 100755</div>
<div>--- a/configure</div>
<div>&#43;&#43;&#43; b/configure</div>
<div>@@ -7431,8 &#43;7431,13 @@ for target in $target_list; do</div>
<div>&nbsp;target_dir=3D&quot;$target&quot;</div>
<div>&nbsp;config_target_mak=3D$target_dir/config-target.mak</div>
<div>&nbsp;target_name=3D$(echo $target | cut -d '-' -f 1)</div>
<div>&#43;target_aligned_only=3D&quot;no&quot;</div>
<div>&#43;case &quot;$target_name&quot; in</div>
<div>&#43; &nbsp;alpha|hppa|mips64el|mips64|mipsel|mips|mipsn32|mipsn32el|s=
h4|sh4eb|sparc|sparc64|sparc32plus|xtensa|xtensaeb)</div>
<div>&#43; &nbsp;target_aligned_only=3D&quot;yes&quot;</div>
<div>&#43; &nbsp;;;</div>
<div>&#43;esac</div>
<div>&nbsp;target_bigendian=3D&quot;no&quot;</div>
<div>-</div>
<div>&nbsp;case &quot;$target_name&quot; in</div>
<div>&nbsp; &nbsp;armeb|aarch64_be|hppa|lm32|m68k|microblaze|mips|mipsn32|m=
ips64|moxie|or1k|ppc|ppc64|ppc64abi32|s390x|sh4eb|sparc|sparc64|sparc32plus=
|xtensaeb)</div>
<div>&nbsp; &nbsp;target_bigendian=3Dyes</div>
<div>@@ -7717,6 &#43;7722,9 @@ fi</div>
<div>&nbsp;if supported_whpx_target $target; then</div>
<div>&nbsp; &nbsp; &nbsp;echo &quot;CONFIG_WHPX=3Dy&quot; &gt;&gt; $config_=
target_mak</div>
<div>&nbsp;fi</div>
<div>&#43;if test &quot;$target_aligned_only&quot; =3D &quot;yes&quot; ; th=
en</div>
<div>&#43; &nbsp;echo &quot;TARGET_ALIGNED_ONLY=3Dy&quot; &gt;&gt; $config_=
target_mak</div>
<div>&#43;fi</div>
<div>&nbsp;if test &quot;$target_bigendian&quot; =3D &quot;yes&quot; ; then=
</div>
<div>&nbsp; &nbsp;echo &quot;TARGET_WORDS_BIGENDIAN=3Dy&quot; &gt;&gt; $con=
fig_target_mak</div>
<div>&nbsp;fi</div>
<div>diff --git a/include/exec/poison.h b/include/exec/poison.h</div>
<div>index b862320..955eb86 100644</div>
<div>--- a/include/exec/poison.h</div>
<div>&#43;&#43;&#43; b/include/exec/poison.h</div>
<div>@@ -35,6 &#43;35,7 @@</div>
<div>&nbsp;#pragma GCC poison TARGET_UNICORE32</div>
<div>&nbsp;#pragma GCC poison TARGET_XTENSA</div>
<div>&nbsp;</div>
<div>&#43;#pragma GCC poison TARGET_ALIGNED_ONLY</div>
<div>&nbsp;#pragma GCC poison TARGET_HAS_BFLT</div>
<div>&nbsp;#pragma GCC poison TARGET_NAME</div>
<div>&nbsp;#pragma GCC poison TARGET_SUPPORTS_MTTCG</div>
<div>diff --git a/include/qom/cpu.h b/include/qom/cpu.h</div>
<div>index 5ee0046..9b50b73 100644</div>
<div>--- a/include/qom/cpu.h</div>
<div>&#43;&#43;&#43; b/include/qom/cpu.h</div>
<div>@@ -89,7 &#43;89,7 @@ struct TranslationBlock;</div>
<div>&nbsp; * @do_unassigned_access: Callback for unassigned access handlin=
g.</div>
<div>&nbsp; * (this is deprecated: new targets should use do_transaction_fa=
iled instead)</div>
<div>&nbsp; * @do_unaligned_access: Callback for unaligned access handling,=
 if</div>
<div>- * the target defines #ALIGNED_ONLY.</div>
<div>&#43; * the target defines #TARGET_ALIGNED_ONLY.</div>
<div>&nbsp; * @do_transaction_failed: Callback for handling failed memory t=
ransactions</div>
<div>&nbsp; * (ie bus faults or external aborts; not MMU faults)</div>
<div>&nbsp; * @virtio_is_big_endian: Callback to return %true if a CPU whic=
h supports</div>
<div>diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h</div>
<div>index b3e8a82..16eb804 100644</div>
<div>--- a/target/alpha/cpu.h</div>
<div>&#43;&#43;&#43; b/target/alpha/cpu.h</div>
<div>@@ -23,8 &#43;23,6 @@</div>
<div>&nbsp;#include &quot;cpu-qom.h&quot;</div>
<div>&nbsp;#include &quot;exec/cpu-defs.h&quot;</div>
<div>&nbsp;</div>
<div>-#define ALIGNED_ONLY</div>
<div>-</div>
<div>&nbsp;/* Alpha processors have a weak memory model */</div>
<div>&nbsp;#define TCG_GUEST_DEFAULT_MO &nbsp; &nbsp; &nbsp;(0)</div>
<div>&nbsp;</div>
<div>diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h</div>
<div>index aab251b..2be67c2 100644</div>
<div>--- a/target/hppa/cpu.h</div>
<div>&#43;&#43;&#43; b/target/hppa/cpu.h</div>
<div>@@ -30,7 &#43;30,6 @@</div>
<div>&nbsp; &nbsp; basis. &nbsp;It's probably easier to fall back to a stro=
ng memory model. &nbsp;*/</div>
<div>&nbsp;#define TCG_GUEST_DEFAULT_MO &nbsp; &nbsp; &nbsp; &nbsp;TCG_MO_A=
LL</div>
<div>&nbsp;</div>
<div>-#define ALIGNED_ONLY</div>
<div>&nbsp;#define MMU_KERNEL_IDX &nbsp; 0</div>
<div>&nbsp;#define MMU_USER_IDX &nbsp; &nbsp; 3</div>
<div>&nbsp;#define MMU_PHYS_IDX &nbsp; &nbsp; 4</div>
<div>diff --git a/target/mips/cpu.h b/target/mips/cpu.h</div>
<div>index 21c0615..c13cd4e 100644</div>
<div>--- a/target/mips/cpu.h</div>
<div>&#43;&#43;&#43; b/target/mips/cpu.h</div>
<div>@@ -1,8 &#43;1,6 @@</div>
<div>&nbsp;#ifndef MIPS_CPU_H</div>
<div>&nbsp;#define MIPS_CPU_H</div>
<div>&nbsp;</div>
<div>-#define ALIGNED_ONLY</div>
<div>-</div>
<div>&nbsp;#include &quot;cpu-qom.h&quot;</div>
<div>&nbsp;#include &quot;exec/cpu-defs.h&quot;</div>
<div>&nbsp;#include &quot;fpu/softfloat.h&quot;</div>
<div>diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h</div>
<div>index aee733e..ecaa7a1 100644</div>
<div>--- a/target/sh4/cpu.h</div>
<div>&#43;&#43;&#43; b/target/sh4/cpu.h</div>
<div>@@ -23,8 &#43;23,6 @@</div>
<div>&nbsp;#include &quot;cpu-qom.h&quot;</div>
<div>&nbsp;#include &quot;exec/cpu-defs.h&quot;</div>
<div>&nbsp;</div>
<div>-#define ALIGNED_ONLY</div>
<div>-</div>
<div>&nbsp;/* CPU Subtypes */</div>
<div>&nbsp;#define SH_CPU_SH7750 &nbsp;(1 &lt;&lt; 0)</div>
<div>&nbsp;#define SH_CPU_SH7750S (1 &lt;&lt; 1)</div>
<div>diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h</div>
<div>index 8ed2250..1406f0b 100644</div>
<div>--- a/target/sparc/cpu.h</div>
<div>&#43;&#43;&#43; b/target/sparc/cpu.h</div>
<div>@@ -5,8 &#43;5,6 @@</div>
<div>&nbsp;#include &quot;cpu-qom.h&quot;</div>
<div>&nbsp;#include &quot;exec/cpu-defs.h&quot;</div>
<div>&nbsp;</div>
<div>-#define ALIGNED_ONLY</div>
<div>-</div>
<div>&nbsp;#if !defined(TARGET_SPARC64)</div>
<div>&nbsp;#define TARGET_DPREGS 16</div>
<div>&nbsp;#else</div>
<div>diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h</div>
<div>index 2c27713..0459243 100644</div>
<div>--- a/target/xtensa/cpu.h</div>
<div>&#43;&#43;&#43; b/target/xtensa/cpu.h</div>
<div>@@ -32,8 &#43;32,6 @@</div>
<div>&nbsp;#include &quot;exec/cpu-defs.h&quot;</div>
<div>&nbsp;#include &quot;xtensa-isa.h&quot;</div>
<div>&nbsp;</div>
<div>-#define ALIGNED_ONLY</div>
<div>-</div>
<div>&nbsp;/* Xtensa processors have a weak memory model */</div>
<div>&nbsp;#define TCG_GUEST_DEFAULT_MO &nbsp; &nbsp; &nbsp;(0)</div>
<div>&nbsp;</div>
<div>diff --git a/tcg/tcg.c b/tcg/tcg.c</div>
<div>index be2c33c..8d23fb0 100644</div>
<div>--- a/tcg/tcg.c</div>
<div>&#43;&#43;&#43; b/tcg/tcg.c</div>
<div>@@ -1926,7 &#43;1926,7 @@ static const char * const ldst_name[] =3D</d=
iv>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const char * const alignment_name[(MO_AMASK &gt;&gt; MO_A=
SHIFT) &#43; 1] =3D {</div>
<div>-#ifdef ALIGNED_ONLY</div>
<div>&#43;#ifdef TARGET_ALIGNED_ONLY</div>
<div>&nbsp; &nbsp; &nbsp;[MO_UNALN &gt;&gt; MO_ASHIFT] &nbsp; &nbsp;=3D &qu=
ot;un&#43;&quot;,</div>
<div>&nbsp; &nbsp; &nbsp;[MO_ALIGN &gt;&gt; MO_ASHIFT] &nbsp; &nbsp;=3D &qu=
ot;&quot;,</div>
<div>&nbsp;#else</div>
<div>diff --git a/tcg/tcg.h b/tcg/tcg.h</div>
<div>index b411e17..529acb2 100644</div>
<div>--- a/tcg/tcg.h</div>
<div>&#43;&#43;&#43; b/tcg/tcg.h</div>
<div>@@ -333,10 &#43;333,12 @@ typedef enum TCGMemOp {</div>
<div>&nbsp; &nbsp; &nbsp;MO_TE &nbsp; &nbsp;=3D MO_LE,</div>
<div>&nbsp;#endif</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp;/* MO_UNALN accesses are never checked for alignment.</=
div>
<div>&#43; &nbsp; &nbsp;/*</div>
<div>&#43; &nbsp; &nbsp; * MO_UNALN accesses are never checked for alignmen=
t.</div>
<div>&nbsp; &nbsp; &nbsp; * MO_ALIGN accesses will result in a call to the =
CPU's</div>
<div>&nbsp; &nbsp; &nbsp; * do_unaligned_access hook if the guest address i=
s not aligned.</div>
<div>- &nbsp; &nbsp; * The default depends on whether the target CPU define=
s ALIGNED_ONLY.</div>
<div>&#43; &nbsp; &nbsp; * The default depends on whether the target CPU de=
fines</div>
<div>&#43; &nbsp; &nbsp; * TARGET_ALIGNED_ONLY.</div>
<div>&nbsp; &nbsp; &nbsp; *</div>
<div>&nbsp; &nbsp; &nbsp; * Some architectures (e.g. ARMv8) need the addres=
s which is aligned</div>
<div>&nbsp; &nbsp; &nbsp; * to a size more than the size of the memory acce=
ss.</div>
<div>@@ -353,7 &#43;355,7 @@ typedef enum TCGMemOp {</div>
<div>&nbsp; &nbsp; &nbsp; */</div>
<div>&nbsp; &nbsp; &nbsp;MO_ASHIFT =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;MO_AMASK =3D 7 &lt;&lt; MO_ASHIFT,</div>
<div>-#ifdef ALIGNED_ONLY</div>
<div>&#43;#ifdef TARGET_ALIGNED_ONLY</div>
<div>&nbsp; &nbsp; &nbsp;MO_ALIGN =3D 0,</div>
<div>&nbsp; &nbsp; &nbsp;MO_UNALN =3D MO_AMASK,</div>
<div>&nbsp;#else</div>
<div>--&nbsp;</div>
<div>1.8.3.1</div>
<div><br>
<br>
</div>
<p><br>
</p>
</body>
</html>

--_000_156516633683346550btcom_--
