Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp1597830lff;
        Fri, 18 Jun 2021 07:11:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCWLwxBAkZ520giIxhr8urHsC77n0olUOPZ/flJNeI3VGYpF0ygu1M1+wM/uOTg4w8PD5r
X-Received: by 2002:a17:906:c83b:: with SMTP id dd27mr1914465ejb.547.1624025478692;
        Fri, 18 Jun 2021 07:11:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624025478; cv=none;
        d=google.com; s=arc-20160816;
        b=rCLWid5xMLlFcu0VsIsllwzSGsyi8MaFeSviWTq5Vg1zO3SCPWBCcxEgiR6WfKoQIJ
         KSz5KNqoenGwrnRNI4cND7oacFnGwbKJA8baKOL9cWzmWZonl+FhfGo1vZBtvKaQDHp8
         LU4H18SYByl96BPXPWKwHN2OM0QHX65JxBXjaVv+i/JagC9YSZ2vfRzWl+Ywz6vc+z9f
         GsbY/3pD1EomBEkzi+fdahkontOx8KscS6wKj5GE2lmgMLEwFG3RFRFzdQGVyWJZP6ak
         OVat/zlWazzD3cXPTDR6ygVdqigwVNnNpeuk4CRIAuAld74qFlMRBhxZMn3i8vRGQyba
         pjWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=dRfZrUkzHx2HbQeo0FP4Jf8eMM4MIpIZDbO0Ga50h6Y=;
        b=adzx2Ac6foliZeLzETax825p4S9Dd3Y4MM5GgB+AQ0vC8SPAovk4wCdw3zVwFLQoEW
         asYlmVMIy+WPyrCkxqBVhuyygbXFs2n0u9D+UTkiS3q27U7kqGWo0jVRIQneAfVNqU1L
         q4EzUJFqcBuWrE9l9djvFpOrx8vGGys3hJzvXvx8azoqEwiY0BniXA2E/+Ey0DAyXi7N
         /uDHwPIepwmHyinbyTg+kY8K5U/Z16Fn6prgiTPK8bGm2S8B6MhlFt/u+a2CWeHFKW7v
         oHZzrLnmwCt3lDNSQESm1NvwlWIj57oIQIgIBxuYDHTXhU9AHnX6nckq+MI8EzWd9cts
         pMKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P2TzW2Za;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r9si2496318ejr.730.2021.06.18.07.11.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Jun 2021 07:11:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P2TzW2Za;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1luFDJ-0007Oj-Qz
	for alex.bennee@linaro.org; Fri, 18 Jun 2021 10:11:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1luFCX-0007OT-J3
 for qemu-arm@nongnu.org; Fri, 18 Jun 2021 10:10:29 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:36459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1luFCU-0001xU-0A
 for qemu-arm@nongnu.org; Fri, 18 Jun 2021 10:10:29 -0400
Received: by mail-wr1-x434.google.com with SMTP id n7so10955597wri.3
 for <qemu-arm@nongnu.org>; Fri, 18 Jun 2021 07:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=dRfZrUkzHx2HbQeo0FP4Jf8eMM4MIpIZDbO0Ga50h6Y=;
 b=P2TzW2ZaSkaDoxIiTnH2mrWozcCUa/cHSp9hXD+uDq+E5oBJxbdpBh8LIbZhvYLem/
 EGpoOhpF4kPtsAY7QZpIZFZWe1KBrFTmAoJVEBrMNGQLzrb30oDTCftnM7XfHxH1tOKw
 FgDH2un/6B3ewOXcgJEc7aiNtb5aL3rkY1wj08dVcQO49GB6P1Hop+85J/Wv21fpNkXj
 BbinOQjvUP5oLcmYM5jNiJz3UaVFi4Aotx5TSey7e2aHihk/5Gt1oGyHQgQHHsgjE8MV
 GkQkkiczgSDW63VbAmoigUzVgw/GpIseELAtD75GcITF6dNO05IOug7DfmcBPXIsE4By
 CpAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dRfZrUkzHx2HbQeo0FP4Jf8eMM4MIpIZDbO0Ga50h6Y=;
 b=O1L4PVf0wP0zKzGCJyvjmikrt+QVRPOShilN1CQdQ/HyqCmMltEqCwFrd8hn3Gk8N3
 PAbEa17oKnZu0AOoBoeurN5+9mUs3Jt/mYo4FSXFKFtVt+2nIumE0E2mocA+dLUtO3AX
 QMxFa0EH/wv6iTBxdEcKLNv7d1NK8XF1PKkXGA7ZeDSaZ6zqiDjI02HcCz6EIH5Tw1lJ
 +9IGIdjhKXCrZrR5rKN6LqDFdmw1LrmIa9lKvWN7hxRz4d5sGEISaQlJ5ZtgX6a2xRO/
 pEH4teYbf++/jjci54MyCp9hn7QaHe7U+psnK+jcqwPVHqLxq5OSLDO1dsdygiD/W44u
 uEpQ==
