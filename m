Received: by 10.25.0.6 with SMTP id 6csp244098lfa;
        Wed, 10 May 2017 04:44:34 -0700 (PDT)
X-Received: by 10.55.163.70 with SMTP id m67mr5163030qke.295.1494416674015;
        Wed, 10 May 2017 04:44:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494416674; cv=none;
        d=google.com; s=arc-20160816;
        b=gr67x9L8/+McxzhmWiuW35poK4aEbJL0IdPz1J+hB1nK34/euOimp5CukVXeBMA/K9
         fFseZHkG3+vfQYr2mc3TG0B/FpsIo3cyAh3vhkQKkLSsaPXjV7i/ZdAgVKqMUaVSh0RY
         efpPNQL9I04OoqPHw7l7tN3bR8eYdAWLjJneCCfakc7liXrbjfBnBjvyAIN+CXu48El8
         /2RlemOY1bqoJwF6mgJAVBK06b65FKx/PyL7y5m0vHKHmtA+7o3H5tmUBGlfkRNH4Feo
         9qll984dnDyK4tU8rL9gXl7JESslUgDxenF0Tly425/8hwjDbYwW0mvaQ/DbJuVGmqsz
         tLIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=yuPHW3Kbe6yfFHJ1XuKyKBOeH+7qldu3RfHsolRh928=;
        b=g6K8GNOeEh1N4eil/sI0HtTcoaUDjDOQZyMTeldyth6r/ifD+SRKb9WWxtbGfe+/Im
         KQ5MbBTeSTqIMuPzFDPDootRvQrNlf03DUAR6O/UW0eoxPkHbQYY/1lZ/oi9ebH9bl1K
         rXiUkxCZpNFBbXjBaDCcrPdqqaFsOEjRqqYHS5yJXcBbbiOzQ0QFfd51+kF3dou8DRAp
         CYsthuqPnl4CEXrZ2snOjM+iy3ewmE7cz/tjgM9oEhaLq/BoPTS6JIamlKRrZUTamkBx
         9TH/eSo8Zb4XEw7m8BdtirvpzbSgLsCEqYvqii/GqnHXv6QF/cFQUc4Pwbn2acaz2n18
         bBOA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n19si2902518qtn.193.2017.05.10.04.44.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 10 May 2017 04:44:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42001 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d8Q2j-0002kh-BJ
	for alex.bennee@linaro.org; Wed, 10 May 2017 07:44:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35784)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d8Ppa-00088U-GW
	for qemu-devel@nongnu.org; Wed, 10 May 2017 07:31:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d8PpZ-0001vV-GN
	for qemu-devel@nongnu.org; Wed, 10 May 2017 07:30:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50022)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1d8PpW-0001tt-O8; Wed, 10 May 2017 07:30:54 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A4BDB80048;
	Wed, 10 May 2017 11:30:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com A4BDB80048
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com A4BDB80048
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 974FD88550;
	Wed, 10 May 2017 11:30:51 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 10 May 2017 13:30:02 +0200
Message-Id: <1494415802-227633-19-git-send-email-imammedo@redhat.com>
In-Reply-To: <1494415802-227633-1-git-send-email-imammedo@redhat.com>
References: <1494415802-227633-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Wed, 10 May 2017 11:30:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 18/18] tests: check -numa node,
 cpu=props_list usecase
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Shannon Zhao <zhaoshenglong@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZIgcpUvUor/N

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
---
 tests/numa-test.c | 151 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 151 insertions(+)

diff --git a/tests/numa-test.c b/tests/numa-test.c
index 2722687..c3475d6 100644
--- a/tests/numa-test.c
+++ b/tests/numa-test.c
@@ -131,6 +131,144 @@ static void test_query_cpus(const void *data)
     g_free(cli);
 }
 
