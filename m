Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 576EEF9EDC7
	for <qemu-arm@archiver.kernel.org>; Wed, 22 Apr 2026 12:54:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFX4r-00066S-Mw; Wed, 22 Apr 2026 08:53:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFX4h-0005yN-DB
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 08:53:03 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFX4e-0005To-PU
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 08:53:03 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-488b3f8fa2bso57674215e9.1
 for <qemu-arm@nongnu.org>; Wed, 22 Apr 2026 05:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776862379; x=1777467179; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Oy8aVZbZZZe1U+CUvOIDDEpwm1FnWydA8CkWhWsEzmU=;
 b=bxpmWuA9P9L0E0FlG86LzWZ+Yv8bQpXfTIk9eTlX/gWh7jFoHc1neq4oX0UNMcHCrZ
 gnO3wQ6SA0xY3Grubp+KDkFlJK3My3bDcw/5Sldnw4fSXg999hvIfZbl6vST/R0Oop/v
 Y+bWrlAxeC+2vtrv2z9ZGvh+ufRBH28WhKRCmfzeQovxetteDAZLsSRdGUZFNDBBeF5U
 +qXAGw5mDNoWo4LiXyawlexnBdNBvDoojyayQ670hxy4GzI7ZHb1nDs1+BdUUMw5c+NH
 J0RauHj5X6o9hk55thO0ZRIx4FogQeew6JwpqLPMB93yJakx1Oo9DzOdLnt2d7D0a+Ph
 Q3og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776862379; x=1777467179;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Oy8aVZbZZZe1U+CUvOIDDEpwm1FnWydA8CkWhWsEzmU=;
 b=qTWVMAEHvQFSAjgWQWrDYXuvmukJ3550dhoibVNxIEJEURKadKiJkK5g8qwCaWMNex
 IgT3PfcOgGGBmQcevr3JkJ4ED4FUOqwZb4XHMzvB1LqwbSTP/UXC4QLY8tQ6sSPiwMIe
 o/a3T9aE6wvjWDMIv1rp/pq5cISCTDkqwRPIHBMHJGK30FxGYWoKtq5zWWGjmiUgB7Gu
 KvDb2XiQnRLm3T6aSdQEdjE3+h2jTxb6WyzRFcpSwZnKFBsKseH6S2AEiD7vwXzv4CZx
 eyRqNyT7Q4qGeJ/POl8C3ISvb9tIUX1FDGw0FSGIsGdtKKQqxaKzjZQupbnZqXxEGD1X
 b+vA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+M7AFsXG1EQgiW6fGVFEACSqt1N66uhQo5r9yQUDaD//MtSX4ypVhw/sinjgbhEhiS+MecvLfXOg==@nongnu.org
X-Gm-Message-State: AOJu0YzO/qOGJSN4EQ3euX9eB2MdX1x9PrhoynmkHCEJhDkvO3jMGCZz
 Tv/h5bEuYlehNLSAKdWXXnW/5iQi64W4bZSUaQLpgaSNDGcl9RYic2xRdXEzXKvxYW8=
X-Gm-Gg: AeBDieuwT0/HS/2Fq/9B+rDflsyZW+TUwK9AJ3zHBkDApQZMiOv2EgJQFPat5zbIHFV
 xmGjBg9gyhZ4OdR3iMs4LuAOLPnoT0ieD6FNPnrg73ni6HKvgiJQndn0coquZZPGD+riUHSetZw
 2iVsKJe4Q1NQ0kuMOxbAAsYBh0yja2iLk1HAO8zDiaPaZCVtrfquI10zmgGeXjsu5m6G48+NPnF
 OOmfFNrLaJ5wZMLmp7+6wqsJGWE3NUak0O1mUvUJv1aKWcGHdz+O96BDoQWjRU2M81NslMWURXa
 BU0yo2YYnAoVXrDnW1nCFQJTUyz+xHOmaYgymhAhnlbmOAsZs7FlHxB8p22aX8AiWBd3KaWf+G3
 bBMnMW++aUHtf7fhidwx7K5RfxUIGYjIh97FgpIUaB8dCe4IEhnkYug1JWGVXRrqk+NT4dT743/
 7QXPXpoqdJ6/s2emSn/cDkdIELUcU4B01RqQ==
X-Received: by 2002:a05:600c:2288:b0:47d:52ef:c572 with SMTP id
 5b1f17b1804b1-488fb881ee2mr212647635e9.1.1776862379208; 
 Wed, 22 Apr 2026 05:52:59 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4412150a071sm10434897f8f.21.2026.04.22.05.52.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2026 05:52:55 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id E154060F2B;
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
Subject: [PATCH v3 12/32] target/arm: migrate wfx syndromes to registerfields
Date: Wed, 22 Apr 2026 13:52:29 +0100
Message-ID: <20260422125250.1303100-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260422125250.1303100-1-alex.bennee@linaro.org>
References: <20260422125250.1303100-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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

This will help later when we expand the fields we report.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - use !is_16bit directly
---
 target/arm/syndrome.h | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index 2ad6b97aea5..65d0de63a83 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -655,11 +655,25 @@ static inline uint32_t syn_breakpoint(int same_el)
     return res;
 }
 
+/*
+ * ISS encoding for an exception from a WF* instruction
+ */
+FIELD(WFX_ISS, TI, 0, 2)
+FIELD(WFX_ISS, RV, 2, 1)
+FIELD(WFX_ISS, RN, 5, 5)
+FIELD(WFX_ISS, COND, 20, 4)
+FIELD(WFX_ISS, CV, 24, 1)
+
 static inline uint32_t syn_wfx(int cv, int cond, int ti, bool is_16bit)
 {
-    return (EC_WFX_TRAP << ARM_EL_EC_SHIFT) |
-           (is_16bit ? 0 : (1 << ARM_EL_IL_SHIFT)) |
-           (cv << 24) | (cond << 20) | ti;
+    uint32_t res = syn_set_ec(0, EC_WFX_TRAP);
+    res = FIELD_DP32(res, SYNDROME, IL, !is_16bit);
+
+    res = FIELD_DP32(res, WFX_ISS, CV, cv);
+    res = FIELD_DP32(res, WFX_ISS, COND, cond);
+    res = FIELD_DP32(res, WFX_ISS, TI, ti);
+
+    return res;
 }
 
 static inline uint32_t syn_illegalstate(void)
-- 
2.47.3