X-Gm-Message-State: AOAM531hlKquiqNvIafyuhPw/3wOrU9FkOxsPhk0vD/BnKdubIOcymPe
 Ck6gcXF58T/Y2BBrdh5RJPK+EC4Mw8YHeNZ2
X-Received: by 2002:adf:ef87:: with SMTP id d7mr12797263wro.24.1624025423083; 
 Fri, 18 Jun 2021 07:10:23 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j11sm7751661wmq.4.2021.06.18.07.10.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 07:10:22 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/7] target/arm: Handle FPU being disabled in FPCXT_NS accesses
Date: Fri, 18 Jun 2021 15:10:14 +0100
Message-Id: <20210618141019.10671-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210618141019.10671-1-peter.maydell@linaro.org>
References: <20210618141019.10671-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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
X-TUID: S0aG2dzZgF93

If the guest makes an FPCXT_NS access when the FPU is disabled,
one of two things happens:
 * if there is no active FP context, then the insn behaves the
   same way as if the FPU was enabled: writes ignored, reads
   same value as FPDSCR_NS
 * if there is an active FP context, then we take a NOCP
   exception

Add code to the sysreg read/write functions which emits
code to take the NOCP exception in the latter case.

At the moment this will never be used, because the NOCP checks in
m-nocp.decode happen first, and so the trans functions are never
called when the FPU is disabled.  The code will be needed when we
move the sysreg access insns to before the NOCP patterns in the
following commit.

Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
The "check for exception; then call gen_preserve_fp_state()"
is a little repetitive. We'll clean this up in a bit of
refactoring at the end of the patchseries, because the nicest
way to do it involves restructuring vfp_access_check().
---
 target/arm/translate-vfp.c | 32 ++++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate-vfp.c b/target/arm/translate-vfp.c
index 5a4a13ec1e1..107d6143be8 100644
--- a/target/arm/translate-vfp.c
+++ b/target/arm/translate-vfp.c
@@ -821,7 +821,21 @@ static bool gen_M_fp_sysreg_write(DisasContext *s, int regno,
         lab_end = gen_new_label();
         /* fpInactive case: write is a NOP, so branch to end */
         gen_branch_fpInactive(s, TCG_COND_NE, lab_end);
-        /* !fpInactive: PreserveFPState(), and reads same as FPCXT_S */
+        /*
+         * !fpInactive: if FPU disabled, take NOCP exception;
+         * otherwise PreserveFPState(), and then FPCXT_NS writes
+         * behave the same as FPCXT_S writes.
+         */
+        if (s->fp_excp_el) {
+            gen_exception_insn(s, s->pc_curr, EXCP_NOCP,
+                               syn_uncategorized(), s->fp_excp_el);
+            /*
+             * This was only a conditional exception, so override
+             * gen_exception_insn()'s default to DISAS_NORETURN
+             */
+            s->base.is_jmp = DISAS_NEXT;
+            break;
+        }
         gen_preserve_fp_state(s);
         /* fall through */
     case ARM_VFP_FPCXT_S:
@@ -961,7 +975,21 @@ static bool gen_M_fp_sysreg_read(DisasContext *s, int regno,
         tcg_gen_br(lab_end);
 
         gen_set_label(lab_active);
-        /* !fpInactive: Reads the same as FPCXT_S, but side effects differ */
+        /*
+         * !fpInactive: if FPU disabled, take NOCP exception;
+         * otherwise PreserveFPState(), and then FPCXT_NS
+         * reads the same as FPCXT_S.
+         */
+        if (s->fp_excp_el) {
+            gen_exception_insn(s, s->pc_curr, EXCP_NOCP,
+                               syn_uncategorized(), s->fp_excp_el);
+            /*
+             * This was only a conditional exception, so override
+             * gen_exception_insn()'s default to DISAS_NORETURN
+             */
+            s->base.is_jmp = DISAS_NEXT;
+            break;
+        }
         gen_preserve_fp_state(s);
         tmp = tcg_temp_new_i32();
         sfpa = tcg_temp_new_i32();
-- 
2.20.1

