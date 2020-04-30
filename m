Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp2198409lfm;
        Thu, 30 Apr 2020 11:15:37 -0700 (PDT)
X-Google-Smtp-Source: APiQypLyoJl3xO7iT68wa+ASLFw0qGGbFH6lnbkiEwSXIVIAv7MVo+/RWxG51DhesdXV6qQ1rPHK
X-Received: by 2002:ac8:6f0d:: with SMTP id g13mr4992211qtv.328.1588270536827;
        Thu, 30 Apr 2020 11:15:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588270536; cv=none;
        d=google.com; s=arc-20160816;
        b=H4zviP6KS7ZjwEhzZZJ7eoU3PPxpQRWxiHSneYgub8OF7ijoNy4gWxExUvwFZVW6i5
         UsfjzEpwzK+Mj5sTNfmdTwRgpqtkLSxm0jpiGRT5OUeQy7Mp1Ulm4F/GwT9eawEffkNz
         kCk8ho+GzpUPerSzKE6PN2gI/fc36AXvmFPUgvr21+otjCm4ijfIifX9Lo+8Ctw8ENa1
         EBWOKF85A+puaEa4g/y9SakjtFiObCXSxhqgCJbh91yB54bN0wAbDSAIPtidOXz1+JpT
         /nN/YWibLceyvERSej0+hbKNxUlhIJ00VJx3PhB9xg4BBwLFblI3q1F6g5xsGRwitufu
         PhSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=eBspgQk++mtdWViFX+jGsC5B+/dbLN5PYD4I61Sc2EE=;
        b=HJikgaBf0JnaDpXfVN1ltM5yWigOPzD6GjxNKUU1dzawbcI6mA3q73BvZ2lltAkP6J
         EEIbK3+C99MPQFnC5QQPxr1Lmw6h4sv/i4fV7IXUIzKL+XpEsIfD1Sw9xHUaRVPAdMeE
         8UzNKGWavVAbVQ96bBJpuVXb49AAKS4DP82c8y0NUHYIxWNkFIV2AJLOt189LdQVd/84
         Mt3GCscTKPk0LM3f+Wqxz3tFzZIPsyF5mGclb+y1rE8PQFTaoGUgRvepdGDZ7RVpa1VO
         UbbkZQa2o9Cncl/EA2AFZkIbZOyOZ1R6UmgEVGz7fSP4stT8HOlD5U2L6UHNtBWHi1wQ
         n81g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zl76gNt2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id c68si182465qke.281.2020.04.30.11.15.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Apr 2020 11:15:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zl76gNt2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jUDih-0000ol-Pj
	for alex.bennee@linaro.org; Thu, 30 Apr 2020 14:15:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36282)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jUDeD-0001do-Lr
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 14:11:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jUDdh-00014M-AB
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 14:10:57 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:46202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jUDdg-0000zQ-Rm
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 14:10:24 -0400
Received: by mail-wr1-x429.google.com with SMTP id f13so8124435wrm.13
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2020 11:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eBspgQk++mtdWViFX+jGsC5B+/dbLN5PYD4I61Sc2EE=;
 b=zl76gNt2QiZpPrDaUCtRXW/Ki2/35vwiYTdmmXddmdEx1cJNaIv17Rr3ld+uE8Q+CS
 VT+m+wHFstbnea0wtce62sdTj5QQsff1LjIFjDuQX7VyjtnCM1d3uikOlBgGhEszhusD
 mtACQViSSwlHC/zRgFN7S3LbZ5wC0X8sfMVgpXu8vUPZTjl0i7LhSj7oZy0C0Emxrvel
 0nQLrBiibZoljhlWtHuey3f7ZAiYNd1AkrlKPyCEPeKdXI7TRlXYt6oCxZESuoSBNQWJ
 R+9j0zwcDI7gRHaHl29wIQVhATOsQpUpK4enxmKzf/SOOXL3+8rRs51X4KxGiqoE4L72
 CMhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eBspgQk++mtdWViFX+jGsC5B+/dbLN5PYD4I61Sc2EE=;
 b=hml3u5xE48D0LRiA39Pnj5Greccb8/Uv5CZpwj70/xqHe6fslvjwC5cl3CDiVaKO48
 Q88wJPl9RwO/uB2PYIDiDDh51sT77GpQymsdIwJ48NwyBnu61OARbMcMvupS068q3Uso
 Re01YkWM/VvRAPXebc4Qb6FmzBCng/J5js8uTf9KxWrQaDgniWl/lUGqEwXEJtgOE14K
 ph9aB/sQdNpoNrYqB0xKqgFAxyXoT/9dOTnOsaYn1EUlYYkqH4LAlTU26J+ReQ+OVFX2
 7K0g81LrB7BeruCt63XIVVQTRUm5CpawqRT3guUbeiGWEPcFFpvChFmm+Qx402Jyn0qk
 Eg+w==
