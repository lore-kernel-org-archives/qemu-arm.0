Received: by 2002:a5d:4d11:0:0:0:0:0 with SMTP id z17csp2193833wrt;
        Mon, 18 Mar 2019 03:25:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwngRjANIKrkfIu/GzazgMrg1SSqG+J/8JtefPUw7wf6D7OYd4dwghIIIHjMC+4FUy5PApU
X-Received: by 2002:a5d:410a:: with SMTP id l10mr12135974wrp.182.1552904709332;
        Mon, 18 Mar 2019 03:25:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552904709; cv=none;
        d=google.com; s=arc-20160816;
        b=Y2/CkQtHeWkKW0QBQSwPng3nUkz4eaD8EQsNqQU+jSU7QpPH9g4nv9S/qTN/eIbJK3
         3oNnNO2IVAk3cIxva9fpcB8z6SGWu6AlyXLlU5KYnZdhXIaR1cTUAe2gipRYGel7rjs/
         9OG47fltfxUuWDmyZl6NEtnfyvSPWnUBCBWMLUBKCU8TwN7gO11eVhPEx8Huyj4xfmEY
         R2zHW2ZfNDfGbkDp8Lm3+hnH2xjTt1n/DWKfwGpFJrnaPUgsW4E7r6XNps267MeXONXu
         vSXQmuBsswhZ0WYgCVJU4Ny42pZ+pb4Hl/7vfD4a/7g75D6Bjn7U2JGPmeb6g4aV+RnW
         aqmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from;
        bh=/Tq/V/8qRGDI3s0xFJ2+s2b6EgkLBswv+uHQbdPTMec=;
        b=QZs4ngVlv3DCvSNmRedsdBEgvo0F3QsEWddp9p2u/mhsbt0onptCWQ3+CLiTaiqsWj
         OPUsa8dMdb+UER5R3vFwquNgPzecEgtFTkb9mO9hY+F3CV+FU6UwkO3kgY1YPCBXWbZf
         I0KNvDEEEcVoXNpi0l44EuVmzHoWXhqvT7o722XfBhXBJMFmUrrJhi3J7QVqhevq1AHC
         qnwqlkmlQzMvqrHl9+VNbbK9aYGLXs8z23s22vMd6yGKyr983Mh3I+eV3FTLZp8Lxzja
         jTsciADYkl0Z7Ema36VtiwZc2wlpSx60+Y+P8vcoOV5wCzADmWLUOIO6jcu1Vlpw7ynP
         hpPg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w15si6294559wrs.174.2019.03.18.03.25.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Mar 2019 03:25:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:39034 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h5pS8-00006D-DO
	for alex.bennee@linaro.org; Mon, 18 Mar 2019 06:25:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52051)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <amir@amir-VirtualBox>) id 1h5pRo-0008S9-5N
	for qemu-arm@nongnu.org; Mon, 18 Mar 2019 06:24:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <amir@amir-VirtualBox>) id 1h5pNT-0003zD-TV
	for qemu-arm@nongnu.org; Mon, 18 Mar 2019 06:20:20 -0400
Received: from [80.12.27.243] (port=32780 helo=amir-VirtualBox)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <amir@amir-VirtualBox>)
	id 1h5pNT-0003wl-1l; Mon, 18 Mar 2019 06:20:19 -0400
Received: from amir-VirtualBox (localhost [127.0.0.1])
	by amir-VirtualBox (8.15.2/8.15.2/Debian-3) with ESMTP id
	x2DCPnPX002202; Wed, 13 Mar 2019 13:25:49 +0100
Received: (from amir@localhost)
	by amir-VirtualBox (8.15.2/8.15.2/Submit) id x2DCPnJe002197;
	Wed, 13 Mar 2019 13:25:49 +0100
From: Amir Charif <amir.charif@cea.fr>
To: qemu-devel@nongnu.org
Date: Wed, 13 Mar 2019 13:24:46 +0100
Message-Id: <1552479886-2154-1-git-send-email-amir.charif@cea.fr>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 80.12.27.243
Subject: [Qemu-arm] [PATCH] Re-evaluate SVE vector length everytime
 ADDVL/RDVL is called
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Amir Charif <amir.charif@cea.fr>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jEy5iE6rjKwW

