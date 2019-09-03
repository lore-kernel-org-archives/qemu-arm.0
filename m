Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp341200wrp;
        Tue, 3 Sep 2019 04:50:49 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwXOTUfnXYYlQiLiZUmkSQ8Nhk7RhCo1pTYMoDdj/vhTKAP7erGflbJYXZyl55omQyIIzpY
X-Received: by 2002:ac8:1184:: with SMTP id d4mr33788220qtj.6.1567511449279;
        Tue, 03 Sep 2019 04:50:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567511449; cv=none;
        d=google.com; s=arc-20160816;
        b=e3dwQ/ZvMnaazmERrlslC5D+2vbnVXMBOfQhKCjek125wsRQrCJM/x6frsXWtPeKAx
         y4VVQ6GqVU9bYKX/smt4LxkdOB90eImYqq02u1HUZNPCL+J6GkRjzD1sH7Qv5GFSSU/B
         dXaVlhyGazYte6ZsSeRUCHaimdOgMin1b5UdK8+jbwDWZJwdWfY0FNJ1PVNfqaUpXJvl
         Aln5V+1pSfGD/DhFrsvpJIO6VUWSCTJEmvHKN8ZMyTLgaNxuPt42y7h+3l49FFEauxlV
         7m4SugIQu4fFanaP7g3j+ypkycfqOcriGuqotIMR7mgJgjylgDp1Rx4R6zYYTabiqW8y
         MdWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=F828P8WqelRrJ4rtCmRQmYIJjqcojiekaEL2qPmRFvw=;
        b=sDqrlscWgORANxDfdZo3w06XK5kxmQPttvmXWecVteAGKeG/v1G3DAe533pa9uTKR2
         xuOFhwM3wP2L4w1//BOeGjteNmNeGEO4Q9d6/ikAlT8Bh5l4JFvWRZl2iE3Arqj0AcUd
         thojlOC0Mu8UeJk2At9jtcmE73wG5gsAmmTU6CQcBrdffsrJoxOYrDN+9KKgaSyyrSCv
         hA8kZuQPJTUoQsVjUsCAphFX3bNaSrdWP+iw4VhSakcy/SSsj3H8zaiQoA0vk0+/YYD+
         fm9HDgB+WWvS1jlgyACw+B2Hq1jfc/Hgef/+DbkTdPwe5WrRwOvuSq/hcf1fQ+GgLfwT
         uzsw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v4si13214015qki.255.2019.09.03.04.50.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2019 04:50:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i57Ki-0000J2-K7
	for alex.bennee@linaro.org; Tue, 03 Sep 2019 07:50:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55159)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1i57Hr-00057Y-FL
 for qemu-arm@nongnu.org; Tue, 03 Sep 2019 07:47:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1i57Hq-00060G-Ee
 for qemu-arm@nongnu.org; Tue, 03 Sep 2019 07:47:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57510)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1i57Hq-0005zk-8d; Tue, 03 Sep 2019 07:47:50 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7F43A30832EA;
 Tue,  3 Sep 2019 11:47:49 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-102.brq.redhat.com [10.40.204.102])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EAFAF67600;
 Tue,  3 Sep 2019 11:47:46 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  3 Sep 2019 13:47:28 +0200
Message-Id: <20190903114729.3400-5-philmd@redhat.com>
In-Reply-To: <20190903114729.3400-1-philmd@redhat.com>
References: <20190903114729.3400-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Tue, 03 Sep 2019 11:47:49 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 4/5] target/arm: Restrict R and M profiles to
 TCG
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /ntor+DCEYzf

KVM is only able to run on CPUs based on the A-Profile architecture.

The following CPUs are disabled:

* M-Profile Architecture

  - Cortex-M3
  - Cortex-M4
  - Cortex-M33

* R-Profile Architecture

  - Cortex-R5
  - Cortex-R5F

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v2: list cpus
---
 target/arm/cpu.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index f69780147c..299c59fde4 100644
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
@@ -2545,7 +2547,6 @@ static const ARMCPUInfo arm_cpus[] =3D {
     { .name =3D "arm11mpcore", .initfn =3D arm11mpcore_initfn },
     { .name =3D "cortex-m0",   .initfn =3D cortex_m0_initfn,
                              .class_init =3D arm_v7m_class_init },
-#endif
     { .name =3D "cortex-m3",   .initfn =3D cortex_m3_initfn,
                              .class_init =3D arm_v7m_class_init },
     { .name =3D "cortex-m4",   .initfn =3D cortex_m4_initfn,
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

