Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp1684637wrs;
        Wed, 13 Mar 2019 06:58:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxMr2CncK9naN44/MxWLaYXeCdE9tOdqe9+JfoTpSp49GEUpOP9aieDKMDN9sZrtQ3+Eixa
X-Received: by 2002:a5b:bc6:: with SMTP id c6mr7988280ybr.204.1552485484847;
        Wed, 13 Mar 2019 06:58:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552485484; cv=none;
        d=google.com; s=arc-20160816;
        b=VzABm5eVwjWT2Rq6FCvYilCfUiBUqsD+2Q+o3N5I+YNGNaG9fhewfn/mp1qq8ByiYc
         WKVPVaUoKJdIla1Xdzp2XnxDACaS7QCjSlsMLzVWQzJ+mhD0wTdJH3XrZ6teCN2xJ8df
         CX+tGMFDkBy2a4e1Bbxc4BVZkfPb5ZZsIA/pr6bzrp86cqFiBK8xIJ+oN4Lbm4xXGgac
         zWZDR6MQ2OVeZJC/3UAwN4iRRqll4pPCwuLEUd2aOCG7SLnYaatbU89KdAqpHtvjno61
         /ji1g1BYaua2IOv4RjxUT3lYZT9napdVzMupd1jgq9DoIb/q0qrVpGEC3d6Wm1X/M5l4
         bzRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from;
        bh=/Tq/V/8qRGDI3s0xFJ2+s2b6EgkLBswv+uHQbdPTMec=;
        b=qpZ/Ih0vN0j4QsD2hFnA95AMxjCecitggeMCXPyP3+vhS/seYMZvHuRa9VVVfisyC0
         TBQ3GGLNk6JM4wHtq6nNMvDjnQFTKV4cOuhbM1RS2jyZwkr/m+C8hNXMOC75rEsR+Drw
         cZjylGfBZLTauxmeRLDHXTZ6WHzEuo4Z2PGAwurnb0TnDc+yUoBHhh8kTSTn+vtIzLV2
         phsLLoklqjkiuFTaUVPgpChTZMavQHUXjzjO7iqlVxGX1I6VCQc8owjd2nhE2mQBoc3G
         4vPPUsa9gI3HaNzrPQzFN80HolxxIaq3gOHwRiPNqoNzsLCV4KSp/ZYR1YeiQaq1HQDg
         ciwA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 9si6726046yby.37.2019.03.13.06.58.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Mar 2019 06:58:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:45127 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h44OS-0003Gp-Ae
	for alex.bennee@linaro.org; Wed, 13 Mar 2019 09:58:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43116)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <amir.charif@cea.fr>) id 1h43we-0004yF-Bv
	for qemu-arm@nongnu.org; Wed, 13 Mar 2019 09:29:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <amir.charif@cea.fr>) id 1h43rR-0000q2-Qq
	for qemu-arm@nongnu.org; Wed, 13 Mar 2019 09:23:58 -0400
Received: from cirse-smtp-out.extra.cea.fr ([132.167.192.148]:43540)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <amir.charif@cea.fr>)
	id 1h43rQ-0000ef-JG; Wed, 13 Mar 2019 09:23:56 -0400
Received: from pisaure.intra.cea.fr (pisaure.intra.cea.fr [132.166.88.21])
	by cirse-sys.extra.cea.fr (8.14.7/8.14.7/CEAnet-Internet-out-4.0) with
	ESMTP id x2DDNm7k035939; Wed, 13 Mar 2019 14:23:48 +0100
Received: from localhost.localdomain (localhost [127.0.0.1])
	by localhost (Postfix) with ESMTP id BFD5820467F;
	Wed, 13 Mar 2019 14:23:48 +0100 (CET)
Received: from pisaure by pisaure with queue id 6965587-2;
	Wed, 13 Mar 2019 13:23:48 GMT
Received: from muguet2-smtp-out.intra.cea.fr (muguet2-smtp-out.intra.cea.fr
	[132.166.192.13])
	by pisaure.intra.cea.fr (Postfix) with ESMTP id 8C275204480;
	Wed, 13 Mar 2019 14:23:48 +0100 (CET)
Received: from amir-VirtualBox.intra.cea.fr (is233176-dock.intra.cea.fr
	[10.8.35.126])
	by muguet2-sys.intra.cea.fr (8.14.7/8.14.7/CEAnet-Internet-out-4.0)
	with ESMTP id x2DDNmpL007320; Wed, 13 Mar 2019 14:23:48 +0100
From: Amir Charif <amir.charif@cea.fr>
To: qemu-devel@nongnu.org
Date: Wed, 13 Mar 2019 14:23:46 +0100
Message-Id: <1552483426-3128-1-git-send-email-amir.charif@cea.fr>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 132.167.192.148
X-Mailman-Approved-At: Wed, 13 Mar 2019 09:57:53 -0400
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
X-TUID: aN4IArDQn4uP

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

