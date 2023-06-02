Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp1232237ejb;
        Fri, 2 Jun 2023 08:53:40 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6lU/PTQVrfxoKF+N3vQA+UZlsEvpOjeNhcIv3lHni5BHmicyAsLAx0agRx0jUuV29pnCXe
X-Received: by 2002:a05:6214:e4b:b0:615:a18b:d5af with SMTP id o11-20020a0562140e4b00b00615a18bd5afmr14196841qvc.35.1685721220485;
        Fri, 02 Jun 2023 08:53:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685721220; cv=none;
        d=google.com; s=arc-20160816;
        b=u4G8a0xFySKWgXHWrlG4m7yk3eoeu5lfvbDmj6/qPj8qtl8aOb/HZoGzIy969p3S67
         yQupUYcEgIH7SSROzOPsaYJf5HNKLZ+7OdHNQ+ZeluZc5qo39pDQqx54c0d/XM0HAzOg
         0n8ZteM50G/zkIXI8hgpqUwMDJEHM5sJvD1Z+mI1+N7l9ByVKDnXNBR+N4EsDX864k8l
         E+dHD898DtvNq/F0fsv+G/e4s/V8p7m7wa/kFJfoIFrKdXQuw0FStq+tahTkHCKHbaum
         RPyg4GOUVOU04i4D7pExW+lIkc8w4TI8gyVIIED9yQgwfLMmKRcep7n8Rq9RfnwkMD7h
         QGjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=WkGtrZrBF/XjQ2tvFCNg0zZgeoFtvEXOEGm+spnCLHk=;
        b=Y50//t2jxJg7J9rXCrFbAPnX+dNv9+TX2yNTBe2Z5UfV+hol9hj0U7p0T6swfhLFHi
         ZoN4al2iy0zbdXvKN6n29+CLGUGUSbl+qDHTbk52tN8pKayosB5pHSTTy0OdYCf52iit
         dh15kXRvCCsIrhcyGNU9Su/pYtXZJlzq4p6jSFnBYtECJ7mWOMGhXWRl0LsfoQwT1rT2
         Jm+GFNiWi9H8y+6om9xKKQjj+BqTppuJmt5E6SfpPA+vL5dSfNd/SHOvlXnFpV98REVp
         iPxpLq7izZg1WHCh0NFm2i8UwtKaBS4970TCXIP7L/ne2pgxm3uPtfK/5mQmWzMFqULg
         xJUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lvf+mFUr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ey8-20020a0562140b6800b0056e61f96a16si1102060qvb.183.2023.06.02.08.53.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Jun 2023 08:53:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lvf+mFUr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q574v-0003D2-Sm; Fri, 02 Jun 2023 11:52:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q574t-0003Ak-C1
 for qemu-arm@nongnu.org; Fri, 02 Jun 2023 11:52:35 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q574p-0003SR-EP
 for qemu-arm@nongnu.org; Fri, 02 Jun 2023 11:52:35 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f603d4bc5bso21604225e9.3
 for <qemu-arm@nongnu.org>; Fri, 02 Jun 2023 08:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685721150; x=1688313150;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=WkGtrZrBF/XjQ2tvFCNg0zZgeoFtvEXOEGm+spnCLHk=;
 b=lvf+mFUr6f05s9zZSt4V4A9fnyvGr2ddqurMH2od39kljSjg7tZnlR+zG8R4wICQhD
 J5W6LFd49wlkaWGtmubMemgV0jFO2PZjBD8GDYJ5HviA4Z74CY6NC4izIMbH4Bbb4Whh
 9Ef5IewoD6VWMkYOH1eVI0IpSVJoUOl5fSq+RIIDgxGeD0J7Jag+VIizAgzsPpLboG+j
 PgcVoWGKEYwGc5S2u68FtA8GaPaEYHRfZt85Oa0k8Jiuq6X7RD6edRSnG546dUWbDM1P
 aZtlb+Aq64IFBp2a2VGTHbbDFjp8PNYC/Z4RXv31HMr+IvLWjo04px1M2NkEVawRtp4W
 OijA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685721150; x=1688313150;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WkGtrZrBF/XjQ2tvFCNg0zZgeoFtvEXOEGm+spnCLHk=;
 b=GfSYfjNnCKLveOZOR1BizdCqq5RhIDyOR2tCWxboPj5CCZ13Vr6GkPbug3qO52aXBb
 ByzOpdvaDoG/c6lDxA2eTp3AMSz/9SMHKt4lR7KeB+hLBouKKI8vndGS6T/HlLhIurEw
 W1cuQFdpq1tDC4ZXfCe93NkE1Cmge8bgAcP5pSc0rNwRXllt0LSgmza7ze6zJSDPUAwF
 mI+Ho7uhPS1PF0dG6RJes0qLErsJDejPrQ4nriZSb1i4hga8w5/PN9F4GBR1JJK14V4A
 fDPBFDztaC5YQFzI3kCeLJ4R5YVxXkGWzstzaNre8HbbCHceiw4LGmVfl9IogIwHd85v
 L1bw==