+static void pc_numa_cpu(const void *data)
+{
+    char *cli;
+    QDict *resp;
+    QList *cpus;
+    const QObject *e;
+
+    cli = make_cli(data, "-cpu pentium -smp 8,sockets=2,cores=2,threads=2 "
+        "-numa node,nodeid=0 -numa node,nodeid=1 "
+        "-numa cpu,node-id=1,socket-id=0 "
+        "-numa cpu,node-id=0,socket-id=1,core-id=0 "
+        "-numa cpu,node-id=0,socket-id=1,core-id=1,thread-id=0 "
+        "-numa cpu,node-id=1,socket-id=1,core-id=1,thread-id=1");
+    qtest_start(cli);
+    cpus = get_cpus(&resp);
+    g_assert(cpus);
+
+    while ((e = qlist_pop(cpus))) {
+        QDict *cpu, *props;
+        int64_t socket, core, thread, node;
+
+        cpu = qobject_to_qdict(e);
+        g_assert(qdict_haskey(cpu, "props"));
+        props = qdict_get_qdict(cpu, "props");
+
+        g_assert(qdict_haskey(props, "node-id"));
+        node = qdict_get_int(props, "node-id");
+        g_assert(qdict_haskey(props, "socket-id"));
+        socket = qdict_get_int(props, "socket-id");
+        g_assert(qdict_haskey(props, "core-id"));
+        core = qdict_get_int(props, "core-id");
+        g_assert(qdict_haskey(props, "thread-id"));
+        thread = qdict_get_int(props, "thread-id");
+
+        if (socket == 0) {
+            g_assert_cmpint(node, ==, 1);
+        } else if (socket == 1 && core == 0) {
+            g_assert_cmpint(node, ==, 0);
+        } else if (socket == 1 && core == 1 && thread == 0) {
+            g_assert_cmpint(node, ==, 0);
+        } else if (socket == 1 && core == 1 && thread == 1) {
+            g_assert_cmpint(node, ==, 1);
+        } else {
+            g_assert(false);
+        }
+    }
+
+    QDECREF(resp);
+    qtest_end();
+    g_free(cli);
+}
+
+static void spapr_numa_cpu(const void *data)
+{
+    char *cli;
+    QDict *resp;
+    QList *cpus;
+    const QObject *e;
+
+    cli = make_cli(data, "-smp 4,cores=4 "
+        "-numa node,nodeid=0 -numa node,nodeid=1 "
+        "-numa cpu,node-id=0,core-id=0 "
+        "-numa cpu,node-id=0,core-id=1 "
+        "-numa cpu,node-id=0,core-id=2 "
+        "-numa cpu,node-id=1,core-id=3");
+    qtest_start(cli);
+    cpus = get_cpus(&resp);
+    g_assert(cpus);
+
+    while ((e = qlist_pop(cpus))) {
+        QDict *cpu, *props;
+        int64_t core, node;
+
+        cpu = qobject_to_qdict(e);
+        g_assert(qdict_haskey(cpu, "props"));
+        props = qdict_get_qdict(cpu, "props");
+
+        g_assert(qdict_haskey(props, "node-id"));
+        node = qdict_get_int(props, "node-id");
+        g_assert(qdict_haskey(props, "core-id"));
+        core = qdict_get_int(props, "core-id");
+
+        if (core >= 0 && core < 3) {
+            g_assert_cmpint(node, ==, 0);
+        } else if (core == 3) {
+            g_assert_cmpint(node, ==, 1);
+        } else {
+            g_assert(false);
+        }
+    }
+
+    QDECREF(resp);
+    qtest_end();
+    g_free(cli);
+}
+
+static void aarch64_numa_cpu(const void *data)
+{
+    char *cli;
+    QDict *resp;
+    QList *cpus;
+    const QObject *e;
+
+    cli = make_cli(data, "-smp 2 "
+        "-numa node,nodeid=0 -numa node,nodeid=1 "
+        "-numa cpu,node-id=1,thread-id=0 "
+        "-numa cpu,node-id=0,thread-id=1");
+    qtest_start(cli);
+    cpus = get_cpus(&resp);
+    g_assert(cpus);
+
+    while ((e = qlist_pop(cpus))) {
+        QDict *cpu, *props;
+        int64_t thread, node;
+
+        cpu = qobject_to_qdict(e);
+        g_assert(qdict_haskey(cpu, "props"));
+        props = qdict_get_qdict(cpu, "props");
+
+        g_assert(qdict_haskey(props, "node-id"));
+        node = qdict_get_int(props, "node-id");
+        g_assert(qdict_haskey(props, "thread-id"));
+        thread = qdict_get_int(props, "thread-id");
+
+        if (thread == 0) {
+            g_assert_cmpint(node, ==, 1);
+        } else if (thread == 1) {
+            g_assert_cmpint(node, ==, 0);
+        } else {
+            g_assert(false);
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
@@ -147,5 +285,18 @@ int main(int argc, char **argv)
     qtest_add_data_func("/numa/mon/cpus/partial", args, test_mon_partial);
     qtest_add_data_func("/numa/qmp/cpus/query-cpus", args, test_query_cpus);
 
+    if (!strcmp(arch, "i386") || !strcmp(arch, "x86_64")) {
+        qtest_add_data_func("/numa/pc/cpu/explicit", args, pc_numa_cpu);
+    }
+
+    if (!strcmp(arch, "ppc64")) {
+        qtest_add_data_func("/numa/spapr/cpu/explicit", args, spapr_numa_cpu);
+    }
+
+    if (!strcmp(arch, "aarch64")) {
+        qtest_add_data_func("/numa/aarch64/cpu/explicit", args,
+                            aarch64_numa_cpu);
+    }
+
     return g_test_run();
 }
-- 
2.7.4

