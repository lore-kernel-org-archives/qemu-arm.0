Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp6728715wru;
        Tue, 24 Jul 2018 05:00:12 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfg+72D1mFfkq2tGbRCFXZ6kY9NeVi0gPPnA46Th3heN2ZFzqdxtaH7cawuHcMt452z/SDr
X-Received: by 2002:ac8:4419:: with SMTP id j25-v6mr15395176qtn.8.1532433612016;
        Tue, 24 Jul 2018 05:00:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532433612; cv=none;
        d=google.com; s=arc-20160816;
        b=pPRGgyXwGJIZr0WStSv9Q50hGA41sLBvCHDL2vQ8zkUyljBFpqxMNhDM+JteNFlHZD
         8TigVLFHY6yYb+g/yxHdbEZDUkdRZCHAnsW3o7a9wwgay0KHTkfOgVZExJ/4yIYWWkkB
         pPvOXg2Dk/xm+ri07ZolHB2wfrxaRihrNu5K3XulppX2V57xLzvK1lESN/eaIs+uGkUn
         iaHfwFJO0tFDia6WiUS/g00zC0VNHp6At12lbN237bO7xUB7o6vBQaxaytQ96pV3KBRa
         URGYTE1BHANhpmPMIgJqwZppxFYC8ubcmXI6vKAn7X7c9nQdmN0hEVNFEMuhPIvG6R3u
         ln9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=uI83I7/dIFeqjAaA2VsWo6nMLRRzwlLon3RmFdab2xg=;
        b=qqY7sReqkpPORzKaVZc1meReGTqgGjpWCSNsduwVQXBukAhuQ43c5hAtGSz47zpYgh
         4jyIrcVw9J+jhraayqmYL2gwP+eoANQs7CqK37uSTjHgdDY+HKP7HGjLgL7dWsc0f53i
         bKIE1B1isew+J0+pq/5CJDyTE/9+Ms/0GiDfYMJMuVN0poYCRe1iGIlVeXJTuERMO8C8
         B4QKAzqoQsPS+kKW0ovHom3q+WD+VrGvmtkuXMYTZygLKr7z7AXhj5hZgGsoXMZnA3fk
         aS2ROteie3DSHG5a+LbMUoPkIBjYm/aJm3O3uYttTN6NGc4bPm1K8JVJVqKv9fKw7cps
         chuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d39-v6si12530014qkh.36.2018.07.24.05.00.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 Jul 2018 05:00:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39738 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fhvz9-0008EA-FS
	for alex.bennee@linaro.org; Tue, 24 Jul 2018 08:00:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52110)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fhvyv-00089c-J0
	for qemu-arm@nongnu.org; Tue, 24 Jul 2018 07:59:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fhvyu-00036x-Qk
	for qemu-arm@nongnu.org; Tue, 24 Jul 2018 07:59:57 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:43722)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fhvyu-00035b-KO; Tue, 24 Jul 2018 07:59:56 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fhvyt-0008Qj-4e; Tue, 24 Jul 2018 12:59:55 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 24 Jul 2018 12:59:50 +0100
Message-Id: <20180724115950.17316-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180724115950.17316-1-peter.maydell@linaro.org>
References: <20180724115950.17316-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 5/5] target/arm: Treat SCTLR_EL1.M as if it were
 zero when HCR_EL2.TGE is set
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
X-TUID: h+gw8vSJZ7ni

One of the required effects of setting HCR_EL2.TGE is that when
SCR_EL3.NS is 1 then SCTLR_EL1.M must behave as if it is zero for
all purposes except direct reads. That is, it effectively disables
the MMU for the NS EL0/EL1 translation regime.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 699189ebd7b..efd258fdb59 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8402,6 +8402,14 @@ static inline bool regime_translation_disabled(CPUARMState *env,
     if (mmu_idx == ARMMMUIdx_S2NS) {
         return (env->cp15.hcr_el2 & HCR_VM) == 0;
     }
+
+    if (env->cp15.hcr_el2 & HCR_TGE) {
+        /* TGE means that NS EL0/1 act as if SCTLR_EL1.M is zero */
+        if (!regime_is_secure(env, mmu_idx) && regime_el(env, mmu_idx) == 1) {
+            return true;
+        }
+    }
+
     return (regime_sctlr(env, mmu_idx) & SCTLR_M) == 0;
 }
 
-- 
2.17.1

