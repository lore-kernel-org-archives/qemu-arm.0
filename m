Received: by 10.25.0.144 with SMTP id 138csp1748171lfa;
        Tue, 25 Apr 2017 00:54:09 -0700 (PDT)
X-Received: by 10.237.49.36 with SMTP id 33mr28994083qtg.41.1493106849795;
        Tue, 25 Apr 2017 00:54:09 -0700 (PDT)
Return-Path: <cota@braap.org>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com. [66.111.4.28])
        by mx.google.com with ESMTPS id h132si7434774qka.56.2017.04.25.00.54.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Apr 2017 00:54:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) client-ip=66.111.4.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org;
       dkim=pass header.i=@messagingengine.com;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 1572321F29;
	Tue, 25 Apr 2017 03:54:04 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
  by compute4.internal (MEProxy); Tue, 25 Apr 2017 03:54:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:date:from:in-reply-to:message-id:references:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=QVh
	YawXFcUi8j51QvHUGX9ciyL8i1T4rMyHNPFzXajU=; b=elZBUVy/8/fR5pQRfKV
	oOJyWf7uFR8bQSM2tVRbJrPnFSSkTRYyt6n1X4ibEoG5R++fBMNP84DFJWGveybp
	xJd5aZ5QkLIEFlGxhiDmLrD66X6DFjQDjZBLr2mRlmttvh8lG1P5YlJAIoMFDx4H
	4VJgPzVP4ZPJl6N2QTfoqiUU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=fm1; bh=QVhYawXFcUi8j51QvHUGX9ciyL8i1T4rMyHNPFzXa
	jU=; b=igjzmFXd8Et9DV5kC4Y8KkYE201ZuCS91+a0MFdNsDOFsNIevNr7KGlmU
	sOG6N1XsYcPl5KhSHq9uo6Z1S4UvNFosGyDAc09Q+eNTcjnKkInQg8dCQIbdjI+7
	HiYDDjPeAhs5TDkKTNVPDZUzEnkssX45jsbIPmW+5bm+U8gCyNEqz6+HGvfoUG03
	1wWSzm6F1zcYjuBLQvF8rGxaxRWuNER1Zu2jhk83mtDVCt6PyCyJib+uEumVBKCh
	KsPmYfNCe+E9k39wuWmPsE8U0JGx5NSv6ibkOZh9Vlrnjg/ATiXRs3yzFkvtwwDy
	cJhVYW7HLMRb2IB1CJMlF3Afn3bIA==
X-ME-Sender: <xms:nAD_WElg89RAd4qNsj3BPou-t2GdTiNY30cpSirClD8kMvS-UlC6Fg>
X-Sasl-enc: McDwcYoSOsrgn35+xydR3HgI4wlwRuVbhondrqX23xnS 1493106844
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 563BB2479D;
	Tue, 25 Apr 2017 03:54:04 -0400 (EDT)
From: "Emilio G. Cota" <cota@braap.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Alexander Graf <agraf@suse.de>,
	Stefan Weil <sw@weilnetz.de>,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	Pranith Kumar <bobby.prani+qemu@gmail.com>
Subject: [PATCH v2 06/13] tcg: add goto_ptr opcode
Date: Tue, 25 Apr 2017 03:53:52 -0400
Message-Id: <1493106839-10438-7-git-send-email-cota@braap.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1493106839-10438-1-git-send-email-cota@braap.org>
References: <1493106839-10438-1-git-send-email-cota@braap.org>
X-TUID: wPj4wHqnB06f

Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 tcg/README               | 11 +++++++++++
 tcg/aarch64/tcg-target.h |  1 +
 tcg/arm/tcg-target.h     |  1 +
 tcg/i386/tcg-target.h    |  1 +
 tcg/ia64/tcg-target.h    |  1 +
 tcg/mips/tcg-target.h    |  1 +
 tcg/ppc/tcg-target.h     |  1 +
 tcg/s390/tcg-target.h    |  1 +
 tcg/sparc/tcg-target.h   |  1 +
 tcg/tcg-op.c             |  9 +++++++++
 tcg/tcg-op.h             |  9 +++++++++
 tcg/tcg-opc.h            |  1 +
 tcg/tcg.c                |  1 +
 tcg/tci/tcg-target.h     |  1 +
 14 files changed, 40 insertions(+)

diff --git a/tcg/README b/tcg/README
index a9858c2..9cfd422 100644
--- a/tcg/README
+++ b/tcg/README
@@ -477,6 +477,17 @@ current TB was linked to this TB. Otherwise execute the next
 instructions. Only indices 0 and 1 are valid and tcg_gen_goto_tb may be issued
 at most once with each slot index per TB.
 
