Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3AE2F9EDC5
	for <qemu-arm@archiver.kernel.org>; Wed, 22 Apr 2026 12:54:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFX5g-0006og-Pk; Wed, 22 Apr 2026 08:54:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFX4n-000629-RC
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 08:53:09 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFX4l-0005W2-0J
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 08:53:09 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-43d70c30767so3719714f8f.0
 for <qemu-arm@nongnu.org>; Wed, 22 Apr 2026 05:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776862385; x=1777467185; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pBHHqWCNozXOcmQTxKAtN3Av+2DGbBLMiAYtHB54URk=;
 b=KnnUARRmenZIfyPVLSLTd79FttMFA9R0BZPOkmxNFBj0tNfpzxmjrll41YwIk4nDyM
 buuOHmvK9qpaXH4fsvmqKFb8McWGqeYkXusXg6Si2L3MyiV5yncWpTSyNEIuIfWlw8I7
 PwWx+t/pm7fYjcIKPLqhFzFPs6H/GQ0cx8y4ALjUqMLnlXSS8SYluI6KYYZU2TxI8T0S
 pH28QqRsPS2PZh5802tyhKCoO35BqdJ4mfmTWdPlHkuUop9DTrVJf4eukisGl1STVc+M
 oPl8kHS1Z9BbMdLMOWMWPK7DADwZxbvIbOHXH+xUC12YwRpHYSZaYo79BJdUuK+Skut0
 mSjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776862385; x=1777467185;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pBHHqWCNozXOcmQTxKAtN3Av+2DGbBLMiAYtHB54URk=;
 b=XLaY9EVz0/DODfn0jaCN243O7IvcT7BCdO9tAjKrWepl0vfuc2i/C68dHHFDTre8tQ
 e0BGsEUK1hFQfCcRixVSAdQbRImfQqruNiPlVFgMegSxzC+L+2+WL8nY1u9QPr1aneJN
 OSH9BmStZCDrxXUjeHRWSpDVN9sEwKt4pjS/SBVF/DEjq06gpMCUmBNqrt2SDYBfrq2H
 9tuqhqxDcGukVfYFa/2yY1ZQWy31XSIPhrxD39lEECuIKBgoVY2g/a8bUZDlCY01GNM2
 z35ZMDlfiPXF62hNisHL2CIXLSCFRAs2/ll1tLx7GbBWBKxMuUyUVcoZHqKf9TCU1J3b
 jACQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8kMWtl+SRhK14D1hXNsc8m11gm8sX10dPA9uLxlLQXbDF2cToP9hW/y4/f3tkj1iNKvLFizfL5Yg==@nongnu.org
X-Gm-Message-State: AOJu0YwgFb6dn+Hxa48bJ6Yt1sIPJU59U+XhQwGxkZjl0P3Zsq75GMRy
 TDFSvpYwBHvDRfTRyYydRxJseVNs9MxgQ9U4t4p3f33ZlAY5dkU/A9xIKhtDJyQx/fM=
X-Gm-Gg: AeBDieuNanrZEz8XPSPqjohGveGHx+gB0l+KA4WkCMFiHpHRO+XM5bHPCPOlwIVwBCk
 OR0KdSMinUviX2AOXJJuurqCOHDpp0+NPLeY7g0CEjuM8K1MY6Tfut5SWIrgH4ev1TiKo+PFLPT
 ZertiVylXoDFi7fjrQ8YoO6cMgpGa5T+6BH270J6Rj58CXX0oTbGb/13fzPv6ESaB8vDThjrcP+
 fV1sxMyZUDbgRb+rugjUM0K76sL0t3g20PpwFbFUKrWEZhDuEwH9l8YAtBlgxg11pChpdEJnyOX
 I/1JSlHOK4Nuc/PZmNvgD1d22zaW9Y69OEbVPutZnEme13ZrT66dohYM553eO1JJ4EP0lBT+A8W
 AsPz2AQHbnAy8D5iWTnW0mJyH42Sr6EM7HjiL78WHtonCnGqfk30t02fVgpL1R5I9O1DYM3RqoB
 d+NG9idXlAVe10l3pPOAF9SzKbWFeZSQAcjg==
X-Received: by 2002:a5d:64c9:0:b0:43d:2d34:8963 with SMTP id
 ffacd0b85a97d-43fe407ae53mr37079461f8f.17.1776862384713; 
 Wed, 22 Apr 2026 05:53:04 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e59f97sm50548635f8f.37.2026.04.22.05.52.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2026 05:53:02 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 2A69F61063;
 Wed, 22 Apr 2026 13:52:52 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Pedro Barbuda <pbarbuda@microsoft.com>, Alexander Graf <agraf@csgraf.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>, kvm@vger.kernel.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 15/32] target/arm: migrate check_hcr_el2_trap to use
 syndrome helper
Date: Wed, 22 Apr 2026 13:52:32 +0100
Message-ID: <20260422125250.1303100-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260422125250.1303100-1-alex.bennee@linaro.org>
References: <20260422125250.1303100-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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

It shares the same COPROC_ISS encoding as the other CP traps although
not all the fields are used.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/syndrome.h       | 16 ++++++++++++++++
 target/arm/tcg/vfp_helper.c |  5 +----
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index 841fd3292b8..53137394e28 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -251,6 +251,22 @@ FIELD(COPROC_ISS, OP2, 17, 3)
 FIELD(COPROC_ISS, COND, 20, 4)
 FIELD(COPROC_ISS, CV, 24, 1)
 
+static inline uint32_t syn_cp10_rt_trap(int cv, int cond, int opc1,
+                                        int crn, int rt, int isread)
+{
+    uint32_t res = syn_set_ec(0, EC_FPIDTRAP);
+    res = FIELD_DP32(res, SYNDROME, IL, 1);
+
+    res = FIELD_DP32(res, COPROC_ISS, CV, cv);
+    res = FIELD_DP32(res, COPROC_ISS, COND, cond);
+    res = FIELD_DP32(res, COPROC_ISS, OP1, opc1);
+    res = FIELD_DP32(res, COPROC_ISS, CRN, crn);
+    res = FIELD_DP32(res, COPROC_ISS, RT, rt);
+    res = FIELD_DP32(res, COPROC_ISS, ISREAD, isread);
+
+    return res;
+}
+
 static inline uint32_t syn_cp14_rt_trap(int cv, int cond, int opc1, int opc2,
                                         int crn, int crm, int rt, int isread,
                                         bool is_16bit)
diff --git a/target/arm/tcg/vfp_helper.c b/target/arm/tcg/vfp_helper.c
index 45f2eb0930f..e692bc568bd 100644
--- a/target/arm/tcg/vfp_helper.c
+++ b/target/arm/tcg/vfp_helper.c
@@ -1359,10 +1359,7 @@ void HELPER(check_hcr_el2_trap)(CPUARMState *env, uint32_t rt, uint32_t reg)
         g_assert_not_reached();
     }
 
-    syndrome = ((EC_FPIDTRAP << ARM_EL_EC_SHIFT)
-                | ARM_EL_IL
-                | (1 << 24) | (0xe << 20) | (7 << 14)
-                | (reg << 10) | (rt << 5) | 1);
+    syndrome = syn_cp10_rt_trap(1, 0xe, 7, reg, rt, 1);
 
     raise_exception(env, EXCP_HYP_TRAP, syndrome, 2);
 }
-- 
2.47.3


