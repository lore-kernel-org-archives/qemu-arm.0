Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1334237ejc;
        Fri, 13 Oct 2023 01:00:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0VC8MA0y9tu8DQfGAWMxhPf4gBXZJgDROHc0C7YDJOuOL5KV2CNVlPqqTHHepzOz1FItV
X-Received: by 2002:a0c:db85:0:b0:66d:33d:147d with SMTP id m5-20020a0cdb85000000b0066d033d147dmr7491606qvk.20.1697184031773;
        Fri, 13 Oct 2023 01:00:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697184031; cv=none;
        d=google.com; s=arc-20160816;
        b=BamaYMrc7Szc0+ShRW7xbJcj2NTepKlCAK1c5Ap1qw6yTcZHzJWm7gQZTFacZkKSy6
         1bMB3PQZ8ahaD4aDBkF8TmhFG4g1uig7y64ApeB2dd3p487ckKKGYZq9Lgpe/+UggnyE
         N6kpkFk1t9Xf9isrOPEc2pWQf+Nep+VK4yrriIRgmApyNAbAHxR45fn7a4rdw+K14WMR
         6iq19ubwZ/Fsw6+xtXzrd6SGocDKMhWUYtdCY72FaTlNCREmGj1NgPl9q4udC4tLkKfa
         urTS10GiMd4zw4psLo2UqDvN3khk36aQAqOeQVzncL3mZDXOLCUS6iGqgza9EMMix/Ci
         ibzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=EG1O6Mx5hoCtdrOzDPsTcbmTGnAeTbLpG3HtBfPjsQM=;
        fh=Q5j3d+8fxxaYMVsyi33+av38g5+/Y2Uo6wKHRTNzKMk=;
        b=Itl5qOEsxSdp2FgJurBynzy2dOP/8Z2LkNfUIc24xH8EG4unHXbmRHPWlBFcNGquFm
         YQbMtPv1Na7rhPKz8Yy8z8FyyRoRLZmJAPu9ZwGwfmsZxYmqDQMvM7fGdEjuHYcW3U/T
         8wnbBL/NOUQLxjk0TJeJ+Qj6bcWeqLvj5WZhiLPGoVr6pH4fVWDUIkF4AeJr6V689gmA
         6PH4Zkjkjgz+IjCj0pLNeICjbhJGnSiIYpbqUK4yHLyOi4r36WYwF1HqHh4EEMaNcKal
         bpo953ALvCfRSTPKFBouBM5WjD2BWKpkE4SwIkgu3O0qF72NKovzcmL8yvc8QFlslraj
         zmug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kf9J4zKg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id mx19-20020a0562142e1300b0065cfd573687si819709qvb.292.2023.10.13.01.00.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Oct 2023 01:00:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kf9J4zKg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qrCx2-0006PG-JJ; Fri, 13 Oct 2023 03:51:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrCwk-0005J4-NB
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 03:50:59 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrCwV-0004pH-7r
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 03:50:58 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-32d9d8284abso243948f8f.3
 for <qemu-arm@nongnu.org>; Fri, 13 Oct 2023 00:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697183442; x=1697788242; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EG1O6Mx5hoCtdrOzDPsTcbmTGnAeTbLpG3HtBfPjsQM=;
 b=kf9J4zKgDLRIffOLROhbwCheQovcrfYUmYMs5bGCsiI1htcIr5s2dLy701HuuLKCMM
 9dnaV9ZMBResmpeACU0q3bykOqD+1arRxIELXjbGAly+2Az0A8ZiQzqtgFzJTI9u/g45
 uih8P++a/Xnr8aWHV0QwoNvoN8HhRIcijhBB249zbTBNq2d0igqovPkFdVsVaES5xjqE
 3qG8OdmKDiPnBXeQ8lk88MWFk1h8eJOntvYMP1h9kWs/LVK6VNSt1VtrCEAX7+OM7hXH
 LBzxhVt/biXAMrIIJaOcKYmEyVr59gaGUY8VRdkZo6cSdIJgSSdBPMarpgHY7T0rv+19
 IQFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697183442; x=1697788242;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EG1O6Mx5hoCtdrOzDPsTcbmTGnAeTbLpG3HtBfPjsQM=;
 b=ReDInPhS1qD2OpKtsR0zsgNlJk5VUdwbC3f5bexYsc9vuqKQSh0KOOJW33yqKwvkU/
 OmOmsLatgFWDQPGSmtnGbX7XN51K4lHxRK2Qa02sMzxNu3T0AOO1t6v1gfA5nsguzUIt
 jAXLsQSPS7ryMEOhEHoHLn1QjQPi53TeYF17VK0Ex0F1iPFUyzMSy5gncVA5JOcwdXII
 fr3uiXD+Fv/ZjDet06Zkw36ivvny2qK11o+ZcZBDQZzcj+hwl/DVJrt9b3r/lad4dbCF
 r0IXlxploLCLINzPXYSgeXxp/6iyt7NfkiiXV/PuzucOSQB4COfJgQh3+IZ8hFCfbxBO
 TcMg==
