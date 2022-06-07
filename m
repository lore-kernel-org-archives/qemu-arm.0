Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp2402392lfb;
        Tue, 7 Jun 2022 13:34:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyrmWCXhT8ihk29GeZX8FhT36iimwnR6vYGCM+xWswVcUQpX98wxlC3a4oNR9O2xI1sq0RB
X-Received: by 2002:a05:620a:45a2:b0:6a6:c9e5:aecb with SMTP id bp34-20020a05620a45a200b006a6c9e5aecbmr6658915qkb.694.1654634097093;
        Tue, 07 Jun 2022 13:34:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654634097; cv=none;
        d=google.com; s=arc-20160816;
        b=Lda/DmPvXF4Xy7Tt9Lu67pACWYIv9wd5EESb8TXLqHLS76/vhkxAFR6/X0JWWFGSn5
         DHKoe5fZQP00ugLc9r4TsylKj5HfoVgR9aoUn3824dFLoGqPT9X35X8ttcfMHBUS1iup
         11KaanqzJNxbX4ZO1/Vy0psQyXtnGfyWWCv8py8dPnmlDopkMs0fsp0uGqmXJqX0TV5v
         05Ni24ION3YzgbMy7VIMpOi8mzQEOQsS52AXL0yNhPkeJ8HddROC7hfz1rTuKuxNb7+B
         YexA1CNLI3myH6+f2OTnZutq/TdeGf0qVq3+zd0hwGPQ9Kg86txKEsfUcdsxCW4p/1Qh
         QamQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=AP39jqbPiQO8vlhvr3vURJ9OZT2UOimjCnaJk3rF7/M=;
        b=fmYnoXnclw6efz2GHeHZhWzhkOcubcpCRfr317aht9Yg0ykQMlIIg9sT0LosQRC7yo
         NouDpLUHyenWkDM9JkpCPc0X59hqR4bxTrUrH9PYtKqGFjTHAQMJE0nLHWwgwfoLI3pM
         7THgyAAhQpWlvUTMezTF8k6FFj07JXlZs9eADzlOWIbHnHvDbVg8e8Z6N30wcgxTPnsQ
         GHvQU8YsjgkcFTC4jOmzNJHWIfb+2GQU62XvF+07UqRX/aFvTyokeTEyrQRY200mQnS9
         /VM3d35s/iVKZ5Gpw/dWTHXTcY9KURJP5fO7cwpKY8tqWeoqd8nNoByTzMUd/l9W//m1
         CEEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vgpfk3mv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x21-20020a05620a14b500b006a6c0e03e2fsi3104575qkj.413.2022.06.07.13.34.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jun 2022 13:34:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vgpfk3mv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyfui-0001xz-JJ
	for alex.bennee@linaro.org; Tue, 07 Jun 2022 16:34:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyft3-00079g-8m
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:33:13 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:40865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyft0-0007Be-9R
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:33:13 -0400
Received: by mail-pl1-x62d.google.com with SMTP id i1so15790395plg.7
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AP39jqbPiQO8vlhvr3vURJ9OZT2UOimjCnaJk3rF7/M=;
 b=vgpfk3mvjUZkTNqm14QMdfVoDea50YkP5uMEOvtQveYB27Nhy5EZPwMEvKGinwdbtq
 nxBUiCr3Gn0GHsBcv3o7WK3CwhTsyT8nArc78e3XPYLM3J1+p1YTabdk1VNUSpYT+gma
 GgR3hVMVszxrDG5rduz049TuYZ9hrzitYoDtgBZFEokFubTk0aR3MBGFL1EVhKcLPaKI
 AJbYE2Vuc1QPw1wUIM6+rdco7DgmaH0yL15/lT0vpZl+jR0xioEYNV6wWT03PgnDQIdH
 icvpaWhuUcOCXnNCOniu/8w5OEErQ6WMbJzpZZzFl1aDDJyoPfH68HqPCXKyGkXvtXm9
 XFmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AP39jqbPiQO8vlhvr3vURJ9OZT2UOimjCnaJk3rF7/M=;
 b=BYYhZHKhDqThsXj1spEuXjKBJJpUj2ZzO8S/oZhuhh/HjbqBgDOdoMHzLYKqxzt3JO
 KaUshkMM/7aXQAOmyy2Ovc1I4TK2Ce09CewiYUzh02FoEBU0hmtrIvCHuwLB0fmWk2nE
 /RAVJnhuvt8tB/27qVDEAPAtOq+bui53iITpbfasCzp+yLRmgXZHEL6XvhRcZ8P88uwz
 zUVIQq4D4ao6O9s/oBik5qRPf9uI/pZLJAkprpjaMCGTfB1uArMTtl9V80m8zRz4LoKT
 nRMzaXOAXuzEtFbj9KPqh+lZJ5vEAr9fZGJRsM06xahUcOskYqKsb/+ABUn0ySHmBo7i
 ESag==
