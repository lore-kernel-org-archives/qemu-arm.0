Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp5774174wrq;
        Tue, 26 Jun 2018 21:41:03 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeTi7cjpL+mbOh7iAKzRiHyxEdQ9BrUYJ9ZmGadj0VGjleCVQdm3TxqlOZeYQyuJ2MGOSRq
X-Received: by 2002:a37:d60f:: with SMTP id t15-v6mr3913859qki.316.1530074463407;
        Tue, 26 Jun 2018 21:41:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530074463; cv=none;
        d=google.com; s=arc-20160816;
        b=Y0ryF6mprqIWY484pDbZ2MN3wG8NnPA+fcXFFOOOsPA4YuaNG/n+JUH4n0mEtsPA5q
         x/89aRNuL+4vu4kJ2KdQDaTK9CH4frong5g1NdLMEC9L7mA1Im0Cv89NJwpBQUj3VKI/
         6f+Q5+W1OChVSGlh+XejqBdz5i+RGh0/qog3/rcE02BRpLdyMdlgJ32ipw/3NeHds9G1
         UJIqgezwuQHwqz0XirgcnsslqqsjMr4Et557B4XSE314S5tZeV3V75vo1Ep2BdbqFIrq
         JWI+++IkOn/06IAZYLV6C291VizW2/474tkgXG4k3u/NE7jOJII86mPOmpK4/R1bCs63
         Q7fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=qNYfzm3VvV6HqePkDEdE08ZEgEkLyLKRB5+Jl0PRJT0=;
        b=IWNE/39W62t+uar4y9GGGKECwCneO8Fd4dQ5QGooqWMZYx1acX905fIMpEBDMKMbEx
         iNjoN1MHLhuBqQmLvKx69f7uhcpY4xgIQdIUvI0bWAJ92tx5PE8lm+8TPXI+FksFbDkf
         iT4YezhnP6Liob0THkojteD6/nCEykP1D0HabH9AN2+LN1KpUw2JKysX7X8iHjISm0o0
         v7YsnRKVnf7UP3Z+OLqxsJ9wtGf2jAi4vQo/M/nEc791oao+NAB7P2lypUfDW2oAR0+w
         fL2qJYfUFciKFsjn/mk6XMuCss4adlpyXwl/p12Fe5/MKz3aotgrrTxLAs7oYRPjlycD
         ji/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RJN80DZ5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n8-v6si3070117qvf.50.2018.06.26.21.41.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jun 2018 21:41:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RJN80DZ5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56523 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fY2GM-0001nH-SO
	for alex.bennee@linaro.org; Wed, 27 Jun 2018 00:41:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60475)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY29S-0004GE-4x
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 00:33:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY29O-0000V0-Le
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 00:33:54 -0400
Received: from mail-pf0-x232.google.com ([2607:f8b0:400e:c00::232]:42048)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fY29O-0000Tf-CP
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 00:33:50 -0400
Received: by mail-pf0-x232.google.com with SMTP id w7-v6so383142pfn.9
	for <qemu-arm@nongnu.org>; Tue, 26 Jun 2018 21:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=qNYfzm3VvV6HqePkDEdE08ZEgEkLyLKRB5+Jl0PRJT0=;
	b=RJN80DZ5XKdHXI/VZu0qBTlfQ7Dj19Oht/79qztgNlSPHJFUm6SvgA7MDo6WBgCOYn
	G2etOpzZXAjhcDAP0blUUW91SVQUbrmU1QP5Y32mDOpxkeLaohS93aUmjXHkZHN6AoRt
	nRN0n53foo6vaTc9fs8Nj0fEp09TQBW+jLcz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=qNYfzm3VvV6HqePkDEdE08ZEgEkLyLKRB5+Jl0PRJT0=;
	b=XlLfNqqEGLLZKaNbBrNPu61xUhMneQz7mYR9TqW6dlfSbfUobdAfuFX/zyagRIA5DK
	XXShaRg4m3Up5S0VyYLyZ2RSBD16XewPImAyIWCpM+X6VuhNM7seBtqtwYZ3QoXcL3Sm
	Mc48QbEEXnw4jY0OHgjtbnofOUj6JVXORb0jrhIDblJs3ClmguvbT+vbzAWfHMj+sPpo
	Z3oMc6CUql7o4OS+bXXbo692AFm+Omomq9L8OuZ7JcPTM/vJDNduENTkd5R0+8fjQmNe
	XLnwmqAGZO/JBmDxluzUBVSlYIK0Q9SOTJjEKmGgSFq30LQK/teLT5Q9mwz7bCA5QiwL
	bW9g==
