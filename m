Received: by 10.25.159.19 with SMTP id i19csp1754401lfe;
        Sun, 17 Jan 2016 23:14:56 -0800 (PST)
X-Received: by 10.55.74.86 with SMTP id x83mr29015528qka.89.1453101295997;
        Sun, 17 Jan 2016 23:14:55 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a123si29573467qha.3.2016.01.17.23.14.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 17 Jan 2016 23:14:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57994 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aL41f-0006ej-Dc
	for alex.bennee@linaro.org; Mon, 18 Jan 2016 02:14:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42539)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aL3zt-0003EE-Qa
	for qemu-arm@nongnu.org; Mon, 18 Jan 2016 02:13:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aL3zs-00075F-DI
	for qemu-arm@nongnu.org; Mon, 18 Jan 2016 02:13:05 -0500
Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230]:34571)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aL3zo-00073Y-32; Mon, 18 Jan 2016 02:13:00 -0500
Received: by mail-pa0-x230.google.com with SMTP id uo6so415135057pac.1;
	Sun, 17 Jan 2016 23:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=n+5Pq5V4LjTbUSIjcuKVjd9qSS1v8B1f0Nj/mL8lIwk=;
	b=aGBHc2sw5HS6NGtvT/k3dz0krCEwsQKexgDI6dvErjRD/GGptplia7lw/zTII8SvMM
	NGbnU188kh8BXVnLzF56wcGUH9e1U4UdD2hGQibmUGQ2OhLw0+e4Yy1+D6Od2ZgQTDg6
	gURUJvnLpibgtWqOcCiN6S09BNqrqmyH35Jx/Zgr3wptKAplketyGPAQfdFYCQt0zOEo
	joLfVleHpajMUc1GDzjsT+xlskqXfEraWUdKF4+gJa1fkoA5cYzRkD1kLMlAnsT/12kf
	SvZuOqJNmfFwJ2K3XILyVbdx9/u/wdlPwsg9crzb4uulkZKlAOaiHYISI9MeoFncl0h1
	XrZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=n+5Pq5V4LjTbUSIjcuKVjd9qSS1v8B1f0Nj/mL8lIwk=;
	b=RiCs2QARtQyO/af6OtPrvTq2VE4W4bnA7fNYpoep5HxCtIJBV7Ow8gJFg/SM1Y9rsk
	yePZgRgsFkkHr1cASUCDGGk6jj71oQcIvSnGSIClMlixtz4KS+jDUPqROmUfxT0xogbr
	+d7Arl3KgyIUlz9tCGlJFjXYo2Rh97kRh8ukM+RYWaqw4H2YtAVwAvvOwq73MeplKXtI
	CGc0SQ9GxsZ0bDcsMxxWmvum2XVi9WZTmBj0XWUxGPhmcqzp4TB8AsfbXikEX5/lQ7yu
	IpVEOYAXLfNsFLsCEvcI69EX7yBSXSZ7oTGUXBJ2JDoKtTT2/TXFnB1NgZ6va23Uh6aJ
	gAlQ==
X-Gm-Message-State: ALoCoQlLL4NgUvfOwYHG4wRTWRIldh78CNMrPqSl64ObMwhDX3XJEY/uN6WidYZtG7vLOZuTI0Fq+3xlfryQkGt+ZCtS4L5hqA==
X-Received: by 10.66.120.200 with SMTP id le8mr34361179pab.61.1453101179627;
	Sun, 17 Jan 2016 23:12:59 -0800 (PST)
Received: from localhost.localdomain (c-73-70-184-119.hsd1.ca.comcast.net.
	[73.70.184.119]) by smtp.gmail.com with ESMTPSA id
	xv2sm31471880pab.10.2016.01.17.23.12.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 23:12:58 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun, 17 Jan 2016 23:12:33 -0800
Message-Id: <293febec25123074218aa1016d208397873be90e.1453100525.git.crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1453100525.git.crosthwaite.peter@gmail.com>
References: <cover.1453100525.git.crosthwaite.peter@gmail.com>
In-Reply-To: <cover.1453100525.git.crosthwaite.peter@gmail.com>
References: <cover.1453100525.git.crosthwaite.peter@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::230
Cc: peter.maydell@linaro.org, Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	alistair.francis@xilinx.com, sridhar_kulk@yahoo.com,
	qemu-arm@nongnu.org, pbonzini@redhat.com, piotr.krol@3mdeb.com
