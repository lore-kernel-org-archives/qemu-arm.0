Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1122581wrp;
        Wed, 4 Sep 2019 12:42:01 -0700 (PDT)
X-Google-Smtp-Source: APXvYqySlM64sBefh/1JSWzCKi6rBIWzLrgVPSSWYNgSAT953+WC9Md8D3JgwoaC+Txtr4dgImMK
X-Received: by 2002:a50:f789:: with SMTP id h9mr31604446edn.139.1567626121265;
        Wed, 04 Sep 2019 12:42:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567626121; cv=none;
        d=google.com; s=arc-20160816;
        b=BPOOLWemsvDdoDDqY7WnW2M+vlWG+UKHaL6qaY59cYsEeAaqnAQw7lrVeQzhbTmbg5
         uJrSswQEwzvFv/on923nzEtgS9pbu/4z7RE/bDFuybSJ1o50HVMAn8u9os6rAzHwSZ/J
         bfnJTpZ2Kr8igomaWvUEr6WHjkV+SGbTYinZsFoca93MPtCtGfe2dQutpbf6i8B5CW8y
         SOpw+5bIVZ1EWVd28XRUwjfoJ8jJUhz2tjfgicZs7em7Y+XZOEHcpKAPNQE9Qr0RNs7f
         YQm5FA/QdgkLmHjX7FHf64jswGCj5+4klJBwO+9aVOJMKDhfMzAt6dJKcCFwNtJM5Tkd
         xIQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=p0cMte2SRC3KsDP3LAvH1k1gjZ4hGiRJKgyQQsOuHnA=;
        b=G00TFiD5WNYrXmxmS/Au+g8TePLXk7mUkXYlGjQMBPMbqaN/T4YUuOFGoIoGe4DUjn
         zA+GP9+dPdekJPwc6UNRLz68IWbwDVf2d4F0fXPYrwtWKtico80xhIKDvlQgSmvxnfl9
         CRUIPRu7MNnf1HYwipkbCERS5Tp+tUEjztjbXiKlpJDvBYMYaCG2z30x3Oh2ryeFN6Ey
         zaEDageKDziXLfNsPYWoZ3Q58hzMJ0MA8PQtk8VCYFkNOYHEKKsNsoIlWrC0MEMkDuPH
         kpup54nKD3gZF9KL3c3BW8IURYORUp9ndvLLUOExZ7+8wq56XTni/Ma7EyS9x19gm/nr
         Z8cw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ld91WBGk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id na3si20961ejb.137.2019.09.04.12.42.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 12:42:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ld91WBGk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5bAF-0006PE-GL
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 15:41:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40014)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i5azx-0004N5-I0
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:31:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i5azv-0002Gm-LX
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:31:21 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:43813)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i5azv-0002Fs-Dz
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:31:19 -0400
Received: by mail-pl1-x642.google.com with SMTP id 4so10033713pld.10
 for <qemu-arm@nongnu.org>; Wed, 04 Sep 2019 12:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=p0cMte2SRC3KsDP3LAvH1k1gjZ4hGiRJKgyQQsOuHnA=;
 b=ld91WBGkyc8h/T2O9bfWaE+zmvsMDDewA2X5eV/oEOMTosAU3Uz9mIHepKWN/7q3Ld
 xxNIg32lhZ2unF63sEytbzpNblpnRB5iCmWRkGGaNYuSQlqvepU0prO0NtJgSN3d1Hd0
 Ph+Vp0hOvFXZsIJzhTDZj09/h5wYpvTB/jKvImVAsCuYieRjKsqUkq3UxhaTTCZyJRxp
 3Vu8Dj7aDWWgqhDVs8XKzvt62t2MZOch2zC7SvZgSbQf8Tf2euKupVXvJT4cODSqg3xQ
 I7JZTgRsDqmeDVYwrOZSxlFPIOZkfSlzxPz5Bt7VBACSP9PvxfcuGu1QEweZsDTVn1pC
 Vcbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=p0cMte2SRC3KsDP3LAvH1k1gjZ4hGiRJKgyQQsOuHnA=;
 b=ou61P0XfLOqBqoC4riba0GLjigCUMxmMMzKTO2hIVGVKLYmCOjD0dvnKLFime+U7VD
 qWk/3m50E18+B5IsuSccXbNw1P2TdJ4JwWUZt1v5oMKO7mUsa3946Fmd3MUnZOVXZDEu
 R8Iubg5ntsp4+JFscfpxmLfN6h/teqzuZ08yFvyO4/vfxqFWcORhxPvnNc558CEa5vjN
 bLkLj7/netftblPHeAbKIZLL2FNRJrgVyyqP7RbTmYT0114dKbgpx3N/pp2r6eqPtXRd
 ynxbvn+JDAqCgXtbGP/+ofuBnToxMMZUqp5oohQLVLjQRZwTEGYWE3ovHo5XtLTMfDpU
 a6hg==