X-Gm-Message-State: AOJu0YweL79v6fX4e+UvWkR+GZA0J7/65w64AI5kLRPFmViJQbfjrlmr
 82Spijqf0XvyPQE+cZEuVl1FTg==
X-Received: by 2002:a05:6000:1379:b0:32d:939d:c7cf with SMTP id
 q25-20020a056000137900b0032d939dc7cfmr2914562wrz.52.1697183441828; 
 Fri, 13 Oct 2023 00:50:41 -0700 (PDT)
Received: from localhost.localdomain (adsl-170.109.242.226.tellas.gr.
 [109.242.226.170]) by smtp.gmail.com with ESMTPSA id
 m8-20020adfa3c8000000b0032d7fde2d3csm7990663wrb.79.2023.10.13.00.50.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 00:50:41 -0700 (PDT)
From: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-block@nongnu.org
Cc: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [RFC PATCH 27/78] target/riscv: add fallthrough pseudo-keyword
Date: Fri, 13 Oct 2023 10:47:31 +0300
Message-Id: <e05d7549f265f8e4d2b250d6dd582979c76e048c.1697183082.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1697183081.git.manos.pitsidianakis@linaro.org>
References: <cover.1697183081.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wr1-x42f.google.com
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
X-TUID: d3Mr1dtpA2TH

In preparation of raising -Wimplicit-fallthrough to 5, replace all
fall-through comments with the fallthrough attribute pseudo-keyword.

Signed-off-by: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 target/riscv/insn_trans/trans_rvi.c.inc   |  2 +-
 target/riscv/insn_trans/trans_rvzce.c.inc | 22 +++++++++++-----------
 target/riscv/translate.c                  |  4 ++--
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index 25cb60558a..98dd2e3cf6 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -89,61 +89,61 @@ static bool trans_jalr(DisasContext *ctx, arg_jalr *a)
 static TCGCond gen_compare_i128(bool bz, TCGv rl,
                                 TCGv al, TCGv ah, TCGv bl, TCGv bh,
                                 TCGCond cond)
 {
     TCGv rh = tcg_temp_new();
     bool invert = false;
 
     switch (cond) {
     case TCG_COND_EQ:
     case TCG_COND_NE:
         if (bz) {
             tcg_gen_or_tl(rl, al, ah);
         } else {
             tcg_gen_xor_tl(rl, al, bl);
             tcg_gen_xor_tl(rh, ah, bh);
             tcg_gen_or_tl(rl, rl, rh);
         }
         break;
 
     case TCG_COND_GE:
     case TCG_COND_LT:
         if (bz) {
             tcg_gen_mov_tl(rl, ah);
         } else {
             TCGv tmp = tcg_temp_new();
 
             tcg_gen_sub2_tl(rl, rh, al, ah, bl, bh);
             tcg_gen_xor_tl(rl, rh, ah);
             tcg_gen_xor_tl(tmp, ah, bh);
             tcg_gen_and_tl(rl, rl, tmp);
             tcg_gen_xor_tl(rl, rh, rl);
         }
         break;
 
     case TCG_COND_LTU:
         invert = true;
-        /* fallthrough */
+        fallthrough;
     case TCG_COND_GEU:
         {
             TCGv tmp = tcg_temp_new();
             TCGv zero = tcg_constant_tl(0);
             TCGv one = tcg_constant_tl(1);
 
             cond = TCG_COND_NE;
             /* borrow in to second word */
             tcg_gen_setcond_tl(TCG_COND_LTU, tmp, al, bl);
             /* seed third word with 1, which will be result */
             tcg_gen_sub2_tl(tmp, rh, ah, one, tmp, zero);
             tcg_gen_sub2_tl(tmp, rl, tmp, rh, bh, zero);
         }
         break;
 
     default:
         g_assert_not_reached();
     }
 
     if (invert) {
         cond = tcg_invert_cond(cond);
     }
     return cond;
 }
