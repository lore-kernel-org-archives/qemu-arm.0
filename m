Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp1497101lfc;
        Thu, 11 Jun 2020 07:46:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJztjZUiHtKUuKg/p2qDatdxra/7B+ghpDvs9V59MAzLjABqB1Rkby0Um065aABoz6Om1rqR
X-Received: by 2002:a25:f46:: with SMTP id 67mr14652788ybp.434.1591886768146;
        Thu, 11 Jun 2020 07:46:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591886768; cv=none;
        d=google.com; s=arc-20160816;
        b=MplomhgSPrRqVsjM4t8bItfXMDMaNi6cn0+Z39JDoCh5zdMiUGrc/a44CqYk/BycCl
         M8CYVlSw5qZVNV3sgKHexpBcWczoJiclOpFjkw3KLxE/VbzGx0pJLcKlXy9B+LrtukN1
         I4vLXekD6E9+VKGViyLcbySaKHxZ1Whmr26CGx/gXww0ewg+aMb3W4IImrn5nIyIoKq0
         kw0Ti0LTobhABw7hbgy1nGruJ1LE49mUkfpoJxlyw9Uf++uc3hQBB9ZXMCY57oTFoA7R
         BrByt6W4HPAAn9xi0J9K+sOWQJ6Xjmyz1TbDqm+Eejvg6EmtWDiZjxn8QXFWrMDaI42I
         bWrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ha29nD9STSEXti9LVVGKrzWg/TQORlHiDcjPJW4gwWc=;
        b=WpgMUNohR4CGaz2/44TVKugFyDzgGSrPgLeZFrIkD9vNjWal/EjUEEFaDXojraBv4F
         tqSgSELqk84+sBwQL4Vf8zG02Hf37KuryCQ7FfdB4fbPeX5BD/vr/1YknzVLENtzzEwF
         o5xbFYlx8r3h+WaKjY+l+jW8FRHefLGa7w5M2Bb1tV6s1uiS8jGEBCwgxbJT4+tuFkZe
         BtIbrg7Ne6+8WnxNuMj8gHz5Pvt2Gl8rNG5VB6XcW3TQBcL32aOajZEfbZ+/cFUO40uT
         v2NyVHoLkRLWjBGc+7Xpof1QTqmvSTB96XMOl+zgbk3T+9eQ7k2SPh17vpESAnb6V/Tt
         qg0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SKbVUUSL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 133si2561018ybe.464.2020.06.11.07.46.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jun 2020 07:46:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SKbVUUSL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jjOT1-0001bO-CK
	for alex.bennee@linaro.org; Thu, 11 Jun 2020 10:46:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jjOSl-0001UD-EJ
 for qemu-arm@nongnu.org; Thu, 11 Jun 2020 10:45:51 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:33524)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jjOSj-0003rr-OO
 for qemu-arm@nongnu.org; Thu, 11 Jun 2020 10:45:50 -0400
Received: by mail-wm1-x342.google.com with SMTP id j198so7126732wmj.0
 for <qemu-arm@nongnu.org>; Thu, 11 Jun 2020 07:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ha29nD9STSEXti9LVVGKrzWg/TQORlHiDcjPJW4gwWc=;
 b=SKbVUUSLxltVE1kVP5JQZdR+xZp/xWRCGF+fI7AM9scIoy4Hs7zxBIDk9KC4uHxb9t
 U8RLImzXrj2uU0263XbTMjYXI55154XeLxnaU5R4ZIfTIUcv+pRswF+BbU1zhYhNSyD+
 Bs28jsd2cl0dLbKm0kHGV5TdSjRF8ut4BlWbvW3+uNkMQLd6fmzQ9PzBpcB4r4xIhtMZ
 XR8/g3W3k6hJVsYfcUzTq2goeRcQ70utI1BqSfcBSUmE9GAOB467SoGL8gqZcSSVefYE
 3eGYD4iXYUg3TyA3c38QHavoid83JDoP4EMsefB5f6AJ9xlgr8HwJpxVmrAVwV1fFXGh
 Ns+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ha29nD9STSEXti9LVVGKrzWg/TQORlHiDcjPJW4gwWc=;
 b=qneaPqOkHcjvigqUHzTLlIawfC30qIeNiXiXgYjakFVmOgO3ebUsJpnOjogbUqAomM
 bmnxPIDCy9dHcP1SbaIrnRXw4047OiPAlEDrSUL36ze6EywbnNyURzKcEKqqZuB/9Cse
 0yi+jm+BpJZtmexXWT5uW1g3Hx3xFC2AV/4I7y1b1W8jyHfK+SsNCpJ42gPg9Cp7gJiU
 ctMlor8MdetzdwgsMXSFpKlycmugHtulYnANb4SQmSCTrmi9fJQJSitGNW3EmGZy0hex
 5rKtWjoAvxHWTywYZyC4zhsolzGOFWO/vMn89OEBTfS6ny2+YNuMTx1R+TMX6dg1r74c
 DQQg==
