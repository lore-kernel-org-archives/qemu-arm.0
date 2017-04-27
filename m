Received: by 10.25.0.144 with SMTP id 138csp572115lfa;
        Wed, 26 Apr 2017 20:29:28 -0700 (PDT)
X-Received: by 10.55.142.2 with SMTP id q2mr3034527qkd.271.1493263767898;
        Wed, 26 Apr 2017 20:29:27 -0700 (PDT)
Return-Path: <cota@braap.org>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com. [66.111.4.28])
        by mx.google.com with ESMTPS id u30si1580238qta.49.2017.04.26.20.29.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Apr 2017 20:29:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) client-ip=66.111.4.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org;
       dkim=pass header.i=@messagingengine.com;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 415F520881;
	Wed, 26 Apr 2017 23:29:27 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
  by compute4.internal (MEProxy); Wed, 26 Apr 2017 23:29:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:date:from:in-reply-to:message-id:references:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=YWZ
	p5zjnyX5CD7yGmPcc3ex9GgyrgzwnFmTAntYWf7U=; b=ua/F6N7bISRNANo/A9O
	Y7uanIT+gTw+YClv5KFvVYjCp0bLlqIcPhazIGmNfYokY3p2KCniEhMKe9L9DpoG
	jv7Z3+H64h+ik2SeKXCGC8R0uLHL8JlCaVoJA0B4fdci7AaIcE015yU0nSFkNUCc
	JCqXjO5VtZJcCe/pLix4NArE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=fm1; bh=YWZp5zjnyX5CD7yGmPcc3ex9GgyrgzwnFmTAntYWf
	7U=; b=N4P0OBoNttuAtLhpZMaDKm4km3dbCQ2+CHNwYv3diIOkOoveEsK7Ivnly
	9Uw7uYiQff6jh7XE/P+2C5BJw9XeSjwpSgSr9RbZEK8SEv+aqQF72W1yfZ8KH9Ge
	orz3fc2BwogJHs2fyzlQzL0PP1EUerzI9VA/g/uanmh7B9yLCdPuG5kDoP4oRHea
	Mnoe6frmLDTRe1HuL5tuzKZRnWn6N9pbEpixBcGjLUeUlGteFqKBNXB9lvHPaLpV
	H3HVTRoNnv0Uw3uPyBY3yLw3C/F+WU/vna7ezUO0KngCpJa6rNzbIP5NCkPikdez
	KnZd5rENFYSi1fY+iLsf9xI8q9JSQ==
X-ME-Sender: <xms:l2UBWdDXT-hXISSUy1MyDZlCTTj5pXsuqvQ5JrRms1eEqJM8bsRsqg>
X-Sasl-enc: L71IbNy5jSvOXeCQzDyuHFYhaxC+XclUw08PHU7M6/o+ 1493263766
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id EA6997E442;
	Wed, 26 Apr 2017 23:29:26 -0400 (EDT)
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
Subject: [PATCH v4 03/11] tcg: introduce goto_ptr opcode
Date: Wed, 26 Apr 2017 23:29:16 -0400
Message-Id: <1493263764-18657-4-git-send-email-cota@braap.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1493263764-18657-1-git-send-email-cota@braap.org>
References: <1493263764-18657-1-git-send-email-cota@braap.org>
X-TUID: aQz5c+EvuWD7

Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 tcg/aarch64/tcg-target.h | 1 +
 tcg/arm/tcg-target.h     | 1 +
 tcg/i386/tcg-target.h    | 1 +
 tcg/ia64/tcg-target.h    | 1 +
 tcg/mips/tcg-target.h    | 1 +
 tcg/ppc/tcg-target.h     | 1 +
 tcg/s390/tcg-target.h    | 1 +
 tcg/sparc/tcg-target.h   | 1 +
 tcg/tcg-opc.h            | 1 +
 tcg/tci/tcg-target.h     | 1 +
 10 files changed, 10 insertions(+)

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
diff --git a/tcg/tcg-opc.h b/tcg/tcg-opc.h
index f06f894..956fb1e 100644
--- a/tcg/tcg-opc.h
+++ b/tcg/tcg-opc.h
@@ -193,6 +193,7 @@ DEF(insn_start, 0, 0, TLADDR_ARGS * TARGET_INSN_START_WORDS,
     TCG_OPF_NOT_PRESENT)
 DEF(exit_tb, 0, 0, 1, TCG_OPF_BB_END)
 DEF(goto_tb, 0, 0, 1, TCG_OPF_BB_END)
+DEF(goto_ptr, 0, 1, 0, TCG_OPF_BB_END | IMPL(TCG_TARGET_HAS_goto_ptr))
 
 DEF(qemu_ld_i32, 1, TLADDR_ARGS, 1,
     TCG_OPF_CALL_CLOBBER | TCG_OPF_SIDE_EFFECTS)
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
