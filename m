Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp3968020wrv;
        Mon, 5 Aug 2019 06:10:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzCwmK3xLQuEK27DRkmvRn5sINOsa5zqB+gjj3OGotvcMP7Rm9FVCkjw5l82wHQPKzJB2Qe
X-Received: by 2002:a50:a56d:: with SMTP id z42mr32432566edb.241.1565010608219;
        Mon, 05 Aug 2019 06:10:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565010608; cv=none;
        d=google.com; s=arc-20160816;
        b=DSM78nlqKkSS+LwIXCO4rCGQpGIBfMZxu2vIzrFpdUf7sB6AroSfvUVPF8pmsGSV+V
         pgUSp0jvS6tCj2Fr1kVRkAQS+at2St5WUB/BsS16G/ZvGQqMnfWtEy2szzN306TPx38B
         L92yZWOlbN2xTo4WOyuu4+8TCe4RsPsCvUct1Iy7md5FfyNfyF2QxxkBpMvS90ZyOOUz
         I7ccbXiAQS3EcoFNLCajNImjrVr5Zavphi7rE8AtJRNuVlHn/Ue7HueysEJLsNMHoLcA
         cCVfDW5TQYO7ArjRTcP4+XSxF4KElY/m4oQ2Q/pR031avkjYyKRGvKkO895gaaPm+q5k
         nXhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=TVwlsu2eYeCMvi9/271IWIXUfOnAUkIydke54giXF70=;
        b=lYnh1tljDiTytw47b5VoJH0mMfpDHtViM2NsD7YEGH6TSDXxAYFW4H1GfhQByrKpAp
         xDIoQI1EsTCBbBE67kDfOEmvwILcDwDf+oymAiRACvcV2K4tS849luCsWnga/fa5tNnR
         Qi75ek1ttV3uqeu7GUXJNNHDry8fwMCZlpopaSoQ74g+Q8pu1aF2kqFdEPeJA3wS6GbB
         xoIfBzq8VwpN3370k94XrTKyHO3ba4SpacJYGr2EQpimj83ASiF+4RBEUSQLTLKksJ5e
         vGUeb3ht1UZrTha2cQD5ztvFsW6213SLIYjMVTqd9lpqFWLYwqwRhkkpZc1pxsnAY7vF
         Vf0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zyhcc+a4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f44si30249995edb.68.2019.08.05.06.10.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Aug 2019 06:10:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zyhcc+a4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1huckZ-0000ch-90
	for alex.bennee@linaro.org; Mon, 05 Aug 2019 09:10:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52753)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1huckQ-0000Yh-Dt
 for qemu-arm@nongnu.org; Mon, 05 Aug 2019 09:09:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1huckP-00047V-2H
 for qemu-arm@nongnu.org; Mon, 05 Aug 2019 09:09:58 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:46435)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1huckO-00046r-T4
 for qemu-arm@nongnu.org; Mon, 05 Aug 2019 09:09:57 -0400
Received: by mail-wr1-x443.google.com with SMTP id z1so84358947wru.13
 for <qemu-arm@nongnu.org>; Mon, 05 Aug 2019 06:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=TVwlsu2eYeCMvi9/271IWIXUfOnAUkIydke54giXF70=;
 b=zyhcc+a4ZwnmGVAXruVbu99CrPHaSpYJiB/lvHcpyrKUb0MNwKfx4EBShRtRXBph2C
 qk5AM09ovzvdn0BdzTyCHvoHHv9hm6M8x68T5t8Z7wRGGCquDoqLJWcIJOt2nK5cT0MF
 FyZbiDp+aOoCGgUL1fwv4tY3fIry9tzNScpeFk1EO+BCZbH3+POuJb/ikZgDE6AFVyQ3
 TKg/B0YqG0gop/EUZds9F363ZPpyTBJbjMfK7K0lAJagLFWfR3V+6dOpELhLacOQDitm
 kPcvD8bvlo86QcSfuo6XmiqsvsaZFdtGCx0MmJxxYtN6OrAF8VIrUvc1EwSmLHtHM9cm
 hGvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TVwlsu2eYeCMvi9/271IWIXUfOnAUkIydke54giXF70=;
 b=IWpxlGLiU+3Jzfs67u/tlp4XcI7Ifn1PqFN1K3chORZWeYWwJf5Zi8G8ElgsohUDbk
 /JfLofN8O8CcsxGHbKdEnxbHJgXUe906g5+TbrxuJBK3CuChow1A1rHjsbsBZ8mkqniX
 rO/UjWnU9hDdgODmlS5uf5dKHlT7Sw9axU4m57DM8ysT1mnDYIr0hqPV+MSWRHqxJwxv
 2+yKy5nMuEQgwsbalw9FmmKng005mz0eT5gnU3QxfASCTJm0VaTJSflMqFSAMtsFNafW
 wmZWdekFxUYgpOvKIiSPoqalmKJuTBEX/LMv739yl535J914sB1oe+1yYjMTCvH8wmaX
 2HbA==
X-Gm-Message-State: APjAAAXpavwcIgpaMbPRVdWHV94xbwkk+dwishqQnTdUaLTKkWR7i3hk
 lk68xpkC9mm4BUAHTSGW4FVnY0AvAAFv/g==
X-Received: by 2002:adf:aac8:: with SMTP id i8mr2937607wrc.56.1565010595799;
 Mon, 05 Aug 2019 06:09:55 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id x20sm65233782wmc.1.2019.08.05.06.09.54
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 06:09:55 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon,  5 Aug 2019 14:09:51 +0100
Message-Id: <20190805130952.4415-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190805130952.4415-1-peter.maydell@linaro.org>
References: <20190805130952.4415-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: [Qemu-arm] [PATCH 1/2] target/arm: Factor out 'generate singlestep
 exception' function
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
X-TUID: pNNFriPICI3D

