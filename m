Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp718524wro;
        Thu, 25 Oct 2018 06:40:06 -0700 (PDT)
X-Google-Smtp-Source: AJdET5dgILDy3MlGA02I9dB8F1KIQEzzK1DP/+nDEbq9gZPN4GAylYNuOkxUlkBl1DEPKx/JpTQT
X-Received: by 2002:a37:12a1:: with SMTP id 33mr1295957qks.189.1540474805988;
        Thu, 25 Oct 2018 06:40:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540474805; cv=none;
        d=google.com; s=arc-20160816;
        b=kExAZjWLWvSfTgALbd8MtfMx+rjMhBiuHbyFifWOiUx6ao9R1T4rCrrpEcMbBbXNK1
         B+DQY3nWC0JJmZtD1qQ4Z8ahyQQ2lGM7sTRcBKmgMFf7Er0jdPrGaY9OvJPTCDLOCy1R
         rYAqSWXJ0BvvZlh/fViFB8S/6gbcAWz6VmzqWO5519yOvoeDLqjcsV7TFYq7Yl4JVx2W
         G/YxxSIX1K6sc/9jK/XK8d5zgvT3llXQz4XyEVqG4wYTUpjj2ttlOGVsH9Lvp3e4hxZg
         mHbp31/xfaCnUW48SYoZ9KBFh1/9NZt6ohbJ4RC8RSNzmhpDXvXTYMwqt0+LeZ6eAxV2
         HaUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=1TNymq0/uj7ny63kFSADuHtmmi/6FqgYRaXDEdnwBbY=;
        b=qpZcocFL5OBDaRCnJ0uEc9hY26WPpRNxeYGxrE7Zis+uKBD+w0UYYBNPxDAt8DB6Lr
         9DdgKX30Oe6cIQuTZkXRhpFBpFz5PtJMfJ9hN8nJjmLpLuxwxyKsAffAcRb+tNI0Vpmp
         cfaI9UOAsZ+Pa+ErrQi9kMMP9IlLX3EEdKGbZoeo758HqCY+ixdZkwm7of/IgO2XdPXF
         uvxHWRCyU0ONoY7WgPKVqzYAFpYkEoEj7woIcYPCM47KUv6s2Oivs3J9PTtFgN8I7pCf
         mqqpMxxd+QEfXPf1tXiVlvAkeGDzrMBBH9ByLPr5eCida+D3NEk77I7dj5PVgw85LhCx
         qk8w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p47-v6si731847qtf.16.2018.10.25.06.40.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Oct 2018 06:40:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54510 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gFfrp-00072S-DT
	for alex.bennee@linaro.org; Thu, 25 Oct 2018 09:40:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57229)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gFfmt-0002Dq-3L
	for qemu-devel@nongnu.org; Thu, 25 Oct 2018 09:35:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gFflg-0006tR-Px
	for qemu-devel@nongnu.org; Thu, 25 Oct 2018 09:33:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34660)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gFfld-0006lC-3H; Thu, 25 Oct 2018 09:33:41 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 13BD43082A27;
	Thu, 25 Oct 2018 13:33:33 +0000 (UTC)
Received: from localhost (unknown [10.33.36.149])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9DC121001F58;
	Thu, 25 Oct 2018 13:33:21 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 25 Oct 2018 10:32:20 -0300
Message-Id: <20181025133301.16578-3-ehabkost@redhat.com>
In-Reply-To: <20181025133301.16578-1-ehabkost@redhat.com>
References: <20181025133301.16578-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Thu, 25 Oct 2018 13:33:33 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL v2 02/43] vl.c deprecate incorrect CPUs topology
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, libvir-list@redhat.com,
	Jason Wang <jasowang@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Markus Armbruster <armbru@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Rob Herring <robh@kernel.org>, Alexander Graf <agraf@suse.de>,
	Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kQAuJbPUq91/

From: Igor Mammedov <imammedo@redhat.com>

-smp [cpus],sockets/cores/threads[,maxcpus] should describe topology
so that total number of logical CPUs [sockets * cores * threads]
would be equal to [maxcpus], however historically we didn't have
such check in QEMU and it is possible to start VM with an invalid
topology.
Deprecate invalid options combination so we can make sure that
the topology VM started with is always correct in the future.
Users with an invalid sockets/cores/threads/maxcpus values should
fix their CLI to make sure that
   [sockets * cores * threads] == [maxcpus]

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Message-Id: <1536836762-273036-2-git-send-email-imammedo@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
[ehabkost: squashed unit test fix]
Message-Id: <20181019215345.521d58d7@igors-macbook-pro.local>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 tests/cpu-plug-test.c | 18 +++++++++---------
 vl.c                  |  7 +++++++
 qemu-deprecated.texi  | 12 ++++++++++++
 3 files changed, 28 insertions(+), 9 deletions(-)

diff --git a/tests/cpu-plug-test.c b/tests/cpu-plug-test.c
index 3e93c8e096..f4a677d238 100644
--- a/tests/cpu-plug-test.c
+++ b/tests/cpu-plug-test.c
@@ -32,12 +32,12 @@ static void test_plug_with_cpu_add(gconstpointer data)
     unsigned int i;
 
     args = g_strdup_printf("-machine %s -cpu %s "
-                           "-smp sockets=%u,cores=%u,threads=%u,maxcpus=%u",
+                           "-smp 1,sockets=%u,cores=%u,threads=%u,maxcpus=%u",
                            s->machine, s->cpu_model,
                            s->sockets, s->cores, s->threads, s->maxcpus);
     qtest_start(args);
 
