Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B8FC982FA
	for <qemu-arm@archiver.kernel.org>; Tue, 22 Sep 2026 21:58:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x98Tn-0004YT-CE; Tue, 22 Sep 2026 17:56:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x98Tk-0004W6-VW
 for qemu-arm@nongnu.org; Tue, 22 Sep 2026 17:56:45 -0400
Received: from mail-dl2-x25.google.com ([2607:f8b0:4864:38::25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x98Th-00011K-UR
 for qemu-arm@nongnu.org; Tue, 22 Sep 2026 17:56:44 -0400
Received: by mail-dl2-x25.google.com with SMTP id
 a92af1059eb24-1438e88300cso282572c88.0
 for <qemu-arm@nongnu.org>; Tue, 22 Sep 2026 14:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790114200; x=1790719000; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=rPXXZSMg3B1e8GVfb4Q4EgRzyMm8fU6LPV9bb/pqSMM=;
 b=SBkwiVcN0ukculAteGb0YDZOoC1RPzMWslD0aqkaRbAo2uf6CNhg/OImYUhxiBAS6H
 zGlix6d5+4vUTuIn670/eEG7aqLSRjIoh6+wEGU6ded+tXUTm9I8WvFbolDtwU+VxUQp
 Y/vDZ23PIOsLsbrZ9yDwyxZ+DAnoYvU0jgUe9YlRKEHWeyJC5orWqDD86UPrDUXRVka1
 rcSDbIr+o1aheW7xwrDfyN0VFV7FKup6sZQ+X58z9JdgIVua/xY7/8bzFl58sesJ2Rao
 a+zBXi+Dk9UkHGOt8nbG3RjB3VTt+xWMqmhss+Fz/+/hrV6EMZ/tKS576ALouo1LqfS5
 RFnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790114200; x=1790719000;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=rPXXZSMg3B1e8GVfb4Q4EgRzyMm8fU6LPV9bb/pqSMM=;
 b=rWakJMmqazKPFJreAh6iStZUm6ahZEbd4WCFRx+dh7s4L6iDV0JvSwzGPp75BxcYUx
 j9r4gdaXKScThULJXJvv5k3r4Iocb55wcwN250xxldnLekaWwdkma3pyb28qOB5oRK9x
 0HAYj8pSFg7BWP3bUFFMwBLYJTRxnnNHsy+1t7Gj8szlu2rmqhpTko6pfiR2FL9724d7
 nnLKpXNTH15K5IZSHznSg9gtU1nLFY6Db7hOxowrQ+O0U7d+OamSeGNVhKi5kOLsiojA
 LXCHCtU2Wi1fOIazMv6blvmeM9E8OP6Jrp2Oks2ghK33NWpV9oTlvjxsKiYwPuSUMI/x
 NVSg==
X-Forwarded-Encrypted: i=1;
 AKwUvBw5O60na1zbQwzKRF9esOhUuJcVmqGW6WIyR90LeWEvgZ3vobSVt8s+w2RFfOruFiA3i70d+Pn3Wg==@nongnu.org
X-Gm-Message-State: AFuF++lM+Q5KqtDr9DXTuuI49LdtaBqjAsULswsjJjNkVxUPhHSkmoOb
 Lah29EM7nUC5TXvm230eIAJGoTzRhWY+WZmR2Y3ekBFQUHi59dSZ53bS
X-Gm-Gg: AYBFou2aT+kxDOPt9JBqlLLyz1xTxNUajTPSHf7qnBsvAC3OcPO3Co7JOW+G6nEoMI/
 yTPw46F53UT/Sm4alqa77HqLoPmbj8kZlpaJCIvzWAMPRLSNAax7QhhON5eaImhRuzTchxMpJvh
 0t0WGhpRXk+8fkvcCNFVm6TkTgRobWh2y7OVfeSfh33G18nqYydyWKohtxW9V/EsVW0hGxn/UyG
 tytC5fUS9zER/aAA2wXm4YLe0mCfzSEJG/MMeYMXB29y+6TRnIOK1lDsoPi2VKpS7SB8ldempzc
 LKnVVYAXl+7hovCZe6zBIoIifSgCt4mxg0N9mEjB1ulHI/RPKA7nFWG4XOyTaLZCzoxDNfjWGtX
 SVl71jcLw4rX0sEFgI981QninqnnVZoJR4tIUsNsLUT5T+iP/5gb5kfG9O3yqib2LG5EumM/qvG
 ZStGIteZtY6J5SeMdtepM1o7WccAjVHHH1dzwlOGbXPfSOSA4X8OiXxLn+lztcC+2RSAYNNPBA6
 yeMfyaKSqJO7K9e3m8vZpGWCnFiFhs=
X-Received: by 2002:a05:701b:2304:b0:143:8865:cca with SMTP id
 a92af1059eb24-144f91cb678mr718145c88.22.1790114199904; 
 Tue, 22 Sep 2026 14:56:39 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-144f949e60dsm1001153c88.2.2026.09.22.14.56.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2026 14:56:39 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Bibo Mao <maobibo@loongson.cn>, Xianglai Li <lixianglai@loongson.cn>,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Chao Liu <chao.liu@processmission.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Zhao Liu <zhao1.liu@intel.com>, Peter Maydell <peter.maydell@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, Song Gao <17746591750@163.com>,
 Markus Armbruster <armbru@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 Stafford Horne <shorne@gmail.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Subject: [PATCH v2 9/9] qapi: return MachineInfo typename from query-machines
Date: Wed, 23 Sep 2026 05:55:32 +0800
Message-ID: <20260922215533.641-10-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260922215533.641-1-luoyonggang@gmail.com>
References: <20260922215533.641-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:38::25;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl2-x25.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

query-machines returned only the -M name, so management apps inferred
the QOM type as that name plus "-machine". A prefixed type such as
arm-virt-11.1-machine no longer matches -M virt-11.1. Return the QOM
type in MachineInfo typename from object_class_get_name() in
qmp_query_machines(). test_query_machines_typename checks that
qom-list-properties accepts it.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 hw/core/machine-qmp-cmds.c |  1 +
 qapi/machine.json          |  6 +++-
 tests/qtest/qom-test.c     | 65 ++++++++++++++++++++++++++++++++++----
 3 files changed, 65 insertions(+), 7 deletions(-)

diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
index 9c08b17510a..27ceed54a14 100644
--- a/hw/core/machine-qmp-cmds.c
+++ b/hw/core/machine-qmp-cmds.c
@@ -116,6 +116,7 @@ MachineInfoList *qmp_query_machines(bool has_compat_props, bool compat_props,
         }
 
         info->name = g_strdup(mc->name);
+        info->q_typename = g_strdup(object_class_get_name(OBJECT_CLASS(mc)));
         info->cpu_max = !mc->max_cpus ? 1 : mc->max_cpus;
         info->hotpluggable_cpus = mc->has_hotpluggable_cpus;
         info->numa_mem_supported = mc->numa_mem_supported;
diff --git a/qapi/machine.json b/qapi/machine.json
index b1be5608b61..f5ead98e174 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -168,6 +168,9 @@
 #
 # @name: the name of the machine
 #
+# @typename: QOM type name of the machine, for qom-list-properties
+#     (since 11.2)
+#
 # @alias: an alias for the machine name
 #
 # @is-default: whether the machine is default
@@ -208,7 +211,7 @@
 # Since: 1.2
 ##
 { 'struct': 'MachineInfo',
-  'data': { 'name': 'str', '*alias': 'str',
+  'data': { 'name': 'str', 'typename': 'str', '*alias': 'str',
             '*is-default': 'bool', 'cpu-max': 'int',
             'hotpluggable-cpus': 'bool',  'numa-mem-supported': 'bool',
             'deprecated': 'bool', '*default-cpu-type': 'str',
@@ -238,6 +241,7 @@
 #               {
 #                  "hotpluggable-cpus": true,
 #                  "name": "pc-q35-6.2",
+#                  "typename": "pc-q35-6.2-machine",
 #                  "compat-props": [
 #                       {
 #                          "qom-type": "virtio-mem",
diff --git a/tests/qtest/qom-test.c b/tests/qtest/qom-test.c
index cf4c6b5add5..4ee95af6d94 100644
--- a/tests/qtest/qom-test.c
+++ b/tests/qtest/qom-test.c
@@ -200,13 +200,32 @@ static void test_machine(gconstpointer data)
 
     if (g_test_slow()) {
         /* Make sure we can get the machine class properties: */
-        g_autofree char *qom_machine = g_strdup_printf("%s-machine", machine);
-
-        response = qtest_qmp(qts, "{ 'execute': 'qom-list-properties',"
-                                  "  'arguments': { 'typename': %s } }",
-                             qom_machine);
-        g_assert(response);
+        QList *list;
+        const QListEntry *p;
+        bool found = false;
+
+        response = qtest_qmp(qts, "{ 'execute': 'query-machines' }");
+        g_assert(!qdict_haskey(response, "error"));
+        list = qdict_get_qlist(response, "return");
+        g_assert(list);
+        for (p = qlist_first(list); p; p = qlist_next(p)) {
+            QDict *minfo = qobject_to(QDict, qlist_entry_obj(p));
+            QDict *props;
+
+            if (strcmp(qdict_get_str(minfo, "name"), machine)) {
+                continue;
+            }
+            props = qtest_qmp(qts, "{ 'execute': 'qom-list-properties',"
+                                   "  'arguments': { 'typename': %s } }",
+                              qdict_get_str(minfo, "typename"));
+            g_assert(!qdict_haskey(props, "error"));
+            g_assert(qdict_haskey(props, "return"));
+            qobject_unref(props);
+            found = true;
+            break;
+        }
         qobject_unref(response);
+        g_assert(found);
     }
 
     test_properties(qts, "/machine", true);
@@ -218,6 +237,39 @@ static void test_machine(gconstpointer data)
     qtest_quit(qts);
 }
 
+static void test_query_machines_typename(void)
+{
+    QTestState *qts;
+    QDict *response;
+    QList *list;
+    const QListEntry *p;
+    bool saw = false;
+
+    qts = qtest_init("-machine none");
+    response = qtest_qmp(qts, "{ 'execute': 'query-machines' }");
+    g_assert(!qdict_haskey(response, "error"));
+    list = qdict_get_qlist(response, "return");
+    g_assert(list);
+
+    for (p = qlist_first(list); p; p = qlist_next(p)) {
+        QDict *minfo = qobject_to(QDict, qlist_entry_obj(p));
+        const char *typename = qdict_get_str(minfo, "typename");
+        g_autoptr(QDict) props = NULL;
+
+        g_assert(g_str_has_suffix(typename, "-machine"));
+        props = qtest_qmp(qts, "{ 'execute': 'qom-list-properties',"
+                               "  'arguments': { 'typename': %s } }",
+                          typename);
+        g_assert(!qdict_haskey(props, "error"));
+        g_assert(qdict_haskey(props, "return"));
+        saw = true;
+    }
+
+    g_assert(saw);
+    qobject_unref(response);
+    qtest_quit(qts);
+}
+
 static void add_machine_test_case(const char *mname)
 {
     char *path;
@@ -250,6 +302,7 @@ int main(int argc, char **argv)
 
     qtest_cb_for_every_machine(add_machine_test_case, g_test_quick());
     qtest_add_func("qom/qom-qtests", test_qom_qtests);
+    qtest_add_func("qom/machine-typename", test_query_machines_typename);
 
     return g_test_run();
 }
-- 
2.52.0.windows.1


