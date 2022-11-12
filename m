Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp1366690ejx;
        Fri, 11 Nov 2022 20:26:57 -0800 (PST)
X-Google-Smtp-Source: AA0mqf71Zu0OxEX9KHh4YhkPKivmf90dRLJ39WIyoZXByrsr+qh821eY8wBKV12W//dBTFIxdqJj
X-Received: by 2002:ae9:dcc2:0:b0:6fa:339e:51c0 with SMTP id q185-20020ae9dcc2000000b006fa339e51c0mr3760570qkf.191.1668227216945;
        Fri, 11 Nov 2022 20:26:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668227216; cv=none;
        d=google.com; s=arc-20160816;
        b=EQ/bzrEI3UcZhMPanYKCjrRCtB2tzTOly87dv29VO/vg7Zmwyg3pkzSCej1aBB+/3+
         0MuL7Tc/oJRSkO8DLCDu/G5PQK8Vfx21jeD4DoIvbTcv5r8sncQ56RKuPsWthviSCdm+
         7wkDRdUDcT8bPHLQnyznW0KHfxi4fEfoghddg308zPBpxC41FNN3jKFj2Sswn8yKATAF
         rvm+Y5TBrhdlWyPy9pYETebnMnyvFip9CiqqEvyDo+z/j35Q3Gl66JlSsxY7/p1I3/iE
         v/dxQlwh6SXOKYgixsE/LFoWrL3jrubmVjasSCy2642kweHphonedmVo0mJTDAi7U3hP
         XAXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=1lwD3MBP7KdZXSMQ/dQRWQ7L0wFvhz8dYyrG8vS0xQY=;
        b=VwiLAwFWGhXjZZbXdRnXtXNyaK598jsOw1u/JwiEYYqMl7hQks/W7xsIZoe8QQcHg5
         TYD5iDptVDFEpzBqG02RufqEKayOzzLuIEj1Zp7lUfCagQfTxhkYZXUBKRT6lADeHsXC
         PS8RxRQQai/NbpkS9vcgLexenCHLLWgCawVzskTItRrFNVz7pX1Z22PyT0ye9mQMD+Uy
         axrKsb9/i5gJ2HFhmFJrc75xNs38vDQixgnP1M0laFWosCaqomn/eJ1mIN8Vc3SWAFMl
         PD+TTFf3BP7lDq2xcXRmr6StVavKVIthbagq7KdoKk3sVBivyaqNWFZ7BzQ17fRPPOyA
         dVlg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zH5Tujjv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m10-20020a05620a220a00b006fa4afd27a2si1883359qkh.592.2022.11.11.20.26.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Nov 2022 20:26:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zH5Tujjv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1oti5w-00051S-FA; Fri, 11 Nov 2022 23:26:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oti5r-00050V-Q8
 for qemu-arm@nongnu.org; Fri, 11 Nov 2022 23:26:12 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oti5o-00081O-8O
 for qemu-arm@nongnu.org; Fri, 11 Nov 2022 23:26:09 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 u8-20020a17090a5e4800b002106dcdd4a0so9353440pji.1
 for <qemu-arm@nongnu.org>; Fri, 11 Nov 2022 20:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1lwD3MBP7KdZXSMQ/dQRWQ7L0wFvhz8dYyrG8vS0xQY=;
 b=zH5Tujjv3QhddnY4Q4A3E9IwsoOlie5lGFoPlDbWCAbpxQMAz3r4+34MnybuDrs1rp
 PJghX88l+ZLGCxXwhUnUULL01iIXX23PM+FN27F6pC7lKC8BLZSpPk5I2Z/QiFGKMCFh
 u3bTGKd6CmGq8DGJm344f7UZ8Cbw0Pu2eo17P6R2lIUbwaZQ8l5pB8BFu+7mnEIClgaV
 MeJ9tJ8QdUrbhRZT9cqAnUTwMm6K5uqWk4ovVqtE69RkftlEInEN3QK2l9cJqjY19dZR
 VopGQCvWJ+ohFl4C/ovBYQM0Sw41WaHNLLtdz6AabkQLIPBoBcZtpKIkJTAWXi3vguL0
 YvgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1lwD3MBP7KdZXSMQ/dQRWQ7L0wFvhz8dYyrG8vS0xQY=;
 b=y4CVJRfM4Efc815jfIat1IDaQ4UXwSjCE+++YAaKelaeobBsskGdOCODikXJdhUy4B
 sB0YbmvvmOGD1Sr24nbjcbtTBLUmbhe8gHhVXYSWhMndwifci6wBHSi4ZB0tM4wAF4ox
 dmj0V9knL5JXKVBG3gFBaSiP6WYafibezUMmaL9aN6vMC/zcxXkgD1jOd4kjPhPewKAM
 5iw30fQdFlKI7iuXP/70fk/ByWDACOI2BqwWdUikGP6dYzH1+zwRyQV2LkoX0vVOrKap
 uFlivXuPFv7v+j2ERuzzYem0uyJNZjcTMeZG1iB2GE/dIPkfg7jPd336NZzoiFx7gouD
 Ohzw==