+* goto_ptr ptr
+
+Jump to a host address given by host pointer 'ptr'.  Typically ptr is obtained
+from the lookup_tb_ptr TCG helper. The return value of this helper depends on
+whether the TB is currently valid: if it is, the corresponding host address
+is returned; if it is not valid, the helper returns the address of the TCG
+epilogue, which restores state to go back to the exec loop.
+
+Implementing goto_ptr is optional for TCG backends. When not implemented,
+calling it is equivalent to calling exit_tb(0).
+
 * qemu_ld_i32/i64 t0, t1, flags, memidx
 * qemu_st_i32/i64 t0, t1, flags, memidx
 
diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
index 1a5ea23..b82eac4 100644
--- a/tcg/aarch64/tcg-target.h
+++ b/tcg/aarch64/tcg-target.h
@@ -77,6 +77,7 @@ typedef enum {
 #define TCG_TARGET_HAS_mulsh_i32        0
 #define TCG_TARGET_HAS_extrl_i64_i32    0
 #define TCG_TARGET_HAS_extrh_i64_i32    0
+#define TCG_TARGET_HAS_goto_ptr         0
 
 #define TCG_TARGET_HAS_div_i64          1
 #define TCG_TARGET_HAS_rem_i64          1
diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index 09a19c6..2f3ecfd 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -123,6 +123,7 @@ extern bool use_idiv_instructions;
 #define TCG_TARGET_HAS_mulsh_i32        0
 #define TCG_TARGET_HAS_div_i32          use_idiv_instructions
 #define TCG_TARGET_HAS_rem_i32          0
+#define TCG_TARGET_HAS_goto_ptr         0
 
 enum {
     TCG_AREG0 = TCG_REG_R6,
diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
index 4275787..59d9835 100644
--- a/tcg/i386/tcg-target.h
+++ b/tcg/i386/tcg-target.h
@@ -107,6 +107,7 @@ extern bool have_popcnt;
 #define TCG_TARGET_HAS_muls2_i32        1
 #define TCG_TARGET_HAS_muluh_i32        0
 #define TCG_TARGET_HAS_mulsh_i32        0
+#define TCG_TARGET_HAS_goto_ptr         0
 
 #if TCG_TARGET_REG_BITS == 64
 #define TCG_TARGET_HAS_extrl_i64_i32    0
diff --git a/tcg/ia64/tcg-target.h b/tcg/ia64/tcg-target.h
index 42aea03..901bb75 100644
--- a/tcg/ia64/tcg-target.h
+++ b/tcg/ia64/tcg-target.h
@@ -173,6 +173,7 @@ typedef enum {
 #define TCG_TARGET_HAS_mulsh_i64        0
 #define TCG_TARGET_HAS_extrl_i64_i32    0
 #define TCG_TARGET_HAS_extrh_i64_i32    0
+#define TCG_TARGET_HAS_goto_ptr         0
 
 #define TCG_TARGET_deposit_i32_valid(ofs, len) ((len) <= 16)
 #define TCG_TARGET_deposit_i64_valid(ofs, len) ((len) <= 16)
diff --git a/tcg/mips/tcg-target.h b/tcg/mips/tcg-target.h
index f46d64a..e3240cf 100644
--- a/tcg/mips/tcg-target.h
+++ b/tcg/mips/tcg-target.h
@@ -130,6 +130,7 @@ extern bool use_mips32r2_instructions;
 #define TCG_TARGET_HAS_muluh_i32        1
 #define TCG_TARGET_HAS_mulsh_i32        1
 #define TCG_TARGET_HAS_bswap32_i32      1
+#define TCG_TARGET_HAS_goto_ptr         0
 
 #if TCG_TARGET_REG_BITS == 64
 #define TCG_TARGET_HAS_add2_i32         0
diff --git a/tcg/ppc/tcg-target.h b/tcg/ppc/tcg-target.h
index abd8b3d..a9aa974 100644
--- a/tcg/ppc/tcg-target.h
+++ b/tcg/ppc/tcg-target.h
@@ -82,6 +82,7 @@ extern bool have_isa_3_00;
 #define TCG_TARGET_HAS_muls2_i32        0
 #define TCG_TARGET_HAS_muluh_i32        1
 #define TCG_TARGET_HAS_mulsh_i32        1
+#define TCG_TARGET_HAS_goto_ptr         0
 
 #if TCG_TARGET_REG_BITS == 64
 #define TCG_TARGET_HAS_add2_i32         0
diff --git a/tcg/s390/tcg-target.h b/tcg/s390/tcg-target.h
index cbdd2a6..6b7bcfb 100644
--- a/tcg/s390/tcg-target.h
+++ b/tcg/s390/tcg-target.h
@@ -92,6 +92,7 @@ extern uint64_t s390_facilities;
 #define TCG_TARGET_HAS_mulsh_i32      0
 #define TCG_TARGET_HAS_extrl_i64_i32  0
 #define TCG_TARGET_HAS_extrh_i64_i32  0
+#define TCG_TARGET_HAS_goto_ptr       0
 
 #define TCG_TARGET_HAS_div2_i64       1
 #define TCG_TARGET_HAS_rot_i64        1
diff --git a/tcg/sparc/tcg-target.h b/tcg/sparc/tcg-target.h
index b8b74f9..9348ddd 100644
--- a/tcg/sparc/tcg-target.h
+++ b/tcg/sparc/tcg-target.h
@@ -123,6 +123,7 @@ extern bool use_vis3_instructions;
 #define TCG_TARGET_HAS_muls2_i32        1
 #define TCG_TARGET_HAS_muluh_i32        0
 #define TCG_TARGET_HAS_mulsh_i32        0
+#define TCG_TARGET_HAS_goto_ptr         0
 
 #define TCG_TARGET_HAS_extrl_i64_i32    1
 #define TCG_TARGET_HAS_extrh_i64_i32    1
diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index 95a39b7..e8a140b 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -2587,6 +2587,15 @@ void tcg_gen_goto_tb(unsigned idx)
     tcg_gen_op1i(INDEX_op_goto_tb, idx);
 }
 
+void tcg_gen_goto_ptr(TCGv_ptr ptr)
+{
+    if (TCG_TARGET_HAS_goto_ptr) {
+        tcg_gen_op1i(INDEX_op_goto_ptr, GET_TCGV_PTR(ptr));
+    } else {
+        tcg_gen_exit_tb(0);
+    }
+}
+
 static inline TCGMemOp tcg_canonicalize_memop(TCGMemOp op, bool is64, bool st)
 {
     /* Trigger the asserts within as early as possible.  */
diff --git a/tcg/tcg-op.h b/tcg/tcg-op.h
index c68e300..d65727e 100644
--- a/tcg/tcg-op.h
+++ b/tcg/tcg-op.h
@@ -796,6 +796,15 @@ static inline void tcg_gen_exit_tb(uintptr_t val)
  */
 void tcg_gen_goto_tb(unsigned idx);
 
+/**
+ * tcg_gen_goto_ptr() - output a jump to a host address
+ * @ptr: pointer with the target host address
+ *
+ * Implementing this operation is optional. If the TCG backend does not support
+ * it, this call is equivalent to tcg_gen_exit_tb() with 0 as the argument.
+ */
+void tcg_gen_goto_ptr(TCGv_ptr ptr);
+
 #if TARGET_LONG_BITS == 32
 #define tcg_temp_new() tcg_temp_new_i32()
 #define tcg_global_reg_new tcg_global_reg_new_i32
diff --git a/tcg/tcg-opc.h b/tcg/tcg-opc.h
index f06f894..c64b994 100644
--- a/tcg/tcg-opc.h
+++ b/tcg/tcg-opc.h
@@ -193,6 +193,7 @@ DEF(insn_start, 0, 0, TLADDR_ARGS * TARGET_INSN_START_WORDS,
     TCG_OPF_NOT_PRESENT)
 DEF(exit_tb, 0, 0, 1, TCG_OPF_BB_END)
 DEF(goto_tb, 0, 0, 1, TCG_OPF_BB_END)
+DEF(goto_ptr, 0, 1, 0, TCG_OPF_BB_END)
 
 DEF(qemu_ld_i32, 1, TLADDR_ARGS, 1,
     TCG_OPF_CALL_CLOBBER | TCG_OPF_SIDE_EFFECTS)
diff --git a/tcg/tcg.c b/tcg/tcg.c
index cb898f1..0ea57c0 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1138,6 +1138,7 @@ void tcg_dump_ops(TCGContext *s)
             }
             switch (c) {
             case INDEX_op_set_label:
+            case INDEX_op_goto_tb:
             case INDEX_op_br:
             case INDEX_op_brcond_i32:
             case INDEX_op_brcond_i64:
diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index 838bf3a..0696328 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -85,6 +85,7 @@
 #define TCG_TARGET_HAS_muls2_i32        0
 #define TCG_TARGET_HAS_muluh_i32        0
 #define TCG_TARGET_HAS_mulsh_i32        0
+#define TCG_TARGET_HAS_goto_ptr         0
 
 #if TCG_TARGET_REG_BITS == 64
 #define TCG_TARGET_HAS_extrl_i64_i32    0
-- 
2.7.4
