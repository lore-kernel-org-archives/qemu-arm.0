Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4224952wrg;
        Tue, 11 Jun 2019 04:21:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwx9sZzglcIgPcr6LUHJMU+6sbIgBKQR5GtjNy+KvR6l135RRhFNDGbGw9sqnYhmnzT2J+Z
X-Received: by 2002:ac8:4705:: with SMTP id f5mr39698748qtp.99.1560252110208;
        Tue, 11 Jun 2019 04:21:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560252110; cv=none;
        d=google.com; s=arc-20160816;
        b=bCZozTyYWc0WNhhYVFKmEBuVpPsvG0jYmUUEOqYTlfptll+LNkZTeuP9P1uYZ/9nPv
         RTIFbW9WIbtaEwe/MA1DsCkPNnAQOlQyTmC1CWVhdWmk/R2pcaXhZ8t0X89REFMwRj3r
         NQ/ho3nyDukuMyLwJkIpSxHBi6O7J9C5Wa0+g6OL5U0Jcarwd8essOs3fuD4E7RBmAnd
         jCh1Pv8NO9jIvu9ajiDU+yMKJfoULftDRoZ7UcUMHwdP4aERaqsmFsjWyNTGpl03TKr8
         De9PdNdWg1iTDkGee2zR2RO6I7vmtfeDsqM3Zkb9jL9gNl5swMV9Axtrtf/6Kt7wkl2i
         1npQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=uk5iEXDvYoBGczcV25RC53cZxZ7Mzp44JNFUSENfzow=;
        b=fY7jm5FXbdgg251YisqYiQcJfhuu626JZ4xbphKCc11DjWxQgF1sUDjcZtCjLWl0Os
         wmcCTdSKvpd/1rmIslSI1beHx0pnQn91ZLsJonVRySjYYB1NcyFnRj7Ko+h/YQjixy8c
         cEP1Ifq81y+zCIX1Vos0roEDTsoT1iv+0vEa3EMsADyXlz4nBQ3C4SwsaTLWa5fss2zs
         F5tEmwVumqbzsXb9Hsc2znGAGB8ZdsXoHnZJ5CuqHeYVlQYVkWWzBu+I32ukqEoiibOh
         s7T30lzUlr3gSkHoWDrRa+IiOsdUKVZbii3d+KH/SLrSSBMV2k2MXbnWF5apBwV9ZC79
         BYgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Xsx5VoJZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y11si4153631qva.106.2019.06.11.04.21.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Jun 2019 04:21:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Xsx5VoJZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56376 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1haeqb-0005Pf-Lp
	for alex.bennee@linaro.org; Tue, 11 Jun 2019 07:21:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39235)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1haeQ0-0007KL-Ta
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 06:54:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1haePu-0007Ta-Jl
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 06:54:20 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:55058)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1haePs-0007PM-DY
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 06:54:14 -0400
Received: by mail-wm1-x344.google.com with SMTP id g135so2421476wme.4
 for <qemu-arm@nongnu.org>; Tue, 11 Jun 2019 03:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uk5iEXDvYoBGczcV25RC53cZxZ7Mzp44JNFUSENfzow=;
 b=Xsx5VoJZFL+8Ngb+L/eqUWkgrv/V+eO8mr/7z9yBT/Vii56/fIj9f02f/Vxj8CQ3GX
 0TkRrtyoHbhwrma7JVd+K3GzbenwOyDJHhhHKYsUk9eUrraD3XYdlHnP8+aqdhEnyOMF
 f05zVIIETdEBRxBc39B4z1UStQ3fJCUW7j+d3OZv5J72YbA55+hE0YkTyjgkgmVINH0M
 iu7q3jlcsejpPuM/0VZt2oONdyXnqvMBgznrelQlrNMilqBc7YsBT3t9NfCE4VKnl/9Q
 2jggfWzomnQ9oVZOs1LyENeoIQt60RU9s8qaIXZmHC0olfZNOUqM4R0CTC/jszkkkQrh
 +Tfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uk5iEXDvYoBGczcV25RC53cZxZ7Mzp44JNFUSENfzow=;
 b=TD/eVrOufdTEH7STyb7AI3aKboHDhpTR8Dj7er/Ae5VnmPcotyviPiYySkaj67O/aa
 WCV4XIrKOsdM8rfd997yAIIoqHVQTIuRles93qfSg0BSmF0YD0pRfu708XOUV6LjYerb
 WVo5bBccOlcfv4q6VmyaUD1tZM0ueBY0qj34KrwVKFKpchxOCBjNkaKxmwenLxkb+vBw
 7UcgRbH/6VwdY2uuGQxYAaoFzKU8Z2LQBvlyvfi1p8UdZdeVaUiRo8Go/+YrNY5U1Jpq
 r2cTR6SFaFKvNElWq+d0BXH2hNGmDay9MY5YMzlk8Urf2FQSFWBhGFPZsxTpmuxFhd1h
 /lDA==
