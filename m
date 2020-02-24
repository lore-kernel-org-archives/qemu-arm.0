Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp581447lfg;
        Mon, 24 Feb 2020 09:30:40 -0800 (PST)
X-Google-Smtp-Source: APXvYqzJO4tuCYqwy0VhvdKBco61cXtdld+dj1lUgXrplfriTMhUDuaB1CGetwWd/nKk8R7Ehdv9
X-Received: by 2002:a37:4743:: with SMTP id u64mr36319860qka.289.1582565440732;
        Mon, 24 Feb 2020 09:30:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582565440; cv=none;
        d=google.com; s=arc-20160816;
        b=mLD3joXvyloKG3HuVPMVMHynJ0LhWn2uS4bvSMNsJXTCEw+iGPaL7HVykfFr7cJ01w
         jAIApKttG/ejXW03i6QOvp/DG9VurHeDroMsPWdYlRONG8cSneM2ng6nXv5pl+FHMFb1
         ebyjEkmVBIeuIMqBtf4BzOZU+Q1YrKyy1C9/J2PanfZRBSQoPuM2uDfF+5BuKiLRehgf
         EWjbFimmzda3O3ujmY7uQQ3HlqnqS7cv3tOh/srCst7JMQTHnZFhoC8rZDbmdwSIp0iE
         MIF7mrqnni3FlYcg+QJhWi9S2XaU+e8UCUvYnirf+Jw4cyzubNvqjSRAFGsvGmxPWJVp
         q1qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=92NgpQrkiwXdLR6m9f4lwlJDB0/iL3FAcGfJeJ1OSeE=;
        b=FTzZqt18f0yxwD90ozbbsSw5wUGAfnt6Rdn+GM5ZhMzV2DLlFxGcOoYx9Fd+blmGn/
         38SzVwi7WUMd9mnoTTOdNOcBgpX/gjPEGsVOEy3HJyX9ShKli/QpIZMqzbqd872L2Nd/
         jiAGbLW92Tfii3+wd4lJEcgNMmkQFK1Gi/6qorSygpE5A7ga+ezJ+Xnc3PprFcoedmHT
         Mh9OXWRPDYmqXnqVpzrg8RgA0omcfg482Esheo+kb1x8CHAbjoMIl0XKzrwpmwTWUYzD
         MIbG+lxUJYqfWl04Qs5HV+Jo+/bhh2gDRFadUPXcWmiXWFoykCyy/1NDufNkWYh8aG5k
         GfIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eRGTvVPO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w9si5917589qkf.49.2020.02.24.09.30.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 09:30:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eRGTvVPO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6HZ2-0000vp-2n
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 12:30:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50860)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j6HXK-00079m-Uh
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 12:28:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j6HXJ-0001Wo-J2
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 12:28:54 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:46168)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j6HXJ-0001Us-Cu
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 12:28:53 -0500
Received: by mail-wr1-x443.google.com with SMTP id g4so5020934wro.13
 for <qemu-arm@nongnu.org>; Mon, 24 Feb 2020 09:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=92NgpQrkiwXdLR6m9f4lwlJDB0/iL3FAcGfJeJ1OSeE=;
 b=eRGTvVPOKpadiRddVdAc/39vwvj6JekugnDNMGfclSgPzh/JORPl5pVLqlUGde/zW/
 1foac1DRdTahagmA/lsdLjhrYeGOvRjMuBSd99o9rFcKxI4zbiQUTvAoDzqvbpTwHygr
 lYto+cLhlMWRw+eKXazRcpRLiPJ/vXiNK3Q1aaic79KUOyQYt2Mb/iF5LEJB2QucBHEs
 xv0aPBXmm2PZqNGKmbwKvrOrcL8JCoNsjz9Iu9qBcySVnRfHTxqHVAq6WK0s9s236efZ
 vgVj06dlNZGrZG+bdURdOb5RsVWl8sy+kU4Hd/sn+vVsO+L6JEe7vMTWZs3YrBz4Stlq
 14Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=92NgpQrkiwXdLR6m9f4lwlJDB0/iL3FAcGfJeJ1OSeE=;
 b=ms+/TLCV277ttSuVpaCOY1ptzmawuB9dOlggqt1icr8Hiv5CbQ5s7TWdrjQsh+Q5TT
 5Rm/TJTfBLIiALvdfl38Csknmucs4EMV95r4UUOaUQASJNSkJwZGqKZbbrmFPCui5Ubw
 qngYnciHX+fdx5jWaC1nz5NmjHZMxoHZBvcucbEUqiESPQcxkItQWT4P/1EuteFXvJcE
 y2cZjAKKZnqyCDNVhwp8J0s4fSzL8PWypgOh5Y818NdgSXeWQmdSrK5cFQvJcagwTRv0
 D0AiSw32Xu0QccTzuifOrdBOwq1EUsgLFmaquG1ytcN5eHX4F4hM1DY3DPrXBRSBeiXg
 X+9Q==
