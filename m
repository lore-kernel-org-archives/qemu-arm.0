Received: by 10.28.71.27 with SMTP id u27csp2107917wma;
        Sat, 17 Feb 2018 11:18:09 -0800 (PST)
X-Google-Smtp-Source: AH8x226VS+0tYDb52xKTkHNIsKyzF3guwzgwmFz2+txl6qJPnZMhK+PgCRiLpk3ogJQ8+e8aee0c
X-Received: by 10.37.17.4 with SMTP id 4mr1420527ybr.360.1518895089836;
        Sat, 17 Feb 2018 11:18:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518895089; cv=none;
        d=google.com; s=arc-20160816;
        b=yg5l5DEmwG4WlK6qldnB+uRIVA/s2OpQ+DbnoU/ST/f1qJ5+cZI4t0s82GrnzCm1hP
         j7Y2F+/jYFe+3bcwOws4PzqeeYEF48/Z3/sU69LsUCyByW/kuausWMlGccRi6zOetWmL
         Bxbgjl/SEDT8pZ0kK4Wqow1OlxuUbAEg0FVzkxelUZVqAWuyDvG6+k61miToKRkp8teL
         fQEgX/mulpwIStcSt54K3c2mSe+Mzca6NZVMQtfU1kghgSrVe7r8Ua9tCEU1zlTxBOUE
         AqysaHGjnlD+E34pWE8u7aWdXgIpcsldGuZmKe4D3F6ZXvK2xnea2dMDXIfQZBbKya/W
         Crtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=2sKSuIJ/y4jlOeyOJVW8/Dfg+ktvWdZhrQjHSRQzkQA=;
        b=n/iKpUgit59Mx7Exf1kQU+wPkFp2i+BJcJhKiKrEn0yFV3aFj0uiwFehwvyKoZv3mt
         d08q3Q9ybjrlMqol2Qp0mA4FBegVu8juvjt77oxap//D8UbsI1l8IxyLpIiWQwyvjgfJ
         N8WaYivczvCr68ohtvTykqccYqqrXdKHWiR+go3KlkaAnQyLgAtYW5q0rEQprzKHZtPN
         pROz8pAgNpXGjkOXXt/CXgptWZ5X/UfuDXMt2vBR56IO7BU2QzcZYUZR/QRQKzsJVMXC
         Ii3uid6FC290HCouSUtYANYg18szCzc5S5ns0A14BHPQvVYtIa/PFJHn1Batuhnmj1d+
         /5rg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Xr67ruYV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n136si836198ybf.723.2018.02.17.11.18.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 17 Feb 2018 11:18:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Xr67ruYV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48839 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1en7zt-00050z-0z
	for alex.bennee@linaro.org; Sat, 17 Feb 2018 14:18:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40851)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en7AP-0001eu-1J
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:24:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en7AN-0002Bi-5d
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:24:57 -0500
Received: from mail-pl0-x243.google.com ([2607:f8b0:400e:c01::243]:43140)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1en7AM-0002BO-T7
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:24:55 -0500
Received: by mail-pl0-x243.google.com with SMTP id f4so3436706plr.10
	for <qemu-arm@nongnu.org>; Sat, 17 Feb 2018 10:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2sKSuIJ/y4jlOeyOJVW8/Dfg+ktvWdZhrQjHSRQzkQA=;
	b=Xr67ruYVEKWUBhAqQuRPykML7XquFAAR8pijTPSYWPGglP15/CgxzduyTsB7U4ILXY
	UibQXV0F6IuGNYHq5i7WlDqJwi0RnFN56QeXXiGyNWTAmEpz4+Hgu4MXgSAHOciRFWjn
	bNwqk6EgQIdCUZqx6ZTWQUIULqV+o3t25bgjM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=2sKSuIJ/y4jlOeyOJVW8/Dfg+ktvWdZhrQjHSRQzkQA=;
	b=WHVelyP9R9JUk+q8kvEdX2gB7A8MdtR9fZ7D69mDzVD3XaPo50lz3OwW0Lbw9hghnh
	MES3jjxLU40ZTzo3YkrJDBgv3CWQHLZRIXFZY9H8Xh5IeHAAKzI5g+ABy4Yr0NPky7UK
	jIbx+6SFlX4dL/WTdaCsBBlbURa3S9L6sFC9CSeWUPS1mB+0IHYrFEOnA3GA1AdNF4L9
	lJ4giaI4Zq0B/j+0FvHKms0ZFh+6YMi7XzNBMugM/hBYub7OFH152G5Sm4wPpND5Vkx5
	EE95V6wLRLdoQ9O4BHNWEEEZZogTmGAnaMnUJSTTjmUKo5zMJVWYiSDh21c24FQSYSNU
	jclA==