X-Gm-Message-State: AGi0PuYItho7XMzwy5JdPRA1QiAwhpedg0tab+emEAtAAjDvD/KbmwkP
 MWv89m4jXVaLEuEzKhQ8gWnMmtHeFFNDwg==
X-Received: by 2002:adf:fd0a:: with SMTP id e10mr5444300wrr.160.1588270222903; 
 Thu, 30 Apr 2020 11:10:22 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id t8sm652421wrq.88.2020.04.30.11.10.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 11:10:22 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 13/36] target/arm: Convert Neon 'load/store single structure'
 to decodetree
Date: Thu, 30 Apr 2020 19:09:40 +0100
Message-Id: <20200430181003.21682-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200430181003.21682-1-peter.maydell@linaro.org>
References: <20200430181003.21682-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::429
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
X-TUID: JxIZBKti86/p

Convert the Neon "load/store single structure to one lane" insns to
decodetree.

As this is the last set of insns in the neon load/store group,
we can remove the whole disas_neon_ls_insn() function.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-neon.inc.c |  89 +++++++++++++++++++
 target/arm/translate.c          | 147 --------------------------------
 target/arm/neon-ls.decode       |  11 +++
 3 files changed, 100 insertions(+), 147 deletions(-)

diff --git a/target/arm/translate-neon.inc.c b/target/arm/translate-neon.inc.c
index e60e9559bad..c881d1cf607 100644
--- a/target/arm/translate-neon.inc.c
+++ b/target/arm/translate-neon.inc.c
@@ -26,6 +26,11 @@
  * It might be possible to convert it to a standalone .c file eventually.
  */
 
+static inline int plus1(DisasContext *s, int x)
+{
+    return x + 1;
+}
+
 /* Include the generated Neon decoder */
 #include "decode-neon-dp.inc.c"
 #include "decode-neon-ls.inc.c"
@@ -471,3 +476,87 @@ static bool trans_VLD_all_lanes(DisasContext *s, arg_VLD_all_lanes *a)
 
     return true;
 }