Subject: [Qemu-arm] [PATCH v1 06/17] target-arm: introduce disas flag for
	endianness
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: MN7xD0RLBDNM

From: Paolo Bonzini <pbonzini@redhat.com>

Introduce a disas flag for setting the CPU data endianness. This allows
control of the endianness from the CPU state rather than hard-coding it
to TARGET_WORDS_BIGENDIAN.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
[ PC changes:
  * Split off as new patch from original:
        "target-arm: introduce tbflag for CPSR.E"
  * Wrote commit message from scratch
]
Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
---

 target-arm/translate-a64.c |  1 +
 target-arm/translate.c     | 39 ++++++++++++++++++++++++---------------
 target-arm/translate.h     |  1 +
 3 files changed, 26 insertions(+), 15 deletions(-)

diff --git a/target-arm/translate-a64.c b/target-arm/translate-a64.c
index 14e8131..d826b92 100644
--- a/target-arm/translate-a64.c
+++ b/target-arm/translate-a64.c
@@ -11033,6 +11033,7 @@ void gen_intermediate_code_a64(ARMCPU *cpu, TranslationBlock *tb)
                                !arm_el_is_aa64(env, 3);
     dc->thumb = 0;
     dc->bswap_code = 0;
+    dc->mo_endianness = MO_TE;
     dc->condexec_mask = 0;
     dc->condexec_cond = 0;
     dc->mmu_idx = ARM_TBFLAG_MMUIDX(tb->flags);
diff --git a/target-arm/translate.c b/target-arm/translate.c
index 55ecca5..e1679d3 100644
--- a/target-arm/translate.c
+++ b/target-arm/translate.c
@@ -927,26 +927,30 @@ static inline void store_reg_from_load(DisasContext *s, int reg, TCGv_i32 var)
 static inline void gen_aa32_ld##SUFF(DisasContext *s, TCGv_i32 val,      \
                                      TCGv_i32 addr, int index)           \
 {                                                                        \
-    tcg_gen_qemu_ld_i32(val, addr, index, (OPC));                        \
+    TCGMemOp opc = (OPC) | s->mo_endianness;                             \
+    tcg_gen_qemu_ld_i32(val, addr, index, opc);                          \
 }
 
 #define DO_GEN_ST(SUFF, OPC)                                             \
 static inline void gen_aa32_st##SUFF(DisasContext *s, TCGv_i32 val,      \
                                      TCGv_i32 addr, int index)           \
 {                                                                        \
-    tcg_gen_qemu_st_i32(val, addr, index, (OPC));                        \
+    TCGMemOp opc = (OPC) | s->mo_endianness;                             \
+    tcg_gen_qemu_st_i32(val, addr, index, opc);                          \
 }
 
 static inline void gen_aa32_ld64(DisasContext *s, TCGv_i64 val,
                                  TCGv_i32 addr, int index)
 {
-    tcg_gen_qemu_ld_i64(val, addr, index, MO_TEQ);
+    TCGMemOp opc = MO_Q | s->mo_endianness;
+    tcg_gen_qemu_ld_i64(val, addr, index, opc);
 }
 
 static inline void gen_aa32_st64(DisasContext *s, TCGv_i64 val,
                                  TCGv_i32 addr, int index)
 {
-    tcg_gen_qemu_st_i64(val, addr, index, MO_TEQ);
+    TCGMemOp opc = MO_Q | s->mo_endianness;
+    tcg_gen_qemu_st_i64(val, addr, index, opc);
 }
 
 #else
@@ -955,9 +959,10 @@ static inline void gen_aa32_st64(DisasContext *s, TCGv_i64 val,
 static inline void gen_aa32_ld##SUFF(DisasContext *s, TCGv_i32 val,      \
                                      TCGv_i32 addr, int index)           \
 {                                                                        \
+    TCGMemOp opc = (OPC) | s->mo_endianness;                             \
     TCGv addr64 = tcg_temp_new();                                        \
     tcg_gen_extu_i32_i64(addr64, addr);                                  \
-    tcg_gen_qemu_ld_i32(val, addr64, index, OPC);                        \
+    tcg_gen_qemu_ld_i32(val, addr64, index, opc);                        \
     tcg_temp_free(addr64);                                               \
 }
 
