Received: by 10.25.159.19 with SMTP id i19csp1755421lfe;
        Sun, 17 Jan 2016 23:17:36 -0800 (PST)
X-Received: by 10.55.201.27 with SMTP id q27mr28123939qki.103.1453101456783;
        Sun, 17 Jan 2016 23:17:36 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z18si29523406qhb.117.2016.01.17.23.17.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 17 Jan 2016 23:17:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58031 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aL44G-0002io-6j
	for alex.bennee@linaro.org; Mon, 18 Jan 2016 02:17:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42670)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aL402-0003VE-Dr
	for qemu-devel@nongnu.org; Mon, 18 Jan 2016 02:13:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aL400-00077p-O2
	for qemu-devel@nongnu.org; Mon, 18 Jan 2016 02:13:14 -0500
Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236]:35250)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aL400-00077Z-Dj; Mon, 18 Jan 2016 02:13:12 -0500
Received: by mail-pa0-x236.google.com with SMTP id ho8so168649399pac.2;
	Sun, 17 Jan 2016 23:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=HLokou2rdg9UBZZED2Hwf+4X1Wy6dQ5U34KraTjhGak=;
	b=QZ0Ysty84bpsTyDzNB9nNhkngRs0z8c93smj8Iu+mN3xHsWVjZM+A7JMzPIncGluj6
	8AZ4Btut8pn8czNkAwCIWn0HiJrXVAlkQtot+KexcQfva+jyym8Fr6V7kyhW8C/ieTk2
	Kf8ppWLcht/t9OwxlroWEe1vKKXebdyPWGNYzYvmMyDSUEQMLHOSj02ppdCPOghQV7TB
	PqRgd38d/2GQrKJAwbMR8g5GEefXCdRGpNY2ANmlZ42rf4KPzi7MT070PNycogasD68/
	3sSZ34IKwmIZPCTrKSmfgxaoiA6uiWB8WD+fzBbPsCqDTpjsmAblc7jWQiQhbo8Nkdxn
	MgQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=HLokou2rdg9UBZZED2Hwf+4X1Wy6dQ5U34KraTjhGak=;
	b=KK5AB19sR2jSAO58yV0ZqvcvFoumi3PsjvfyDbauEHQBjwYFNu6HLQQmd0pu1wokK2
	QGsMsfgu9SU7mj7YPpyWkX2ei2xx4doS0PBnR/R8EzSdi6MmaVSGcerUIrIjg9hrQgBc
	AZ43Ju3EeYmqZEKUBHmYrmfyBMZjLspvBDx1jvIAx1MoFQGYP3kSiLO9DyYP0VcThZya
	4zylL/rofFVRDqwLbLgMidujf1zUu3NhtTMoTBhcDM2CugjrJz3LQgYYvyOWIUqSM6xx
	FIm8Z5iFiKMpwzYlylFT/EG/jfPnpcGHfPtimuLOsjM3GzAM+rCnKqV7JnlAHZoghT4M
	u9gQ==
X-Gm-Message-State: ALoCoQnz7CLpX7IkHhg5IbJBMcPtzlPX2cG5FsRUejPTX6UOfnU1P2yx3TVQV9cVqc/L+cpgTWy7e6g1e1u8RBy5L7oKsre5Jg==
X-Received: by 10.66.120.200 with SMTP id le8mr34362142pab.61.1453101191943;
	Sun, 17 Jan 2016 23:13:11 -0800 (PST)
Received: from localhost.localdomain (c-73-70-184-119.hsd1.ca.comcast.net.
	[73.70.184.119]) by smtp.gmail.com with ESMTPSA id
	xv2sm31471880pab.10.2016.01.17.23.13.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 23:13:10 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun, 17 Jan 2016 23:12:41 -0800
Message-Id: <922c7336b12809a8646aeabd6e32972680c5549f.1453100525.git.crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1453100525.git.crosthwaite.peter@gmail.com>
References: <cover.1453100525.git.crosthwaite.peter@gmail.com>
In-Reply-To: <cover.1453100525.git.crosthwaite.peter@gmail.com>
References: <cover.1453100525.git.crosthwaite.peter@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::236
Cc: peter.maydell@linaro.org, Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	alistair.francis@xilinx.com, sridhar_kulk@yahoo.com,
	qemu-arm@nongnu.org, pbonzini@redhat.com, piotr.krol@3mdeb.com
Subject: [Qemu-devel] [PATCH v1 14/17] target-arm: implement BE32 mode in
	system emulation
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: NQDGRoRb4TaQ

From: Paolo Bonzini <pbonzini@redhat.com>

System emulation only has a little-endian target; BE32 mode
is implemented by adjusting the low bits of the address
for every byte and halfword load and store.  64-bit accesses
flip the low and high words.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
[PC changes:
  * rebased against master (Jan 2016)
]
Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---

 target-arm/cpu.h       |  5 ++-
 target-arm/translate.c | 86 +++++++++++++++++++++++++++++++++++++++++---------
 2 files changed, 73 insertions(+), 18 deletions(-)

diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index 96b1e99..5814019 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -1925,9 +1925,8 @@ static inline bool bswap_code(bool sctlr_b)
 #endif
         sctlr_b;
 #else
-    /* We do not implement BE32 mode for system-mode emulation, but
-     * anyway it would always do little-endian accesses with
-     * TARGET_WORDS_BIGENDIAN = 0.
+    /* All code access in ARM is little endian, and there are no loaders
+     * doing swaps that need to be reversed
      */
     return 0;
 #endif
diff --git a/target-arm/translate.c b/target-arm/translate.c
index 44c3ac9..2d80bb2 100644
--- a/target-arm/translate.c
+++ b/target-arm/translate.c
@@ -914,6 +914,12 @@ static inline void store_reg_from_load(DisasContext *s, int reg, TCGv_i32 var)
     }
 }
 
+#ifdef CONFIG_USER_ONLY
+#define IS_USER_ONLY 1
+#else
+#define IS_USER_ONLY 0
+#endif
+
 /* Abstractions of "generate code to do a guest load/store for
  * AArch32", where a vaddr is always 32 bits (and is zero
  * extended if we're a 64 bit core) and  data is also
@@ -923,19 +929,35 @@ static inline void store_reg_from_load(DisasContext *s, int reg, TCGv_i32 var)
  */
 #if TARGET_LONG_BITS == 32
 
-#define DO_GEN_LD(SUFF, OPC)                                             \
+#define DO_GEN_LD(SUFF, OPC, BE32_XOR)                                   \
 static inline void gen_aa32_ld##SUFF(DisasContext *s, TCGv_i32 val,      \
                                      TCGv_i32 addr, int index)           \
 {                                                                        \
     TCGMemOp opc = (OPC) | s->mo_endianness;                             \
+    /* Not needed for user-mode BE32, where we use MO_BE instead.  */    \
+    if (!IS_USER_ONLY && s->sctlr_b && BE32_XOR) {                       \
+        TCGv addr_be = tcg_temp_new();                                   \
+        tcg_gen_xori_i32(addr_be, addr, BE32_XOR);                       \
+        tcg_gen_qemu_ld_i32(val, addr_be, index, opc);                   \
+        tcg_temp_free(addr_be);                                          \
+        return;                                                          \
+    }                                                                    \
     tcg_gen_qemu_ld_i32(val, addr, index, opc);                          \
 }
 
-#define DO_GEN_ST(SUFF, OPC)                                             \
+#define DO_GEN_ST(SUFF, OPC, BE32_XOR)                                   \
 static inline void gen_aa32_st##SUFF(DisasContext *s, TCGv_i32 val,      \
                                      TCGv_i32 addr, int index)           \
 {                                                                        \
     TCGMemOp opc = (OPC) | s->mo_endianness;                             \
+    /* Not needed for user-mode BE32, where we use MO_BE instead.  */    \
+    if (!IS_USER_ONLY && s->sctlr_b && BE32_XOR) {                       \
+        TCGv addr_be = tcg_temp_new();                                   \
+        tcg_gen_xori_i32(addr_be, addr, BE32_XOR);                       \
+        tcg_gen_qemu_ld_i32(val, addr_be, index, opc);                   \
+        tcg_temp_free(addr_be);                                          \
+        return;                                                          \
+    }                                                                    \
     tcg_gen_qemu_st_i32(val, addr, index, opc);                          \
 }
 
@@ -944,35 +966,55 @@ static inline void gen_aa32_ld64(DisasContext *s, TCGv_i64 val,
 {
     TCGMemOp opc = MO_Q | s->mo_endianness;
     tcg_gen_qemu_ld_i64(val, addr, index, opc);
+    /* Not needed for user-mode BE32, where we use MO_BE instead.  */
+    if (!IS_USER_ONLY && s->sctlr_b) {
+        tcg_gen_rotri_i64(val, val, 32);
+    }
 }
 
 static inline void gen_aa32_st64(DisasContext *s, TCGv_i64 val,
                                  TCGv_i32 addr, int index)
 {
     TCGMemOp opc = MO_Q | s->mo_endianness;
+    /* Not needed for user-mode BE32, where we use MO_BE instead.  */
+    if (!IS_USER_ONLY && s->sctlr_b) {
+        TCGv_i64 tmp = tcg_temp_new_i64();
+        tcg_gen_rotri_i64(tmp, val, 32);
+        tcg_gen_qemu_st_i64(tmp, addr, index, opc);
+        tcg_temp_free_i64(tmp);
+        return;
+    }
     tcg_gen_qemu_st_i64(val, addr, index, opc);
 }
 
 #else
 
-#define DO_GEN_LD(SUFF, OPC)                                             \
+#define DO_GEN_LD(SUFF, OPC, BE32_XOR)                                   \
 static inline void gen_aa32_ld##SUFF(DisasContext *s, TCGv_i32 val,      \
                                      TCGv_i32 addr, int index)           \
 {                                                                        \
     TCGMemOp opc = (OPC) | s->mo_endianness;                             \
     TCGv addr64 = tcg_temp_new();                                        \
     tcg_gen_extu_i32_i64(addr64, addr);                                  \
+    /* Not needed for user-mode BE32, where we use MO_BE instead.  */    \
+    if (!IS_USER_ONLY && s->sctlr_b && BE32_XOR) {                       \
+        tcg_gen_xori_i64(addr64, addr64, BE32_XOR);                      \
+    }                                                                    \
     tcg_gen_qemu_ld_i32(val, addr64, index, opc);                        \
     tcg_temp_free(addr64);                                               \
 }
 