X-Gm-Message-State: AOAM532z77Owp2CMUVVmIjzP3NbIyNcqCj3Al0YtrcrU2gaHdQeRxetq
 bHxiJYYZe1zzu8TF0J8bIIaFq74ylNdsHA==
X-Received: by 2002:a7b:c1d4:: with SMTP id a20mr8254325wmj.153.1591886740327; 
 Thu, 11 Jun 2020 07:45:40 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id h18sm5271658wru.7.2020.06.11.07.45.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2020 07:45:39 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 06/10] target/arm: Convert Neon 2-reg-scalar VQRDMLAH,
 VQRDMLSH to decodetree
Date: Thu, 11 Jun 2020 15:45:25 +0100
Message-Id: <20200611144529.8873-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200611144529.8873-1-peter.maydell@linaro.org>
References: <20200611144529.8873-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
X-TUID: BAOjVO/NqT/h

Convert the VQRDMLAH and VQRDMLSH insns in the 2-reg-scalar
group to decodetree.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/neon-dp.decode       |  3 ++
 target/arm/translate-neon.inc.c | 74 +++++++++++++++++++++++++++++++++
 target/arm/translate.c          | 38 +----------------
 3 files changed, 79 insertions(+), 36 deletions(-)

diff --git a/target/arm/neon-dp.decode b/target/arm/neon-dp.decode
index 105cf2b2db3..7b069abe628 100644
--- a/target/arm/neon-dp.decode
+++ b/target/arm/neon-dp.decode
@@ -488,5 +488,8 @@ Vimm_1r          1111 001 . 1 . 000 ... .... cmode:4 0 . op:1 1 .... @1reg_imm
 
     VQDMULH_2sc  1111 001 . 1 . .. .... .... 1100 . 1 . 0 .... @2scalar
     VQRDMULH_2sc 1111 001 . 1 . .. .... .... 1101 . 1 . 0 .... @2scalar
+
+    VQRDMLAH_2sc 1111 001 . 1 . .. .... .... 1110 . 1 . 0 .... @2scalar
+    VQRDMLSH_2sc 1111 001 . 1 . .. .... .... 1111 . 1 . 0 .... @2scalar
   ]
 }
diff --git a/target/arm/translate-neon.inc.c b/target/arm/translate-neon.inc.c
index 6301016d5cf..19344ac331d 100644
--- a/target/arm/translate-neon.inc.c
+++ b/target/arm/translate-neon.inc.c
@@ -2575,3 +2575,77 @@ static bool trans_VQRDMULH_2sc(DisasContext *s, arg_2scalar *a)
 
     return do_2scalar(s, a, opfn[a->size], NULL);
 }
