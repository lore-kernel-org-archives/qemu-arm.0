Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1404AF9EDC7
	for <qemu-arm@archiver.kernel.org>; Wed, 22 Apr 2026 12:54:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFX5b-0006Si-Lm; Wed, 22 Apr 2026 08:53:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFX4l-000616-9v
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 08:53:07 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFX4h-0005Ut-WC
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 08:53:06 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4891e5b9c1fso33603165e9.2
 for <qemu-arm@nongnu.org>; Wed, 22 Apr 2026 05:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776862382; x=1777467182; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7nsukKtrqlrIyVc1W2h4m0opSAHZeyebGQjoHRKe/ww=;
 b=EyQ184mOwMarJxWi0h2hAhZAPvXwVuO2Ierk7o81EfUkuut5pkJkycujVwpfGJPTvf
 lCmCBfSqTekP7QwGVABsO2yOBZXTGYQlevlJFuwKiRH7A337gp2sURQ+ZG3jqOPtKgr6
 U28/TIRdzpfUioQdVrkB1QitfxUWiaEdwpCRsCDszWBDdYb0H+b1M2B5qJSezEwseE2T
 js7FZvgL0bZ4j+gn3ZE9df13x1yW362/Gjpxg7xdf8t24TT7oPworQu8dE0koPMYlq0N
 LTtUJYV0eaRtN4exyrTu8YVYTj+dxZuuLpX8qOiA9VDRLVV++BCu+8bui9EfavXMjhad
 a4Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776862382; x=1777467182;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7nsukKtrqlrIyVc1W2h4m0opSAHZeyebGQjoHRKe/ww=;
 b=e74+NHqrndzVmK+gpt+8h6xtRfk7ZNd27m0g7ugngkzAK/QUKacYCtOROaEllmqUCO
 MzE4lD1002yWIes8hWuIhacKkBkaoyPmO+BXAWdogfXBCbBOe2YE4bsmuv38kNA0c2cI
 4M+bJv5RsnLgzmOeDqu62Ua1FwDrgfstPGhhPiJ/3lvqkeIwTNFaxmnDFpLOYwNpk54X
 R2UMqJGwubvp3oZT/xc3de/3CFYqg3v3fpGcXJp/ZLaERrbUGehOBTKOL2xCiwSQUTXS
 CeB49u1v3AlTQ1H8DSrRoZUq8/zuVpRiG+OZFcTiG3TmsB4eqtszFrRcpiHy95VQ5J1u
 wo9w==
X-Forwarded-Encrypted: i=1;
 AFNElJ/wGPlUskVtQFvIH5Acjo4RWKPXDkAEVzNM/IigPEj+ZHvh4p9kBt4LtXqWjsiyCT4gD3rjuAJiTA==@nongnu.org
X-Gm-Message-State: AOJu0Yw6xoUV2zdTjJeJxvlb+4TGhhuturO9XQwLa5q9S/c1bWxAlGQP
 bEErcjzG0IXuEKCCjmGBNJuFpy2RDBnodDe+net65b9Je+mV0xE5limzguaMxFPliKo=
X-Gm-Gg: AeBDieuwNNyKQ3fs6pyb8dMTd+sMqM0PlvEkuxLIbKo8oauU7ovWyy9vp2Lny5CF6yx
 FbXivaNHDqAz5VrGZZXIufr9eFGPY8F0I46LgyMLeo/iQw/xNwrQ0I7JLZyAb/KhEb1WQBrW61U
 7ogkH2H9vSM54fuGmwiDYjjAc8qtDF/Epwwz9DhbEsvptHZQd12H9US4X1AzkekaepMhdqETVmr
 TOVbSD10aPon/VSTC+KtJCRr9G0Ur97k7Xb9VW7+Y8NA/DRN46pm59QZ+m04x+vQLfOFK8OJeE2
 XBJk8ktj1zz+TtlekjOHm8i+E8zahsGXxz15yCWbO3/gBU3CiCwDRSZvLFfBqqlJ1HyuA0xcj9Z
 a0KuTLDI2wXWkYtYRNoSnHVmOD9xwPcayfWFE0tGvK5NbzPMDHsbKntb+jD9cmzidhoD6t54LVp
 ve+PpLMnSiK4q8eI/PK4skBNK7Yxj7PJ608g==
X-Received: by 2002:a05:600c:a105:b0:486:fb69:4960 with SMTP id
 5b1f17b1804b1-488fb7786e4mr229329295e9.19.1776862382062; 
 Wed, 22 Apr 2026 05:53:02 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc0f82bbsm753005695e9.3.2026.04.22.05.52.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2026 05:52:55 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id CAF0560EFD;
 Wed, 22 Apr 2026 13:52:51 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Pedro Barbuda <pbarbuda@microsoft.com>, Alexander Graf <agraf@csgraf.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>, kvm@vger.kernel.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 11/32] target/arm: migrate debug syndromes to registerfields
