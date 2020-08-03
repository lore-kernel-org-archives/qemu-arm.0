Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp5953584lfy;
        Mon, 3 Aug 2020 04:19:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwiHP9IjbE7l0XXITWZ4DjaPByazlzJ3yi+v5YHsbQB/1rA9JZlCjMii0dAbUSWvevPvJln
X-Received: by 2002:a5b:947:: with SMTP id x7mr27026658ybq.106.1596453548075;
        Mon, 03 Aug 2020 04:19:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596453548; cv=none;
        d=google.com; s=arc-20160816;
        b=bj1T98/2aApq4gE2KCoSXy4VoZC//trir2PFx2OF1KXdjw/VGinue3PEQmiybvj8tj
         cZV+wyFagOZXzygF7R3R42Te0Y6SwJylBqyn8PjexeVkOmVivzWOUlUCEx4ap27G31/r
         gEQcVPqKol+3UrXKKVhst816fdrHj7uT3QnpA6+6zhfNMkS6nHcAhFVkF2jkZ14mUB4C
         VkZkVZr9UsZsH2N3CTJSNf+PPF4GXUr3myqqtXIcLQNQlvcXeYwMmixJccA72ptt7Vgx
         rPhbJ3szg0tkSwK1p1Plwauydeo/Y7drSa4kg55/ivVlwhXb+UJfBMVl6IhTSTD3WjzH
         D8HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=GdK1Bc8JNmdYj342FXS0zCz0nM9XuyCr0eFVY1VBs2Q=;
        b=JLHX3RFLlls8R0E0UoPBmCT6rkn4D6zb9QYppk1GEWvTLGbh3pECDAvdPvGZuulm2D
         4gVOJRG/X6ftk9D+x3ZmAALgYRAK/ZmHVw9g8j+TRsnkiW95S9uSu4OzZ6MeC+q8nxX+
         PGsncphTBjmO4wXySEPLLYCrW9Nin+EdXXbcm/vGGTwlblL+PUmVPaWMeGE+MUQ9gI05
         YPLrxaVCcKXdmJhdNzK8ODoSYkBdfJDFvBBo5pJ4tjsl4N4ke7A1Q+D6mNXEncIyFPyq
         CdzcfX21cyr+0PYLUsZX8anFBSQqAT9bZnaROjDP3Nsungi9SAeT58jLGPGX5lYrPEjz
         YLAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xLByYNFX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k23si11795624ybj.389.2020.08.03.04.19.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Aug 2020 04:19:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xLByYNFX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k2YUl-0003j1-F3
	for alex.bennee@linaro.org; Mon, 03 Aug 2020 07:19:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k2YUc-0003hf-QY
 for qemu-arm@nongnu.org; Mon, 03 Aug 2020 07:18:58 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:36062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k2YUb-0004sI-07
 for qemu-arm@nongnu.org; Mon, 03 Aug 2020 07:18:58 -0400
Received: by mail-wm1-x342.google.com with SMTP id 3so15073888wmi.1
 for <qemu-arm@nongnu.org>; Mon, 03 Aug 2020 04:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=GdK1Bc8JNmdYj342FXS0zCz0nM9XuyCr0eFVY1VBs2Q=;
 b=xLByYNFXUy8ENf1HBwA0fIR6SHk/p6AI3SIUWqykqtbWlwS+siTiTE4GHVATZjatOw
 ViLTRlu332AUKOc8AmacvfA5XA6HCxwRleEDDn+mHRg8FqaXb51976/139U3jodnvdDb
 iC41aVLb26dkC2nqJpAVAFMOvKtGba0MDADOMw23ClGu/R/5pb7I/MtWtAG0+21Icw3d
 Uqu+lYNli1lP5flBM2SIY4Po3TjrJzuqAT2Efh5UKuG2VvrO+WCnf9bqMqNr9nDMS55a
 YqJPsG4EHeoCLY+mUN93Tti4FoLT1uC2ksumJKkd8eh5Ev1CnWC7eaLwZqcgwQHHp8yb
 g0Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GdK1Bc8JNmdYj342FXS0zCz0nM9XuyCr0eFVY1VBs2Q=;
 b=amO8lsluoY16RyJeHp+IDfzaUnOAP4Or5NRHhJPoGJW54EX6Cfyucb4XhrJAZszcKl
 rzYjzUzY/GMpRLpGDU1inueH5pF4MRLpGq8/Lo7YhkhDL8R1lX+h/3ihZTIvLLvMo/vG
 y4KTAru63uhIwu0TMwFrjVPAEMCzkDiK+nEdyqXTfzRMGAIzUbsFHLZWu4teWa8a34kS
 DfmJoqTu2zXOvaRdwPFGm+fFJyf99kD/93tZwOB2OFCiQW+/z8uG52WOZ3cQupXa206d
 GKFAdoMY78k5lnmvZWmoHta89+k0ihQBTSDbnJ3b5lfv8Wy2XxLxcf8bFpaUJ/yRbDUL
 qe6g==
X-Gm-Message-State: AOAM533M+TPPETeCFYcwo5ugoIzWItFA8OZ4XgTRqix6kjcGJ3I2/DD2
 54/LhHtLEErasllk+Fe6U1NWA8n6fb6Vlw==
X-Received: by 2002:a1c:3b89:: with SMTP id i131mr15368269wma.30.1596453534856; 
 Mon, 03 Aug 2020 04:18:54 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g3sm28013170wrb.59.2020.08.03.04.18.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 04:18:54 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/7] target/arm: Separate decode from handling of coproc insns
