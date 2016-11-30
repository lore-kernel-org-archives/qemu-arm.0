Received: by 10.25.159.131 with SMTP id i125csp115277lfe;
        Tue, 29 Nov 2016 21:42:32 -0800 (PST)
X-Received: by 10.55.27.141 with SMTP id m13mr31801042qkh.28.1480484552165;
        Tue, 29 Nov 2016 21:42:32 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n19si22707352qtf.176.2016.11.29.21.42.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Nov 2016 21:42:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41029 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cBxf5-00044L-Fj
	for alex.bennee@linaro.org; Wed, 30 Nov 2016 00:42:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44826)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alastair@au1.ibm.com>) id 1cBxZv-0000QG-9M
	for qemu-devel@nongnu.org; Wed, 30 Nov 2016 00:37:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alastair@au1.ibm.com>) id 1cBxZs-0005KL-2D
	for qemu-devel@nongnu.org; Wed, 30 Nov 2016 00:37:11 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:55000)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alastair@au1.ibm.com>)
	id 1cBxZr-0005Jp-P6
	for qemu-devel@nongnu.org; Wed, 30 Nov 2016 00:37:08 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
	uAU5Y56D032866
	for <qemu-devel@nongnu.org>; Wed, 30 Nov 2016 00:37:06 -0500
Received: from e23smtp09.au.ibm.com (e23smtp09.au.ibm.com [202.81.31.142])
	by mx0a-001b2d01.pphosted.com with ESMTP id 271r8j2h7f-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <qemu-devel@nongnu.org>; Wed, 30 Nov 2016 00:37:06 -0500
Received: from localhost
	by e23smtp09.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-devel@nongnu.org> from <alastair@au1.ibm.com>;
	Wed, 30 Nov 2016 15:37:04 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
	by e23smtp09.au.ibm.com (202.81.31.206) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Wed, 30 Nov 2016 15:37:03 +1000
Received: from d23relay06.au.ibm.com (d23relay06.au.ibm.com [9.185.63.219])
	by d23dlp03.au.ibm.com (Postfix) with ESMTP id 670C23578060;
	Wed, 30 Nov 2016 16:37:02 +1100 (EST)
Received: from d23av03.au.ibm.com (d23av03.au.ibm.com [9.190.234.97])
	by d23relay06.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	uAU5b29Q39059532; Wed, 30 Nov 2016 16:37:02 +1100
Received: from d23av03.au.ibm.com (localhost [127.0.0.1])
	by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
	uAU5b1qb027188; Wed, 30 Nov 2016 16:37:02 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
	by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	uAU5b10b027185; Wed, 30 Nov 2016 16:37:01 +1100
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 07970A0306;
	Wed, 30 Nov 2016 16:37:01 +1100 (AEDT)
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: qemu-arm@nongnu.org
Date: Wed, 30 Nov 2016 16:36:26 +1100
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20161130053629.23340-1-alastair@au1.ibm.com>
References: <20161130053629.23340-1-alastair@au1.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16113005-0052-0000-0000-000001F68D70
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16113005-0053-0000-0000-000007544545
Message-Id: <20161130053629.23340-4-alastair@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-11-30_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	spamscore=0 suspectscore=3
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
	definitions=main-1611300092
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.156.1
Subject: [Qemu-devel] [PATCH v2 3/6] qtest: Support named interrupts
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
	qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>,
	Alastair D'Silva <alastair@d-silva.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6yslHIa7MoMI

From: Alastair D'Silva <alastair@d-silva.org>

The QTest framework cannot work with named interrupts. This patch
adds support for them, as well as the ability to manipulate them
from within a test.

Read actions are via callbacks, which allows for pulsed interrupts
to be read (the polled method used for the unnamed interrupts
cannot read pulsed interrupts as the value is reverted before the
test sees the changes).

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 hw/core/irq.c    |  17 +++++-----
 include/hw/irq.h |  12 +++++--
 qtest.c          | 102 ++++++++++++++++++++++++++++++++++++++++++-------------
 tests/libqtest.c |  87 ++++++++++++++++++++++++++++++++++++++++++++---
 tests/libqtest.h |  59 ++++++++++++++++++++++++++++++++
 5 files changed, 238 insertions(+), 39 deletions(-)