Date: Wed, 22 Apr 2026 13:52:28 +0100
Message-ID: <20260422125250.1303100-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260422125250.1303100-1-alex.bennee@linaro.org>
References: <20260422125250.1303100-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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

Migrate syn_swstep, syn_watchpoint and syn_breakpoint to the
registerfields API.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/syndrome.h | 54 ++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 48 insertions(+), 6 deletions(-)

diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index 2031b3704fb..2ad6b97aea5 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -595,22 +595,64 @@ static inline uint32_t syn_data_abort_vncr(int ea, int wnr, int fsc)
     return res;
 }
 
+/*
+ * ISS encoding for an exception from a Software Step exception.
+ */
+FIELD(SOFTSTEP_ISS, IFSC, 0, 6)
+FIELD(SOFTSTEP_ISS, EX, 6, 1)
+FIELD(SOFTSTEP_ISS, ISV, 24, 1)
+
 static inline uint32_t syn_swstep(int same_el, int isv, int ex)
 {
-    return (EC_SOFTWARESTEP << ARM_EL_EC_SHIFT) | (same_el << ARM_EL_EC_SHIFT)
-        | ARM_EL_IL | (isv << 24) | (ex << 6) | 0x22;
+    uint32_t res = syn_set_ec(0, EC_SOFTWARESTEP + same_el);
+    res = FIELD_DP32(res, SYNDROME, IL, 1);
+
+    res = FIELD_DP32(res, SOFTSTEP_ISS, ISV, isv);
+    res = FIELD_DP32(res, SOFTSTEP_ISS, EX, ex);
+    res = FIELD_DP32(res, SOFTSTEP_ISS, IFSC, 0x22);
+
+    return res;
 }
 
+/*
+ * ISS encoding for an exception from a Watchpoint exception
+ */
+FIELD(WATCHPOINT_ISS, DFSC, 0, 6)
+FIELD(WATCHPOINT_ISS, WNR, 6, 1)
+FIELD(WATCHPOINT_ISS, CM, 8, 1)
+FIELD(WATCHPOINT_ISS, FnV, 10, 1)
+FIELD(WATCHPOINT_ISS, VNCR, 13, 1) /* FEAT_NV2 */
+FIELD(WATCHPOINT_ISS, FnP, 15, 1)
+FIELD(WATCHPOINT_ISS, WPF, 16, 1)
+/* bellow mandatory from FEAT_Debugv8p9 */
+FIELD(WATCHPOINT_ISS, WPTV, 17, 1) /* FEAT_Debugv8p2 - WPT valid */
+FIELD(WATCHPOINT_ISS, WPT, 18, 6) /* FEAT_Debugv8p2 - missing WP number */
+
 static inline uint32_t syn_watchpoint(int same_el, int cm, int wnr)
 {
-    return (EC_WATCHPOINT << ARM_EL_EC_SHIFT) | (same_el << ARM_EL_EC_SHIFT)
-        | ARM_EL_IL | (cm << 8) | (wnr << 6) | 0x22;
+    uint32_t res = syn_set_ec(0, EC_WATCHPOINT + same_el);
+    res = FIELD_DP32(res, SYNDROME, IL, 1);
+
+    res = FIELD_DP32(res, WATCHPOINT_ISS, CM, cm);
+    res = FIELD_DP32(res, WATCHPOINT_ISS, WNR, wnr);
+    res = FIELD_DP32(res, WATCHPOINT_ISS, DFSC, 0x22);
+
+    return res;
 }
 
+/*
+ * ISS encoding for an exception from a Breakpoint or a Vector Catch
+ * debug exception.
+ */
+FIELD(BREAKPOINT_ISS, IFSC, 0, 6)
+
 static inline uint32_t syn_breakpoint(int same_el)
 {
-    return (EC_BREAKPOINT << ARM_EL_EC_SHIFT) | (same_el << ARM_EL_EC_SHIFT)
-        | ARM_EL_IL | 0x22;
+    uint32_t res = syn_set_ec(0, EC_BREAKPOINT + same_el);
+    res = FIELD_DP32(res, SYNDROME, IL, 1);
+    res = FIELD_DP32(res, BREAKPOINT_ISS, IFSC, 0x22);
+
+    return res;
 }
 
 static inline uint32_t syn_wfx(int cv, int cond, int ti, bool is_16bit)
-- 
2.47.3


