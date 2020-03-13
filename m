Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp2173924lfc;
        Fri, 13 Mar 2020 07:00:54 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vv0H65AhTiRDoapeQzRKe92Yc7UFYp/fsVaXraPFUDT9+PdneV41TDBSevJmTHnHJrTDqyQ
X-Received: by 2002:ad4:488a:: with SMTP id bv10mr12557925qvb.88.1584108054337;
        Fri, 13 Mar 2020 07:00:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584108054; cv=none;
        d=google.com; s=arc-20160816;
        b=StjpsPoelOCHBDqwKYHBYHH3B0ax5pbgpIz0rJSmZws5g7P9KVhoMd4LAhEya+VvXC
         zL0x2BlAnoFFAgLnMLYHDqIbNBTad1bz93c1pQaK/VqUzZrTCpavAJyY/TfUTxQegeV3
         rBls+y614nK1MT1xzcYhBePf23L1ihVm6taxXEuWyodovGf0YGZGrXSyekKDB0WBkD/7
         ZS3ygfdRxc+sxI8kbOB2bk5+Jg0c1zrIjFzLEA8Tx/fcRuWm9nNi/B3K5EVU3PgQpN9k
         /Uvt6uCQ6/UPIn7niAA8NZHrnP5ujYi/mIKK+buYr+gfen+ulbY17BVAmVFH/KPonQPy
         LIzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=ejANSQN+FY6eUBVdd+F+7K6BwJo1KEnXD5lQmZepeKI=;
        b=GCR60C5DBC01/qWnr4zwtAfnLcZ8IEJ013pCwzT8u8Z0F2K1ypQggLlTQSbHw3PqWt
         sb5Tm7XwB5C8i2OE8rpdqWvCEVI/NjePBjdmjcPyrGwjQ7Rf5Tcu86ur1W5Bn/aGMnM4
         c6nUnMxagSbGhrwK6MViwzh1FrXFxtrjCsRPZ6jpcyuYmk5dYZRu7kFKE1T16OanOWwI
         pTehZQlG5FgiyOSKVw1ZuEj5iQBGZWFveYUoM+DOIzlkOOUKxyBhfeTr2OPCp2qjScMs
         4GTzN7VBtwHLEdqksgZHDTZNjdbvo1Z3QckUITfVN+TrpXZP/mQxm1aXcFhaIezPASRM
         MV9A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x140si5098515qkb.43.2020.03.13.07.00.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Mar 2020 07:00:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jCkrt-0005Zv-M0
	for alex.bennee@linaro.org; Fri, 13 Mar 2020 10:00:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42715)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>) id 1jCkrX-0005Xr-M2
 for qemu-arm@nongnu.org; Fri, 13 Mar 2020 10:00:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <remi@remlab.net>) id 1jCkrV-0000m1-U2
 for qemu-arm@nongnu.org; Fri, 13 Mar 2020 10:00:31 -0400
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:49726
 helo=ns207790.ip-94-23-215.eu) by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <remi@remlab.net>)
 id 1jCkrV-0000do-KU; Fri, 13 Mar 2020 10:00:29 -0400
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id B2F3E5FD7F;
 Fri, 13 Mar 2020 15:00:24 +0100 (CET)
From: =?UTF-8?q?R=C3=A9mi=20Denis-Courmont?= <remi@remlab.net>
To: qemu-arm@nongnu.org
Subject: [PATCH 3/5] target/arm: MTE unprivileged system mode disassembly
Date: Fri, 13 Mar 2020 16:00:21 +0200
Message-Id: <20200313140023.83844-3-remi@remlab.net>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2001:41d0:2:5a1a::
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6y6C1d4sJVhR

From: R=C3=A9mi Denis-Courmont <remi.denis.courmont@huawei.com>

This adds the MTE instructions that conditionally available at EL0,
but undefined in Linux user mode.

Signed-off-by: R=C3=A9mi Denis-Courmont <remi.denis.courmont@huawei.com>
---
 target/arm/helper.c | 56 +++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 54 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index ed56198623..dd64fcb4ef 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6837,6 +6837,18 @@ static const ARMCPRegInfo dcpodp_reg[] =3D {
       .accessfn =3D aa64_cacheop_poc_access, .writefn =3D dccvap_writefn=
 },
     REGINFO_SENTINEL
 };
+
+static const ARMCPRegInfo mte_dcpodp_reginfo[] =3D {
+    { .name =3D "DC_CGVADP", .state =3D ARM_CP_STATE_AA64,
+      .opc0 =3D 1, .opc1 =3D 3, .crn =3D 7, .crm =3D 13, .opc2 =3D 3,
+      .access =3D PL0_W, .type =3D ARM_CP_NO_RAW | ARM_CP_SUPPRESS_TB_EN=
D,
+      .accessfn =3D aa64_cacheop_poc_access, .writefn =3D dccvap_writefn=
 },
+    { .name =3D "DC_CGDVADP", .state =3D ARM_CP_STATE_AA64,
+      .opc0 =3D 1, .opc1 =3D 3, .crn =3D 7, .crm =3D 13, .opc2 =3D 5,
+      .access =3D PL0_W, .type =3D ARM_CP_NO_RAW | ARM_CP_SUPPRESS_TB_EN=
D,
+      .accessfn =3D aa64_cacheop_poc_access, .writefn =3D dccvap_writefn=
 },
+    REGINFO_SENTINEL
+};
 #endif /*CONFIG_USER_ONLY*/
