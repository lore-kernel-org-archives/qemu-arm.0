Received: by 10.28.91.67 with SMTP id p64csp2395063wmb;
        Mon, 19 Mar 2018 02:40:01 -0700 (PDT)
X-Google-Smtp-Source: AG47ELvMc/yAaZwY5/JPV3bYYi0GSsUC5zEhGEqOPsp2fmxTpQNy07podMOW/QvZgZJm7fjjVsv3
X-Received: by 10.55.198.3 with SMTP id b3mr16029992qkj.196.1521452401436;
        Mon, 19 Mar 2018 02:40:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521452401; cv=none;
        d=google.com; s=arc-20160816;
        b=a1Ug2iejv+myoFZ+5Y5S7eU74GHs5i3dpenJ0E6zzPPhSyiHpiXpDyhTjMY13NFX8k
         i9luxvq7HP0jYH2zFnaqG8WDkrrStFpcvVPkcCYnSq8jj7qFkL39JxIYf8Rz+5fLVuB1
         7tjoTbWJRcHskGKA8UEBOVX5o1+6BFmFBNx0lzIK1z2ijkKh4Vw1vrN3ZWbdDL3aku0K
         YZpjbIoZoqI047FI9GXjPXJ3Ggm7Xjx5rB2uDqiDYpSon7nnl+gnrGk7Pi0aNQGQRdpD
         RiWcFs3x0cUveV3U1E1QqLNcf8rEQh71w7m3enRYB7ksNYzdlauSWmvlM2Q5k7HrQvBg
         HoFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=Hu9FlEIQh8+tc6RjAIAk2erWCmi3T89Jn+eK5uM3bm0=;
        b=qV53BJjNoMbTkan26M1f+ROIUk4CxIVIlVPHkzxNIEIybzgE6R3nZBVInoh1/zBjuX
         BbKRAXB6APTfbyF4dPNfnRSCbvXKH43LAZ2fJWf/HEUZvgP54zUI+6VNx9Zmte+E2hAD
         y2W6T7AQ2jHkf63KNFseZue0b3tc4WI0y3XpXHYoDFzeL3NttHd/1Sy5jw13yARsz6Wg
         /d5nluIRTQTJTrtMOFHfCsrFmlg8F8VJfLQ6wYsx0Niq5LB9i9GNMEddZG7MZy/+1t0o
         ErESnfTlOM6RhvbyWldG2UjSmx62yVBOMdOry0Wn8XcQzrYesqCs0AwSr6G0Da2l60eu
         dVBw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m8si161070qth.467.2018.03.19.02.40.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 19 Mar 2018 02:40:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40991 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1exrGq-00045d-Vb
	for alex.bennee@linaro.org; Mon, 19 Mar 2018 05:40:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33813)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1exrGf-00045J-Jt
	for qemu-arm@nongnu.org; Mon, 19 Mar 2018 05:39:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1exrGc-00048y-Es
	for qemu-arm@nongnu.org; Mon, 19 Mar 2018 05:39:49 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:46590 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1exrGc-00048R-9i; Mon, 19 Mar 2018 05:39:46 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 01F54EBFE9;
	Mon, 19 Mar 2018 09:39:42 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-155.ams2.redhat.com
	[10.36.116.155])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2B5DD2166BAE;
	Mon, 19 Mar 2018 09:39:36 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Date: Mon, 19 Mar 2018 10:39:36 +0100
Message-Id: <1521452376-25099-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Mon, 19 Mar 2018 09:39:42 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Mon, 19 Mar 2018 09:39:42 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC PATCH] tests/device-introspect: Test devices with
 all machines, not only with "none"
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
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RCSHp3trH95T

Many device introspection crashes only happen if you are using a
certain machine, e.g.:

$ ppc-softmmu/qemu-system-ppc -S -M ref405ep,accel=qtest -qmp stdio
{"QMP": {"version": {"qemu": {"micro": 50, "minor": 11, "major": 2},
 "package": "build-all"}, "capabilities": []}}
{ 'execute': 'qmp_capabilities' }
{"return": {}}
{ 'execute': 'device-list-properties',
  'arguments': {'typename': 'macio-newworld'}}
Unexpected error in qemu_chr_fe_init() at chardev/char-fe.c:222:
Device 'serial0' is in use
Aborted (core dumped)