In system emulation mode, the kernel may internally use 16-byte vectors.
If this size is saved in the DisasContext before entering a userspace app
that uses higher SVE sizes, the wrong size may be allocated on the stack
resulting in corruption (segfaults in user space).
This fix evaluates the vector size at runtime (as opposed to translation time)
to always allocate the correct size on the stack (when ADDVL is used).

Signed-off-by: Amir Charif <amir.charif@cea.fr>
---
 target/arm/translate-a64.c | 17 +++++++++++++++++
 target/arm/translate-a64.h |  1 +
 target/arm/translate-sve.c |  7 +++++--
 3 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 1959046..ef3db4a 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -45,6 +45,9 @@ static TCGv_i64 cpu_pc;
 /* Load/store exclusive handling */
 static TCGv_i64 cpu_exclusive_high;
 
+/* Current value of the zcr_el[1] register */
+static TCGv_i64 cpu_zcr_el1;
+
 static const char *regnames[] = {
     "x0", "x1", "x2", "x3", "x4", "x5", "x6", "x7",
     "x8", "x9", "x10", "x11", "x12", "x13", "x14", "x15",
@@ -103,6 +106,9 @@ void a64_translate_init(void)
 
     cpu_exclusive_high = tcg_global_mem_new_i64(cpu_env,
         offsetof(CPUARMState, exclusive_high), "exclusive_high");
+        
+    cpu_zcr_el1 = tcg_global_mem_new_i64(cpu_env,
+        offsetof(CPUARMState, vfp.zcr_el[1]), "zcr_el1");
 }
 
 static inline int get_a64_user_mem_index(DisasContext *s)
@@ -578,6 +584,17 @@ TCGv_i64 read_cpu_reg_sp(DisasContext *s, int reg, int sf)
     return v;
 }
 
+/* Get a temporary register containing the current vector length
+ */
+TCGv_i64 get_cpu_vec_len(DisasContext *s) {
+    TCGv_i64 v = new_tmp_a64(s);
+    tcg_gen_mov_i64(v, cpu_zcr_el1);
+    tcg_gen_andi_i64(v, v, 0xf);
+    tcg_gen_addi_i64(v, v, 1);
+    tcg_gen_muli_i64(v, v, 16);
+    return v;
+}
+
 /* Return the offset into CPUARMState of a slice (from
  * the least significant end) of FP register Qn (ie
  * Dn, Sn, Hn or Bn).
diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
index 63d958c..fcfbc90 100644
--- a/target/arm/translate-a64.h
+++ b/target/arm/translate-a64.h
@@ -35,6 +35,7 @@ TCGv_i64 cpu_reg(DisasContext *s, int reg);
 TCGv_i64 cpu_reg_sp(DisasContext *s, int reg);
 TCGv_i64 read_cpu_reg(DisasContext *s, int reg, int sf);
 TCGv_i64 read_cpu_reg_sp(DisasContext *s, int reg, int sf);
+TCGv_i64 get_cpu_vec_len(DisasContext *s);
 void write_fp_dreg(DisasContext *s, int reg, TCGv_i64 v);
 TCGv_ptr get_fpstatus_ptr(bool);
 bool logic_imm_decode_wmask(uint64_t *result, unsigned int immn,
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 3a2eb51..d5ad88b 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -945,7 +945,9 @@ static bool trans_ADDVL(DisasContext *s, arg_ADDVL *a)
 {
     TCGv_i64 rd = cpu_reg_sp(s, a->rd);
     TCGv_i64 rn = cpu_reg_sp(s, a->rn);
-    tcg_gen_addi_i64(rd, rn, a->imm * vec_full_reg_size(s));
+    TCGv_i64 ln = get_cpu_vec_len(s);
+    tcg_gen_muli_i64(ln, ln, a->imm);
+    tcg_gen_add_i64(rd, rn, ln);
     return true;
 }
 
@@ -960,7 +962,8 @@ static bool trans_ADDPL(DisasContext *s, arg_ADDPL *a)
 static bool trans_RDVL(DisasContext *s, arg_RDVL *a)
 {
     TCGv_i64 reg = cpu_reg(s, a->rd);
-    tcg_gen_movi_i64(reg, a->imm * vec_full_reg_size(s));
+    TCGv_i64 ln = get_cpu_vec_len(s);
+    tcg_gen_muli_i64(reg, ln, a->imm);
     return true;
 }
 
-- 
2.7.4