=20
 static uint64_t tco_read(CPUARMState *env, const ARMCPRegInfo *ri)
@@ -6856,10 +6868,44 @@ static void tco_write(CPUARMState *env, const ARM=
CPRegInfo *ri, uint64_t val)
 static const ARMCPRegInfo mte_reginfo[] =3D {
     { .name =3D "DC_GVA", .state =3D ARM_CP_STATE_AA64,
       .opc0 =3D 1, .opc1 =3D 3, .crn =3D 7, .crm =3D 4, .opc2 =3D 3,
-      .access =3D PL0_W, .type =3D ARM_CP_NOP },
+      .access =3D PL0_W, .type =3D ARM_CP_NOP,
+#ifndef CONFIG_USER_ONLY
+      .accessfn =3D aa64_zva_access,
+#endif
+    },
     { .name =3D "DC_GZVA", .state =3D ARM_CP_STATE_AA64,
       .opc0 =3D 1, .opc1 =3D 3, .crn =3D 7, .crm =3D 4, .opc2 =3D 4,
-      .access =3D PL0_W, .type =3D ARM_CP_DC_ZVA },
+      .access =3D PL0_W, .type =3D ARM_CP_DC_ZVA,
+#ifndef CONFIG_USER_ONLY
+      .accessfn =3D aa64_zva_access,
+#endif
+    },
+    { .name =3D "DC_CGVAC", .state =3D ARM_CP_STATE_AA64,
+      .opc0 =3D 1, .opc1 =3D 3, .crn =3D 7, .crm =3D 10, .opc2 =3D 3,
+      .access =3D PL0_W, .type =3D ARM_CP_NOP,
+      .accessfn =3D aa64_cacheop_poc_access },
+    { .name =3D "DC_CGDVAC", .state =3D ARM_CP_STATE_AA64,
+      .opc0 =3D 1, .opc1 =3D 3, .crn =3D 7, .crm =3D 10, .opc2 =3D 5,
+      .access =3D PL0_W, .type =3D ARM_CP_NOP,
+      .accessfn =3D aa64_cacheop_poc_access },
+#ifndef CONFIG_USER_ONLY
+    { .name =3D "DC_CGVAP", .state =3D ARM_CP_STATE_AA64,
+      .opc0 =3D 1, .opc1 =3D 3, .crn =3D 7, .crm =3D 12, .opc2 =3D 3,
+      .access =3D PL0_W, .type =3D ARM_CP_NO_RAW | ARM_CP_SUPPRESS_TB_EN=
D,
+      .accessfn =3D aa64_cacheop_poc_access, .writefn =3D dccvap_writefn=
 },
+    { .name =3D "DC_CGDVAP", .state =3D ARM_CP_STATE_AA64,
+      .opc0 =3D 1, .opc1 =3D 3, .crn =3D 7, .crm =3D 12, .opc2 =3D 5,
+      .access =3D PL0_W, .type =3D ARM_CP_NO_RAW | ARM_CP_SUPPRESS_TB_EN=
D,
+      .accessfn =3D aa64_cacheop_poc_access, .writefn =3D dccvap_writefn=
 },
+#endif
+    { .name =3D "DC_CIGVAC", .state =3D ARM_CP_STATE_AA64,
+      .opc0 =3D 1, .opc1 =3D 3, .crn =3D 7, .crm =3D 14, .opc2 =3D 3,
+      .access =3D PL0_W, .type =3D ARM_CP_NOP,
+      .accessfn =3D aa64_cacheop_poc_access },
+    { .name =3D "DC_CIGDVAC", .state =3D ARM_CP_STATE_AA64,
+      .opc0 =3D 1, .opc1 =3D 3, .crn =3D 7, .crm =3D 14, .opc2 =3D 5,
+      .access =3D PL0_W, .type =3D ARM_CP_NOP,
+      .accessfn =3D aa64_cacheop_poc_access },
     { .name =3D "TCO", .state =3D ARM_CP_STATE_AA64,
       .opc0 =3D 3, .opc1 =3D 3, .crn =3D 4, .crm =3D 2, .opc2 =3D 7,
       .access =3D PL0_RW, .type =3D ARM_CP_NO_RAW,
@@ -7985,6 +8031,12 @@ void register_cp_regs_for_features(ARMCPU *cpu)
 #endif /*CONFIG_USER_ONLY*/
     if (cpu_isar_feature(aa64_mte, cpu)) {
         define_arm_cp_regs(cpu, mte_reginfo);
+
+#ifndef CONFIG_USER_ONLY
+        if (cpu_isar_feature(aa64_dcpodp, cpu)) {
+            define_one_arm_cp_reg(cpu, mte_dcpodp_reginfo);
+        }
+#endif
     }
 #endif
=20
--=20
2.25.1