@@ -965,27 +970,30 @@ static inline void gen_aa32_ld##SUFF(DisasContext *s, TCGv_i32 val,      \
 static inline void gen_aa32_st##SUFF(DisasContext *s, TCGv_i32 val,      \
                                      TCGv_i32 addr, int index)           \
 {                                                                        \
+    TCGMemOp opc = (OPC) | s->mo_endianness;                             \
     TCGv addr64 = tcg_temp_new();                                        \
     tcg_gen_extu_i32_i64(addr64, addr);                                  \
-    tcg_gen_qemu_st_i32(val, addr64, index, OPC);                        \
+    tcg_gen_qemu_st_i32(val, addr64, index, opc);                        \
     tcg_temp_free(addr64);                                               \
 }
 
 static inline void gen_aa32_ld64(DisasContext *s, TCGv_i64 val,
                                  TCGv_i32 addr, int index)
 {
+    TCGMemOp opc = MO_Q | s->mo_endianness;
     TCGv addr64 = tcg_temp_new();
     tcg_gen_extu_i32_i64(addr64, addr);
-    tcg_gen_qemu_ld_i64(val, addr64, index, MO_TEQ);
+    tcg_gen_qemu_ld_i64(val, addr64, index, opc);
     tcg_temp_free(addr64);
 }
 
 static inline void gen_aa32_st64(DisasContext *s, TCGv_i64 val,
                                  TCGv_i32 addr, int index)
 {
+    TCGMemOp opc = MO_Q | s->mo_endianness;
     TCGv addr64 = tcg_temp_new();
     tcg_gen_extu_i32_i64(addr64, addr);
-    tcg_gen_qemu_st_i64(val, addr64, index, MO_TEQ);
+    tcg_gen_qemu_st_i64(val, addr64, index, opc);
     tcg_temp_free(addr64);
 }
 
@@ -993,15 +1001,15 @@ static inline void gen_aa32_st64(DisasContext *s, TCGv_i64 val,
 
 DO_GEN_LD(8s, MO_SB)
 DO_GEN_LD(8u, MO_UB)
-DO_GEN_LD(16s, MO_TESW)
-DO_GEN_LD(16u, MO_TEUW)
-DO_GEN_LD(32u, MO_TEUL)
+DO_GEN_LD(16s, MO_SW)
+DO_GEN_LD(16u, MO_UW)
+DO_GEN_LD(32u, MO_UL)
 /* 'a' variants include an alignment check */
-DO_GEN_LD(16ua, MO_TEUW | MO_ALIGN)
-DO_GEN_LD(32ua, MO_TEUL | MO_ALIGN)
+DO_GEN_LD(16ua, MO_UW | MO_ALIGN)
+DO_GEN_LD(32ua, MO_UL | MO_ALIGN)
 DO_GEN_ST(8, MO_UB)
-DO_GEN_ST(16, MO_TEUW)
-DO_GEN_ST(32, MO_TEUL)
+DO_GEN_ST(16, MO_UW)
+DO_GEN_ST(32, MO_UL)
 
 static inline void gen_set_pc_im(DisasContext *s, target_ulong val)
 {
@@ -11266,6 +11274,7 @@ void gen_intermediate_code(CPUARMState *env, TranslationBlock *tb)
                                !arm_el_is_aa64(env, 3);
     dc->thumb = ARM_TBFLAG_THUMB(tb->flags);
     dc->bswap_code = ARM_TBFLAG_BSWAP_CODE(tb->flags);
+    dc->mo_endianness = MO_TE;
     dc->condexec_mask = (ARM_TBFLAG_CONDEXEC(tb->flags) & 0xf) << 1;
     dc->condexec_cond = ARM_TBFLAG_CONDEXEC(tb->flags) >> 4;
     dc->mmu_idx = ARM_TBFLAG_MMUIDX(tb->flags);
diff --git a/target-arm/translate.h b/target-arm/translate.h
index 53ef971..95c3b94 100644
--- a/target-arm/translate.h
+++ b/target-arm/translate.h
@@ -17,6 +17,7 @@ typedef struct DisasContext {
     int singlestep_enabled;
     int thumb;
     int bswap_code;
+    TCGMemOp mo_endianness;
 #if !defined(CONFIG_USER_ONLY)
     int user;
 #endif
-- 
1.9.1

