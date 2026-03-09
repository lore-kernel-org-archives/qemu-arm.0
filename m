Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B0C3FCA168
	for <qemu-arm@archiver.kernel.org>; Mon,  9 Mar 2026 17:50:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vzejZ-0000pP-Ue; Mon, 09 Mar 2026 13:49:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vzeir-0000au-Ja
 for qemu-arm@nongnu.org; Mon, 09 Mar 2026 13:49:04 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vzein-0002p9-9z
 for qemu-arm@nongnu.org; Mon, 09 Mar 2026 13:48:53 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4853fd7b59aso5585335e9.2
 for <qemu-arm@nongnu.org>; Mon, 09 Mar 2026 10:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773078525; x=1773683325; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Re1Z7KTF6pGt06r2qKUhhUG6rRUM2+jHUzT54RyU8Vo=;
 b=FTFZ8SEdYsfPazS3nfdP1tVdim/bsrpGwI70n2zDXiZti4Pjv9VT+l6siqmdWJkfQ9
 BONi6CyjbNkmllgagTGlYZQR+J3B/cvi/EUbCT9FLPdQKTILRgqsQiVn6nokby/oYHPC
 fA9WGeH6N6RhpbmUV+K1/hVjrwxNfEE1eHsJsGsaqiGWarsvN5O6CU2i7czGDUelLTql
 7IMGjvbyBTl26p8nzhHuUtJhCJjbYEdeCfGu+opEk8mamzxcmc6YyjPAL0O0EC1mCk8u
 fAFth+aLBYdK7WppVcFyiQqtQLWqR+eZIQkWaxjOACYQIJ5stxWSedntDsC+nr8JL4ai
 7V5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773078525; x=1773683325;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Re1Z7KTF6pGt06r2qKUhhUG6rRUM2+jHUzT54RyU8Vo=;
 b=ruk/mghQAr/apUigOKH9/scOhoKXvEacr8hdO/gRCElJTu921N0ojcSXcRBtfgnJWf
 ZWe3HR7MmK37LwUrehbPWwkyuhikACQmPISEskvHfJG+wuQFokrxuvPTSoCYeEp5Orm/
 dwD9yXr8OSeUkh8xrcfazdzOEqLlJNR5rPZpTKMUYobsmhdx49pzNRfjKCGAMyXZe393
 DNBztkrAN8VzE6V4/wxGFpj/w8HwtoLvT24oOKfVa/WMlrSKp0tf4DDyePvxZaAka9P6
 26/Br0/OVXOYXm7N8HaEucqz1Gp2HyCmwkQKyaZXfirg5u3JZQvJQl0s5/wIeG46PTfp
 PHig==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxAwSfaNSgZZHwcH9RdupGbNygSGZ1UvK/6dYDabI1ZFA5p+hhPurgdT/HF1rpSNu02eo/viD6ow==@nongnu.org
X-Gm-Message-State: AOJu0YyB5wymlNcV929LosQtswl7fqMfveWI0HGxRZJM6LDTfPgWI9vs
 QDIWLFz4zDR0CsqJu+3Xm/fdXn7pdfDuqTM9Fl9UdsNSh+ScZtHsyNO75Gumb1UvA09Vnz4Hktc
 buyafid4=
X-Gm-Gg: ATEYQzxUHk3Qjo7jRwu8ayUHsG1OyPqewBIAzomeawbAbd0SskZdAsaQYIlbTmcp61/
 0jvCYa7I2/Ert0HNW1igSSkoqrK5DlP6jrunCHve9U5f/B9cWGiPs53rlWN7ORqTnwr85aoFUrH
 E8mrWHUlhAecS5t8IB6Wz26MJ5tVGMTuzWE2cUOEgDk0zI+9zTiFUFLVlrafwRL3p+34HlKZRru
 wNF5FDW/e8A2DqBtdRx3DXbl44GHD6JwowUugrWZp7TLmBMUedacSjgSghHSNYO3UNGBzTsPs7L
 D3Jki6O7OMC5h37qbOoA0BFbIjWNCJMaxm1z0/WGGEeHEeac016fVkiiyX5WxumhLE43L3RAgRL
 xONSmqX5JXIZbij3ajzm6InRmhRbUFGbZpTEe4GxQjsm/uFST2oJW2F40fysFmN4G6IRcDTkLE1
 dtVPVEnS0FGAAMZBVb/yey5Tw=
X-Received: by 2002:a05:600c:1d1e:b0:483:c35d:3659 with SMTP id
 5b1f17b1804b1-48526957d5cmr208195725e9.18.1773078525397; 
 Mon, 09 Mar 2026 10:48:45 -0700 (PDT)
Received: from draig.lan ([185.124.0.126]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485237f354esm94164265e9.5.2026.03.09.10.48.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2026 10:48:43 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 084865FB68;
 Mon, 09 Mar 2026 17:48:42 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Brad Smith <brad@comstyle.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Kyle Evans <kevans@freebsd.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 4/5] tests/functional: allow tests to define decompression
 target
Date: Mon,  9 Mar 2026 17:48:40 +0000
Message-ID: <20260309174841.4184117-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260309174841.4184117-1-alex.bennee@linaro.org>
References: <20260309174841.4184117-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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

When dealing with multi-stage decompression we want to specify the
target file name lest we just overload the cache name. It also allows
for something is little more friendly than the cache hash.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/functional/qemu_test/testcase.py | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/tests/functional/qemu_test/testcase.py b/tests/functional/qemu_test/testcase.py
index c2c916f6077..eaec1bea138 100644
--- a/tests/functional/qemu_test/testcase.py
+++ b/tests/functional/qemu_test/testcase.py
@@ -35,7 +35,7 @@
 
 class QemuBaseTest(unittest.TestCase):
 
-    def uncompress(self, compressed, format=None):
+    def uncompress(self, compressed, target=None, format=None):
         '''
         @params compressed: filename, Asset, or file-like object to uncompress
         @params format: optional compression format (gzip, lzma)
@@ -52,8 +52,11 @@ def uncompress(self, compressed, format=None):
         if isinstance(compressed, Asset):
             compressed.fetch()
 
-        (name, _ext) = os.path.splitext(str(compressed))
-        uncompressed = self.scratch_file(os.path.basename(name))
+        if target is not None:
+            uncompressed = self.scratch_file(target)
+        else:
+            (name, _ext) = os.path.splitext(str(compressed))
+            uncompressed = self.scratch_file(os.path.basename(name))
 
         uncompress(compressed, uncompressed, format)
 
-- 
2.47.3


