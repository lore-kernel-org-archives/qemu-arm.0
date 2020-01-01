Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp17757069lff;
        Wed, 1 Jan 2020 03:27:02 -0800 (PST)
X-Google-Smtp-Source: APXvYqyI/TZ59dBWXi8bhO5TkJAwc8evZRly1wUFvA8OeTaUqhcn/KxK2c2U/tEymMmRbCaRV60O
X-Received: by 2002:a9d:62c7:: with SMTP id z7mr77528444otk.189.1577878022007;
        Wed, 01 Jan 2020 03:27:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1577878022; cv=none;
        d=google.com; s=arc-20160816;
        b=SfBpoeSG56Vzzw9v3GXkbho+GQ9+LXhbHDXPzsB/2ed6wU9Z/q92gcgIDSNPCSNynn
         nfyaTd5nEhqNVJAcK3F5jEXeAirNl54KH3Lb42MFnKAhz+F9TGTjv5AKiGowJBfvtqQ4
         Rd2NIb6hEfY9WUbCK+cgLVhwbx4gxDQ9XTUzOlpKAcVz9md+Gh+S/OnlnfWh5cIvUneA
         eoTethR0QkcMDfT8EtWGg+AZleTm/PtQo6V57x/28LmgSc/K6s2IF6cF096TS+Cnw3Rj
         AsZr1iKw1HKNYCAa6zOI8CLEqabaWNMZN3H7DjwGbnTr5+AehJ+r3eVjWVsIDneqjPYH
         xQuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=JE6nEoUGUvKFNwGb9PAU2TUaY8RSE2+5A3ONAN5yhUg=;
        b=FJ+ex/VoZF/osxMV1QxCCWqlLCtdU78R1kNjWi6aVGFLC6HjDu0FXBBWW9wNfL33ng
         S1vtk2QrCeEI3B5nNqBYECbr9jY7lR9D21K5h3Uapv/LkMdY7Vpsl8VmGTigTXvV9ahi
         ZWAo9XDq9bdpTYjuNbX7p5zloy+nFdaTMfPgYOccNelXgoY/cC4J/6gkq407qojP+5sc
         /V9FsBh9K4uwE0JmA7V35elXEg+h3OfFLVlpdPPZIdO9q7kKrZzlsYXFa7crT9dkwPAC
         zoXVHTectwMdqpYxT8rGfCTc8oE1sa6jeO+01sxTDRol1IBlOrBmcNQPCF9UN/hIjtfP
         rhAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=E5u2DpUq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w7si26937776otq.250.2020.01.01.03.27.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Jan 2020 03:27:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=E5u2DpUq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1imc9U-0005jw-Nk
	for alex.bennee@linaro.org; Wed, 01 Jan 2020 06:27:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59295)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1imc6V-0002ps-EL
 for qemu-devel@nongnu.org; Wed, 01 Jan 2020 06:23:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1imc6T-00081o-PY
 for qemu-devel@nongnu.org; Wed, 01 Jan 2020 06:23:55 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:21150
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1imc6T-0007zP-Ji
 for qemu-devel@nongnu.org; Wed, 01 Jan 2020 06:23:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577877833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JE6nEoUGUvKFNwGb9PAU2TUaY8RSE2+5A3ONAN5yhUg=;
 b=E5u2DpUqXFbIYegAjUjcjFaFLRfqbeojtMWVa7fvFXp0ZjfKc7BQfv5qKq2JXKr4cncbTC
 QO4uDtCQPSEmj2IEtl2xCtSKh+cmIx8ygMiO+N9+hawzYyykT/zHzUrCHxd7Dnu1rXp4Jc
 Iv50tpBqBz2/qSIuiNikdqa0xAIVZfI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-cJek8rZDONqASjKnuLNOug-1; Wed, 01 Jan 2020 06:23:51 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4529D10054E3;
 Wed,  1 Jan 2020 11:23:47 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-116-36.ams2.redhat.com [10.36.116.36])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AE0565DA60;
 Wed,  1 Jan 2020 11:23:33 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/4] tcg: Search includes in the parent source directory
Date: Wed,  1 Jan 2020 12:23:01 +0100
Message-Id: <20200101112303.20724-3-philmd@redhat.com>
In-Reply-To: <20200101112303.20724-1-philmd@redhat.com>
References: <20200101112303.20724-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: cJek8rZDONqASjKnuLNOug-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Chris Wulff <crwulff@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Riku Voipio <riku.voipio@iki.fi>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>,
 Claudio Fontana <claudio.fontana@huawei.com>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lPW2X++WAfnN