X-Gm-Message-State: AC+VfDynvD7D7boNgvQwIfyEkAvhLGGgKfFUJ7qB2wRnmhTJ8B2UNcMA
 A3zDveaufqUTXcU0sDGl3cmNMvfiSeJNKSazGbk=
X-Received: by 2002:a05:600c:22c7:b0:3f6:e13:b266 with SMTP id
 7-20020a05600c22c700b003f60e13b266mr2390564wmg.13.1685721149998; 
 Fri, 02 Jun 2023 08:52:29 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a05600c214700b003f72a15301csm594952wml.2.2023.06.02.08.52.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jun 2023 08:52:29 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 08/20] target/arm: Convert load/store exclusive and ordered to
 decodetree
Date: Fri,  2 Jun 2023 16:52:11 +0100
Message-Id: <20230602155223.2040685-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230602155223.2040685-1-peter.maydell@linaro.org>
References: <20230602155223.2040685-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 9TQ9ZZsyJ+Ce

Convert the instructions in the load/store exclusive (STXR,
STLXR, LDXR, LDAXR) and load/store ordered (STLR, STLLR,
LDAR, LDLAR) to decodetree.

Note that for STLR, STLLR, LDAR, LDLAR this fixes an under-decoding
in the legacy decoder where we were not checking that the RES1 bits
in the Rs and Rt2 fields were set.

The new function ldst_iss_sf() is equivalent to the existing
disas_ldst_compute_iss_sf(), but it takes the pre-decoded 'ext' field
rather than taking an undecoded two-bit opc field and extracting
'ext' from it. Once all the loads and stores have been converted
to decodetree disas_ldst_compute_iss_sf() will be unused and
can be deleted.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/a64.decode      |  11 +++
 target/arm/tcg/translate-a64.c | 164 ++++++++++++++++++++-------------
 2 files changed, 110 insertions(+), 65 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index aba27047b56..b9b32490cef 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -230,3 +230,14 @@ HLT             1101 0100 010 ................ 000 00 @i16
 # DCPS1         1101 0100 101 ................ 000 01 @i16
 # DCPS2         1101 0100 101 ................ 000 10 @i16
 # DCPS3         1101 0100 101 ................ 000 11 @i16
+
+# Loads and stores
+
+&stxr           rn rt rt2 rs sz lasr
+&stlr           rn rt sz lasr
+@stxr           sz:2 ...... ... rs:5 lasr:1 rt2:5 rn:5 rt:5 &stxr
+@stlr           sz:2 ...... ... ..... lasr:1 ..... rn:5 rt:5 &stlr
+STXR            .. 001000 000 ..... . ..... ..... ..... @stxr  # inc STLXR
+LDXR            .. 001000 010 ..... . ..... ..... ..... @stxr  # inc LDAXR
+STLR            .. 001000 100 11111 . 11111 ..... ..... @stlr  # inc STLLR
+LDAR            .. 001000 110 11111 . 11111 ..... ..... @stlr  # inc LDLAR
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 94410f6ece5..2a5c4eea02f 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -2560,6 +2560,102 @@ static bool disas_ldst_compute_iss_sf(int size, bool is_signed, int opc)
     return regsize == 64;
 }
 
