Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D8F9F4BB7A
	for <qemu-arm@archiver.kernel.org>; Tue, 24 Feb 2026 19:33:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vuy8a-0002nI-LI; Tue, 24 Feb 2026 14:32:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vuy7j-0001w8-Av
 for qemu-arm@nongnu.org; Tue, 24 Feb 2026 14:31:12 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vuy7g-0000qL-TZ
 for qemu-arm@nongnu.org; Tue, 24 Feb 2026 14:31:10 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-48336a6e932so36478415e9.3
 for <qemu-arm@nongnu.org>; Tue, 24 Feb 2026 11:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771961467; x=1772566267; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rPnvzN0vdBAhi5qvrlwZOx/MNlbXvoochlMrzgm+Op8=;
 b=Raq/A5Xqg+7X6sdX/5Vk85NJaRKMrGKkhcXtF19IGQNMhFcGUuC990cPA0mQIAm//8
 fWGlQmlVuXFwq1F6E2zB8f+gdLzmcEN2PyMVYR+5xh68m009QmijPv7wjfZSWPwL11M6
 322GQuqHkRtM+1torFb8S2SShiISSG3hkywJ3/fppFYkxHJP0aFnCxCPe1IMJtR5Gcz2
 sI8YVHbSjVDJyt4BBN/z1m5t8Va7cfbUPUWpgrVthH1ElJZH7/o093U7X/N9Xv4DWh0K
 6zJRVmMr3HBmuAgosXoP3phA6XxQk3eZnyXNVKZqx0/n5iRUG8iU8S8HKg29iFGQ3orJ
 8cMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771961467; x=1772566267;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rPnvzN0vdBAhi5qvrlwZOx/MNlbXvoochlMrzgm+Op8=;
 b=iDpQ1tafkvnyFZhzg5si3c+s6iG2mjX8GyX+PHClpn6gww/IFqfiQL0pkB6IAEXKUF
 yCKJzTbIffK/0i04jzcphNsIUHrhSfBYDQ3z/ncx827p9t4cAda7Tz3t4hTF/P+jTjNY
 5xy187ZmygveDwuhjOzBbbv8P/rVxYRjzn6/pZuugakPB3bJBeyVIP5jdEpXnxMBL0zH
 hq1vSmHGiCxea7sKO9b4YtA7RQ4oplrXKQPe6HGFKKZOd+RFaFnespiQKN1csv15ePhk
 E+nweDsYi/BtVc+LUnvmIPX87xWqiqtWp9qpfrABBjzncCL7ZNbewayyqZfXucYOpnkM
 n5lQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFJqVKHXeoimUndoz5TAueT5C3q83acx1ScWNLIc/O+hf+hSFEhfC9a1YUK7yhPt+s5/QAnciEYg==@nongnu.org
X-Gm-Message-State: AOJu0YwcFSHK9ij9+lCE0Hr5s0kw2wtTyTeQWO8kXb/og0CD8wZZSgVL
 ouQ1o85GLrwPJryJ7vG3fifiMIRZp4lpb3xTmOAT1OZtGJqLEZIs9iXY9uelmmCRh68=
X-Gm-Gg: AZuq6aLaBxM0AXjdYO/hsRGJ4+2vgiLBXdDeAfRDopUxQAJtjX5d93ly/7EhhBGdjwR
 TN3eI0pJGQEMyuhWV0l1vMBf8Oqr7V0UhmfXFJZKet02bUmcdyxNRFlH/q69HjzQZ38+8ygobpk
 uNBEkL0++98ozOlQeBGkIO9gIkmgETm2mOgPWykfYvJ8fDLQ23u9+UB5b1O6HK6HZteY7g5NL9E
 xX+d+sJm6+lwAI6joHqqzScMeyMXrr6hl4kgbIxjrWRrxhalaTq4eeL7+BqK2ayTe3o0BxL9yF0
 M4KKiV5X58bOdCBqkI5gfgTQQ+k+TqKreon8QsrRhPBb/qfi+jUvTGIMIgs6ReIQW7/YIS+pBAv
 DMO0K7lfckNXYZ6dxMCQMZkbE3lgwJQRBcX4qdGLQk8Eqdo++hr6aSgFQ7UTmLX3MvXgzOCuIZR
 goZUtGNxu5wbb8Avi1Rj9p0BYzhz1OvA0ZsvO+uNAyM581G7JrV8+9pZ4bYyrWPvU3G2dTU8DA
X-Received: by 2002:a05:600c:3516:b0:477:9b4a:a82 with SMTP id
 5b1f17b1804b1-483a963df3cmr283923845e9.35.1771961467457; 
 Tue, 24 Feb 2026 11:31:07 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4398a09aad0sm4527773f8f.2.2026.02.24.11.31.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 24 Feb 2026 11:31:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [RFC PATCH 5/5] target/tcg: Rename set_rounding_mode() helpers