All the *.inc.c files included by tcg/$TARGET/tcg-target.inc.c
are in tcg/, their parent directory. To simplify the preprocessor
search path, include the relative parent path: '..'.

Patch created mechanically by running:

  $ for x in tcg-pool.inc.c tcg-ldst.inc.c; do \
    sed -i "s,#include \"$x\",#include \"../$x\"," \
      $(git grep -l "#include \"$x\""); \
    done

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 tcg/aarch64/tcg-target.inc.c | 4 ++--
 tcg/arm/tcg-target.inc.c     | 4 ++--
 tcg/i386/tcg-target.inc.c    | 4 ++--
 tcg/mips/tcg-target.inc.c    | 2 +-
 tcg/ppc/tcg-target.inc.c     | 4 ++--
 tcg/riscv/tcg-target.inc.c   | 4 ++--
 tcg/s390/tcg-target.inc.c    | 4 ++--
 tcg/sparc/tcg-target.inc.c   | 2 +-
 8 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/tcg/aarch64/tcg-target.inc.c b/tcg/aarch64/tcg-target.inc.c
index 3f921015d3..843fd0ca69 100644
--- a/tcg/aarch64/tcg-target.inc.c
+++ b/tcg/aarch64/tcg-target.inc.c
@@ -10,7 +10,7 @@
  * See the COPYING file in the top-level directory for details.
  */
=20
-#include "tcg-pool.inc.c"
+#include "../tcg-pool.inc.c"
 #include "qemu/bitops.h"
=20
 /* We're going to re-use TCGType in setting of the SF bit, which controls
@@ -1541,7 +1541,7 @@ static void tcg_out_cltz(TCGContext *s, TCGType ext, =
TCGReg d,
 }
=20
 #ifdef CONFIG_SOFTMMU
-#include "tcg-ldst.inc.c"
+#include "../tcg-ldst.inc.c"
=20
 /* helper signature: helper_ret_ld_mmu(CPUState *env, target_ulong addr,
  *                                     TCGMemOpIdx oi, uintptr_t ra)
diff --git a/tcg/arm/tcg-target.inc.c b/tcg/arm/tcg-target.inc.c
index 94d80d79d1..fffb6611e2 100644
--- a/tcg/arm/tcg-target.inc.c
+++ b/tcg/arm/tcg-target.inc.c
@@ -23,7 +23,7 @@
  */
=20
 #include "elf.h"
-#include "tcg-pool.inc.c"
+#include "../tcg-pool.inc.c"
=20
 int arm_arch =3D __ARM_ARCH;
=20
@@ -1131,7 +1131,7 @@ static TCGCond tcg_out_cmp2(TCGContext *s, const TCGA=
rg *args,
 }
=20
 #ifdef CONFIG_SOFTMMU
-#include "tcg-ldst.inc.c"
+#include "../tcg-ldst.inc.c"
=20
 /* helper signature: helper_ret_ld_mmu(CPUState *env, target_ulong addr,
  *                                     int mmu_idx, uintptr_t ra)
diff --git a/tcg/i386/tcg-target.inc.c b/tcg/i386/tcg-target.inc.c
index 9d8ed974e0..cdedcb2b25 100644
--- a/tcg/i386/tcg-target.inc.c
+++ b/tcg/i386/tcg-target.inc.c
@@ -22,7 +22,7 @@
  * THE SOFTWARE.
  */
=20
-#include "tcg-pool.inc.c"
+#include "../tcg-pool.inc.c"
=20
 #ifdef CONFIG_DEBUG_TCG
 static const char * const tcg_target_reg_names[TCG_TARGET_NB_REGS] =3D {
@@ -1647,7 +1647,7 @@ static void tcg_out_nopn(TCGContext *s, int n)
 }
=20
 #if defined(CONFIG_SOFTMMU)
