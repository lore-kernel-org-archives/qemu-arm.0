Received: by 10.25.0.144 with SMTP id 138csp89162lfa;
        Tue, 11 Apr 2017 18:17:48 -0700 (PDT)
X-Received: by 10.55.125.132 with SMTP id y126mr57212187qkc.314.1491959868324;
        Tue, 11 Apr 2017 18:17:48 -0700 (PDT)
Return-Path: <cota@braap.org>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com. [66.111.4.25])
        by mx.google.com with ESMTPS id v7si17913742qkb.187.2017.04.11.18.17.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Apr 2017 18:17:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.25 as permitted sender) client-ip=66.111.4.25;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org;
       dkim=pass header.i=@messagingengine.com;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.25 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id AF2FD20B84;
	Tue, 11 Apr 2017 21:17:47 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
  by compute4.internal (MEProxy); Tue, 11 Apr 2017 21:17:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:date:from:in-reply-to:message-id:references:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=hGK
	Z/fNGgyPDDms+VwnQXrBIBDAzWZv+3buonmWvGyo=; b=uJHzOkJM05UgfV6447v
	YbwW5fRj8kJKltvm4sBY2KWeoMRQriBl0Tc/YOSQY5JunXKmgXeL0mplQMmN38Op
	yjdYupc+Lr0j1xz99knk2lNQpgk4pCigkUCHWCGSehqKrVVMMi5c0JFOZ8aKUq4q
	O5Sleol3J1GgjeK6cRYsbHMc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=fm1; bh=hGKZ/fNGgyPDDms+VwnQXrBIBDAzWZv+3buonmWvG
	yo=; b=WlhURXGl5E936CEXueYgEp5AKYbusJ4aV+EIqlOGgr7/UFLF7DFSBlRT7
	bYrhzLWQxJ6ejtAYkay3A4wX4O0SjfTCahJxe/9Ul3kjvz+TeuwckRRrD0jemik1
	9P6IqnuMDRMWDILwfiZDGMtzCZ9VnwtZQDPmNVXgW3PvWWm48KAF77ygeKlGMHQh
	iYmyZplrGQrVaYqSv8Tnc1CyQPiNtOQ1VEsxoXUKJME71wBPaRwf/Z7APSBoOlem
	24PM0FYnSuX81u5NvwTj2aGynhapAfiuVRX/5Khae3kLSbJzNpDLYynqz2aVjoGc
	ozhwoWZkCr0u8nGzJcp/rDESrlDYg==
X-ME-Sender: <xms:O4DtWKpCTWH48tclSGYTV8q7zDsPzcjyqRnGocrEb5BOZ6U58FYwUA>
X-Sasl-enc: ERq3abgHpETx3qzaKB6dLnGpPiI9+MZL93SFqLcWFQJf 1491959867
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 5F8B37E43A;
	Tue, 11 Apr 2017 21:17:47 -0400 (EDT)
From: "Emilio G. Cota" <cota@braap.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Claudio Fontana <claudio.fontana@huawei.com>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Alexander Graf <agraf@suse.de>,
	Stefan Weil <sw@weilnetz.de>,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	Pranith Kumar <bobby.prani+qemu@gmail.com>
Subject: [PATCH 05/10] tcg: add jr opcode
Date: Tue, 11 Apr 2017 21:17:25 -0400
Message-Id: <1491959850-30756-6-git-send-email-cota@braap.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1491959850-30756-1-git-send-email-cota@braap.org>
References: <1491959850-30756-1-git-send-email-cota@braap.org>
X-TUID: ulbjk1uBLhWh

This will be used by TCG targets to implement a fast path
for indirect branches.

I only have implemented and tested this on an i386 host, so
make this opcode optional and mark it as not implemented by
other TCG backends.

Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 tcg/aarch64/tcg-target.h  | 1 +
 tcg/arm/tcg-target.h      | 1 +
 tcg/i386/tcg-target.h     | 1 +
 tcg/i386/tcg-target.inc.c | 7 +++++++
 tcg/ia64/tcg-target.h     | 1 +
 tcg/mips/tcg-target.h     | 1 +
 tcg/ppc/tcg-target.h      | 1 +
 tcg/s390/tcg-target.h     | 1 +
 tcg/sparc/tcg-target.h    | 1 +
 tcg/tcg-op.h              | 6 ++++++
 tcg/tcg-opc.h             | 1 +
 tcg/tcg.c                 | 1 +
 tcg/tci/tcg-target.h      | 1 +
 13 files changed, 24 insertions(+)

diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
index 1a5ea23..ed2fb84 100644
--- a/tcg/aarch64/tcg-target.h
+++ b/tcg/aarch64/tcg-target.h
@@ -77,6 +77,7 @@ typedef enum {
 #define TCG_TARGET_HAS_mulsh_i32        0
 #define TCG_TARGET_HAS_extrl_i64_i32    0
 #define TCG_TARGET_HAS_extrh_i64_i32    0
+#define TCG_TARGET_HAS_jr               0
 
 #define TCG_TARGET_HAS_div_i64          1
 #define TCG_TARGET_HAS_rem_i64          1
diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index 09a19c6..1c9f0a2 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -123,6 +123,7 @@ extern bool use_idiv_instructions;
 #define TCG_TARGET_HAS_mulsh_i32        0
 #define TCG_TARGET_HAS_div_i32          use_idiv_instructions
 #define TCG_TARGET_HAS_rem_i32          0
+#define TCG_TARGET_HAS_jr               0
 
 enum {
     TCG_AREG0 = TCG_REG_R6,
diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
index 4275787..ebbddb3 100644
--- a/tcg/i386/tcg-target.h
+++ b/tcg/i386/tcg-target.h
@@ -107,6 +107,7 @@ extern bool have_popcnt;
 #define TCG_TARGET_HAS_muls2_i32        1
 #define TCG_TARGET_HAS_muluh_i32        0
 #define TCG_TARGET_HAS_mulsh_i32        0
+#define TCG_TARGET_HAS_jr               1
 
 #if TCG_TARGET_REG_BITS == 64
 #define TCG_TARGET_HAS_extrl_i64_i32    0
diff --git a/tcg/i386/tcg-target.inc.c b/tcg/i386/tcg-target.inc.c
index 5918008..53baf71 100644
--- a/tcg/i386/tcg-target.inc.c
+++ b/tcg/i386/tcg-target.inc.c
@@ -1909,6 +1909,9 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_br:
         tcg_out_jxx(s, JCC_JMP, arg_label(a0), 0);
         break;
+    case INDEX_op_jr:
+        tcg_out_modrm(s, OPC_GRP5, EXT5_JMPN_Ev, a0);
+        break;
     OP_32_64(ld8u):
         /* Note that we can ignore REXW for the zero-extend to 64-bit.  */
         tcg_out_modrm_offset(s, OPC_MOVZBL, a0, a1, a2);
@@ -2277,6 +2280,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
 static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
 {
+    static const TCGTargetOpDef ri = { .args_ct_str = { "ri" } };
     static const TCGTargetOpDef ri_r = { .args_ct_str = { "ri", "r" } };
     static const TCGTargetOpDef re_r = { .args_ct_str = { "re", "r" } };
     static const TCGTargetOpDef qi_r = { .args_ct_str = { "qi", "r" } };
@@ -2324,6 +2328,9 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
     case INDEX_op_st_i64:
         return &re_r;
 
+    case INDEX_op_jr:
+        return &ri;
+
     case INDEX_op_add_i32:
     case INDEX_op_add_i64:
         return &r_r_re;
diff --git a/tcg/ia64/tcg-target.h b/tcg/ia64/tcg-target.h
index 42aea03..a2760ba 100644
--- a/tcg/ia64/tcg-target.h
+++ b/tcg/ia64/tcg-target.h
@@ -173,6 +173,7 @@ typedef enum {
 #define TCG_TARGET_HAS_mulsh_i64        0
 #define TCG_TARGET_HAS_extrl_i64_i32    0
 #define TCG_TARGET_HAS_extrh_i64_i32    0
+#define TCG_TARGET_HAS_jr               0
 
 #define TCG_TARGET_deposit_i32_valid(ofs, len) ((len) <= 16)
 #define TCG_TARGET_deposit_i64_valid(ofs, len) ((len) <= 16)
diff --git a/tcg/mips/tcg-target.h b/tcg/mips/tcg-target.h
index f46d64a..d06e495 100644
--- a/tcg/mips/tcg-target.h
+++ b/tcg/mips/tcg-target.h
@@ -130,6 +130,7 @@ extern bool use_mips32r2_instructions;
 #define TCG_TARGET_HAS_muluh_i32        1
 #define TCG_TARGET_HAS_mulsh_i32        1
 #define TCG_TARGET_HAS_bswap32_i32      1
+#define TCG_TARGET_HAS_jr               0
 
 #if TCG_TARGET_REG_BITS == 64
 #define TCG_TARGET_HAS_add2_i32         0
diff --git a/tcg/ppc/tcg-target.h b/tcg/ppc/tcg-target.h
index abd8b3d..461bb0c 100644
--- a/tcg/ppc/tcg-target.h
+++ b/tcg/ppc/tcg-target.h
@@ -82,6 +82,7 @@ extern bool have_isa_3_00;
 #define TCG_TARGET_HAS_muls2_i32        0
 #define TCG_TARGET_HAS_muluh_i32        1
 #define TCG_TARGET_HAS_mulsh_i32        1
+#define TCG_TARGET_HAS_jr               0
 
 #if TCG_TARGET_REG_BITS == 64
 #define TCG_TARGET_HAS_add2_i32         0
diff --git a/tcg/s390/tcg-target.h b/tcg/s390/tcg-target.h
index cbdd2a6..b35c7b1 100644
--- a/tcg/s390/tcg-target.h
+++ b/tcg/s390/tcg-target.h
@@ -92,6 +92,7 @@ extern uint64_t s390_facilities;
 #define TCG_TARGET_HAS_mulsh_i32      0
 #define TCG_TARGET_HAS_extrl_i64_i32  0
 #define TCG_TARGET_HAS_extrh_i64_i32  0
+#define TCG_TARGET_HAS_jr             0
 
 #define TCG_TARGET_HAS_div2_i64       1
 #define TCG_TARGET_HAS_rot_i64        1
diff --git a/tcg/sparc/tcg-target.h b/tcg/sparc/tcg-target.h
index b8b74f9..3d6f872 100644
--- a/tcg/sparc/tcg-target.h
+++ b/tcg/sparc/tcg-target.h
@@ -123,6 +123,7 @@ extern bool use_vis3_instructions;
 #define TCG_TARGET_HAS_muls2_i32        1
 #define TCG_TARGET_HAS_muluh_i32        0
 #define TCG_TARGET_HAS_mulsh_i32        0
+#define TCG_TARGET_HAS_jr               0
 
 #define TCG_TARGET_HAS_extrl_i64_i32    1
 #define TCG_TARGET_HAS_extrh_i64_i32    1
diff --git a/tcg/tcg-op.h b/tcg/tcg-op.h
index c68e300..1924633 100644
--- a/tcg/tcg-op.h
+++ b/tcg/tcg-op.h
@@ -261,6 +261,12 @@ static inline void tcg_gen_br(TCGLabel *l)
     tcg_gen_op1(&tcg_ctx, INDEX_op_br, label_arg(l));
 }
 
+/* jump to a host address contained in a register */
+static inline void tcg_gen_jr(TCGv_ptr arg)
+{
+    tcg_gen_op1i(INDEX_op_jr, GET_TCGV_PTR(arg));
+}
+
 void tcg_gen_mb(TCGBar);
 
 /* Helper calls. */
diff --git a/tcg/tcg-opc.h b/tcg/tcg-opc.h
index f06f894..1e869af 100644
--- a/tcg/tcg-opc.h
+++ b/tcg/tcg-opc.h
@@ -34,6 +34,7 @@ DEF(set_label, 0, 0, 1, TCG_OPF_BB_END | TCG_OPF_NOT_PRESENT)
 DEF(call, 0, 0, 3, TCG_OPF_CALL_CLOBBER | TCG_OPF_NOT_PRESENT)
 
 DEF(br, 0, 0, 1, TCG_OPF_BB_END)
+DEF(jr, 0, 1, 0, TCG_OPF_BB_END)
 
 #define IMPL(X) (__builtin_constant_p(X) && !(X) ? TCG_OPF_NOT_PRESENT : 0)
 #if TCG_TARGET_REG_BITS == 32
diff --git a/tcg/tcg.c b/tcg/tcg.c
index cb898f1..a7e7842 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1139,6 +1139,7 @@ void tcg_dump_ops(TCGContext *s)
             switch (c) {
             case INDEX_op_set_label:
             case INDEX_op_br:
+            case INDEX_op_jr:
             case INDEX_op_brcond_i32:
             case INDEX_op_brcond_i64:
             case INDEX_op_brcond2_i32:
diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index 838bf3a..63d1a57 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -85,6 +85,7 @@
 #define TCG_TARGET_HAS_muls2_i32        0
 #define TCG_TARGET_HAS_muluh_i32        0
 #define TCG_TARGET_HAS_mulsh_i32        0
+#define TCG_TARGET_HAS_jr               0
 
 #if TCG_TARGET_REG_BITS == 64
 #define TCG_TARGET_HAS_extrl_i64_i32    0
-- 
2.7.4
