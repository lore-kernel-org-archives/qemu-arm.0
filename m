Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6FD3ECD9BF
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Feb 2026 04:23:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1voDME-0004QG-PJ; Thu, 05 Feb 2026 23:22:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1voDMC-0004OQ-Qf
 for qemu-arm@nongnu.org; Thu, 05 Feb 2026 23:22:12 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1voDMB-0003VH-E3
 for qemu-arm@nongnu.org; Thu, 05 Feb 2026 23:22:12 -0500
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-82318702afbso228610b3a.1
 for <qemu-arm@nongnu.org>; Thu, 05 Feb 2026 20:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770351730; x=1770956530; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P+C4usfFJxntIkaYUwqttNHLWY0mMsZx1f8GtcALX8k=;
 b=Xgf/4GKWQrLp7uCoQYRUzCqyhSP4HADbAM6oRmrtDC5QtlPw0ni1xUEOiLS00DDBJm
 EwhsiCjtoNjLvZQW8MFPNowjtCdV3jcsWmUD6agEEGcUQrs1gwnF95TE2cXEZ14ylk/5
 /H0m2sYb4411muOr+AWsXOAZhcabVbhk1ufVrotR0PYJzA8GVvtTTquibUSDwbmHeQGh
 WplUD10pGLBctLhAhQQz7WMax5CzgzqYtpdrIuH7eIMzBBNX3xMX3QLy5mPC48CVXmLT
 xH8RrHMT0CAe3Lx+WUit8GC1kMP7aPTjIZVF1YHxDlOJ1kQMweHBq9Rvw30kN90DGOIc
 X5zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770351730; x=1770956530;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=P+C4usfFJxntIkaYUwqttNHLWY0mMsZx1f8GtcALX8k=;
 b=a7o7DLnBW/KwjwrTwSHI836XUQw1XwwPlPhQ6tEjO02ZD440V+EbO3HLflYB9CIrjo
 M/9DQTz4vEC9uzKH1viB9eoHtCB+uSQa6byshHJ1N46xQ/xBoT8GgCVy2flXNVZMm6xe
 gI43J/WJ+LdFj1W8eKNCLWTMiqcDMOITU1+sF5QFEe789rgeHpgLLxpjFIhUGQxLHEtt
 ivLGGKmEY3qKPcZRYI1ttB/BHGDEVhKERnL7KhM9G+QsOAk+YoFrmizHGpmW/uaByvTa
 dQAo8DXXJAhVpQp63S5CYneS9uBDHFonz6KBi2V9ba0RFXAfx3/xpjAyG//WMkcXVppV
 RJMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUg8CP5wpOeIwnbDhhGIja1kYZg4mVqE1n28AmSNp791c7WNtdia1Tqjm4EwvNFCYbiMCzZCKt+qg==@nongnu.org
X-Gm-Message-State: AOJu0Ywx/7CJ0xEabemTuV4DaVQSGapSVxB+zQi4Ye+czrsICbWnD6UE
 s1sdsUXyiqNLCI35dloCmjZuwZ2wrzJOQu/j3JumX7gaICHD8j97R2XSk3q/Pukj7bs=
X-Gm-Gg: AZuq6aLu90h53YS+NsAUCAMcnQfrVi6UsAfUdwZTP66fOam+wLvfqa7pymXKLeU0HwQ
 /RPbWIWFze23vYRybNTDl2TrKLWFY8OBoVeeh61V/dcfKQg+1GGJuuY9WmtZgYsMdFtEdzim/s3
 S9feUpuTi5BTPK8IwO38c4pTVfq3rttEzgPxEvyIC4XKgGXBClb9+PO2vORcI2PR5UrA8dF1CFc
 LnPoTxxrVOguxlXcPmQzyKzdxufRjFaQF+HgX0ZkGT329j3OJGMFIhFb60UCb8SscRqn+/oT32Q
 Jxpiwk20uJXrDKNrLB8sUT+BiHWsDc/cZ50mrzKPPGZUMBaCPnAx64WpAZH/+qKwYxprJ2Od/IY
 Ys9ZZBEq9Ymwfc3lJazdX3eAjisB6ghWDLUO78CrbeqQKx3iQrCpPhzKeDj1XbIWiFv8UAuSj2b
 R/VuSvahAT1yWiJz9gha6xsjhCNKhxGrenjFlQ5gzk1Im+alvalCnI54kKRD+Xe8Xh
X-Received: by 2002:a05:6a00:17a7:b0:81f:4963:4967 with SMTP id
 d2e1a72fcca58-82441773190mr1309967b3a.57.1770351729674; 
 Thu, 05 Feb 2026 20:22:09 -0800 (PST)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8244168fdf5sm926914b3a.17.2026.02.05.20.22.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Feb 2026 20:22:09 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: anjo@rev.ng, Richard Henderson <richard.henderson@linaro.org>,
 Jim MacArthur <jim.macarthur@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
 qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 11/12] target/arm/tcg/translate.h: replace target_ulong
 with vaddr
Date: Thu,  5 Feb 2026 20:21:49 -0800
Message-ID: <20260206042150.912578-12-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260206042150.912578-1-pierrick.bouvier@linaro.org>
References: <20260206042150.912578-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x431.google.com
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/translate.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index 027769271c9..2c8358dd7fa 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -18,7 +18,7 @@
  */
 typedef struct DisasLabel {
     TCGLabel *label;
-    target_ulong pc_save;
+    vaddr pc_save;
 } DisasLabel;
 
 /*
@@ -42,7 +42,7 @@ typedef struct DisasContext {
     DisasDelayException *delay_excp_list;
 
     /* The address of the current instruction being translated. */
-    target_ulong pc_curr;
+    vaddr pc_curr;
     /*
      * For CF_PCREL, the full value of cpu_pc is not known
      * (although the page offset is known).  For convenience, the
@@ -56,8 +56,8 @@ typedef struct DisasContext {
      * pc_save contains -1 to indicate that relative updates are no
      * longer possible.
      */
-    target_ulong pc_save;
-    target_ulong page_start;
+    vaddr pc_save;
+    vaddr page_start;
     uint32_t insn;
     /* Nonzero if this instruction has been conditionally skipped.  */
     int condjmp;
-- 
2.47.3


