Received: by 10.25.0.198 with SMTP id 189csp90305lfa;
        Wed, 3 May 2017 06:07:09 -0700 (PDT)
X-Received: by 10.200.47.161 with SMTP id l30mr1193753qta.153.1493816828913;
        Wed, 03 May 2017 06:07:08 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 22si20223064qto.55.2017.05.03.06.07.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 May 2017 06:07:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36638 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d5tzo-0007hy-7g
	for alex.bennee@linaro.org; Wed, 03 May 2017 09:07:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39835)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d5trB-00008B-Oh
	for qemu-arm@nongnu.org; Wed, 03 May 2017 08:58:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d5trA-000167-Vi
	for qemu-arm@nongnu.org; Wed, 03 May 2017 08:58:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53780)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1d5trA-00015j-QU; Wed, 03 May 2017 08:58:12 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9DC3361BB7;
	Wed,  3 May 2017 12:58:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 9DC3361BB7
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 9DC3361BB7
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6861517C5A;
	Wed,  3 May 2017 12:58:09 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  3 May 2017 14:57:11 +0200
Message-Id: <1493816238-33120-18-git-send-email-imammedo@redhat.com>
In-Reply-To: <1493816238-33120-1-git-send-email-imammedo@redhat.com>
References: <1493816238-33120-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 03 May 2017 12:58:11 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 17/24] tests: numa: add case for QMP command
 query-cpus
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Shannon Zhao <zhaoshenglong@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GLcJWjIPVpWx

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
v2:
 * fix checkpatch error, move { to newline
---
 tests/numa-test.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/tests/numa-test.c b/tests/numa-test.c
index f5da0c8..2722687 100644
--- a/tests/numa-test.c
+++ b/tests/numa-test.c
@@ -87,6 +87,50 @@ static void test_mon_partial(const void *data)
     g_free(cli);
 }
 
+static QList *get_cpus(QDict **resp)
+{
+    *resp = qmp("{ 'execute': 'query-cpus' }");
+    g_assert(*resp);
+    g_assert(qdict_haskey(*resp, "return"));
+    return  qdict_get_qlist(*resp, "return");
+}
+
+static void test_query_cpus(const void *data)
+{
+    char *cli;
+    QDict *resp;
+    QList *cpus;
+    const QObject *e;
+
+    cli = make_cli(data, "-smp 8 -numa node,cpus=0-3 -numa node,cpus=4-7");
+    qtest_start(cli);
+    cpus = get_cpus(&resp);
+    g_assert(cpus);
+
+    while ((e = qlist_pop(cpus))) {
+        QDict *cpu, *props;
+        int64_t cpu_idx, node;
+
+        cpu = qobject_to_qdict(e);
+        g_assert(qdict_haskey(cpu, "CPU"));
+        g_assert(qdict_haskey(cpu, "props"));
+
+        cpu_idx = qdict_get_int(cpu, "CPU");
+        props = qdict_get_qdict(cpu, "props");
+        g_assert(qdict_haskey(props, "node-id"));
+        node = qdict_get_int(props, "node-id");
+        if (cpu_idx >= 0 && cpu_idx < 4) {
+            g_assert_cmpint(node, ==, 0);
+        } else {
+            g_assert_cmpint(node, ==, 1);
+        }
+    }
+
+    QDECREF(resp);
+    qtest_end();
+    g_free(cli);
+}
+
 int main(int argc, char **argv)
 {
     const char *args = NULL;
@@ -101,6 +145,7 @@ int main(int argc, char **argv)
     qtest_add_data_func("/numa/mon/default", args, test_mon_default);
     qtest_add_data_func("/numa/mon/cpus/explicit", args, test_mon_explicit);
     qtest_add_data_func("/numa/mon/cpus/partial", args, test_mon_partial);
+    qtest_add_data_func("/numa/qmp/cpus/query-cpus", args, test_query_cpus);
 
     return g_test_run();
 }
-- 
2.7.4

