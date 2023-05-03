Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2653625ejm;
        Wed, 3 May 2023 00:10:59 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6GoCJx7uHYKMMco8Mqo1/Xf4L5khMr+jvzPsk6PQMwiyJyKkvAHdFZZo1KsOPNbF40UVlB
X-Received: by 2002:ad4:5be9:0:b0:5f9:ba55:394c with SMTP id k9-20020ad45be9000000b005f9ba55394cmr7034342qvc.26.1683097859319;
        Wed, 03 May 2023 00:10:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683097859; cv=none;
        d=google.com; s=arc-20160816;
        b=FyS6YjTbSD1uTaohz7lLDV81E8/aZd8FhJKukktiwYM71m2aM9CZjgV/ZM+clcSfA+
         FIF6Fzk171y9DlxO2+RhQaEq0VqKJ2y2OG8oNB6Mrozna5RqqeWXYGqElhPcAVYI1z5E
         qeWJhYep28XhAgrZfs8hB9RM1E6KxM/LnH5TTBs4NY9teHM1ECggt5kG8hqWwqFx3Bvb
         5kaZFEV/6xo4UULeb1RohP6qtvZWPIgo/83NWxeWXH4CHxUbIBmr1DD77PR69zJcv7hG
         kX8MkxO9HJXGjAIRB7oFL5G5k9cXvNy+kumO8k8ucoAPacTacI5874xb+QQ7v7nt+LvR
         dbCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=knj9vLRVgMuHbxUsbTpxPOOdPonmqcw2C7rsb1Cv/YA=;
        b=Ee0iwUsy/dkCSbwoH0BAhgwVdROHMfwJiHFoFfmGzPY/sK0p1vmRyXG8w2Wg/63MBX
         JccuLJtn7cafO800YhcLEndYRdzQbO17f+v7pSfaMjMjAgLpyZ7j1uzakrhXuYru5CGX
         lv3whh8bHTmP38u7u7lgTWQ45dfuUzy1g3frmGaBexAYUJ/XSqHKHbNrUz+6gT/gy8Ke
         xAS5vxc8pFITSHUIDGSvyJvp5D+QdJIyOe/5o6AJ7ruCDcikjvtPO8PeiAnEzT/2y7BB
         YmBODPYTFL8n20mixVOPFMPlzJqKPyZoonhDWEjrbdsc6zgnN453E8hhOu7r71GGZX2W
         mbVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yCaNAwLg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j7-20020a378707000000b0073b64657ba9si17689915qkd.489.2023.05.03.00.10.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 May 2023 00:10:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yCaNAwLg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pu6bM-0002O7-T1; Wed, 03 May 2023 03:08:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6ae-0007rn-DC
 for qemu-arm@nongnu.org; Wed, 03 May 2023 03:07:52 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6a6-0005mL-PG
 for qemu-arm@nongnu.org; Wed, 03 May 2023 03:07:52 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f182d745deso46337575e9.0
 for <qemu-arm@nongnu.org>; Wed, 03 May 2023 00:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097637; x=1685689637;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=knj9vLRVgMuHbxUsbTpxPOOdPonmqcw2C7rsb1Cv/YA=;
 b=yCaNAwLgqG2lVfPtK/AQezWWlBLk51lXTQHiUHce1ujQTleWX1IeXN2+4No0mrd3+Q
 TDIACK0+XhYFD5VPXa9ockPg0F/GiD0wv+MfQdlCMJqCSrzxIT1KH7rgI1Mj5Ng8DIy2
 zjdvzHc8Qxw69z+/DxayZVXDkiryAfVLdgcaZPoJ8oV4aaPPNU6thz7kUrhuQVwg924e
 IERL0CTU9vwfMHlDYSupLqN/sAR5tt74TGpeE0ok3UAoQYODjksDghj/+vHF/3q537by
 x0sDqfo9Nt7ozRf4OkzVq6yOBGJ0Yzmm4/lhdWez+G0nuOZ9nLBqYUh4PBNrAKaMpYTc
 9jMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097637; x=1685689637;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=knj9vLRVgMuHbxUsbTpxPOOdPonmqcw2C7rsb1Cv/YA=;
 b=UBRn1EKR0+unsMDs97PUHLt407DM6KUWGIXu+ZTf5Od6rDXlNodRTTMQQjTWQQkzCa
 mi1ftHVFHXGJrOut3gEzRhQ+aUISE9twWk7nmwOlLAZpRrZNg1yJEz0kgjbcOx+izcwN
 WZXEA6q6AjxGVV/u184KrFnLzPugsZ1BE+BdmmcqWDt7eofV7CiWlYBxlR4TWVlm0OVX
 Ru2pGMYOggB8F1lvUJ5PJKJX9g2gNTg+FFI/5NN4COn86OKzdwQjw+ASEYcDHdpYgAkG
 OEiFRa3e3Q0ctuPWHh1rdt2dgkWvGl2qKjYRgsqskQzj5kWW8usBjCMz9//ReE62Mw17
 9mqw==