X-Gm-Message-State: APjAAAXWbTtYonshE5Srekd5jg15RhabwAtg0a+gln4WMYS7VtpqdmgN
 YqKBFuxjWXHEZ3TosqFOogWjVA==
X-Received: by 2002:a17:902:8202:: with SMTP id
 x2mr3071331pln.182.1567625478468; 
 Wed, 04 Sep 2019 12:31:18 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f6sm18999174pga.50.2019.09.04.12.31.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 12:31:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  4 Sep 2019 12:30:04 -0700
Message-Id: <20190904193059.26202-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190904193059.26202-1-richard.henderson@linaro.org>
References: <20190904193059.26202-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: [Qemu-arm] [PATCH v4 14/69] target/arm: Convert Cyclic Redundancy
 Check
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pHVPYn9IMd2A

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 121 +++++++++++++++++++----------------------
 target/arm/a32.decode  |   9 +++
 target/arm/t32.decode  |   7 +++
 3 files changed, 72 insertions(+), 65 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 02dd4a2ab8..9d3f31f569 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8320,6 +8320,57 @@ static bool trans_MSR_imm(DisasContext *s, arg_MSR_imm *a)
     return true;
 }
 
+/*
+ * Cyclic Redundancy Check
+ */
+
+static bool op_crc32(DisasContext *s, arg_rrr *a, bool c, MemOp sz)
+{
+    TCGv_i32 t1, t2, t3;
+
+    if (!dc_isar_feature(aa32_crc32, s)) {
+        return false;
+    }
+
+    t1 = load_reg(s, a->rn);
+    t2 = load_reg(s, a->rm);
+    switch (sz) {
+    case MO_8:
+        gen_uxtb(t2);
+        break;
+    case MO_16:
+        gen_uxth(t2);
+        break;
+    case MO_32:
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    t3 = tcg_const_i32(1 << sz);
+    if (c) {
+        gen_helper_crc32c(t1, t1, t2, t3);
+    } else {
+        gen_helper_crc32(t1, t1, t2, t3);
+    }
+    tcg_temp_free_i32(t2);
+    tcg_temp_free_i32(t3);
+    store_reg(s, a->rd, t1);
+    return true;
+}
+
+#define DO_CRC32(NAME, c, sz) \
+static bool trans_##NAME(DisasContext *s, arg_rrr *a)  \
+    { return op_crc32(s, a, c, sz); }
+
+DO_CRC32(CRC32B, false, MO_8)
+DO_CRC32(CRC32H, false, MO_16)
+DO_CRC32(CRC32W, false, MO_32)
+DO_CRC32(CRC32CB, true, MO_8)
+DO_CRC32(CRC32CH, true, MO_16)
+DO_CRC32(CRC32CW, true, MO_32)
+
+#undef DO_CRC32
+
 /*
  * Miscellaneous instructions
  */
@@ -8735,39 +8786,9 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
             gen_bx(s, tmp);
             break;
         case 0x4:
-        {
-            /* crc32/crc32c */
-            uint32_t c = extract32(insn, 8, 4);
-
-            /* Check this CPU supports ARMv8 CRC instructions.
-             * op1 == 3 is UNPREDICTABLE but handle as UNDEFINED.
-             * Bits 8, 10 and 11 should be zero.
-             */
-            if (!dc_isar_feature(aa32_crc32, s) || op1 == 0x3 || (c & 0xd) != 0) {
-                goto illegal_op;
-            }
-
-            rn = extract32(insn, 16, 4);
-            rd = extract32(insn, 12, 4);
-
-            tmp = load_reg(s, rn);
-            tmp2 = load_reg(s, rm);
-            if (op1 == 0) {
-                tcg_gen_andi_i32(tmp2, tmp2, 0xff);
-            } else if (op1 == 1) {
-                tcg_gen_andi_i32(tmp2, tmp2, 0xffff);
-            }
-            tmp3 = tcg_const_i32(1 << op1);
-            if (c & 0x2) {
-                gen_helper_crc32c(tmp, tmp, tmp2, tmp3);
-            } else {
-                gen_helper_crc32(tmp, tmp, tmp2, tmp3);
-            }
-            tcg_temp_free_i32(tmp2);
-            tcg_temp_free_i32(tmp3);
-            store_reg(s, rd, tmp);
-            break;
-        }
+            /* crc32 */
+            /* All done in decodetree.  Illegal ops reach here.  */
+            goto illegal_op;
         case 0x5:
             /* Saturating addition and subtraction.  */
             /* All done in decodetree.  Reach here for illegal ops.  */
@@ -10216,16 +10237,13 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                         goto illegal_op;
                     }
                     break;