X-Gm-Message-State: APjAAAWglM+k7w3HQTSOwaxmOt+IxHGbu82XhVT/LbipWkYsFoIbNG7z
 50herohLZOX7r7iiNCnuZ+0B6RmHVj+gQQ==
X-Received: by 2002:a1c:e009:: with SMTP id x9mr17207987wmg.5.1560250451095;
 Tue, 11 Jun 2019 03:54:11 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id e17sm10785945wrt.95.2019.06.11.03.54.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 03:54:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 11 Jun 2019 11:53:25 +0100
Message-Id: <20190611105351.9871-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611105351.9871-1-peter.maydell@linaro.org>
References: <20190611105351.9871-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
Subject: [Qemu-arm] [PATCH v2 16/42] target/arm: Convert the VFP load/store
 multiple insns to decodetree
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
X-TUID: eQ2e0EMDotln

Convert the VFP load/store multiple insns to decodetree.
This includes tightening up the UNDEF checking for pre-VFPv3
CPUs which only have D0-D15 : they now UNDEF for any access
to D16-D31, not merely when the smallest register in the
transfer list is in D16-D31.

This conversion does not try to share code between the single
precision and the double precision versions; this looks a bit
duplicative of code, but it leaves the door open for a future
refactoring which gets rid of the use of the "F0" registers
by inlining the various functions like gen_vfp_ld() and
gen_mov_F0_reg() which are hiding "if (dp) { ... } else { ... }"
conditionalisation.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-vfp.inc.c | 162 +++++++++++++++++++++++++++++++++
 target/arm/translate.c         |  97 +-------------------
 target/arm/vfp.decode          |  18 ++++
 3 files changed, 183 insertions(+), 94 deletions(-)

diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
index 40f2cac3e2e..32a1805e582 100644
--- a/target/arm/translate-vfp.inc.c
+++ b/target/arm/translate-vfp.inc.c
@@ -926,3 +926,165 @@ static bool trans_VLDR_VSTR_dp(DisasContext *s, arg_VLDR_VSTR_sp *a)
 
     return true;
 }
