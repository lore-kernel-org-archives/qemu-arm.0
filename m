Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1214116lfh;
        Fri, 27 May 2022 11:37:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJytOxHZLH08hjkokHmzT+T0Dt8Z0WsdJE9Z1ZzvmE/Abph70WEWgxGY7JneYZEepYp3pcrb
X-Received: by 2002:a05:622a:1346:b0:2f9:17ce:2f1d with SMTP id w6-20020a05622a134600b002f917ce2f1dmr31372674qtk.657.1653676675446;
        Fri, 27 May 2022 11:37:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653676675; cv=none;
        d=google.com; s=arc-20160816;
        b=jmKUirJ34/ikskX/t0qFQO49EeYXkV+YXCJFUbwtmYa/nJgGNDBekSGFNALmwXhstl
         HUm0W/C0oltIiCTOK15Ajv5a5FZBXt4tWpEfLkGEV3TzxBg29GhHMog7vo6fVkvRA2XG
         PXeLq2hoBgxZWyOoOSFmVYMx9LDrDgP2tlQnLJ3XlLsRfKTxDNrffyszo0hmboDIcvVA
         g6vuA2B4dHZaj2UM4Cj8DabPXT1zg+PdSs6O6RSHmMLL+5eztMcTlp/A1R7QF5QjMlUw
         nDhv007rWpm13Lp+BiGO78FB5svYl8QHdsnoqyKPUMbm6ldX0dQQd1mawT7NSQ7MPJ36
         BGuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=hh+yVTkfrv20wz04vQt9P4JgpNv6kDUvDG5bwUl77uY=;
        b=tblP0JeMupmP7/QkdlJ+aUJNHU8/HorZ8d8VSpBOOwI1FNhAnOy/RTe6+lXTlMcHuj
         Q4okVg1Lx7XsnT/Q2p7MhWbOqjMDG2XrEcb/XUanrvRdyBZ+6R0qb1ZKfjopoVnAXV5a
         WzkEhJDv1PXOhmY2WUfmSYPyGSc75gPeBIHFleSE8SlyiNylUEyRA24BZlg8zeYfyxUi
         0x0TBf6uudb+H8Qupf5KDKSFmA3gmmhBGZETub0qCKhQVlyLK+Z7pL688JjKj46F7NWe
         +rhUC3g+URG4+V0CIEzhqDKdzqUjSLGxy70k9sx+Gy7izKpZPr6gKd2JBBgf3c+az39N
         xSJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R2y2rgWY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u14-20020a05622a14ce00b002f90aedacccsi2967778qtx.494.2022.05.27.11.37.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 11:37:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R2y2rgWY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nueqQ-0007u1-Up
	for alex.bennee@linaro.org; Fri, 27 May 2022 14:37:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYV-0006aI-Kk
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:23 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:34690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYT-0003Uj-C0
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:23 -0400
Received: by mail-pg1-x530.google.com with SMTP id g184so4598017pgc.1
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hh+yVTkfrv20wz04vQt9P4JgpNv6kDUvDG5bwUl77uY=;
 b=R2y2rgWYxDWmhF6mH+uwZIEo3CIaAVWD7ZRZpx192tw73OJ/IUlIUj7g5Zjj9ipULb
 sFHjNzfhBt+GFyUGOGIk7DbDDgznsEWemQRerkUQaQIZiIlp/MiNQEXCiLPPfnGpp74F
 dfLn8oYkw9CNYLsIRnUbYDO4zD7nsqj91ZJiCH1iLfv7ydEduQ7HaF26JvhcfFy/TDUH
 PV4TOdQH1KhAZGEigBYSYPo/0blSzv8WHiYdGa/sjbDrAh+OXfaxoKbJJwIwSqROJFZn
 FaB7uL1/1AAhdpJ9MyFfRDfkcMThfQuCxgYy9RdsZ+7nRQdKpUbVcFN5OyrD6iKki+dM
 FOJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hh+yVTkfrv20wz04vQt9P4JgpNv6kDUvDG5bwUl77uY=;
 b=tEEKiHzy3mqRQHs89MR2pPZ+t78oqxdxtzpyEURVG1NLCAqa0hDlPzMiXGLxfioOcD
 rGacIOenD5Q8MKEDTjaNmcBNq9xPPL4elzREyx/5tTkLK/wDWLhbR2tqIhz79svSWKhF
 1b5tnI9xvAXcrT1odm1BjzSHGZLl1minkZ1Fvtyb7KSA5BX37AhLxGBKfdGfpMcnn4Z5
 htcvExsx7NgngCkpI3hA6y6WZFyflYijH7WoTpe5+SDsfzJTgLB+x1t1OzPga1NHFHTY
 rOV2kk4AJu9ETpcaPXgJg0XexTfxjmbNe1BZn3MrMw8RIFeW0lDCNWRH7ej6o4l8rqzl
 ZVvA==
