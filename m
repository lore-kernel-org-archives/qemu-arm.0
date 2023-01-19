Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp389308ejc;
        Thu, 19 Jan 2023 06:59:48 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvGLcUBYkVcNQdrNByZlAKWmQvXLUVa0rYyTtQ7D3aL7kBTskssQiko97lGHKeUyKCkBZpZ
X-Received: by 2002:ac8:5a95:0:b0:3b6:2f0d:1924 with SMTP id c21-20020ac85a95000000b003b62f0d1924mr19988595qtc.32.1674140387865;
        Thu, 19 Jan 2023 06:59:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674140387; cv=none;
        d=google.com; s=arc-20160816;
        b=qvDEpcu+SCYGTpF4l+h0UamvK1c352XDOexePSBmbm37g50opVpEBbePlbMKZMNKyn
         AUvMmpMvIH1zOdNNMG88l1TM0IbMWZSlrc6UXEjP7z0ewYWITbdhjJ01LbhDRYxJhPyn
         BkQblcNnp12DWTamCRJfo8qR7OsZpvKK9BlSxadgMCQVD+sxyhDh9yIsiNTi1GlIKx64
         k5+HpcnCnuX9GLW6hJ5jp9K1bMWedLKY09XYlnjOcPCWsFbE4D+yLp6gkCd6QNWhkNVA
         w7xiHl4Eqk02Cp0IlSqBEURxxg1p645RLSSE6C/H0cwasrLuh5pfx/QUen+LoTKdYNNN
         2nQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=isWU99zMSOEnAE1RSfFCfmsXaFaInKvayEoBiTZj20E=;
        b=YZym3aq/fwd6uSx053Jr6AwMUZMQJ0HX+PWuQ9tDZJAjlZqhqJbBww6oRo9M0FYTmf
         hbqHyGSvNLc4taaPWn327A2jPe7g+vnJQaFlgSFq5W4s/A4KQLIN4rIRimMZUe1QqiSk
         /qhM3QsSYFjoVpntXH9mBH8r9vYnJRJhFgg0lb2r7n1bTnQsN93DgpMu5fwtiAXU0tei
         aSWselaveg0AnUDcYM4a3EdpVDNrbFymm0HkwrZe3/s+0mjolYH1HKC8030kImrTzwgE
         4fRhuD2/fNmlIG0Qtu/qCq0tuPMimZGLdTFxrqlasUZS7DQ3rIyfz2yiN6sXzoXJ1OiV
         /4Tw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fosVB18T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bb36-20020a05622a1b2400b003a67b4572a0si23023845qtb.368.2023.01.19.06.59.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jan 2023 06:59:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fosVB18T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pIWNz-0006nj-Es; Thu, 19 Jan 2023 09:59:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIWNp-0006UW-Nl
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 09:59:19 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIWNo-0003Z2-75
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 09:59:17 -0500
Received: by mail-wr1-x42d.google.com with SMTP id bk16so2114049wrb.11
 for <qemu-arm@nongnu.org>; Thu, 19 Jan 2023 06:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=isWU99zMSOEnAE1RSfFCfmsXaFaInKvayEoBiTZj20E=;
 b=fosVB18TI+mAnXjLHz/fhtdfKY4YsG0SmPU5QXIdFxotLYfXM3HcPD/fhbFo+9ptHF
 JIqmgnTMsbrWyppROk0Ff+Ud3binXAj7VVnmfPrFvbNG0RUimTAbkgn7xqA9jFPzFhps
 +6fRoQcKU5K4nmGU6rvdyS/HatAAeVLmgfjdTrffV8BrbRj2UFOFegGQpuXdumSREyUa
 aYW98a0SdZ4pzU/FOK1ucAGgegKt6nvhiwJTF7BjSqU7hkoMoiZE7LfPH6qXFCOWhJdp
 rhWAYGj724QQcw56CzP57Pz5BUIGd1ozWb2G23IkQEDDZJWy9YiIVd2xNZ5MTHC47wL+
 27pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=isWU99zMSOEnAE1RSfFCfmsXaFaInKvayEoBiTZj20E=;
 b=bwt49QtpAGOfv6kbzkmxCmkZu/DEy5qgUc4co0CnrHJ8tiSlqhrxenx80edp/VWNwQ
 3+ykEmZytWzslG8cwy7fawShMgc6yQPmZZa4dA4Kf/xmghn+ql1DFTRFlloTB7Yfa06A
 fd/cXUxA6lxG4j9kEtv1g/YusIp22l2kmQBqrTQwsRabkMXLL2nvZdcsROGQE82ufbS6
 X0i+IcFB9LTtDBn6LegetYVhxOdueqC/Yy6wXrGVbgyItWbz+v+2KbjmpVGgCL+VeY2W
 2mRXN7H90nKO0SLf1nfIHUxdi5hAM45ppIoUIzhX41uIcEvUKQJoiHA9KHQd55x4dQaS
 D7+Q==
