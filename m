Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp359845lfu;
        Tue, 26 Apr 2022 09:37:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyr47s482s69FY/VZ7Up1ig4Goq9coWClTAy2yd8HvoB8Ii2jdFLzR9k5t/5B2AhCgzkmwy
X-Received: by 2002:a0d:fb47:0:b0:2ec:586:466 with SMTP id l68-20020a0dfb47000000b002ec05860466mr24042113ywf.403.1650991028257;
        Tue, 26 Apr 2022 09:37:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650991028; cv=none;
        d=google.com; s=arc-20160816;
        b=lhIIJgT1RC8lA1il1anu+YQQnOn41v8IakvbHrn286Eeu5FWiBqXjfHs5ifhj+5f1Q
         5+wxhYvuf5kLBufSZmo6W+XBtbv8HoYzFy9MyGuMdUHy2WDO+t1zaAuVvtCI3Eg5F43b
         BTiqJXG1/Af6AYiEqIkd9DBtaWcrd2lTSUbIdJBSaMB4XEDKINTrz9e7LAgLOWL9VrR7
         WIDiHnLoVBOo4N4MW99qcQDKIkfuHxZrP5/dNj2PcqMR9DtyMZO5OplI9klxR3RFMl+H
         kR9m39ZJkR65/TvzmK9+GpuOOd20pjfrJ30dvYmZAZQlGBUOhWulhFQakCyXkodPVtQ6
         Fj6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=DozsVFM8TLDnuoUizPakS5ZW3NXzpPygo/avvBFMmuk=;
        b=bfBWAzDfKGAk7L0LBhAQkf5ViLXI+K6YlnNL0L9I+R3WWSfP5ATDykrrHJjFlzTMP/
         SlEnlz/eIhwsvAs+rUgR1oZTfstM1exJ7NomMsNn1o1mZp3SazgEU1VD9Du2ZH6qsL1q
         IM30y2977xQ2X8nuydWXHeZi4hjvsxdGd/ofFuQCBPwkQ8HT7dHRBC745trx5HKzBqfg
         YK7zHGZqzjIkqm6yj/x3hvSQXSdiy98GotL4+674Y4ELrqxonf6iePVlukhQEUSBj13P
         TTly7Y+Kr2KhLqqXpLqSeK/fJzvErL5S3dj4la8sfKKZCrDnQkk8dVlKg1U7biVdZ/hw
         +keQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ncY5yoLu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 124-20020a250682000000b0064870cedd59si4989347ybg.403.2022.04.26.09.37.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Apr 2022 09:37:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ncY5yoLu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1njOBX-0006Hv-Hm
	for alex.bennee@linaro.org; Tue, 26 Apr 2022 12:37:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5f-0002xU-3w
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:31:04 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:45666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5c-0003nR-4W
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:31:02 -0400
Received: by mail-pl1-x630.google.com with SMTP id h12so27010424plf.12
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 09:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DozsVFM8TLDnuoUizPakS5ZW3NXzpPygo/avvBFMmuk=;
 b=ncY5yoLujCFy3hnVOiZOY1fjkRRlP6lxgeND3uivk2cNkfWQLUr8co2rHUdReRL/aq
 Yprj9caZ/DBw8MVpdnh/U/vhlww7Hq1aoI/iIOwtufuHenPy1etg3j5u5Ory3TI1Ii+c
 aBu10NQSvhweTsSBDP9rhBYyVPaW3qqaVF7owPQrJ2k1Kf2uOcsEPRW2da+JkcbpfhhV
 VrAECkSrN8Snx+38D5uho1wPLUBBmopeTAPTOzvNcGoE4d1DGS3D9gAOCFADxZietp0l
 DpbK+IHFf7j9M+4st3fvrLnuIZ0YA4Nx28FvwvXX+4TJGaL086W14cViRg6lyF4Nbd44
 JSeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DozsVFM8TLDnuoUizPakS5ZW3NXzpPygo/avvBFMmuk=;
 b=zqxggzQj2suTkF+AETJCPaiHeIM0LkDtArDvVZobRUB+Yd0UnQ+u/CV9okYxyvdpz5
 1R0g2zkR3mi70QMM75LsB4KHSdD9dBCGXY1UETBfSzMOpvnZLNBd929A3xHNS/xCi8Z7
 V7/j/x07os+Ag0Dpso4y3P8nOmxvrj17mZxitHrk6KrSVzTyFx5tjFrgGKs26arxISav
 J6PPI0mMm1jA48U4z/hh48WcjPj4OS1ZcVssbaYaDr2VhIiVcNAfrv8o5m7ZvMascPkS
 Eo2+VEcbRNVke4dAp4NyF0D98kYLbjNCFUGQUuXsFjoNiTJmC5qjoy0QbFVFLepZv3+o
 VFIg==
X-Gm-Message-State: AOAM530NCtIqo81nEXvTs+wb0pE95EU416dGB5ijsDqgY+Z69qamfTV2
 2+tuQc2krxZO9ZYzA1r0hXh9VhtfJiTxlQ==
X-Received: by 2002:a17:90b:1d12:b0:1d9:8499:545d with SMTP id
 on18-20020a17090b1d1200b001d98499545dmr10554875pjb.96.1650990656879; 
 Tue, 26 Apr 2022 09:30:56 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y131-20020a626489000000b00505a8f36965sm15655813pfb.184.2022.04.26.09.30.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:30:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/47] target/arm: Use tcg_constant in disas_add_sum_imm*
Date: Tue, 26 Apr 2022 09:30:07 -0700
Message-Id: <20220426163043.100432-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426163043.100432-1-richard.henderson@linaro.org>
References: <20220426163043.100432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7v0c56eE9Z0y

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 4cdc869d52..6c88772eb3 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -4178,13 +4178,12 @@ static void disas_add_sub_imm(DisasContext *s, uint32_t insn)
             tcg_gen_addi_i64(tcg_result, tcg_rn, imm);
         }
     } else {
-        TCGv_i64 tcg_imm = tcg_const_i64(imm);
+        TCGv_i64 tcg_imm = tcg_constant_i64(imm);
         if (sub_op) {
             gen_sub_CC(is_64bit, tcg_result, tcg_rn, tcg_imm);
         } else {
             gen_add_CC(is_64bit, tcg_result, tcg_rn, tcg_imm);
         }
-        tcg_temp_free_i64(tcg_imm);
     }
 
     if (is_64bit) {
@@ -4232,12 +4231,9 @@ static void disas_add_sub_imm_with_tags(DisasContext *s, uint32_t insn)
     tcg_rd = cpu_reg_sp(s, rd);
 
     if (s->ata) {
-        TCGv_i32 offset = tcg_const_i32(imm);
-        TCGv_i32 tag_offset = tcg_const_i32(uimm4);
-
-        gen_helper_addsubg(tcg_rd, cpu_env, tcg_rn, offset, tag_offset);
-        tcg_temp_free_i32(tag_offset);
-        tcg_temp_free_i32(offset);
+        gen_helper_addsubg(tcg_rd, cpu_env, tcg_rn,
+                           tcg_constant_i32(imm),
+                           tcg_constant_i32(uimm4));
     } else {
         tcg_gen_addi_i64(tcg_rd, tcg_rn, imm);
         gen_address_with_allocation_tag0(tcg_rd, tcg_rd);
-- 
2.34.1

