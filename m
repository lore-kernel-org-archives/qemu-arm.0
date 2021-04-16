Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp656919lfr;
        Fri, 16 Apr 2021 12:11:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyeRLEqkCRcFL1W/63kxItTdWXbkHXxbFW+KCPvre9NzlgXIG6BKvE5/5XyuIJzgbwC3EkI
X-Received: by 2002:aca:edc5:: with SMTP id l188mr1744283oih.140.1618600316797;
        Fri, 16 Apr 2021 12:11:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618600316; cv=none;
        d=google.com; s=arc-20160816;
        b=QBygJ9W+JaJss59SygF2sb7K4DSkCcnoJnks+d1g+qphfyQ13Yxs6Ol/CqnuFBGWws
         Z2FWBaLlaEjEFudsOwflGc/B+T6ukM2SYbwIqfBFq8QgRklZ07aYYo2pXjxHgjQo9PT0
         AmgmbN6jiO7rFGnzIv1GvU8kOwW37MzbRLt5tyqUOjev0u8RmSKgrkaKHLS6IWX2D60/
         d4hmslmKHd4YQBTOY1v1zBWM5MSqKX6q1SejB2X2/5M0HICDP+txGR55NaCuVylfGdN8
         3I+iR95DgbP9DEqm+/6MUIVz6L21MyBRPrLd6oECIxxKBwyclzGT6uGVctELSu1IMAaW
         OO7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=I2U8YEM62/D08WuqUDIDv71u1YA11N1lnaYze760LqI=;
        b=JocwWlokoczpZ3a3h8TVfj8WWMKvacmr+rQ6919PUCquhU3/mrDW71wFK4wFdSY4yt
         9I/hpM6XPUpkmqOWFAst28dwBo+MZNhvpCG763AuJ/TYtX/1sOnPhr8+HkYYJT/jEuAy
         2/ggaK1gKSWRVVi+pMMwO+G1JzsNynQ9L4xZMpQvOfNLa4YCZZHbDetLcKi3+rNkwcG/
         RhQmfmz5pBYULV6EUpfup2durHi4Hr3+j1OomyIvs1bDMp0Unw2u0LzPXLsni8ezO/Wg
         RWYD6wkvAixkHHbR6KsMyyzgYpJ916ptEC5TVN5wTkObHOAftdDicEODd1pVobGkGLSJ
         mJfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=V+77bUFw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u3si6516802oib.40.2021.04.16.12.11.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 12:11:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=V+77bUFw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXTsi-000893-4E
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 15:11:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThl-0003nr-04
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 15:00:37 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:38532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThU-0004P1-G7
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 15:00:36 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 k23-20020a17090a5917b02901043e35ad4aso16901393pji.3
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 12:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I2U8YEM62/D08WuqUDIDv71u1YA11N1lnaYze760LqI=;
 b=V+77bUFwuTA+ecu4Ft7TtYrNKuDVCGQ9KVIHBWbAbLb0nImCFggps2RiC9mgXnn0sw
 SoUdtzj0070FnvTHMaTjYIZ/hwGy9KXCBGnc9sGt+kjYMpwrPaUh2TL0Ehz6MuU6hPO1
 gk2wnQZVhxg+uuAMtgMFY/9Z/KO4ZOcNgfDyOESsM4L+isXRvJbcIrHU2Qw2kHaHyF4o
 knQBEx8Th3r/Nj2RwyXTIBeISJqYtyIoxcyWfwfn5WQNqC1RGW7b0DQj150K09DeLFW0
 pk9KK+p88BJHjXMAN0od0eQ3GoYOn4sGFEef2COSWoYviBUejgIGuXSyhhLX1C8AmlaX
 BISQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I2U8YEM62/D08WuqUDIDv71u1YA11N1lnaYze760LqI=;
 b=drUNFeq1LieAjK0m4oVOyYItScyhHvrfPcGoMz1OtK6UxLEOfeCd6P+LExMne7zplk
 Kf+r0FIFGleG69k42qkXtGXG51c5+5CqP7V1yKsFeSxO++jFMPgJva26VYsknwpm3rAx
 le684so+ejQWRAZailiPmdOSPC32cNITxvLarMLMx+Nrj8ErdJ61oSpGrs4ThQkinqfK
 CM2eoEvogYkx8XjIF7gNunkVz5OcFq/Mt2mAMnEh4hnYoANydPVN8yD4e0ntb76UypgA
 8xaUtVluEKH46zRMVvlnApx3e0/ySGonOdL3GOJxV7lBuZ9DDbFYILrNZh3XuwHzi9L1
 SN8A==
X-Gm-Message-State: AOAM531NBndbAXvvnsdixwdIkvOe/FUMjPTWhNvu1HvJN2//10N6AKhD
 CNAZGFlKLFtXr7dnX95VtF4kGv4oK8pQ2A==
X-Received: by 2002:a17:90a:d983:: with SMTP id
 d3mr3455339pjv.99.1618599618727; 
 Fri, 16 Apr 2021 12:00:18 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id d7sm1988337pfv.197.2021.04.16.12.00.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 12:00:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 18/30] target/arm: Enforce alignment for SRS
Date: Fri, 16 Apr 2021 11:59:47 -0700
Message-Id: <20210416185959.1520974-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416185959.1520974-1-richard.henderson@linaro.org>
References: <20210416185959.1520974-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
X-TUID: EpN0xVuTj9DB

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 6d2339ebad..c2970521c0 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -5200,11 +5200,11 @@ static void gen_srs(DisasContext *s,
     }
     tcg_gen_addi_i32(addr, addr, offset);
     tmp = load_reg(s, 14);
-    gen_aa32_st32(s, tmp, addr, get_mem_index(s));
+    gen_aa32_st_i32(s, tmp, addr, get_mem_index(s), MO_UL | MO_ALIGN);
     tcg_temp_free_i32(tmp);
     tmp = load_cpu_field(spsr);
     tcg_gen_addi_i32(addr, addr, 4);
-    gen_aa32_st32(s, tmp, addr, get_mem_index(s));
+    gen_aa32_st_i32(s, tmp, addr, get_mem_index(s), MO_UL | MO_ALIGN);
     tcg_temp_free_i32(tmp);
     if (writeback) {
         switch (amode) {
-- 
2.25.1

