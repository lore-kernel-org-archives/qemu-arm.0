Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2393340ejb;
        Tue, 30 May 2023 12:20:37 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5U/JQS2UGGXBNM82piG41BABpU/TSUwuY/rh5NOuKLLLZCmIrks6DmKwNkLBm6KmkPiwnw
X-Received: by 2002:a05:620a:6601:b0:75b:23a1:8e7c with SMTP id qf1-20020a05620a660100b0075b23a18e7cmr2889503qkn.77.1685474437338;
        Tue, 30 May 2023 12:20:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685474437; cv=none;
        d=google.com; s=arc-20160816;
        b=o5PXYJaTJrqfGJjcnhj1E0z6vw+Zlz6dlQ4AEBa06WxJO7gTsQxdXJIHywScRlXk72
         nVWMXu4B4etWl+UbrRdRMHDJTOcPjmyWfHHstB9uvpw9f9+OSUA71mBlK8l0+txfnt7x
         kRomvrJ7u7qEZtv5FAdWAvfx2wfc3D/575ijtc2Hnl78/m59bSseBEFILHg4dHbefk1Z
         su6aYnGIfvlL/ZhbkoBRREgizviKIPI5nz7yTYjrCwnddI2VO/rW0RpFRx2jOjtr6uzR
         Xgi66sDngAetU2S1GRM1aQs3wF0NWSfm5EYE9IhzXkFnQR1jVn5YlGrSl+ZgiYCT0EB1
         +UjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=vdXQUX7VyfIMGOcc2j+k3ArawY+9z3JYFBb7DTwyza4=;
        b=CMI+Ay/uZQaoUC5OVlLStRkSqu9jt/BmZjpXtM9ZrbKwLGcA1TvOGTYZiFJ2rpQolF
         EZCRokvJH3sJyEdqEU2MnAehHTMfzVfBTFdjS5ng98MS7RBnatNW9eWPCxuc2BnmNeVX
         k2zcNeJUjShWJPoeCvj2nANr/K6LekxKBFLohLjjkmzegMFBSuANakCtA6SeFKBxF5RQ
         W912KECDvqybgeElSTI5/t4+lOUYaHfm5skIJ01VNfieJv6l2e8noo4gHtKRHvOM0AXG
         JD/9aMrS7hPeDftryyARrxg2t39oyzAsQYZeuX3OJgfmYiJfh8zZycbwj1V2hpmOXfxx
         0upQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="s4rVm/zm";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k28-20020a05620a143c00b0075cc9190379si5298686qkj.522.2023.05.30.12.20.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 12:20:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="s4rVm/zm";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q44o1-0006Jw-NG; Tue, 30 May 2023 15:14:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q44nt-0005zU-S0
 for qemu-arm@nongnu.org; Tue, 30 May 2023 15:14:45 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q44nr-0004c3-TG
 for qemu-arm@nongnu.org; Tue, 30 May 2023 15:14:45 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-64d3e5e5980so5638705b3a.2
 for <qemu-arm@nongnu.org>; Tue, 30 May 2023 12:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685474082; x=1688066082;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vdXQUX7VyfIMGOcc2j+k3ArawY+9z3JYFBb7DTwyza4=;
 b=s4rVm/zmwfH/VniMnwEZGCBS4TQp47thGkIjSSmrSDZ68v3Xz28kBFzXhhCulWQ+vH
 04y1yaoNak7SyfgDb5e+ZnozZWbe3C1t54WsWVkjIc3teb52y1AEzZbyvIjDj+ym4tP+
 TrDXHM86V6bAy1/x5awKgf8hAEUkDBuHxnUmoGeS6lFpg8zCd8Kcxk/LK8i7oq7DQ0kb
 //o50Jsb13Mnc2I2H2aIcqbHJaiYQyK/Ae/0QZNtHMMPyLihc0rtrP7l7H3RuXM+jLO8
 BbUV4OdBNaT3AU4/0OZVrj73ng0Z5jfGA+64xBqi7s/Bq6hRoQRAO1iFMdAet00tGfra
 WmoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685474082; x=1688066082;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vdXQUX7VyfIMGOcc2j+k3ArawY+9z3JYFBb7DTwyza4=;
 b=RpGXTfLeR82cR0n499aeO9qOyQuYCs21splUwPTjCumu8Pr+QRRK9QTiTB9oQfPWkM
 Y3pEniyNZluhhZVe1gUOQnovakjz/YghE6VeL5DMDAgm26Z/nL3kGHhq7X0lenMTAcVD
 Vy7khtkEodDo+XiOeNpd3cMQGSv6NKpQSx5Q10hXVmPTBx8Mx6bUlbp6d70py6r79rAZ
 HcNpABdV1SxGtnl/CbyX0aNbUkhcun0I27UC5OeCDWpThtpABcUzMkxxitcjgjZD6SBw
 GsqCup8dvT8vIYS0yq/dgsUJOMfIwzWC8onP5u6pEbxTFQDx+qy3dAEgvpYf7lwxPxVn
 99iQ==
