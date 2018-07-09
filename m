Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp2397030wrq;
        Mon, 9 Jul 2018 05:46:03 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfMOwMGBPZGRhUUxt3I453vVKRIRk72R8w8ZqmbIPZNVjwefBFFOxj8uL0mqiEFkVpTyXwk
X-Received: by 2002:a0c:9dc3:: with SMTP id p3-v6mr17667327qvf.211.1531140362954;
        Mon, 09 Jul 2018 05:46:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531140362; cv=none;
        d=google.com; s=arc-20160816;
        b=Udp7hWcvC9KUYcFQ4SDd0cPxABF7SfsLXBwoGLGd1PdDj/yLKkWjkTTv1cS/cZAAdz
         z11byoP4HZK1p34o5W3SQOcqaD53X1NFik1f38s7LhrL6n6VaZ6QNsOGsUOpoZffZAMg
         eNlPkHGKceTEtO/At2IaTmWYTnV9Kw3LhiKowDtKT48HWKsztMRi2IV6NB1v6rHvLZ4q
         mfarrigczrCfh0/SrIpdBdruuxjqaYHAJLrSa1xEKC+b2sGm8wzvoX4b/+MbCdHMpbvn
         QruoOlUGtJQvy4g29kEHVLb4tQ2nNQXmD4ZZeyL7zPFBf+D0p14rZDAWM8xD5CTzuG1q
         cjyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=BT7dr+5aXLhhsqMj6V90KBhpdf8Rp/VxHctTcd+7w40=;
        b=avZbwrqhLhlSAFIWkk9RLg10YOlab1fX/8q7qSWAsMFo1zrZduddRF+IpbJEXsNBjK
         MrX8hhtXsXw6JDHDk8dJqDCYw2Jo4kuN4KBDJv4XFypF/uZ6U2GPCzEkg4CzpapNaA+8
         ZIqtZdSji99bpmyDBtpxmWejxQrVPdh0DQyC4fZE1r7rx+J+vn0+Oa9gAzXpbgh85VXz
         WxfeVHm35+NfAr4o5HXIa2yzgbdqcw5G71fXeHnVrRhAG1hIjBzn+PH7YJGiTwmFNfpj
         XmsYag2tWiG9pRDLIgrENztaZtuV6KALky5ngFRzHGFQO2AbDuAqVlSic2ANJfjhOev7
         VE4g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 47-v6si1805765qve.250.2018.07.09.05.46.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Jul 2018 05:46:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41509 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fcVYI-0001q6-Gm
	for alex.bennee@linaro.org; Mon, 09 Jul 2018 08:46:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57010)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fcVYA-0001q0-5a
	for qemu-arm@nongnu.org; Mon, 09 Jul 2018 08:45:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fcVY9-0006X4-76
	for qemu-arm@nongnu.org; Mon, 09 Jul 2018 08:45:54 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:43332)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fcVY9-0006RV-05; Mon, 09 Jul 2018 08:45:53 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fcVXs-0000cm-Lw; Mon, 09 Jul 2018 13:45:36 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon,  9 Jul 2018 13:45:35 +0100
Message-Id: <20180709124535.1116-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH for-3.0] target/arm: Use correct mmu_idx for
 exception-return unstacking
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
Cc: Adithya Baglody <adithya.nagaraj.baglody@intel.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fRJiXbmdIGzm

For M-profile exception returns, the mmu index to use for exception
return unstacking is supposed to be that of wherever we are returning to:
 * if returning to handler mode, privileged
 * if returning to thread mode, privileged or unprivileged depending on
   CONTROL.nPRIV for the destination security state

We were passing the wrong thing as the 'priv' argument to
arm_v7m_mmu_idx_for_secstate_and_priv(). The effect was that guests
which programmed the MPU to behave differently for privileged and
unprivileged code could get spurious MemManage Unstack exceptions.

Reported-by: Adithya Baglody <adithya.nagaraj.baglody@intel.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index a2ac96084e7..0604a0efbe2 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7171,9 +7171,11 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
         uint32_t frameptr = *frame_sp_p;
         bool pop_ok = true;
         ARMMMUIdx mmu_idx;
+        bool return_to_priv = return_to_handler ||
+            !(env->v7m.control[return_to_secure] & R_V7M_CONTROL_NPRIV_MASK);
 
         mmu_idx = arm_v7m_mmu_idx_for_secstate_and_priv(env, return_to_secure,
-                                                        !return_to_handler);
+                                                        return_to_priv);
 
         if (!QEMU_IS_ALIGNED(frameptr, 8) &&
             arm_feature(env, ARM_FEATURE_V8)) {
-- 
2.17.1

