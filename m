Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp360987lfu;
        Tue, 26 Apr 2022 09:38:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqtWfljQ1AADbZIqah2nQ4vZBU5Xujh+ZyASweYbW5zt1qBre27ZiszOqXuKO6G9xAN7UB
X-Received: by 2002:a81:ff06:0:b0:2e6:d7bc:c812 with SMTP id k6-20020a81ff06000000b002e6d7bcc812mr22499974ywn.122.1650991139080;
        Tue, 26 Apr 2022 09:38:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650991139; cv=none;
        d=google.com; s=arc-20160816;
        b=vgdkwK0N4VTo/SlkSkHEhCdqKOL20avrFa+SnQGND8TIBJbwqvhjd38f7PltvvnNqi
         v5oluxrc92SBEm6rQ5W0hdnoSErJcBB+oxaTGu1LXDNV9780yalKec40Kp6EskPEPogb
         9/dUTjCH6lvy2C4pimkSE8J89TN8zoRrOnm7L1uBQLBLSo02KVhN7YeHFwvcG7fC+k5b
         i7VTQNByUc57z3T2KHjenNruMTBEe0S25OB+wIlTC46AaaF8Hysm3xLZ9WEt2aWDu/VV
         cvezKdH3AKGnaXTViafDHHd+D8u+M5usivCfTCnGcm0hXG7yF1jh6PeuAQo9JqsxH9Xh
         SPBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=RvG/ZXY14qN/GxLVgsYoVDV2d6Cg9Hy3tF+gamW3U1s=;
        b=fGl1w56GCvewLKRXyOMFoHle+BiCjnyMyzmP7GWQuVPXj7o6S+ZSXWRuNVGx0WpdZA
         obnkCSzpskn+y8dDhGiI0xZI55ruk7x3x8ju+NLuF2aNt1s4WvK4hmCKRH1Rev52G/Fe
         nyuJ1N/BSacurIf7E6+JhMlG8mF9DU+fpgu7ZB4+FDJhHfrhHoHRxLfupNUrZuQNh26x
         7oyQy3If54itwlLd3sdTt4wh9LvH6JyNI1jCfuClu9EX3zyplrNCRiF+jTEMSYlzDPzg
         3Mb4t6BFwBFonjviRRItQ97z+3ejaQSWnUbKS4i+ilp1zZGf+bzUCXqJzLhEw9SaVZ+t
         27LA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uO1Qc+2a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z82-20020a256555000000b00641b3419c38si13559155ybb.235.2022.04.26.09.38.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Apr 2022 09:38:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uO1Qc+2a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1njODK-0003dO-Go
	for alex.bennee@linaro.org; Tue, 26 Apr 2022 12:38:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5d-0002xB-6t
 for qemu-arm@nongnu.org; Tue, 26 Apr 2022 12:31:04 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:46666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5Z-0003mu-Dq
 for qemu-arm@nongnu.org; Tue, 26 Apr 2022 12:31:00 -0400
Received: by mail-pf1-x42c.google.com with SMTP id j6so16119276pfe.13
 for <qemu-arm@nongnu.org>; Tue, 26 Apr 2022 09:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RvG/ZXY14qN/GxLVgsYoVDV2d6Cg9Hy3tF+gamW3U1s=;
 b=uO1Qc+2a3djRhRyWBUmai4mDONPd11w0vFPiLb5HVlmtizLmQN7Am9oDanuWKZDNrC
 ZcD8sDzeD7KcoBOBnSzfGV0PnQdn+/TwKeW647sHznKBsXtogviLkQc5xcklx5WxB7Gb
 W1OXWlOBDFgdwA1YnCwJPxvH0XdODKi9cuXCiK35cWr/qV5akz9eS5Ht+1NiL97noBXa
 Apoj6P3/UdglaxPxcagEVmUIpw9FYl6j9G0IrbfWz8dm1wcVlz+IgWP7PvMF11IO1PjW
 WenlLjLWP87K2F0syAyYPsdJUq55U8XdxQ8bi89FA0qzhFJSG20F9VFIupe3o6DiY0Gi
 EsKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RvG/ZXY14qN/GxLVgsYoVDV2d6Cg9Hy3tF+gamW3U1s=;
 b=IvS5ACep9nLP9xmetxTSdcHvXMu/LDI3QOHfHttX/tn3l+s59kv0xsvyExI5NqaOKA
 exsx871soiXKTHTq4rZdkDdiYmSKDA2qvR5S3XNkXbbYojKdZ0PzR9mQDQXVkrpMszg5
 8gY4X2/Krp/iGB5ZyqckMl18KS6J6K2CuuBPc1CRVwbbuKOC5aOrJZhCYFtH2L7Ifu6z
 +RGJw85bEcx5CsIcrx4ZnkxlxC7eNISmHX6j41Wgx0voHpTd8/BOQ9keV9XwoXBb1bqp
 sy1topIX6D2atIKuqMDSHMWLP8uAAylAjAtDXlONd47Axxi+ASaZxrrNxdgkacFC8qrd
 DsdQ==
X-Gm-Message-State: AOAM533846syx8uJDoEkjY3qWEMSIT+AfMQ0ckbUbmCtFnf+t6yQ0/P8
 oOydYgJJPYMe4/rlyZNFiGIFIg==
X-Received: by 2002:a63:42c4:0:b0:3a2:b7e5:5077 with SMTP id
 p187-20020a6342c4000000b003a2b7e55077mr20217836pga.427.1650990654979; 
 Tue, 26 Apr 2022 09:30:54 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y131-20020a626489000000b00505a8f36965sm15655813pfb.184.2022.04.26.09.30.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:30:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/47] target/arm: Use tcg_constant in disas_ld_lit
Date: Tue, 26 Apr 2022 09:30:05 -0700
Message-Id: <20220426163043.100432-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426163043.100432-1-richard.henderson@linaro.org>
References: <20220426163043.100432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: reLGgDPjg305

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index af6844b4b6..1caca38a79 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -2778,7 +2778,7 @@ static void disas_ld_lit(DisasContext *s, uint32_t insn)
 
     tcg_rt = cpu_reg(s, rt);
 
-    clean_addr = tcg_const_i64(s->pc_curr + imm);
+    clean_addr = tcg_constant_i64(s->pc_curr + imm);
     if (is_vector) {
         do_fp_ld(s, rt, clean_addr, size);
     } else {
@@ -2788,7 +2788,6 @@ static void disas_ld_lit(DisasContext *s, uint32_t insn)
         do_gpr_ld(s, tcg_rt, clean_addr, size + is_signed * MO_SIGN,
                   false, true, rt, iss_sf, false);
     }
-    tcg_temp_free_i64(clean_addr);
 }
 
 /*
-- 
2.34.1