X-Gm-Message-State: AOAM532Xl6uLNclLR8B3ENUHtYWuddvDNPpSS3PMpOjDw8aEgBAD8G4R
 R4hM2+QK52AiCNlDxW4IALURWFvTnAXD8A==
X-Received: by 2002:a63:1724:0:b0:3fb:be5d:dccd with SMTP id
 x36-20020a631724000000b003fbbe5ddccdmr2112868pgl.625.1653675560477; 
 Fri, 27 May 2022 11:19:20 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a17090ae50500b001deb3cbd8f1sm1911612pjy.27.2022.05.27.11.19.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:19:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 012/114] target/arm: Use TRANS_FEAT for gen_gvec_ool_arg_zzzz
Date: Fri, 27 May 2022 11:17:25 -0700
Message-Id: <20220527181907.189259-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: O/GpumDpuQvv

Convert SVE translation functions directly using
gen_gvec_ool_arg_zzzz to TRANS_FEAT.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 47 ++++++++------------------------------
 1 file changed, 10 insertions(+), 37 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index cae6df705a..f7367a4f62 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -8302,37 +8302,15 @@ static bool trans_FMLSLT_zzxw(DisasContext *s, arg_rrxr_esz *a)
     return do_FMLAL_zzxw(s, a, true, true);
 }
 
-static bool do_i8mm_zzzz_ool(DisasContext *s, arg_rrrr_esz *a,
-                             gen_helper_gvec_4 *fn, int data)
-{
-    if (!dc_isar_feature(aa64_sve_i8mm, s)) {
-        return false;
-    }
-    return gen_gvec_ool_arg_zzzz(s, fn, a, data);
-}
+TRANS_FEAT(SMMLA, aa64_sve_i8mm, gen_gvec_ool_arg_zzzz,
+           gen_helper_gvec_smmla_b, a, 0)
+TRANS_FEAT(USMMLA, aa64_sve_i8mm, gen_gvec_ool_arg_zzzz,
+           gen_helper_gvec_usmmla_b, a, 0)
+TRANS_FEAT(UMMLA, aa64_sve_i8mm, gen_gvec_ool_arg_zzzz,
+           gen_helper_gvec_ummla_b, a, 0)
 
-static bool trans_SMMLA(DisasContext *s, arg_rrrr_esz *a)
-{
-    return do_i8mm_zzzz_ool(s, a, gen_helper_gvec_smmla_b, 0);
-}
-
-static bool trans_USMMLA(DisasContext *s, arg_rrrr_esz *a)
-{
-    return do_i8mm_zzzz_ool(s, a, gen_helper_gvec_usmmla_b, 0);
-}
-
-static bool trans_UMMLA(DisasContext *s, arg_rrrr_esz *a)
-{
-    return do_i8mm_zzzz_ool(s, a, gen_helper_gvec_ummla_b, 0);
-}
-
-static bool trans_BFDOT_zzzz(DisasContext *s, arg_rrrr_esz *a)
-{
-    if (!dc_isar_feature(aa64_sve_bf16, s)) {
-        return false;
-    }
-    return gen_gvec_ool_arg_zzzz(s, gen_helper_gvec_bfdot, a, 0);
-}
+TRANS_FEAT(BFDOT_zzzz, aa64_sve_bf16, gen_gvec_ool_arg_zzzz,
+           gen_helper_gvec_bfdot, a, 0)
 
 static bool trans_BFDOT_zzxz(DisasContext *s, arg_rrxr_esz *a)
 {
@@ -8343,13 +8321,8 @@ static bool trans_BFDOT_zzxz(DisasContext *s, arg_rrxr_esz *a)
                              a->rd, a->rn, a->rm, a->ra, a->index);
 }
 
-static bool trans_BFMMLA(DisasContext *s, arg_rrrr_esz *a)
-{
-    if (!dc_isar_feature(aa64_sve_bf16, s)) {
-        return false;
-    }
-    return gen_gvec_ool_arg_zzzz(s, gen_helper_gvec_bfmmla, a, 0);
-}
+TRANS_FEAT(BFMMLA, aa64_sve_bf16, gen_gvec_ool_arg_zzzz,
+           gen_helper_gvec_bfmmla, a, 0)
 
 static bool do_BFMLAL_zzzw(DisasContext *s, arg_rrrr_esz *a, bool sel)
 {
-- 
2.34.1