X-Gm-Message-State: AFqh2koc0IZvuzEf5/Q7IfXgms1XmeFmYAMG7xvl98jN45AWESDYXnbJ
 gybg9tNv9m4eRvO7V5jA77TgN3HOuuobBY/5
X-Received: by 2002:a5d:688b:0:b0:2b3:b393:181f with SMTP id
 h11-20020a5d688b000000b002b3b393181fmr9793185wru.56.1674140355207; 
 Thu, 19 Jan 2023 06:59:15 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 l1-20020adfe9c1000000b00289bdda07b7sm33113573wrn.92.2023.01.19.06.59.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Jan 2023 06:59:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 07/11] tests/qtest/migration-test: Build command line using
 GString API (1/4)
Date: Thu, 19 Jan 2023 15:58:34 +0100
Message-Id: <20230119145838.41835-8-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230119145838.41835-1-philmd@linaro.org>
References: <20230119145838.41835-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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
X-TUID: n38jPt/FpmWF

Part 1/4: Convert memory & machine options.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/qtest/migration-test.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 6c3db95113..7aa323a7a7 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -582,6 +582,7 @@ typedef struct {
 static int test_migrate_start(QTestState **from, QTestState **to,
                               const char *uri, MigrateStart *args)
 {
+    g_autoptr(GString) cmd_common = NULL;
     g_autofree gchar *arch_source = NULL;
     g_autofree gchar *arch_target = NULL;
     g_autofree gchar *cmd_target = NULL;
@@ -601,6 +602,9 @@ static int test_migrate_start(QTestState **from, QTestState **to,
     }
 
     got_stop = false;
+
+    cmd_common = g_string_new("");
+
     bootpath = g_strdup_printf("%s/bootsect", tmpfs);
     if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
         /* the assembled x86 boot sector should be exactly one sector large */
@@ -644,6 +648,10 @@ static int test_migrate_start(QTestState **from, QTestState **to,
     } else {
         g_assert_not_reached();
     }
+    if (machine_opts) {
+        g_string_append_printf(cmd_common, " -machine %s ", machine_opts);
+    }
+    g_string_append_printf(cmd_common, "-m %s ", memory_size);
 
     if (!getenv("QTEST_LOG") && args->hide_stderr) {
 #ifdef _WIN32
@@ -674,33 +682,27 @@ static int test_migrate_start(QTestState **from, QTestState **to,
     if (!args->only_target) {
         g_autofree gchar *cmd_source = NULL;
 
-        cmd_source = g_strdup_printf("-accel kvm%s -accel tcg%s%s "
+        cmd_source = g_strdup_printf("-accel kvm%s -accel tcg%s "
                                      "-name source,debug-threads=on "
-                                     "-m %s "
                                      "-serial file:%s/src_serial "
                                      "%s %s %s %s",
                                      args->use_dirty_ring ?
                                      ",dirty-ring-size=4096" : "",
-                                     machine_opts ? " -machine " : "",
-                                     machine_opts ? machine_opts : "",
-                                     memory_size, tmpfs,
+                                     cmd_common->str, tmpfs,
                                      arch_source, shmem_opts,
                                      args->opts_source ? args->opts_source : "",
                                      ignore_stderr);
         *from = qtest_init(cmd_source);
     }
 
-    cmd_target = g_strdup_printf("-accel kvm%s -accel tcg%s%s "
+    cmd_target = g_strdup_printf("-accel kvm%s -accel tcg%s "
                                  "-name target,debug-threads=on "
-                                 "-m %s "
                                  "-serial file:%s/dest_serial "
                                  "-incoming %s "
                                  "%s %s %s %s",
                                  args->use_dirty_ring ?
                                  ",dirty-ring-size=4096" : "",
-                                 machine_opts ? " -machine " : "",
-                                 machine_opts ? machine_opts : "",
-                                 memory_size, tmpfs, uri,
+                                 cmd_common->str, tmpfs, uri,
                                  arch_target, shmem_opts,
                                  args->opts_target ? args->opts_target : "",
                                  ignore_stderr);
-- 
2.38.1

