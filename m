Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp2205000njb;
        Mon, 16 Dec 2024 06:19:07 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVZhuHWThrHG4JtkEzYl2EGqOEr8Y5TM6YdyDnQC4cqs4qE3ubSW48JjwC0Z17HNDOxI+jXjo+mEtvfCw==@linaro.org
X-Received: by 2002:a05:6a00:4285:b0:725:e37d:cd36 with SMTP id d2e1a72fcca58-7290c0e153amr19942782b3a.2.1734358746969;
        Mon, 16 Dec 2024 06:19:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734358746; cv=none;
        d=google.com; s=arc-20240605;
        b=cdSjOmjAY6p4SQiP0HWb03tTKK6qCHEgd2InfQPDZCx9pskufsP6axCJJwBteHCTLH
         /QdDifjaq/Ku9MaB+s1oxKB3WlVyNdRnl088BVWk/foYjnaoIDgV1cg72/47A970xROw
         apBhxNktjj77X7k5s4nAEigbl3Xx2W0wG2KVSwH+VgzLglNS8Kox2sNncr0Rc0qkeeXr
         BqFAYvgoIKjea95vnsDxIquD/mYqkhXIWXBkPDk4nTpCBpdusf7JmdPDbC1MLMOOZvGu
         bGuA5zUnba8JtWoIIj/QKdeGJkryNJEPaubW5VDIY154M5Fz7xrvGcYAjG18c+3gXm9D
         7S1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=+kbeCxXsp2YfolLUVna933Z0x0ot4sPvr4NnCfzB4h0=;
        fh=JXh85XQViC3xbHDMmJfFhj+zqSdeQv9NjWk5IVxjsMA=;
        b=jMwcvQBvT99AQN6KQ7bdEw8MUUU63oJlffBgafbPrFFK85w7LD3NsSw5zASfrHO9gt
         3wxez94b3oVIgfRcWe3N+C390tTSrSBN9LXyl069gtfCgrf8RYzWurD55G2Mh5RBGDU2
         6T9JNGYy5vY4YxadOHly8AxsSPbixdV1n+0hs+bxO2NCRXdzES/jMpl+m+3ddxdLnqcZ
         u4azW1BQlZ5jRCBOo6ySD0fVZMogAmKMku+968tFXQkuvs765jJqkKUBJHcMNUnJfpL7
         Ip61RBnL7X6u6gmmLqFZudWEWWnzyyAKHX4edjHO52I43nToWk9FfXOJXaLEs+RFz9MM
         qMKA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Yx9Etgwo;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-801d593ed36sor2214791a12.0.2024.12.16.06.19.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 16 Dec 2024 06:19:06 -0800 (PST)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Yx9Etgwo;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734358746; x=1734963546; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+kbeCxXsp2YfolLUVna933Z0x0ot4sPvr4NnCfzB4h0=;
        b=Yx9Etgwol5jgEmkDIc+0aoWeavb2x1gpW0Rd1RUzxjPBmjBEWOz25PyOElLCV1Kmzx
         FGIqOx4BNFlESrOC8CT8q7TcRjRNqsOS8c20sL3xSj70wRssMokEBs44pTVn6uGD8gQD
         9xj8jusYD0bD1c7pRe2Uintf1Aq3SHYVibQ/jFNi1KrTolTbBHTQNHkrsV84OYH3nMhw
         wdmET/H9qPKFcoK0y+H6FZlYhZ7v1xrk8i6lXlrwZldSdbKFLxQ7iPNknwxpn4aHfAuz
         K/yt7wA7BbuC24TK9LT4OHkVCbP6gAcuXI2CWCf4kBp6SsVJlI6MsDyLBOSiBV7issz1
         Jv9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734358746; x=1734963546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+kbeCxXsp2YfolLUVna933Z0x0ot4sPvr4NnCfzB4h0=;
        b=Fbfh7Dlg8yeNjrayeYnzfMSKIRPf48XH7DqLE2xD/KduRN2o4KJeiXwQIHcio2Qfiu
         e+G12EQCw9jb6mjMWAzK02lxDPDKVe6VE+E1uUnZDM/+pW88+Bxdh4ne3E+AiNufxExd
         Y0GIcpCvgHxFwe+kIyjs2H/gfcrtB/v8TmJdfyCpRy9M8dSHxkz+X47Dx3fQDe/Fwrx+
         Itrjicq64y3dvkOVBaTxO/sZvklKTC5P5q7dG4pmY9ze97HMssVtfnpB5FAnxlv9afCG
         qWsgzh6KUGtAsQ5af+1NHlzYrpO93oUL9eX6mYYCNzMMhVxjbio/OM0f0pUb7/hAOat/
         u6ow==
