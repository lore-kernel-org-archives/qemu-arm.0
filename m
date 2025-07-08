Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A31FC8303C
	for <qemu-arm@archiver.kernel.org>; Tue,  8 Jul 2025 20:00:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZEUT-0003dN-3i; Tue, 08 Jul 2025 16:00:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uZCPd-0002O5-AC
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 13:47:57 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uZCOk-0004y6-B9
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 13:47:19 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-60bf5a08729so8721856a12.0
 for <qemu-arm@nongnu.org>; Tue, 08 Jul 2025 10:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751996784; x=1752601584; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MdQhcbrWCDw+stGMxabzY7NAeBH4tymx5hVA3eT0Fq4=;
 b=CXlbGnogiVadSj2FA2y9zq0lCPdOhtLtjw8qTVWG/H6msFGjAxN5jgwmXV5a0vgnQk
 EnztC83L4DLfCb4lw4K2opfwT482mElIFUbWqOSn60hF8d5bdD/UpwlT9m1JiI7oUc39
 UFFnwlbxmiPD5P7r9uJ9oA11i7CjqFJCQUalndyCEmuB+w2gs4CEx6Zj/am/pEXLy5hW
 0Q7WwZyVkE9J6dvt9oF/h6mEeok9ZqgWMNUrmKnobbx/eiPQgyGz/mB077tWVVA3TsuE
 2+qbsw2wNQON0sRkfjSKDb/+iYo2dE8Rv0hs2dcd2CzWNX/bmWU2BFvWhc0xx8eqG/pC
 UxFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751996784; x=1752601584;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MdQhcbrWCDw+stGMxabzY7NAeBH4tymx5hVA3eT0Fq4=;
 b=IEX4mVj2vWnTu+jN6SPoNEVacwAFZ9c/4mYXi1Zpe+CjHQIXtquvzuUlHJYooE65ZA
 mRfZ64l0QHj6KXBT7+kpazQQszOdr5x3zF2g+h++4VX4/wEOIJWb1969+Jyei17ZPIyc
 cGjHAQJyGrCquabVqnCaDvhy3dr5UdUzO5QhnNaIBY1rihIUfnNH+NVPCOufnPYWy1Ex
 fGi1zVUvU06qeVz2NNDlbrbNq1xaz2hnkm4dXOQjUL0Y8sQXkhU4L5HD7mqFZZzf/+zf
 xeFS0kyHECSIXSj19PqI/FGzeGSm55fBi90CweBKmyiX4hV9hzPy79teCBwG/NckQpnu
 Ak5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXb00t+WKz8OaKuwIG9m/0KxXNmUZEA1oMejQxUWjmbqBR8v0tG6cfu6kG+xusRVmy9djfLNdD+Xw==@nongnu.org
X-Gm-Message-State: AOJu0Yy1JDr2ZgwVIWW93dCS+SAf7kFy40iYIjdl99VAXKbPiGk8V2eD
 QWPxLOCym1umEGViZEyWrGIaT63FILyCCPYg8QVxVFkq8G+BGSJMjtq7aaBgM7csFGoQfQMyo6a
 dhlpC
X-Gm-Gg: ASbGnctvEGcwOAg3YMZLcdXcJys67X8rCQbw0p4MdB40wpKkOK8BNpor2P70cVvBgHo
 qhPV7Vh/HF0alhEZoXoil6ZzCozJbGrFEQkCQVkPLfzDFXaGnNfmJnKgIkodHQmLrwI1n9osDL2
 R881vp4GkbbC032XJ5Cu55GkqDK9aNqtPKVREGMc8elrG6OS43pUmSEMsantSFsFMPfCyE/0BYf
 b9fG3wfD7FwQ+SbKgivvpkaJozwFSD0Z7opel32iGPwpb2N/qJOyJr5YkS8ytFUSRnNpTeghu/W
 cYbCWb7jgJOvzqR9uLntqFmEw7SqOOnnNBEc2/KplQXG9llEou/SQHtKqFB+V/SbXemUoQjWnm1
 eyGrgQU7sGlSG/Autf3YolXw7vAdnufe8WBE1
X-Google-Smtp-Source: AGHT+IFxP3b5N6vxU6EpIbRwS7wH6KJLvPs4GzEpfkT+XKcIdQ581Ja1R1yt6JsGcJHJpBkNjt+5HA==
X-Received: by 2002:a05:600c:5247:b0:453:b1c:442a with SMTP id
 5b1f17b1804b1-454c0fc516bmr100411325e9.27.1751995282887; 
 Tue, 08 Jul 2025 10:21:22 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454cd38eee8sm27951465e9.6.2025.07.08.10.21.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 08 Jul 2025 10:21:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-block@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.1 v7 3/8] qemu/target-info: Add %target_arch field to
 TargetInfo
Date: Tue,  8 Jul 2025 19:19:43 +0200
Message-ID: <20250708171949.62500-4-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708171949.62500-1-philmd@linaro.org>
References: <20250708171949.62500-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/qemu/target-info-impl.h | 4 +++-
 target-info-stub.c              | 1 +
 target-info.c                   | 9 +++++++--
 3 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/include/qemu/target-info-impl.h b/include/qemu/target-info-impl.h
index 1b51cbcfe1b..a8b34d150ab 100644
--- a/include/qemu/target-info-impl.h
+++ b/include/qemu/target-info-impl.h
@@ -9,11 +9,13 @@
 #ifndef QEMU_TARGET_INFO_IMPL_H
 #define QEMU_TARGET_INFO_IMPL_H
 
-#include "qemu/target-info.h"
+#include "qapi/qapi-types-machine.h"
 
 typedef struct TargetInfo {
     /* runtime equivalent of TARGET_NAME definition */
     const char *target_name;
+    /* related to TARGET_ARCH definition */
+    SysEmuTarget target_arch;
     /* runtime equivalent of TARGET_LONG_BITS definition */
     unsigned long_bits;
     /* runtime equivalent of CPU_RESOLVING_TYPE definition */
diff --git a/target-info-stub.c b/target-info-stub.c
index fecc0e71286..2e4407ff04b 100644
--- a/target-info-stub.c
+++ b/target-info-stub.c
@@ -14,6 +14,7 @@
 
 static const TargetInfo target_info_stub = {
     .target_name = TARGET_NAME,
+    .target_arch = SYS_EMU_TARGET__MAX,
     .long_bits = TARGET_LONG_BITS,
     .cpu_type = CPU_RESOLVING_TYPE,
     .machine_typename = TYPE_MACHINE,
diff --git a/target-info.c b/target-info.c
index 9ebabec988f..8e29553b4ef 100644
--- a/target-info.c
+++ b/target-info.c
@@ -24,8 +24,13 @@ unsigned target_long_bits(void)
 
 SysEmuTarget target_arch(void)
 {
-    return qapi_enum_parse(&SysEmuTarget_lookup, target_name(), -1,
-                           &error_abort);
+    SysEmuTarget arch = target_info()->target_arch;
+
+    if (arch == SYS_EMU_TARGET__MAX) {
+        arch = qapi_enum_parse(&SysEmuTarget_lookup, target_name(), -1,
+                               &error_abort);
+    }
+    return arch;
 }
 
 const char *target_cpu_type(void)
-- 
2.49.0