Factor out code to 'generate a singlestep exception', which is
currently repeated in four places.

To do this we need to also pull the identical copies of the
gen-exception() function out of translate-a64.c and translate.c
into translate.h.

(There is a bug in the code: we're taking the exception to the wrong
target EL.  This will be simpler to fix if there's only one place to
do it.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.h     | 23 +++++++++++++++++++++++
 target/arm/translate-a64.c | 19 ++-----------------
 target/arm/translate.c     | 20 ++------------------
 3 files changed, 27 insertions(+), 35 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index a20f6e20568..45053190baa 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -2,6 +2,7 @@
 #define TARGET_ARM_TRANSLATE_H
 
 #include "exec/translator.h"
+#include "internals.h"
 
 
 /* internal defines */
@@ -232,6 +233,28 @@ static inline void gen_ss_advance(DisasContext *s)
     }
 }
 
+static inline void gen_exception(int excp, uint32_t syndrome,
+                                 uint32_t target_el)
+{
+    TCGv_i32 tcg_excp = tcg_const_i32(excp);
+    TCGv_i32 tcg_syn = tcg_const_i32(syndrome);
+    TCGv_i32 tcg_el = tcg_const_i32(target_el);
+
+    gen_helper_exception_with_syndrome(cpu_env, tcg_excp,
+                                       tcg_syn, tcg_el);
+
+    tcg_temp_free_i32(tcg_el);
+    tcg_temp_free_i32(tcg_syn);
+    tcg_temp_free_i32(tcg_excp);
+}
+
+/* Generate an architectural singlestep exception */
+static inline void gen_swstep_exception(DisasContext *s, int isv, int ex)
+{
+    gen_exception(EXCP_UDEF, syn_swstep(s->ss_same_el, isv, ex),
+                  default_exception_el(s));
+}
+
 /*
  * Given a VFP floating point constant encoded into an 8 bit immediate in an
  * instruction, expand it to the actual constant value of the specified
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index d3231477a27..f6729b96fd0 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -253,19 +253,6 @@ static void gen_exception_internal(int excp)
     tcg_temp_free_i32(tcg_excp);
 }
 
-static void gen_exception(int excp, uint32_t syndrome, uint32_t target_el)
-{
-    TCGv_i32 tcg_excp = tcg_const_i32(excp);
-    TCGv_i32 tcg_syn = tcg_const_i32(syndrome);
-    TCGv_i32 tcg_el = tcg_const_i32(target_el);
-
-    gen_helper_exception_with_syndrome(cpu_env, tcg_excp,
-                                       tcg_syn, tcg_el);
-    tcg_temp_free_i32(tcg_el);
-    tcg_temp_free_i32(tcg_syn);
-    tcg_temp_free_i32(tcg_excp);
-}
-
 static void gen_exception_internal_insn(DisasContext *s, int offset, int excp)
 {
     gen_a64_set_pc_im(s->pc - offset);
@@ -305,8 +292,7 @@ static void gen_step_complete_exception(DisasContext *s)
      * of the exception, and our syndrome information is always correct.
      */
     gen_ss_advance(s);
-    gen_exception(EXCP_UDEF, syn_swstep(s->ss_same_el, 1, s->is_ldex),
-                  default_exception_el(s));
+    gen_swstep_exception(s, 1, s->is_ldex);
     s->base.is_jmp = DISAS_NORETURN;
 }
 
@@ -14261,8 +14247,7 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
          * bits should be zero.
          */
         assert(dc->base.num_insns == 1);
-        gen_exception(EXCP_UDEF, syn_swstep(dc->ss_same_el, 0, 0),
-                      default_exception_el(dc));
+        gen_swstep_exception(dc, 0, 0);
         dc->base.is_jmp = DISAS_NORETURN;
     } else {
         disas_a64_insn(env, dc);
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 7853462b21b..19b9d8f2725 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -282,20 +282,6 @@ static void gen_exception_internal(int excp)
     tcg_temp_free_i32(tcg_excp);
 }
 
-static void gen_exception(int excp, uint32_t syndrome, uint32_t target_el)
-{
-    TCGv_i32 tcg_excp = tcg_const_i32(excp);
-    TCGv_i32 tcg_syn = tcg_const_i32(syndrome);
-    TCGv_i32 tcg_el = tcg_const_i32(target_el);
-
-    gen_helper_exception_with_syndrome(cpu_env, tcg_excp,
-                                       tcg_syn, tcg_el);
-
-    tcg_temp_free_i32(tcg_el);
-    tcg_temp_free_i32(tcg_syn);
-    tcg_temp_free_i32(tcg_excp);
-}
-
 static void gen_step_complete_exception(DisasContext *s)
 {
     /* We just completed step of an insn. Move from Active-not-pending
@@ -308,8 +294,7 @@ static void gen_step_complete_exception(DisasContext *s)
      * of the exception, and our syndrome information is always correct.
      */
     gen_ss_advance(s);
-    gen_exception(EXCP_UDEF, syn_swstep(s->ss_same_el, 1, s->is_ldex),
-                  default_exception_el(s));
+    gen_swstep_exception(s, 1, s->is_ldex);
     s->base.is_jmp = DISAS_NORETURN;
 }
 
@@ -12024,8 +12009,7 @@ static bool arm_pre_translate_insn(DisasContext *dc)
          * bits should be zero.
          */
         assert(dc->base.num_insns == 1);
-        gen_exception(EXCP_UDEF, syn_swstep(dc->ss_same_el, 0, 0),
-                      default_exception_el(dc));
+        gen_swstep_exception(dc, 0, 0);
         dc->base.is_jmp = DISAS_NORETURN;
         return true;
     }
-- 
2.20.1