Date: Tue, 24 Feb 2026 20:30:27 +0100
Message-ID: <20260224193028.2370-6-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260224193028.2370-1-philmd@linaro.org>
References: <20260224193028.2370-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

In order to avoid symbol name clash when building
a single binary, rename TCG helpers prefixing with
the target name.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/loongarch/tcg/helper.h                    | 2 +-
 target/riscv/helper.h                            | 2 +-
 target/loongarch/tcg/fpu_helper.c                | 2 +-
 target/riscv/fpu_helper.c                        | 2 +-
 target/riscv/translate.c                         | 2 +-
 target/loongarch/tcg/insn_trans/trans_fmov.c.inc | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/loongarch/tcg/helper.h b/target/loongarch/tcg/helper.h
index 35b055eb3bc..154e70c0191 100644
--- a/target/loongarch/tcg/helper.h
+++ b/target/loongarch/tcg/helper.h
@@ -91,7 +91,7 @@ DEF_HELPER_2(ftint_w_d, i64, env, i64)
 DEF_HELPER_2(frint_s, i64, env, i64)
 DEF_HELPER_2(frint_d, i64, env, i64)
 
-DEF_HELPER_FLAGS_1(set_rounding_mode, TCG_CALL_NO_RWG, void, env)
+DEF_HELPER_FLAGS_1(loongarch_set_rounding_mode, TCG_CALL_NO_RWG, void, env)
 
 DEF_HELPER_1(rdtime_d, i64, env)
 
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index b785456ee08..90c8e7eb31f 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -2,7 +2,7 @@
 DEF_HELPER_2(raise_exception, noreturn, env, i32)
 
 /* Floating Point - rounding mode */
-DEF_HELPER_FLAGS_2(set_rounding_mode, TCG_CALL_NO_WG, void, env, i32)
+DEF_HELPER_FLAGS_2(riscv_set_rounding_mode, TCG_CALL_NO_WG, void, env, i32)
 DEF_HELPER_FLAGS_2(set_rounding_mode_chkfrm, TCG_CALL_NO_WG, void, env, i32)
 
 /* Floating Point - fused */
diff --git a/target/loongarch/tcg/fpu_helper.c b/target/loongarch/tcg/fpu_helper.c
index fc9c64c20a8..265f608cddd 100644
--- a/target/loongarch/tcg/fpu_helper.c
+++ b/target/loongarch/tcg/fpu_helper.c
@@ -878,7 +878,7 @@ uint64_t helper_ftint_w_d(CPULoongArchState *env, uint64_t fj)
     return fd;
 }
 
-void helper_set_rounding_mode(CPULoongArchState *env)
+void helper_loongarch_set_rounding_mode(CPULoongArchState *env)
 {
     set_float_rounding_mode(ieee_rm[(env->fcsr0 >> FCSR0_RM) & 0x3],
                             &env->fp_status);
diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
index af40561b318..aa343ce264d 100644
--- a/target/riscv/fpu_helper.c
+++ b/target/riscv/fpu_helper.c
@@ -50,7 +50,7 @@ void riscv_cpu_set_fflags(CPURISCVState *env, target_ulong hard)
     set_float_exception_flags(soft, &env->fp_status);
 }
 
-void helper_set_rounding_mode(CPURISCVState *env, uint32_t rm)
+void helper_riscv_set_rounding_mode(CPURISCVState *env, uint32_t rm)
 {
     int softrm;
 
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index cb4f4436018..6d0f316ef1e 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -757,7 +757,7 @@ static void gen_set_rm(DisasContext *ctx, int rm)
 
     /* The helper may raise ILLEGAL_INSN -- record binv for unwind. */
     decode_save_opc(ctx, 0);
-    gen_helper_set_rounding_mode(tcg_env, tcg_constant_i32(rm));
+    gen_helper_riscv_set_rounding_mode(tcg_env, tcg_constant_i32(rm));
 }
 
 static void gen_set_rm_chkfrm(DisasContext *ctx, int rm)
diff --git a/target/loongarch/tcg/insn_trans/trans_fmov.c.inc b/target/loongarch/tcg/insn_trans/trans_fmov.c.inc
index 5cbd9d3f347..c4c4c2000f7 100644
--- a/target/loongarch/tcg/insn_trans/trans_fmov.c.inc
+++ b/target/loongarch/tcg/insn_trans/trans_fmov.c.inc
@@ -112,7 +112,7 @@ static bool trans_movgr2fcsr(DisasContext *ctx, arg_movgr2fcsr *a)
      * Note that FCSR3 is exactly the rounding mode field.
      */
     if (mask & FCSR0_M3) {
-        gen_helper_set_rounding_mode(tcg_env);
+        gen_helper_loongarch_set_rounding_mode(tcg_env);
     }
     return true;
 }
-- 
2.52.0


