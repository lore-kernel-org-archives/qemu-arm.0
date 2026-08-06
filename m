Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ECC4C56205
	for <qemu-arm@archiver.kernel.org>; Thu,  6 Aug 2026 17:32:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ws1wM-0004oY-Es; Thu, 06 Aug 2026 13:31:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ws1wK-0004mL-7X
 for qemu-arm@nongnu.org; Thu, 06 Aug 2026 13:31:32 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ws1wI-0001gT-D2
 for qemu-arm@nongnu.org; Thu, 06 Aug 2026 13:31:31 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-38dcbade417so2041221a91.1
 for <qemu-arm@nongnu.org>; Thu, 06 Aug 2026 10:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786037489; x=1786642289; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=VcydMAWQ11xuCL+EJ2Fa8fC0ZfigrS7o8S5cYAFbDts=;
 b=SQ/6RFTXzS/bZiWFJ81Re6gaXNHibqoaO+fu1M0/IdxFReyuJyKw0PykfGt1Si8Z4z
 ODHwKl/nfCnHI8KuMkovfPZFlmEt8egEcABz435Vd98qowEFU6qA95vLs1+aYvTNDKGe
 BB9auMEkXJi/tIbdT7WeVDSRimIvtJZoIII+E9vzjKe0ndrh/PU3S219Apn7Ko34jICG
 1BKNZoVAaCFPlRJ8l6vsCsh+5qtwSeHAVMvgZepnA+FwutgW0fx5LINqBnBeYY8umW8M
 WS6s2dujziTyXV+66m38+oC6uaGce5Io9wNSToCs5HwnWBdxV2bZq8jB2LYA+YdI2cO/
 x7ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786037489; x=1786642289;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=VcydMAWQ11xuCL+EJ2Fa8fC0ZfigrS7o8S5cYAFbDts=;
 b=RoTLrlc2asWpYpTZSrsqPUxododrR9RGMZ3A5VKVehEBae6qpIo4PyJBTxQ4It2w/d
 CegrkEXJke2el9y+BqFtAf/Nsqs2pNSDp1PRVAd0JsMTkjcX7nxL/yU6KyXCMnMllrro
 tN903RbfPSpO7EKgsTo6HINjHOyj4uzqol+DL2zfqRZ1CWt1OPyjzKvvWEql383sNuQI
 iNKazNf/4XdqFdA1/WtlIaQMOjenWZBzr7IXZFDVgMHuMeMzeE3UVRtKJ388os6V/brA
 8mj+pWH2BIObMGRjMMIHWU7GsBVI7eEnnakwbpMOrfP50z3vJ6giGBCEPKtZuv9D78gD
 1u7A==
X-Gm-Message-State: AOJu0YydWmxoMQMAUtwZccxO54lsOjSaSiItc59NaB2WtL2yu+xLirh/
 eYYQR6+6JAHlXc2gbDV7zzmNh6UB+Ks/A7SipNph49C40ge0hEpuhiJf4KPcMcbPPYQ=
X-Gm-Gg: AR+sD12tdfzzt5O/5p97Zdfnw9GOsX6PoJfUGJcqprm+YhA16t6IEaCuBjCdAoBopNg
 x/5ugHuFQfWkd0s2lpHiRMkdDvwBo3J96TS2Puh8tzf+xyCvX694KZgA82snrKe00cM8wdb9KaV
 kEGevPIUiYbKUJ5Jfslx7iN3OdC2WjaKAcmq22IragHo5Zpmce0DutNLEWj19WdoDFy9wSyWtUi
 nBokvDIZd0ZGKMwq/2k42U3LSNEOj1dnjbTDYMBeoWhocUw3y2wV1oCBhwYhP+LvWSO/FkvQ8dZ
 asHYoHCoARbFC9H8PZ7QxxdOxFInlKLllXV6+Qhbj4SVlqtJCcpRxE+s0hmXsRZdh+eHLY9x3ce
 cou6D1/1Qkz6YobpX+j2zavq1LsYJbnxNv8uViNEQc7embqioy9m5ww9ofyc9d2jvSBnW2MFsQv
 unvB8eutb6v9NzAJTqZess9gFgXPItC2GBwegBR0lh/IsxLX6Ap73kOwV0MYnVp4CFNwQFE9jJl
 atMlTMOw4K0BzHD3W3l
X-Received: by 2002:a17:90b:4d8c:b0:381:6c5:3f63 with SMTP id
 98e67ed59e1d1-3903c544f17mr13934520a91.6.1786037489021; 
 Thu, 06 Aug 2026 10:31:29 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-39085e4a2a5sm1983711a91.14.2026.08.06.10.31.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2026 10:31:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 5/6] target/arm: Implement SCR_EL3.TID5
Date: Thu,  6 Aug 2026 10:31:22 -0700
Message-ID: <20260806173123.333423-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806173123.333423-1-richard.henderson@linaro.org>
References: <20260806173123.333423-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 854c8902b8..71c655ac07 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5485,8 +5485,21 @@ static const ARMCPRegInfo dcpodp_reg[] = {
 static CPAccessResult access_tid5(CPUARMState *env, const ARMCPRegInfo *ri,
                                   bool isread)
 {
-    if ((arm_current_el(env) < 2) && (arm_hcr_el2_eff(env) & HCR_TID5)) {
-        return CP_ACCESS_TRAP_EL2;
+    switch (arm_current_el(env)) {
+    case 1:
+        if (arm_hcr_el2_eff(env) & HCR_TID5) {
+            return CP_ACCESS_TRAP_EL2;
+        }
+        /* fall through */
+    case 2:
+        if (env->cp15.scr_el3 & SCR_TID5) {
+            return CP_ACCESS_TRAP_EL3;
+        }
+        break;
+    case 3:
+        break;
+    default:
+        g_assert_not_reached();
     }
 
     return CP_ACCESS_OK;
-- 
2.43.0


