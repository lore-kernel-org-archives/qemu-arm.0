Received: by 10.182.158.201 with SMTP id ww9csp3416859obb;
        Wed, 2 Dec 2015 16:31:16 -0800 (PST)
X-Received: by 10.140.32.162 with SMTP id h31mr7522178qgh.93.1449102675997;
        Wed, 02 Dec 2015 16:31:15 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g11si861448qgd.91.2015.12.02.16.31.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Dec 2015 16:31:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:32819 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a4Hnn-0001Kc-Hq
	for alex.bennee@linaro.org; Wed, 02 Dec 2015 19:31:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36407)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1a4HcA-0004RE-7h
	for qemu-devel@nongnu.org; Wed, 02 Dec 2015 19:19:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1a4Hc7-000228-71
	for qemu-devel@nongnu.org; Wed, 02 Dec 2015 19:19:14 -0500
Received: from mail-qk0-x22d.google.com ([2607:f8b0:400d:c09::22d]:36368)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>)
	id 1a4Hc7-000222-0R; Wed, 02 Dec 2015 19:19:11 -0500
Received: by qkda6 with SMTP id a6so23876001qkd.3;
	Wed, 02 Dec 2015 16:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BfMadHtnZJ3MBwad63K2RlIzJqEfZIRHA/sLMV6/XKY=;
	b=vwnG16MKMO6aXhAOWEf8dL6DuhjJGaoYfkxemmt0POrDZvWavdpkPadwgvXgzcHDKz
	v8mvVZNjKoqLseYNuoKzvHkSje247mJUyVml9wYovntBdvincQh+4HFriyheBLf1k9it
	7vIO9WJnMP9G9ZvW30dvZQEOHo7WIgf29+aOQEti5kKMMzoG9qGG8xWhmzQR8tXex25l
	f3289rWVrFo51fYidC08qlhL6SO1N5XGWzt8MZ3d91CxEyct3BDN0QHKkwYaVyg3neSl
	i74dNF+/DVwET/yWAVwnGnbH6khv4sgtWvyVDEwH5wkXhW0fm/5djNjDjiLM7Xa8xhAq
	Kr7A==
X-Received: by 10.55.215.137 with SMTP id t9mr7518656qkt.23.1449101950688;
	Wed, 02 Dec 2015 16:19:10 -0800 (PST)
Received: from desktop.local (ool-182df582.dyn.optonline.net. [24.45.245.130])
	by smtp.gmail.com with ESMTPSA id
	e31sm2276326qge.11.2015.12.02.16.19.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 02 Dec 2015 16:19:10 -0800 (PST)
From: Michael Davidsaver <mdavidsaver@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed,  2 Dec 2015 19:18:43 -0500
Message-Id: <1449101933-24928-17-git-send-email-mdavidsaver@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
References: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::22d
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm@nongnu.org, Michael Davidsaver <mdavidsaver@gmail.com>
Subject: [Qemu-devel] [PATCH v2 16/26] armv7m: add some mpu debugging prints
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 8RgrIKTJMYYy

Provide some more "-d mmu" related to the MPU translation
process as an aid in debugging guest MPU configurations.
Helpful since our MPU resolution is limited to the ARM7-AR
page size.
---
 target-arm/helper.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index 589aa54..da99825 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -7110,7 +7110,7 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
 
             if (base & rmask) {
                 qemu_log_mask(LOG_GUEST_ERROR, "DRBAR %" PRIx32 " misaligned "
-                              "to DRSR region size, mask = %" PRIx32,
+                              "to DRSR region size, mask = %" PRIx32 "\n",
                               base, rmask);
                 continue;
             }
@@ -7148,9 +7148,9 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
                 }
             }
             if (rsize < TARGET_PAGE_BITS) {
-                qemu_log_mask(LOG_UNIMP, "No support for MPU (sub)region"
+                qemu_log_mask(LOG_UNIMP, "No support for MPU[%u] (sub)region "
                               "alignment of %" PRIu32 " bits. Minimum is %d\n",
-                              rsize, TARGET_PAGE_BITS);
+                              n, rsize, TARGET_PAGE_BITS);
                 continue;
             }
             if (srdis) {
@@ -7164,11 +7164,14 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
                 (is_user || !(regime_sctlr(env, mmu_idx) & SCTLR_BR))) {
                 /* background fault */
                 *fsr = 0;
+
+                qemu_log_mask(CPU_LOG_MMU, "Miss MPU\n");
                 return true;
             }
             get_phys_addr_pmsav7_default(env, mmu_idx, address, prot);
         } else { /* a MPU hit! */
             uint32_t ap = extract32(env->pmsav7.dracr[n], 8, 3);
+            qemu_log_mask(CPU_LOG_MMU, "Hit MPU %u AP %08x\n", n, (unsigned)ap);
 
             if (is_user) { /* User mode AP bit decoding */
                 switch (ap) {
@@ -7382,9 +7385,15 @@ static bool get_phys_addr(CPUARMState *env, target_ulong address,
      */
     if (arm_feature(env, ARM_FEATURE_MPU) &&
         arm_feature(env, ARM_FEATURE_V7)) {
+        bool ret;
         *page_size = TARGET_PAGE_SIZE;
-        return get_phys_addr_pmsav7(env, address, access_type, mmu_idx,
-                                    phys_ptr, prot, fsr);
+        ret = get_phys_addr_pmsav7(env, address, access_type, mmu_idx,
+                                   phys_ptr, prot, fsr);
+        qemu_log_mask(CPU_LOG_MMU, "TLB %08x mmu_idx=%u AC %u -> AC %u %s\n",
+                      (unsigned)address, mmu_idx, 1<<access_type, *prot,
+                      ret ? "Miss" : "Hit");
+
+        return ret;
     }
 
     if (regime_translation_disabled(env, mmu_idx)) {
-- 
2.1.4

