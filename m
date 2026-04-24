Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCF3BFB44A5
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Apr 2026 04:34:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wG8Cb-0007L3-CM; Fri, 24 Apr 2026 00:31:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wG8CM-000732-5t
 for qemu-arm@nongnu.org; Fri, 24 Apr 2026 00:31:30 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wG8CI-0002pb-Vs
 for qemu-arm@nongnu.org; Fri, 24 Apr 2026 00:31:25 -0400
Received: by mail-oi1-x236.google.com with SMTP id
 5614622812f47-479d4df9035so2981276b6e.0
 for <qemu-arm@nongnu.org>; Thu, 23 Apr 2026 21:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777005082; x=1777609882; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WK09IV4jv+83fptexQw6qhQ3h5DqduadUD1Gz4A8BTk=;
 b=Ms4UiT5SWXYhqDm+jhlI0r3QTW7D2GDhwjVur4nO1XLxBdOsZS4IHeHuEbgR1wJw0u
 zdOV5AAVVuANXqLZoIB4QH1AcJ1qvncO+D6un6QZR9lZ8QOhdTutsMnTQmYEKpvLccEd
 z2S92Cp1z/mBkeAbulrNURHN5hdF5nTKdjccaQeZ/GVQFOfT+3tngf/QtJkVReeNv/ff
 qYXdxkS50eKIgmppFk+AAy7Y+Wm+QVGJsLdgEPM7j2sYc8PnLMRiuFCaYMPnOZw9dzoq
 l+GJgXeknQdLWfLwKr8yoGaqxb956KsjBiv3Th/kGpMvO4PShROBCDhosnK191bg2OCv
 2RYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777005082; x=1777609882;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WK09IV4jv+83fptexQw6qhQ3h5DqduadUD1Gz4A8BTk=;
 b=Vow2RboNKz66hiEMM7LiVZY1Fq5AToWQXGH6uCvHLv87CWaZ0dBsUafgcDGjp7Chcl
 tCKDpab0DohTVYoaPPcTpRDWdj/H5byDVlvyzbA5ZHhachxmpU4JSbHXskLR7w9I27lN
 CiVDcm6QF3xS0sVMDsmTUMy9HH9EhaOa17H/H3pLOJq9VJe0y2vOQprFfBx3bpA8qOaa
 XkJ0Sla5PEErJZTl+O10eb+2Yqr5cQ/pnUoI2K7QZWJHmno2Nwf3BhmKo5C2MxrXzWNj
 PL5TDpKtKZrY1LsbjVaLGN9vBjhnBe6nF/h1uBir7OSQC25rFKXhLeT0DzkbiR1CnmL5
 uy1A==
X-Gm-Message-State: AOJu0YxfpU/bq5Qkv/Z4irNWb0B3J+MzSdRhWpqTr27JH4/wmowyjSdj
 Ex+E5ClCOxSZeLB/JzyDyg25rmkk6SetkeMr7s2tIplcUfqgu1NjihIAq2OIMkBhU0L4Fa+lNvV
 tNeRHpIE=
X-Gm-Gg: AeBDieuRIcH7cjj50W2X1G/9L5q+lGnmqvzK+kV0LhODzBVWihHdTCkJZzXWw6it9zW
 PXZokADEFcPQEOAKsSSq0jUWzGsb9cPxES4ayrPeFenYcnr0Tvu1PkSETJ0AvOhPk1WdviF0SWt
 7Ht/F7L732GzTSWfs04/bTuc+Qp5tY5/+miiBiSk++ynCDG9E9OhfJSSxSuR9FEH3zsH4LiyVls
 3ukNd9fFP0iEpMq5ItzRNYAk5TMBrfLvBmTQwmguQ1kxJi4f8v2s7B9VFN6/JhP7yJghVQqdovW
 15Va3/ORU/RJQTV05Ss8fVkfnkcPXZUA3w/90LKDwfV8oLRv0VelyejwzCVoGu2OqMVyweJxhMT
 bDYHthzPgIDH2hgU+Y0AUtZEc38l2wb6qkeTFKajfd4F+r59EFImxVlut+dsZc007XHTySZXDNE
 Z5N1nsGZObvrgiEmOjqjJDlxa13uBkztog1DBpXLUR8omu1ihzMu0fYC855a+mDA==
X-Received: by 2002:a05:6820:2208:b0:694:8b8a:b43d with SMTP id
 006d021491bc7-6948b8abaedmr9535877eaf.29.1777005081663; 
 Thu, 23 Apr 2026 21:31:21 -0700 (PDT)
Received: from stoup.. ([172.58.183.19]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-42b9ac54ec5sm18880864fac.13.2026.04.23.21.31.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2026 21:31:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 14/40] target/arm: Enable FEAT_FPMR for -cpu max
Date: Fri, 24 Apr 2026 14:29:48 +1000
Message-ID: <20260424043014.46305-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260424043014.46305-1-richard.henderson@linaro.org>
References: <20260424043014.46305-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x236.google.com
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
 target/arm/tcg/cpu64.c        | 4 ++++
 docs/system/arm/emulation.rst | 1 +
 2 files changed, 5 insertions(+)

diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 343536523a..40ed799fb8 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1287,6 +1287,10 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64PFR1, GCS, 1);       /* FEAT_GCS */
     SET_IDREG(isar, ID_AA64PFR1, t);
 
+    t = GET_IDREG(isar, ID_AA64PFR2);
+    t = FIELD_DP64(t, ID_AA64PFR2, FPMR, 1);      /* FEAT_FPMR */
+    SET_IDREG(isar, ID_AA64PFR2, t);
+
     t = GET_IDREG(isar, ID_AA64MMFR0);
     t = FIELD_DP64(t, ID_AA64MMFR0, PARANGE, 6); /* FEAT_LPA: 52 bits */
     t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN16, 1);   /* 16k pages supported */
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 579df4c47b..fda73d3d07 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -75,6 +75,7 @@ the following architecture extensions:
 - FEAT_FPAC (Faulting on AUT* instructions)
 - FEAT_FPACCOMBINE (Faulting on combined pointer authentication instructions)
 - FEAT_FPACC_SPEC (Speculative behavior of combined pointer authentication instructions)
+- FEAT_FPMR (Floating-point mode register)
 - FEAT_FRINTTS (Floating-point to integer instructions)
 - FEAT_FlagM (Flag manipulation instructions v2)
 - FEAT_FlagM2 (Enhancements to flag manipulation instructions)
-- 
2.43.0