-#define DO_GEN_ST(SUFF, OPC)                                             \
+#define DO_GEN_ST(SUFF, OPC, BE32_XOR)                                   \
 static inline void gen_aa32_st##SUFF(DisasContext *s, TCGv_i32 val,      \
                                      TCGv_i32 addr, int index)           \
 {                                                                        \
     TCGMemOp opc = (OPC) | s->mo_endianness;                             \
     TCGv addr64 = tcg_temp_new();                                        \
     tcg_gen_extu_i32_i64(addr64, addr);                                  \
+    /* Not needed for user-mode BE32, where we use MO_BE instead.  */    \
+    if (!IS_USER_ONLY && s->sctlr_b && BE32_XOR) {                       \
+        tcg_gen_xori_i64(addr64, addr64, BE32_XOR);                      \
+    }                                                                    \
     tcg_gen_qemu_st_i32(val, addr64, index, opc);                        \
     tcg_temp_free(addr64);                                               \
 }
@@ -984,6 +1026,11 @@ static inline void gen_aa32_ld64(DisasContext *s, TCGv_i64 val,
     TCGv addr64 = tcg_temp_new();
     tcg_gen_extu_i32_i64(addr64, addr);
     tcg_gen_qemu_ld_i64(val, addr64, index, opc);
+
+    /* Not needed for user-mode BE32, where we use MO_BE instead.  */
+    if (!IS_USER_ONLY && s->sctlr_b) {
+        tcg_gen_rotri_i64(val, val, 32);
+    }
     tcg_temp_free(addr64);
 }
 
@@ -993,23 +1040,32 @@ static inline void gen_aa32_st64(DisasContext *s, TCGv_i64 val,
     TCGMemOp opc = MO_Q | s->mo_endianness;
     TCGv addr64 = tcg_temp_new();
     tcg_gen_extu_i32_i64(addr64, addr);
-    tcg_gen_qemu_st_i64(val, addr64, index, opc);
+
+    /* Not needed for user-mode BE32, where we use MO_BE instead.  */
+    if (!IS_USER_ONLY && s->sctlr_b) {
+        TCGv tmp = tcg_temp_new();
+        tcg_gen_rotri_i64(tmp, val, 32);
+        tcg_gen_qemu_st_i64(tmp, addr64, index, opc);
+        tcg_temp_free(tmp);
+    } else {
+        tcg_gen_qemu_st_i64(val, addr64, index, opc);
+    }
     tcg_temp_free(addr64);
 }
 
 #endif
 
-DO_GEN_LD(8s, MO_SB)
-DO_GEN_LD(8u, MO_UB)
-DO_GEN_LD(16s, MO_SW)
-DO_GEN_LD(16u, MO_UW)
-DO_GEN_LD(32u, MO_UL)
+DO_GEN_LD(8s, MO_SB, 3)
+DO_GEN_LD(8u, MO_UB, 3)
+DO_GEN_LD(16s, MO_SW, 2)
+DO_GEN_LD(16u, MO_UW, 2)
+DO_GEN_LD(32u, MO_UL, 0)
 /* 'a' variants include an alignment check */
-DO_GEN_LD(16ua, MO_UW | MO_ALIGN)
-DO_GEN_LD(32ua, MO_UL | MO_ALIGN)
-DO_GEN_ST(8, MO_UB)
-DO_GEN_ST(16, MO_UW)
-DO_GEN_ST(32, MO_UL)
+DO_GEN_LD(16ua, MO_UW | MO_ALIGN, 2)
+DO_GEN_LD(32ua, MO_UL | MO_ALIGN, 0)
+DO_GEN_ST(8, MO_UB, 3)
+DO_GEN_ST(16, MO_UW, 2)
+DO_GEN_ST(32, MO_UL, 0)
 
 static inline void gen_set_pc_im(DisasContext *s, target_ulong val)
 {
-- 
1.9.1