X-Forwarded-Encrypted: i=1; AJvYcCX5tpS7qeu320Z8bqYHjL72ViZeP4McVaV80aF53EspQ5qo4We7/5SttTngqImH09HHUYD31hKPW5QvkA==@linaro.org
X-Gm-Message-State: AOJu0YyNbEzqGE1TLcvkam1bStckKd0jWP0yrvSAAdxVEC1K0Zyg5NWX
	hWlKdYX++d3v7Pcp++NHEfU8AjFZvtujS3AVvhZ+yZeRrLXJ/o54ThU7sx3cTg7kGA==
X-Gm-Gg: ASbGncuiRqL7E/4UNbQlYn6UqLFd/LbdX9sZxIRKv+P9nyx+4Rx2u3I73iUmeAKpFzH
	rJVtINw6mwI1kU1jeYMXbWehZDCty/m4iLmH5uM4arUWKBkpq8fAAjJQLwJHt/oKdF/SK3bDSfi
	JPC7L+4mpMzKj55yedTEAYA1SC4hWaoeFsWcnj5TggDa5dbna+oPgg8jbXzkOzMcRCA6abjkr/l
	d84/0yaviCbXcB2ye6CFCaFHaJ/JZb9Mi3Q27Cl65IPvzowQ3eG0bwzPruK/98=
X-Google-Smtp-Source: AGHT+IE1Y03JFJtLtujYIY034aFgO+B6A64qf2TGdWFj2UivboS+OXCawj+omYooIRMBTdfmyAcAgw==
X-Received: by 2002:a05:6a21:8905:b0:1e2:2e4:6b2a with SMTP id adf61e73a8af0-1e202e4efa4mr9206859637.5.1734358746447;
        Mon, 16 Dec 2024 06:19:06 -0800 (PST)
Return-Path: <gustavo.romero@linaro.org>
Received: from gromero0.. ([177.189.100.90])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918bad8acsm4948815b3a.146.2024.12.16.06.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 06:19:05 -0800 (PST)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	philmd@linaro.org,
	alex.bennee@linaro.org,
	thuth@redhat.com,
	armbru@redhat.com
Cc: gustavo.romero@linaro.org
Subject: [PATCH v3 5/7] tests/qtest: Reorganize common code in ivshmem-test
Date: Mon, 16 Dec 2024 14:18:16 +0000
Message-Id: <20241216141818.111255-6-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241216141818.111255-1-gustavo.romero@linaro.org>
References: <20241216141818.111255-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: GXt6pBEaRApW

This commit reorganizes the ivshmem-test qtest by moving common structs,
functions, and code that can be utilized by other ivshmem qtests into
two new files: ivshmem-utils.h and ivshmem-utils.c.

Enum Reg, struct ServerThread, and mktempshm() have been relocated to
these new files. Two new functions have been introduced to handle the
ivshmem server start/stop: test_ivshmem_server_{start,stop}.

To accommodate the new way for starting/stopping the ivshmem server,
struct ServerThread now includes two new members: 'server', previously
present but not a member of any struct; and 'status', a new member of a
new type, ServerStartStatus, used to track and handle service
termination properly.

Additionally, a new function, mktempsocket(), has been added to help
create a unix socket filename, similar to what mktempshm() does for the
creation of a shm file.

