Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp1606277lff;
        Fri, 18 Jun 2021 07:19:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCem/Tatlu4HrHE6T0M8bOnNDJiPWvKsa+NfHYcCKBGbJ95xD3rawKMNNcqk0ssrebW8mo
X-Received: by 2002:a17:906:19cc:: with SMTP id h12mr11106859ejd.306.1624025981659;
        Fri, 18 Jun 2021 07:19:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624025981; cv=none;
        d=google.com; s=arc-20160816;
        b=m3cdcdFd3ucMw+6g3tLQj30wM088+N33D5VjadhOF097F64oxwWf+jx1qWoSWZS37r
         ZrIisZH+9FcuWALbIT20I0HGw6L2ehIf6nw4zw0GIqVwg13pMwzWWV7j1XkNrszPHjfx
         z3YS1AB9uZX+kEbw5g039BI6E8onbNJQmNSMxg2QidFS3kzRemDRJ/xZyVmM2jV6U+1X
         4ZpqwB6YOhQR5Ibtq2iG7bTrMWADuAEODXP+zs+KFzMBRjdwC+rydVF2UQy4BS/TwyHo
         RN9ory1sqDBkBbj2sta0vo7mi/SLQ5CP6vKzndsuslUWccuweSSmLGixwLWKTA6WmOwb
         M1nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=s+/OW/sFe2egCGOmpvnbQvn6rHu2TjvlR2dS4FiM/Es=;
        b=zI+SswgZjB4cYyYRULN4UOGTZ2+07r6jaJcMng440vIM0Ft3EBoazWLKF0jI3oghFd
         2aui8kqRuzJOlDyHwt6zzlBimXHzqlOpX+rtwMdcfeSRZb9sHDpid0OhPuvnHY9F1ok6
         WKJqaFiKjk+hCReKsGw23b90RjpEdnhnnrre60SKvWok7TeYwfGRq8cbWjdZCS+6287d
         CzNojQaowlVA59IVeu9vmRZXAk5er/l0YrU4QM+75Pt2Rr5dFu1I5vnAgF0KczBD0rwF
         UFxjyiFes+kpmDALfCzfN56CW817B1XNx5vmai5i/tCFDcAWgQj7WUmMmg6S3zFmwsDp
         Jk/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xVS0gbG0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id by13si2660042ejc.433.2021.06.18.07.19.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Jun 2021 07:19:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xVS0gbG0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1luFLQ-0004YB-LM
	for alex.bennee@linaro.org; Fri, 18 Jun 2021 10:19:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1luFCu-0007kK-N1
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 10:10:52 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:39570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1luFCW-00021Q-1b
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 10:10:52 -0400
Received: by mail-wr1-x433.google.com with SMTP id b3so680198wrm.6
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 07:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=s+/OW/sFe2egCGOmpvnbQvn6rHu2TjvlR2dS4FiM/Es=;
 b=xVS0gbG06NwDSpb+gjm5ECyaDk+hbPjjXM7p23bOAQJJ65HLKnWQJ3wFDbtmGuPC6c
 OBj/qz8Hrh9UQy8LdTeeNvvDib39AET33++an0HMpv2+TvzkmQ5SEJII6ntgO5r0dk99
 bc1+zJxM2p0s+d+L4US2gQPohd+qs+/ZpMuqZH1E53xiQ/0nZgoOBFhUZidOuqdi35te
 WWAa6a/rvs866+faDWMkkSE7lenHXxWUQu6er7fOTIipdyXiQkzUsmXbccCxba7QgEJP
 BWLoxCsev8fUycycxLvB75Py5eRBnKEBHpL3HuTnKxZY8q6wtUtR2VWIUCuDjWxW+7ys
 hnUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s+/OW/sFe2egCGOmpvnbQvn6rHu2TjvlR2dS4FiM/Es=;
 b=nOm/el8YOHoq4Go8WJap4/M2bo4Be0KYQV0umTn3/kvNa1WCoftdoZuqzVs5Z5XhnF
 2THxtw0xiSXvPtC3VxZtUsKSTRZ91l6pguxcTfb/cyZPseD1naYZMMV+8Y48TBkHjjJn
 /hAGCiSeHusFYy62bHt+7IXbqW2atJzti+xRSndgbPS/1dZRUNs9e1ObB52I5cvUxP98
 e35nspgUpKfd6WIZdIGP0jQoQ5Bwuw6gzLNVP/hQj0gE8dR7YQukTOiADHzRdKW1zqLE
 bzcFq269pe0SkSOVatDQo5NRY8ecqzVvzyENwEgUSDxqCqjBSuom9J6FzagxujaGd2XT
 Mqbg==
X-Gm-Message-State: AOAM5333PFh/XCsF7hVlwHhdOwE06X/1eXumbkfnvBzvC5phEHGJ511u
 jpTRok6k8AGJHpkmmo2Qkr4tMiYjTQ+E6cn7
X-Received: by 2002:adf:e948:: with SMTP id m8mr12791619wrn.205.1624025426812; 
 Fri, 18 Jun 2021 07:10:26 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j11sm7751661wmq.4.2021.06.18.07.10.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 07:10:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 6/7] target/arm: Split vfp_access_check() into A and M versions
Date: Fri, 18 Jun 2021 15:10:18 +0100
Message-Id: <20210618141019.10671-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210618141019.10671-1-peter.maydell@linaro.org>
References: <20210618141019.10671-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pb0NUyQifm+1

