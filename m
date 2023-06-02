Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp1232176ejb;
        Fri, 2 Jun 2023 08:53:33 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4MPc1P3EV7CFJreLp00iwjKm/S8x8zczqp1wLQhVv0vlMqRKHIDBX0ALtf2a8qW4y8abs1
X-Received: by 2002:a05:6214:ccb:b0:626:3a98:965 with SMTP id 11-20020a0562140ccb00b006263a980965mr15664794qvx.12.1685721213091;
        Fri, 02 Jun 2023 08:53:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685721213; cv=none;
        d=google.com; s=arc-20160816;
        b=sSvcnWPIFNtrM0XO4JkRJHAcjkWkN2iGdrPCCvQlosDevYhjnrwZ0XdXW6bH2SsdIx
         f4V4iNZ2S2gbzq21g02pYSuRuwVCAPB30Kg4YXFscX0mD5s7+PNZQ4OcIjKeIcQrA8Ml
         KOwS1HVtSYa9zk4Z+jLJanjOjwinCPlqwmELfy/AJ743yX34XdhjzBg6qCfxjx6MNKso
         RKoc7zExB9WJ1zLvDKIKZ6c10QbSOiXPRhGlz+4buKbHv49xVI4RG4BtYKR2g9ZR5cYg
         3PPsk5bvdJapAxtyK8jFZn9nScyLkJHTylVrVnF4MbCFkBk6g41uiz84uZB3K7tQBATQ
         mLnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=CVG899GadG9n5+PuNksPKw1TX7s6N642Zf3CKGOWr8s=;
        b=FthMMGRz0kjXr4ZK5JjR4JkpusNToOqers8uT9eB2DfKKw+FtlngE6dVqy3RflCgfF
         JBuuTbZKcLXbJtKPB+OQYAG1hSPQ1UpDE04LMSFEtVW1g2vBxK4/Z2Sc9dg+xofsQmlB
         sJklkdxP6+BpoJbqM9wtws89g5Fz0Zkj66B2r1BwDT+oufGxSGdOD2IwePBL4r+T6zAg
         27Md1f3eqAdHzRPGPRAiEXWC3inVq8divCSDCWs8+IyhpGA+Nk4+XJbXxXQy9LRa6atT
         WkvFzL0CTozbY1ZsYpXXh/8qQ9Zaguux82UJhp6jEUx/uGkh7VLPdKF/BwGZ3mCU6RRI
         W08w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mcgSSd4Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q14-20020a05621419ee00b006262021ac0csi1103864qvc.186.2023.06.02.08.53.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Jun 2023 08:53:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mcgSSd4Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q574s-00039c-Ma; Fri, 02 Jun 2023 11:52:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q574q-00037b-LI
 for qemu-arm@nongnu.org; Fri, 02 Jun 2023 11:52:32 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q574n-0003RB-F8
 for qemu-arm@nongnu.org; Fri, 02 Jun 2023 11:52:32 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f68fc6b479so21648365e9.2
 for <qemu-arm@nongnu.org>; Fri, 02 Jun 2023 08:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685721148; x=1688313148;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=CVG899GadG9n5+PuNksPKw1TX7s6N642Zf3CKGOWr8s=;
 b=mcgSSd4Z9UpL9s+ZOn/1rhmcYL43ryPIzlj2a9nbIpUoUQAGq/092q1uPluYkm2OKx
 JefmrImXZiMYH9tl2+7vHuKrq65y8w2gyYZZ2plxTFUY0NAh7zn14KTMmZkRTLKeOEt3
 yjItJk3JdFWb/kso9mL0+sMSEz0MbISXmCFTLhqqKyhGEOZXN/OcZC6npr732tVAAj3G
 ijmfx+1RU0tGL4Waf1YZLiyTP/gNA397kGcWJ/qBzLRhdF6U7zdczfYV5GZYGI7x7yvH
 7rB2Q4qSSFPC6FQAP5/qUC65kJhESF3gzQPgK51cxETzFIfEb0e/HqfnO9p/UvgNgjEe
 Wivg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685721148; x=1688313148;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CVG899GadG9n5+PuNksPKw1TX7s6N642Zf3CKGOWr8s=;
 b=G/hXI3qZRe/jfiElZ3Wwk/rSrdUA+4NRw9V+/XjioLOjxtXJxDLELnRdKRNEk+WeXi
 yxnN/ZwEVTTMFdBnQicJyYu1tSl6yprm4xFBUH/wwG2TNx3EBrtdwUsQtfOG3NszA9nN
 uGYhO3nqRilCQkZg+iW50oK4NnMVDRyGvOaFqZ7EJ+0c0iDXHvYZRdxmSX4XAcqcgoK8
 /4W8Wssd+FrHb5h/LiGPcPIGicYD7H4HiJlQmKKjj9TcbtdFnURdr7HKL1GTxl2+Ztkg
 OCDsTXpJ1p3dnzmAuryrioeanvivTV1uJ6RbEKpONMQS61zAKYBWPEJiayumCnNqCjZG
 5rbQ==
X-Gm-Message-State: AC+VfDyFyoVErwVEPsCx6M7aht2Hb2krYZUlJMc7gNznbQhpO/AAtulg
 u5+TN5ORwOFLMNGEeGf6pOmMfaY0EgYa0mIbn94=