+static bool ldst_iss_sf(int size, bool sign, bool ext)
+{
+
+    if (sign) {
+        /*
+         * Signed loads are 64 bit results if we are not going to
+         * do a zero-extend from 32 to 64 after the load.
+         * (For a store, sign and ext are always false.)
+         */
+        return !ext;
+    } else {
+        /* Unsigned loads/stores work at the specified size */
+        return size == MO_64;
+    }
+}
+
+static bool trans_STXR(DisasContext *s, arg_stxr *a)
+{
+    TCGv_i64 clean_addr;
+
+    if (a->rn == 31) {
+        gen_check_sp_alignment(s);
+    }
+    if (a->lasr) {
+        tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
+    }
+    clean_addr = gen_mte_check1(s, cpu_reg_sp(s, a->rn),
+                                true, a->rn != 31, a->sz);
+    gen_store_exclusive(s, a->rs, a->rt, a->rt2, clean_addr, a->sz, false);
+    return true;
+}
+
+static bool trans_LDXR(DisasContext *s, arg_stxr *a)
+{
+    TCGv_i64 clean_addr;
+
+    if (a->rn == 31) {
+        gen_check_sp_alignment(s);
+    }
+    clean_addr = gen_mte_check1(s, cpu_reg_sp(s, a->rn),
+                                false, a->rn != 31, a->sz);
+    s->is_ldex = true;
+    gen_load_exclusive(s, a->rt, a->rt2, clean_addr, a->sz, false);
+    if (a->lasr) {
+        tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
+    }
+    return true;
+}
+
+static bool trans_STLR(DisasContext *s, arg_stlr *a)
+{
+    TCGv_i64 clean_addr;
+    bool iss_sf = ldst_iss_sf(a->sz, false, false);
+
+    /*
+     * StoreLORelease is the same as Store-Release for QEMU, but
+     * needs the feature-test.
+     */
+    if (!a->lasr && !dc_isar_feature(aa64_lor, s)) {
+        return false;
+    }
+    /* Generate ISS for non-exclusive accesses including LASR.  */
+    if (a->rn == 31) {
+        gen_check_sp_alignment(s);
+    }
+    tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
+    clean_addr = gen_mte_check1(s, cpu_reg_sp(s, a->rn),
+                                true, a->rn != 31, a->sz);
+    /* TODO: ARMv8.4-LSE SCTLR.nAA */
+    do_gpr_st(s, cpu_reg(s, a->rt), clean_addr, a->sz | MO_ALIGN, true, a->rt,
+              iss_sf, a->lasr);
+    return true;
+}
+
+static bool trans_LDAR(DisasContext *s, arg_stlr *a)
+{
+    TCGv_i64 clean_addr;
+    bool iss_sf = ldst_iss_sf(a->sz, false, false);
+
+    /* LoadLOAcquire is the same as Load-Acquire for QEMU.  */
+    if (!a->lasr && !dc_isar_feature(aa64_lor, s)) {
+        return false;
+    }
+    /* Generate ISS for non-exclusive accesses including LASR.  */
+    if (a->rn == 31) {
+        gen_check_sp_alignment(s);
+    }
+    clean_addr = gen_mte_check1(s, cpu_reg_sp(s, a->rn),
+                                false, a->rn != 31, a->sz);
+    /* TODO: ARMv8.4-LSE SCTLR.nAA */
+    do_gpr_ld(s, cpu_reg(s, a->rt), clean_addr, a->sz | MO_ALIGN, false, true,
+              a->rt, iss_sf, a->lasr);
+    tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
+    return true;
+}
+
 /* Load/store exclusive
  *
  *  31 30 29         24  23  22   21  20  16  15  14   10 9    5 4    0
@@ -2585,71 +2681,6 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
     TCGv_i64 clean_addr;
 
     switch (o2_L_o1_o0) {
-    case 0x0: /* STXR */
-    case 0x1: /* STLXR */
-        if (rn == 31) {
-            gen_check_sp_alignment(s);
-        }
-        if (is_lasr) {
-            tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
-        }
-        clean_addr = gen_mte_check1(s, cpu_reg_sp(s, rn),
-                                    true, rn != 31, size);
-        gen_store_exclusive(s, rs, rt, rt2, clean_addr, size, false);
-        return;
-
-    case 0x4: /* LDXR */
-    case 0x5: /* LDAXR */
-        if (rn == 31) {
-            gen_check_sp_alignment(s);
-        }
-        clean_addr = gen_mte_check1(s, cpu_reg_sp(s, rn),
-                                    false, rn != 31, size);
-        s->is_ldex = true;
-        gen_load_exclusive(s, rt, rt2, clean_addr, size, false);
-        if (is_lasr) {
-            tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
-        }
-        return;
-
-    case 0x8: /* STLLR */
-        if (!dc_isar_feature(aa64_lor, s)) {
-            break;
-        }
-        /* StoreLORelease is the same as Store-Release for QEMU.  */
-        /* fall through */
-    case 0x9: /* STLR */
-        /* Generate ISS for non-exclusive accesses including LASR.  */
-        if (rn == 31) {
-            gen_check_sp_alignment(s);
-        }
-        tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
-        clean_addr = gen_mte_check1(s, cpu_reg_sp(s, rn),
-                                    true, rn != 31, size);
-        /* TODO: ARMv8.4-LSE SCTLR.nAA */
-        do_gpr_st(s, cpu_reg(s, rt), clean_addr, size | MO_ALIGN, true, rt,
-                  disas_ldst_compute_iss_sf(size, false, 0), is_lasr);
-        return;
-
-    case 0xc: /* LDLAR */
-        if (!dc_isar_feature(aa64_lor, s)) {
-            break;
-        }
-        /* LoadLOAcquire is the same as Load-Acquire for QEMU.  */
-        /* fall through */
-    case 0xd: /* LDAR */
-        /* Generate ISS for non-exclusive accesses including LASR.  */
-        if (rn == 31) {
-            gen_check_sp_alignment(s);
-        }
-        clean_addr = gen_mte_check1(s, cpu_reg_sp(s, rn),
-                                    false, rn != 31, size);
-        /* TODO: ARMv8.4-LSE SCTLR.nAA */
-        do_gpr_ld(s, cpu_reg(s, rt), clean_addr, size | MO_ALIGN, false, true,
-                  rt, disas_ldst_compute_iss_sf(size, false, 0), is_lasr);
-        tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
-        return;
-
     case 0x2: case 0x3: /* CASP / STXP */
         if (size & 2) { /* STXP / STLXP */
             if (rn == 31) {
@@ -2704,6 +2735,9 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
             return;
         }
         break;
+    default:
+        /* Handled in decodetree */
+        break;
     }
     unallocated_encoding(s);
 }
-- 
2.34.1

