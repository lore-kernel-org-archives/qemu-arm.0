Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1181110wrs;
        Wed, 28 Aug 2019 12:35:40 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyGrhJNHqrDUG/5pJccXY15O0Xs0X3IgppOyLd6X4MoobX5jAyYCY9pSadyYVX8qG14LsQO
X-Received: by 2002:a05:6214:11e2:: with SMTP id e2mr4157196qvu.82.1567020939896;
        Wed, 28 Aug 2019 12:35:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567020939; cv=none;
        d=google.com; s=arc-20160816;
        b=wgPh0526G3TCKLup99h5Znw1gij98hrF/aJ7tIrGO9FWVMBKKljy446D6jiK45Zuvs
         CYRYo0BfCfvj5sVrxxihWagv/0rW9aPKLgRFKA8Ndf+miwNBE5XLMc+mhzXgW+u4kd7f
         ybQFnd5WetOa6flOSnYIKEsOAWRMZN5hIpYTtX3J47FnTP8y0KxYbjyO6d3sTzOHOQFk
         f695zSkd+WFrsyKu2Cyvlog3ruMK6q6xesfDVMzm52tZTM49CDZYAQ1Wt7SWJQxjQYtx
         tR6lnSyxdDCxUdSK6lLqQ5zBJr5/z0Wz3e/+cDZnOt5rGy7XpaoB75dIo2QHbvzA1LUa
         bpkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=zQWrs3An1QMtHJ2W4jZK3gQeIav2dkJ4+fToZUQZoOI=;
        b=gaiQSFBtfPAU1evv7pmPjdxDk96pGgk2q1+1AavIId4qqR/WVqwEnya2i5BJI0A6eO
         N/pFjBKsEBQL0VEk4kfHofAK3O1v+GnmBWeJaW+73w3Ky6BYGfLoWgz5rEMHB8gysmK3
         aYcNlyK7Ik1ry7tnBluXMiHRA4WweGowIux3qW1Wiro1tTihTvA2kw+omfkQUh0gnisR
         Bzi81JeJCBst/o7aGefNb2tspXPkfWvprbLVFRXScmaJU6J+sNLdGlzFP8395dopdAGG
         4xIz2yb/NGtWNJl/ffQmAcykmSAH6mJfP80X7Ep/7Fus48AnKAD+cfD31A173wL/CX1k
         a2iA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=n14kUCs+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p3si207169qkd.350.2019.08.28.12.35.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Aug 2019 12:35:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=n14kUCs+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i33jH-0007Qx-2H
	for alex.bennee@linaro.org; Wed, 28 Aug 2019 15:35:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38378)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i33GY-0003q8-09
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:06:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i33GV-0000RG-6z
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:05:57 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:37138)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i33GU-0000QB-RO
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:05:55 -0400
Received: by mail-pl1-x644.google.com with SMTP id bj8so402924plb.4
 for <qemu-arm@nongnu.org>; Wed, 28 Aug 2019 12:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=zQWrs3An1QMtHJ2W4jZK3gQeIav2dkJ4+fToZUQZoOI=;
 b=n14kUCs+FUs+v/ojGQSd9viKzyRP0l4QSRqB7VdWfADDg72eGCU208XWqaxAEbHJ0H
 vt6B+McnL+dTc3mNfnz3U4+tE7vaw3eZehQ1TaFpRxpiGSrXKjjKu3hKej45m8rRK7TW
 B4/2fA8DQocP1raSSEGf50CQvopECXY98veLUCMZX74rCR165+N4nJlTUUD0kalJ3Gdj
 O5rQ+8twwfMKmN3oWbQXvml1fesmGYAuA3NnYepsJnzRirKOLBGgD//FYPUDxjnf7UOW
 rqw24FNEKngam1Yxg/K3MmFsKjsULZH63uqHb1eoqSPfD8TcOjGxraqinu+5iZFv2QCl
 x/hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=zQWrs3An1QMtHJ2W4jZK3gQeIav2dkJ4+fToZUQZoOI=;
 b=dy6XPBGYdxgert9gJpvWIjOpQ6i318I9V8ZAWChGzTCCyRvjCGnnQ26Lf1ZlAGEOuU
 p9TU+LYGdgzHAB4uo+mKXJfbsjWUe1fRq3Bd1urzS6teukfkpNqQQ38OcMc0ipv4NNUL
 ulDTLTS9cTBo2amZKO5abG4UmsAyUgZTS1MFs3WFZx8w08xP03bVi6j18BEUdU5qpCoW
 4ViJ382JJQoR0wZYVfl9kXAoAl5scJd5EdCnndQKYCJriDrxG0NuPadP1F9pXVmz8X50
 LlI9yCbkP97nbcMVBYlUoa+PwwoxQsCRkRZBYIAhXJ68q3LMZNCQelNzIo3W+Ym8Ez57
 9iHw==
X-Gm-Message-State: APjAAAVixuz9x0ORi609xZcAlHtUe5pgm/t1CdNDoY0smdjWuNC4Qt8S
 QNvVRECulO67v1cB1pt6eFiIfg==
X-Received: by 2002:a17:902:8649:: with SMTP id
 y9mr5448781plt.252.1567019153746; 
 Wed, 28 Aug 2019 12:05:53 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f27sm2967944pgm.60.2019.08.28.12.05.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 12:05:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Aug 2019 12:04:29 -0700
