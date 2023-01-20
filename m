Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp919836ejc;
        Fri, 20 Jan 2023 00:25:06 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuaxWxsQkp+y1e4IbwXLgDROUHZOFRy4ijoHvK2pUtjeIPQVa8AifQVrkuUGUUOPgR73986
X-Received: by 2002:a05:622a:290:b0:3b4:5d7f:2805 with SMTP id z16-20020a05622a029000b003b45d7f2805mr23541052qtw.6.1674203106609;
        Fri, 20 Jan 2023 00:25:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674203106; cv=none;
        d=google.com; s=arc-20160816;
        b=Oxd5YAdTztvI1R1W3f9df2AXERaIkvrXrIcLHp31BcvsJ15cP6q9LPW2b7AQxSYuOO
         eAisz5vntwqt10ltY+p44KulvdHQgxdSX5P66dVEDZpp6z4kdipMO3jCMwsMO3PUW/1A
         ns1EXCdyoZWuGwhL1eFkLvRWAeybz9wIs2cmhpCOK7jyMvh/lUgZklwvrOUoCCASxHgj
         M0nTQHrEa9HZrVg0wSg4xGqrTp8CD3I56raDMW/oQXrXpLIKTk32hEbK1I80MDdraTKQ
         z3LjTS+/QUX3qSksjEYd2cLBUBGk5GEvdV8BAEGCyt3wW5AMKB0vuVHOINk8vB2s1ZG7
         Ml7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8eiWB2mgS5s8IODt1mSJBolF54HXrNWV0tPwSRIkLm8=;
        b=bUcIF+oyQGx7cHbjlGy786FeNtjiobJ6lI0yP9nUwyw2Pu0QUzu/4o4HcHFkCvnAAc
         DkABhnNtf1Z7TJ8ta1yx4/I0/gNOGpbQQC0p4QdU2HsnUirj0u/CGXtMr4fhiaWV1GqS
         R4iERbZAvNmnMyuubEHRK5hH+z+VGdyViA+9DSutIUj5zv1EONRwLoNNGtPu8h8u9cCR
         doApfEvI/s8SpDR9nJcGY2MOR2+ciXcEZmZNkqDGseoNdcbCHIvG/8sHUM4NAUpS0UHv
         Pk1gE7po87xGku2yOvPMLw+QwLEoIfHYRZtCQxPuK/qX5kHCDaXL586/v+aZvtfCro2B
         gW0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T9fNlr7q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e124-20020a37b582000000b007063455e15dsi10153856qkf.34.2023.01.20.00.25.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Jan 2023 00:25:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T9fNlr7q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pImhS-0005IZ-SE; Fri, 20 Jan 2023 03:24:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pImhQ-0005Ca-Nz
 for qemu-arm@nongnu.org; Fri, 20 Jan 2023 03:24:36 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pImhO-0004dI-JN
 for qemu-arm@nongnu.org; Fri, 20 Jan 2023 03:24:35 -0500
Received: by mail-wm1-x32b.google.com with SMTP id g10so3399155wmo.1
 for <qemu-arm@nongnu.org>; Fri, 20 Jan 2023 00:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8eiWB2mgS5s8IODt1mSJBolF54HXrNWV0tPwSRIkLm8=;
 b=T9fNlr7qdkM84eEPuX5uCJ76nlAtPpVEul0xug1Pz08e652KrE84UQWICNDZMBTEp7
 If0+D41sb1wOoRWMMpmcG3Ab+JKEsBgY2q/ruawR0hNU3/U++QQc+uRklunMUUxHeyj1
 /o9FbNoE2iSiLlW2WdqfMOGYsNe/r9RYgTMwmBh8S6G3V+Ngr8M55U4jM+pIx5lDH2CC
 RopvZgZ0ERsE0Z4U7m3pZLlyclIxTFdwDKLavsoz1HyTOm5SN2gDgS09QOm8275Ze7Ux
 cMuOdMbkKTi9h7XrwddtIb3AOmk/0iUmW9B8ifWc45hqvc03zmkANKHf6RpUUyDRyP44
 CliQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8eiWB2mgS5s8IODt1mSJBolF54HXrNWV0tPwSRIkLm8=;
 b=X9Vwr7/qhZhSkCnY8FdLcrG6Ogw34sgpg7nqysEpuH9sh+Ngu/ULaSGMYRtImgJ8yb
 v0wuGnpVYviMj8WSxOD5sSbc+twi3Ixl9aTxOuz9+4/MbmNmGyrTkXBqHnj8ym3b/IST
 WGl1Xp1Dgch4siDj5+Ao3DvpJ8EEyfiJ1htUJPrQEAEmEpPh7qJLjrmSQIGc3PjUvfAe
 rRN5ZgCH4lrXB2ZgzofJYF3+xN0HqUzYxtStK67UpoCngqCIo9L0vD8djzC5I3WX3Gbb
 f0g1kzY3nqc30ZkvyBjyBQxDk5GEqFAXxid59JTZCXzKplsdvKFtXKT8VnRNXb5jzP3i
 6vvg==
