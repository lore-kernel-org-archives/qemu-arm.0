Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B59FDF9B60A
	for <qemu-arm@archiver.kernel.org>; Wed, 22 Apr 2026 10:12:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFUXv-0006ws-QI; Wed, 22 Apr 2026 06:11:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFUXq-0006te-UC
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 06:10:59 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFUXo-0000mj-UZ
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 06:10:58 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-488a9033b2cso59156055e9.2
 for <qemu-arm@nongnu.org>; Wed, 22 Apr 2026 03:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776852655; x=1777457455; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Oy8aVZbZZZe1U+CUvOIDDEpwm1FnWydA8CkWhWsEzmU=;
 b=zp8vPvPIA2ylWMIXnmdNENeGXnQHB+AakOr4E7qJTiN8MEj+4iHYdCqqQb+4k90Anz
 Dpn+I2aL4nXE/qOCZMReUvm/6/mR33sxiEWdobgqr8NCCJLrJmDlZV+9ryOMBsSBf1DA
 2XcQf3dEMTeUKKG2xJHo/J9i/gKhU9YPYNKXG7UpcSb1nUKxjCgKxrakMTsQw6ipIpTN
 3zdBu1JJUOxAd3AB23ioMIqCDtf9Vi8FM+AvOCHel8Nx/Z5mM7WojprjSD7N9pMryCtJ
 urAkahcd8kp5nZkp0qoJzfYGSOrauqp2wsAHUdUuU2vDKP07JJITJWWR5rYycRIhpis5
 DyxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776852655; x=1777457455;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Oy8aVZbZZZe1U+CUvOIDDEpwm1FnWydA8CkWhWsEzmU=;
 b=MCqNFCyi9VS7g1MGdEhGZoj3Gn5bMK4/6AW3HflWU+MIIXyDqEN1USlvnB32VnQGiN
 1G6crWh2UR0M5cg50BpyI7rVDCFWnZmsjkIG8B9zYIYMNwvllabcgR/N2QGpgliRcfic
 6sUKWzWlc/w9bzIC+EwfP7TB3SVMJYhxIQ/kBGOhkUxY7GJ+wtmGudXvnRrm0oKM92xY
 +b+R/FqEu1O1QVUHOShFZz8zoEbc/PsrRvndN77x/1VKdb5drqFm6DpC64srp/yaxzm6
 olPX7++7m0oLKm3Lo/YcSgS2Qwq1rsA8RM220y07lVmf4v1U/vrjNgx89055h3u5jhZi
 SFJA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8q0BoxeW7VtUwzrRlU45Ehajv4DTcvctauaSFpSQ/7gp+SIH8ffpwwF1zt+LRmEfpIlkwq+HabFw==@nongnu.org
X-Gm-Message-State: AOJu0Yyuz9JGBavjEl+Qrg2RRmim80Xdzl5VK8gzN2wYPWLn/VuitkOC
 0Nk5buzhUCpJBxhOc2UR2XIDX+keSPWElDQyKBYB37R1I2bJTd9z1bIU2Y6NUA1GDis=
X-Gm-Gg: AeBDiet4U7tb6xfGQwTt622ydFXh+lpkm4jHvQkjTxnlnt6qtU6kM2nqukThwxOyEdb
 DE/Z3+HmoHPZWxweoVeoM05htdPUTlLb+s/M71vSuj4WBmS/mQ4rUIf9QaWW4wK4xixu0F5T7dC
 SD6oQYRra0Rv7TFB4Vhfvdozb4R1PLLDgHKAT3VduHCZdf0Guogwa7Iy5Qd92MkBnIOZJG2eRdE
 JBDmfrKkG8TP4mjexgiyGURO+U1PaOgUCjSPRKWC7eoi0BX1ZKRByFqBT7Ks3yXgkbch+FgfHfq
 y4Jb+/9lWrn2Ns55ZPwccxf7e0utj18edTXll2eBihsRZIrxRAdIDsjLirk2hkvxM0yhxx8gg+G
 bNXcExPg+YMc/UbRA+RYkl5X+BfOipcPVz0csqWRP7C2gpLg/4mrDfFzCTOnojtMg0fkF6qeCcn
 Kq1YkYIXg7eQgqj4uoCMP+m//g9RQKgJpUrg==
X-Received: by 2002:a05:600c:4e4c:b0:48a:58ae:9938 with SMTP id
 5b1f17b1804b1-48a58ae9f69mr70183535e9.19.1776852655127; 
 Wed, 22 Apr 2026 03:10:55 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4891bb3d121sm372711075e9.14.2026.04.22.03.10.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2026 03:10:52 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 61DED60F2B;
 Wed, 22 Apr 2026 11:10:44 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>, kvm@vger.kernel.org,
 Pedro Barbuda <pbarbuda@microsoft.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 12/31] target/arm: migrate wfx syndromes to registerfields
Date: Wed, 22 Apr 2026 11:10:23 +0100
Message-ID: <20260422101043.1234229-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260422101043.1234229-1-alex.bennee@linaro.org>
References: <20260422101043.1234229-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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


