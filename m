Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp5273342wrt;
        Tue, 2 Oct 2018 09:45:20 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62W9qjIVdGVt8iGYqVkXErF0irTI1qitketWsKYLNdelA0NO7YNK4AbdUoq0kcTh30AMZW8
X-Received: by 2002:a37:2b12:: with SMTP id r18-v6mr12196879qkh.343.1538498720850;
        Tue, 02 Oct 2018 09:45:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538498720; cv=none;
        d=google.com; s=arc-20160816;
        b=WXZ2lD4T05cWYjQlFqUcR/LDwgFJbqoh2weMPv9C3lcr6pvqV0kalNovmje029E0yu
         m+A33hwOaEc6/jx1uLLRb1ZNi+m2Q0hp1a+oFgv1qfwZ0CHtcphkz9gsN4qeKgFKhsDH
         7ZkuPAbjw+83+jE7gWumfcZJosfOcODwfpZIosY9xxZGpluxpun7lF8a36/qd4ildAoy
         rhuMv6l7mtKiWWRpkXami+h/PxBNzKcUfC1OBkFErrvoSEhTNWWKFu4kVaJMD1Ima1NN
         VoTt+HG7W7WpNu7wCbiNMB56QH4+NsZmTL9hVPcrdxwgv117YGn/SECMwopJMxzv/Om5
         BVuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=+BBRoBKd1PzIfqZ6OzyMndwspOUn42qv//t383wrQvw=;
        b=Hq9YbrtsiPPbmmnKHclt0kJ9BG5sueyYnydnrYOT6V8OEtj97g4R9+WUm4adbKQNCv
         Nc6cOHTSDmFszfYke+cUWc1o8Nn1HTF/6eI1oapFrNUHXkOY5vBesMLF7q+3CkeVcA20
         qqelYPQU/ZbadRpMimjF35VosfO9VWDKK1gpnAW1m2nbyaPrvVsOEMm0ZTDTZYZH3EPk
         KOcid0mvez80CFm3f77dVQfztRkMTBXELqxRMqRzMgBiCqz/oMiDGjmMV1vok/TatiWu
         Zbe/soeBemRvWrLEwMwfIaYAxjIGFE6IpWsNoRBc511y8s+PRWKZGEQcKW6340/OU39I
         9Aow==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s76-v6si3733479qka.83.2018.10.02.09.45.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Oct 2018 09:45:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44773 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7NnU-0007tb-7R
	for alex.bennee@linaro.org; Tue, 02 Oct 2018 12:45:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34878)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1g7Nee-0006gk-8D
	for qemu-arm@nongnu.org; Tue, 02 Oct 2018 12:36:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1g7Ned-00057e-EC
	for qemu-arm@nongnu.org; Tue, 02 Oct 2018 12:36:12 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:51570)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1g7Ned-000565-4Y; Tue, 02 Oct 2018 12:36:11 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1g7Nea-0007IO-4Y; Tue, 02 Oct 2018 17:36:08 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  2 Oct 2018 17:35:51 +0100
Message-Id: <20181002163556.10279-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20181002163556.10279-1-peter.maydell@linaro.org>
References: <20181002163556.10279-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 08/13] target/arm: Add v8M stack checks for
 LDRD/STRD (imm)
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
X-TUID: 8DWSJ6JWLbhE

Add the v8M stack checks for:
 * LDRD (immediate)
 * STRD (immediate)

Loads and stores are more complicated than ADD/SUB/MOV, because we
must ensure that memory accesses below the stack limit are not
performed, so we can't simply do the check when we actually update
SP.

For these instructions, if the stack limit check triggers
we must not:
 * perform any memory access below the SP limit
 * update PC, SP or the load/store base register
but it is IMPDEF whether we:
 * perform any accesses above or equal to the SP limit
 * update destination registers for loads

For QEMU we choose to always check the limit before doing any other
part of the load or store, so we won't update any registers or
perform any memory accesses.

It is UNKNOWN whether the limit check triggers for a load or store
where the initial SP value is below the limit and one of the stores
would be below the limit, but the writeback moves SP to above the
limit.  For QEMU we choose to trigger the check in this situation.

Note that limit checks happen only for loads and stores which update
SP via writeback; they do not happen for loads and stores which
simply use SP as a base register.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index fcb33b8a503..c16d6075d94 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10278,6 +10278,8 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                  * 0b1111_1001_x11x_xxxx_xxxx_xxxx_xxxx_xxxx
                  *  - load/store dual (pre-indexed)
                  */
+                bool wback = extract32(insn, 21, 1);
+
                 if (rn == 15) {
                     if (insn & (1 << 21)) {
                         /* UNPREDICTABLE */
@@ -10289,8 +10291,29 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                     addr = load_reg(s, rn);
                 }
                 offset = (insn & 0xff) * 4;
-                if ((insn & (1 << 23)) == 0)
+                if ((insn & (1 << 23)) == 0) {
                     offset = -offset;
+                }
+
+                if (s->v8m_stackcheck && rn == 13 && wback) {
+                    /*
+                     * Here 'addr' is the current SP; if offset is +ve we're
+                     * moving SP up, else down. It is UNKNOWN whether the limit
+                     * check triggers when SP starts below the limit and ends
+                     * up above it; check whichever of the current and final
+                     * SP is lower, so QEMU will trigger in that situation.
+                     */
+                    if ((int32_t)offset < 0) {
+                        TCGv_i32 newsp = tcg_temp_new_i32();
+
+                        tcg_gen_addi_i32(newsp, addr, offset);
+                        gen_helper_v8m_stackcheck(cpu_env, newsp);
+                        tcg_temp_free_i32(newsp);
+                    } else {
+                        gen_helper_v8m_stackcheck(cpu_env, addr);
+                    }
+                }
+
                 if (insn & (1 << 24)) {
                     tcg_gen_addi_i32(addr, addr, offset);
                     offset = 0;
@@ -10314,7 +10337,7 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                     gen_aa32_st32(s, tmp, addr, get_mem_index(s));
                     tcg_temp_free_i32(tmp);
                 }
-                if (insn & (1 << 21)) {
+                if (wback) {
                     /* Base writeback.  */
                     tcg_gen_addi_i32(addr, addr, offset - 4);
                     store_reg(s, rn, addr);
-- 
2.19.0

