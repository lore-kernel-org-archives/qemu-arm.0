Received: by 10.223.172.38 with SMTP id v35csp3212946wrc;
        Fri, 22 Sep 2017 08:03:23 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBlcNksyNX0MXZ0C5Mj6psc4pIomRmUdzZzhfzU4KBEp2L2w2uvwW2qdDSeuLyM6cwU2D11
X-Received: by 10.200.38.170 with SMTP id 39mr8792542qto.114.1506092603231;
        Fri, 22 Sep 2017 08:03:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506092603; cv=none;
        d=google.com; s=arc-20160816;
        b=Crf2duD2XbfMacIq3I1fCj3xLt2CRwGtNCEftzXx7f3MLBtx2FGlvwV7ky1NN1ZGRT
         SFSEwcr6OBTqixweE9vWqufrCYDZ4bGFaRBXOZpXpIt2ziQ6A9SXQEBbIH2rK5Hvc6sT
         TkzXusqJzlTj4wXNXUPlin4tK4Sn2w8cbqaV/HIwpfr7XJ6NNXJliyOPtdO1c+wSxiqe
         dEIl7VT3UYNtxqkpwyuVxyQ6dKi2Qs3N63yOaYjk4hpxstdoGUezSczojpiXAyVHl/XW
         p6lhrg2auUe8mNhZcs7qMLXRxTrAtbLqsIG466PMdZBSrRV4b44ySVfFJdIRdtqbhskP
         g5ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=nZJTm1jYWSJXDE0BXZ/1HmYMdMyn1LUtURgi85avWko=;
        b=OOIv8np/8lCjS7OZBlNORhqjYpCKXZOLJhulDtxVYnQuR0rhDWHBAVSXjEYwmJajMK
         Co6exc532XuGn2kZ10nIVKDnxljyCaDxpQEeGpKD3l1/bNuiu5kpahcXMnLaL00Rz5mP
         Ddm0evP28YHYO9M7aryj/Q80KeeF2O48DcZFCD9hSp3wBm9ywBgCuZm+xdireClUo2V7
         fB2Hq+OHmS4aM2Jb6pTb++TywLRBK2VdJGSz269UZaH4xho7uT4eqIlfs8mE33CCkl0N
         jQO4zTpVT9cqGkhZWefPlkPwlBUX0dE+9FIQow8YihjEbr/FM0iayWnumamIRkk6rsQX
         EpxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z1si27914qkf.94.2017.09.22.08.03.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Sep 2017 08:03:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59333 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dvPU9-0002WC-0M
	for alex.bennee@linaro.org; Fri, 22 Sep 2017 11:03:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47135)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dvPQd-00081o-3W
	for qemu-arm@nongnu.org; Fri, 22 Sep 2017 10:59:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dvPQc-0004Cc-5d
	for qemu-arm@nongnu.org; Fri, 22 Sep 2017 10:59:43 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37574)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dvPQb-00049B-VF; Fri, 22 Sep 2017 10:59:42 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dvPQa-0007Ef-8q; Fri, 22 Sep 2017 15:59:40 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 22 Sep 2017 16:00:02 +0100
Message-Id: <1506092407-26985-16-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
References: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 15/20] target/arm: Fix calculation of secure
 mm_idx values
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
X-TUID: 05MZGWLJzlx2

In cpu_mmu_index() we try to do this:
        if (env->v7m.secure) {
            mmu_idx += ARMMMUIdx_MSUser;
        }
but it will give the wrong answer, because ARMMMUIdx_MSUser
includes the 0x40 ARM_MMU_IDX_M field, and so does the
mmu_idx we're adding to, and we'll end up with 0x8n rather
than 0x4n. This error is then nullified by the call to
arm_to_core_mmu_idx() which masks out the high part, but
we're about to factor out the code that calculates the
ARMMMUIdx values so it can be used without passing it through
arm_to_core_mmu_idx(), so fix this bug first.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 441e584..70c1f85 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2335,14 +2335,16 @@ static inline int cpu_mmu_index(CPUARMState *env, bool ifetch)
     int el = arm_current_el(env);
 
     if (arm_feature(env, ARM_FEATURE_M)) {
-        ARMMMUIdx mmu_idx = el == 0 ? ARMMMUIdx_MUser : ARMMMUIdx_MPriv;
+        ARMMMUIdx mmu_idx;
 
-        if (armv7m_nvic_neg_prio_requested(env->nvic, env->v7m.secure)) {
-            mmu_idx = ARMMMUIdx_MNegPri;
+        if (el == 0) {
+            mmu_idx = env->v7m.secure ? ARMMMUIdx_MSUser : ARMMMUIdx_MUser;
+        } else {
+            mmu_idx = env->v7m.secure ? ARMMMUIdx_MSPriv : ARMMMUIdx_MPriv;
         }
 
-        if (env->v7m.secure) {
-            mmu_idx += ARMMMUIdx_MSUser;
+        if (armv7m_nvic_neg_prio_requested(env->nvic, env->v7m.secure)) {
+            mmu_idx = env->v7m.secure ? ARMMMUIdx_MSNegPri : ARMMMUIdx_MNegPri;
         }
 
         return arm_to_core_mmu_idx(mmu_idx);
-- 
2.7.4

