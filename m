Received: by 10.223.188.70 with SMTP id a6csp5086594wrh;
        Tue, 22 Aug 2017 08:29:40 -0700 (PDT)
X-Received: by 10.237.45.98 with SMTP id h89mr1540113qtd.74.1503415780222;
        Tue, 22 Aug 2017 08:29:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503415780; cv=none;
        d=google.com; s=arc-20160816;
        b=At/dlHmHbDCblHM+Gv7WH7hhJgkX+tEXPkZzpoVK/T2ljIne4h6e2AG2acCJpQWCeP
         bf2D8muxmBOR3D5aumIqS+7rlxOUpu5vTJjVoFcPHxhaZ1MuS3ZIGz6e4BsOfVVlz3Jh
         R0KCHyjw18a8ROL1iuBVX30W3VHBrjDQ+u5cvC+gxwHY4Mss03BPZbCHYW9BkZpWc0rj
         iDVGcad2GQCiumTZLNJTJPMaB72J1C48NH48fvTRFudBKOXy4/VQny18Vk38bz5xHcsX
         Lg4G2PMdNGhTKfB2FULedvTn/ct5Ypzf6iOzRhI4gDx6ztrWnOvixPXx4t3A5ymjhp8b
         EWtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=2wRUDHW6BYy8nSk4IUjGsZPqQgyPdoimScGQ2jae2Yk=;
        b=OKFD4MgIhvFd9e9hDAJeQpX660DjMMV9Uc+pdswnN3nb+UF/0Fmxp42VXZvyqYqFra
         jaOnWv76CVHjrhgGxA/Qxk6hVAc/RrOwD6X6EoxRYdQbvjYD87+MRcOEApfHNISaunJw
         n7/MI5XwgQ9lCWgGubVXq4HBADJehg9WeapWE5SY7aQCAB1xnEur4muGTybhcyKeZAs1
         +l5EjLeCrun6UQkoFtxsgjvT42biSDfSqSFWpCLTk7r+xnJxniXzMb+FjcmecGg879Pf
         rXv7F8fxrZa+Ly0jdwZF73t8UVzn5ryME/k+jlRAxP7lkGBSEP/UusiM1bKXhtg9OsEK
         D+1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x185si13780473qkd.291.2017.08.22.08.29.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Aug 2017 08:29:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54461 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dkB7a-0007NG-3v
	for alex.bennee@linaro.org; Tue, 22 Aug 2017 11:29:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53308)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dkAnn-0006Nr-FV
	for qemu-arm@nongnu.org; Tue, 22 Aug 2017 11:09:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dkAnl-0003Be-Op
	for qemu-arm@nongnu.org; Tue, 22 Aug 2017 11:09:11 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:36962)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dkAnl-00037y-IQ; Tue, 22 Aug 2017 11:09:09 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dkAnc-0004eU-4e; Tue, 22 Aug 2017 16:09:00 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 22 Aug 2017 16:08:43 +0100
Message-Id: <1503414539-28762-5-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
References: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 04/20] target/arm: Register second AddressSpace
 for secure v8M CPUs
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rB35G6w3gCSG

If a v8M CPU supports the security extension then we need to
give it two AddressSpaces, the same way we do already for
an A profile core with EL3.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index f32317e..ae866be 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -843,22 +843,21 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     init_cpreg_list(cpu);
 
 #ifndef CONFIG_USER_ONLY
-    if (cpu->has_el3) {
-        cs->num_ases = 2;
-    } else {
-        cs->num_ases = 1;
-    }
-
-    if (cpu->has_el3) {
+    if (cpu->has_el3 || arm_feature(env, ARM_FEATURE_M_SECURITY)) {
         AddressSpace *as;
 
+        cs->num_ases = 2;
+
         if (!cpu->secure_memory) {
             cpu->secure_memory = cs->memory;
         }
         as = address_space_init_shareable(cpu->secure_memory,
                                           "cpu-secure-memory");
         cpu_address_space_init(cs, as, ARMASIdx_S);
+    } else {
+        cs->num_ases = 1;
     }
+
     cpu_address_space_init(cs,
                            address_space_init_shareable(cs->memory,
                                                         "cpu-memory"),
-- 
2.7.4