vfp_access_check and its helper routine full_vfp_access_check() has
gradually grown and is now an awkward mix of A-profile only and
M-profile only pieces.  Refactor it into an A-profile only and an
M-profile only version, taking advantage of the fact that now the
only direct call to full_vfp_access_check() is in A-profile-only
code.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-vfp.c | 79 +++++++++++++++++++++++---------------
 1 file changed, 48 insertions(+), 31 deletions(-)

diff --git a/target/arm/translate-vfp.c b/target/arm/translate-vfp.c
index 85418dee2e4..d89c7834faa 100644
--- a/target/arm/translate-vfp.c
+++ b/target/arm/translate-vfp.c
@@ -188,32 +188,19 @@ static void gen_update_fp_context(DisasContext *s)
 }
 
 /*
- * Check that VFP access is enabled. If it is, do the necessary
- * M-profile lazy-FP handling and then return true.
- * If not, emit code to generate an appropriate exception and
- * return false.
+ * Check that VFP access is enabled, A-profile specific version.
+ *
+ * If VFP is enabled, return true. If not, emit code to generate an
+ * appropriate exception and return false.
  * The ignore_vfp_enabled argument specifies that we should ignore
- * whether VFP is enabled via FPEXC[EN]: this should be true for FMXR/FMRX
+ * whether VFP is enabled via FPEXC.EN: this should be true for FMXR/FMRX
  * accesses to FPSID, FPEXC, MVFR0, MVFR1, MVFR2, and false for all other insns.
  */
-static bool full_vfp_access_check(DisasContext *s, bool ignore_vfp_enabled)
+static bool vfp_access_check_a(DisasContext *s, bool ignore_vfp_enabled)
 {
     if (s->fp_excp_el) {
-        if (arm_dc_feature(s, ARM_FEATURE_M)) {
-            /*
-             * M-profile mostly catches the "FPU disabled" case early, in
-             * disas_m_nocp(), but a few insns (eg LCTP, WLSTP, DLSTP)
-             * which do coprocessor-checks are outside the large ranges of
-             * the encoding space handled by the patterns in m-nocp.decode,
-             * and for them we may need to raise NOCP here.
-             */
-            gen_exception_insn(s, s->pc_curr, EXCP_NOCP,
-                               syn_uncategorized(), s->fp_excp_el);
-        } else {
-            gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
-                               syn_fp_access_trap(1, 0xe, false),
-                               s->fp_excp_el);
-        }
+        gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
+                           syn_fp_access_trap(1, 0xe, false), s->fp_excp_el);
         return false;
     }
 
@@ -222,17 +209,39 @@ static bool full_vfp_access_check(DisasContext *s, bool ignore_vfp_enabled)
         unallocated_encoding(s);
         return false;
     }
+    return true;
+}
 
-    if (arm_dc_feature(s, ARM_FEATURE_M)) {
-        /* Handle M-profile lazy FP state mechanics */
-
-        /* Trigger lazy-state preservation if necessary */
-        gen_preserve_fp_state(s);
-
-        /* Update ownership of FP context and create new FP context if needed */
-        gen_update_fp_context(s);
+/*
+ * Check that VFP access is enabled, M-profile specific version.
+ *
+ * If VFP is enabled, do the necessary M-profile lazy-FP handling and then
+ * return true. If not, emit code to generate an appropriate exception and
+ * return false.
+ */
+static bool vfp_access_check_m(DisasContext *s)
+{
+    if (s->fp_excp_el) {
+        /*
+         * M-profile mostly catches the "FPU disabled" case early, in
+         * disas_m_nocp(), but a few insns (eg LCTP, WLSTP, DLSTP)
+         * which do coprocessor-checks are outside the large ranges of
+         * the encoding space handled by the patterns in m-nocp.decode,
+         * and for them we may need to raise NOCP here.
+         */
+        gen_exception_insn(s, s->pc_curr, EXCP_NOCP,
+                           syn_uncategorized(), s->fp_excp_el);
+        return false;
     }
 
+    /* Handle M-profile lazy FP state mechanics */
+
+    /* Trigger lazy-state preservation if necessary */
+    gen_preserve_fp_state(s);
+
+    /* Update ownership of FP context and create new FP context if needed */
+    gen_update_fp_context(s);
+
     return true;
 }
 
@@ -242,7 +251,11 @@ static bool full_vfp_access_check(DisasContext *s, bool ignore_vfp_enabled)
  */
 bool vfp_access_check(DisasContext *s)
 {
-    return full_vfp_access_check(s, false);
+    if (arm_dc_feature(s, ARM_FEATURE_M)) {
+        return vfp_access_check_m(s);
+    } else {
+        return vfp_access_check_a(s, false);
+    }
 }
 
 static bool trans_VSEL(DisasContext *s, arg_VSEL *a)
@@ -732,7 +745,11 @@ static bool trans_VMSR_VMRS(DisasContext *s, arg_VMSR_VMRS *a)
         return false;
     }
 
-    if (!full_vfp_access_check(s, ignore_vfp_enabled)) {
+    /*
+     * Call vfp_access_check_a() directly, because we need to tell
+     * it to ignore FPEXC.EN for some register accesses.
+     */
+    if (!vfp_access_check_a(s, ignore_vfp_enabled)) {
         return true;
     }
 
-- 
2.20.1

