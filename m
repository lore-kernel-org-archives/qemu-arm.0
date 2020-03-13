Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp2174405lfc;
        Fri, 13 Mar 2020 07:01:13 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvSYOePxGlBxQaXFVPDncK6UFfVKbe+xduNZa9XS6+wPwYPHpdXajMW+Uyac1EMXa1kqEWE
X-Received: by 2002:a05:620a:200d:: with SMTP id c13mr11922101qka.240.1584108073385;
        Fri, 13 Mar 2020 07:01:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584108073; cv=none;
        d=google.com; s=arc-20160816;
        b=lF2MKGCdCl1Wd1AQwY/vjcyAwu038hNZPu15PDPZaIHwHRSXoAhqqsQikFTOxYfBf9
         Km7TZntfMMV+WieP1rOuwqmEbT+3OCan6sp9BHHjgW2KRm8TVeTRjs/JnKLb7kB+uE7D
         YZ2HS7jUj+XVZUj+vpULm0qBSQYsQyU+lkjwxfcNsGvDLlPrAhWeTf1FvKek7sVwkxD6
         QSD74I6/+PI4ef18F4Pcha/I72WEmk7674BPxZzPMugLMTeHLbqgf6LHwXe5BBTTZI+v
         /hwhE65juI5YMr9jXPrJFwzFK2N3RgJAe2R75hrW8oW+f5HcJV2XmcXllpbh/QqFqNyy
         ePaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=MVmvgzWmLT9t4pVMjOpFZQJdgHhP/swZFDta4F54nIE=;
        b=T5JwX9VP2g0uPVmHzz1Bd67DjTFvYxrppdLZYFhPzNJpnc0Cn6YTxhFIU30X6K9pZf
         mcHwjWzdF9/5woPWZpt6S1MJc9zamGZlTwRD6DtzyDc317R+hYORQJ5TU4r5vpRr8tBR
         VqHfWkXdY+4gkwlsZYPRTOJhRD2PQqh47DYgQGvv6AtXjHrRY0IzyFdZNvpwpLLtlyX5
         ZaPvuReVu9CBUofpPo1ih5OeYh2SWOyqPMqd0/87NpFNPODvK/oa+m2tpep7gZuxbNAF
         lWmMGVw0bEHPt7m1djHOzbmXulCajnAbAmXfZsP2aGfdRgh/KjgwnJZFDblHT8nHtKSJ
         sbGA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l6si4697749qtv.23.2020.03.13.07.01.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Mar 2020 07:01:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jCksC-0006T8-OW
	for alex.bennee@linaro.org; Fri, 13 Mar 2020 10:01:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42863)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>) id 1jCkrc-0005cq-4l
 for qemu-arm@nongnu.org; Fri, 13 Mar 2020 10:00:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <remi@remlab.net>) id 1jCkrV-0000mT-VP
 for qemu-arm@nongnu.org; Fri, 13 Mar 2020 10:00:35 -0400
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:49730
 helo=ns207790.ip-94-23-215.eu) by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <remi@remlab.net>)
 id 1jCkrV-0000go-KT; Fri, 13 Mar 2020 10:00:29 -0400
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id 4D9075FE21;
 Fri, 13 Mar 2020 15:00:25 +0100 (CET)
From: =?UTF-8?q?R=C3=A9mi=20Denis-Courmont?= <remi@remlab.net>
To: qemu-arm@nongnu.org
Subject: [PATCH 5/5] target/arm: MTE tag check stubs
Date: Fri, 13 Mar 2020 16:00:23 +0200
Message-Id: <20200313140023.83844-5-remi@remlab.net>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2001:41d0:2:5a1a::
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NPmMO0rM0jAI

From: R=C3=A9mi Denis-Courmont <remi.denis.courmont@huawei.com>

This adds stub function calls for memory tag checking. Much like the
SP alignment check stub, these do not have any effect and will be
optimized at compilation time.

Note: SVE tag checks are not included.

Signed-off-by: R=C3=A9mi Denis-Courmont <remi.denis.courmont@huawei.com>
---
 target/arm/translate-a64.c | 88 +++++++++++++++++++++++++++++++++-----
 1 file changed, 77 insertions(+), 11 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 9382f53794..769206106e 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -855,6 +855,17 @@ static void gen_deposit_tag(TCGv_i64 dest, TCGv_i64 =
source, TCGv_i64 tag)
     tcg_temp_free_i64(tmp);
 }