X-Gm-Message-State: ANoB5pnAYctISFtRmOrIbiv5EsEhffITJjL5w0iy78aDWrt/9wzAjH3f
 undXHYn+YCW2i8is1JRGW4AL1wmYg3D4boqw
X-Received: by 2002:a17:902:780d:b0:186:df61:4693 with SMTP id
 p13-20020a170902780d00b00186df614693mr5135578pll.173.1668227166664; 
 Fri, 11 Nov 2022 20:26:06 -0800 (PST)
Received: from stoup.lan
 (2001-44b8-2176-c800-8228-b676-fb42-ee07.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:8228:b676:fb42:ee07])
 by smtp.gmail.com with ESMTPSA id
 e6-20020a170902784600b001869ba04c83sm2522003pln.245.2022.11.11.20.26.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 20:26:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH for-8.0 2/2] target/arm: Use tcg_gen_atomic_cmpxchg_i128 for
 CASP
Date: Sat, 12 Nov 2022 14:25:55 +1000
Message-Id: <20221112042555.2622152-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221112042555.2622152-1-richard.henderson@linaro.org>
References: <20221112042555.2622152-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: KDecdynB6Sko

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-a64.h    |  2 --
 target/arm/helper-a64.c    | 43 ---------------------------
 target/arm/translate-a64.c | 61 +++++++++++---------------------------
 3 files changed, 18 insertions(+), 88 deletions(-)

diff --git a/target/arm/helper-a64.h b/target/arm/helper-a64.h
index 94065d1917..ff56807247 100644
--- a/target/arm/helper-a64.h
+++ b/target/arm/helper-a64.h
@@ -50,8 +50,6 @@ DEF_HELPER_FLAGS_2(frecpx_f16, TCG_CALL_NO_RWG, f16, f16, ptr)
 DEF_HELPER_FLAGS_2(fcvtx_f64_to_f32, TCG_CALL_NO_RWG, f32, f64, env)
 DEF_HELPER_FLAGS_3(crc32_64, TCG_CALL_NO_RWG_SE, i64, i64, i64, i32)
 DEF_HELPER_FLAGS_3(crc32c_64, TCG_CALL_NO_RWG_SE, i64, i64, i64, i32)
-DEF_HELPER_5(casp_le_parallel, void, env, i32, i64, i64, i64)
-DEF_HELPER_5(casp_be_parallel, void, env, i32, i64, i64, i64)
 DEF_HELPER_FLAGS_3(advsimd_maxh, TCG_CALL_NO_RWG, f16, f16, f16, ptr)
 DEF_HELPER_FLAGS_3(advsimd_minh, TCG_CALL_NO_RWG, f16, f16, f16, ptr)
 DEF_HELPER_FLAGS_3(advsimd_maxnumh, TCG_CALL_NO_RWG, f16, f16, f16, ptr)
diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index 7dbdb2c233..0972a4bdd0 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -505,49 +505,6 @@ uint64_t HELPER(crc32c_64)(uint64_t acc, uint64_t val, uint32_t bytes)
     return crc32c(acc, buf, bytes) ^ 0xffffffff;
 }
 
-/* Writes back the old data into Rs.  */
-void HELPER(casp_le_parallel)(CPUARMState *env, uint32_t rs, uint64_t addr,
-                              uint64_t new_lo, uint64_t new_hi)
-{
-    Int128 oldv, cmpv, newv;
-    uintptr_t ra = GETPC();
-    int mem_idx;
-    MemOpIdx oi;
-
-    assert(HAVE_CMPXCHG128);
-
-    mem_idx = cpu_mmu_index(env, false);
-    oi = make_memop_idx(MO_LE | MO_128 | MO_ALIGN, mem_idx);
-
-    cmpv = int128_make128(env->xregs[rs], env->xregs[rs + 1]);
-    newv = int128_make128(new_lo, new_hi);
-    oldv = cpu_atomic_cmpxchgo_le_mmu(env, addr, cmpv, newv, oi, ra);
-
-    env->xregs[rs] = int128_getlo(oldv);
-    env->xregs[rs + 1] = int128_gethi(oldv);
-}
-
-void HELPER(casp_be_parallel)(CPUARMState *env, uint32_t rs, uint64_t addr,
-                              uint64_t new_hi, uint64_t new_lo)
-{
-    Int128 oldv, cmpv, newv;
-    uintptr_t ra = GETPC();
-    int mem_idx;
-    MemOpIdx oi;
-
-    assert(HAVE_CMPXCHG128);
-
-    mem_idx = cpu_mmu_index(env, false);
-    oi = make_memop_idx(MO_LE | MO_128 | MO_ALIGN, mem_idx);
-
-    cmpv = int128_make128(env->xregs[rs + 1], env->xregs[rs]);
-    newv = int128_make128(new_lo, new_hi);
-    oldv = cpu_atomic_cmpxchgo_be_mmu(env, addr, cmpv, newv, oi, ra);
-
-    env->xregs[rs + 1] = int128_getlo(oldv);
-    env->xregs[rs] = int128_gethi(oldv);
-}
-
 /*
  * AdvSIMD half-precision
  */
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index dffd7ee737..067426baef 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -2688,53 +2688,28 @@ static void gen_compare_and_swap_pair(DisasContext *s, int rs, int rt,
             tcg_gen_extr32_i64(s2, s1, cmp);
         }
         tcg_temp_free_i64(cmp);