+
+static bool do_vqrdmlah_2sc(DisasContext *s, arg_2scalar *a,
+                            NeonGenThreeOpEnvFn *opfn)
+{
+    /*
+     * VQRDMLAH/VQRDMLSH: this is like do_2scalar, but the opfn
+     * performs a kind of fused op-then-accumulate using a helper
+     * function that takes all of rd, rn and the scalar at once.
+     */
+    TCGv_i32 scalar;
+    int pass;
+
+    if (!arm_dc_feature(s, ARM_FEATURE_NEON)) {
+        return false;
+    }
+
+    if (!dc_isar_feature(aa32_rdm, s)) {
+        return 1;
+    }
+
+    /* UNDEF accesses to D16-D31 if they don't exist. */
+    if (!dc_isar_feature(aa32_simd_r32, s) &&
+        ((a->vd | a->vn | a->vm) & 0x10)) {
+        return false;
+    }
+
+    if (!opfn) {
+        /* Bad size (including size == 3, which is a different insn group) */
+        return false;
+    }
+
+    if (a->q && ((a->vd | a->vn) & 1)) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    scalar = neon_get_scalar(a->size, a->vm);
+
+    for (pass = 0; pass < (a->q ? 4 : 2); pass++) {
+        TCGv_i32 rn = neon_load_reg(a->vn, pass);
+        TCGv_i32 rd = neon_load_reg(a->vd, pass);
+        opfn(rd, cpu_env, rn, scalar, rd);
+        tcg_temp_free_i32(rn);
+        neon_store_reg(a->vd, pass, rd);
+    }
+    tcg_temp_free_i32(scalar);
+
+    return true;
+}
+
+static bool trans_VQRDMLAH_2sc(DisasContext *s, arg_2scalar *a)
+{
+    static NeonGenThreeOpEnvFn *opfn[] = {
+        NULL,
+        gen_helper_neon_qrdmlah_s16,
+        gen_helper_neon_qrdmlah_s32,
+        NULL,
+    };
+    return do_vqrdmlah_2sc(s, a, opfn[a->size]);
+}
+
+static bool trans_VQRDMLSH_2sc(DisasContext *s, arg_2scalar *a)
+{
+    static NeonGenThreeOpEnvFn *opfn[] = {
+        NULL,
+        gen_helper_neon_qrdmlsh_s16,
+        gen_helper_neon_qrdmlsh_s32,
+        NULL,
+    };
+    return do_vqrdmlah_2sc(s, a, opfn[a->size]);
+}
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 5d0e00f92e0..f0db029f66d 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -5179,6 +5179,8 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
                 case 9: /* Floating point VMUL scalar */
                 case 12: /* VQDMULH scalar */
                 case 13: /* VQRDMULH scalar */
+                case 14: /* VQRDMLAH scalar */
+                case 15: /* VQRDMLSH scalar */
                     return 1; /* handled by decodetree */
 
                 case 3: /* VQDMLAL scalar */
@@ -5238,42 +5240,6 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
                         neon_store_reg64(cpu_V0, rd + pass);
                     }
                     break;
-                case 14: /* VQRDMLAH scalar */
-                case 15: /* VQRDMLSH scalar */
-                    {
-                        NeonGenThreeOpEnvFn *fn;
-
-                        if (!dc_isar_feature(aa32_rdm, s)) {
-                            return 1;
-                        }
-                        if (u && ((rd | rn) & 1)) {
-                            return 1;
-                        }
-                        if (op == 14) {
-                            if (size == 1) {
-                                fn = gen_helper_neon_qrdmlah_s16;
-                            } else {
-                                fn = gen_helper_neon_qrdmlah_s32;
-                            }
-                        } else {
-                            if (size == 1) {
-                                fn = gen_helper_neon_qrdmlsh_s16;
-                            } else {
-                                fn = gen_helper_neon_qrdmlsh_s32;
-                            }
-                        }
-
-                        tmp2 = neon_get_scalar(size, rm);
-                        for (pass = 0; pass < (u ? 4 : 2); pass++) {
-                            tmp = neon_load_reg(rn, pass);
-                            tmp3 = neon_load_reg(rd, pass);
-                            fn(tmp, cpu_env, tmp, tmp2, tmp3);
-                            tcg_temp_free_i32(tmp3);
-                            neon_store_reg(rd, pass, tmp);
-                        }
-                        tcg_temp_free_i32(tmp2);
-                    }
-                    break;
                 default:
                     g_assert_not_reached();
                 }
-- 
2.20.1

