Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp1493084lfb;
        Mon, 19 Apr 2021 13:36:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwgeh+ppygdr0ZHhILJDi499/D3lLni7Xub9uTS1AKI/qbNAPf6H8b4TGy+BstL0GcO4WWs
X-Received: by 2002:a05:6e02:cce:: with SMTP id c14mr19261299ilj.32.1618864604541;
        Mon, 19 Apr 2021 13:36:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618864604; cv=none;
        d=google.com; s=arc-20160816;
        b=Vyk5F+RgIYMS8pite2Wk10mEIsR6PhMpDmg1jkflxktKoxDYRcUxAGfezNrL55jv46
         5RRe5sFru9layhWnoduRCWlvCSeab8XUQFkMrJd2mA9VkqewZH5B5/B5CIyLuGly1YGV
         G8bbCuRB7UVNXU2jZkaOhUX0EpSEBLwa5CKDReZqLCbwvjMwpRtCevuOzZ9ZDImWqy4b
         YS+0fQSLZiUAvLkquHRfSz/VVDYibaq3W1HjflLwhByugqofwDnbhOKncnfDCsmdlkc1
         gyjpZ4t4BHHQCMkOy639ypZ0sDhLpqKTanNkpatjPoQg5oATpvdJNGzAOKpIBEh3mWMC
         VguA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=NvWPQV4xvO1L8h7zcVc9dinU9c9HeGRd57GCvcd1vwA=;
        b=Xl9zfDR+8WzdN5paGPdElxIhPornDGnvU79YZEnleRTgn8rzo5F8RtL9PMtR8j0Gj8
         shVWNEKC7018dzV9mg/6gTWZ56QZZ1JYBHTsD4LYDyNIha9KEcTBRGUAMHF1d3CdmE7O
         nmj7elFUdkSETLe6xSAphqGrkLIvhIVomiNMCXv6NkWFu0PRDubZeTDSQcM5sL5+qS3r
         sPltC7AjhVWIl1pcQ4fWW3WU4b6bx71nXUyaHpJ+Yc0FWH3KVAKgqpVTrryPjHpkE7VX
         xtffX2HZtspxvhDJ28mxwupa7vNWuTX3Jj+Vc9Cnsv4D8vBGje7iCyxqoPjW7GM434qq
         FD3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SuvKMXzJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r5si18117317ilg.18.2021.04.19.13.36.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Apr 2021 13:36:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SuvKMXzJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lYadP-0002xK-SB
	for alex.bennee@linaro.org; Mon, 19 Apr 2021 16:36:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQZ-0007MO-Td
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 16:23:27 -0400
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:46699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQX-0002Z9-Ek
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 16:23:27 -0400
Received: by mail-qk1-x732.google.com with SMTP id v7so9116528qkj.13
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 13:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NvWPQV4xvO1L8h7zcVc9dinU9c9HeGRd57GCvcd1vwA=;
 b=SuvKMXzJEh4gZcsyjNBDoX939oulss6EdCuEtHTf3bNma455ARcV7bwPoR2sazjZMK
 YYZYjjsjcIzrFCldRpDt70l2TX+IllIVia4o7uwf8RWFY3miO2O7YVf9obxgc9s6NJtR
 bV7ewDF1XADLWacs7W/VfPtZ4vQjaA0C6v3C+wsIZphj2BunHfXpgWZTtAP6t5FRdrJr
 QFy7Gc5yR7H/x6oFEQDr80Lvu8WBnpDf0Y2WqOgEqqG1WL0A6F/OA4IxyqcEHHv+tEjt
 mnQnxS9C/vyBIrjN+ZgXWFRoKKW23CnN4Gwd9TatCYPtRiEmY+Ncq4NbTC0DLVLlGAF4
 0qQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NvWPQV4xvO1L8h7zcVc9dinU9c9HeGRd57GCvcd1vwA=;
 b=QdiENXSWpwOuG5oWDATGIp4Q3QJz2NMjBMX/5EwQv3d44fVtklxm/zrjAKoxA1Z5Pq
 HGPOjhZ8Yd1s7o/6uCFITeg2M1d4j4aPIZWriacGs05a97M0oehykXPVL5pqzOm9/aac
 XayxzRMaH18XbOOI0Lrlk/ZVqnfEuXghMRswG/dAVOLFAShS8rbLTZVDstvWwHAj/NBa
 bz8HIun4AcJLEAwYXUSYtXogkWSDBkhHBTpi4RRIaYLu1nBWSHuTg7UqP20bQSHOt6Pw
 ygDlOgb3s0HVzJ0igq3Q7L9+uDxthVQFXsL6Vr95dHjODqHLUymd8vzbP1pgVQ1qQ1kF
 kPrw==
X-Gm-Message-State: AOAM531BOPo+sa/3kRB0BKxDaSwNKIVxTTG49tTb+6IdkWECJ53v0dn6
 AqbN0jdUF/0qohgYYK1yTV00HXyulrmipOul
X-Received: by 2002:a05:620a:66a:: with SMTP id
 a10mr8863074qkh.272.1618863804616; 
 Mon, 19 Apr 2021 13:23:24 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:80c7:aba4:3594:91a:8889:c77a])
 by smtp.gmail.com with ESMTPSA id c23sm10007835qtm.46.2021.04.19.13.23.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 13:23:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 13/31] target/arm: Fix SCTLR_B test for TCGv_i64 load/store
Date: Mon, 19 Apr 2021 13:22:39 -0700
Message-Id: <20210419202257.161730-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210419202257.161730-1-richard.henderson@linaro.org>
References: <20210419202257.161730-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x732.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: d/9/Oq4brfhj

Just because operating on a TCGv_i64 temporary does not
mean that we're performing a 64-bit operation.  Restrict
the frobbing to actual 64-bit operations.

This bug is not currently visible because all current
users of these two functions always pass MO_64.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index b47a58ee9a..d37a3dfa4a 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -982,7 +982,7 @@ static void gen_aa32_ld_i64(DisasContext *s, TCGv_i64 val, TCGv_i32 a32,
     tcg_gen_qemu_ld_i64(val, addr, index, opc);
 
     /* Not needed for user-mode BE32, where we use MO_BE instead.  */
-    if (!IS_USER_ONLY && s->sctlr_b) {
+    if (!IS_USER_ONLY && s->sctlr_b && (opc & MO_SIZE) == MO_64) {
         tcg_gen_rotri_i64(val, val, 32);
     }
 
@@ -1001,7 +1001,7 @@ static void gen_aa32_st_i64(DisasContext *s, TCGv_i64 val, TCGv_i32 a32,
     TCGv addr = gen_aa32_addr(s, a32, opc);
 
     /* Not needed for user-mode BE32, where we use MO_BE instead.  */
-    if (!IS_USER_ONLY && s->sctlr_b) {
+    if (!IS_USER_ONLY && s->sctlr_b && (opc & MO_SIZE) == MO_64) {
         TCGv_i64 tmp = tcg_temp_new_i64();
         tcg_gen_rotri_i64(tmp, val, 32);
         tcg_gen_qemu_st_i64(tmp, addr, index, opc);
-- 
2.25.1