X-Gm-Message-State: APjAAAVjkhfIxZK4ii+PeWZncEG7qSTJwud2Qv7Hgx9E8Ns5+jaxzQ4Y
 FkC7J7O4XncD73Jl4E4+wtPyN7t/EexEAw==
X-Received: by 2002:a5d:4750:: with SMTP id o16mr67016309wrs.91.1582565332099; 
 Mon, 24 Feb 2020 09:28:52 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b10sm60652wmj.48.2020.02.24.09.28.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 09:28:51 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 3/3] target/arm: Implement v8.4-RCPC
Date: Mon, 24 Feb 2020 17:28:46 +0000
Message-Id: <20200224172846.13053-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200224172846.13053-1-peter.maydell@linaro.org>
References: <20200224172846.13053-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: R4WH6o0weBeM

The v8.4-RCPC extension implements some new instructions:
 * LDAPUR, LDAPURB, LDAPURH, LDAPRSB, LDAPRSH, LDAPRSW
 * STLUR, STLURB, STLURH

These are all in a new subgroup of encodings that sits below the
top-level "Loads and Stores" group in the Arm ARM.

The STLUR* instructions have standard store-release semantics; the
LDAPUR* have Load-AcquirePC semantics, but (as with LDAPR*) we choose
to implement them as the slightly stronger Load-Acquire.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h           |  5 +++
 linux-user/elfload.c       |  1 +
 target/arm/cpu64.c         |  2 +-
 target/arm/translate-a64.c | 90 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 97 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 59b467a44bf..3ce453f1e01 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3732,6 +3732,11 @@ static inline bool isar_feature_aa64_rcpc_8_3(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, LRCPC) != 0;
 }
 
+static inline bool isar_feature_aa64_rcpc_8_4(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, LRCPC) >= 2;
+}
+
 /*
  * Feature tests for "does this exist in either 32-bit or 64-bit?"
  */
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index a0ffbc8861d..94ec3dcab8f 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -659,6 +659,7 @@ static uint32_t get_elf_hwcap(void)
     GET_FEATURE_ID(aa64_condm_4, ARM_HWCAP_A64_FLAGM);
     GET_FEATURE_ID(aa64_dcpop, ARM_HWCAP_A64_DCPOP);
     GET_FEATURE_ID(aa64_rcpc_8_3, ARM_HWCAP_A64_LRCPC);
+    GET_FEATURE_ID(aa64_rcpc_8_4, ARM_HWCAP_A64_ILRCPC);
 
     return hwcaps;
 }
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 59b7c574e35..6aace57e4e2 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -657,7 +657,7 @@ static void aarch64_max_initfn(Object *obj)
         t = FIELD_DP64(t, ID_AA64ISAR1, SB, 1);
         t = FIELD_DP64(t, ID_AA64ISAR1, SPECRES, 1);
         t = FIELD_DP64(t, ID_AA64ISAR1, FRINTTS, 1);