X-Gm-Message-State: APt69E05CsoXv9dWD1mK/6Wr7RjrksJgzw0ES6A8UAkcAAqT6e+Crv7h
	pA0/w5DH00lRmDMl2I5IPv8kMw==
X-Received: by 2002:a63:8b44:: with SMTP id
	j65-v6mr3780141pge.248.1530074029244; 
	Tue, 26 Jun 2018 21:33:49 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	p20-v6sm4577638pff.90.2018.06.26.21.33.48
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 26 Jun 2018 21:33:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 26 Jun 2018 21:33:06 -0700
Message-Id: <20180627043328.11531-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180627043328.11531-1-richard.henderson@linaro.org>
References: <20180627043328.11531-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::232
Subject: [Qemu-arm] [PATCH v6 13/35] target/arm: Implement SVE gather loads
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: i2GaNtM/PBvi

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

---
v6:
  * Finish esz == msz && u==1 decode in sve.decode.
  * Remove duplicate decode in trans_ST1_zprz.
  * Add xs=2 comment.
  * Reformat tables to leave room for ff helpers.
---
 target/arm/helper-sve.h    |  67 +++++++++++++++++++++++++
 target/arm/sve_helper.c    |  77 ++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 100 +++++++++++++++++++++++++++++++++++++
 target/arm/sve.decode      |  57 +++++++++++++++++++++
 4 files changed, 301 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 8880128f9c..aeb62afc34 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -959,6 +959,73 @@ DEF_HELPER_FLAGS_4(sve_st1hd_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
 
 DEF_HELPER_FLAGS_4(sve_st1sd_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
 
+DEF_HELPER_FLAGS_6(sve_ldbsu_zsu, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldhsu_zsu, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldssu_zsu, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldbss_zsu, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldhss_zsu, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_6(sve_ldbsu_zss, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldhsu_zss, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldssu_zss, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldbss_zss, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldhss_zss, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_6(sve_ldbdu_zsu, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldhdu_zsu, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldsdu_zsu, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldddu_zsu, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldbds_zsu, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldhds_zsu, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldsds_zsu, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_6(sve_ldbdu_zss, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldhdu_zss, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldsdu_zss, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldddu_zss, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldbds_zss, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldhds_zss, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldsds_zss, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_6(sve_ldbdu_zd, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldhdu_zd, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldsdu_zd, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldddu_zd, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldbds_zd, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldhds_zd, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldsds_zd, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+
 DEF_HELPER_FLAGS_6(sve_stbs_zsu, TCG_CALL_NO_WG,
                    void, env, ptr, ptr, ptr, tl, i32)
 DEF_HELPER_FLAGS_6(sve_sths_zsu, TCG_CALL_NO_WG,
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 7622bb2af0..24f75a32d3 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -3714,6 +3714,83 @@ void HELPER(sve_st4dd_r)(CPUARMState *env, void *vg,
     }
 }
 
+/* Loads with a vector index.  */
+
+#define DO_LD1_ZPZ_S(NAME, TYPEI, TYPEM, FN)                            \
+void HELPER(NAME)(CPUARMState *env, void *vd, void *vg, void *vm,       \
+                  target_ulong base, uint32_t desc)                     \
+{                                                                       \
+    intptr_t i, oprsz = simd_oprsz(desc);                               \
+    unsigned scale = simd_data(desc);                                   \
+    uintptr_t ra = GETPC();                                             \
+    for (i = 0; i < oprsz; i++) {                                       \
+        uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));                 \
+        do {                                                            \
+            TYPEM m = 0;                                                \
+            if (pg & 1) {                                               \
+                target_ulong off = *(TYPEI *)(vm + H1_4(i));            \
+                m = FN(env, base + (off << scale), ra);                 \
+            }                                                           \
+            *(uint32_t *)(vd + H1_4(i)) = m;                            \
+            i += 4, pg >>= 4;                                           \
+        } while (i & 15);                                               \
+    }                                                                   \
+}
+
+#define DO_LD1_ZPZ_D(NAME, TYPEI, TYPEM, FN)                            \
+void HELPER(NAME)(CPUARMState *env, void *vd, void *vg, void *vm,       \
+                  target_ulong base, uint32_t desc)                     \
+{                                                                       \
+    intptr_t i, oprsz = simd_oprsz(desc) / 8;                           \
+    unsigned scale = simd_data(desc);                                   \
+    uintptr_t ra = GETPC();                                             \
+    uint64_t *d = vd, *m = vm; uint8_t *pg = vg;                        \
+    for (i = 0; i < oprsz; i++) {                                       \
+        TYPEM mm = 0;                                                   \
+        if (pg[H1(i)] & 1) {                                            \
+            target_ulong off = (TYPEI)m[i];                             \
+            mm = FN(env, base + (off << scale), ra);                    \
+        }                                                               \
+        d[i] = mm;                                                      \
+    }                                                                   \
+}
+
+DO_LD1_ZPZ_S(sve_ldbsu_zsu, uint32_t, uint8_t,  cpu_ldub_data_ra)
+DO_LD1_ZPZ_S(sve_ldhsu_zsu, uint32_t, uint16_t, cpu_lduw_data_ra)
+DO_LD1_ZPZ_S(sve_ldssu_zsu, uint32_t, uint32_t, cpu_ldl_data_ra)
+DO_LD1_ZPZ_S(sve_ldbss_zsu, uint32_t, int8_t,   cpu_ldub_data_ra)
+DO_LD1_ZPZ_S(sve_ldhss_zsu, uint32_t, int16_t,  cpu_lduw_data_ra)
+
+DO_LD1_ZPZ_S(sve_ldbsu_zss, int32_t, uint8_t,  cpu_ldub_data_ra)
+DO_LD1_ZPZ_S(sve_ldhsu_zss, int32_t, uint16_t, cpu_lduw_data_ra)
+DO_LD1_ZPZ_S(sve_ldssu_zss, int32_t, uint32_t, cpu_ldl_data_ra)
+DO_LD1_ZPZ_S(sve_ldbss_zss, int32_t, int8_t,   cpu_ldub_data_ra)
+DO_LD1_ZPZ_S(sve_ldhss_zss, int32_t, int16_t,  cpu_lduw_data_ra)
+
+DO_LD1_ZPZ_D(sve_ldbdu_zsu, uint32_t, uint8_t,  cpu_ldub_data_ra)
+DO_LD1_ZPZ_D(sve_ldhdu_zsu, uint32_t, uint16_t, cpu_lduw_data_ra)
+DO_LD1_ZPZ_D(sve_ldsdu_zsu, uint32_t, uint32_t, cpu_ldl_data_ra)
+DO_LD1_ZPZ_D(sve_ldddu_zsu, uint32_t, uint64_t, cpu_ldq_data_ra)
+DO_LD1_ZPZ_D(sve_ldbds_zsu, uint32_t, int8_t,   cpu_ldub_data_ra)
+DO_LD1_ZPZ_D(sve_ldhds_zsu, uint32_t, int16_t,  cpu_lduw_data_ra)
+DO_LD1_ZPZ_D(sve_ldsds_zsu, uint32_t, int32_t,  cpu_ldl_data_ra)
+
+DO_LD1_ZPZ_D(sve_ldbdu_zss, int32_t, uint8_t,  cpu_ldub_data_ra)
+DO_LD1_ZPZ_D(sve_ldhdu_zss, int32_t, uint16_t, cpu_lduw_data_ra)
+DO_LD1_ZPZ_D(sve_ldsdu_zss, int32_t, uint32_t, cpu_ldl_data_ra)
+DO_LD1_ZPZ_D(sve_ldddu_zss, int32_t, uint64_t, cpu_ldq_data_ra)
+DO_LD1_ZPZ_D(sve_ldbds_zss, int32_t, int8_t,   cpu_ldub_data_ra)
+DO_LD1_ZPZ_D(sve_ldhds_zss, int32_t, int16_t,  cpu_lduw_data_ra)
+DO_LD1_ZPZ_D(sve_ldsds_zss, int32_t, int32_t,  cpu_ldl_data_ra)
+
+DO_LD1_ZPZ_D(sve_ldbdu_zd, uint64_t, uint8_t,  cpu_ldub_data_ra)
+DO_LD1_ZPZ_D(sve_ldhdu_zd, uint64_t, uint16_t, cpu_lduw_data_ra)
+DO_LD1_ZPZ_D(sve_ldsdu_zd, uint64_t, uint32_t, cpu_ldl_data_ra)
+DO_LD1_ZPZ_D(sve_ldddu_zd, uint64_t, uint64_t, cpu_ldq_data_ra)
+DO_LD1_ZPZ_D(sve_ldbds_zd, uint64_t, int8_t,   cpu_ldub_data_ra)
+DO_LD1_ZPZ_D(sve_ldhds_zd, uint64_t, int16_t,  cpu_lduw_data_ra)
+DO_LD1_ZPZ_D(sve_ldsds_zd, uint64_t, int32_t,  cpu_ldl_data_ra)
+
 /* Stores with a vector index.  */
 
 #define DO_ST1_ZPZ_S(NAME, TYPEI, FN)                                   \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 27854e0042..33ffb217d0 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4255,6 +4255,106 @@ static void do_mem_zpz(DisasContext *s, int zt, int pg, int zm, int scale,
     tcg_temp_free_i32(desc);
 }
 
+/* Indexed by [ff][xs][u][msz].  */
+static gen_helper_gvec_mem_scatter * const gather_load_fn32[2][2][2][3] = {
+    { { { gen_helper_sve_ldbss_zsu,
+          gen_helper_sve_ldhss_zsu,
+          NULL, },
+        { gen_helper_sve_ldbsu_zsu,
+          gen_helper_sve_ldhsu_zsu,
+          gen_helper_sve_ldssu_zsu, } },
+      { { gen_helper_sve_ldbss_zss,
+          gen_helper_sve_ldhss_zss,
+          NULL, },
+        { gen_helper_sve_ldbsu_zss,
+          gen_helper_sve_ldhsu_zss,
+          gen_helper_sve_ldssu_zss, } } },
+    /* TODO fill in first-fault handlers */
+};
+
+/* Note that we overload xs=2 to indicate 64-bit offset.  */
+static gen_helper_gvec_mem_scatter * const gather_load_fn64[2][3][2][4] = {
+    { { { gen_helper_sve_ldbds_zsu,
+          gen_helper_sve_ldhds_zsu,
+          gen_helper_sve_ldsds_zsu,
+          NULL, },
+        { gen_helper_sve_ldbdu_zsu,
+          gen_helper_sve_ldhdu_zsu,
+          gen_helper_sve_ldsdu_zsu,
+          gen_helper_sve_ldddu_zsu, } },
+      { { gen_helper_sve_ldbds_zss,
+          gen_helper_sve_ldhds_zss,
+          gen_helper_sve_ldsds_zss,
+          NULL, },
+        { gen_helper_sve_ldbdu_zss,
+          gen_helper_sve_ldhdu_zss,
+          gen_helper_sve_ldsdu_zss,
+          gen_helper_sve_ldddu_zss, } },
+      { { gen_helper_sve_ldbds_zd,
+          gen_helper_sve_ldhds_zd,
+          gen_helper_sve_ldsds_zd,
+          NULL, },
+        { gen_helper_sve_ldbdu_zd,
+          gen_helper_sve_ldhdu_zd,
+          gen_helper_sve_ldsdu_zd,
+          gen_helper_sve_ldddu_zd, } } },
+    /* TODO fill in first-fault handlers */
+};
+
+static bool trans_LD1_zprz(DisasContext *s, arg_LD1_zprz *a, uint32_t insn)
+{
+    gen_helper_gvec_mem_scatter *fn = NULL;
+
+    if (!sve_access_check(s)) {
+        return true;
+    }
+
+    switch (a->esz) {
+    case MO_32:
+        fn = gather_load_fn32[a->ff][a->xs][a->u][a->msz];
+        break;
+    case MO_64:
+        fn = gather_load_fn64[a->ff][a->xs][a->u][a->msz];
+        break;
+    }
+    assert(fn != NULL);
+
+    do_mem_zpz(s, a->rd, a->pg, a->rm, a->scale * a->msz,
+               cpu_reg_sp(s, a->rn), fn);
+    return true;
+}
+
+static bool trans_LD1_zpiz(DisasContext *s, arg_LD1_zpiz *a, uint32_t insn)
+{
+    gen_helper_gvec_mem_scatter *fn = NULL;
+    TCGv_i64 imm;
+
+    if (a->esz < a->msz || (a->esz == a->msz && !a->u)) {
+        return false;
+    }
+    if (!sve_access_check(s)) {
+        return true;
+    }
+
+    switch (a->esz) {
+    case MO_32:
+        fn = gather_load_fn32[a->ff][0][a->u][a->msz];
+        break;
+    case MO_64:
+        fn = gather_load_fn64[a->ff][2][a->u][a->msz];
+        break;
+    }
+    assert(fn != NULL);
+
+    /* Treat LD1_zpiz (zn[x] + imm) the same way as LD1_zprz (rn + zm[x])
+     * by loading the immediate into the scalar parameter.
+     */
+    imm = tcg_const_i64(a->imm << a->msz);
+    do_mem_zpz(s, a->rd, a->pg, a->rn, 0, imm, fn);
+    tcg_temp_free_i64(imm);
+    return true;
+}
+
 static bool trans_ST1_zprz(DisasContext *s, arg_ST1_zprz *a, uint32_t insn)
 {
     /* Indexed by [xs][msz].  */
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 80b955ff84..45016c6042 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -80,6 +80,8 @@
 &rpri_load      rd pg rn imm dtype nreg
 &rprr_store     rd pg rn rm msz esz nreg
 &rpri_store     rd pg rn imm msz esz nreg
+&rprr_gather_load       rd pg rn rm esz msz u ff xs scale
+&rpri_gather_load       rd pg rn imm esz msz u ff
 &rprr_scatter_store     rd pg rn rm esz msz xs scale
 
 ###########################################################################
@@ -194,6 +196,22 @@
 @rpri_load_msz  ....... .... . imm:s4 ... pg:3 rn:5 rd:5 \
                 &rpri_load dtype=%msz_dtype
 
+# Gather Loads.
+@rprr_g_load_u        ....... .. .    . rm:5 . u:1 ff:1 pg:3 rn:5 rd:5 \
+                      &rprr_gather_load xs=2
+@rprr_g_load_xs_u     ....... .. xs:1 . rm:5 . u:1 ff:1 pg:3 rn:5 rd:5 \
+                      &rprr_gather_load
+@rprr_g_load_xs_u_sc  ....... .. xs:1 scale:1 rm:5 . u:1 ff:1 pg:3 rn:5 rd:5 \
+                      &rprr_gather_load
+@rprr_g_load_xs_sc    ....... .. xs:1 scale:1 rm:5 . . ff:1 pg:3 rn:5 rd:5 \
+                      &rprr_gather_load
+@rprr_g_load_u_sc     ....... .. .    scale:1 rm:5 . u:1 ff:1 pg:3 rn:5 rd:5 \
+                      &rprr_gather_load xs=2
+@rprr_g_load_sc       ....... .. .    scale:1 rm:5 . . ff:1 pg:3 rn:5 rd:5 \
+                      &rprr_gather_load xs=2
+@rpri_g_load          ....... msz:2 .. imm:5 . u:1 ff:1 pg:3 rn:5 rd:5 \
+                      &rpri_gather_load
+
 # Stores; user must fill in ESZ, MSZ, NREG as needed.
 @rprr_store         ....... ..    ..     rm:5 ... pg:3 rn:5 rd:5    &rprr_store
 @rpri_store_msz     ....... msz:2 .. . imm:s4 ... pg:3 rn:5 rd:5    &rpri_store
@@ -759,6 +777,19 @@ LDR_zri         10000101 10 ...... 010 ... ..... .....          @rd_rn_i9
 LD1R_zpri       1000010 .. 1 imm:6 1.. pg:3 rn:5 rd:5 \
                 &rpri_load dtype=%dtype_23_13 nreg=0
 
+# SVE 32-bit gather load (scalar plus 32-bit unscaled offsets)
+# SVE 32-bit gather load (scalar plus 32-bit scaled offsets)
+LD1_zprz        1000010 00 .0 ..... 0.. ... ..... ..... \
+                @rprr_g_load_xs_u esz=2 msz=0 scale=0
+LD1_zprz        1000010 01 .. ..... 0.. ... ..... ..... \
+                @rprr_g_load_xs_u_sc esz=2 msz=1
+LD1_zprz        1000010 10 .. ..... 01. ... ..... ..... \
+                @rprr_g_load_xs_sc esz=2 msz=2 u=1
+
+# SVE 32-bit gather load (vector plus immediate)
+LD1_zpiz        1000010 .. 01 ..... 1.. ... ..... ..... \
+                @rpri_g_load esz=2
+
 ### SVE Memory Contiguous Load Group
 
 # SVE contiguous load (scalar plus scalar)
@@ -808,6 +839,32 @@ PRF_rr          1000010 -- 00 rm:5 110 --- ----- 0 ----
 
 ### SVE Memory 64-bit Gather Group
 
+# SVE 64-bit gather load (scalar plus 32-bit unpacked unscaled offsets)
+# SVE 64-bit gather load (scalar plus 32-bit unpacked scaled offsets)
+LD1_zprz        1100010 00 .0 ..... 0.. ... ..... ..... \
+                @rprr_g_load_xs_u esz=3 msz=0 scale=0
+LD1_zprz        1100010 01 .. ..... 0.. ... ..... ..... \
+                @rprr_g_load_xs_u_sc esz=3 msz=1
+LD1_zprz        1100010 10 .. ..... 0.. ... ..... ..... \
+                @rprr_g_load_xs_u_sc esz=3 msz=2
+LD1_zprz        1100010 11 .. ..... 01. ... ..... ..... \
+                @rprr_g_load_xs_sc esz=3 msz=3 u=1
+
+# SVE 64-bit gather load (scalar plus 64-bit unscaled offsets)
+# SVE 64-bit gather load (scalar plus 64-bit scaled offsets)
+LD1_zprz        1100010 00 10 ..... 1.. ... ..... ..... \
+                @rprr_g_load_u esz=3 msz=0 scale=0
+LD1_zprz        1100010 01 1. ..... 1.. ... ..... ..... \
+                @rprr_g_load_u_sc esz=3 msz=1
+LD1_zprz        1100010 10 1. ..... 1.. ... ..... ..... \
+                @rprr_g_load_u_sc esz=3 msz=2
+LD1_zprz        1100010 11 1. ..... 11. ... ..... ..... \
+                @rprr_g_load_sc esz=3 msz=3 u=1
+
+# SVE 64-bit gather load (vector plus immediate)
+LD1_zpiz        1100010 .. 01 ..... 1.. ... ..... ..... \
+                @rpri_g_load esz=3
+
 # SVE 64-bit gather prefetch (scalar plus 64-bit scaled offsets)
 PRF             1100010 00 11 ----- 1-- --- ----- 0 ----
 
-- 
2.17.1

