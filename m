Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB66CAC5AC
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Sep 2025 05:17:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v20p4-0004pZ-2z; Fri, 26 Sep 2025 01:16:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1v20ov-0004mB-8J
 for qemu-arm@nongnu.org; Fri, 26 Sep 2025 01:16:38 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1v20on-00061P-Ik
 for qemu-arm@nongnu.org; Fri, 26 Sep 2025 01:16:35 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-2697899a202so22457655ad.0
 for <qemu-arm@nongnu.org>; Thu, 25 Sep 2025 22:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758863786; x=1759468586; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tqvAjhF9PeBnkzh7otQwLKhrmJazNmoc6H8q1BcmrGw=;
 b=epBtE1i+Lp+TTTgh2haWFmw146XpCUImdLq742wFplHj68xW/CLyDYVOADAafmTO/9
 uriE+oMmYZwcqNdTdRrW1+bbwgkW2JWm6YTKyNxVBvhGCnrC/A75N2jTS4mYgWXBdj3o
 OvSKY5iPITrVF/RYWVQAAte00mPMV4OMlAsZFTt3+WQtor6PDW//e3v0gTm9ud2Eo5JX
 ItjdeJbmTM4v0Glp2K3d0pAENQOkHhGAdeFLqEXXtLxCG/7ujfrwr+T0BALuU+NzHkY1
 BBvLO/k1fhFUGr9SNosRQKBaVqtMCEW2Eb5KsYk0aWkNXtuuSj7eqH3hVy6y+duDMRxt
 ohqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758863786; x=1759468586;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tqvAjhF9PeBnkzh7otQwLKhrmJazNmoc6H8q1BcmrGw=;
 b=i9cpcBYg5TUZN6LGjFmg9w9u81YTJdZ8NiGtqxANu698v8qmEauOKC9ieLESxjoSzl
 1986+1uxOBT8Zld8g+wjd3apoM4ClDdFMBzGEbKgEo1SX2bsr4sDsLl175DcWWVavQDi
 8hlK5dUhbJeOA4pC2uicVNqdPQxzVoGVHfVQT7tIiQM0dLSq27KaJas+MDaRNYPp/DL2
 GfuW/5ZZSa0ZaswutiK3rPHjNxHf16AgxueIGTqDr7fikZJmbMxNOtY1bAVXd+B3TvDs
 6zldAAQEQL2OBvRyrA8Cg9imR9Z0T00KTJ/B2XnuqSZupRDAMRI/PP1RcRb2ayjnUAxJ
 SLJg==
X-Gm-Message-State: AOJu0YwcgIOh+wqca4owmxMHTthyuup0lDYHV63pocQdgz3m++LZMpL+
 ZaAhskaXs/U63OJ/Y+EWTMsS485f82Hj7bupGxSUmWCvesk3WEHB3T2j5to825kQN9A=
X-Gm-Gg: ASbGncthawOpy/peQH8cl5H9q2sOrSzufgZjISZyT6W5y/rec774iSdKjjARMk4JJEC
 3eRFQ/eklOYb8G1TUOcmbs0J9DJdvIRF5/Vg3b08w8/74CEyBzxxVTcgmFcJJz+2mv5AkUhiu/X
 Fr7DEUFfe23vLhumvHPg4G6E63Fu0m7DJftd13zBju0pq2p/7D+htF1R/yWYX20hhX+fzFjEjYF
 TjfW+HoZ+b/KNWFaMZe2GfYGzIb4UFucNZXuj8Afc1DRb9MqkDnpzMsrDLj5T3DQT+8bZiOUaD5
 dLIScrNoDf3rp0qyolDnfPWdAdlF8k7Ojq5eRpV2aenk4wxnrH2gkNmTp9ge/V5jZE0M2qgzFZQ
 MZ9EwyB6WBz63lL7L3oEvKOH9gQpE0lUUv0fzLLKgdFIWszu4xHxh+sXbnKHHRzFx7770
X-Google-Smtp-Source: AGHT+IHYIWi5gcV0fp9+TeSsY77WtkC+hvKT/qc8RXgBb+kfZWgiPvxz6FshJdgCPkH6cON97RS6HA==
X-Received: by 2002:a17:902:e745:b0:272:d27d:48de with SMTP id
 d9443c01a7336-27ed6e05744mr64600655ad.18.1758863785704; 
 Thu, 25 Sep 2025 22:16:25 -0700 (PDT)
Received: from gromero0.. (189-47-45-49.dsl.telesp.net.br. [189.47.45.49])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-27ed672a51fsm42160085ad.63.2025.09.25.22.16.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 22:16:25 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org, alex.bennee@linaro.org, thuth@redhat.com,
 berrange@redhat.com
Cc: qemu-arm@nongnu.org, gustavo.romero@linaro.org,
 manos.pitsidianakis@linaro.org, peter.maydell@linaro.org
Subject: [PATCH v4 7/9] tests/functional: Add decorator to skip test on
 missing env vars
Date: Fri, 26 Sep 2025 05:15:40 +0000
Message-Id: <20250926051542.104432-8-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250926051542.104432-1-gustavo.romero@linaro.org>
References: <20250926051542.104432-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pl1-x635.google.com
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

Add a decorator to skip tests on missing env variable(s). Multiple
variable names can be provided and if one or more of them are not set in
the test environment the test is skipped and the missing vars are
printed out.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 tests/functional/qemu_test/__init__.py   |  3 ++-
 tests/functional/qemu_test/decorators.py | 18 ++++++++++++++++++
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/tests/functional/qemu_test/__init__.py b/tests/functional/qemu_test/__init__.py
index 60d19891bf..320193591b 100644
--- a/tests/functional/qemu_test/__init__.py
+++ b/tests/functional/qemu_test/__init__.py
@@ -15,7 +15,8 @@
 from .linuxkernel import LinuxKernelTest
 from .decorators import skipIfMissingCommands, skipIfNotMachine, \
     skipFlakyTest, skipUntrustedTest, skipBigDataTest, skipSlowTest, \
-    skipIfMissingImports, skipIfOperatingSystem, skipLockedMemoryTest
+    skipIfMissingImports, skipIfOperatingSystem, skipLockedMemoryTest, \
+    skipIfMissingEnv
 from .archive import archive_extract
 from .uncompress import uncompress
 from .gdb import GDB
diff --git a/tests/functional/qemu_test/decorators.py b/tests/functional/qemu_test/decorators.py
index c0d1567b14..b239295804 100644
--- a/tests/functional/qemu_test/decorators.py
+++ b/tests/functional/qemu_test/decorators.py
@@ -11,6 +11,24 @@
 from .cmd import which
 
 '''
+Decorator to skip execution of a test if the provided
+environment variables are not set.
+Example:
+
+  @skipIfMissingEnv("QEMU_ENV_VAR0", "QEMU_ENV_VAR1")
+'''
+def skipIfMissingEnv(*vars_):
+    missing_vars = []
+    for var in vars_:
+        if os.getenv(var) == None:
+            missing_vars.append(var)
+
+    has_vars = True if len(missing_vars) == 0 else False
+
+    return skipUnless(has_vars, f"Missing env var(s): {', '.join(missing_vars)}")
+
+'''
+
 Decorator to skip execution of a test if the list
 of command binaries is not available in $PATH.
 Example:
-- 
2.34.1