diff --git a/hw/core/irq.c b/hw/core/irq.c
index 49ff2e6..6b0e694 100644
--- a/hw/core/irq.c
+++ b/hw/core/irq.c
@@ -134,15 +134,16 @@ qemu_irq *qemu_irq_proxy(qemu_irq **target, int n)
     return qemu_allocate_irqs(proxy_irq_handler, target, n);
 }
 
-void qemu_irq_intercept_in(qemu_irq *gpio_in, qemu_irq_handler handler, int n)
+qemu_irq qemu_irq_dup(qemu_irq in)
 {
-    int i;
-    qemu_irq *old_irqs = qemu_allocate_irqs(NULL, NULL, n);
-    for (i = 0; i < n; i++) {
-        *old_irqs[i] = *gpio_in[i];
-        gpio_in[i]->handler = handler;
-        gpio_in[i]->opaque = &old_irqs[i];
-    }
+    qemu_irq out = qemu_allocate_irq(in->handler, in->opaque, in->n);
+    return out;
+}
+
+void qemu_irq_intercept_in(qemu_irq gpio_in, qemu_irq_handler handler, void *opaque)
+{
+    gpio_in->handler = handler;
+    gpio_in->opaque = opaque;
 }
 
 static const TypeInfo irq_type_info = {
diff --git a/include/hw/irq.h b/include/hw/irq.h
index 4c4c2ea..86d1d1e 100644
--- a/include/hw/irq.h
+++ b/include/hw/irq.h
@@ -58,8 +58,14 @@ qemu_irq qemu_irq_split(qemu_irq irq1, qemu_irq irq2);
  */
 qemu_irq *qemu_irq_proxy(qemu_irq **target, int n);
 
-/* For internal use in qtest.  Similar to qemu_irq_split, but operating
-   on an existing vector of qemu_irq.  */
-void qemu_irq_intercept_in(qemu_irq *gpio_in, qemu_irq_handler handler, int n);
+/**
+ * Duplicate an IRQ
+ * @param in the IRQ to deplicate
+ * @return a copy of the IRQ
+ */
+qemu_irq qemu_irq_dup(qemu_irq in);
+
+/* For internal use in qtest. */
+void qemu_irq_intercept_in(qemu_irq gpio_in, qemu_irq_handler handler, void *opaque);
 
 #endif
diff --git a/qtest.c b/qtest.c
index 46b99ae..2e09634 100644
--- a/qtest.c
+++ b/qtest.c
@@ -40,7 +40,6 @@ static DeviceState *irq_intercept_dev;
 static FILE *qtest_log_fp;
 static CharBackend qtest_chr;
 static GString *inbuf;
-static int irq_levels[MAX_IRQ];
 static qemu_timeval start_time;
 static bool qtest_opened;
 
@@ -160,10 +159,16 @@ static bool qtest_opened;
  *
  *  IRQ raise NUM
  *  IRQ lower NUM
+ *  IRQ_NAMED NAME NUM LEVEL
  *
  * where NUM is an IRQ number.  For the PC, interrupts can be intercepted
  * simply with "irq_intercept_in ioapic" (note that IRQ0 comes out with
  * NUM=0 even though it is remapped to GSI 2).
+ *
+ *  > irq_set NAME NUM LEVEL
+ *  < OK
+ *
+ *  Set the named input IRQ to the level (0/1)
  */
 
 static int hex2nib(char ch)
@@ -243,17 +248,31 @@ static void GCC_FMT_ATTR(2, 3) qtest_sendf(CharBackend *chr,
     va_end(ap);
 }
 
+typedef struct qtest_irq {
+    qemu_irq old_irq;
+    char *name;
+    bool last_level;
+} qtest_irq;
+
 static void qtest_irq_handler(void *opaque, int n, int level)
 {
-    qemu_irq old_irq = *(qemu_irq *)opaque;
-    qemu_set_irq(old_irq, level);
+    qtest_irq *data = (qtest_irq *)opaque;
+    level = !!level;
+
+    qemu_set_irq(data->old_irq, level);
 
-    if (irq_levels[n] != level) {
+    if (level != data->last_level) {
         CharBackend *chr = &qtest_chr;
-        irq_levels[n] = level;
         qtest_send_prefix(chr);
-        qtest_sendf(chr, "IRQ %s %d\n",
-                    level ? "raise" : "lower", n);
+
+        if (data->name) {
+            qtest_sendf(chr, "IRQ_NAMED %s %d %d\n",
+                    data->name, n, level);
+        } else {
+            qtest_sendf(chr, "IRQ %s %d\n", level ? "raise" : "lower", n);
+        }
+
+        data->last_level = level;
     }
 }
 
@@ -289,7 +308,7 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
         if (!dev) {
             qtest_send_prefix(chr);
             qtest_send(chr, "FAIL Unknown device\n");
-	    return;
+            return;
         }
 
         if (irq_intercept_dev) {
@@ -299,33 +318,73 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
             } else {
                 qtest_send(chr, "OK\n");
             }
-	    return;
+            return;
         }
 
         QLIST_FOREACH(ngl, &dev->gpios, node) {
-            /* We don't support intercept of named GPIOs yet */
-            if (ngl->name) {
-                continue;
-            }
             if (words[0][14] == 'o') {
                 int i;
                 for (i = 0; i < ngl->num_out; ++i) {
-                    qemu_irq *disconnected = g_new0(qemu_irq, 1);
-                    qemu_irq icpt = qemu_allocate_irq(qtest_irq_handler,
-                                                      disconnected, i);
+                    qtest_irq *data = g_new0(qtest_irq, 1);
+                    data->name = ngl->name;
+                    qemu_irq icpt = qemu_allocate_irq(qtest_irq_handler, data,
+                            i);
 
-                    *disconnected = qdev_intercept_gpio_out(dev, icpt,
+                    data->old_irq = qdev_intercept_gpio_out(dev, icpt,
                                                             ngl->name, i);
                 }
             } else {
-                qemu_irq_intercept_in(ngl->in, qtest_irq_handler,
-                                      ngl->num_in);
+                int i;
+                for (i = 0; i < ngl->num_in; ++i) {
+                    qtest_irq *data = g_new0(qtest_irq, 1);
+                    data->name = ngl->name;
+                    data->old_irq = qemu_irq_dup(ngl->in[i]);
+
+                    qemu_irq_intercept_in(ngl->in[i], qtest_irq_handler, data);
+                }
             }
         }
         irq_intercept_dev = dev;
         qtest_send_prefix(chr);
         qtest_send(chr, "OK\n");
 
+    } else if (strcmp(words[0], "irq_set") == 0) {
+        DeviceState *dev;
+        NamedGPIOList *ngl;
+        int level;
+        qemu_irq irq = NULL;
+        int irq_num;
+
+        g_assert(words[1]); /* device */
+        g_assert(words[2]); /* gpio list */
+        g_assert(words[3]); /* gpio line in list */
+        g_assert(words[4]); /* level */
+        dev = DEVICE(object_resolve_path(words[1], NULL));
+        if (!dev) {
+            qtest_send_prefix(chr);
+            qtest_send(chr, "FAIL Unknown device\n");
+            return;
+        }
+
+        irq_num = atoi(words[3]);
+        level = atoi(words[4]);
+
+        QLIST_FOREACH(ngl, &dev->gpios, node) {
+            if (strcmp(words[2], ngl->name) == 0 && ngl->num_in > irq_num) {
+                irq = ngl->in[irq_num];
+            }
+        }
+
+        if (irq == NULL) {
+            qtest_send_prefix(chr);
+            qtest_send(chr, "FAIL Unknown IRQ\n");
+            return;
+        }
+
+        qemu_set_irq(irq, level);
+
+        qtest_send_prefix(chr);
+        qtest_send(chr, "OK\n");
     } else if (strcmp(words[0], "outb") == 0 ||
                strcmp(words[0], "outw") == 0 ||
                strcmp(words[0], "outl") == 0) {
@@ -622,8 +681,6 @@ static int qtest_can_read(void *opaque)
 
 static void qtest_event(void *opaque, int event)
 {
-    int i;
-
     switch (event) {
     case CHR_EVENT_OPENED:
         /*
@@ -632,9 +689,6 @@ static void qtest_event(void *opaque, int event)
          * used.  Injects an extra reset even when it's not used, and
          * that can mess up tests, e.g. -boot once.
          */
-        for (i = 0; i < ARRAY_SIZE(irq_levels); i++) {
-            irq_levels[i] = 0;
-        }
         qemu_gettimeofday(&start_time);
         qtest_opened = true;
         if (qtest_log_fp) {
diff --git a/tests/libqtest.c b/tests/libqtest.c
index 6f69752..43da151 100644
--- a/tests/libqtest.c
+++ b/tests/libqtest.c
@@ -21,12 +21,16 @@
 #include <sys/wait.h>
 #include <sys/un.h>
 
+#include <glib.h>
+
 #include "qapi/qmp/json-parser.h"
 #include "qapi/qmp/json-streamer.h"
 #include "qapi/qmp/qjson.h"
 
+
 #define MAX_IRQ 256
 #define SOCKET_TIMEOUT 50
+#define IRQ_KEY_LENGTH 64
 
 QTestState *global_qtest;
 
@@ -34,12 +38,22 @@ struct QTestState
 {
     int fd;
     int qmp_fd;
+    GHashTable *irq_handlers;
     bool irq_level[MAX_IRQ];
     GString *rx;
     pid_t qemu_pid;  /* our child QEMU process */
     bool big_endian;
 };
 
+typedef struct irq_action {
+    void (*cb)(void *opaque, const char *name, int irq, bool level);
+    void *opaque;
+    const char *name;
+    int n;
+    bool level;
+} irq_action;
+
+
 static GHookList abrt_hooks;
 static GList *qtest_instances;
 static struct sigaction sigact_old;
@@ -216,6 +230,8 @@ QTestState *qtest_init(const char *extra_args)
 
     s->big_endian = qtest_query_target_endianness(s);
 
+    s->irq_handlers = g_hash_table_new_full(g_str_hash, g_str_equal, g_free, g_free);
+
     return s;
 }
 
@@ -224,6 +240,8 @@ void qtest_quit(QTestState *s)
     qtest_instances = g_list_remove(qtest_instances, s);
     g_hook_destroy_link(&abrt_hooks, g_hook_find_data(&abrt_hooks, TRUE, s));
 
+    g_hash_table_destroy(s->irq_handlers);
+
     /* Uninstall SIGABRT handler on last instance */
     if (!qtest_instances) {
         cleanup_sigabrt_handler();
@@ -304,11 +322,35 @@ static GString *qtest_recv_line(QTestState *s)
     return line;
 }
 
+void qtest_irq_attach(QTestState *s, const char *name, int irq,
+        void (*irq_cb)(void *opaque, const char *name, int irq, bool level),
+        void *opaque)
+{
+    char key[IRQ_KEY_LENGTH];
+    irq_action *action = g_new0(irq_action, 1);
+
+    action->cb = irq_cb;
+    action->name = name;
+    action->n = irq;
+    action->opaque = opaque;
+    action->level = false;
+
+    g_assert_cmpint(snprintf(key, sizeof(key), "%s.%d",
+            name, irq), <, sizeof(key));
+
+    g_hash_table_insert(s->irq_handlers, g_strdup(key), action);
+}
+
+#define MAX_ACTIONS 256
 static gchar **qtest_rsp(QTestState *s, int expected_args)
 {
     GString *line;
     gchar **words;
     int i;
+    int action_index;
+    int action_count = 0;
+    bool action_raise[MAX_ACTIONS];
+    irq_action *actions[MAX_ACTIONS];
 
 redo:
     line = qtest_recv_line(s);
@@ -325,10 +367,29 @@ redo:
         g_assert_cmpint(irq, >=, 0);
         g_assert_cmpint(irq, <, MAX_IRQ);
 
-        if (strcmp(words[1], "raise") == 0) {
-            s->irq_level[irq] = true;
-        } else {
-            s->irq_level[irq] = false;
+        s->irq_level[irq] = (strcmp(words[1], "raise") == 0);
+
+        g_strfreev(words);
+        goto redo;
+    } else if (strcmp(words[0], "IRQ_NAMED") == 0) {
+        bool level;
+        char key[IRQ_KEY_LENGTH];
+        irq_action *action;
+
+        g_assert(words[1] != NULL);
+        g_assert(words[2] != NULL);
+        g_assert(words[3] != NULL);
+
+        level = (words[3][0] == '1');
+
+        g_assert_cmpint(snprintf(key, sizeof(key), "%s.%s",
+                words[1], words[2]), <, sizeof(key));
+
+        action = g_hash_table_lookup(s->irq_handlers, key);
+
+        if (action) {
+            action_raise[action_count] = level;
+            actions[action_count++] = action;
         }
 
         g_strfreev(words);
@@ -346,6 +407,17 @@ redo:
         g_strfreev(words);
     }
 
+/* Defer processing of IRQ actions until all communications have been handled,
+ * otherwise, interrupt handler that cause further communication can disrupt
+ * the communication stream
+ */
+    for (action_index = 0; action_index < action_count; action_index++) {
+        irq_action *action = actions[action_index];
+        action->cb(action->opaque, action->name, action->n,
+                action_raise[action_index]);
+        action->level = action_raise[action_index];
+    }
+
     return words;
 }
 
@@ -918,3 +990,10 @@ bool qtest_big_endian(QTestState *s)
 {
     return s->big_endian;
 }
+
+void qtest_irq_set(QTestState *s, const char *id, const char *gpiolist, int n,
+        bool level)
+{
+    qtest_sendf(s, "irq_set %s %s %d %d\n", id, gpiolist, n, level);
+    qtest_rsp(s, 0);
+}
diff --git a/tests/libqtest.h b/tests/libqtest.h
index 90f182e..c74373c 100644
--- a/tests/libqtest.h
+++ b/tests/libqtest.h
@@ -176,6 +176,34 @@ void qtest_irq_intercept_in(QTestState *s, const char *string);
 void qtest_irq_intercept_out(QTestState *s, const char *string);
 
 /**
+ * irq_attach:
+ * @s: #QTestState instance to operate on.
+ * @name: the name of the GPIO list containing the IRQ
+ * @irq: The IRQ number within the GPIO list to attach to
+ * @irq_cb: The callback to execute when the interrupt changes
+ * @opaque: opaque info to pass to the callback
+ *
+ * Attach a callback to an intercepted interrupt
+ */
+void qtest_irq_attach(QTestState *s, const char *name, int irq,
+        void (*irq_cb)(void *opaque, const char *name, int irq, bool level),
+        void *opaque);
+
+/**
+ * qtest_irq_set
+ * Set an interrupt level
+ * @s: #QTestState instance to operate on.
+ * @id: the device to inject interrupts for
+ * @gpiolist: the GPIO list containing the IRQ
+ * @n: the GPIO within the list
+ * @level: the IRQ level
+ *
+ * Set an interrupt to a nominated level
+ */
+void qtest_irq_set(QTestState *s, const char *id, const char *gpiolist, int n,
+        bool level);
+
+/**
  * qtest_outb:
  * @s: #QTestState instance to operate on.
  * @addr: I/O port to write to.
@@ -626,6 +654,37 @@ static inline void irq_intercept_out(const char *string)
 }
 
 /**
+ * irq_attach:
+ * @name: the name of the gpio list containing the IRQ
+ * @irq: The IRQ to attach to
+ * @irq_cb: The callback to execute when the interrupt changes
+ * @opaque: opaque info to pass to the callback
+ *
+ * Attach a callback to an intecepted interrupt
+ */
+static inline void irq_attach(const char *name, int irq,
+        void (*irq_cb)(void *opaque, const char *name, int irq, bool level),
+        void *opaque)
+{
+    qtest_irq_attach(global_qtest, name, irq, irq_cb, opaque);
+}
+
+/**
+ * qtest_irq_set
+ * Set an interrupt level
+ * @id: the device to inject interrupts for
+ * @gpiolist: the GPIO list containing the line to seh
+ * @n: the line to set within the list
+ * @level: the IRQ level
+ */
+static inline void irq_set(const char *id, const char *gpiolist, int n,
+        bool level)
+{
+    qtest_irq_set(global_qtest, id, gpiolist, n, level);
+}
+
+
+/**
  * outb:
  * @addr: I/O port to write to.
  * @value: Value being written.
-- 
2.9.3

