Received: by 10.28.71.27 with SMTP id u27csp1167509wma;
        Fri, 9 Feb 2018 09:05:23 -0800 (PST)
X-Google-Smtp-Source: AH8x2256fhMNy59cHc5I3M8IhmVj3qjnzXt6RQJaXkCC6sK7mL8MLZGdWiobd8K/SlMR0ZtodYnJ
X-Received: by 10.129.115.86 with SMTP id o83mr2465204ywc.0.1518195923143;
        Fri, 09 Feb 2018 09:05:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518195923; cv=none;
        d=google.com; s=arc-20160816;
        b=L8AzlXPFI2m4edtuQdsX28LU+Lb8qokITWqgY3FutAeaE6a7lvBTw7+EOVDeCKil2P
         5ytMhJtC3o1RlPxkiT+GqKYYzP6DdZn1pJCZJ5HPzjGHCzUZYqpoK01pIRuosq/AJvst
         akgNff7Q7iQh/AjHbujiuYZmrIb+ktRjgnamovLjePIMWNK9FtzuDcGEHi4jrB6nL5kV
         NGkVwv62iYka6kwHfmfGfuMWiBzdJa4yIb3PjhphP8req9560Bi7kc9gAY/WPuPYqOV/
         3CGsEs5z5pz00s/J48T16ijA87yZUYBWncl9En533BFNxrRY+IEzXtEg0cVFr0aDjlWz
         ZzYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=gPZBOWG62Ml3ABPlHSWpZm/7Y3tm7VBFmIMMS/caH1M=;
        b=KZGm4SU+f3v3uen7aWVpv9IZtk6z5wVlmuSDqCfjc2ko9DAmFkffBAH8LCCqFbgS2N
         IfwhiEr/BUFKz4Vi06KhXObpQjHoOGxOkg2ruGqWEBsq4NQogRc7tNrpZVbwCVBBkL/z
         rxtibJS106QpqdLymlDv4FklmC5KgmU6U7Too1DtaPTd6p9/1WAquoCkKSQB4uROS4ov
         2ap1SxaExLveftYAskhIAK6/0+nognezL6YSOnmMK2y6NaedF4ixGr8icZ2Kc3e6+7EO
         xdvr5gGxgx7+qYAakHfAUvsZ2oPRj9Phqw2Ei5uES6BasXw8nbFJZtsP1e5CVBPHsR45
         DkyA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j62si472472ybb.13.2018.02.09.09.05.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Feb 2018 09:05:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45160 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ekC70-0000jd-GD
	for alex.bennee@linaro.org; Fri, 09 Feb 2018 12:05:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40993)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ekC0C-0003x3-Dj
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 11:58:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ekC0B-0007no-En
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 11:58:20 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:46290)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1ekC0B-0007la-7N; Fri, 09 Feb 2018 11:58:19 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1ekC0A-00030x-4G; Fri, 09 Feb 2018 16:58:18 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri,  9 Feb 2018 16:58:06 +0000
Message-Id: <20180209165810.6668-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180209165810.6668-1-peter.maydell@linaro.org>
References: <20180209165810.6668-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2 07/11] target/arm: Implement writing to
 CONTROL_NS for v8M
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
X-TUID: rAxBxdn6qCfD

In commit 50f11062d4c896 we added support for MSR/MRS access
to the NS banked special registers, but we forgot to implement
the support for writing to CONTROL_NS. Correct the omission.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 180ab75458..7c1dcb0330 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10519,6 +10519,16 @@ void HELPER(v7m_msr)(CPUARMState *env, uint32_t maskreg, uint32_t val)
             }
             env->v7m.faultmask[M_REG_NS] = val & 1;
             return;
+        case 0x94: /* CONTROL_NS */
+            if (!env->v7m.secure) {
+                return;
+            }
+            write_v7m_control_spsel_for_secstate(env,
+                                                 val & R_V7M_CONTROL_SPSEL_MASK,
+                                                 M_REG_NS);
+            env->v7m.control[M_REG_NS] &= ~R_V7M_CONTROL_NPRIV_MASK;
+            env->v7m.control[M_REG_NS] |= val & R_V7M_CONTROL_NPRIV_MASK;
+            return;
         case 0x98: /* SP_NS */
         {
             /* This gives the non-secure SP selected based on whether we're
-- 
2.16.1