X-Gm-Message-State: AC+VfDzR2EuaWnNZaKKMSq4oLKK1y4F8t/KpQoZ9WhjLwtvrfoYkSIVa
 ypexDbM3R6rzjBWNurIzyzqLkOx6WVcNJfziBIs=
X-Received: by 2002:a05:6a20:1593:b0:10a:cbe6:69ef with SMTP id
 h19-20020a056a20159300b0010acbe669efmr3804423pzj.37.1685474081829; 
 Tue, 30 May 2023 12:14:41 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:35a2:c45d:7485:f488])
 by smtp.gmail.com with ESMTPSA id
 10-20020a63104a000000b0051806da5cd6sm8926757pgq.60.2023.05.30.12.14.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 12:14:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 03/20] target/arm: Introduce finalize_memop_{atom,pair}
Date: Tue, 30 May 2023 12:14:21 -0700
Message-Id: <20230530191438.411344-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230530191438.411344-1-richard.henderson@linaro.org>
References: <20230530191438.411344-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
X-TUID: J82nVphLzS6l

Let finalize_memop_atom be the new basic function, with
finalize_memop and finalize_memop_pair testing FEAT_LSE2
to apply the appropriate atomicity.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate.h     | 39 +++++++++++++++++++++++++++++-----
 target/arm/tcg/translate-a64.c |  2 ++
 target/arm/tcg/translate.c     |  1 +
 3 files changed, 37 insertions(+), 5 deletions(-)

diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index a9d1f4adc2..9a33076c3d 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -85,6 +85,7 @@ typedef struct DisasContext {
     uint64_t features; /* CPU features bits */
     bool aarch64;
     bool thumb;
+    bool lse2;
     /* Because unallocated encodings generate different exception syndrome
      * information from traps due to FP being disabled, we can't do a single
      * "is fp access disabled" check at a high level in the decode tree.
@@ -552,12 +553,13 @@ static inline TCGv_ptr fpstatus_ptr(ARMFPStatusFlavour flavour)
 }
 
 /**
- * finalize_memop:
+ * finalize_memop_atom:
  * @s: DisasContext
  * @opc: size+sign+align of the memory operation
+ * @atom: atomicity of the memory operation
  *
- * Build the complete MemOp for a memory operation, including alignment
- * and endianness.
+ * Build the complete MemOp for a memory operation, including alignment,
+ * endianness, and atomicity.
  *
  * If (op & MO_AMASK) then the operation already contains the required
  * alignment, e.g. for AccType_ATOMIC.  Otherwise, this an optionally
@@ -567,12 +569,39 @@ static inline TCGv_ptr fpstatus_ptr(ARMFPStatusFlavour flavour)
  * and this is applied here.  Note that there is no way to indicate that
  * no alignment should ever be enforced; this must be handled manually.
  */
-static inline MemOp finalize_memop(DisasContext *s, MemOp opc)
+static inline MemOp finalize_memop_atom(DisasContext *s, MemOp opc, MemOp atom)
 {
     if (s->align_mem && !(opc & MO_AMASK)) {
         opc |= MO_ALIGN;
     }
-    return opc | s->be_data;
+    return opc | atom | s->be_data;
+}
+
+/**
+ * finalize_memop:
+ * @s: DisasContext
+ * @opc: size+sign+align of the memory operation
+ *
+ * Like finalize_memop_atom, but with default atomicity.
+ */
+static inline MemOp finalize_memop(DisasContext *s, MemOp opc)
+{
+    MemOp atom = s->lse2 ? MO_ATOM_WITHIN16 : MO_ATOM_IFALIGN;
+    return finalize_memop_atom(s, opc, atom);
+}
+
+/**
+ * finalize_memop_pair:
+ * @s: DisasContext
+ * @opc: size+sign+align of the memory operation
+ *
+ * Like finalize_memop_atom, but with atomicity for a pair.
+ * C.f. Pseudocode for Mem[], operand ispair.
+ */
+static inline MemOp finalize_memop_pair(DisasContext *s, MemOp opc)
+{
+    MemOp atom = s->lse2 ? MO_ATOM_WITHIN16_PAIR : MO_ATOM_IFALIGN_PAIR;
+    return finalize_memop_atom(s, opc, atom);
 }
 
 /**
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 741a608739..967400ed68 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -14110,6 +14110,8 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
     tcg_debug_assert(dc->tbid & 1);
 #endif
 
+    dc->lse2 = dc_isar_feature(aa64_lse2, dc);
+
     /* Single step state. The code-generation logic here is:
      *  SS_ACTIVE == 0:
      *   generate code with no special handling for single-stepping (except
diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index 7468476724..7a6a8029e5 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -9183,6 +9183,7 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
         dc->sme_trap_nonstreaming =
             EX_TBFLAG_A32(tb_flags, SME_TRAP_NONSTREAMING);
     }
+    dc->lse2 = false; /* applies only to aarch64 */
     dc->cp_regs = cpu->cp_regs;
     dc->features = env->features;
 
-- 
2.34.1

