Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDBACCA0EE4
	for <qemu-arm@archiver.kernel.org>; Thu, 14 Aug 2025 13:13:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1umXeG-0003se-0n; Thu, 14 Aug 2025 09:05:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXd0-0002O2-If
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 09:04:23 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXcx-0005C6-AK
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 09:04:22 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-76e2e8e2d2dso549449b3a.1
 for <qemu-arm@nongnu.org>; Thu, 14 Aug 2025 06:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755176653; x=1755781453; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NHjAyHFO49Xnsrf4XYBbOWKhIj7dGvot2d9bfnaFFuQ=;
 b=xSFtLu1fYuvWJtGQTx6g51ffCylKokfKa+akYiBujK70ISy5vYowH5w7y87mw0It1K
 zyAimLWb20a+Zqh+tiMta3dQjpR939wfngBOOuakBmBfzJu4fDweivjpDShKIZ/yi54e
 yXMECYOCeq+nt6/jJZ0C89SyDpaXDWhz9wra4UpV4NY/LCh5QtJ/7mwxg+9uPMfIANId
 L8f875R1XItjqIlc02EP1CMBpl6/b3edp2kgRQSNUO5yKNKR4CuQ5nIDvGo8t+AxJttT
 IMA7AsDdaZ1mjzZhMbp9BeoyR2MOsNoJgocmjyg61ucya11o7yaY9bEFFiAnl8wCfu3B
 gkEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755176653; x=1755781453;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NHjAyHFO49Xnsrf4XYBbOWKhIj7dGvot2d9bfnaFFuQ=;
 b=e8K+frNzqihtILnUoJOMlRmdfbPWROGn8zNfKfxfLMrZierT1+7XbJrUX2eWx226lN
 yw7/YGgczXuwUnVfaPSVx9R9zuJoANyE5kVPAp3oGSHFjKhAM0WI5Rbw1W8S6XAXY6gh
 boGVYn48ang6QZ154t9MCX4wU0RAJc4yI4JG8Unw8Ap488weurplET8ODmoV9La3692c
 HSHOkoLQ7arrr5kZOdCcgMYczyvb4QKzb/I6iIopvWSk97MztX+6vFbbN5S9ya2JE9pw
 tKroOMhLHAO1RnBw4mc7gIAOm98q7PeZVsejXN2ZVDG1IpUIR+0fIUSgQ30BrOkEWUr9
 WGNA==
X-Gm-Message-State: AOJu0YwzoF4YIjO1c554Q4kCTgHJVmZnUahHOBPyH5nVwXAfF0MOVAsv
 pZ3yXd59QMUZmVgY/dSivvA+1ORrzYz9NAt9JGjR0TvIE6rSFqHi8eqXjM8N267TnA0m0xDc2mO
 4P0tNrS8=
X-Gm-Gg: ASbGncsj7Du2I6VGIZleBlfMRW1FVYWJpDKIB1UjI7udDWwyVEWKN4WRxYuP/vprHUP
 u68Ovm/M4CcPvdzG+la4xLsElF47s5Z9t7saS0aXYTggTb0JaJskurpFNP2Q+KMK7brAPIGk5i8
 XDq4Sa9iB4uTDnwFuCfHLor3gFjD0aR41XaWkVA4Iq3DHfiHEYvEjcYbEqMZMCW8275zLm1yThh
 7dnRdIh/Ls6HKYNRsZD2K0NKeqjhxDPqds+zK/5qvKl9B9uxfImUpMIyOij+wV4+ioLF6DjEZPF
 l6ziMGnPxkfVJ4UoLIbPGiSZ2FAp6uKsLFT712pnyFzHUoFevrnB/6HSOobIyWOkU+v2L2uQxqj
 vSkPk4uBh+hyJyQtPpHSg0CFN0gP6u6q0S7bTfxJEWav9r7k=
X-Google-Smtp-Source: AGHT+IEvfvwkn3SJsnKBE8qpJUlA0Chrb3qugGLDUvIlAaAfKfoCZICZxRPH/UFwIPHFp3W0xhAWug==
X-Received: by 2002:a05:6a00:23c4:b0:76b:ec81:bcc9 with SMTP id
 d2e1a72fcca58-76e2fb2f79emr4054458b3a.21.1755176653245; 
 Thu, 14 Aug 2025 06:04:13 -0700 (PDT)