+
+static bool trans_VLDST_single(DisasContext *s, arg_VLDST_single *a)
+{
+    /* Neon load/store single structure to one lane */
+    int reg;
+    int nregs = a->n + 1;
+    int vd = a->vd;
+    TCGv_i32 addr, tmp;
+
+    if (!arm_dc_feature(s, ARM_FEATURE_NEON)) {
+        return false;
+    }
+
+    /* UNDEF accesses to D16-D31 if they don't exist */
+    if (!dc_isar_feature(aa32_simd_r32, s) && (a->vd & 0x10)) {
+        return false;
+    }
+
+    /* Catch the UNDEF cases. This is unavoidably a bit messy. */
+    switch (nregs) {
+    case 1:
+        if (((a->align & (1 << a->size)) != 0) ||
+            (a->size == 2 && ((a->align & 3) == 1 || (a->align & 3) == 2))) {
+            return false;
+        }
+        break;
+    case 3:
+        if ((a->align & 1) != 0) {
+            return false;
+        }
+        /* fall through */
+    case 2:
+        if (a->size == 2 && (a->align & 2) != 0) {
+            return false;
+        }
+        break;
+    case 4:
+        if ((a->size == 2) && ((a->align & 3) == 3)) {
+            return false;
+        }
+        break;
+    default:
+        abort();
+    }
+    if ((vd + a->stride * (nregs - 1)) > 31) {
+        /*
+         * Attempts to write off the end of the register file are
+         * UNPREDICTABLE; we choose to UNDEF because otherwise we would
+         * access off the end of the array that holds the register data.
+         */
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    tmp = tcg_temp_new_i32();
+    addr = tcg_temp_new_i32();
+    load_reg_var(s, addr, a->rn);
+    /*
+     * TODO: if we implemented alignment exceptions, we should check
+     * addr against the alignment encoded in a->align here.
+     */
+    for (reg = 0; reg < nregs; reg++) {
+        if (a->l) {
+            gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s),
+                            s->be_data | a->size);
+            neon_store_element(vd, a->reg_idx, a->size, tmp);
+        } else { /* Store */
+            neon_load_element(tmp, vd, a->reg_idx, a->size);
+            gen_aa32_st_i32(s, tmp, addr, get_mem_index(s),
+                            s->be_data | a->size);
+        }
+        vd += a->stride;
+        tcg_gen_addi_i32(addr, addr, 1 << a->size);
+    }
+    tcg_temp_free_i32(addr);
+    tcg_temp_free_i32(tmp);
+
+    gen_neon_ldst_base_update(s, a->rm, a->rn, (1 << a->size) * nregs);
+
+    return true;
+}
diff --git a/target/arm/translate.c b/target/arm/translate.c
index a9cad04ba91..8c059af0e7e 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -3213,140 +3213,6 @@ static void gen_neon_trn_u16(TCGv_i32 t0, TCGv_i32 t1)
     tcg_temp_free_i32(rd);
 }
 
-
-/* Translate a NEON load/store element instruction.  Return nonzero if the
-   instruction is invalid.  */
-static int disas_neon_ls_insn(DisasContext *s, uint32_t insn)
-{
-    int rd, rn, rm;
-    int nregs;
-    int stride;
-    int size;
-    int reg;
-    int load;
-    TCGv_i32 addr;
-    TCGv_i32 tmp;
-
-    if (!arm_dc_feature(s, ARM_FEATURE_NEON)) {
-        return 1;
-    }
-
-    /* FIXME: this access check should not take precedence over UNDEF
-     * for invalid encodings; we will generate incorrect syndrome information
-     * for attempts to execute invalid vfp/neon encodings with FP disabled.
-     */
-    if (s->fp_excp_el) {
-        gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
-                           syn_simd_access_trap(1, 0xe, false), s->fp_excp_el);
-        return 0;
-    }
-
-    if (!s->vfp_enabled)
-      return 1;
-    VFP_DREG_D(rd, insn);
-    rn = (insn >> 16) & 0xf;
-    rm = insn & 0xf;
-    load = (insn & (1 << 21)) != 0;
-    if ((insn & (1 << 23)) == 0) {
-        /* Load store all elements -- handled already by decodetree */
-        return 1;
-    } else {
-        size = (insn >> 10) & 3;
-        if (size == 3) {
-            /* Load single element to all lanes -- handled by decodetree  */
-            return 1;
-        } else {
-            /* Single element.  */
-            int idx = (insn >> 4) & 0xf;
-            int reg_idx;
-            switch (size) {
-            case 0:
-                reg_idx = (insn >> 5) & 7;
-                stride = 1;
-                break;
-            case 1:
-                reg_idx = (insn >> 6) & 3;
-                stride = (insn & (1 << 5)) ? 2 : 1;
-                break;
-            case 2:
-                reg_idx = (insn >> 7) & 1;
-                stride = (insn & (1 << 6)) ? 2 : 1;
-                break;
-            default:
-                abort();
-            }
-            nregs = ((insn >> 8) & 3) + 1;
-            /* Catch the UNDEF cases. This is unavoidably a bit messy. */
-            switch (nregs) {
-            case 1:
-                if (((idx & (1 << size)) != 0) ||
-                    (size == 2 && ((idx & 3) == 1 || (idx & 3) == 2))) {
-                    return 1;
-                }
-                break;
-            case 3:
-                if ((idx & 1) != 0) {
-                    return 1;
-                }
-                /* fall through */
-            case 2:
-                if (size == 2 && (idx & 2) != 0) {
-                    return 1;
-                }
-                break;
-            case 4:
-                if ((size == 2) && ((idx & 3) == 3)) {
-                    return 1;
-                }
-                break;
-            default:
-                abort();
-            }
-            if ((rd + stride * (nregs - 1)) > 31) {
-                /* Attempts to write off the end of the register file
-                 * are UNPREDICTABLE; we choose to UNDEF because otherwise
-                 * the neon_load_reg() would write off the end of the array.
-                 */
-                return 1;
-            }
-            tmp = tcg_temp_new_i32();
-            addr = tcg_temp_new_i32();
-            load_reg_var(s, addr, rn);
-            for (reg = 0; reg < nregs; reg++) {
-                if (load) {
-                    gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s),
-                                    s->be_data | size);
-                    neon_store_element(rd, reg_idx, size, tmp);
-                } else { /* Store */
-                    neon_load_element(tmp, rd, reg_idx, size);
-                    gen_aa32_st_i32(s, tmp, addr, get_mem_index(s),
-                                    s->be_data | size);
-                }
-                rd += stride;
-                tcg_gen_addi_i32(addr, addr, 1 << size);
-            }
-            tcg_temp_free_i32(addr);
-            tcg_temp_free_i32(tmp);
-            stride = nregs * (1 << size);
-        }
-    }
-    if (rm != 15) {
-        TCGv_i32 base;
-
-        base = load_reg(s, rn);
-        if (rm == 13) {
-            tcg_gen_addi_i32(base, base, stride);
-        } else {
-            TCGv_i32 index;
-            index = load_reg(s, rm);
-            tcg_gen_add_i32(base, base, index);
-            tcg_temp_free_i32(index);
-        }
-        store_reg(s, rn, base);
-    }
-    return 0;
-}
-
 static inline void gen_neon_narrow(int size, TCGv_i32 dest, TCGv_i64 src)
 {
     switch (size) {
@@ -10596,13 +10462,6 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
             }
             return;
         }