X-Gm-Message-State: AOAM532cW4DM3UkU6sserWOLonBbATOyNmjhzmLtWkPYgo1Q3hlo3KZy
 abr3MW3BePedLWZXTAH+8xoXZO8/YcR34Q==
X-Received: by 2002:a17:90a:4413:b0:1cd:2d00:9d0b with SMTP id
 s19-20020a17090a441300b001cd2d009d0bmr33784931pjg.81.1654633988849; 
 Tue, 07 Jun 2022 13:33:08 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a17090aba1600b001d9780b7779sm4227856pjr.15.2022.06.07.13.33.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:33:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 01/71] target/arm: Rename TBFLAG_A64 ZCR_LEN to VL
Date: Tue,  7 Jun 2022 13:31:56 -0700
Message-Id: <20220607203306.657998-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wItWUtbsj3bo

With SME, the vector length does not only come from ZCR_ELx.
Comment that this is either NVL or SVL, like the pseudocode.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Renamed from SVE_LEN to VL.
---
 target/arm/cpu.h           | 3 ++-
 target/arm/translate-a64.h | 2 +-
 target/arm/translate.h     | 2 +-
 target/arm/helper.c        | 2 +-
 target/arm/translate-a64.c | 2 +-
 target/arm/translate-sve.c | 2 +-
 6 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c1865ad5da..015ce12fe2 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3241,7 +3241,8 @@ FIELD(TBFLAG_M32, MVE_NO_PRED, 5, 1)            /* Not cached. */
  */
 FIELD(TBFLAG_A64, TBII, 0, 2)
 FIELD(TBFLAG_A64, SVEEXC_EL, 2, 2)
-FIELD(TBFLAG_A64, ZCR_LEN, 4, 4)
+/* The current vector length, either NVL or SVL. */
+FIELD(TBFLAG_A64, VL, 4, 4)
 FIELD(TBFLAG_A64, PAUTH_ACTIVE, 8, 1)
 FIELD(TBFLAG_A64, BT, 9, 1)
 FIELD(TBFLAG_A64, BTYPE, 10, 2)         /* Not cached. */
diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
index f2e8ee0ee1..dbc917ee65 100644
--- a/target/arm/translate-a64.h
+++ b/target/arm/translate-a64.h
@@ -104,7 +104,7 @@ static inline TCGv_ptr vec_full_reg_ptr(DisasContext *s, int regno)
 /* Return the byte size of the "whole" vector register, VL / 8.  */
 static inline int vec_full_reg_size(DisasContext *s)
 {
-    return s->sve_len;
+    return s->vl;
 }
 
 bool disas_sve(DisasContext *, uint32_t);
diff --git a/target/arm/translate.h b/target/arm/translate.h
index 9f0bb270c5..f473a21ed4 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -42,7 +42,7 @@ typedef struct DisasContext {
     bool ns;        /* Use non-secure CPREG bank on access */
     int fp_excp_el; /* FP exception EL or 0 if enabled */
     int sve_excp_el; /* SVE exception EL or 0 if enabled */
-    int sve_len;     /* SVE vector length in bytes */
+    int vl;          /* current vector length in bytes */
     /* Flag indicating that exceptions from secure mode are routed to EL3. */
     bool secure_routed_to_el3;
     bool vfp_enabled; /* FP enabled via FPSCR.EN */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 40da63913c..960899022d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -13696,7 +13696,7 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
             zcr_len = sve_zcr_len_for_el(env, el);
         }
         DP_TBFLAG_A64(flags, SVEEXC_EL, sve_el);
-        DP_TBFLAG_A64(flags, ZCR_LEN, zcr_len);
+        DP_TBFLAG_A64(flags, VL, zcr_len);
     }
 
     sctlr = regime_sctlr(env, stage1);
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 935e1929bb..d438fb89e7 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14608,7 +14608,7 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
     dc->align_mem = EX_TBFLAG_ANY(tb_flags, ALIGN_MEM);
     dc->pstate_il = EX_TBFLAG_ANY(tb_flags, PSTATE__IL);
     dc->sve_excp_el = EX_TBFLAG_A64(tb_flags, SVEEXC_EL);
-    dc->sve_len = (EX_TBFLAG_A64(tb_flags, ZCR_LEN) + 1) * 16;
+    dc->vl = (EX_TBFLAG_A64(tb_flags, VL) + 1) * 16;
     dc->pauth_active = EX_TBFLAG_A64(tb_flags, PAUTH_ACTIVE);
     dc->bt = EX_TBFLAG_A64(tb_flags, BT);
     dc->btype = EX_TBFLAG_A64(tb_flags, BTYPE);
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 836511d719..67761bf2cc 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -111,7 +111,7 @@ static inline int pred_full_reg_offset(DisasContext *s, int regno)
 /* Return the byte size of the whole predicate register, VL / 64.  */
 static inline int pred_full_reg_size(DisasContext *s)
 {
-    return s->sve_len >> 3;
+    return s->vl >> 3;
 }
 
 /* Round up the size of a register to a size allowed by
-- 
2.34.1

