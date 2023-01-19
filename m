Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp390072ejc;
        Thu, 19 Jan 2023 07:00:44 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtktKcDlVKauQRibDzqhadEMTFNM6/c+uOhPHiwm/bvMwFxCrh1/WSmcwOot/B1rcLhsubw
X-Received: by 2002:ac8:1207:0:b0:3b6:310f:a170 with SMTP id x7-20020ac81207000000b003b6310fa170mr15037730qti.9.1674140443671;
        Thu, 19 Jan 2023 07:00:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674140443; cv=none;
        d=google.com; s=arc-20160816;
        b=LxL33ECxcx24FVsH2Ygyq7vnlyvV8GgieFJmrv6BXQwKb4PGs5Y8OCqrpzbSVriljX
         WCmYK3RBRRQK0nzOHfzuWkzcMIl7bHblD5w2c63grt4G4IZFJaq5Xh/1iNZaBn3F7mRn
         3UxLDd2rFNrQHEyZhz3kDk8Tzv3IxrcfSkCWemRAYfGVgtHyUSl167/6H/Tteg3hI+Nk
         IBWykb936oX5jf8mthBiuaAs0Y1WBypULgLCQJuMdpOlRhIik9GS0mquVzH7Gwyuij0m
         w6+/vMMD9iqNXn3jV/Z5Dhqw1cLVcvzDDsG+NW4LLva0PonxnzIlYNbgpehkPlcl/R3Q
         q5RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+M2TN+AUPgYoGzs4n18JWHJ0/EJHwDEI8iObjSbntGk=;
        b=elfECmQic6Qpq8zgFCNw39914VaKY/phwYhmytMWpoWS81MPPz8V4DctGkMoFIhrPt
         1yRWSi8Zb8IfrunBAer451Di1wFgRUUg1Ds9T5+UtBmaCd6WWAdMxYsHPJCMuW5ReNFV
         nW2z9Nb2Vr1lfqSCVjomxJMFg8IHttl7eay7cJ6KGVi2m3HfgDA/4DSFrIgpRjV1zngD
         zY+rsPf1OH7HvFDlTK60stlE0rSjVhf7QGAYbidzbPnBoXfN3nYj0jqyyD6XTi5jGtb8
         kZ4/1V9DL+eN7UTbB3Pf4FNz7QYr06PZlZDkI7UyVWw1x3zbud8KqqMdUSUafseQGDz7
         harw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QbOQPdJ0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g15-20020a05620a40cf00b006fa28c50e1asi24702031qko.645.2023.01.19.07.00.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jan 2023 07:00:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QbOQPdJ0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIWOE-0007yz-E1; Thu, 19 Jan 2023 09:59:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIWOC-0007uJ-UR
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 09:59:40 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIWOB-0003g8-DJ
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 09:59:40 -0500
Received: by mail-wm1-x333.google.com with SMTP id q8so1740365wmo.5
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 06:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+M2TN+AUPgYoGzs4n18JWHJ0/EJHwDEI8iObjSbntGk=;
 b=QbOQPdJ0WKZylesS32Mn24k6Dyxvsy0FIoS+3o3pVYJdH4lZosgq2I+vs4mg7KuHdt
 IMMDgVXyWO6ruNRjLoY0q9EEs1SOJMlRcXp7hcLrsBBEpY42+eZLl0Ef8Bz0IMnrdciU
 oxlY5MdOTmC37Ek1zUL0The/m7mi97Q6uPJ4TUjH5u3NWPmSvMh2rpyk6jEfn9SK2uDv
 YIC4gme6nkr+J4pjc1i4iwfQ72Du1nPLFgohmxCJb4HBxo+B+hrf+VcCSmYAeyE17ZiY
 5z0kPN01jkt4B0atmKCRZorIc01+P43sS6mtVxQAgv5TZQBGmOGqX0OW/0l4ZApy3wX0
 4TBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+M2TN+AUPgYoGzs4n18JWHJ0/EJHwDEI8iObjSbntGk=;
 b=uyLRIZZWSeucm2+9zG+XBx/Cqcdl+l7SfGwSc9oR+c+42fzebHwMhT9apHPgvcgsfO
 4BzmSqQBeEEOXgmiBWfEjcQknRFQbAqSCwIviNcGh2GezFs8HAWNug7MFu13Pb8098z9
 A1gCk9RqYCr9qWY+UsUbKDHfhqo9J90bQLfrbmwDGHSnmXr2Vz+JvPaSW8A9N9IqF6c/
 yUDhyOFu+FGM8xiJvThkV4ViFwCTNtIViZntvk5xmkOz/7JC4xz1x4b4IrNjkr6vcqXd
 nLaFkwA8d0jnrA1a2Jx15YX2wN70KfnldD2+v+AWXgtXZg9hSo5KicpTqS8g1yp9JzQr
 Ls5g==
X-Gm-Message-State: AFqh2kpVkgarEyNvc80nAzQCCpqpikrkFUE7f1pO/6VSwm8I2GzFI6dx
 9gTi8r7+cgbkJLCC2P3WzUbJ3eeIzqLn+R/u
X-Received: by 2002:a05:600c:4928:b0:3d2:2043:9cb7 with SMTP id
 f40-20020a05600c492800b003d220439cb7mr10589628wmp.5.1674140377851; 
 Thu, 19 Jan 2023 06:59:37 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 g22-20020a7bc4d6000000b003daffc2ecdesm4886329wmk.13.2023.01.19.06.59.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Jan 2023 06:59:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 10/11] tests/qtest/migration-test: Build command line using
 GString API (4/4)
Date: Thu, 19 Jan 2023 15:58:37 +0100
Message-Id: <20230119145838.41835-11-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230119145838.41835-1-philmd@linaro.org>
References: <20230119145838.41835-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: e0GhZqYY63+m

Part 4/4: Convert rest of options.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/qtest/migration-test.c | 50 +++++++++++++++++++-----------------
 1 file changed, 26 insertions(+), 24 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 015b774a9e..a930964268 100644
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
@@ -662,12 +662,9 @@ static int test_migrate_start(QTestState **from, QTestState **to,
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
@@ -679,27 +676,32 @@ static int test_migrate_start(QTestState **from, QTestState **to,
     }
 
     if (!args->only_target) {
-        g_autofree gchar *cmd_source = NULL;
-
-        cmd_source = g_strdup_printf("%s "
-                                     "-name source,debug-threads=on "
-                                     "-serial file:%s/src_serial "
-                                     "%s %s %s",
-                                     cmd_common->str, tmpfs, arch_source,
-                                     args->opts_source ? args->opts_source : "",
-                                     ignore_stderr);
-        *from = qtest_init(cmd_source);
+        g_autoptr(GString) cmd_source = g_string_new(cmd_common->str);
+        g_string_append(cmd_source, "-name source,debug-threads=on ");
+        g_string_append_printf(cmd_source, "-serial file:%s/src_serial ",
+                               tmpfs);
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
-                                 cmd_common->str, tmpfs, uri, arch_target,
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

