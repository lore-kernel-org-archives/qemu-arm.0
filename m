Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp675311wrg;
        Sat, 15 Jun 2019 08:44:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxMftNv694nPcklVz4oPFZJqAhA2MKOJg+HQFEw54h/qrEjq0DarBMyWojXb3kRbJ+JCrH7
X-Received: by 2002:a0c:bf4a:: with SMTP id b10mr12069285qvj.120.1560613495584;
        Sat, 15 Jun 2019 08:44:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560613495; cv=none;
        d=google.com; s=arc-20160816;
        b=ydXbwSh+f1JRNO7eo4OlhvnD4uBsmHE16U6zjPYWVGxftDWNdBqbryzO10Vrlq8oBI
         a1TclO8RU4TL8SbyTuCqiGsY3ael0KO2FcsoZDjCNFr1ByZXo2DiEFeRWveiOnjD4BtE
         S1vlc1Xf1jw8hQN4KIoJjbLezYCFlID2r0MddqQAceH2P1Ln6SBuqbrPFDAIsIIQj8N3
         LAhu2mECnbqj0YAfoHRABCMjHP55DJyJ/ieVMxClk7LDIJ5eFMbCHQc+YJzDrdW5PGWV
         Fica+k9t65aZgXjiFpzDNgQOZl0PGpqD+HUc1q03IamkARRyD1q9EQH3RuFugCK10A4Z
         ubNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=YmKgfjW28XK9uiTZcyiCGg1a6rU+Pyt+L4kQ6cdv7yM=;
        b=GsMkKU7TIUnvj7Foyyz6ykAPzpwx4vWF6N5b3/zBd5c9rl1fz9EpsHGY+11en7TI6p
         WcUcoT86+Y2uzPC67AUPH/Ai8muYQODvryT5CNurbMh0UMbt0py4HZo1U9a4PRFC1Aae
         Xwy16SwUL+z6oxgDz+AfkBnBs4lbnCsEf0MiYz7bjveSbGjbGfxPcc6gNTtT7SxO448M
         2meiW+XiXImSuS1MtnBxyF8w6wqgOdDQsioC3J0q24U66nMjNk6Fw9thXmid9M31aJV9
         r0CcRuuNAtK4m1yiJB3R6jwVd4tDI+5aADMUOjMVVZtzjCrrUl7hc7XhFkrS2/6+L7dy
         1cww==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w17si4246487qka.183.2019.06.15.08.44.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 Jun 2019 08:44:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:32878 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hcArP-0004KQ-3i
	for alex.bennee@linaro.org; Sat, 15 Jun 2019 11:44:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35748)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hcAqs-0003yI-Uv
 for qemu-arm@nongnu.org; Sat, 15 Jun 2019 11:44:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hcAqr-0000NI-HV
 for qemu-arm@nongnu.org; Sat, 15 Jun 2019 11:44:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48338)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hcAqr-0000KM-8L; Sat, 15 Jun 2019 11:44:21 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 65DF381129;
 Sat, 15 Jun 2019 15:44:20 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-41.brq.redhat.com [10.40.204.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 266831001B05;
 Sat, 15 Jun 2019 15:44:18 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Sat, 15 Jun 2019 17:43:40 +0200
Message-Id: <20190615154352.26824-12-philmd@redhat.com>
In-Reply-To: <20190615154352.26824-1-philmd@redhat.com>
References: <20190615154352.26824-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Sat, 15 Jun 2019 15:44:20 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 11/23] target/arm: Declare v7m_cpacr_pass()
 publicly
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
X-TUID: rnNj9IUbHfle

In the next commit we will move exception handling routines to
v7m_helper, so this function will be called from 2 different
files. Declare it inlined in the "internals.h" header.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 target/arm/helper.c    | 19 -------------------
 target/arm/internals.h | 21 +++++++++++++++++++++
 2 files changed, 21 insertions(+), 19 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index cf76010ea1..5d05db84d3 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7611,25 +7611,6 @@ uint32_t arm_phys_excp_target_el(CPUState *cs, uin=
t32_t excp_idx,
     return target_el;
 }
=20
-/*
- * Return true if the v7M CPACR permits access to the FPU for the specif=
ied
- * security state and privilege level.
- */
-static bool v7m_cpacr_pass(CPUARMState *env, bool is_secure, bool is_pri=
v)
-{
-    switch (extract32(env->v7m.cpacr[is_secure], 20, 2)) {
-    case 0:
-    case 2: /* UNPREDICTABLE: we treat like 0 */
-        return false;
-    case 1:
-        return is_priv;
-    case 3:
-        return true;
-    default:
-        g_assert_not_reached();
-    }
-}
-
 /*
  * What kind of stack write are we doing? This affects how exceptions
  * generated during the stacking are treated.
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 04711b317a..1d15af3f8b 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -891,6 +891,27 @@ static inline uint32_t v7m_sp_limit(CPUARMState *env=
)
     }
 }
=20
+/**
+ * v7m_cpacr_pass:
+ * Return true if the v7M CPACR permits access to the FPU for the specif=
ied
+ * security state and privilege level.
+ */
+static inline bool v7m_cpacr_pass(CPUARMState *env,
+                                  bool is_secure, bool is_priv)
+{
+    switch (extract32(env->v7m.cpacr[is_secure], 20, 2)) {
+    case 0:
+    case 2: /* UNPREDICTABLE: we treat like 0 */
+        return false;
+    case 1:
+        return is_priv;
+    case 3:
+        return true;
+    default:
+        g_assert_not_reached();
+    }
+}
+
 /**
  * aarch32_mode_name(): Return name of the AArch32 CPU mode
  * @psr: Program Status Register indicating CPU mode
--=20
2.20.1