Received: from localhost.localdomain ([206.83.105.236])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bcce6f6fesm34480631b3a.26.2025.08.14.06.04.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 06:04:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 57/85] target/arm: Implement GCSSTR, GCSSTTR
Date: Thu, 14 Aug 2025 22:57:24 +1000
Message-ID: <20250814125752.164107-58-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250814125752.164107-1-richard.henderson@linaro.org>
References: <20250814125752.164107-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Note that CreateAccDescGCS() does not enable tagchecked,
and Data Aborts from GCS instructions do not set iss.isv.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 42 ++++++++++++++++++++++++++++++++++
 target/arm/tcg/a64.decode      |  3 +++
 2 files changed, 45 insertions(+)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index d803c10ac7..e0548f7180 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -139,6 +139,12 @@ static int core_user_mem_index(DisasContext *s, bool unpriv)
     return arm_to_core_mmu_idx(arm_user_mem_index(s, unpriv));
 }
 
+/* For a given translation regime, return the core mmu_idx for gcs access. */
+static int core_gcs_mem_index(ARMMMUIdx armidx)
+{
+    return arm_to_core_mmu_idx(regime_to_gcs(armidx));
+}
+
 static void set_btype_raw(int val)
 {
     tcg_gen_st_i32(tcg_constant_i32(val), tcg_env,
@@ -3902,6 +3908,42 @@ static bool trans_STLR_i(DisasContext *s, arg_ldapr_stlr_i *a)
     return true;
 }
 
+static bool trans_GCSSTR(DisasContext *s, arg_GCSSTR *a)
+{
+    ARMMMUIdx armidx;
+
+    if (!dc_isar_feature(aa64_gcs, s)) {
+        return false;
+    }
+
+    /*
+     * The pseudocode for GCSSTTR is
+     *
+     *   effective_el = AArch64.IsUnprivAccessPriv() ? PSTATE.EL : EL0;
+     *   if (effective_el == PSTATE.EL) CheckGCSSTREnabled();
+     *
+     * We have cached the result of IsUnprivAccessPriv in DisasContext,
+     * but since we need the result of arm_user_mem_index anyway, use
+     * the mmu_idx test as a proxy for the effective_el test.
+     */
+    armidx = arm_user_mem_index(s, a->unpriv);
+    if (armidx == s->mmu_idx && s->gcsstr_el != 0) {
+        gen_exception_insn_el(s, 0, EXCP_UDEF,
+                              syn_gcs_gcsstr(a->rn, a->rt),
+                              s->gcsstr_el);
+        return true;
+    }
+
+    if (a->rn == 31) {
+        gen_check_sp_alignment(s);
+    }
+    tcg_gen_qemu_st_i64(cpu_reg(s, a->rt),
+                        clean_data_tbi(s, cpu_reg_sp(s, a->rn)),
+                        core_gcs_mem_index(armidx),
+                        finalize_memop(s, MO_64 | MO_ALIGN));
+    return true;
+}
+
 static bool trans_LD_mult(DisasContext *s, arg_ldst_mult *a)
 {
     TCGv_i64 clean_addr, tcg_rn, tcg_ebytes;
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 4315ed8dab..d034d96b37 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -554,6 +554,9 @@ LDAPR_i         10 011001 10 0 ......... 00 ..... ..... @ldapr_stlr_i sign=1 ext
 LDAPR_i         00 011001 11 0 ......... 00 ..... ..... @ldapr_stlr_i sign=1 ext=1 sz=0
 LDAPR_i         01 011001 11 0 ......... 00 ..... ..... @ldapr_stlr_i sign=1 ext=1 sz=1
 
+# GCSSTR, GCSSTTR
+GCSSTR          11011001 000 11111 000 unpriv:1 11 rn:5 rt:5
+
 # Load/store multiple structures
 # The 4-bit opcode in [15:12] encodes repeat count and structure elements
 &ldst_mult      rm rn rt sz q p rpt selem
-- 
2.43.0