X-Gm-Message-State: APf1xPCEd0Sb9fBQw4iz9ZKs1EiS4alCcwmcwwG2BsUc0nIouu+xJLgm
	jjCWea7rNzJ+El/BnImYOMS2MNIAogc=
X-Received: by 2002:a17:902:bf01:: with SMTP id
	bi1-v6mr9308650plb.254.1518891893898; 
	Sat, 17 Feb 2018 10:24:53 -0800 (PST)
Received: from cloudburst.twiddle.net ([50.0.192.64])
	by smtp.gmail.com with ESMTPSA id
	h15sm13466712pfi.56.2018.02.17.10.24.52
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 17 Feb 2018 10:24:52 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 17 Feb 2018 10:23:11 -0800
Message-Id: <20180217182323.25885-56-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180217182323.25885-1-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::243
Subject: [Qemu-arm] [PATCH v2 55/67] target/arm: Implement SVE gather loads
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 14pEFm73mjw4

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 67 ++++++++++++++++++++++++++++++++
 target/arm/sve_helper.c    | 75 +++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 97 ++++++++++++++++++++++++++++++++++++++++++++++
 target/arm/sve.decode      | 53 +++++++++++++++++++++++++
 4 files changed, 292 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index b5c093f2fd..3cb7ab9ef2 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -919,6 +919,73 @@ DEF_HELPER_FLAGS_4(sve_st1hd_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
 
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
index 07b3d285f2..4edd3d4367 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -3546,6 +3546,81 @@ void HELPER(sve_st4dd_r)(CPUARMState *env, void *vg,
     }
 }
 