-    for (i = s->sockets * s->cores * s->threads; i < s->maxcpus; i++) {
+    for (i = 1; i < s->maxcpus; i++) {
         response = qmp("{ 'execute': 'cpu-add',"
                        "  'arguments': { 'id': %d } }", i);
         g_assert(response);
@@ -56,7 +56,7 @@ static void test_plug_without_cpu_add(gconstpointer data)
     QDict *response;
 
     args = g_strdup_printf("-machine %s -cpu %s "
-                           "-smp sockets=%u,cores=%u,threads=%u,maxcpus=%u",
+                           "-smp 1,sockets=%u,cores=%u,threads=%u,maxcpus=%u",
                            s->machine, s->cpu_model,
                            s->sockets, s->cores, s->threads, s->maxcpus);
     qtest_start(args);
@@ -79,12 +79,12 @@ static void test_plug_with_device_add_x86(gconstpointer data)
     unsigned int s, c, t;
 
     args = g_strdup_printf("-machine %s -cpu %s "
-                           "-smp sockets=%u,cores=%u,threads=%u,maxcpus=%u",
+                           "-smp 1,sockets=%u,cores=%u,threads=%u,maxcpus=%u",
                            td->machine, td->cpu_model,
                            td->sockets, td->cores, td->threads, td->maxcpus);
     qtest_start(args);
 
-    for (s = td->sockets; s < td->maxcpus / td->cores / td->threads; s++) {
+    for (s = 1; s < td->sockets; s++) {
         for (c = 0; c < td->cores; c++) {
             for (t = 0; t < td->threads; t++) {
                 char *id = g_strdup_printf("id-%i-%i-%i", s, c, t);
@@ -113,7 +113,7 @@ static void test_plug_with_device_add_coreid(gconstpointer data)
                            td->sockets, td->cores, td->threads, td->maxcpus);
     qtest_start(args);
 
-    for (c = td->cores; c < td->maxcpus / td->sockets / td->threads; c++) {
+    for (c = 1; c < td->cores; c++) {
         char *id = g_strdup_printf("id-%i", c);
         qtest_qmp_device_add(td->device_model, id, "{'core-id':%u}", c);
         g_free(id);
@@ -148,7 +148,7 @@ static void add_pc_test_case(const char *mname)
     data->sockets = 1;
     data->cores = 3;
     data->threads = 2;
-    data->maxcpus = data->sockets * data->cores * data->threads * 2;
+    data->maxcpus = data->sockets * data->cores * data->threads;
     if (g_str_has_suffix(mname, "-1.4") ||
         (strcmp(mname, "pc-1.3") == 0) ||
         (strcmp(mname, "pc-1.2") == 0) ||
@@ -203,7 +203,7 @@ static void add_pseries_test_case(const char *mname)
     data->sockets = 2;
     data->cores = 3;
     data->threads = 1;
-    data->maxcpus = data->sockets * data->cores * data->threads * 2;
+    data->maxcpus = data->sockets * data->cores * data->threads;
 
     path = g_strdup_printf("cpu-plug/%s/device-add/%ux%ux%u&maxcpus=%u",
                            mname, data->sockets, data->cores,
@@ -229,7 +229,7 @@ static void add_s390x_test_case(const char *mname)
     data->sockets = 1;
     data->cores = 3;
     data->threads = 1;
-    data->maxcpus = data->sockets * data->cores * data->threads * 2;
+    data->maxcpus = data->sockets * data->cores * data->threads;
 
     data2 = g_memdup(data, sizeof(PlugTestData));
     data2->machine = g_strdup(data->machine);
diff --git a/vl.c b/vl.c
index b2a405f80f..31febe965c 100644
--- a/vl.c
+++ b/vl.c
@@ -1266,6 +1266,13 @@ static void smp_parse(QemuOpts *opts)
             exit(1);
         }
 
+        if (sockets * cores * threads != max_cpus) {
+            warn_report("Invalid CPU topology deprecated: "
+                        "sockets (%u) * cores (%u) * threads (%u) "
+                        "!= maxcpus (%u)",
+                        sockets, cores, threads, max_cpus);
+        }
+
         smp_cpus = cpus;
         smp_cores = cores;
         smp_threads = threads;
diff --git a/qemu-deprecated.texi b/qemu-deprecated.texi
index 11b870c5c1..5d2d7a3588 100644
--- a/qemu-deprecated.texi
+++ b/qemu-deprecated.texi
@@ -86,6 +86,18 @@ for these file types is 'host_cdrom' or 'host_device' as appropriate.
 The @option{name} parameter of the @option{-net} option is a synonym
 for the @option{id} parameter, which should now be used instead.
 
+@subsection -smp (invalid topologies) (since 3.1)
+
+CPU topology properties should describe whole machine topology including
+possible CPUs.
+
+However, historically it was possible to start QEMU with an incorrect topology
+where @math{@var{n} <= @var{sockets} * @var{cores} * @var{threads} < @var{maxcpus}},
+which could lead to an incorrect topology enumeration by the guest.
+Support for invalid topologies will be removed, the user must ensure
+topologies described with -smp include all possible cpus, i.e.
+  @math{@var{sockets} * @var{cores} * @var{threads} = @var{maxcpus}}.
+
 @section QEMU Machine Protocol (QMP) commands
 
 @subsection block-dirty-bitmap-add "autoload" parameter (since 2.12.0)
-- 
2.18.0.rc1.1.g3f1ff2140