Message-Id: <20190828190456.30315-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828190456.30315-1-richard.henderson@linaro.org>
References: <20190828190456.30315-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: [Qemu-arm] [PATCH v3 42/69] target/arm: Convert TT
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nRGCjtR7+3NC

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v3: Use unallocated_encoding.
---
 target/arm/translate.c | 90 ++++++++++++++----------------------------
 target/arm/t32.decode  |  5 ++-
 2 files changed, 34 insertions(+), 61 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 52da7f4fa8..05aa998640 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8469,6 +8469,33 @@ static bool trans_SG(DisasContext *s, arg_SG *a)
     return true;
 }
 
+static bool trans_TT(DisasContext *s, arg_TT *a)
+{
+    TCGv_i32 addr, tmp;
+
+    if (!arm_dc_feature(s, ARM_FEATURE_M) ||
+        !arm_dc_feature(s, ARM_FEATURE_V8)) {
+        return false;
+    }
+    if (a->rd == 13 || a->rd == 15 || a->rn == 15) {
+        /* We UNDEF for these UNPREDICTABLE cases */
+        unallocated_encoding(s);
+        return true;
+    }
+    if (a->A && !s->v8m_secure) {
+        /* This case is UNDEFINED.  */
+        unallocated_encoding(s);
+        return true;
+    }
+
+    addr = load_reg(s, a->rn);
+    tmp = tcg_const_i32((a->A << 1) | a->T);
+    gen_helper_v7m_tt(tmp, cpu_env, addr, tmp);
+    tcg_temp_free_i32(addr);
+    store_reg(s, a->rd, tmp);
+    return true;
+}
+
 /*
  * Load/store register index
  */
@@ -10502,7 +10529,7 @@ static bool thumb_insn_is_16bit(DisasContext *s, uint32_t pc, uint32_t insn)
 /* Translate a 32-bit thumb instruction. */
 static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
 {
-    uint32_t rd, rn, rs;
+    uint32_t rn;
     int op;
 
     /*
@@ -10546,70 +10573,13 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
     /* fall back to legacy decoder */
 
     rn = (insn >> 16) & 0xf;
-    rs = (insn >> 12) & 0xf;
-    rd = (insn >> 8) & 0xf;
     switch ((insn >> 25) & 0xf) {
     case 0: case 1: case 2: case 3:
         /* 16-bit instructions.  Should never happen.  */
         abort();
     case 4:
-        if (insn & (1 << 22)) {
-            /* 0b1110_100x_x1xx_xxxx_xxxx_xxxx_xxxx_xxxx
-             * - load/store doubleword, load/store exclusive, ldacq/strel,
-             *   table branch, TT.
-             */
-            if (insn & 0x01200000) {
-                /* load/store dual, in decodetree */
-                goto illegal_op;
-            } else if ((insn & (1 << 23)) == 0) {
-                /* 0b1110_1000_010x_xxxx_xxxx_xxxx_xxxx_xxxx
-                 * - load/store exclusive word
-                 * - TT (v8M only)
-                 */
-                if (rs == 15) {
-                    if (!(insn & (1 << 20)) &&
-                        arm_dc_feature(s, ARM_FEATURE_M) &&
-                        arm_dc_feature(s, ARM_FEATURE_V8)) {
-                        /* 0b1110_1000_0100_xxxx_1111_xxxx_xxxx_xxxx
-                         *  - TT (v8M only)
-                         */
-                        bool alt = insn & (1 << 7);
-                        TCGv_i32 addr, op, ttresp;
-
-                        if ((insn & 0x3f) || rd == 13 || rd == 15 || rn == 15) {
-                            /* we UNDEF for these UNPREDICTABLE cases */
-                            goto illegal_op;
-                        }
-
-                        if (alt && !s->v8m_secure) {
-                            goto illegal_op;
-                        }
-
-                        addr = load_reg(s, rn);
-                        op = tcg_const_i32(extract32(insn, 6, 2));
-                        ttresp = tcg_temp_new_i32();
-                        gen_helper_v7m_tt(ttresp, cpu_env, addr, op);
-                        tcg_temp_free_i32(addr);
-                        tcg_temp_free_i32(op);
-                        store_reg(s, rd, ttresp);
-                        break;
-                    }
-                    goto illegal_op;
-                }
-                /* Load/store exclusive, in decodetree */
-                goto illegal_op;
-            } else if ((insn & (7 << 5)) == 0) {
-                /* Table Branch, in decodetree */
-                goto illegal_op;
-            } else {
-                /* Load/store exclusive, load-acq/store-rel, in decodetree */
-                goto illegal_op;
-            }
-        } else {
-            /* Load/store multiple, RFE, SRS, in decodetree */
-            goto illegal_op;
-        }
-        break;
+        /* All in decodetree */
+        goto illegal_op;
     case 5:
         /* All in decodetree */
         goto illegal_op;
diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index 2b30a767fe..91ba4ca7ae 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -508,7 +508,10 @@ STRD_ri_t32      1110 1001 .110 .... .... .... ........    @ldstd_ri8 w=1 p=1
 @ldrex_d         .... .... .... rn:4 rt:4 rt2:4 .... .... \
                  &ldrex imm=0
 
-STREX            1110 1000 0100 .... .... .... .... ....      @strex_i
+{
+  TT             1110 1000 0100 rn:4 1111 rd:4 A:1 T:1 000000
+  STREX          1110 1000 0100 .... .... .... .... ....      @strex_i
+}
 STREXB           1110 1000 1100 .... .... 1111 0100 ....      @strex_0
 STREXH           1110 1000 1100 .... .... 1111 0101 ....      @strex_0
 STREXD_t32       1110 1000 1100 .... .... .... 0111 ....      @strex_d
-- 
2.17.1