+/* Loads with a vector index.  */
+
+#define DO_LD1_ZPZ_S(NAME, TYPEI, TYPEM, FN)                            \
+void HELPER(NAME)(CPUARMState *env, void *vd, void *vg, void *vm,       \
+                  target_ulong base, uint32_t desc)                     \
+{                                                                       \
+    intptr_t i, oprsz = simd_oprsz(desc) / 8;                           \
+    unsigned scale = simd_data(desc);                                   \
+    uintptr_t ra = GETPC();                                             \
+    uint32_t *d = vd; TYPEI *m = vm; uint8_t *pg = vg;                  \
+    for (i = 0; i < oprsz; i++) {                                       \
+        uint8_t pp = pg[H1(i)];                                         \
+        if (pp & 0x01) {                                                \
+            target_ulong off = (target_ulong)m[H4(i * 2)] << scale;     \
+            d[H4(i * 2)] = (TYPEM)FN(env, base + off, ra);              \
+        }                                                               \
+        if (pp & 0x10) {                                                \
+            target_ulong off = (target_ulong)m[H4(i * 2 + 1)] << scale; \
+            d[H4(i * 2 + 1)] = (TYPEM)FN(env, base + off, ra);          \
+        }                                                               \
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
+        if (pg[H1(i)] & 1) {                                            \
+            target_ulong off = (target_ulong)(TYPEI)m[i] << scale;      \
+            d[i] = (TYPEM)FN(env, base + off, ra);                      \
+        }                                                               \
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
index 63c7a0e8d8..6484ecd257 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3914,6 +3914,103 @@ static void do_mem_zpz(DisasContext *s, int zt, int pg, int zm, int scale,
     tcg_temp_free_i32(desc);
 }
 
+/* Indexed by [xs][u][msz].  */
+static gen_helper_gvec_mem_scatter * const gather_load_fn32[2][2][3] = {
+    { { gen_helper_sve_ldbss_zsu,
+        gen_helper_sve_ldhss_zsu,
+        NULL, },
+      { gen_helper_sve_ldbsu_zsu,
+        gen_helper_sve_ldhsu_zsu,
+        gen_helper_sve_ldssu_zsu, } },
+    { { gen_helper_sve_ldbss_zss,
+        gen_helper_sve_ldhss_zss,
+        NULL, },
+      { gen_helper_sve_ldbsu_zss,
+        gen_helper_sve_ldhsu_zss,
+        gen_helper_sve_ldssu_zss, } },
+};
+
+static gen_helper_gvec_mem_scatter * const gather_load_fn64[3][2][4] = {
+    { { gen_helper_sve_ldbds_zsu,
+        gen_helper_sve_ldhds_zsu,
+        gen_helper_sve_ldsds_zsu,
+        NULL, },
+      { gen_helper_sve_ldbdu_zsu,
+        gen_helper_sve_ldhdu_zsu,
+        gen_helper_sve_ldsdu_zsu,
+        gen_helper_sve_ldddu_zsu, } },
+    { { gen_helper_sve_ldbds_zss,
+        gen_helper_sve_ldhds_zss,
+        gen_helper_sve_ldsds_zss,
+        NULL, },
+      { gen_helper_sve_ldbdu_zss,
+        gen_helper_sve_ldhdu_zss,
+        gen_helper_sve_ldsdu_zss,
+        gen_helper_sve_ldddu_zss, } },
+    { { gen_helper_sve_ldbds_zd,
+        gen_helper_sve_ldhds_zd,
+        gen_helper_sve_ldsds_zd,
+        NULL, },
+      { gen_helper_sve_ldbdu_zd,
+        gen_helper_sve_ldhdu_zd,
+        gen_helper_sve_ldsdu_zd,
+        gen_helper_sve_ldddu_zd, } },
+};
+
+static void trans_LD1_zprz(DisasContext *s, arg_LD1_zprz *a, uint32_t insn)
+{
+    gen_helper_gvec_mem_scatter *fn = NULL;
+
+    if (a->esz < a->msz
+        || (a->msz == 0 && a->scale)
+        || (a->esz == a->msz && !a->u)) {
+        unallocated_encoding(s);
+        return;
+    }
+
+    /* TODO: handle LDFF1.  */
+    switch (a->esz) {
+    case MO_32:
+        fn = gather_load_fn32[a->xs][a->u][a->msz];
+        break;
+    case MO_64:
+        fn = gather_load_fn64[a->xs][a->u][a->msz];
+        break;
+    }
+    assert(fn != NULL);
+
+    do_mem_zpz(s, a->rd, a->pg, a->rm, a->scale * a->msz,
+               cpu_reg_sp(s, a->rn), fn);
+}
+
+static void trans_LD1_zpiz(DisasContext *s, arg_LD1_zpiz *a, uint32_t insn)
+{
+    gen_helper_gvec_mem_scatter *fn = NULL;
+    TCGv_i64 imm;
+
+    if (a->esz < a->msz || (a->esz == a->msz && !a->u)) {
+        unallocated_encoding(s);
+        return;
+    }
+
+    /* TODO: handle LDFF1.  */
+    switch (a->esz) {
+    case MO_32:
+        fn = gather_load_fn32[0][a->u][a->msz];
+        break;
+    case MO_64:
+        fn = gather_load_fn64[2][a->u][a->msz];
+        break;
+    }
+    assert(fn != NULL);
+
+    /* Treat LD1_zpiz (zn[x] + imm) the same way as LD1_zprz (rn + zm[x])
+       by loading the immediate into the scalar parameter.  */
+    imm = tcg_const_i64(a->imm << a->msz);
+    do_mem_zpz(s, a->rd, a->pg, a->rn, 0, imm, fn);
+    tcg_temp_free_i64(imm);
+}
+
 static void trans_ST1_zprz(DisasContext *s, arg_ST1_zprz *a, uint32_t insn)
 {
     /* Indexed by [xs][msz].  */
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index f0144aa2d0..f85d82e009 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -81,6 +81,8 @@
 &rpri_load	rd pg rn imm dtype nreg
 &rprr_store	rd pg rn rm msz esz nreg
 &rpri_store	rd pg rn imm msz esz nreg
+&rprr_gather_load	rd pg rn rm esz msz u ff xs scale
+&rpri_gather_load	rd pg rn imm esz msz u ff
 &rprr_scatter_store	rd pg rn rm esz msz xs scale
 
 ###########################################################################
@@ -195,6 +197,18 @@
 @rpri_load_msz	....... .... . imm:s4 ... pg:3 rn:5 rd:5 \
 		&rpri_load dtype=%msz_dtype
 
+# Gather Loads.
+@rprr_g_load_u	      ....... .. .    . rm:5 . u:1 ff:1 pg:3 rn:5 rd:5 \
+		      &rprr_gather_load xs=2
+@rprr_g_load_xs_u     ....... .. xs:1 . rm:5 . u:1 ff:1 pg:3 rn:5 rd:5 \
+		      &rprr_gather_load
+@rprr_g_load_xs_u_sc  ....... .. xs:1 scale:1 rm:5 . u:1 ff:1 pg:3 rn:5 rd:5 \
+		      &rprr_gather_load
+@rprr_g_load_u_sc     ....... .. .    scale:1 rm:5 . u:1 ff:1 pg:3 rn:5 rd:5 \
+		      &rprr_gather_load xs=2
+@rpri_g_load	      ....... msz:2 .. imm:5 . u:1 ff:1 pg:3 rn:5 rd:5 \
+		      &rpri_gather_load
+
 # Stores; user must fill in ESZ, MSZ, NREG as needed.
 @rprr_store	    ....... ..    ..     rm:5 ... pg:3 rn:5 rd:5    &rprr_store
 @rpri_store_msz     ....... msz:2 .. . imm:s4 ... pg:3 rn:5 rd:5    &rpri_store
@@ -766,6 +780,19 @@ LDR_zri		10000101 10 ...... 010 ... ..... .....		@rd_rn_i9
 LD1R_zpri	1000010 .. 1 imm:6 1.. pg:3 rn:5 rd:5 \
 		&rpri_load dtype=%dtype_23_13 nreg=0
 
+# SVE 32-bit gather load (scalar plus 32-bit unscaled offsets)
+# SVE 32-bit gather load (scalar plus 32-bit scaled offsets)
+LD1_zprz	1000010 00 .0 ..... 0.. ... ..... ..... \
+		@rprr_g_load_xs_u esz=2 msz=0 scale=0
+LD1_zprz	1000010 01 .. ..... 0.. ... ..... ..... \
+		@rprr_g_load_xs_u_sc esz=2 msz=1
+LD1_zprz	1000010 10 .. ..... 0.. ... ..... ..... \
+		@rprr_g_load_xs_u_sc esz=2 msz=2
+
+# SVE 32-bit gather load (vector plus immediate)
+LD1_zpiz	1000010 .. 01 ..... 1.. ... ..... ..... \
+		@rpri_g_load esz=2
+
 ### SVE Memory Contiguous Load Group
 
 # SVE contiguous load (scalar plus scalar)
@@ -815,6 +842,32 @@ PRF		1000010 -- 00 ----- 110 --- ----- 0 ----
 
 ### SVE Memory 64-bit Gather Group
 
+# SVE 64-bit gather load (scalar plus 32-bit unpacked unscaled offsets)
+# SVE 64-bit gather load (scalar plus 32-bit unpacked scaled offsets)
+LD1_zprz	1100010 00 .0 ..... 0.. ... ..... ..... \
+		@rprr_g_load_xs_u esz=3 msz=0 scale=0
+LD1_zprz	1100010 01 .. ..... 0.. ... ..... ..... \
+		@rprr_g_load_xs_u_sc esz=3 msz=1
+LD1_zprz	1100010 10 .. ..... 0.. ... ..... ..... \
+		@rprr_g_load_xs_u_sc esz=3 msz=2
+LD1_zprz	1100010 11 .. ..... 0.. ... ..... ..... \
+		@rprr_g_load_xs_u_sc esz=3 msz=3
+
+# SVE 64-bit gather load (scalar plus 64-bit unscaled offsets)
+# SVE 64-bit gather load (scalar plus 64-bit scaled offsets)
+LD1_zprz	1100010 00 10 ..... 1.. ... ..... ..... \
+		@rprr_g_load_u esz=3 msz=0 scale=0
+LD1_zprz	1100010 01 1. ..... 1.. ... ..... ..... \
+		@rprr_g_load_u_sc esz=3 msz=1
+LD1_zprz	1100010 10 1. ..... 1.. ... ..... ..... \
+		@rprr_g_load_u_sc esz=3 msz=2
+LD1_zprz	1100010 11 1. ..... 1.. ... ..... ..... \
+		@rprr_g_load_u_sc esz=3 msz=3
+
+# SVE 64-bit gather load (vector plus immediate)
+LD1_zpiz	1100010 .. 01 ..... 1.. ... ..... ..... \
+		@rpri_g_load esz=3
+
 # SVE 64-bit gather prefetch (scalar plus 64-bit scaled offsets)
 PRF		1100010 00 11 ----- 1-- --- ----- 0 ----
 
-- 
2.14.3