Date: Mon,  3 Aug 2020 12:18:44 +0100
Message-Id: <20200803111849.13368-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200803111849.13368-1-peter.maydell@linaro.org>
References: <20200803111849.13368-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YvQiu9uMp37J

As a prelude to making coproc insns use decodetree, split out the
part of disas_coproc_insn() which does instruction decoding from the
part which does the actual work, and make do_coproc_insn() handle the
UNDEF-on-bad-permissions and similar cases itself rather than
returning 1 to eventually percolate up to a callsite that calls
unallocated_encoding() for it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 76 ++++++++++++++++++++++++------------------
 1 file changed, 44 insertions(+), 32 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index a2765fc60b2..cfdcf5281d3 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -4544,34 +4544,12 @@ void gen_gvec_uaba(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
     tcg_gen_gvec_3(rd_ofs, rn_ofs, rm_ofs, opr_sz, max_sz, &ops[vece]);
 }
 
-static int disas_coproc_insn(DisasContext *s, uint32_t insn)
+static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
+                           int opc1, int crn, int crm, int opc2,
+                           bool isread, int rt, int rt2)
 {
-    int cpnum, is64, crn, crm, opc1, opc2, isread, rt, rt2;
     const ARMCPRegInfo *ri;
 
-    cpnum = (insn >> 8) & 0xf;
-
-    is64 = (insn & (1 << 25)) == 0;
-    if (!is64 && ((insn & (1 << 4)) == 0)) {
-        /* cdp */
-        return 1;
-    }
-
-    crm = insn & 0xf;
-    if (is64) {
-        crn = 0;
-        opc1 = (insn >> 4) & 0xf;
-        opc2 = 0;
-        rt2 = (insn >> 16) & 0xf;
-    } else {
-        crn = (insn >> 16) & 0xf;
-        opc1 = (insn >> 21) & 7;
-        opc2 = (insn >> 5) & 7;
-        rt2 = 0;
-    }
-    isread = (insn >> 20) & 1;
-    rt = (insn >> 12) & 0xf;
-
     ri = get_arm_cp_reginfo(s->cp_regs,
             ENCODE_CP_REG(cpnum, is64, s->ns, crn, crm, opc1, opc2));
     if (ri) {
@@ -4579,7 +4557,8 @@ static int disas_coproc_insn(DisasContext *s, uint32_t insn)
 
         /* Check access permissions */
         if (!cp_access_ok(s->current_el, ri, isread)) {
-            return 1;
+            unallocated_encoding(s);
+            return;
         }
 
         if (s->hstr_active || ri->accessfn ||
@@ -4653,14 +4632,15 @@ static int disas_coproc_insn(DisasContext *s, uint32_t insn)
         /* Handle special cases first */
         switch (ri->type & ~(ARM_CP_FLAG_MASK & ~ARM_CP_SPECIAL)) {
         case ARM_CP_NOP:
-            return 0;
+            return;
         case ARM_CP_WFI:
             if (isread) {
-                return 1;
+                unallocated_encoding(s);
+                return;
             }
             gen_set_pc_im(s, s->base.pc_next);
             s->base.is_jmp = DISAS_WFI;
-            return 0;
+            return;
         default:
             break;
         }
@@ -4720,7 +4700,7 @@ static int disas_coproc_insn(DisasContext *s, uint32_t insn)
             /* Write */
             if (ri->type & ARM_CP_CONST) {
                 /* If not forbidden by access permissions, treat as WI */
-                return 0;
+                return;
             }
 
             if (is64) {
@@ -4786,7 +4766,7 @@ static int disas_coproc_insn(DisasContext *s, uint32_t insn)
             gen_lookup_tb(s);
         }
 
-        return 0;
+        return;
     }
 
     /* Unknown register; this might be a guest error or a QEMU
@@ -4806,7 +4786,39 @@ static int disas_coproc_insn(DisasContext *s, uint32_t insn)
                       s->ns ? "non-secure" : "secure");
     }
 
-    return 1;
+    unallocated_encoding(s);
+    return;
+}
+
+static int disas_coproc_insn(DisasContext *s, uint32_t insn)
+{
+    int cpnum, is64, crn, crm, opc1, opc2, isread, rt, rt2;
+
+    cpnum = (insn >> 8) & 0xf;
+
+    is64 = (insn & (1 << 25)) == 0;
+    if (!is64 && ((insn & (1 << 4)) == 0)) {
+        /* cdp */
+        return 1;
+    }
+
+    crm = insn & 0xf;
+    if (is64) {
+        crn = 0;
+        opc1 = (insn >> 4) & 0xf;
+        opc2 = 0;
+        rt2 = (insn >> 16) & 0xf;
+    } else {
+        crn = (insn >> 16) & 0xf;
+        opc1 = (insn >> 21) & 7;
+        opc2 = (insn >> 5) & 7;
+        rt2 = 0;
+    }
+    isread = (insn >> 20) & 1;
+    rt = (insn >> 12) & 0xf;
+
+    do_coproc_insn(s, cpnum, is64, opc1, crn, crm, opc2, isread, rt, rt2);
+    return 0;
 }
 
 /* Decode XScale DSP or iWMMXt insn (in the copro space, cp=0 or 1) */
-- 
2.20.1

