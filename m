Received: by 10.25.0.6 with SMTP id 6csp240966lfa;
        Wed, 10 May 2017 04:37:23 -0700 (PDT)
X-Received: by 10.55.163.20 with SMTP id m20mr5320889qke.265.1494416242973;
        Wed, 10 May 2017 04:37:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494416242; cv=none;
        d=google.com; s=arc-20160816;
        b=OFFn9FwIOylfFrNR1S0DcqGcSVEgisj7/1LIy1E/mKP7cFbPTvUOzj4BINRKE/Gche
         ov7bXLauL5bDn2Q3DrlR7cGxhWxVwKjlw61DBws5QhXFYe85UkhqWxSrmLNlHYb3Pja9
         /vTILqt9YWfU5EKvXivhiSqXotGPS1TiNb3NXrLH+CGVDjSenxOMbt9ZqwrN4RPr/jAY
         33ebsMl/qnKQnRtVHhL9Ok+H6USl9XMzh0b26adJaIUSDCCoznoDGgJUSmyZfmNlOpGT
         ifBeQARZLp6xwCcq7T2F5mwc+C9zPv2F36rq5eWvkr+53X3uP5+5WqMhWwkLkdS4/9xJ
         vQwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=UD2eP8/7b6DecvMm8rxi+7jZcq1rxyRrzr2Gg/TmwrA=;
        b=B3pSU4ddsmqipkYU3NMYnr0cijEU9Tcaz+IuINjjAKrA1YlnlTvMGRDvByfhsThCfU
         MKDxBllNrZLp0AotnbWVxoBNtvuKZ+80hx600dH2ubcWxem8o1j+iKQ9EmYQwC0+8er9
         c5vODWcSZxDKw2x+79GFNsaliJMUvQ3Cbjro04GX0I4ztOfJZHBhwGSX9A3PawE10Kee
         t5iA3+T1MTzZHEXBR3IxVvHkf11/3LQZS0+Rsx/8I0yO88MlyBc4TPvA84cVqwPAFops
         Qs2FsQf3h6FE0ZpM6kWD/mo91XLm0YhfZZCmUHqiW2ILPbHg/YVYRn/DFPiYO/R2XolK
         roeA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 94si3090931qkw.248.2017.05.10.04.37.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 10 May 2017 04:37:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41957 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d8Pvm-00053l-Cx
	for alex.bennee@linaro.org; Wed, 10 May 2017 07:37:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35533)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d8PpL-0007pU-3i
	for qemu-arm@nongnu.org; Wed, 10 May 2017 07:30:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d8PpI-0001ns-6O
	for qemu-arm@nongnu.org; Wed, 10 May 2017 07:30:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49570)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1d8PpH-0001na-Uz; Wed, 10 May 2017 07:30:40 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D8BE7D7154;
	Wed, 10 May 2017 11:30:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com D8BE7D7154
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com D8BE7D7154
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DE8097DFF5;
	Wed, 10 May 2017 11:30:36 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 10 May 2017 13:29:56 +0200
Message-Id: <1494415802-227633-13-git-send-email-imammedo@redhat.com>
In-Reply-To: <1494415802-227633-1-git-send-email-imammedo@redhat.com>
References: <1494415802-227633-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 10 May 2017 11:30:39 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 12/18] tests: numa: add case for QMP command
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
X-TUID: dLFBaEta7fn/

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
---
v2:
 * fix checkpatch error, move { to newline
---
 numa.c            | 14 --------------
 tests/numa-test.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+), 14 deletions(-)

diff --git a/numa.c b/numa.c
index c89fc2d..f16a6a8 100644
--- a/numa.c
+++ b/numa.c
@@ -737,20 +737,6 @@ MemdevList *qmp_query_memdev(Error **errp)
     return list;
 }
 
-int numa_get_node_for_cpu(int idx)
-{
-    int i;
-
-    assert(idx < max_cpus);
-
-    for (i = 0; i < nb_numa_nodes; i++) {
-        if (test_bit(idx, numa_info[i].node_cpu)) {
-            break;
-        }
-    }
-    return i;
-}
-
 void ram_block_notifier_add(RAMBlockNotifier *n)
 {
     QLIST_INSERT_HEAD(&ram_list.ramblock_notifiers, n, next);
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

