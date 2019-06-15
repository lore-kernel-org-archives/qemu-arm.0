Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp681593wrg;
        Sat, 15 Jun 2019 08:54:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxuoC4J9xCEv6XcepaNzpRZ0QxOIPweoKfPZmSfUOx5jla3xxDbN3JNrisLvY8hQ2c5VB7D
X-Received: by 2002:a0c:94d6:: with SMTP id k22mr13500913qvk.58.1560614075071;
        Sat, 15 Jun 2019 08:54:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560614075; cv=none;
        d=google.com; s=arc-20160816;
        b=OjAfNbz7VX4vyTw22sDxNh5aMBsUyu9MNkK9wBFiaEIaT1IgwCBAlNK6yxEf1me6kf
         pHXyjj8QhYrt19kD8rvH38WVEoR+020Q2aZE60cZGzlYt4QeFhVYvDYA9Q0Gq1K7wNZE
         A6l5acdIT5LhPj34ymJ5I93JZ9kkHUEQ+0QI7vahIo2u1gpejUrjtnLac3Xq6vqMIRa+
         MMSfQQaxZ9idTUbJuQG7JVoPA6YlYcnl5FAmJnbdK6LSL4Nz3Xi8cnrl30i4N1wUFCH5
         2hBjMNtvUPfm68wzl0qEanJ5H2O3404ehdTQOrr4MgvwFvWvxYLFe7EJrUYwbYg91r0x
         hi1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=p+4bCpESr3myRmoclUjhrbERD8FA7gFmTHFc1KnCmkw=;
        b=dUaJu4rVWK4hePTQhnAmn39OirNfHkVKg921NAH8peU4GGpkTIqiUqHTivNziIIDra
         0b8L+m5/PaEzSGDYBEpUUyLY6mM4mow/AwbDIoVCeJgjDH/Z9sxYxiwcSoyfoy0nfGmt
         c/DldGOIYrjidGv5kmGI+g7CQxC5uISg4KQ6K+vbl1HjGYJoORASxyTiwXN+ENsMrqKf
         /w8OXa9aYao4hkV61Q2uJ7FbTEQZ93LReUwOPmzBC8SEIq9l2X5hSE3Pbat8b14VBL6i
         9Lu3nZ83DbMAWALqeytLoqvpkt+ThTQ4eVk0y3MDyorf/HO+gOFPP4NEx+53HUWZzAdC
         dAbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5si4195812qtr.262.2019.06.15.08.54.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 Jun 2019 08:54:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:32938 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hcB0k-00048m-J4
	for alex.bennee@linaro.org; Sat, 15 Jun 2019 11:54:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35663)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hcAqp-0003q9-6U
 for qemu-arm@nongnu.org; Sat, 15 Jun 2019 11:44:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hcAqn-0000CN-Uu
 for qemu-arm@nongnu.org; Sat, 15 Jun 2019 11:44:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35484)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hcAqn-00009n-Nb; Sat, 15 Jun 2019 11:44:17 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F2C9C3082E55;
 Sat, 15 Jun 2019 15:44:16 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-41.brq.redhat.com [10.40.204.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8AAEB1001B05;
 Sat, 15 Jun 2019 15:44:13 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Sat, 15 Jun 2019 17:43:38 +0200
Message-Id: <20190615154352.26824-10-philmd@redhat.com>
In-Reply-To: <20190615154352.26824-1-philmd@redhat.com>
References: <20190615154352.26824-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Sat, 15 Jun 2019 15:44:17 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 09/23] target/arm: Move code around
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
X-TUID: 0jAuz48i6Lx9

To ease the review of the next commit, move the
write_v7m_exception() function around.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 target/arm/helper.c | 40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index a829086c6d..b4fd9b42d7 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7923,26 +7923,6 @@ void write_v7m_control_spsel(CPUARMState *env, boo=
l new_spsel)
     write_v7m_control_spsel_for_secstate(env, new_spsel, env->v7m.secure=
);
 }
=20
-void write_v7m_exception(CPUARMState *env, uint32_t new_exc)
-{
-    /*
-     * Write a new value to v7m.exception, thus transitioning into or ou=
t
-     * of Handler mode; this may result in a change of active stack poin=
ter.
-     */
-    bool new_is_psp, old_is_psp =3D v7m_using_psp(env);
-    uint32_t tmp;
-
-    env->v7m.exception =3D new_exc;
-
-    new_is_psp =3D v7m_using_psp(env);
-
-    if (old_is_psp !=3D new_is_psp) {
-        tmp =3D env->v7m.other_sp;
-        env->v7m.other_sp =3D env->regs[13];
-        env->regs[13] =3D tmp;
-    }
-}
-
 /* Switch M profile security state between NS and S */
 void switch_v7m_security_state(CPUARMState *env, bool new_secstate)
 {
@@ -9247,6 +9227,26 @@ static bool do_v7m_function_return(ARMCPU *cpu)
     return true;
 }
=20
+void write_v7m_exception(CPUARMState *env, uint32_t new_exc)
+{
+    /*
+     * Write a new value to v7m.exception, thus transitioning into or ou=
t
+     * of Handler mode; this may result in a change of active stack poin=
ter.
+     */
+    bool new_is_psp, old_is_psp =3D v7m_using_psp(env);
+    uint32_t tmp;
+
+    env->v7m.exception =3D new_exc;
+
+    new_is_psp =3D v7m_using_psp(env);
+
+    if (old_is_psp !=3D new_is_psp) {
+        tmp =3D env->v7m.other_sp;
+        env->v7m.other_sp =3D env->regs[13];
+        env->regs[13] =3D tmp;
+    }
+}
+
 void arm_log_exception(int idx)
 {
     if (qemu_loglevel_mask(CPU_LOG_INT)) {
--=20
2.20.1

