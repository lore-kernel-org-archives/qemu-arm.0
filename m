Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp681697wrg;
        Sat, 15 Jun 2019 08:54:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqye62WzjAUXqUS8sVzW/SqWLXYDrwTn5fBKyv1pet6m8AkOdBq+mkVJpU8PqJHdbP9/2Ew1
X-Received: by 2002:ac8:270e:: with SMTP id g14mr85273275qtg.65.1560614085317;
        Sat, 15 Jun 2019 08:54:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560614085; cv=none;
        d=google.com; s=arc-20160816;
        b=KrdtwC9GI7dlDzH4xGJ8ubHpKTY91iSO27FDc57ibdWf99DSMTSyvWbDWTM0hyROB8
         nfiNXQ3InWe2BU12KfGGilq5DVmcYtXtR1RTI/cbxn6ILgnQkdcA+t+joybp2pWavCn7
         2QSSBXju9fMNch1dXcElxQnsz4D0n/3b6kLLtD5HVSfA2TepRHOCS5Q4+22OCTRDZ3Uv
         dQOeBLtZn7/ZW4Aho5hMl7Ht5ktSx77WCQDcBGkdPltsaV1YjKQ+syz+r4lSqx3/PO42
         gaMmigSgKWjJYg6iL04LCZaj7qztQh5bApuOL05EXX9H3LVAJoL3Ez9GE+vm1jtOt/bW
         IJeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=3jTXkRJ0hel/Z+lOnDST0fjvVTp3zJUp+mpNTKOc+sE=;
        b=XpeMgYtWd+MRUrSD8/5XyBP5+VqiI4iXbfBxcFbqqQvTc6Yy5vzVfWHGjRBRdxIh+8
         3xPPJY/gdZ79eOOjt81iDV42VLAIWJ8ZcOfRYEK7Ybup6C7GjKJRzJVsdStEPewPyn+0
         sNKEnpDOssILuhdX4fmRO5KK1iniTXe+rzVrKIiqa3nIbytOtwlm/Jy3VVDmgnf2AAFq
         ndXqpz+CONAPmJNDfEZY9cN9mOfnxdiusbLH21nGUYtaGWm4MZi42h8ybe7ccn+OKsXR
         scng0jyzYpratufUf6+oAeIRzKgeT7lyVEJEUHY0FtIcvYMr1LWkkhzVZW9UyXHvq7jo
         P26g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 48si4066696qvj.123.2019.06.15.08.54.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 Jun 2019 08:54:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:32946 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hcB0u-0004VI-Ny
	for alex.bennee@linaro.org; Sat, 15 Jun 2019 11:54:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35718)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hcAqr-0003vq-S3
 for qemu-arm@nongnu.org; Sat, 15 Jun 2019 11:44:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hcAqp-0000IJ-Vm
 for qemu-arm@nongnu.org; Sat, 15 Jun 2019 11:44:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35500)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hcAqp-0000FO-JB; Sat, 15 Jun 2019 11:44:19 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id AEEEC3082E20;
 Sat, 15 Jun 2019 15:44:18 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-41.brq.redhat.com [10.40.204.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6DE041001B05;
 Sat, 15 Jun 2019 15:44:17 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Sat, 15 Jun 2019 17:43:39 +0200
Message-Id: <20190615154352.26824-11-philmd@redhat.com>
In-Reply-To: <20190615154352.26824-1-philmd@redhat.com>
References: <20190615154352.26824-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Sat, 15 Jun 2019 15:44:18 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 10/23] target/arm: Move the v7-M Security
 State helpers to v7m_helper
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QWl1Gsww6e71

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 target/arm/helper.c     | 73 -----------------------------------------
 target/arm/v7m_helper.c | 73 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 73 insertions(+), 73 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index b4fd9b42d7..cf76010ea1 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7885,79 +7885,6 @@ void HELPER(v7m_preserve_fp_state)(CPUARMState *en=
v)
      */
 }
