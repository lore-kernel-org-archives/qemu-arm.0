Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp6832709lfc;
        Tue, 16 Feb 2021 14:48:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzT+KAdDEoI/mnkpt+1N/g7H2zn1JDjhyjYlR1pT94du7lFiZ5+Icf7SC5LdpdAD5jKUT4Z
X-Received: by 2002:a25:5754:: with SMTP id l81mr29823625ybb.126.1613515710682;
        Tue, 16 Feb 2021 14:48:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613515710; cv=none;
        d=google.com; s=arc-20160816;
        b=ZjFM6Uj9l/3vNF+L0RJ537BcWqM8O1zJWrGC4OCoM1mASs3/p6Cyg6JUVe4sSpeCuI
         45iIU90HRlfl28B2hlnv/HVQA0PNW+e78D6l4HudEVyQ7L6AU3GdSaK4VsXz0VaglZi4
         siFL1u5oXUa4mtN3eWg9txSTpmANOViYmePG+V1PSFUf01VxfXSSQnk2hs+XZFCEl4UE
         aSVCOBVzulVWJIBi0xW7J7J6n+5RcJr8oaItO4jPEOh/WStG0U9x1kv0RUJLvXuRE0FW
         GZMbpNfH85JsZ+/McfItSCCHLSceA/ycygkanh8zrSr7/TkBLEr2SKH9ULHqUeAMuwFO
         IGkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=4ZPSLm3yrNAClwWOzT7/VZpNZh4ixX7KNguZeQ0+66w=;
        b=n0S5CzbkiQ0PJQUARcHMbVancehxskcKToDIIfOeK0tANEtv8/ufBMCJdLawfTVA+E
         OaYmsPIiMVbIh/91pu/+Pwld36T0o+8f6X1mIxEJc5UxZhnoqdHS3scnGJh9oBSp+i96
         JjH4OuiSX5c/vd6VWynsPvri9ipJ+7OK13j0SlWs3jf9PQU1LF9SCOKXhpl/m5LCI8cO
         QFDVy8doaMyY09gseVcbVi9ot4xaIae6NWeCm+ms9Zx5OErDjGj03bSjZ63vqIADyjkg
         BAczOVln4PaUd3NsJCiJwCmJBCk7JUzlW5s9F3ak3rHGDFl5aigOo9cwFGKEnbLB3HAd
         muLw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=nfOSWq5X;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n193si323794yba.369.2021.02.16.14.48.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Feb 2021 14:48:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=nfOSWq5X;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lC98w-0002x4-1d
	for alex.bennee@linaro.org; Tue, 16 Feb 2021 17:48:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lC96W-0000sf-Ff
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 17:46:01 -0500
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:42780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lC96T-0004sq-3T
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 17:46:00 -0500
Received: by mail-ot1-x32e.google.com with SMTP id q4so10419499otm.9
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 14:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4ZPSLm3yrNAClwWOzT7/VZpNZh4ixX7KNguZeQ0+66w=;
 b=nfOSWq5Xkj4tBIKxivwikGdBpW5vU8aqHCg1EloTco9y5Iw2XrGVoY/s6cOJa7aklH
 unLIHOWXiaLXqBJUZ4mb4etI2UJ7Hw0sNqEFRY2rvzYBQAHl57gFE/hioWbEulO6XtnU
 yxebmgW26qOfmzJSMvJXmSj/xllQUasi8rKRqQfo82OrKtz9i7KLnun2neR5OOkHEieE
 YhBNVostm/nGYhlRf1ron/mqH7Vw3GI2DwRHDtILVLUTVfDG0Fr3azpAtkdmrISh/Ltv
 AYgsZhtGmAcxVUcqA3T44RoSIYKkOW0tig2o5WJyNzEPzTfcWims37s1ERLUW9BbAdQs
 TRJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4ZPSLm3yrNAClwWOzT7/VZpNZh4ixX7KNguZeQ0+66w=;
 b=gBk8PM3KDUS8tShVJdTLv0m9/s7Z2xMcr16+bl/rA3QNrLMGY6FlBjPuY0xfkVbd76
 mUNK6Jd+o1OYJrEFuE3dtUEUbbP+Ps4eiZ9i2IGGPcrz9s9w9e+sPGCmXVo/4xhsVSj9
 XMCtz4W/l2LnNfhWTi7QaXXDyCtGyTb4IHT/tb/22vhg2JlTSJYZ70G6MyRD6rGKuI3e
 +EXKU60sa0Wr1JJmdx4XOlmNnGXvHUNP+9I/SoXfBBU6NPQMIoqddGdR5f5JEMuh3ol2
 O9v/PKgj8ZuZdSqJUCnLz4H8yRwboowNV4ukh4/Lh/NNCSH2/8dDb56Z8qzRZ/IXeah9
 x/lQ==
X-Gm-Message-State: AOAM531VvbADP1ZXwG/b3GnixQ6kUOYRoCI8ixYs6XnVIwZbF+ixzSbG
 qHs5dKp4quxBZbmYdkKXUSmnPQ==
X-Received: by 2002:a9d:861:: with SMTP id 88mr16612524oty.27.1613515556196;
 Tue, 16 Feb 2021 14:45:56 -0800 (PST)
Received: from cube.nuviainc.com (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id b12sm32909oti.65.2021.02.16.14.45.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 14:45:55 -0800 (PST)
From: Rebecca Cran <rebecca@nuviainc.com>
To: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 3/3] target/arm: Set ID_PFR2.SSBS to 1 for "max" 32-bit CPU
Date: Tue, 16 Feb 2021 15:45:43 -0700
Message-Id: <20210216224543.16142-4-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210216224543.16142-1-rebecca@nuviainc.com>
References: <20210216224543.16142-1-rebecca@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=rebecca@nuviainc.com; helo=mail-ot1-x32e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Rebecca Cran <rebecca@nuviainc.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rfe9QsQpDRHY

Enable FEAT_SSBS for the "max" 32-bit CPU.

Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 5cf6c056c50f..88a6b183d325 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2206,6 +2206,10 @@ static void arm_max_initfn(Object *obj)
         t = cpu->isar.id_pfr0;
         t = FIELD_DP32(t, ID_PFR0, DIT, 1);
         cpu->isar.id_pfr0 = t;
+
+        t = cpu->isar.id_pfr2;
+        t = FIELD_DP32(t, ID_PFR2, SSBS, 1);
+        cpu->isar.id_mfr2 = t;
     }
 #endif
 }
-- 
2.26.2