diff --git a/target/riscv/insn_trans/trans_rvzce.c.inc b/target/riscv/insn_trans/trans_rvzce.c.inc
index 2d992e14c4..f0bcbb4f72 100644
--- a/target/riscv/insn_trans/trans_rvzce.c.inc
+++ b/target/riscv/insn_trans/trans_rvzce.c.inc
@@ -116,52 +116,52 @@ static bool trans_c_sh(DisasContext *ctx, arg_c_sh *a)
 static uint32_t decode_push_pop_list(DisasContext *ctx, target_ulong rlist)
 {
     uint32_t reg_bitmap = 0;
 
     if (has_ext(ctx, RVE) && rlist > 6) {
         return 0;
     }
 
     switch (rlist) {
     case 15:
         reg_bitmap |=  1 << (X_Sn + 11) ;
         reg_bitmap |=  1 << (X_Sn + 10) ;
-        /* FALL THROUGH */
+        fallthrough;
     case 14:
         reg_bitmap |=  1 << (X_Sn + 9) ;
-        /* FALL THROUGH */
+        fallthrough;
     case 13:
         reg_bitmap |=  1 << (X_Sn + 8) ;
-        /* FALL THROUGH */
+        fallthrough;
     case 12:
         reg_bitmap |=  1 << (X_Sn + 7) ;
-        /* FALL THROUGH */
+        fallthrough;
     case 11:
         reg_bitmap |=  1 << (X_Sn + 6) ;
-        /* FALL THROUGH */
+        fallthrough;
     case 10:
         reg_bitmap |=  1 << (X_Sn + 5) ;
-        /* FALL THROUGH */
+        fallthrough;
     case 9:
         reg_bitmap |=  1 << (X_Sn + 4) ;
-        /* FALL THROUGH */
+        fallthrough;
     case 8:
         reg_bitmap |=  1 << (X_Sn + 3) ;
-        /* FALL THROUGH */
+        fallthrough;
     case 7:
         reg_bitmap |=  1 << (X_Sn + 2) ;
-        /* FALL THROUGH */
+        fallthrough;
     case 6:
         reg_bitmap |=  1 << X_S1 ;
-        /* FALL THROUGH */
+        fallthrough;
     case 5:
         reg_bitmap |= 1 << X_S0;
-        /* FALL THROUGH */
+        fallthrough;
     case 4:
         reg_bitmap |= 1 << xRA;
         break;
     default:
         break;
     }
 
     return reg_bitmap;
 }
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index f0be79bb16..c99e513221 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -431,26 +431,26 @@ static void gen_set_gpr128(DisasContext *ctx, int reg_num, TCGv rl, TCGv rh)
 static TCGv_i64 get_fpr_hs(DisasContext *ctx, int reg_num)
 {
     if (!ctx->cfg_ptr->ext_zfinx) {
         return cpu_fpr[reg_num];
     }
 
     if (reg_num == 0) {
         return tcg_constant_i64(0);
     }
     switch (get_xl(ctx)) {
     case MXL_RV32:
 #ifdef TARGET_RISCV32
     {
         TCGv_i64 t = tcg_temp_new_i64();
         tcg_gen_ext_i32_i64(t, cpu_gpr[reg_num]);
         return t;
     }
 #else
-    /* fall through */
+    fallthrough;
     case MXL_RV64:
         return cpu_gpr[reg_num];
 #endif
     default:
         g_assert_not_reached();
     }
 }
@@ -505,24 +505,24 @@ static TCGv_i64 dest_fpr(DisasContext *ctx, int reg_num)
 /* assume it is nanboxing (for normal) or sign-extended (for zfinx) */
 static void gen_set_fpr_hs(DisasContext *ctx, int reg_num, TCGv_i64 t)
 {
     if (!ctx->cfg_ptr->ext_zfinx) {
         tcg_gen_mov_i64(cpu_fpr[reg_num], t);
         return;
     }
     if (reg_num != 0) {
         switch (get_xl(ctx)) {
         case MXL_RV32:
 #ifdef TARGET_RISCV32
             tcg_gen_extrl_i64_i32(cpu_gpr[reg_num], t);
             break;
 #else
-        /* fall through */
+        fallthrough;
         case MXL_RV64:
             tcg_gen_mov_i64(cpu_gpr[reg_num], t);
             break;
 #endif
         default:
             g_assert_not_reached();
         }
     }
 }
-- 
2.39.2