=20
+static void gen_check_tag_memidx(DisasContext *s, TCGv_i64 tcg_addr, int=
 size,
+                                 bool iswrite, int mem_idx)
+{
+}
+
+static void gen_check_tag(DisasContext *s, TCGv_i64 tcg_addr, int size,
+                          bool iswrite)
+{
+    gen_check_tag_memidx(s, tcg_addr, size, iswrite, get_mem_index(s));
+}
+
 /*
  * Load/Store generators
  */
@@ -2404,13 +2415,16 @@ static void gen_compare_and_swap(DisasContext *s,=
 int rs, int rt,
 {
     TCGv_i64 tcg_rs =3D cpu_reg(s, rs);
     TCGv_i64 tcg_rt =3D cpu_reg(s, rt);
+    TCGv_i64 tcg_rn =3D cpu_reg_sp(s, rn);
     int memidx =3D get_mem_index(s);
     TCGv_i64 clean_addr;
=20
     if (rn =3D=3D 31) {
         gen_check_sp_alignment(s);
+    } else {
+        gen_check_tag(s, tcg_rn, size, true);
     }
-    clean_addr =3D clean_data_tbi(s, cpu_reg_sp(s, rn));
+    clean_addr =3D clean_data_tbi(s, tcg_rn);
     tcg_gen_atomic_cmpxchg_i64(tcg_rs, clean_addr, tcg_rs, tcg_rt, memid=
x,
                                size | MO_ALIGN | s->be_data);
 }
@@ -2422,13 +2436,16 @@ static void gen_compare_and_swap_pair(DisasContex=
t *s, int rs, int rt,
     TCGv_i64 s2 =3D cpu_reg(s, rs + 1);
     TCGv_i64 t1 =3D cpu_reg(s, rt);
     TCGv_i64 t2 =3D cpu_reg(s, rt + 1);
+    TCGv_i64 dirty_addr =3D cpu_reg_sp(s, rn);
     TCGv_i64 clean_addr;
     int memidx =3D get_mem_index(s);
=20
     if (rn =3D=3D 31) {
         gen_check_sp_alignment(s);
+    } else {
+        gen_check_tag(s, dirty_addr, size, true);
     }
-    clean_addr =3D clean_data_tbi(s, cpu_reg_sp(s, rn));
+    clean_addr =3D clean_data_tbi(s, dirty_addr);
=20
     if (size =3D=3D 2) {
         TCGv_i64 cmp =3D tcg_temp_new_i64();
@@ -2542,27 +2559,33 @@ static void disas_ldst_excl(DisasContext *s, uint=
32_t insn)
     int is_lasr =3D extract32(insn, 15, 1);
     int o2_L_o1_o0 =3D extract32(insn, 21, 3) * 2 | is_lasr;
     int size =3D extract32(insn, 30, 2);
-    TCGv_i64 clean_addr;
+    TCGv_i64 dirty_addr, clean_addr;
=20
     switch (o2_L_o1_o0) {
     case 0x0: /* STXR */
     case 0x1: /* STLXR */
+        dirty_addr =3D cpu_reg_sp(s, rn);
         if (rn =3D=3D 31) {
             gen_check_sp_alignment(s);
+        } else {
+            gen_check_tag(s, dirty_addr, size, true);
         }
         if (is_lasr) {
             tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
         }
-        clean_addr =3D clean_data_tbi(s, cpu_reg_sp(s, rn));
+        clean_addr =3D clean_data_tbi(s, dirty_addr);
         gen_store_exclusive(s, rs, rt, rt2, clean_addr, size, false);
         return;
=20
     case 0x4: /* LDXR */
     case 0x5: /* LDAXR */
+        dirty_addr =3D cpu_reg_sp(s, rn);
         if (rn =3D=3D 31) {
             gen_check_sp_alignment(s);
+        } else {
+            gen_check_tag(s, dirty_addr, size, false);
         }
-        clean_addr =3D clean_data_tbi(s, cpu_reg_sp(s, rn));
+        clean_addr =3D clean_data_tbi(s, dirty_addr);
         s->is_ldex =3D true;
         gen_load_exclusive(s, rt, rt2, clean_addr, size, false);
         if (is_lasr) {
@@ -2578,11 +2601,14 @@ static void disas_ldst_excl(DisasContext *s, uint=
32_t insn)
         /* fall through */
     case 0x9: /* STLR */
         /* Generate ISS for non-exclusive accesses including LASR.  */
+        dirty_addr =3D cpu_reg_sp(s, rn);
         if (rn =3D=3D 31) {
             gen_check_sp_alignment(s);
+        } else {
+            gen_check_tag(s, dirty_addr, size, true);
         }
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
-        clean_addr =3D clean_data_tbi(s, cpu_reg_sp(s, rn));
+        clean_addr =3D clean_data_tbi(s, dirty_addr);
         do_gpr_st(s, cpu_reg(s, rt), clean_addr, size, true, rt,
                   disas_ldst_compute_iss_sf(size, false, 0), is_lasr);
         return;
@@ -2595,10 +2621,13 @@ static void disas_ldst_excl(DisasContext *s, uint=
32_t insn)
         /* fall through */
     case 0xd: /* LDAR */
         /* Generate ISS for non-exclusive accesses including LASR.  */
+        dirty_addr =3D cpu_reg_sp(s, rn);
         if (rn =3D=3D 31) {
             gen_check_sp_alignment(s);
+        } else {
+            gen_check_tag(s, dirty_addr, size, false);
         }
-        clean_addr =3D clean_data_tbi(s, cpu_reg_sp(s, rn));
+        clean_addr =3D clean_data_tbi(s, dirty_addr);
         do_gpr_ld(s, cpu_reg(s, rt), clean_addr, size, false, false, tru=
e, rt,
                   disas_ldst_compute_iss_sf(size, false, 0), is_lasr);
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
@@ -2606,13 +2635,16 @@ static void disas_ldst_excl(DisasContext *s, uint=
32_t insn)
=20
     case 0x2: case 0x3: /* CASP / STXP */
         if (size & 2) { /* STXP / STLXP */
+            dirty_addr =3D cpu_reg_sp(s, rn);
             if (rn =3D=3D 31) {
                 gen_check_sp_alignment(s);
+            } else {
+                gen_check_tag(s, dirty_addr, size, true);
             }
             if (is_lasr) {
                 tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
             }
-            clean_addr =3D clean_data_tbi(s, cpu_reg_sp(s, rn));
+            clean_addr =3D clean_data_tbi(s, dirty_addr);
             gen_store_exclusive(s, rs, rt, rt2, clean_addr, size, true);
             return;
         }
@@ -2627,10 +2659,13 @@ static void disas_ldst_excl(DisasContext *s, uint=
32_t insn)
=20
     case 0x6: case 0x7: /* CASPA / LDXP */
         if (size & 2) { /* LDXP / LDAXP */
+            dirty_addr =3D cpu_reg_sp(s, rn);
             if (rn =3D=3D 31) {
                 gen_check_sp_alignment(s);
+            } else {
+                gen_check_tag(s, dirty_addr, size, false);
             }
-            clean_addr =3D clean_data_tbi(s, cpu_reg_sp(s, rn));
+            clean_addr =3D clean_data_tbi(s, dirty_addr);
             s->is_ldex =3D true;
             gen_load_exclusive(s, rt, rt2, clean_addr, size, true);
             if (is_lasr) {
@@ -2881,6 +2916,7 @@ static void disas_ldst_pair(DisasContext *s, uint32=
_t insn)
     bool is_signed =3D false;
     bool postindex =3D false;
     bool wback =3D false;
+    bool memtag =3D false;
=20
     TCGv_i64 clean_addr, dirty_addr;
=20
@@ -2902,6 +2938,7 @@ static void disas_ldst_pair(DisasContext *s, uint32=
_t insn)
                 return;
             }
=20
+            memtag =3D true;
             size =3D 3; /* sic! */
         }
     }
@@ -2947,6 +2984,10 @@ static void disas_ldst_pair(DisasContext *s, uint3=
2_t insn)
     if (!postindex) {
         tcg_gen_addi_i64(dirty_addr, dirty_addr, offset);
     }
+    if (!memtag && rn !=3D 31) {
+        /* Check both loads or stores, size is doubled */
+        gen_check_tag(s, dirty_addr, size + 1, !is_load);
+    }
     clean_addr =3D clean_data_tbi(s, dirty_addr);
=20
     if (is_vector) {
@@ -3088,6 +3129,10 @@ static void disas_ldst_reg_imm9(DisasContext *s, u=
int32_t insn,
     clean_addr =3D clean_data_tbi(s, dirty_addr);
=20
     if (is_vector) {
+        if (rn !=3D 31) {
+            gen_check_tag(s, dirty_addr, size, is_store);
+        }
+
         if (is_store) {
             do_fp_st(s, rt, clean_addr, size);
         } else {
@@ -3098,6 +3143,10 @@ static void disas_ldst_reg_imm9(DisasContext *s, u=
int32_t insn,
         int memidx =3D is_unpriv ? get_a64_user_mem_index(s) : get_mem_i=
ndex(s);
         bool iss_sf =3D disas_ldst_compute_iss_sf(size, is_signed, opc);
=20
+        if (rn !=3D 31) {
+            gen_check_tag_memidx(s, dirty_addr, size, is_store, memidx);
+        }
+
         if (is_store) {
             do_gpr_st_memidx(s, tcg_rt, clean_addr, size, memidx,
                              iss_valid, rt, iss_sf, false);
@@ -3192,6 +3241,9 @@ static void disas_ldst_reg_roffset(DisasContext *s,=
 uint32_t insn,
     ext_and_shift_reg(tcg_rm, tcg_rm, opt, shift ? size : 0);
=20
     tcg_gen_add_i64(dirty_addr, dirty_addr, tcg_rm);
+    if (rn !=3D 31) {
+        gen_check_tag(s, dirty_addr, size, is_store);
+    }
     clean_addr =3D clean_data_tbi(s, dirty_addr);
=20
     if (is_vector) {
@@ -3277,6 +3329,9 @@ static void disas_ldst_reg_unsigned_imm(DisasContex=
t *s, uint32_t insn,
     dirty_addr =3D read_cpu_reg_sp(s, rn, 1);
     offset =3D imm12 << size;
     tcg_gen_addi_i64(dirty_addr, dirty_addr, offset);
+    if (rn !=3D 31) {
+        gen_check_tag(s, dirty_addr, size, is_store);
+    }
     clean_addr =3D clean_data_tbi(s, dirty_addr);
=20
     if (is_vector) {
@@ -3320,7 +3375,7 @@ static void disas_ldst_atomic(DisasContext *s, uint=
32_t insn,
     int o3_opc =3D extract32(insn, 12, 4);
     bool r =3D extract32(insn, 22, 1);
     bool a =3D extract32(insn, 23, 1);
-    TCGv_i64 tcg_rs, clean_addr;
+    TCGv_i64 tcg_rs, dirty_addr, clean_addr;
     AtomicThreeOpFn *fn;
=20
     if (is_vector || !dc_isar_feature(aa64_atomics, s)) {
@@ -3367,10 +3422,14 @@ static void disas_ldst_atomic(DisasContext *s, ui=
nt32_t insn,
         return;
     }
=20
+    dirty_addr =3D cpu_reg_sp(s, rn);
+
     if (rn =3D=3D 31) {
         gen_check_sp_alignment(s);
+    } else {
+        gen_check_tag(s, dirty_addr, size, true);
     }
-    clean_addr =3D clean_data_tbi(s, cpu_reg_sp(s, rn));
+    clean_addr =3D clean_data_tbi(s, dirty_addr);
=20
     if (o3_opc =3D=3D 014) {
         /*
@@ -3446,6 +3505,7 @@ static void disas_ldst_pac(DisasContext *s, uint32_=
t insn,
     offset =3D sextract32(offset << size, 0, 10 + size);
     tcg_gen_addi_i64(dirty_addr, dirty_addr, offset);
=20
+    gen_check_tag(s, dirty_addr, size, false);
     /* Note that "clean" and "dirty" here refer to TBI not PAC.  */
     clean_addr =3D clean_data_tbi(s, dirty_addr);
=20
@@ -3689,6 +3749,9 @@ static void disas_ldst_multiple_struct(DisasContext=
 *s, uint32_t insn)
     elements =3D (is_q ? 16 : 8) / ebytes;
=20
     tcg_rn =3D cpu_reg_sp(s, rn);
+    if (is_postidx || rn !=3D 31) {
+        gen_check_tag(s, tcg_rn, size, is_store);
+    }
     clean_addr =3D clean_data_tbi(s, tcg_rn);
     tcg_ebytes =3D tcg_const_i64(ebytes);
=20
@@ -3832,6 +3895,9 @@ static void disas_ldst_single_struct(DisasContext *=
s, uint32_t insn)
     }
=20
     tcg_rn =3D cpu_reg_sp(s, rn);
+    if (is_postidx || rn !=3D 31) {
+        gen_check_tag(s, tcg_rn, size, !is_load);
+    }
     clean_addr =3D clean_data_tbi(s, tcg_rn);
     tcg_ebytes =3D tcg_const_i64(ebytes);
=20
--=20
2.25.1

