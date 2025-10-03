Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D26A1CCA471
	for <qemu-arm@archiver.kernel.org>; Fri,  3 Oct 2025 14:21:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v4gd2-0004Px-8O; Fri, 03 Oct 2025 10:19:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1v4gd0-0004PP-No
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 10:19:23 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1v4gcV-0000Ns-MB
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 10:19:18 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-27ee41e0798so33098385ad.1
 for <qemu-arm@nongnu.org>; Fri, 03 Oct 2025 07:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759501126; x=1760105926; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R6mQZxd/i8+rIw1saqr0gYaKPMxA97cW8VZlbdqTAW8=;
 b=iCNj/uLHWAyxnVYqgKQxErXlrEIGAXKMcC6fSHbopEAOpotz9dItWLJ0LK4x0KeG79
 c7hTLwagROadb8xkNQRDH2dRwvMb7Zk4S5QBdbLcwCXzwcZYy8mp1rlXDupX5jlGw/Uy
 txkr/VDfN8ZJv/IcR4wxEOXYugoIzSlp6FeL8jsAYYMfgwV1+OQv9usfXrm3Tc4GTK9Y
 spjtASaItT0GjWeXujhjGLWnuGYOgZiB3yO69P7Qq4BUEfK5+zWuQfTlk3G+UrZme+3+
 vyldEPZpUNgE+dy9K5MACaHEtv8WrBGSYjb4wf0fa2b4P9FVXBIGWEWdSAJn3MdkolPd
 5n5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759501126; x=1760105926;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R6mQZxd/i8+rIw1saqr0gYaKPMxA97cW8VZlbdqTAW8=;
 b=mJxNvBkeFd9NjcjwlMxavVRKGa5AZS9WJ6+dzrK754SXb30T+SRGokmjbafHXkky/j
 QKLE7TRaknFpKRx7obYHzBb1nqa3R6E1Md+1jM+Xf6mwwOB2KwkksgOPlud+86iZNT6f
 FomRlCxqn48DQIeMlNvqHDCFqCPG8s4QAuLS95vob+sfS/2fD5r6vUBiwq7876B+inwi
 zvC0IpNSEIr2gS42xVm6z6xt7GSrqoQupnZcT+LwFNqphwB+BJs7VPfwhsgsTzCNy04y
 aYolj74uORnGRsSjVNCl1JmCoWS/3m4xunvXJsgZFNU98GREKjCZJqrnmLhwJ5dcY55i
 JXlQ==
X-Gm-Message-State: AOJu0Yy9AGH73xfY89eWnHD2lxp2d60a8sViyp9tD6hqHGnxnpbCg1aR
 0LHl3rBy4O3DPif5/RECDvNfWahAgpCICzuRBbWSfrManNR2rk5CiEoXkRPCsfjOTcY=
X-Gm-Gg: ASbGncsROe1L9xHVElndOn/8ZX7JCMxl1zn6CiwEtGtMZ2SWiawag8jdY/DeuGWgbrt
 3rB8uqCI5gEvj6m4J5tsUrupzMlT2gykG2fm7EIqnCHY2I9dRMH+Vl1hFSiG+QjepTJN1BGisHb
 ZLbWQsEVlS1umgsuvHRTJODl6dpmgNKgydKei7c+2xL4J1CVA00rq6yWLqHtu4VbcpB2ce8xLQZ
 WJj/WXmxLchq+wz2V1psO+auQsSG4N+mRo2mdpdC7TzPcqODGPJf4NaE/4c6j8zgQdaeodubBF0
 sQ0iO5kUBpATra7rMqwJadUVjuEQTE3iTmL4SUX1XJ82//ZEwk7xmoLC3pSVDzR/D7DpD8bW2UU
 /2v3U4Fc5BMRRluvmKE6g6nHuRE4AjhyBlh9btAxcIR7MJ1aOcTm4Xeu+5j/ghjCSo1k=
X-Google-Smtp-Source: AGHT+IFbiBTGvgbnzG9EmDWSimUw+CJepchtLQ5XyAxQEUwl8SBklLcmUqysRNS8oNZwghz6JT59fQ==
X-Received: by 2002:a17:902:ce8d:b0:267:44e6:11d3 with SMTP id
 d9443c01a7336-28e9a5b1934mr53528035ad.21.1759501126352; 
 Fri, 03 Oct 2025 07:18:46 -0700 (PDT)
Received: from gromero0.. ([186.215.59.111]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-28e8d1d5635sm51759645ad.102.2025.10.03.07.18.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 07:18:45 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org, alex.bennee@linaro.org, thuth@redhat.com,
 berrange@redhat.com
Cc: qemu-arm@nongnu.org,
	gustavo.romero@linaro.org
Subject: [PATCH v6 7/9] tests/functional: Add decorator to skip test on
 missing env vars
Date: Fri,  3 Oct 2025 14:18:18 +0000
Message-Id: <20251003141820.85278-8-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251003141820.85278-1-gustavo.romero@linaro.org>
References: <20251003141820.85278-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pl1-x634.google.com
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

Add a decorator to skip tests on missing env variable(s). Multiple
variable names can be provided and if one or more of them are not set in
the test environment the test is skipped and the missing vars are
printed out.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
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


