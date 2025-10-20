Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAA14CCD1A2
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Oct 2025 22:15:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vAyAH-0007yT-Mc; Mon, 20 Oct 2025 18:15:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vAyAA-0007sd-2v
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 18:15:34 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vAyA8-0006oD-Ca
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 18:15:33 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-46e6ba26c50so31957955e9.2
 for <qemu-arm@nongnu.org>; Mon, 20 Oct 2025 15:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760998531; x=1761603331; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zZb4bRLl32INwLUSG+fpNojV8szKnj+JRZ8eDE6DgN4=;
 b=DvNiEMmj+KgzYTDoJgKZQuyYRKmKGICtYj6obdqCxaH6RRazk0mbdk188XKuKutVf9
 5QxW6fQfJVZFJAWLj2IqqLrP4UYarNC0k7j8e5hNkrn8Lj7Z5c4h/2wZJFgprqfuq8aQ
 Okb+f3P6Njxq38pE3INofTVFAaj9swayuJnBtOzXuy4tvu1VyDDLShUbgVy7xRFgEtc0
 beR9DF5JzFYiEP27HnvAGi3S6ltrTxs6vs7VQVmXIA6PjkSF5aBr5BBT7W3K1gGJV0FW
 m8uxyKTKXWc/wzDQvhsk72WwMZ3HX3RIO/vqk4Me/7615pnmM86YTvQZyymW/WcD69oj
 hOKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760998531; x=1761603331;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zZb4bRLl32INwLUSG+fpNojV8szKnj+JRZ8eDE6DgN4=;
 b=YcI9wMRC/HKWmfGWiW/V/c/VGRbWv1slMkbd7J7Av2EtE5wCOCU8RIlii2GHYcX/LW
 ZH3ow3w3SFnq9a79c2sZSatsClXDdYs9XbG1bTfnQ4lPO8PaPtjtbfNHuIxb8pguAJP5
 QqssStQ2/VBiNlGskvTzGbQZPUZfR0ArepxH11fkRj6xOGy3b7b3RDooy968K0ejp26i
 vDTnMbsZXIOXzpNZmbz6kd6zGCrDOXqmLHvKAWWOCC6v60KLYtULrOO7uy2Yp1Vt1tGU
 uz4V1EU6FPWjpOr2SLnyh81wbjuDefEprtNNhUmasy+uvcX5953u3x5iZT4XfM7F30kO
 MACg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWxKBFEDti76aNjRlysVgmRXT+ACVHC3LiKsQT9QMnqdpvbRf8BsGQXbPRlMJXW5ZVnj7347LvEw==@nongnu.org
X-Gm-Message-State: AOJu0Yze1J3D8nUW1yv8rAqpdpvyEnp+u6avvS5FeH2/832KG/H/CXjW
 uHmTMp7Aivw+qs+XVAV0/8mbgK3Ax5nfAKsBHhNlt/fAFc+lp1g73ZFttYkbhQe+zMQbWf1VXxQ
 1z7ZV8gc=
X-Gm-Gg: ASbGncujO+vkBCTmd0JP50AUx+4meXzZ6fTb+DxfHSbzgwAvlAmOOErw1QkDCvN8afe
 RQLYKPZ55zkIHkIWdJF4OKdNHHNx5O2M/futeiOfhwOVxR0XhJA6Q88TWe+nB4ZPflL2RHxm/IX
 VX8dkyWSajb96pGqha9a1etuj+H5jzjIe7kQSi+CUMbvanzP4BHrYH+OFi8UQHNXe3EeqqcsuhW
 PKC5HpPWDO1RtbU+QSQfi8SU5gW0EtE/a5g7jFzxLh9Z+0PGzTQgT5dXdLofoidrmdZOu3/bw/O
 QtwEuaZbzRsLH//D2GnaqA79RuyzZII3c8rLURws60EkOLNl+EyaK3Xf2PA7d/diD3ofi/R61Zg
 aSFkI6R9U+CiPIIL+KdQW1iD/OErpR09/zMLjRwDcL3EH/hcSxcaEOu1Gv8Uyv86YdkQhl810kF
 V2/853CwiOm2+nWw3mb+030ZmJsZ7rfzPSCpe9oFW37ZNk/XKCYQ==
X-Google-Smtp-Source: AGHT+IHSkH320nCjkaP9DaA5q2SqjMFMn8L21nFckzJ3ecqF0qHoFodfa/4pOoGDZep5TLkqQh+91A==
X-Received: by 2002:a05:600c:548a:b0:471:669:e95d with SMTP id
 5b1f17b1804b1-4711787dcc8mr95815825e9.12.1760998530786; 
 Mon, 20 Oct 2025 15:15:30 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47496cf3b45sm2489885e9.7.2025.10.20.15.15.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Oct 2025 15:15:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Anton Johansson <anjo@rev.ng>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v6 20/30] qemu/target_info: Add target_base_arm() helper
Date: Tue, 21 Oct 2025 00:14:58 +0200
Message-ID: <20251020221508.67413-5-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251020220941.65269-1-philmd@linaro.org>
References: <20251020220941.65269-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

Add a helper to check whether the target base architecture
is ARM (either 32-bit or 64-bit).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/qemu/target-info.h |  7 +++++++
 target-info.c              | 11 +++++++++++
 2 files changed, 18 insertions(+)

diff --git a/include/qemu/target-info.h b/include/qemu/target-info.h
index e8fbdf19d53..62359622232 100644
--- a/include/qemu/target-info.h
+++ b/include/qemu/target-info.h
@@ -50,6 +50,13 @@ const char *target_cpu_type(void);
  */
 bool target_big_endian(void);
 
+/**
+ * target_base_arm:
+ *
+ * Returns whether the target architecture is ARM or Aarch64.
+ */
+bool target_base_arm(void);
+
 /**
  * target_arm:
  *
diff --git a/target-info.c b/target-info.c
index 332198e40a2..f661b1af289 100644
--- a/target-info.c
+++ b/target-info.c
@@ -63,6 +63,17 @@ bool target_big_endian(void)
     return target_endian_mode() == ENDIAN_MODE_BIG;
 }
 
+bool target_base_arm(void)
+{
+    switch (target_arch()) {
+    case SYS_EMU_TARGET_ARM:
+    case SYS_EMU_TARGET_AARCH64:
+        return true;
+    default:
+        return false;
+    }
+}
+
 bool target_arm(void)
 {
     return target_arch() == SYS_EMU_TARGET_ARM;
-- 
2.51.0


