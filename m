Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp615127wrs;
        Fri, 23 Aug 2019 07:02:34 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyy8SfBXKhtZM0b4k9k7jAntTUnxJ8M8Ge1LAM+jleI3AqT673WqIDCVdw2YvjQI41+XdAN
X-Received: by 2002:a50:f4c1:: with SMTP id v1mr4506781edm.282.1566568954459;
        Fri, 23 Aug 2019 07:02:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566568954; cv=none;
        d=google.com; s=arc-20160816;
        b=hbykuCVfijwXOACATefldMw80RcBCxDU/biksqMGyqW01iydecDMeKrGRS8vh84zSW
         kvk66xwKxa52aJoXDw8Z+fBfmfzsS/ZBYPGfIZccZRpqGI0UCE+l9z+wqiC9hy9YrPI5
         50sv/i4FvQ50r7RsElG99tG6A08sVFyataSRNnGAkcE36RwuZji1ZuPidVuCUMjsKZ09
         ucaUltvLUKRt80e2PU1wrLpq6F/LFavQQDIFiE++CJz6vYrXOX0ielnO0nAqY4J7SxVW
         Z3oy0mTb4W91NNgfj70oaZaaQXRyXw5yf3R1yjoShleu1XW8yGAmLSfSNvMbnEVrHOfJ
         vdrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=60Ua6smbVSQYXnY8tvdEOy/6LyxjpK0n9BZkpFIIOqg=;
        b=sjPnKc/2y8dVDL2+MORLTDeD/AkJh50NvcsFJOWuWRgTAkUtuwrcbN7cOjWcJYtf/a
         CQAKyfkmkKd7G6Nu/dQJtdBhxGitrdi3n1Zktub6msRPNjuAf56p5xZDsVbmlpD5NOyO
         wILNu0PxBr+Mn8WN+urA5k4ypVczz/8hMcjUvO3qjMTOQaoTjsp5dOJQqSgAFz2h7gaB
         Y2VrhZEqLz/nrpWDEWpHZlXHsZn/mS5nbbwC8YxBPghKS8M0NxhZ+ORVIdL04vK9AL1T
         ZLrQpvuOwYKOtmrsSUVrb0uxvu9/nhtoSDSkXSXtrTFyQhjiBLBGrjp3rQe43I46NnxI
         KKZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pj26si1445296ejb.11.2019.08.23.07.02.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Aug 2019 07:02:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i1A9B-0004ZA-9q
	for alex.bennee@linaro.org; Fri, 23 Aug 2019 10:02:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44814)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1i1A5B-0001RN-Kk
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 09:58:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1i1A5A-0007JA-K8
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 09:58:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48410)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1i1A5A-0007Im-FB; Fri, 23 Aug 2019 09:58:24 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id AEC3718C4271;
 Fri, 23 Aug 2019 13:58:23 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-118.brq.redhat.com [10.40.204.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BD70E261A7;
 Fri, 23 Aug 2019 13:58:21 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 23 Aug 2019 15:58:09 +0200
Message-Id: <20190823135811.13883-3-philmd@redhat.com>
In-Reply-To: <20190823135811.13883-1-philmd@redhat.com>
References: <20190823135811.13883-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.62]); Fri, 23 Aug 2019 13:58:23 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 2/4] target/arm: Restrict R and M profiles to TCG
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: w0oVGIX2tkZd

KVM is only able to run A profile cpus.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 target/arm/cpu.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 522485a2de..299c59fde4 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -462,7 +462,9 @@ bool arm_cpu_exec_interrupt(CPUState *cs, int interru=
pt_request)
     return ret;
 }
=20
-#if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
+/* CPU models. These are not needed for the AArch64 linux-user build. */
+#if (!defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)) \
+    && defined(CONFIG_TCG)
 static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_reque=
st)
 {
     CPUClass *cc =3D CPU_GET_CLASS(cs);
@@ -1902,8 +1904,6 @@ static void cortex_m0_initfn(Object *obj)
     cpu->midr =3D 0x410cc200;
 }
=20
-#endif
-
 static void cortex_m3_initfn(Object *obj)
 {
     ARMCPU *cpu =3D ARM_CPU(obj);
@@ -2057,6 +2057,8 @@ static void cortex_r5f_initfn(Object *obj)
     cpu->isar.mvfr1 =3D 0x00000011;
 }
=20
+#endif
+
 static const ARMCPRegInfo cortexa8_cp_reginfo[] =3D {
     { .name =3D "L2LOCKDOWN", .cp =3D 15, .crn =3D 9, .crm =3D 0, .opc1 =
=3D 1, .opc2 =3D 0,
       .access =3D PL1_RW, .type =3D ARM_CP_CONST, .resetvalue =3D 0 },
@@ -2544,7 +2546,6 @@ static const ARMCPUInfo arm_cpus[] =3D {
     { .name =3D "arm1176",     .initfn =3D arm1176_initfn },
     { .name =3D "arm11mpcore", .initfn =3D arm11mpcore_initfn },
     { .name =3D "cortex-m0",   .initfn =3D cortex_m0_initfn,
-#endif
                              .class_init =3D arm_v7m_class_init },
     { .name =3D "cortex-m3",   .initfn =3D cortex_m3_initfn,
                              .class_init =3D arm_v7m_class_init },
@@ -2554,6 +2555,7 @@ static const ARMCPUInfo arm_cpus[] =3D {
                              .class_init =3D arm_v7m_class_init },
     { .name =3D "cortex-r5",   .initfn =3D cortex_r5_initfn },
     { .name =3D "cortex-r5f",  .initfn =3D cortex_r5f_initfn },
+#endif
     { .name =3D "cortex-a7",   .initfn =3D cortex_a7_initfn },
     { .name =3D "cortex-a8",   .initfn =3D cortex_a8_initfn },
     { .name =3D "cortex-a9",   .initfn =3D cortex_a9_initfn },
--=20
2.20.1

