Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF1E2CCD1A5
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Oct 2025 21:02:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBJUe-0004mV-If; Tue, 21 Oct 2025 17:02:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBJUN-0004ke-Pw
 for qemu-arm@nongnu.org; Tue, 21 Oct 2025 17:01:53 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBJUL-0002wU-3K
 for qemu-arm@nongnu.org; Tue, 21 Oct 2025 17:01:50 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-4283be7df63so1855381f8f.1
 for <qemu-arm@nongnu.org>; Tue, 21 Oct 2025 14:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761080506; x=1761685306; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fQ7vX/J0K8O95NQRZgT5T/ZDgAm8B41EHYtSknq9nF4=;
 b=VnKooQtfw4FLwKpXs1+C2hpow6VN5FMHUh68z6ui0aF1aN/W49IR/wJV0BBV6QT6q4
 aCdc97V5YV3hFHtvulO//V8a9qqLe0hAK4kOf3LYrw+5pPYpcFtagUy/uuho19qVTQv0
 I0T7mhDO8B0zPlQTWSqGNHn+bhfNdRSAvdN2m9kvtK61YePbuTLiTpQQRLjJDIkbIZuc
 /DDlqdgZoxbtHMk/LxIEP1A53EROfswN13NboQHbx2Mz8TtSsOkTJEXeK6iu+1c437i/
 xMMbQYbIgL9bZkqtj5/8yCSAyrJJKMLPS/NO39HHJPJuKrojmuURc5qnEHF1+CCUutmR
 yqnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761080506; x=1761685306;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fQ7vX/J0K8O95NQRZgT5T/ZDgAm8B41EHYtSknq9nF4=;
 b=VgieyxP3knHZcT5lv2KXjXMAeJ6pYjxw5ffa1GwKCHYbhp8umGKquzgNu2RchNRyvQ
 VMrUxAqRYlAWnEX/agJAtEB45Nqtb7wct6Jizt3xkjAs316tuN4RyVyat4XQGlzQQ37v
 P1B6vlkXfC4g5IhX07kz1T5sqR6OCXkRI7bX+wPIOZPIfI9cs3qcktzD3EVmuGRkWd7C
 7FEsxgUXk2cX9Xyc9u4NCvNtlN7o+l3ZWCsP+E+yiQj0NJuGlSFCCtXAga8jIWLVrogl
 xryNWSSyt/+N5yVUcKqW3JuTV1A88OzhT2JIsN4T0fN+YxrC/Ry15ektpZIJ57GJ4APw
 2lYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCoHgBLDL87/hW0kTFpzGdh6JpeAVYXI6Auadv470rF1TzEmjfRrDsjGBiq+UtfmW78F8wAdOPyA==@nongnu.org
X-Gm-Message-State: AOJu0YyVsuBmOc7CTuA/rRp9/PBo7NG0+3jpOptr+VGS///FshHmCJig
 5vy5eoxexw6veP65ObgfBlhnJKkagg9tyBcCKZtihcNkcCgFwf/wV7MnNHfEEnOgX+aCEyclxuY
 O3jl9JEI=
X-Gm-Gg: ASbGnct+vUBHXUZzKZFP54A0fexRGZ3fPC3aOCVVzpZQKuSkN2sAM2L4V0feL0h4Z+i
 pQsDBi9wSfSjWU73W7RnvpdWWh6nZst+7Pr6UphwyfY3jpHOEWBJD7tx6U3vBTO8/DU6RYC9Zv3
 pcZ1JJcCO6j3TPOn23wPPVnMGYYtzGsg/6QP0YaWXQLkIEbl9usQY6ZW6y9m+YZwxkSS8cHlzrL
 d+mwAEp1sCxS+h/aF0yyAJ/syJanzshYWbES/lJCdnbBdNs//UFs4Lcc282jER3adWx0aH6zFr1
 rBBOx1Ki4MR/2KA9waTIxJ2OQ8wrlrfes5GFK5aL9xgV1T2rrgKwer7wBgd8rRNK54OtZ99cbAY
 L/1/poDyNwZjcj3XF1tPtJctbGQW2zysGJ6/9py89/LeGw3uU/BI6/VnZVjeE63IuKFESRXDsrO
 6PuVo9SaoyyFKf8s9SPPiLoP95uTW8lscRYt1H5A8pXvd6iKfOFg==
X-Google-Smtp-Source: AGHT+IHQRZ9MmKdnECb+TDa/pagDVrogqr2xz/hN7bDS8u8S7/vMl5Cj+DVYemK8z6rfQG84JaiODQ==
X-Received: by 2002:a05:6000:22c5:b0:427:492:79e5 with SMTP id
 ffacd0b85a97d-42704d7504emr11075137f8f.21.1761080506592; 
 Tue, 21 Oct 2025 14:01:46 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427ea5bbc50sm22271258f8f.21.2025.10.21.14.01.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 21 Oct 2025 14:01:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Luc Michel <luc.michel@amd.com>, Peter Maydell <peter.maydell@linaro.org>,
 Anton Johansson <anjo@rev.ng>, qemu-arm@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v7 09/19] qemu/target_info: Add target_arm() helper
Date: Tue, 21 Oct 2025 23:01:33 +0200
Message-ID: <20251021210144.58108-1-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021205741.57109-1-philmd@linaro.org>
References: <20251021205741.57109-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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

Add a helper to distinct whether the binary is targetting
ARM (32-bit only) or not.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/qemu/target-info.h | 7 +++++++
 target-info.c              | 5 +++++
 2 files changed, 12 insertions(+)

diff --git a/include/qemu/target-info.h b/include/qemu/target-info.h
index abcf25db6fa..984fba3f42d 100644
--- a/include/qemu/target-info.h
+++ b/include/qemu/target-info.h
@@ -50,4 +50,11 @@ const char *target_cpu_type(void);
  */
 bool target_big_endian(void);
 
+/**
+ * target_arm:
+ *
+ * Returns whether the target architecture is ARM (32-bit, not Aarch64).
+ */
+bool target_arm(void);
+
 #endif
diff --git a/target-info.c b/target-info.c
index 3110ab32f75..40716bf4051 100644
--- a/target-info.c
+++ b/target-info.c
@@ -52,3 +52,8 @@ bool target_big_endian(void)
 {
     return target_endian_mode() == ENDIAN_MODE_BIG;
 }
+
+bool target_arm(void)
+{
+    return target_arch() == SYS_EMU_TARGET_ARM;
+}
-- 
2.51.0