X-Gm-Message-State: AFqh2kri0q02EKGjXsyRopaDuwCaA5EejKEuwqbm65fmwCrgX/nBhHQG
 4ACBaKMksHpvuB1n7stPNRnsfw==
X-Received: by 2002:a05:600c:354e:b0:3db:331b:bd57 with SMTP id
 i14-20020a05600c354e00b003db331bbd57mr1073167wmq.23.1674203073952; 
 Fri, 20 Jan 2023 00:24:33 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 hg8-20020a05600c538800b003d974076f13sm1552992wmb.3.2023.01.20.00.24.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 20 Jan 2023 00:24:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 10/11] tests/qtest/migration-test: Build command line using
 GString API (4/4)
Date: Fri, 20 Jan 2023 09:23:40 +0100
Message-Id: <20230120082341.59913-11-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230120082341.59913-1-philmd@linaro.org>
References: <20230120082341.59913-1-philmd@linaro.org>
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: SXzSTrmWqqRz

Part 4/4: Convert rest of options.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/qtest/migration-test.c | 53 +++++++++++++++++-------------------
 1 file changed, 25 insertions(+), 28 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 1ed3505c91..e7786bcbc5 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -585,8 +585,8 @@ static int test_migrate_start(QTestState **from, QTestState **to,
     g_autoptr(GString) cmd_common = NULL;
     g_autofree gchar *arch_source = NULL;
     g_autofree gchar *arch_target = NULL;
-    g_autofree gchar *cmd_target = NULL;
-    const gchar *ignore_stderr;
+    g_autoptr(GString) cmd_target = NULL;
+    const gchar *ignore_stderr = NULL;
     g_autofree char *bootpath = NULL;
     g_autofree char *shmem_path = NULL;
     const char *arch = qtest_get_arch();
@@ -666,12 +666,9 @@ static int test_migrate_start(QTestState **from, QTestState **to,
          * IO redirection does not work, so don't bother adding IO redirection
          * to the command line.
          */
-        ignore_stderr = "";
 #else
         ignore_stderr = "2>/dev/null";
 #endif
-    } else {
-        ignore_stderr = "";
     }
 
     if (args->use_shmem) {
@@ -683,31 +680,31 @@ static int test_migrate_start(QTestState **from, QTestState **to,
     }
 
     if (!args->only_target) {
-        g_autofree gchar *cmd_source = NULL;
-
-        cmd_source = g_strdup_printf("%s "
-                                     "-name source,debug-threads=on "
-                                     "-serial file:%s/src_serial "
-                                     "%s %s %s",
-                                     cmd_common->str,
-                                     tmpfs,
-                                     arch_source,
-                                     args->opts_source ? args->opts_source : "",
-                                     ignore_stderr);
-        *from = qtest_init(cmd_source);
+        g_autoptr(GString) cmd_source = g_string_new(cmd_common->str);
+        g_string_append(cmd_source, "-name source,debug-threads=on ");
+        g_string_append_printf(cmd_source, "-serial file:%s/src_serial ", tmpfs);
+        g_string_append_printf(cmd_source, "%s ", arch_source);
+        if (args->opts_source) {
+            g_string_append_printf(cmd_source, "%s ", args->opts_source);
+        }
+        if (ignore_stderr) {
+            g_string_append(cmd_source, ignore_stderr); /* last string */
+        }
+        *from = qtest_init(cmd_source->str);
     }
 
-    cmd_target = g_strdup_printf("%s "
-                                 "-name target,debug-threads=on "
-                                 "-serial file:%s/dest_serial "
-                                 "-incoming %s "
-                                 "%s %s %s",
-                                 cmd_common->str,
-                                 tmpfs, uri,
-                                 arch_target,
-                                 args->opts_target ? args->opts_target : "",
-                                 ignore_stderr);
-    *to = qtest_init(cmd_target);
+    cmd_target = g_string_new(cmd_common->str);
+    g_string_append(cmd_target, "-name target,debug-threads=on ");
+    g_string_append_printf(cmd_target, "-serial file:%s/dest_serial ", tmpfs);
+    g_string_append_printf(cmd_target, "-incoming %s ", uri);
+    g_string_append_printf(cmd_target, "%s ", arch_target);
+    if (args->opts_target) {
+        g_string_append_printf(cmd_target, "%s ", args->opts_target);
+    }
+    if (ignore_stderr) {
+        g_string_append(cmd_target, ignore_stderr); /* last string */
+    }
+    *to = qtest_init(cmd_target->str);
 
     /*
      * Remove shmem file immediately to avoid memory leak in test failed case.
-- 
2.38.1