-#include "tcg-ldst.inc.c"
+#include "../tcg-ldst.inc.c"
=20
 /* helper signature: helper_ret_ld_mmu(CPUState *env, target_ulong addr,
  *                                     int mmu_idx, uintptr_t ra)
diff --git a/tcg/mips/tcg-target.inc.c b/tcg/mips/tcg-target.inc.c
index 5442167045..1da663ce84 100644
--- a/tcg/mips/tcg-target.inc.c
+++ b/tcg/mips/tcg-target.inc.c
@@ -1107,7 +1107,7 @@ static void tcg_out_call(TCGContext *s, tcg_insn_unit=
 *arg)
 }
=20
 #if defined(CONFIG_SOFTMMU)
-#include "tcg-ldst.inc.c"
+#include "../tcg-ldst.inc.c"
=20
 static void * const qemu_ld_helpers[16] =3D {
     [MO_UB]   =3D helper_ret_ldub_mmu,
diff --git a/tcg/ppc/tcg-target.inc.c b/tcg/ppc/tcg-target.inc.c
index d308d69aba..ee1f9227c1 100644
--- a/tcg/ppc/tcg-target.inc.c
+++ b/tcg/ppc/tcg-target.inc.c
@@ -23,7 +23,7 @@
  */
=20
 #include "elf.h"
-#include "tcg-pool.inc.c"
+#include "../tcg-pool.inc.c"
=20
 #if defined _CALL_DARWIN || defined __APPLE__
 #define TCG_TARGET_CALL_DARWIN
@@ -1845,7 +1845,7 @@ static const uint32_t qemu_exts_opc[4] =3D {
 };
=20
 #if defined (CONFIG_SOFTMMU)
-#include "tcg-ldst.inc.c"
+#include "../tcg-ldst.inc.c"
=20
 /* helper signature: helper_ld_mmu(CPUState *env, target_ulong addr,
  *                                 int mmu_idx, uintptr_t ra)
diff --git a/tcg/riscv/tcg-target.inc.c b/tcg/riscv/tcg-target.inc.c
index 7018509693..2bc0ba71f2 100644
--- a/tcg/riscv/tcg-target.inc.c
+++ b/tcg/riscv/tcg-target.inc.c
@@ -27,7 +27,7 @@
  * THE SOFTWARE.
  */
=20
-#include "tcg-pool.inc.c"
+#include "../tcg-pool.inc.c"
=20
 #ifdef CONFIG_DEBUG_TCG
 static const char * const tcg_target_reg_names[TCG_TARGET_NB_REGS] =3D {
@@ -921,7 +921,7 @@ static void tcg_out_mb(TCGContext *s, TCGArg a0)
  */
=20
 #if defined(CONFIG_SOFTMMU)
-#include "tcg-ldst.inc.c"
+#include "../tcg-ldst.inc.c"
=20
 /* helper signature: helper_ret_ld_mmu(CPUState *env, target_ulong addr,
  *                                     TCGMemOpIdx oi, uintptr_t ra)
diff --git a/tcg/s390/tcg-target.inc.c b/tcg/s390/tcg-target.inc.c
index 8aaa4cebe8..b07e9ff7d6 100644
--- a/tcg/s390/tcg-target.inc.c
+++ b/tcg/s390/tcg-target.inc.c
@@ -29,7 +29,7 @@
 #error "unsupported code generation mode"
 #endif
=20
-#include "tcg-pool.inc.c"
+#include "../tcg-pool.inc.c"
 #include "elf.h"
=20
 /* ??? The translation blocks produced by TCG are generally small enough t=
o
@@ -1536,7 +1536,7 @@ static void tcg_out_qemu_st_direct(TCGContext *s, Mem=
Op opc, TCGReg data,
 }
=20
 #if defined(CONFIG_SOFTMMU)
-#include "tcg-ldst.inc.c"
+#include "../tcg-ldst.inc.c"
=20
 /* We're expecting to use a 20-bit negative offset on the tlb memory ops. =
 */
 QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) > 0);
diff --git a/tcg/sparc/tcg-target.inc.c b/tcg/sparc/tcg-target.inc.c
index d7986cda5c..65fddb310d 100644
--- a/tcg/sparc/tcg-target.inc.c
+++ b/tcg/sparc/tcg-target.inc.c
@@ -22,7 +22,7 @@
  * THE SOFTWARE.
  */
=20
-#include "tcg-pool.inc.c"
+#include "../tcg-pool.inc.c"
=20
 #ifdef CONFIG_DEBUG_TCG
 static const char * const tcg_target_reg_names[TCG_TARGET_NB_REGS] =3D {
--=20
2.21.0

