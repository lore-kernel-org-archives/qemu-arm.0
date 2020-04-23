Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp1657017lfm;
        Thu, 23 Apr 2020 02:04:57 -0700 (PDT)
X-Google-Smtp-Source: APiQypK+5vREbpv3Xu4IVwfWwZFp/khwUnGLRzavkUfcpISXp16BYGF072m5J3AsDiCqCCfeUPba
X-Received: by 2002:a0c:9b89:: with SMTP id o9mr3000711qve.131.1587632697516;
        Thu, 23 Apr 2020 02:04:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587632697; cv=none;
        d=google.com; s=arc-20160816;
        b=ZoEfL+pKSZYR/5kELcZANx3YnJTYxqHFpCtpk0/0ZohbiH/CsI3qbUop3H0AhJkoXW
         qeREf3pnDlQRaikhNh0fHnurN3uTntldYVMlvRCLiIRs5dk8yNecrOq6lOZoMGH3SnFD
         N5X3UVDtgQndFFX2I+o5b4QAPf6NmMpkpkk5VUuS4Uzq3ztMpUi1tVCLeD+r7UttLzc9
         uA2L+4w5G3sy0sQaK23EeHSEe0OqFgPvtVeAf9tNW4kLP+vQ24MqMHpI6LPKfw5UOMz5
         ZtLZt59vY2s1+mSDjnmBPfhwU6/AC2tqSYMAdiysHfgme6okXQCMCUL4NlnCe+zJO2AV
         dvlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=r/fhSjRqs+Ys5sprbZ/8oJ7RI28IVckcHXOWtxh8yWA=;
        b=VVQ2MHhYHysC4mWGEaA08cbMQF1/xRYpHAEwpe1OnpsFt5XU0p5+nuUexWbHDVvNK7
         OtbDgxMPZh4ypqv2u2YRCWm47I/0qGUFlAp5Uo7h6FiXNV1+8mRAOUCcD7t5EbBET9c/
         gJ8PkOia8Q/2VJm6HEnrYnp3FBRuu0DS9VT4jD+gYlo2cEocAoMZ9XKGLbfJJxvlletT
         gkco9UpN5wZpQIPb9iGS4ZAAqfXuBCBVMnHsoYcUdOfI4ckJwWuRaaZWk/FqT6K1J5hs
         l0/Pa0QXFd2aiWgfwcV+6CV9juJyxPJaLTZClgnxXWrD9T5HuoSh2eFycxGua97JjUDk
         C0xg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r38si905497qte.152.2020.04.23.02.04.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Apr 2020 02:04:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jRXmy-0004o9-Rq
	for alex.bennee@linaro.org; Thu, 23 Apr 2020 05:04:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36084)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>) id 1jRXje-0000mR-NY
 for qemu-arm@nongnu.org; Thu, 23 Apr 2020 05:01:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>) id 1jRXjb-0001Ds-DP
 for qemu-arm@nongnu.org; Thu, 23 Apr 2020 05:01:30 -0400
Received: from andre.telenet-ops.be ([2a02:1800:120:4::f00:15]:34534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <geert@linux-m68k.org>)
 id 1jRXja-0001Bf-5n
 for qemu-arm@nongnu.org; Thu, 23 Apr 2020 05:01:26 -0400
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:89cc:efc7:85ce:4669])
 by andre.telenet-ops.be with bizsmtp
 id W91L2200i1RvcFS0191LLp; Thu, 23 Apr 2020 11:01:21 +0200
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1jRXjU-0006kB-Al; Thu, 23 Apr 2020 11:01:20 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1jRXjU-0002vU-8q; Thu, 23 Apr 2020 11:01:20 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexander Graf <graf@amazon.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bartekgola@gmail.com>,
 Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH QEMU v2 1/5] ARM: PL061: Move TYPE_PL061 to hw/gpio/pl061.h
Date: Thu, 23 Apr 2020 11:01:14 +0200
Message-Id: <20200423090118.11199-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200423090118.11199-1-geert+renesas@glider.be>
References: <20200423090118.11199-1-geert+renesas@glider.be>
Received-SPF: none client-ip=2a02:1800:120:4::f00:15;
 envelope-from=geert@linux-m68k.org; helo=andre.telenet-ops.be
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a02:1800:120:4::f00:15
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
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VToQiMjeUXmS

Move the definition of TYPE_PL061 to a new header file, so it can be
used outside the driver.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.
---
 MAINTAINERS             |  1 +
 hw/gpio/pl061.c         |  2 +-
 include/hw/gpio/pl061.h | 16 ++++++++++++++++
 3 files changed, 18 insertions(+), 1 deletion(-)
 create mode 100644 include/hw/gpio/pl061.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 8cbc1fac2bfcec86..e760f65270d29d5d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -538,6 +538,7 @@ F: hw/dma/pl080.c
 F: include/hw/dma/pl080.h
 F: hw/dma/pl330.c
 F: hw/gpio/pl061.c
+F: include/hw/gpio/pl061.h
 F: hw/input/pl050.c
 F: hw/intc/pl190.c
 F: hw/sd/pl181.c
diff --git a/hw/gpio/pl061.c b/hw/gpio/pl061.c
index 2a828260bdb0b946..e776c09e474216ef 100644
--- a/hw/gpio/pl061.c
+++ b/hw/gpio/pl061.c
@@ -9,6 +9,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "hw/gpio/pl061.h"
 #include "hw/irq.h"
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
@@ -33,7 +34,6 @@ static const uint8_t pl061_id[12] =
 static const uint8_t pl061_id_luminary[12] =
   { 0x00, 0x00, 0x00, 0x00, 0x61, 0x00, 0x18, 0x01, 0x0d, 0xf0, 0x05, 0xb1 };
 
-#define TYPE_PL061 "pl061"
 #define PL061(obj) OBJECT_CHECK(PL061State, (obj), TYPE_PL061)
 
 typedef struct PL061State {
diff --git a/include/hw/gpio/pl061.h b/include/hw/gpio/pl061.h
new file mode 100644
index 0000000000000000..78cc40c52679dc4e
--- /dev/null
+++ b/include/hw/gpio/pl061.h
@@ -0,0 +1,16 @@
+/*
+ * Arm PrimeCell PL061 General Purpose IO with additional Luminary Micro
+ * Stellaris bits.
+ *
+ * Copyright (c) 2007 CodeSourcery.
+ * Written by Paul Brook
+ *
+ * This code is licensed under the GPL.
+ */
+
+#ifndef PL061_GPIO_H
+#define PL061_GPIO_H
+
+#define TYPE_PL061 "pl061"
+
+#endif /* PL061_GPIO_H */
-- 
2.17.1