=20
-/*
- * Write to v7M CONTROL.SPSEL bit for the specified security bank.
- * This may change the current stack pointer between Main and Process
- * stack pointers if it is done for the CONTROL register for the current
- * security state.
- */
-void write_v7m_control_spsel_for_secstate(CPUARMState *env,
-                                          bool new_spsel,
-                                          bool secstate)
-{
-    bool old_is_psp =3D v7m_using_psp(env);
-
-    env->v7m.control[secstate] =3D
-        deposit32(env->v7m.control[secstate],
-                  R_V7M_CONTROL_SPSEL_SHIFT,
-                  R_V7M_CONTROL_SPSEL_LENGTH, new_spsel);
-
-    if (secstate =3D=3D env->v7m.secure) {
-        bool new_is_psp =3D v7m_using_psp(env);
-        uint32_t tmp;
-
-        if (old_is_psp !=3D new_is_psp) {
-            tmp =3D env->v7m.other_sp;
-            env->v7m.other_sp =3D env->regs[13];
-            env->regs[13] =3D tmp;
-        }
-    }
-}
-
-/*
- * Write to v7M CONTROL.SPSEL bit. This may change the current
- * stack pointer between Main and Process stack pointers.
- */
-void write_v7m_control_spsel(CPUARMState *env, bool new_spsel)
-{
-    write_v7m_control_spsel_for_secstate(env, new_spsel, env->v7m.secure=
);
-}
-
-/* Switch M profile security state between NS and S */
-void switch_v7m_security_state(CPUARMState *env, bool new_secstate)
-{
-    uint32_t new_ss_msp, new_ss_psp;
-
-    if (env->v7m.secure =3D=3D new_secstate) {
-        return;
-    }
-
-    /*
-     * All the banked state is accessed by looking at env->v7m.secure
-     * except for the stack pointer; rearrange the SP appropriately.
-     */
-    new_ss_msp =3D env->v7m.other_ss_msp;
-    new_ss_psp =3D env->v7m.other_ss_psp;
-
-    if (v7m_using_psp(env)) {
-        env->v7m.other_ss_psp =3D env->regs[13];
-        env->v7m.other_ss_msp =3D env->v7m.other_sp;
-    } else {
-        env->v7m.other_ss_msp =3D env->regs[13];
-        env->v7m.other_ss_psp =3D env->v7m.other_sp;
-    }
-
-    env->v7m.secure =3D new_secstate;
-
-    if (v7m_using_psp(env)) {
-        env->regs[13] =3D new_ss_psp;
-        env->v7m.other_sp =3D new_ss_msp;
-    } else {
-        env->regs[13] =3D new_ss_msp;
-        env->v7m.other_sp =3D new_ss_psp;
-    }
-}
-
 static uint32_t *get_v7m_sp_ptr(CPUARMState *env, bool secure, bool thre=
admode,
                                 bool spsel)
 {
diff --git a/target/arm/v7m_helper.c b/target/arm/v7m_helper.c
index 321154966e..558e143039 100644
--- a/target/arm/v7m_helper.c
+++ b/target/arm/v7m_helper.c
@@ -88,6 +88,79 @@ uint32_t HELPER(v7m_tt)(CPUARMState *env, uint32_t add=
r, uint32_t op)
=20
 #else
=20
+/*
+ * Write to v7M CONTROL.SPSEL bit for the specified security bank.
+ * This may change the current stack pointer between Main and Process
+ * stack pointers if it is done for the CONTROL register for the current
+ * security state.
+ */
+void write_v7m_control_spsel_for_secstate(CPUARMState *env,
+                                          bool new_spsel,
+                                          bool secstate)
+{
+    bool old_is_psp =3D v7m_using_psp(env);
+
+    env->v7m.control[secstate] =3D
+        deposit32(env->v7m.control[secstate],
+                  R_V7M_CONTROL_SPSEL_SHIFT,
+                  R_V7M_CONTROL_SPSEL_LENGTH, new_spsel);
+
+    if (secstate =3D=3D env->v7m.secure) {
+        bool new_is_psp =3D v7m_using_psp(env);
+        uint32_t tmp;
+
+        if (old_is_psp !=3D new_is_psp) {
+            tmp =3D env->v7m.other_sp;
+            env->v7m.other_sp =3D env->regs[13];
+            env->regs[13] =3D tmp;
+        }
+    }
+}
+
+/*
+ * Write to v7M CONTROL.SPSEL bit. This may change the current
+ * stack pointer between Main and Process stack pointers.
+ */
+void write_v7m_control_spsel(CPUARMState *env, bool new_spsel)
+{
+    write_v7m_control_spsel_for_secstate(env, new_spsel, env->v7m.secure=
);
+}
+
+/* Switch M profile security state between NS and S */
+void switch_v7m_security_state(CPUARMState *env, bool new_secstate)
+{
+    uint32_t new_ss_msp, new_ss_psp;
+
+    if (env->v7m.secure =3D=3D new_secstate) {
+        return;
+    }
+
+    /*
+     * All the banked state is accessed by looking at env->v7m.secure
+     * except for the stack pointer; rearrange the SP appropriately.
+     */
+    new_ss_msp =3D env->v7m.other_ss_msp;
+    new_ss_psp =3D env->v7m.other_ss_psp;
+
+    if (v7m_using_psp(env)) {
+        env->v7m.other_ss_psp =3D env->regs[13];
+        env->v7m.other_ss_msp =3D env->v7m.other_sp;
+    } else {
+        env->v7m.other_ss_msp =3D env->regs[13];
+        env->v7m.other_ss_psp =3D env->v7m.other_sp;
+    }
+
+    env->v7m.secure =3D new_secstate;
+
+    if (v7m_using_psp(env)) {
+        env->regs[13] =3D new_ss_psp;
+        env->v7m.other_sp =3D new_ss_msp;
+    } else {
+        env->regs[13] =3D new_ss_msp;
+        env->v7m.other_sp =3D new_ss_psp;
+    }
+}
+
 void HELPER(v7m_bxns)(CPUARMState *env, uint32_t dest)
 {
     /*
--=20
2.20.1