-        if ((insn & 0x0f100000) == 0x04000000) {
-            /* NEON load/store.  */
-            if (disas_neon_ls_insn(s, insn)) {
-                goto illegal_op;
-            }
-            return;
-        }
         if ((insn & 0x0e000f00) == 0x0c000100) {
             if (arm_dc_feature(s, ARM_FEATURE_IWMMXT)) {
                 /* iWMMXt register transfer.  */
@@ -10807,12 +10666,6 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
         }
         break;
     case 12:
-        if ((insn & 0x01100000) == 0x01000000) {
-            if (disas_neon_ls_insn(s, insn)) {
-                goto illegal_op;
-            }
-            break;
-        }
         goto illegal_op;
     default:
     illegal_op:
diff --git a/target/arm/neon-ls.decode b/target/arm/neon-ls.decode
index f0ab6d2c987..c7b03a72e8d 100644
--- a/target/arm/neon-ls.decode
+++ b/target/arm/neon-ls.decode
@@ -39,3 +39,14 @@ VLDST_multiple 1111 0100 0 . l:1 0 rn:4 .... itype:4 size:2 align:2 rm:4 \
 
 VLD_all_lanes  1111 0100 1 . 1 0 rn:4 .... 11 n:2 size:2 t:1 a:1 rm:4 \
                vd=%vd_dp
+
+# Neon load/store single structure to one lane
+%imm1_5_p1 5:1 !function=plus1
+%imm1_6_p1 6:1 !function=plus1
+
+VLDST_single   1111 0100 1 . l:1 0 rn:4 .... 00 n:2 reg_idx:3 align:1 rm:4 \
+               vd=%vd_dp size=0 stride=1
+VLDST_single   1111 0100 1 . l:1 0 rn:4 .... 01 n:2 reg_idx:2 align:2 rm:4 \
+               vd=%vd_dp size=1 stride=%imm1_5_p1
+VLDST_single   1111 0100 1 . l:1 0 rn:4 .... 10 n:2 reg_idx:1 align:3 rm:4 \
+               vd=%vd_dp size=2 stride=%imm1_6_p1
-- 
2.20.1

