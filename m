Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F965C55167
	for <qemu-arm@archiver.kernel.org>; Fri, 31 Jul 2026 00:07:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wpakf-0001op-2H; Thu, 30 Jul 2026 20:05:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wpakZ-0001mf-8L
 for qemu-arm@nongnu.org; Thu, 30 Jul 2026 20:05:20 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wpakW-0001QL-4w
 for qemu-arm@nongnu.org; Thu, 30 Jul 2026 20:05:19 -0400
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-ca913a601fbso241867a12.3
 for <qemu-arm@nongnu.org>; Thu, 30 Jul 2026 17:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785456314; x=1786061114; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=0ns65FLTaqMAOS6M+ta0Sf/0BSXRfHxqkcsDeE7GiUs=;
 b=XUXa/gLjGsgjXHi7v/KlkJmtvbR0bmI72N5vuU6uSP8mkbYoOTBJI2alFDJrRwPeUR
 reDwJkteUTs2EOFAkUmqr50sTDqjAWBfWtWnSnRDY5lnxm/AAxbCjcMSmyMmE2qBVTbZ
 aFSf6SMGiS09Gk2AS22HtOI2siifsZ/jFTOTYplpWRh7BAZwP3hlCqzNxOzDgx2dNCYD
 oG2nXGljzmnU5B9nrA6n3+t49/mzN+lAa1reLsvg2KjqWD5YhvIQm4j1sRHtzngDawcZ
 /tnH4aVZK9s3Z4aMmp43iHVtrTEfD1Xfy/487p27248H4dsVCyuw9tR9XX1Hx7z1WLDP
 Q2Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785456314; x=1786061114;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=0ns65FLTaqMAOS6M+ta0Sf/0BSXRfHxqkcsDeE7GiUs=;
 b=WCGxHve5uIfsjTmpAtLHAfwoNgIEE/VaukNGV/AyUQcPVCzHmoaC9Rep701ghN+eVC
 5Q6DCLzeC5uH5Vj4J/1gVLLTy4EonxwIyd9zazzwfnNuP2SkxztXnhhL6YidoR41soY/
 L3/FopXrfH1GUuX4YIDVuSr1CkGypTt+g6tHZQ+s/TrT5g8OfN6vxrJZHBAl02hlQQ8S
 Ns+luCwPCPR3aYTUYanxq8AT0HYbuv6BdHTKB79kj6pYhqCfBvV1MOgU9WcoH+t/4T+1
 lbwTN8OI3GFzhN0H3ew2b2YqkwiCMA2dJdGqNgcSdXFzUtox4889mnMRHThT4MK+Lq5S
 sD6Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RrcfZjEpk4JA00V5Md0xhOeg/8o8hPYQDaktWsg5gYa0ib2RG33bGXCmmtF0Mb9qdakCDDbL2+PLA==@nongnu.org
X-Gm-Message-State: AOJu0Yx0tnl4y0bSqQpnUKsI2Srx14iRzI4YQXLMf4qSZxRVbiwC4ocT
 oRmpKdi6vY7bWqGzQZuNPocA+GafCefuwEeiHEDQsJvftGS+WFrgkh2MZelU6lfFNjKbtQHz71M
 ZoeOn
X-Gm-Gg: AR+sD1237/L1bbrnyST009Ym9MY3pbSlsXGwRsiV4i9HCHlllthbFGFBFULFG5e3AAx
 RHCEllHsN8OsUzZMns4rUD3l1/xoZJfvgJmpJTYhk2we+fc4+84Hq3BE/adRE1ry86Q9Hep1c8i
 7MXb5QvHjvXLxRIxtiutYXhAh32JI2jeHNqfLGAVnwrsR2lcj4OPGOfwTe7019Ggi86oGF+fgiT
 9AVFpm97bCBsP2hP32K9sQmQ17nCrLXJV/JpE+IEc3/VIKPPuRJhAX5a8flXQF7oaohYEM5VcnO
 fLYY0Qh1CZr7SN/r6vt3eZpa2kAYPvUYEt+BA7n1rVRXg1rzRu5cSuAU/xW++wDiF61AtCHQS1s
 sYx5+0/34Ta9fUM4s1SUYGaCt1MFYDW2LfQrkSIKEoIAvHJHF4iOrlRpcC619TqE2VSdPUcZm3S
 qruAljVUmS0SDLF++7woSadLjH+EadQsxlMd17HNC/OJpRNzbwnV/dVqZsvt0Xbfez48uVkqxJN
 vICRjSnSflTwzXJ/pOK
X-Received: by 2002:a05:6a20:430b:b0:3bf:aab1:cc8b with SMTP id
 adf61e73a8af0-3c9008ccb6bmr3723856637.46.1785456314400; 
 Thu, 30 Jul 2026 17:05:14 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbdb7a999ddsm2656460a12.4.2026.07.30.17.05.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jul 2026 17:05:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: anjo@rev.ng, qemu-arm@nongnu.org, git@xen0n.name, 17746591750@163.com,
 maobibo@loongson.cn, lixianglai@loongson.cn, philmd@mailo.com
Subject: [PATCH 11/11] tcg/loongarch64: Implement revbit{32,64}
Date: Thu, 30 Jul 2026 17:05:03 -0700
Message-ID: <20260731000503.170446-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260731000503.170446-1-richard.henderson@linaro.org>
References: <20260731000503.170446-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target.c.inc | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index a5cd3c3b1e..9072a447ed 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -1866,12 +1866,30 @@ static const TCGOutOpUnary outop_bswap64 = {
     .out_rr = tgen_bswap64,
 };
 
+static void tgen_revbit32(TCGContext *s, TCGType type,
+                          TCGReg a0, TCGReg a1, unsigned flags)
+{
+    tcg_out_opc_revbit_w(s, a0, a1);
+
+    /* All 32-bit values are computed sign-extended in the register.  */
+    if (type == TCG_TYPE_I64 && (flags & TCG_BSWAP_OZ)) {
+        tcg_out_ext32u(s, a0, a0);
+    }
+}
+
 static const TCGOutOpBswap outop_revbit32 = {
-    .base.static_constraint = C_NotImplemented,
+    .base.static_constraint = C_O1_I1(r, r),
+    .out_rr = tgen_revbit32,
 };
 
+static void tgen_revbit64(TCGContext *s, TCGType type, TCGReg a0, TCGReg a1)
+{
+    tcg_out_opc_revbit_d(s, a0, a1);
+}
+
 static const TCGOutOpUnary outop_revbit64 = {
-    .base.static_constraint = C_NotImplemented,
+    .base.static_constraint = C_O1_I1(r, r),
+    .out_rr = tgen_revbit64,
 };
 
 static void tgen_neg(TCGContext *s, TCGType type, TCGReg a0, TCGReg a1)
-- 
2.43.0


