Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B107AC83F21
	for <qemu-arm@archiver.kernel.org>; Fri, 11 Jul 2025 22:52:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uaMbh-0002ms-Ic; Fri, 11 Jul 2025 18:52:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uaMYu-0007cm-GR
 for qemu-arm@nongnu.org; Fri, 11 Jul 2025 18:49:52 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uaMYd-000057-VR
 for qemu-arm@nongnu.org; Fri, 11 Jul 2025 18:49:45 -0400
Received: by mail-oi1-x233.google.com with SMTP id
 5614622812f47-40ad1f7c23bso1491119b6e.2
 for <qemu-arm@nongnu.org>; Fri, 11 Jul 2025 15:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752274168; x=1752878968; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JYyc4l1Ys1D8hkqY3d5nf+X4jsLM/BFSkkdf36YJhnw=;
 b=m9TVgoZHvKRcLh3g/xQNJ8h6rRCmdrahgH32pBhYN+UvZamoP3B8oG5Q57mt1hRSWc
 apAnF/H9EXVd1EqrMDSHzRwC7m5G9IsCAlrZOJvMQftybYxZ55+9jaGgZKt6dVBGiuC6
 6e9piNJ644/3J2sOaSVt8PZi892xJDxJHDEuCdEyvMpv4Gw+BpZazsedltIcTgsGW1Vx
 TpAyhG+NxQPRACpuYLxpq8YEQ1uMRplsO4zF31GK7qEunvAVMI/lp1dU9BaQT9uEpBIW
 ZVF2PWSW7agJqTGLB7BihCQWOX3IAUCgYmjf8j3AMVodkIeQdO0dgsP1XvyVtxlaHl0c
 /6RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752274168; x=1752878968;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JYyc4l1Ys1D8hkqY3d5nf+X4jsLM/BFSkkdf36YJhnw=;
 b=R7VrMwQshw0QHwmR92IZxDMsXQC2w2HA2ooqyFgxnZw63UklaiprEpRTkeyRcpaLet
 SetuEdpm9pB5/pMvWC9KS66ZJxpTIuzPzSH5SRfv4XTm9Zo83v8FXu2L7MYn/WVRQANd
 CTdy9h8F+8pbEmaemMG5BeJHOG+8RuCQ4fD0YvpqQSPl8mhajFprH/xMbXIR48EpBbOT
 NRcRKXd1oQod1NtVulez97x6+wPZkVKS6w+dcXPtAFkbC+y2SJTRDzEzuzVgEfvXgbgU
 GWmMRHnvAA3Wj4ybiBQ3SzWb1/14neWQpJUxXYMeDKlMbbkoxgEDN7ILXf4UDgFnkiR/
 dSfg==
X-Gm-Message-State: AOJu0YzKSua2f+Znst7/PpN+HII5vRwwAW2cVa4Yl7fTZ5F6A8dAtEJc
 o7lSbeo1YbJ4O+w/P6GY5dRKXkmwFb+PWtx9FMJrWtaYoujnqA6VUGJPEgElDvCiAO8SNCD2+Qe
 LteNkxnM=
X-Gm-Gg: ASbGnct2zY7MFq+XYQOEv43VQSlwSVY+ybp/X/B2Xbz85bFZ7Onem1pap1/uWHcsGwl
 arb879G5ioDXjXaapj1JGwoBG9R/Stfh7SX5+8kN29nXmwdMyV8jUcyusDytB4NdEIwX7shd5sP
 d2RCAkgXRIqxAxcxSJo3rKAevO/flKH2pKtAom3nYPy+dUGHgPl/TIfD6OdbzsLIWw2CAAUfIEq
 wOD3vEFVrXNafhML6trGytaZ9tG6tUbkRYbvFvEVD2dASpjCW+ErNAao1Edkzt5qMx3/s0Lsvc9
 +IrlldmbmNJOmS8+JVwe+Nx1MVoZoZb/tme/kJSKmhcgxJPBtUb2BJQfJHLQzzVGgueOT+lPf6g
 ZfqRlWy5CN4/nw1JQ5oJAjnCxuPGBnl/U1x83CZ+lfZkgjUEkrIzQyi0dJx4gu3fjl1GvRx04a5
 bxzeEoeVNH9+DjEZ5x/nY=
X-Google-Smtp-Source: AGHT+IF+3kBtBrg3gzB3gMKCw2m/2p2GrSRGyXYjuDsb3AOQrJOytctWOPgwtDDckgfD/R7b3FIjyA==
X-Received: by 2002:a05:6808:1796:b0:40b:3631:f757 with SMTP id
 5614622812f47-415393d609bmr3399554b6e.19.1752274168000; 
 Fri, 11 Jul 2025 15:49:28 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-414197c6064sm696638b6e.20.2025.07.11.15.49.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 15:49:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 8/9] target/arm: Remove outdated comment for ZCR_EL12
Date: Fri, 11 Jul 2025 16:49:14 -0600
Message-ID: <20250711224915.62369-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250711224915.62369-1-richard.henderson@linaro.org>
References: <20250711224915.62369-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x233.google.com
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

The comment about not being included in the summary table
has been out of date for quite a while.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index ce981191b3..8c8eea7109 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4548,11 +4548,6 @@ static void define_arm_vh_e2h_redirects_aliases(ARMCPU *cpu)
         { K(3, 0, 14, 1, 0), K(3, 4, 14, 1, 0), K(3, 5, 14, 1, 0),
           "CNTKCTL", "CNTHCTL_EL2", "CNTKCTL_EL12" },
 
-        /*
-         * Note that redirection of ZCR is mentioned in the description
-         * of ZCR_EL2, and aliasing in the description of ZCR_EL1, but
-         * not in the summary table.
-         */
         { K(3, 0,  1, 2, 0), K(3, 4,  1, 2, 0), K(3, 5, 1, 2, 0),
           "ZCR_EL1", "ZCR_EL2", "ZCR_EL12", isar_feature_aa64_sve },
         { K(3, 0,  1, 2, 6), K(3, 4,  1, 2, 6), K(3, 5, 1, 2, 6),
-- 
2.43.0