+
+static bool trans_VLDM_VSTM_sp(DisasContext *s, arg_VLDM_VSTM_sp *a)
+{
+    uint32_t offset;
+    TCGv_i32 addr;
+    int i, n;
+
+    n = a->imm;
+
+    if (n == 0 || (a->vd + n) > 32) {
+        /*
+         * UNPREDICTABLE cases for bad immediates: we choose to
+         * UNDEF to avoid generating huge numbers of TCG ops
+         */
+        return false;
+    }
+    if (a->rn == 15 && a->w) {
+        /* writeback to PC is UNPREDICTABLE, we choose to UNDEF */
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    if (s->thumb && a->rn == 15) {
+        /* This is actually UNPREDICTABLE */
+        addr = tcg_temp_new_i32();
+        tcg_gen_movi_i32(addr, s->pc & ~2);
+    } else {
+        addr = load_reg(s, a->rn);
+    }
+    if (a->p) {
+        /* pre-decrement */
+        tcg_gen_addi_i32(addr, addr, -(a->imm << 2));
+    }
+
+    if (s->v8m_stackcheck && a->rn == 13 && a->w) {
+        /*
+         * Here 'addr' is the lowest address we will store to,
+         * and is either the old SP (if post-increment) or
+         * the new SP (if pre-decrement). For post-increment
+         * where the old value is below the limit and the new
+         * value is above, it is UNKNOWN whether the limit check
+         * triggers; we choose to trigger.
+         */
+        gen_helper_v8m_stackcheck(cpu_env, addr);
+    }
+
+    offset = 4;
+    for (i = 0; i < n; i++) {
+        if (a->l) {
+            /* load */
+            gen_vfp_ld(s, false, addr);
+            gen_mov_vreg_F0(false, a->vd + i);
+        } else {
+            /* store */
+            gen_mov_F0_vreg(false, a->vd + i);
+            gen_vfp_st(s, false, addr);
+        }
+        tcg_gen_addi_i32(addr, addr, offset);
+    }
+    if (a->w) {
+        /* writeback */
+        if (a->p) {
+            offset = -offset * n;
+            tcg_gen_addi_i32(addr, addr, offset);
+        }
+        store_reg(s, a->rn, addr);
+    } else {
+        tcg_temp_free_i32(addr);
+    }
+
+    return true;
+}
+
+static bool trans_VLDM_VSTM_dp(DisasContext *s, arg_VLDM_VSTM_dp *a)
+{
+    uint32_t offset;
+    TCGv_i32 addr;
+    int i, n;
+
+    n = a->imm >> 1;
+
+    if (n == 0 || (a->vd + n) > 32 || n > 16) {
+        /*
+         * UNPREDICTABLE cases for bad immediates: we choose to
+         * UNDEF to avoid generating huge numbers of TCG ops
+         */
+        return false;
+    }
+    if (a->rn == 15 && a->w) {
+        /* writeback to PC is UNPREDICTABLE, we choose to UNDEF */
+        return false;
+    }
+
+    /* UNDEF accesses to D16-D31 if they don't exist */
+    if (!dc_isar_feature(aa32_fp_d32, s) && (a->vd + n) > 16) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    if (s->thumb && a->rn == 15) {
+        /* This is actually UNPREDICTABLE */
+        addr = tcg_temp_new_i32();
+        tcg_gen_movi_i32(addr, s->pc & ~2);
+    } else {
+        addr = load_reg(s, a->rn);
+    }
+    if (a->p) {
+        /* pre-decrement */
+        tcg_gen_addi_i32(addr, addr, -(a->imm << 2));
+    }
+
+    if (s->v8m_stackcheck && a->rn == 13 && a->w) {
+        /*
+         * Here 'addr' is the lowest address we will store to,
+         * and is either the old SP (if post-increment) or
+         * the new SP (if pre-decrement). For post-increment
+         * where the old value is below the limit and the new
+         * value is above, it is UNKNOWN whether the limit check
+         * triggers; we choose to trigger.
+         */
+        gen_helper_v8m_stackcheck(cpu_env, addr);
+    }
+
+    offset = 8;
+    for (i = 0; i < n; i++) {
+        if (a->l) {
+            /* load */
+            gen_vfp_ld(s, true, addr);
+            gen_mov_vreg_F0(true, a->vd + i);
+        } else {
+            /* store */
+            gen_mov_F0_vreg(true, a->vd + i);
+            gen_vfp_st(s, true, addr);
+        }
+        tcg_gen_addi_i32(addr, addr, offset);
+    }
+    if (a->w) {
+        /* writeback */
+        if (a->p) {
+            offset = -offset * n;
+        } else if (a->imm & 1) {
+            offset = 4;
+        } else {
+            offset = 0;
+        }
+
+        if (offset != 0) {
+            tcg_gen_addi_i32(addr, addr, offset);
+        }
+        store_reg(s, a->rn, addr);
+    } else {
+        tcg_temp_free_i32(addr);
+    }
+
+    return true;
+}
diff --git a/target/arm/translate.c b/target/arm/translate.c
index d954e8de1eb..5a9d0c30d3d 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -3092,9 +3092,8 @@ static void gen_neon_dup_high16(TCGv_i32 var)
  */
 static int disas_vfp_insn(DisasContext *s, uint32_t insn)
 {
-    uint32_t rd, rn, rm, op, i, n, offset, delta_d, delta_m, bank_mask;
+    uint32_t rd, rn, rm, op, i, n, delta_d, delta_m, bank_mask;
     int dp, veclen;
-    TCGv_i32 addr;
     TCGv_i32 tmp;
     TCGv_i32 tmp2;
 
@@ -3702,98 +3701,8 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
         break;
     case 0xc:
     case 0xd:
-        if ((insn & 0x03e00000) == 0x00400000) {
-            /* Already handled by decodetree */
-            return 1;
-        } else {
-            /* Load/store */
-            rn = (insn >> 16) & 0xf;
-            if (dp)
-                VFP_DREG_D(rd, insn);
-            else
-                rd = VFP_SREG_D(insn);
-            if ((insn & 0x01200000) == 0x01000000) {
-                /* Already handled by decodetree */
-                return 1;
-            } else {
-                /* load/store multiple */
-                int w = insn & (1 << 21);
-                if (dp)
-                    n = (insn >> 1) & 0x7f;
-                else
-                    n = insn & 0xff;
-
-                if (w && !(((insn >> 23) ^ (insn >> 24)) & 1)) {
-                    /* P == U , W == 1  => UNDEF */
-                    return 1;
-                }
-                if (n == 0 || (rd + n) > 32 || (dp && n > 16)) {
-                    /* UNPREDICTABLE cases for bad immediates: we choose to
-                     * UNDEF to avoid generating huge numbers of TCG ops
-                     */
-                    return 1;
-                }
-                if (rn == 15 && w) {
-                    /* writeback to PC is UNPREDICTABLE, we choose to UNDEF */
-                    return 1;
-                }
-
-                if (s->thumb && rn == 15) {
-                    /* This is actually UNPREDICTABLE */
-                    addr = tcg_temp_new_i32();
-                    tcg_gen_movi_i32(addr, s->pc & ~2);
-                } else {
-                    addr = load_reg(s, rn);
-                }
-                if (insn & (1 << 24)) /* pre-decrement */
-                    tcg_gen_addi_i32(addr, addr, -((insn & 0xff) << 2));
-
-                if (s->v8m_stackcheck && rn == 13 && w) {
-                    /*
-                     * Here 'addr' is the lowest address we will store to,
-                     * and is either the old SP (if post-increment) or
-                     * the new SP (if pre-decrement). For post-increment
-                     * where the old value is below the limit and the new
-                     * value is above, it is UNKNOWN whether the limit check
-                     * triggers; we choose to trigger.
-                     */
-                    gen_helper_v8m_stackcheck(cpu_env, addr);
-                }
-
-                if (dp)
-                    offset = 8;
-                else
-                    offset = 4;
-                for (i = 0; i < n; i++) {
-                    if (insn & ARM_CP_RW_BIT) {
-                        /* load */
-                        gen_vfp_ld(s, dp, addr);
-                        gen_mov_vreg_F0(dp, rd + i);
-                    } else {
-                        /* store */
-                        gen_mov_F0_vreg(dp, rd + i);
-                        gen_vfp_st(s, dp, addr);
-                    }
-                    tcg_gen_addi_i32(addr, addr, offset);
-                }
-                if (w) {
-                    /* writeback */
-                    if (insn & (1 << 24))
-                        offset = -offset * n;
-                    else if (dp && (insn & 1))
-                        offset = 4;
-                    else
-                        offset = 0;
-
-                    if (offset != 0)
-                        tcg_gen_addi_i32(addr, addr, offset);
-                    store_reg(s, rn, addr);
-                } else {
-                    tcg_temp_free_i32(addr);
-                }
-            }
-        }
-        break;
+        /* Already handled by decodetree */
+        return 1;
     default:
         /* Should never happen.  */
         return 1;
diff --git a/target/arm/vfp.decode b/target/arm/vfp.decode
index 8fa7fa0bead..68c9ffcfd3c 100644
--- a/target/arm/vfp.decode
+++ b/target/arm/vfp.decode
@@ -78,3 +78,21 @@ VLDR_VSTR_sp ---- 1101 u:1 .0 l:1 rn:4 .... 1010 imm:8 \
              vd=%vd_sp
 VLDR_VSTR_dp ---- 1101 u:1 .0 l:1 rn:4 .... 1011 imm:8 \
              vd=%vd_dp
+
+# We split the load/store multiple up into two patterns to avoid
+# overlap with other insns in the "Advanced SIMD load/store and 64-bit move"
+# grouping:
+#   P=0 U=0 W=0 is 64-bit VMOV
+#   P=1 W=0 is VLDR/VSTR
+#   P=U W=1 is UNDEF
+# leaving P=0 U=1 W=x and P=1 U=0 W=1 for load/store multiple.
+# These include FSTM/FLDM.
+VLDM_VSTM_sp ---- 1100 1 . w:1 l:1 rn:4 .... 1010 imm:8 \
+             vd=%vd_sp p=0 u=1
+VLDM_VSTM_dp ---- 1100 1 . w:1 l:1 rn:4 .... 1011 imm:8 \
+             vd=%vd_dp p=0 u=1
+
+VLDM_VSTM_sp ---- 1101 0.1 l:1 rn:4 .... 1010 imm:8 \
+             vd=%vd_sp p=1 u=0 w=1
+VLDM_VSTM_dp ---- 1101 0.1 l:1 rn:4 .... 1011 imm:8 \
+             vd=%vd_dp p=1 u=0 w=1
-- 
2.20.1