X-Received: by 2002:a1c:7c1a:0:b0:3f6:117:6ed7 with SMTP id
 x26-20020a1c7c1a000000b003f601176ed7mr2157119wmc.35.1685721148184; 
 Fri, 02 Jun 2023 08:52:28 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a05600c214700b003f72a15301csm594952wml.2.2023.06.02.08.52.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jun 2023 08:52:27 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 04/20] target/arm: Convert CFINV,
 XAFLAG and AXFLAG to decodetree
Date: Fri,  2 Jun 2023 16:52:07 +0100
Message-Id: <20230602155223.2040685-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230602155223.2040685-1-peter.maydell@linaro.org>
References: <20230602155223.2040685-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: bX/cHMzxNWu5

Convert the CFINV, XAFLAG and AXFLAG insns to decodetree.
The old decoder handles these in handle_msr_i(), but
the architecture defines them as separate instructions
from MSR (immediate).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/a64.decode      |  6 ++++
 target/arm/tcg/translate-a64.c | 56 ++++++++++++++++++----------------
 2 files changed, 35 insertions(+), 27 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 553f6904d9c..26a0b44cea9 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -188,3 +188,9 @@ CLREX           1101 0101 0000 0011 0011 imm:4 010 11111
 DSB_DMB         1101 0101 0000 0011 0011 domain:2 types:2 10- 11111
 ISB             1101 0101 0000 0011 0011 imm:4 110 11111
 SB              1101 0101 0000 0011 0011 0000 111 11111
+
+# PSTATE
+
+CFINV           1101 0101 0000 0 000 0100 0000 000 11111
+XAFLAG          1101 0101 0000 0 000 0100 0000 001 11111
+AXFLAG          1101 0101 0000 0 000 0100 0000 010 11111
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 09258a9854f..33bebe594d1 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -1809,9 +1809,25 @@ static bool trans_SB(DisasContext *s, arg_SB *a)
     return true;
 }
 
-static void gen_xaflag(void)
+static bool trans_CFINV(DisasContext *s, arg_CFINV *a)
 {
-    TCGv_i32 z = tcg_temp_new_i32();
+    if (!dc_isar_feature(aa64_condm_4, s)) {
+        return false;
+    }
+    tcg_gen_xori_i32(cpu_CF, cpu_CF, 1);
+    s->base.is_jmp = DISAS_NEXT;
+    return true;
+}
+
+static bool trans_XAFLAG(DisasContext *s, arg_XAFLAG *a)
+{
+    TCGv_i32 z;
+
+    if (!dc_isar_feature(aa64_condm_5, s)) {
+        return false;
+    }
+
+    z = tcg_temp_new_i32();
 
     tcg_gen_setcondi_i32(TCG_COND_EQ, z, cpu_ZF, 0);
 
@@ -1835,10 +1851,17 @@ static void gen_xaflag(void)
 
     /* C | Z */
     tcg_gen_or_i32(cpu_CF, cpu_CF, z);
+
+    s->base.is_jmp = DISAS_NEXT;
+    return true;
 }
 
-static void gen_axflag(void)
+static bool trans_AXFLAG(DisasContext *s, arg_AXFLAG *a)
 {
+    if (!dc_isar_feature(aa64_condm_5, s)) {
+        return false;
+    }
+
     tcg_gen_sari_i32(cpu_VF, cpu_VF, 31);         /* V ? -1 : 0 */
     tcg_gen_andc_i32(cpu_CF, cpu_CF, cpu_VF);     /* C & !V */
 
@@ -1847,6 +1870,9 @@ static void gen_axflag(void)
 
     tcg_gen_movi_i32(cpu_NF, 0);
     tcg_gen_movi_i32(cpu_VF, 0);
+
+    s->base.is_jmp = DISAS_NEXT;
+    return true;
 }
 
 /* MSR (immediate) - move immediate to processor state field */
@@ -1859,30 +1885,6 @@ static void handle_msr_i(DisasContext *s, uint32_t insn,
     s->base.is_jmp = DISAS_TOO_MANY;
 
     switch (op) {
-    case 0x00: /* CFINV */
-        if (crm != 0 || !dc_isar_feature(aa64_condm_4, s)) {
-            goto do_unallocated;
-        }
-        tcg_gen_xori_i32(cpu_CF, cpu_CF, 1);
-        s->base.is_jmp = DISAS_NEXT;
-        break;
-
-    case 0x01: /* XAFlag */
-        if (crm != 0 || !dc_isar_feature(aa64_condm_5, s)) {
-            goto do_unallocated;
-        }
-        gen_xaflag();
-        s->base.is_jmp = DISAS_NEXT;
-        break;
-
-    case 0x02: /* AXFlag */
-        if (crm != 0 || !dc_isar_feature(aa64_condm_5, s)) {
-            goto do_unallocated;
-        }
-        gen_axflag();
-        s->base.is_jmp = DISAS_NEXT;
-        break;
-
     case 0x03: /* UAO */
         if (!dc_isar_feature(aa64_uao, s) || s->current_el == 0) {
             goto do_unallocated;
-- 
2.34.1

