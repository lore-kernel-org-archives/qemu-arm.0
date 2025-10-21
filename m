Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C99CCD1AA
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Oct 2025 21:03:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBJUo-0004p5-CQ; Tue, 21 Oct 2025 17:02:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBJUk-0004oL-OR
 for qemu-arm@nongnu.org; Tue, 21 Oct 2025 17:02:14 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBJUi-0002xp-Rd
 for qemu-arm@nongnu.org; Tue, 21 Oct 2025 17:02:14 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-471bde1e8f8so14506045e9.0
 for <qemu-arm@nongnu.org>; Tue, 21 Oct 2025 14:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761080531; x=1761685331; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EyBRVhXyrHJatY88IDaUClSZaIlND+mQCqYij+BB37Y=;
 b=PmYkKM8W1BCFtZbD6Jeyzi9kvKSpGmlna0snOJA91eBoiWyz8G+6/7RXNn7oQ54Svr
 CsD0yD1iZ9Ya9f/Hd4lFvvvjS5u5am2ehNQ/5Ki3iyqNQz026hpVNpZqqYXHT1UcWCtk
 5UVdMcvcn63IzIjuPaZMbsSDDSeqq0ETZ3czPN7NphUYMr9WVnwMUnx3F6RZNgYqXS9c
 lUyzF4x4BSuV5AaaqCbCkFjCkm9vRYRmytl1rWuYgXpHqMwt99FeVg2TpYnWFA27VMbH
 Nxrw37O344yQEoTTgxVg8qIJ2Lc1tucHU57igeCczuYZNCYxOlBR8wm97nikQc5CFTDq
 DhEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761080531; x=1761685331;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EyBRVhXyrHJatY88IDaUClSZaIlND+mQCqYij+BB37Y=;
 b=bAUzF64RTGofM0DuS1V8tYbzklatHB3QHTgJ3dlfxUwQ2GFXhy8iVMhweuy/U/1vwE
 P5xHRGkJ4LlKKSKwTzT5rP9a0h88/a69afeLDNlqq++wzmYC+b46bQ6geaIi2bDkDzVS
 LTo8KYzg1daxEVThGWGIsOisO4IArDMHTBzKzDLEvcf4xxFIBf+Zwg+RO1fgGYp1hvXy
 ze2BEgidfWRxbST/gvdWlTEuPNvWJo20Dij57hnJqbGFV7lQVbgttzTunGfB/C67edi2
 z+n45aL3IzWxJ1z89RFGXtoRkBvWU/AYfuVhKKgfybsNZLvZH/yYNjrjmSat3/H/6rVS
 mE/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRmAG6Y9hhcNst4uZ0GIKHUJxv8fDaD6uCGbvvjm85CWbC5//e326HyFYW1mx2jb2nX5piaXNk6Q==@nongnu.org
X-Gm-Message-State: AOJu0Yx3ZVQ26ZIXEdnzKpN/6h5oEzrBTKwwsflBrvfcQv7zcn9EpNfK
 M+oMFqBn6GOooBdYLgjiJFenrkC6Jv0Ydpb7mmMCE+FXRTrJRegsvEv+ZNX3P3ZWGmU=
X-Gm-Gg: ASbGncswl5pqeY6vSCurTpnNpU8YyhMAKkIdH1ov9EpQ40NqnQfOh6kqlfZytKKwlVu
 N4kR78hJ4m6ZEAZR5ddjd+xEWWfN+5epnXn+d/nELCHcH/8C0qwiwURaV2Pu57yWjmepG+7k3hy
 1zMeoSWkKg/D+8l/fjOCN8Xz2J2A8nV+TzSl84SqP1n0PtrDAWj5pCCN99ZXsd4cMckrT0/ynmw
 e1ydlFgiEskGZFQvSGgF5WTwIoPzH/4uYAr5zlPiff2nzFJ+68i0RSMTu9n41o18n98CUm8PtoB
 EejHnfsLXn02QIhNX3oMKt0abGeuJfuzzoprTk6W9TITKXYAK1/Z6wpgEbiwmzg8hEFgyzV4JIP
 u8AcstzpmRbm58hrzEj3r4k/WUvD/iiuKjBMhGR5ngBDMfU7ez0I6KXF4F51Xagj/Ws+jrIQLQ/
 X+bgsJ7ElcpxKk+WovuIef+XopaDytyoZI55D6zc9nfsTZmDjj+2JfWgQt3vtr
X-Google-Smtp-Source: AGHT+IEB+GhIMJSY17zfotixHDFe5CBPa/FciXAXoiTkzORWQUFQHmAtUk3NpA9PsS4WZq7aCvJu0w==
X-Received: by 2002:a05:600c:4448:b0:45d:e28c:875a with SMTP id
 5b1f17b1804b1-47117912b0dmr137813445e9.31.1761080530972; 
 Tue, 21 Oct 2025 14:02:10 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475c427f77bsm10544495e9.3.2025.10.21.14.02.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 21 Oct 2025 14:02:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Luc Michel <luc.michel@amd.com>, Peter Maydell <peter.maydell@linaro.org>,
 Anton Johansson <anjo@rev.ng>, qemu-arm@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v7 11/19] qemu/target_info: Add target_base_arm() helper
Date: Tue, 21 Oct 2025 23:01:35 +0200
Message-ID: <20251021210144.58108-3-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021205741.57109-1-philmd@linaro.org>
References: <20251021205741.57109-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
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
index e567cb4c40a..24696ff4111 100644
--- a/target-info.c
+++ b/target-info.c
@@ -53,6 +53,17 @@ bool target_big_endian(void)
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


