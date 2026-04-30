Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA03CCCFA13
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Apr 2026 00:22:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wIF9s-0006hX-Rr; Wed, 29 Apr 2026 20:21:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wIF9f-0006Ta-RF
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 20:21:26 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wIF9e-0006IP-4P
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 20:21:23 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-82f8bf96b46so152310b3a.2
 for <qemu-arm@nongnu.org>; Wed, 29 Apr 2026 17:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777508481; x=1778113281; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RuUYRHuovVEbvZDKoFulOJ76CJMsJZBODEhgWcUkabI=;
 b=z8ZT14b/nfD7ezr/N2e8M1ZXaOLlC9hc09nfLZS8rOh7K6qRj8jeJWmbbCbSkKBR9Z
 h3aWFYj+IypQlIbZkFQMjkcghEpKHz4dGQKS3uBjPIp8IK1iWzw13OLURupbSF8we/83
 AG9oXRH5ci+WgNCWfwjE/ImchqyrE8Q5AuN1Uo7O7U1Z6yTjbSlLeyudW+LEQIISbhKE
 +UZ2PCb0g2yUw/RAFNb/QYQPkPQOQPvR4iq9aZfan9PcBGR3wfV+GzMEJfYK7AVb0jXD
 nXV8rOOxjv2s96wtIr2Gid8YXnNFiQubJU3Ge5/60TMXGDJ1HEwK/re6jEFJi89nGPHZ
 mRjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777508481; x=1778113281;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RuUYRHuovVEbvZDKoFulOJ76CJMsJZBODEhgWcUkabI=;
 b=LFgri1RCP/JOjp3Cmv3/+cEGuLB4AqWzrib5JwA5th0Qxl3dte4yRUQEH6zvOhzcV+
 rWuCI67GhWkT++ho+TQ6w/OwdCsN3VNeiTaJ59I1fpAxdGgB0P7EXUfRshCe8fviSPUB
 rmdbyCEEPsflk2GNeqj9G/UvxtFVnJtZmmDMe+mMz8WLQ5jqdO+Wc0V5yadj1ohJICuy
 4Jg6XuK92Y5Zb+jRoRLDL5611QQkf4MU1asoezh10yqndci0Klw+JT52HXAEu/zblmUR
 VAbiBeGeDr85u+GRsFw/FJ67VNsuz3Ep4BMaPz3ILKbTjME220wOSmbYM37TaPqyYJMb
 hyZQ==
X-Gm-Message-State: AOJu0YxjBHKBx9SRLJLk5pUmMIxvIC5/8FBGdU+TTA7Yiw/QZA2cVDue
 D9BsnaJs5OZG9K94MM2SuZCvqSVdssXWNBM7Bw6i/1j+/cHxa8CGU+1Ylub1hlbhVHk=
X-Gm-Gg: AeBDiev+Py730dx4IaTuYomSf/ZGUwzgi7+Lh2eFbP+JsLYSgf/M3bZ/IH3b09pVzhF
 3S8aOABGp+uNyejmy+KHx7inL9Ip4OfTK38MBKefpiTZmkMHw81PiqqjnjMOhMB5Gin2OfxblfR
 4nqQCEgewCw2nHQpo/Iha4DfDJ6j6J9dnTBQc6kOkjV1deGefcOG5dy/ZjguKqDO9HBKT1iyNi0
 nJLG3Ep5nNuKL5JeW0nDo49rQSh6DvYhXSCZiHeh4QqBLWgFBT7Cne2fpZFbFQ95KOvGiUqXRh4
 QIga9Dq+/xMj8Mxm8mBYGwdohJzYeKKUc+otDVhGYPfXjhUm48D7T1Tj70S1/wpOBvz2QuUERov
 VK4MG4qqZeDzzJvt+a7lPGkjZM5uvuJzZXkzht/55iy1nkkMz1ZpgeJTefolpNTZYYfmBUZarip
 y+AHaK1OYGFFTxM/K9CE+tqHWVV2LKFLxTV4hMmixH5vCDQI0cJ2Y=
X-Received: by 2002:aa7:88d6:0:b0:82f:316:31f6 with SMTP id
 d2e1a72fcca58-834fdc153f8mr791775b3a.26.1777508480705; 
 Wed, 29 Apr 2026 17:21:20 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-834ed5cd3b8sm3461727b3a.16.2026.04.29.17.21.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2026 17:21:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 13/47] target/arm: Trap direct acceses to FPMR
Date: Thu, 30 Apr 2026 10:20:12 +1000
Message-ID: <20260430002046.59739-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430002046.59739-1-richard.henderson@linaro.org>
References: <20260430002046.59739-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
 target/arm/tcg/translate-a64.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index b013dd51cb..d2a4b0fadc 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -2899,6 +2899,10 @@ static void handle_sys(DisasContext *s, bool isread,
     }
 
     if (!skip_fp_access_checks) {
+        if ((ri->type & ARM_CP_FPMR) && s->fpmr_el != 0) {
+            gen_exception_insn_el(s, 0, EXCP_UDEF, syndrome, s->fpmr_el);
+            return;
+        }
         if ((ri->type & ARM_CP_FPU) && !fp_access_check_only(s)) {
             return;
         } else if ((ri->type & ARM_CP_SVE) && !sve_access_check(s)) {
-- 
2.43.0


