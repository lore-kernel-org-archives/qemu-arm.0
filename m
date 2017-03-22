Received: by 10.25.15.230 with SMTP id 99csp260111lfp;
        Wed, 22 Mar 2017 06:41:21 -0700 (PDT)
X-Received: by 10.55.214.24 with SMTP id t24mr37600138qki.141.1490190081433;
        Wed, 22 Mar 2017 06:41:21 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x66si1115461qkc.129.2017.03.22.06.41.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 Mar 2017 06:41:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51161 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cqgVr-0005mK-ME
	for alex.bennee@linaro.org; Wed, 22 Mar 2017 09:41:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45197)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1cqgPL-0008Lz-IB
	for qemu-arm@nongnu.org; Wed, 22 Mar 2017 09:34:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1cqgPK-00028M-Mn
	for qemu-arm@nongnu.org; Wed, 22 Mar 2017 09:34:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44247)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1cqgPK-000289-I3; Wed, 22 Mar 2017 09:34:34 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 76D289FDEA;
	Wed, 22 Mar 2017 13:34:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 76D289FDEA
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 76D289FDEA
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A2670A5662;
	Wed, 22 Mar 2017 13:34:29 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 22 Mar 2017 14:32:41 +0100
Message-Id: <1490189568-167621-17-git-send-email-imammedo@redhat.com>
In-Reply-To: <1490189568-167621-1-git-send-email-imammedo@redhat.com>
References: <1490189568-167621-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 22 Mar 2017 13:34:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH for-2.10 16/23] tests: numa: add case for QMP
 command query-cpus
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
X-TUID: 4PbSAo/ldP2o

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/numa-test.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/tests/numa-test.c b/tests/numa-test.c
index f5da0c8..8326321 100644
--- a/tests/numa-test.c
+++ b/tests/numa-test.c
@@ -87,6 +87,49 @@ static void test_mon_partial(const void *data)
     g_free(cli);
 }
 
+static QList* get_cpus(QDict **resp) {
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
@@ -101,6 +144,7 @@ int main(int argc, char **argv)
     qtest_add_data_func("/numa/mon/default", args, test_mon_default);
     qtest_add_data_func("/numa/mon/cpus/explicit", args, test_mon_explicit);
     qtest_add_data_func("/numa/mon/cpus/partial", args, test_mon_partial);
+    qtest_add_data_func("/numa/qmp/cpus/query-cpus", args, test_query_cpus);
 
     return g_test_run();
 }
-- 
2.7.4