-    } else if (tb_cflags(s->base.tb) & CF_PARALLEL) {
-        if (HAVE_CMPXCHG128) {
-            TCGv_i32 tcg_rs = tcg_constant_i32(rs);
-            if (s->be_data == MO_LE) {
-                gen_helper_casp_le_parallel(cpu_env, tcg_rs,
-                                            clean_addr, t1, t2);
-            } else {
-                gen_helper_casp_be_parallel(cpu_env, tcg_rs,
-                                            clean_addr, t1, t2);
-            }
-        } else {
-            gen_helper_exit_atomic(cpu_env);
-            s->base.is_jmp = DISAS_NORETURN;
-        }
     } else {
-        TCGv_i64 d1 = tcg_temp_new_i64();
-        TCGv_i64 d2 = tcg_temp_new_i64();
-        TCGv_i64 a2 = tcg_temp_new_i64();
-        TCGv_i64 c1 = tcg_temp_new_i64();
-        TCGv_i64 c2 = tcg_temp_new_i64();
-        TCGv_i64 zero = tcg_constant_i64(0);
+        TCGv_i128 cmp = tcg_temp_new_i128();
+        TCGv_i128 val = tcg_temp_new_i128();
 
-        /* Load the two words, in memory order.  */
-        tcg_gen_qemu_ld_i64(d1, clean_addr, memidx,
-                            MO_64 | MO_ALIGN_16 | s->be_data);
-        tcg_gen_addi_i64(a2, clean_addr, 8);
-        tcg_gen_qemu_ld_i64(d2, a2, memidx, MO_64 | s->be_data);
+        if (s->be_data == MO_LE) {
+            tcg_gen_concat_i64_i128(val, t1, t2);
+            tcg_gen_concat_i64_i128(cmp, s1, s2);
+        } else {
+            tcg_gen_concat_i64_i128(val, t2, t1);
+            tcg_gen_concat_i64_i128(cmp, s2, s1);
+        }
 
-        /* Compare the two words, also in memory order.  */
-        tcg_gen_setcond_i64(TCG_COND_EQ, c1, d1, s1);
-        tcg_gen_setcond_i64(TCG_COND_EQ, c2, d2, s2);
-        tcg_gen_and_i64(c2, c2, c1);
+        tcg_gen_atomic_cmpxchg_i128(cmp, clean_addr, cmp, val, memidx,
+                                    MO_128 | MO_ALIGN | s->be_data);
+        tcg_temp_free_i128(val);
 
-        /* If compare equal, write back new data, else write back old data.  */
-        tcg_gen_movcond_i64(TCG_COND_NE, c1, c2, zero, t1, d1);
-        tcg_gen_movcond_i64(TCG_COND_NE, c2, c2, zero, t2, d2);
-        tcg_gen_qemu_st_i64(c1, clean_addr, memidx, MO_64 | s->be_data);
-        tcg_gen_qemu_st_i64(c2, a2, memidx, MO_64 | s->be_data);
-        tcg_temp_free_i64(a2);
-        tcg_temp_free_i64(c1);
-        tcg_temp_free_i64(c2);
-
-        /* Write back the data from memory to Rs.  */
-        tcg_gen_mov_i64(s1, d1);
-        tcg_gen_mov_i64(s2, d2);
-        tcg_temp_free_i64(d1);
-        tcg_temp_free_i64(d2);
+        if (s->be_data == MO_LE) {
+            tcg_gen_extr_i128_i64(s1, s2, cmp);
+        } else {
+            tcg_gen_extr_i128_i64(s2, s1, cmp);
+        }
+        tcg_temp_free_i128(cmp);
     }
 }
 
-- 
2.34.1