X-Gm-Message-State: AC+VfDxzO4M4UzccUtY1gk8ZHqkRl9EfpfZZujT2zQUM01sNq/P6FPlp
 JDodsEnqv4FbBzxIorwG6akleQ==
X-Received: by 2002:a05:600c:ad9:b0:3f1:7bac:d411 with SMTP id
 c25-20020a05600c0ad900b003f17bacd411mr14672180wmr.39.1683097637180; 
 Wed, 03 May 2023 00:07:17 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a1cf303000000b003f3157988f8sm921184wmq.26.2023.05.03.00.07.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:07:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 26/57] tcg/arm: Adjust constraints on qemu_ld/st
Date: Wed,  3 May 2023 08:06:25 +0100
Message-Id: <20230503070656.1746170-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: lIlUBLge5VUS

Always reserve r3 for tlb softmmu lookup.  Fix a bug in user-only
ALL_QLDST_REGS, in that r14 is clobbered by the BLNE that leads
to the misaligned trap.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target-con-set.h | 16 ++++++++--------
 tcg/arm/tcg-target-con-str.h |  5 ++---
 tcg/arm/tcg-target.c.inc     | 23 ++++++++---------------
 3 files changed, 18 insertions(+), 26 deletions(-)

diff --git a/tcg/arm/tcg-target-con-set.h b/tcg/arm/tcg-target-con-set.h
index b8849b2478..229ae258ac 100644
--- a/tcg/arm/tcg-target-con-set.h
+++ b/tcg/arm/tcg-target-con-set.h
@@ -12,19 +12,19 @@
 C_O0_I1(r)
 C_O0_I2(r, r)
 C_O0_I2(r, rIN)
-C_O0_I2(s, s)
+C_O0_I2(q, q)
 C_O0_I2(w, r)
-C_O0_I3(s, s, s)
-C_O0_I3(S, p, s)
+C_O0_I3(q, q, q)
+C_O0_I3(Q, p, q)
 C_O0_I4(r, r, rI, rI)
-C_O0_I4(S, p, s, s)
-C_O1_I1(r, l)
+C_O0_I4(Q, p, q, q)
+C_O1_I1(r, q)
 C_O1_I1(r, r)
 C_O1_I1(w, r)
 C_O1_I1(w, w)
 C_O1_I1(w, wr)
 C_O1_I2(r, 0, rZ)
-C_O1_I2(r, l, l)
+C_O1_I2(r, q, q)
 C_O1_I2(r, r, r)
 C_O1_I2(r, r, rI)
 C_O1_I2(r, r, rIK)
@@ -39,8 +39,8 @@ C_O1_I2(w, w, wZ)
 C_O1_I3(w, w, w, w)
 C_O1_I4(r, r, r, rI, rI)
 C_O1_I4(r, r, rIN, rIK, 0)
-C_O2_I1(e, p, l)
-C_O2_I2(e, p, l, l)
+C_O2_I1(e, p, q)
+C_O2_I2(e, p, q, q)
 C_O2_I2(r, r, r, r)
 C_O2_I4(r, r, r, r, rIN, rIK)
 C_O2_I4(r, r, rI, rI, rIN, rIK)