-                case 0x20: /* crc32/crc32c */
+                case 0x20: /* crc32/crc32c, in decodetree */
                 case 0x21:
                 case 0x22:
                 case 0x28:
                 case 0x29:
                 case 0x2a:
-                    if (!dc_isar_feature(aa32_crc32, s)) {
-                        goto illegal_op;
-                    }
-                    break;
+                    goto illegal_op;
                 default:
                     goto illegal_op;
                 }
@@ -10254,33 +10272,6 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                 case 0x18: /* clz */
                     tcg_gen_clzi_i32(tmp, tmp, 32);
                     break;
-                case 0x20:
-                case 0x21:
-                case 0x22:
-                case 0x28:
-                case 0x29:
-                case 0x2a:
-                {
-                    /* crc32/crc32c */
-                    uint32_t sz = op & 0x3;
-                    uint32_t c = op & 0x8;
-
-                    tmp2 = load_reg(s, rm);
-                    if (sz == 0) {
-                        tcg_gen_andi_i32(tmp2, tmp2, 0xff);
-                    } else if (sz == 1) {
-                        tcg_gen_andi_i32(tmp2, tmp2, 0xffff);
-                    }
-                    tmp3 = tcg_const_i32(1 << sz);
-                    if (c) {
-                        gen_helper_crc32c(tmp, tmp, tmp2, tmp3);
-                    } else {
-                        gen_helper_crc32(tmp, tmp, tmp2, tmp3);
-                    }
-                    tcg_temp_free_i32(tmp2);
-                    tcg_temp_free_i32(tmp3);
-                    break;
-                }
                 default:
                     g_assert_not_reached();
                 }
diff --git a/target/arm/a32.decode b/target/arm/a32.decode
index 6ee12c1140..a8ef435b15 100644
--- a/target/arm/a32.decode
+++ b/target/arm/a32.decode
@@ -182,6 +182,15 @@ SMULTT           .... 0001 0110 .... 0000 .... 1110 ....      @rd0mn
 }
 MSR_imm          .... 0011 0110 .... 1111 .... .... ....      @msr_i r=1
 
+# Cyclic Redundancy Check
+
+CRC32B           .... 0001 0000 .... .... 0000 0100 ....      @rndm
+CRC32H           .... 0001 0010 .... .... 0000 0100 ....      @rndm
+CRC32W           .... 0001 0100 .... .... 0000 0100 ....      @rndm
+CRC32CB          .... 0001 0000 .... .... 0010 0100 ....      @rndm
+CRC32CH          .... 0001 0010 .... .... 0010 0100 ....      @rndm
+CRC32CW          .... 0001 0100 .... .... 0010 0100 ....      @rndm
+
 # Miscellaneous instructions
 
 %sysm            8:1 16:4
diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index 98b682e7ec..261db100ff 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -172,6 +172,13 @@ QSUB             1111 1010 1000 .... 1111 .... 1010 ....      @rndm
 QDADD            1111 1010 1000 .... 1111 .... 1001 ....      @rndm
 QDSUB            1111 1010 1000 .... 1111 .... 1011 ....      @rndm
 
+CRC32B           1111 1010 1100 .... 1111 .... 1000 ....      @rndm
+CRC32H           1111 1010 1100 .... 1111 .... 1001 ....      @rndm
+CRC32W           1111 1010 1100 .... 1111 .... 1010 ....      @rndm
+CRC32CB          1111 1010 1101 .... 1111 .... 1000 ....      @rndm
+CRC32CH          1111 1010 1101 .... 1111 .... 1001 ....      @rndm
+CRC32CW          1111 1010 1101 .... 1111 .... 1010 ....      @rndm
+
 # Branches and miscellaneous control
 
 %msr_sysm        4:1 8:4
-- 
2.17.1

