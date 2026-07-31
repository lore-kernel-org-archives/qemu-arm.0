Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFA50C55167
	for <qemu-arm@archiver.kernel.org>; Fri, 31 Jul 2026 00:06:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wpakc-0001nP-Sm; Thu, 30 Jul 2026 20:05:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wpakY-0001lK-3h
 for qemu-arm@nongnu.org; Thu, 30 Jul 2026 20:05:18 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wpakU-0001Mg-94
 for qemu-arm@nongnu.org; Thu, 30 Jul 2026 20:05:17 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2cc891373e0so3671465ad.2
 for <qemu-arm@nongnu.org>; Thu, 30 Jul 2026 17:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785456312; x=1786061112; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Sd3samW9J40wMIxnOYVCldYeRZqsZAry6PUjmQXXCDE=;
 b=LFLyQlwkY1pEtVP7A7H6EVxtKk3d7A71OdlH5OlDb1CrJValoJybx+MFDcbSuIZa/Y
 mCiygbzJti+zypwXTB74FJnZAmolxgBepnPvK6ldSZoQN8kR8qBWcNQdZD0wk43OoDtI
 +IR8PNr8xVx+jNginrgk9ENdfiT3YYoOLdR2RvWTl1Jk7eo+BpElJVfLmpcsh7YibJQA
 +XpMSb5UKDM8BltpBq4HEr1WSdUS3emHcMGFlRk7lclCHhM4BOMrDizWEk0Rcipjp8zx
 sx934L+K0a15JhIJo9l1VXCtk65mb0GTW3hMNCEzotWoopOgMTmYsruyNkQdfieYwHD5
 5+dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785456312; x=1786061112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Sd3samW9J40wMIxnOYVCldYeRZqsZAry6PUjmQXXCDE=;
 b=oQxQrobc9903+RoFrDDCQbjd1qHUzRVIgtgGrSzIGxR6rkBtKMI2hj2mFYDRue9GVY
 qS3lEpSNLIut5K4a9qABMCYPXEWULpU7mEGRBXZlfjZGrLL1Zq8YU5/Zfy+HSAULmS9+
 75g8cd/YYamMUYVw1AHH9kyCm75PH31UdWJpF2czp02ba1zCYwS82NAav9m6P+4IIKkA
 DVC2upJyC+jmNB0bqECG7rsnzA8L62w+LceRL44FIvlVEDWSbyyNUjJAGVf8rqrvjNBu
 VjW+ZNNKAkoJYKPfFLMbdK01bWRDUljIzgRxJl8pnjeiA0yNUrEeZKkyjAi7jchZfttU
 Vhkg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq+jYE1tDjdV/JBS2i/DML15OcbgoNGTPE/YAc43M7+x1BCXPtrhsF+aP9jy77Br+U8u8eRuABJ4g==@nongnu.org
X-Gm-Message-State: AOJu0YyqQzAVhIKWqy+XHehf9CokloJ6nYD7FB++FQvLFMhQlbyEZShF
 aibP2wNCRnJ7RM8olQe707St3goFBPhEU0nAjZ0fLkwzvY+29OHnt6DGrJLsoPlwz64=
X-Gm-Gg: AR+sD13AYfGkA0T7qT5PDXFqzX2LoYC7YA7t+XQrYo7Aga5hTrNaz7OtpmNWUGanFDB
 7Sjk7NJFsS5y+6A+hmd1Unmqykz6PSrvAGpWPkQ2/hv7v8POxVRBoZ2KgDcUTKuzuWeL2GhX6up
 mNCCA3/xkXINOP6nuAnWwbz/D/FojlBg5XIo8hnk684MQQfOAsOorS8wi+GlGCiAUtlmvFw8qX8
 IDfPqF5jmJ0UnCNh4+rnKte4tYSlNCBjq7KYbel/jdLnc+V+NHJBpdrPMRC3cqAaISaLUpif7Ry
 D1OsZPwuWdoX8/yzyx7MhbioE/ppHyBfzOnMbPCo7KCre94cbqGGzEeI7haJa9vEUzwAnfvkEwG
 smhUtpYNVailvS/B0984YsCk+Rof5iHaH5n+wOMqjUDuFAke1gcX7p6Dx4B0Ec/NAsTJ2I7jGoB
 MA4Lz/477qlBEfyeRN0ytaJSATwAGCr7Dna9FLvb/Fs7VT/MwkHmBgJx/Ahnd5OSQEylkUJNkG3
 CLjDmd2f66UJbLEVc/K
X-Received: by 2002:a05:6a21:134b:b0:3c3:66c5:68cc with SMTP id
 adf61e73a8af0-3c9006b6c88mr4132191637.21.1785456312610; 
 Thu, 30 Jul 2026 17:05:12 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbdb7a999ddsm2656460a12.4.2026.07.30.17.05.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jul 2026 17:05:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: anjo@rev.ng, qemu-arm@nongnu.org, git@xen0n.name, 17746591750@163.com,
 maobibo@loongson.cn, lixianglai@loongson.cn, philmd@mailo.com
Subject: [PATCH 09/11] tcg/aarch64: Implement revbit{32,64}
Date: Thu, 30 Jul 2026 17:05:01 -0700
Message-ID: <20260731000503.170446-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260731000503.170446-1-richard.henderson@linaro.org>
References: <20260731000503.170446-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
 tcg/aarch64/tcg-target.c.inc | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index aa2c4e42ed..2622f89880 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -2652,12 +2652,28 @@ static const TCGOutOpUnary outop_bswap64 = {
     .out_rr = tgen_bswap64,
 };
 
+static void tgen_revbit32(TCGContext *s, TCGType type,
+                          TCGReg a0, TCGReg a1, unsigned flags)
+{
+    tcg_out_insn(s, rr_sf, RBIT, TCG_TYPE_I32, a0, a1);
+    if (flags & TCG_BSWAP_OS) {
+        tcg_out_ext32s(s, a0, a0);
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
+    tcg_out_insn(s, rr_sf, RBIT, TCG_TYPE_I64, a0, a1);
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


