Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA9AACD4851
	for <qemu-arm@archiver.kernel.org>; Sun, 17 May 2026 00:32:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wOPPJ-0007a4-HD; Sat, 16 May 2026 20:31:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wOPOh-0007DQ-JJ
 for qemu-arm@nongnu.org; Sat, 16 May 2026 20:30:31 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wOPOZ-0004uY-8t
 for qemu-arm@nongnu.org; Sat, 16 May 2026 20:30:18 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-8353c9f24d2so466113b3a.3
 for <qemu-arm@nongnu.org>; Sat, 16 May 2026 17:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778977813; x=1779582613; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RgEwye1A/H/zER4vq4nD2iWWcMLX2i9wMfampUnYlVM=;
 b=AA377lPBH3reu2x2C9uxqT2O8B2FrEk9nMfA0nJa1t9hjQLc8nMkEgSOgI7FdJiRVO
 GBrAfulkAiDlzsvWD+y2u5th4AmcpcMg4maTNQUrxbkOhjTtu/BfnyqYFHHCDOsUupTn
 YBMZEnu5kwQQiIyax2D2c/ftMm9k0IXVzPCzdtBw46nXIazTvChp6LMx4GTMXtj/0lNG
 tfU7XsmTAfpYWiI7c7gfZdOzXH7XxuI/znofcRyoBQWydPI27wfnAFBNW8VPv0OrYSoP
 im5bSWVZQN45PuFv8Yqmj1GOp+HBKQvT1qo0gQtvBvzXXcLLBL385rfOxZskpPHTNm9D
 eHWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778977813; x=1779582613;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RgEwye1A/H/zER4vq4nD2iWWcMLX2i9wMfampUnYlVM=;
 b=XrhLs9NIJbKj2zwzJtJ4a+M/YEwzbJrglHU+Vf1gRmJT3o6KsckzbYH+NN0uz//tm7
 Psrrx2WFYCtUqeuxbBxKKRK0R+SYgKmky1yQu/9laV+cNDsnJcXUSaaHW663na5h9oQQ
 PkWeIJ1ozawrvZ4m9SNbSBgiLxbWuC841HyueqZUqjPXNKqNlq/QAio159Vc1jYCttpw
 3KOXvoDN092eX6ssi/mE7syk9PITEFhqDc7nf5MrbMzcLi/tkTU/qlb19tjXmun8jkm6
 3/28WNgs2AaAwUXSHycFP9maBcTv8OuduimQOt/c2GFe0v6tyNmNhV8UiJg9Kjoxsd+S
 YgCw==
X-Gm-Message-State: AOJu0Yxt22Tj0YnqrURbHSLrhLiWulLE6E7fXfjIDfWc9HGjs10JFOTe
 Xmj5aWUkytT7eTAK7misF8cgIm0RohYINX8Fl6/1nmqCyatxXnIiiywqaldu/a1+dFc=
X-Gm-Gg: Acq92OE8dPZq+KaecQj4j0Jg6c4Sotdm37XT1NKZpUu7CtzzpTj1OW/yj2GJglVeWR1
 Lu9yfwITQbHpsVfzVI44CuZ6Px7QgZhFESd0+NNITCg7lp9AqRlCoPpIYEScz15/WXjHPxy5s+d
 nrDWGIiz5EthlcDgxaz64vpOss5FTRlplbXZqwnG1QBdNuPTKo+rPvydC3blLWzp2iDWZPxy+y4
 JGaiHvfblBAWbV9r3tkeqrTTJmgKJNKcffqvfY9WN8dsif1NmvHjEd/nDyUBd2/EFLWyyNzVw2Z
 jW9q4ubJ3plkCZoVlU7yYbFpOUMtYI02qS+CyaUlm2Qpsl8ip7B2drMVYsO6aIR3rNMkjKoTZBF
 kJcdoLvgM0+Juc6VanvGveMsKppksNENXwYiM/uZPwt7HMtvalLA6lFIhfsqQPWCtDmnZ41sIba
 +xibIvUIEl000Ki2wZlsVFi3S4GG4Z
X-Received: by 2002:a05:6a00:90a9:b0:837:e9cc:d470 with SMTP id
 d2e1a72fcca58-83f33c9ec67mr10243679b3a.20.1778977812207; 
 Sat, 16 May 2026 17:30:12 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-83f19663cfdsm12272745b3a.9.2026.05.16.17.30.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 May 2026 17:30:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v5 10/63] target/arm: Update SCTLR bits for FEAT_FPMR
Date: Sat, 16 May 2026 17:29:09 -0700
Message-ID: <20260517003002.321430-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260517003002.321430-1-richard.henderson@linaro.org>
References: <20260517003002.321430-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
 target/arm/cpu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 498af7db08..c114510446 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1485,6 +1485,7 @@ void pmu_init(ARMCPU *cpu);
 #define SCTLR_DSSBS_32 (1U << 31) /* v8.5, AArch32 only */
 #define SCTLR_CMOW    (1ULL << 32) /* FEAT_CMOW */
 #define SCTLR_MSCEN   (1ULL << 33) /* FEAT_MOPS */
+#define SCTLR_EnFPM   (1ULL << 34) /* FEAT_FPMR */
 #define SCTLR_BT0     (1ULL << 35) /* v8.5-BTI */
 #define SCTLR_BT1     (1ULL << 36) /* v8.5-BTI */
 #define SCTLR_ITFSB   (1ULL << 37) /* v8.5-MemTag */
-- 
2.43.0


