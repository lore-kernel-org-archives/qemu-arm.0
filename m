Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D8F7C624C6
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Mar 2026 09:25:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vwzUA-0001OQ-FT; Mon, 02 Mar 2026 04:22:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vwzU8-0001M1-UF
 for qemu-arm@nongnu.org; Mon, 02 Mar 2026 04:22:40 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vwzU7-0007jA-6e
 for qemu-arm@nongnu.org; Mon, 02 Mar 2026 04:22:40 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-483abed83b6so34039555e9.0
 for <qemu-arm@nongnu.org>; Mon, 02 Mar 2026 01:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772443357; x=1773048157; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xPzZvA7hCzZLz+L4Z4vE/U1LgCbyw+GynXi7hkQL8S8=;
 b=b+5IpLzJDDrkb9O9NCKv+kz+QINY2QQVzI2ff79+OFdsH8eP5eA8z7+3ueBQPuV2Th
 wFaM3slG6i2M0O3p37q086MaFWrDx1S9wXFnpc5fhiMnUUi5EEqVr9AzFSyyKBAd/j8W
 +CYAB6cW/kl3+itrq64p2ZGGhKRGklLu97Yg8pOxZnV3YnkDb+kltojSkFl+7cYpn/8c
 9Zc6/j2VybtaEYzR4ew9Rf5rb22PohdNLCDNWCb5UfSMVPzRuP4jN8MtVi/ISKXS6uXO
 rvz7jNWAL6S1Ni8YBeIYHLYjPFwSZZ/vyN6MUN/1V5KN+ZUhZs/TZSev8uEAhrFYLkmt
 34rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772443357; x=1773048157;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xPzZvA7hCzZLz+L4Z4vE/U1LgCbyw+GynXi7hkQL8S8=;
 b=ZuMHUueXjajez/VVWmZmISNKmJ3HUmtlUjOriDld0NnFF4xGa+1385XsOLXOhHwH0N
 AycivxB4pE/qto1F9NkzcZZrfSI42EVC/8WX04ywwvDHS8DZ4X4hkjOR7k2yiUr9wPs6
 eX2Rb66fFZlmNzQ5KzPMu9jpSbiH9rCdhptAo66dSL59sDd1mepZybIYxoJarqzzeYV6
 DSsET0VZK9vnnlwKDi+EpSluYz+A6e9vCeno6HPhv4NTPOOlVrFGlVeXE+f+CFK5T6Fy
 I24g3bdoVMJXqSykkmgfxVZVNiNLmDviTASXUVnJwynvKkZTTYN4/EHewC2MgDyJf36u
 R4KA==
X-Gm-Message-State: AOJu0YxnpHFtZ5JcBrI+P9Cf8Ww9YZLFyasJdn03Xx1L5HVTq8JEIarj
 m5Ee5R+PJ7Kit1XIMk37m3He280ddTJU+UDvhYLmGGjblZzVPLbFQ92gXfcwx3FtncuJgu90vrG
 V+NTB
X-Gm-Gg: ATEYQzwrf2vewFAzYxB0Vlu6ATQtPScpZp7FzhS6yrmlaI7g7Ol7J5FcLEfujfSWGd3
 MYWUVgYXhEuZkVDW0KoHbyWcC+sroJfNEP/oy2mEsHB0jE6zJVDGWlfusVP0G1+d6ePlWYNMZp+
 NwyzInZAdCQNLLVjeSGBV4LbmIDQXAvxGv09+4vIFPPcCcSjAk7UAoT94Fhf7/1cwbcxvpXnjuI
 GPPmu1Z6WlBgh/asMMX6qUiCK4Cj/ZDwTQvwdVJ6+WIfGl3oCHG89WHlanZY5sbTvsi1P9rP664
 9gS9LEJbddCXooINDIIIHwZmhLpn++3Gzuw0vjE4ro6nNPh1M7ZiP7prINBRPb3hEThYNSuMbqk
 DkkAqQA8E7x/qOMwFUJ26TzhsM2W2INdmF53iBhiyv24pV5dLCObmcqcgZRAN0Ko454IeOThODF
 6k/FtYjumNK68uRJeEC7t4z2JUNkjlJnSwVvP2T6Zq0sDdS9zB3nItvwBm2zqCTXu3jk+/1EAe9
 9odb+X8JJSJeBfqINUwC2Rd7ZQpnBk=
X-Received: by 2002:a05:600c:3486:b0:480:1e40:3d2 with SMTP id
 5b1f17b1804b1-483c9bedadcmr202855155e9.29.1772443357479; 
 Mon, 02 Mar 2026 01:22:37 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bfb9d9c6sm129435305e9.14.2026.03.02.01.22.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2026 01:22:36 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Fabiano Rosas <farosas@suse.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Yodel Eldar <yodel.eldar@yodel.dev>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v2 9/9] tests/qtest/qos-test: Plug a couple of leaks
Date: Mon,  2 Mar 2026 09:22:25 +0000
Message-ID: <20260302092225.4088227-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260302092225.4088227-1-peter.maydell@linaro.org>
References: <20260302092225.4088227-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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

From: Fabiano Rosas <farosas@suse.de>