Finally, the ivshmem-test qtest has been adapted to use the new ivhsmem
utils. Adjustments in that sense have also been made to meson.build;
also 'rt' have been removed as a lib dependency for ivhsmem-test.c.

Two lines unrelated to these changes have had their line indentation
also fixed in meson.build.

Message-ID: <20231127052024.435743-3-gustavo.romero@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 tests/qtest/ivshmem-test.c  | 113 ++------------------------
 tests/qtest/ivshmem-utils.c | 156 ++++++++++++++++++++++++++++++++++++
 tests/qtest/ivshmem-utils.h |  56 +++++++++++++
 tests/qtest/meson.build     |   4 +-
 4 files changed, 221 insertions(+), 108 deletions(-)
 create mode 100644 tests/qtest/ivshmem-utils.c
 create mode 100644 tests/qtest/ivshmem-utils.h

diff --git a/tests/qtest/ivshmem-test.c b/tests/qtest/ivshmem-test.c
index fb45fdeb07..d4443b46f2 100644
--- a/tests/qtest/ivshmem-test.c
+++ b/tests/qtest/ivshmem-test.c
@@ -3,17 +3,17 @@
  *
  * Copyright (c) 2014 SUSE LINUX Products GmbH
  * Copyright (c) 2015 Red Hat, Inc.
+ * Copyright (c) 2023 Linaro Ltd.
  *
  * This work is licensed under the terms of the GNU GPL, version 2 or later.
  * See the COPYING file in the top-level directory.
  */
 
-#include "qemu/osdep.h"
-#include <glib/gstdio.h>
-#include "contrib/ivshmem-server/ivshmem-server.h"
+#include "ivshmem-utils.h"
 #include "libqos/libqos-pc.h"
 #include "libqos/libqos-spapr.h"
-#include "libqtest.h"
+
+static ServerThread thread;
 
 #define TMPSHMSIZE (1 << 20)
 static char *tmpshm;
@@ -45,13 +45,6 @@ typedef struct _IVState {
     QPCIDevice *dev;
 } IVState;
 