To be able to catch these problems, let's extend the device-introspect
test to check the devices on all machine types. Since this is a rather
slow operation, the test is only run in "SPEED=slow" mode.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 In case someone wants to help with creating some bug fix patches
 during the QEMU hard freeze phase: This test can now be used to
 trigger lots of introspection bugs that we were not aware of yet.
 I think most of the bugs are due to wrong handling of instance_init
 vs. realize functions.
 For Example:
 $ make check-qtest SPEED=slow
  GTESTER check-qtest-aarch64
 RAMBlock "integrator.flash" already registered, abort!
 Broken pipe
 GTester: last random seed: R02S8e52709605790d290d2c8261cefb8b0e
 Unsupported NIC model: lan9118
 Broken pipe
 GTester: last random seed: R02S326d4ea43bfce860ebe2d554192540f7
 qemu-system-aarch64: warning: nic lan9118.0 has no peer
 Unsupported NIC model: smc91c111
 Broken pipe
 GTester: last random seed: R02Se9783b450806f350a14e757b175e3dc4
 qemu-system-aarch64: missing SecureDigital device
 Broken pipe
 GTester: last random seed: R02S5c718b8f4c4fd48a358de8daafcf1b6f
 qemu-system-aarch64: warning: nic lan9118.0 has no peer
 Unexpected error in error_set_from_qdev_prop_error() at hw/core/qdev-properties.c:1095:
 Property 'allwinner-emac.netdev' can't take value 'hub0port0', it's in use
 Broken pipe
 GTester: last random seed: R02S597848ddcfdc76a695a946a9d4e50146
 qemu-system-aarch64: warning: nic ftgmac100.0 has no peer
 GTester: last random seed: R02Seea0f0b769a2161fa53a50479fd68d84
 qemu-system-aarch64: warning: nic imx.fec.0 has no peer
 qemu-system-aarch64: missing SecureDigital device
 Broken pipe
 GTester: last random seed: R02S9c2d3e34427162e7a56aa4ac859f1a6b
 Unsupported NIC model: virtio-net-pci
 Broken pipe
 GTester: last random seed: R02Sd61c0e9ed52d50a17c784213e5c6590c
 Unsupported NIC model: mv88w8618
 Broken pipe
 GTester: last random seed: R02Sbfaecfe58dd643f2faca218e3051d464
 qemu-system-aarch64: warning: nic mv88w8618_eth.0 has no peer
 qemu-system-aarch64: missing SecureDigital device
 Broken pipe
 Unsupported NIC model: xgmac
 Broken pipe
 GTester: last random seed: R02Sc61e65e884e364652c3a0c4190023565
 fsl,imx7: Only 2 CPUs are supported (4 requested)
 Broken pipe
 GTester: last random seed: R02S0cfda43bc17e3e052d5a994b2c96457b
 etc.

 tests/device-introspect-test.c | 33 ++++++++++++++++++++++++++++++---
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/tests/device-introspect-test.c b/tests/device-introspect-test.c
index b80058f..a9b9cf7 100644
--- a/tests/device-introspect-test.c
+++ b/tests/device-introspect-test.c
@@ -105,6 +105,8 @@ static void test_one_device(const char *type)
     QDict *resp;
     char *help, *qom_tree;
 
+    g_debug("Testing device '%s'", type);
+
     resp = qmp("{'execute': 'device-list-properties',"
                " 'arguments': {'typename': %s}}",
                type);
@@ -206,13 +208,13 @@ static void test_device_intro_abstract(void)
     qtest_end();
 }
 
-static void test_device_intro_concrete(void)
+static void test_device_intro_concrete(gconstpointer args)
 {
     QList *types;
     QListEntry *entry;
     const char *type;
 
-    qtest_start(common_args);
+    qtest_start((const char *)args);
     types = device_type_list(false);
 
     QLIST_FOREACH_ENTRY(types, entry) {
@@ -224,6 +226,7 @@ static void test_device_intro_concrete(void)
 
     QDECREF(types);
     qtest_end();
+    g_free((void *)args);
 }
 
 static void test_abstract_interfaces(void)
@@ -260,6 +263,26 @@ static void test_abstract_interfaces(void)
     qtest_end();
 }
 
+static void add_machine_test_case(const char *mname)
+{
+    char *path, *args;
+
+    /* Ignore blacklisted machines */
+    if (g_str_equal("xenfv", mname) || g_str_equal("xenpv", mname)) {
+        return;
+    }
+
+    path = g_strdup_printf("device/introspect/concrete-defaults-%s", mname);
+    args = g_strdup_printf("-machine %s", mname);
+    qtest_add_data_func(path, args, test_device_intro_concrete);
+    g_free(path);
+
+    path = g_strdup_printf("device/introspect/concrete-nodefaults-%s", mname);
+    args = g_strdup_printf("-nodefaults -machine %s", mname);
+    qtest_add_data_func(path, args, test_device_intro_concrete);
+    g_free(path);
+}
+
 int main(int argc, char **argv)
 {
     g_test_init(&argc, &argv, NULL);
@@ -268,8 +291,12 @@ int main(int argc, char **argv)
     qtest_add_func("device/introspect/list-fields", test_qom_list_fields);
     qtest_add_func("device/introspect/none", test_device_intro_none);
     qtest_add_func("device/introspect/abstract", test_device_intro_abstract);
-    qtest_add_func("device/introspect/concrete", test_device_intro_concrete);
     qtest_add_func("device/introspect/abstract-interfaces", test_abstract_interfaces);
+    qtest_add_data_func("device/introspect/concrete", g_strdup(common_args),
+                        test_device_intro_concrete);
+    if (g_test_slow()) {
+        qtest_cb_for_every_machine(add_machine_test_case);
+    }
 
     return g_test_run();
 }
-- 
1.8.3.1

