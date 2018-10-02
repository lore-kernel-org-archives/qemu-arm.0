Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp5268165wrt;
        Tue, 2 Oct 2018 09:39:40 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61xZVcPh0p58rODRnAMy82xgkacFnpo6FEP6xEh2NB1uMYeEPbgC0f2H1sVSkIdSx+1Td93
X-Received: by 2002:a37:98c3:: with SMTP id a186-v6mr12837151qke.128.1538498380572;
        Tue, 02 Oct 2018 09:39:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538498380; cv=none;
        d=google.com; s=arc-20160816;
        b=f0NtgCsqjUHs4ChK0xwT0VraL2kGrBKGTjY01gQgjnoOM3ia8vbEUfkjSaF5zmhdXl
         I2e5kH0f3LWKzFX9HSj8fWgt2A9JH5KKU+051WMwbOrrkThPW+CFYNIoMFEbvBXQ6GKl
         lekJRr+modqE7CrBe59GrkK/LwzzoE+ro8XzsS8uftAzeagb9cfuaVbfq41UhBAGmXBp
         Xm9VEMf5AeWdk+0AQPgKjpMSNlKZyyIDPSvesBuxE5Sf3WIEcHPdFD6X9hhmrSBkAGBv
         3UMwKWl3qFV8HMMd7EsA7EguI2Sa13VbHs6MiLIGigJOBVbYAjiVcjjGKFrnBOsnXNMK
         HEmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=03HX9uqEH9ZbwlTK0nJ6SlQU2yDzfnQzGPlIGdcAUWA=;
        b=eh3g9VnTyHipI7q/grMFJc5UUcahWWbxjFbPVgh7KfgQHZxU4tHm0Whc0ehyz1/6Tq
         ZIDkr6wR8k5/aQHm0MR59/rb9Nqr0MaB5wvXQQWPY0Qds+FFK/2EUzPngsgQDldxVmby
         0Z2CQm1Lo4g3mqwWnD1nXFDfeGbnMscM8lMcd0foWiY2j6jkHiDBs3UYTMoBDgCjTY9D
         w5n74kQRxAV99Q2VC89taHTIgRWshJUrYpgwbE61fxhoLX8lXJKrXwlntsIzadIf/WOj
         rPdsbM2l+NuHzz2EEOEdzNee3MuVfo4rY8dSVuQGpkekJSqo0zYBPmD4QcffDkanqGPK
         3x3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j44-v6si7025985qta.341.2018.10.02.09.39.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Oct 2018 09:39:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44731 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7Ni0-0001PR-42
	for alex.bennee@linaro.org; Tue, 02 Oct 2018 12:39:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34847)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1g7Ned-0006fS-5u
	for qemu-arm@nongnu.org; Tue, 02 Oct 2018 12:36:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1g7Nec-00056q-9Q
	for qemu-arm@nongnu.org; Tue, 02 Oct 2018 12:36:11 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:51570)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1g7Nec-000565-1O; Tue, 02 Oct 2018 12:36:10 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1g7Neb-0007Ie-1r; Tue, 02 Oct 2018 17:36:09 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  2 Oct 2018 17:35:52 +0100
Message-Id: <20181002163556.10279-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20181002163556.10279-1-peter.maydell@linaro.org>
References: <20181002163556.10279-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 09/13] target/arm: Add v8M stack checks for
 Thumb2 LDM/STM
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
X-TUID: 5RHiG7KyFZH7

Add the v8M stack checks for:
 * LDM (T2 encoding)
 * STM (T2 encoding)

This includes the 32-bit encodings of the instructions listed
in v8M ARM ARM rule R_YVWT as
 * LDM, LDMIA, LDMFD
 * LDMDB, LDMEA
 * POP (multiple registers)
 * PUSH (muliple registers)
 * STM, STMIA, STMEA
 * STMDB, STMFD

We perform the stack limit before doing any other part
of the load or store.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index c16d6075d94..3fb378a492d 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10524,6 +10524,7 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
             } else {
                 int i, loaded_base = 0;
                 TCGv_i32 loaded_var;
+                bool wback = extract32(insn, 21, 1);
                 /* Load/store multiple.  */
                 addr = load_reg(s, rn);
                 offset = 0;
@@ -10531,10 +10532,26 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                     if (insn & (1 << i))
                         offset += 4;
                 }
+
                 if (insn & (1 << 24)) {
                     tcg_gen_addi_i32(addr, addr, -offset);
                 }
 
+                if (s->v8m_stackcheck && rn == 13 && wback) {
+                    /*
+                     * If the writeback is incrementing SP rather than
+                     * decrementing it, and the initial SP is below the
+                     * stack limit but the final written-back SP would
+                     * be above, then then we must not perform any memory
+                     * accesses, but it is IMPDEF whether we generate
+                     * an exception. We choose to do so in this case.
+                     * At this point 'addr' is the lowest address, so
+                     * either the original SP (if incrementing) or our
+                     * final SP (if decrementing), so that's what we check.
+                     */
+                    gen_helper_v8m_stackcheck(cpu_env, addr);
+                }
+
                 loaded_var = NULL;
                 for (i = 0; i < 16; i++) {
                     if ((insn & (1 << i)) == 0)
@@ -10562,7 +10579,7 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                 if (loaded_base) {
                     store_reg(s, rn, loaded_var);
                 }
-                if (insn & (1 << 21)) {
+                if (wback) {
                     /* Base register writeback.  */
                     if (insn & (1 << 24)) {
                         tcg_gen_addi_i32(addr, addr, -offset);
-- 
2.19.0