The walk_path() function of qos-test.c, which walks the graph and adds
tests to the test suite uses GLib's g_test_add_data_func_full()
function:

g_test_add_data_func_full (const char     *testpath,
                           gpointer        test_data,
                           GTestDataFunc   test_func,
                           GDestroyNotify  data_free_func)

Despite GLib's documentation stating that @data_free_func is a
destructor for @test_data, this is not the case. The destructor is
supposed to be paired with a constructor, which GLib only accepts via
g_test_create_case().

Providing externally allocated data plus a destructor function only
works if the test is guaranteed to execute, otherwise the test_data is
never deallocated.

Due to how subprocessess are implemented in qos-test, each test gets
added twice and an extra test gets added per subprocess. In a regular
run, the extra subprocess will not be executed and in a single test
run (-p), none of the other tests will be executed (+1 per
subprocess), leaking 'path_vec' and 'subprocess_path'.

Fix this by storing all the path vectors in a list and freeing them
all at the end of the program (including subprocess invocations) and
moving the allocation of 'subprocess_path' into run_one_subprocess().

While here add some documentation explaining why the graph needs to be
walked twice and tests re-added.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
[PMM: rebased; rewrote the comment in main() a bit to account
 for the if (g_test_subprocess()) block it was previously inside
 no longer being present. ]
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/qtest/qos-test.c | 36 ++++++++++++++++++++++++++----------
 1 file changed, 26 insertions(+), 10 deletions(-)

diff --git a/tests/qtest/qos-test.c b/tests/qtest/qos-test.c
index 00f39f33f6..50fa0ceef3 100644
--- a/tests/qtest/qos-test.c
+++ b/tests/qtest/qos-test.c
@@ -31,6 +31,7 @@
 #include "libqos/qos_external.h"
 
 static char *old_path;
+static GSList *path_vecs;
 
 
 /**
@@ -182,11 +183,16 @@ static void run_one_test(const void *arg)
 
 static void subprocess_run_one_test(const void *arg)
 {
-    const gchar *path = arg;
-    g_test_trap_subprocess(path, 180 * G_USEC_PER_SEC,
+    char **path_vec = (char **) arg;
+    gchar *path = g_strjoinv("/", path_vec + 1);
+    gchar *subprocess_path = g_strdup_printf("/%s/subprocess", path);
+
+    g_test_trap_subprocess(subprocess_path, 180 * G_USEC_PER_SEC,
                            G_TEST_SUBPROCESS_INHERIT_STDOUT |
                            G_TEST_SUBPROCESS_INHERIT_STDERR);
     g_test_trap_assert_passed();
+    g_free(path);
+    g_free(subprocess_path);
 }
 
 static void destroy_pathv(void *arg)
@@ -238,6 +244,7 @@ static void walk_path(QOSGraphNode *orig_path, int len)
     GString *cmd_line = g_string_new("");
     GString *cmd_line2 = g_string_new("");
 
+    path_vecs = g_slist_append(path_vecs, path_vec);
     path = qos_graph_get_node(node_name); /* root */
     node_name = qos_graph_edge_get_dest(path->path_edge); /* machine name */
 
@@ -297,15 +304,15 @@ static void walk_path(QOSGraphNode *orig_path, int len)
     path_vec[0] = g_string_free(cmd_line, false);
 
     if (path->u.test.subprocess) {
-        gchar *subprocess_path = g_strdup_printf("/%s/%s/subprocess",
-                                                 qtest_get_arch(), path_str);
-        qtest_add_data_func_full(path_str, subprocess_path,
-                                 subprocess_run_one_test, g_free);
-        g_test_add_data_func_full(subprocess_path, path_vec,
-                                  run_one_test, destroy_pathv);
+        gchar *subprocess_path = g_strdup_printf("%s/%s", path_str,
+                                                 "subprocess");
+
+        qtest_add_data_func(path_str, path_vec, subprocess_run_one_test);
+        qtest_add_data_func(subprocess_path, path_vec, run_one_test);
+
+        g_free(subprocess_path);
     } else {
-        qtest_add_data_func_full(path_str, path_vec,
-                                 run_one_test, destroy_pathv);
+        qtest_add_data_func(path_str, path_vec, run_one_test);
     }
 
     g_free(path_str);
@@ -340,6 +347,14 @@ int main(int argc, char **argv, char** envp)
     module_call_init(MODULE_INIT_LIBQOS);
     qos_set_machines_devices_available();
 
+    /*
+     * Even if this invocation was done to run a single test in a
+     * subprocess (i.e. g_test_subprocess() is true), gtester doesn't
+     * expose the test name, so w still need to execute the whole
+     * thing as normal, including walking the QOS graph to add all
+     * the tests, in order for g_test_run() to find the one /subprocess
+     * test that it is going to execute.
+     */
     qos_graph_foreach_test_path(walk_path);
     if (g_test_verbose()) {
         qos_dump_graph();
@@ -348,5 +363,6 @@ int main(int argc, char **argv, char** envp)
     qtest_end();
     qos_graph_destroy();
     g_free(old_path);
+    g_slist_free_full(path_vecs, (GDestroyNotify)destroy_pathv);
     return 0;
 }
-- 
2.43.0