diff --git a/tcg/arm/tcg-target-con-str.h b/tcg/arm/tcg-target-con-str.h
index 24b4b59feb..f83f1d3919 100644
--- a/tcg/arm/tcg-target-con-str.h
+++ b/tcg/arm/tcg-target-con-str.h
@@ -10,9 +10,8 @@
  */
 REGS('e', ALL_GENERAL_REGS & 0x5555) /* even regs */
 REGS('r', ALL_GENERAL_REGS)
-REGS('l', ALL_QLOAD_REGS)
-REGS('s', ALL_QSTORE_REGS)
-REGS('S', ALL_QSTORE_REGS & 0x5555)  /* even qstore */
+REGS('q', ALL_QLDST_REGS)
+REGS('Q', ALL_QLDST_REGS & 0x5555)   /* even qldst */
 REGS('w', ALL_VECTOR_REGS)
 
 /*
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 8b0d526659..a02804dd69 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -353,23 +353,16 @@ static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
 #define ALL_VECTOR_REGS   0xffff0000u
 
 /*
- * r0-r2 will be overwritten when reading the tlb entry (softmmu only)
- * and r0-r1 doing the byte swapping, so don't use these.
- * r3 is removed for softmmu to avoid clashes with helper arguments.
+ * r0-r3 will be overwritten when reading the tlb entry (softmmu only);
+ * r14 will be overwritten by the BLNE branching to the slow path.
  */
 #ifdef CONFIG_SOFTMMU
-#define ALL_QLOAD_REGS \
+#define ALL_QLDST_REGS \
     (ALL_GENERAL_REGS & ~((1 << TCG_REG_R0) | (1 << TCG_REG_R1) | \
                           (1 << TCG_REG_R2) | (1 << TCG_REG_R3) | \
                           (1 << TCG_REG_R14)))
-#define ALL_QSTORE_REGS \
-    (ALL_GENERAL_REGS & ~((1 << TCG_REG_R0) | (1 << TCG_REG_R1) | \
-                          (1 << TCG_REG_R2) | (1 << TCG_REG_R14) | \
-                          ((TARGET_LONG_BITS == 64) << TCG_REG_R3)))
 #else
-#define ALL_QLOAD_REGS   ALL_GENERAL_REGS
-#define ALL_QSTORE_REGS \
-    (ALL_GENERAL_REGS & ~((1 << TCG_REG_R0) | (1 << TCG_REG_R1)))
+#define ALL_QLDST_REGS   (ALL_GENERAL_REGS & ~(1 << TCG_REG_R14))
 #endif
 
 /*
@@ -2203,13 +2196,13 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
         return C_O1_I4(r, r, r, rI, rI);
 
     case INDEX_op_qemu_ld_i32:
-        return TARGET_LONG_BITS == 32 ? C_O1_I1(r, l) : C_O1_I2(r, l, l);
+        return TARGET_LONG_BITS == 32 ? C_O1_I1(r, q) : C_O1_I2(r, q, q);
     case INDEX_op_qemu_ld_i64:
-        return TARGET_LONG_BITS == 32 ? C_O2_I1(e, p, l) : C_O2_I2(e, p, l, l);
+        return TARGET_LONG_BITS == 32 ? C_O2_I1(e, p, q) : C_O2_I2(e, p, q, q);
     case INDEX_op_qemu_st_i32:
-        return TARGET_LONG_BITS == 32 ? C_O0_I2(s, s) : C_O0_I3(s, s, s);
+        return TARGET_LONG_BITS == 32 ? C_O0_I2(q, q) : C_O0_I3(q, q, q);
     case INDEX_op_qemu_st_i64:
-        return TARGET_LONG_BITS == 32 ? C_O0_I3(S, p, s) : C_O0_I4(S, p, s, s);
+        return TARGET_LONG_BITS == 32 ? C_O0_I3(Q, p, q) : C_O0_I4(Q, p, q, q);
 
     case INDEX_op_st_vec:
         return C_O0_I2(w, r);
-- 
2.34.1