-        t = FIELD_DP64(t, ID_AA64ISAR1, LRCPC, 1); /* ARMv8.3-RCPC */
+        t = FIELD_DP64(t, ID_AA64ISAR1, LRCPC, 2); /* ARMv8.4-RCPC */
         cpu->isar.id_aa64isar1 = t;
 
         t = cpu->isar.id_aa64pfr0;
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 7a066fb7cb2..579180af0a9 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -3283,6 +3283,88 @@ static void disas_ldst_pac(DisasContext *s, uint32_t insn,
     }
 }
 
+/*
+ * LDAPR/STLR (unscaled immediate)
+ *
+ *  31  30            24    22  21       12    10    5     0
+ * +------+-------------+-----+---+--------+-----+----+-----+
+ * | size | 0 1 1 0 0 1 | opc | 0 |  imm9  | 0 0 | Rn |  Rt |
+ * +------+-------------+-----+---+--------+-----+----+-----+
+ *
+ * Rt: source or destination register
+ * Rn: base register
+ * imm9: unscaled immediate offset
+ * opc: 00: STLUR*, 01/10/11: various LDAPUR*
+ * size: size of load/store
+ */
+static void disas_ldst_ldapr_stlr(DisasContext *s, uint32_t insn)
+{
+    int rt = extract32(insn, 0, 5);
+    int rn = extract32(insn, 5, 5);
+    int offset = sextract32(insn, 12, 9);
+    int opc = extract32(insn, 22, 2);
+    int size = extract32(insn, 30, 2);
+    TCGv_i64 clean_addr, dirty_addr;
+    bool is_store = false;
+    bool is_signed = false;
+    bool extend = false;
+    bool iss_sf;
+
+    if (!dc_isar_feature(aa64_rcpc_8_4, s)) {
+        unallocated_encoding(s);
+        return;
+    }
+
+    switch (opc) {
+    case 0: /* STLURB */
+        is_store = true;
+        break;
+    case 1: /* LDAPUR* */
+        break;
+    case 2: /* LDAPURS* 64-bit variant */
+        if (size == 3) {
+            unallocated_encoding(s);
+            return;
+        }
+        is_signed = true;
+        break;
+    case 3: /* LDAPURS* 32-bit variant */
+        if (size > 1) {
+            unallocated_encoding(s);
+            return;
+        }
+        is_signed = true;
+        extend = true; /* zero-extend 32->64 after signed load */
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    iss_sf = disas_ldst_compute_iss_sf(size, is_signed, opc);
+
+    if (rn == 31) {
+        gen_check_sp_alignment(s);
+    }
+
+    dirty_addr = read_cpu_reg_sp(s, rn, 1);
+    tcg_gen_addi_i64(dirty_addr, dirty_addr, offset);
+    clean_addr = clean_data_tbi(s, dirty_addr);
+
+    if (is_store) {
+        /* Store-Release semantics */
+        tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
+        do_gpr_st(s, cpu_reg(s, rt), clean_addr, size, true, rt, iss_sf, true);
+    } else {
+        /*
+         * Load-AcquirePC semantics; we implement as the slightly more
+         * restrictive Load-Acquire.
+         */
+        do_gpr_ld(s, cpu_reg(s, rt), clean_addr, size, is_signed, extend,
+                  true, rt, iss_sf, true);
+        tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
+    }
+}
+
 /* Load/store register (all forms) */
 static void disas_ldst_reg(DisasContext *s, uint32_t insn)
 {
@@ -3634,6 +3716,14 @@ static void disas_ldst(DisasContext *s, uint32_t insn)
     case 0x0d: /* AdvSIMD load/store single structure */
         disas_ldst_single_struct(s, insn);
         break;
+    case 0x19: /* LDAPR/STLR (unscaled immediate) */
+        if (extract32(insn, 10, 2) != 0 ||
+            extract32(insn, 21, 1) != 0) {
+            unallocated_encoding(s);
+            break;
+        }
+        disas_ldst_ldapr_stlr(s, insn);
+        break;
     default:
         unallocated_encoding(s);
         break;
-- 
2.20.1