-enum Reg {
-    INTRMASK = 0,
-    INTRSTATUS = 4,
-    IVPOSITION = 8,
-    DOORBELL = 12,
-};
-
 static const char* reg2str(enum Reg reg) {
     switch (reg) {
     case INTRMASK:
@@ -241,54 +234,6 @@ static void test_ivshmem_pair(void)
     g_free(data);
 }
 
-typedef struct ServerThread {
-    GThread *thread;
-    IvshmemServer *server;
-    int pipe[2]; /* to handle quit */
-} ServerThread;
-
-static void *server_thread(void *data)
-{
-    ServerThread *t = data;
-    IvshmemServer *server = t->server;
-
-    while (true) {
-        fd_set fds;
-        int maxfd, ret;
-
-        FD_ZERO(&fds);
-        FD_SET(t->pipe[0], &fds);
-        maxfd = t->pipe[0] + 1;
-
-        ivshmem_server_get_fds(server, &fds, &maxfd);
-
-        ret = select(maxfd, &fds, NULL, NULL, NULL);
-
-        if (ret < 0) {
-            if (errno == EINTR) {
-                continue;
-            }
-
-            g_critical("select error: %s\n", strerror(errno));
-            break;
-        }
-        if (ret == 0) {
-            continue;
-        }
-
-        if (FD_ISSET(t->pipe[0], &fds)) {
-            break;
-        }
-
-        if (ivshmem_server_handle_fds(server, &fds, maxfd) < 0) {
-            g_critical("ivshmem_server_handle_fds() failed\n");
-            break;
-        }
-    }
-
-    return NULL;
-}
-
 static void setup_vm_with_server(IVState *s, int nvectors)
 {
     char *cmd;
@@ -304,27 +249,12 @@ static void setup_vm_with_server(IVState *s, int nvectors)
 
 static void test_ivshmem_server(void)
 {
-    g_autoptr(GError) err = NULL;
     IVState state1, state2, *s1, *s2;
-    ServerThread thread;
-    IvshmemServer server;
     int ret, vm1, vm2;
     int nvectors = 2;
     guint64 end_time = g_get_monotonic_time() + 5 * G_TIME_SPAN_SECOND;
 
-    ret = ivshmem_server_init(&server, tmpserver, tmpshm, true,
-                              TMPSHMSIZE, nvectors,
-                              g_test_verbose());
-    g_assert_cmpint(ret, ==, 0);
-
-    ret = ivshmem_server_start(&server);
-    g_assert_cmpint(ret, ==, 0);
-
-    thread.server = &server;
-    g_unix_open_pipe(thread.pipe, FD_CLOEXEC, &err);
-    g_assert_no_error(err);
-    thread.thread = g_thread_new("ivshmem-server", server_thread, &thread);
-    g_assert(thread.thread != NULL);
+    test_ivshmem_server_start(&thread, tmpserver, tmpshm, nvectors);
 
     setup_vm_with_server(&state1, nvectors);
     s1 = &state1;
@@ -367,15 +297,7 @@ static void test_ivshmem_server(void)
     cleanup_vm(s2);
     cleanup_vm(s1);
 
-    if (qemu_write_full(thread.pipe[1], "q", 1) != 1) {
-        g_error("qemu_write_full: %s", g_strerror(errno));
-    }
-
-    g_thread_join(thread.thread);
-
-    ivshmem_server_close(&server);
-    close(thread.pipe[1]);
-    close(thread.pipe[0]);
+    test_ivshmem_server_stop(&thread);
 }
 
 static void test_ivshmem_hotplug_q35(void)
@@ -454,31 +376,10 @@ static void cleanup(void)
 
 static void abrt_handler(void *data)
 {
+    test_ivshmem_server_stop(&thread);
     cleanup();
 }
 
-static gchar *mktempshm(int size, int *fd)
-{
-    while (true) {
-        gchar *name;
-
-        name = g_strdup_printf("/qtest-%u-%u", getpid(), g_test_rand_int());
-        *fd = shm_open(name, O_CREAT|O_RDWR|O_EXCL,
-                       S_IRWXU|S_IRWXG|S_IRWXO);
-        if (*fd > 0) {
-            g_assert(ftruncate(*fd, size) == 0);
-            return name;
-        }
-
-        g_free(name);
-
-        if (errno != EEXIST) {
-            perror("shm_open");
-            return NULL;
-        }
-    }
-}
-
 int main(int argc, char **argv)
 {
     int ret, fd;
diff --git a/tests/qtest/ivshmem-utils.c b/tests/qtest/ivshmem-utils.c
new file mode 100644
index 0000000000..c2fc3463dd
--- /dev/null
+++ b/tests/qtest/ivshmem-utils.c
@@ -0,0 +1,156 @@
+/*
+ * Common utilities for testing ivshmem devices
+ *
+ * SPDX-FileCopyrightText: 2012 SUSE LINUX Products GmbH
+ * SPDX-FileCopyrightText: 2021 Red Hat, Inc.
+ * SPDX-FileCopyrightText: 2023 Linaro Ltd.
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ */
+
+#include "ivshmem-utils.h"
+
+gchar *mktempshm(int size, int *fd)
+{
+    while (true) {
+        /* Relative path to the shm filesystem, e.g. '/dev/shm'. */
+        gchar *shm_rel_path;
+
+        shm_rel_path = g_strdup_printf("/ivshmem_qtest-%u-%u", getpid(),
+                                       g_test_rand_int());
+        *fd = shm_open(shm_rel_path, O_CREAT | O_RDWR | O_EXCL,
+                       S_IRWXU | S_IRWXG | S_IRWXO);
+        if (*fd > 0) {
+            g_assert(ftruncate(*fd, size) == 0);
+            return shm_rel_path;
+        }
+
+        g_free(shm_rel_path);
+
+        if (errno != EEXIST) {
+            perror("shm_open");
+            return NULL;
+        }
+    }
+}
+
+gchar *mktempsocket(void)
+{
+    gchar *server_socket_path;
+
+    server_socket_path = g_strdup_printf("%s/ivshmem_socket_qtest-%u-%u",
+                                         g_get_tmp_dir(), getpid(),
+                                         g_test_rand_int());
+    return server_socket_path;
+}
+
+static void *server_thread(void *data)
+{
+    ServerThread *t = data;
+    IvshmemServer *server = &t->server;
+
+    while (true) {
+        fd_set fds;
+        int maxfd, ret;
+
+        FD_ZERO(&fds);
+        FD_SET(t->pipe[0], &fds);
+        maxfd = t->pipe[0] + 1;
+
+        ivshmem_server_get_fds(server, &fds, &maxfd);
+
+        ret = select(maxfd, &fds, NULL, NULL, NULL);
+
+        if (ret < 0) {
+            if (errno == EINTR) {
+                continue;
+            }
+
+            g_critical("select error: %s\n", strerror(errno));
+            break;
+        }
+        if (ret == 0) {
+            continue;
+        }
+
+        if (FD_ISSET(t->pipe[0], &fds)) {
+            break;
+        }
+
+        if (ivshmem_server_handle_fds(server, &fds, maxfd) < 0) {
+            g_critical("ivshmem_server_handle_fds() failed\n");
+            break;
+        }
+    }
+
+    return NULL;
+}
+
+void test_ivshmem_server_start(ServerThread *thread,
+                               const char *server_socket_path,
+                               const char *shm_rel_path, unsigned num_vectors)
+{
+    g_autoptr(GError) err = NULL;
+    int ret;
+    struct stat shm_st;
+    char *shm_path;
+
+    g_assert(thread != NULL);
+    g_assert(server_socket_path != NULL);
+    g_assert_cmpint(num_vectors, >, 0);
+    g_assert(shm_rel_path != NULL);
+
+    /*
+     * Find out shm size. shm_open() deals with relative paths but stat() needs
+     * the full path to the shm file.
+     */
+    shm_path = g_strdup_printf("/dev/shm%s", shm_rel_path);
+    ret = stat(shm_path, &shm_st);
+    g_assert_cmpint(ret, ==, 0);
+    g_assert_cmpint(shm_st.st_size, >, 0);
+
+    ret = ivshmem_server_init(&thread->server, server_socket_path, shm_rel_path,
+    true, shm_st.st_size, num_vectors, g_test_verbose());
+    g_assert_cmpint(ret, ==, 0);
+    ret = ivshmem_server_start(&thread->server);
+    g_assert_cmpint(ret, ==, 0);
+    thread->status = SERVER;
+
+    g_unix_open_pipe(thread->pipe, FD_CLOEXEC, &err);
+    g_assert_no_error(err);
+    thread->status |= PIPE;
+
+    thread->thread = g_thread_new("ivshmem-server", server_thread, thread);
+    g_assert(thread->thread != NULL);
+    thread->status |= THREAD;
+}
+
+void test_ivshmem_server_stop(ServerThread *thread)
+{
+    /*
+     * This function can be called any time on a test error/abort (e.g., it can
+     * be called from the abort handler), including from the
+     * test_ivshmem_server_start(). Therefore, the start steps (server started,
+     * pipe created, and thread created) are tracked when the server starts and
+     * then checked below accordingly for proper termination.
+     */
+
+    if (thread->status & THREAD) {
+        /* Ask to exit from thread. */
+        if (qemu_write_full(thread->pipe[1], "q", 1) != 1) {
+            g_error("qemu_write_full: %s", g_strerror(errno));
+        }
+
+        /* Wait thread to exit. */
+        g_thread_join(thread->thread);
+     }
+
+    if (thread->status & PIPE)  {
+        close(thread->pipe[1]);
+        close(thread->pipe[0]);
+    }
+
+    if (thread->status & SERVER) {
+        ivshmem_server_close(&thread->server);
+    }
+}
diff --git a/tests/qtest/ivshmem-utils.h b/tests/qtest/ivshmem-utils.h
new file mode 100644
index 0000000000..c43661caac
--- /dev/null
+++ b/tests/qtest/ivshmem-utils.h
@@ -0,0 +1,56 @@
+/*
+ * Common utilities for testing ivshmem devices
+ *
+ * SPDX-FileCopyrightText: 2012 SUSE LINUX Products GmbH
+ * SPDX-FileCopyrightText: 2021 Red Hat, Inc.
+ * SPDX-FileCopyrightText: 2023 Linaro Ltd.
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ */
+
+#ifndef QTEST_IVSHMEM_UTILS_H
+#define QTEST_IVSHMEM_UTILS_H
+
+#include "qemu/osdep.h"
+#include <glib/gstdio.h>
+#include "contrib/ivshmem-server/ivshmem-server.h"
+#include "libqtest.h"
+
+enum Reg {
+    INTRMASK = 0,
+    INTRSTATUS = 4,
+    IVPOSITION = 8,
+    DOORBELL = 12,
+};
+
+enum ServerStartStatus {
+    SERVER = 1, /* Ivshmem server started */
+    THREAD = 2, /* Thread for monitoring fds created */
+    PIPE = 4,   /* Pipe created */
+};
+
+typedef struct ServerThread {
+    GThread *thread;
+    IvshmemServer server;
+    /*
+     * Pipe is used to communicate with the thread, asking it to terminate on
+     * receiving 'q'.
+     */
+    int pipe[2];
+    /*
+     * Server statuses are used to keep track of thread/server/pipe start since
+     * test_ivshmem_server_stop can be called at any time on a test error,
+     * even from test_ivshmem_server_start itself, therefore, they are used for
+     * proper service termination.
+     */
+    enum ServerStartStatus status;
+} ServerThread;
+
+gchar *mktempshm(int size, int *fd);
+gchar *mktempsocket(void);
+void test_ivshmem_server_start(ServerThread *thread,
+                               const char *server_socket_path,
+                               const char *shm_rel_path, unsigned num_vectors);
+void test_ivshmem_server_stop(ServerThread *thread);
+
+#endif /* QTEST_IVSHMEM_UTILS_H */
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index c5a70021c5..bf1fd12a9e 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -71,7 +71,7 @@ qtests_i386 = \
   (config_all_devices.has_key('CONFIG_PVPANIC_ISA') ? ['pvpanic-test'] : []) +              \
   (config_all_devices.has_key('CONFIG_PVPANIC_PCI') ? ['pvpanic-pci-test'] : []) +          \
   (config_all_devices.has_key('CONFIG_HDA') ? ['intel-hda-test'] : []) +                    \
-  (config_all_devices.has_key('CONFIG_I82801B11') ? ['i82801b11-test'] : []) +             \
+  (config_all_devices.has_key('CONFIG_I82801B11') ? ['i82801b11-test'] : []) +              \
   (config_all_devices.has_key('CONFIG_IOH3420') ? ['ioh3420-test'] : []) +                  \
   (config_all_devices.has_key('CONFIG_LPC_ICH9') ? ['lpc-ich9-test'] : []) +              \
   (config_all_devices.has_key('CONFIG_MC146818RTC') ? ['rtc-test'] : []) +                  \
@@ -361,7 +361,7 @@ qtests = {
   'dbus-vmstate-test': files('migration/migration-qmp.c',
                              'migration/migration-util.c') + dbus_vmstate1,
   'erst-test': files('erst-test.c'),
-  'ivshmem-test': [rt, '../../contrib/ivshmem-server/ivshmem-server.c'],
+  'ivshmem-test': ['ivshmem-utils.c', '../../contrib/ivshmem-server/ivshmem-server.c'],
   'migration-test': migration_files + migration_tls_files,
   'pxe-test': files('boot-sector.c'),
   'pnv-xive2-test': files('pnv-xive2-common.c', 'pnv-xive2-flush-sync.c'),
-- 
2.34.1
