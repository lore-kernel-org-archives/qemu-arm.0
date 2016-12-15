Received: by 10.103.86.15 with SMTP id k15csp535299vsb;
        Wed, 14 Dec 2016 21:49:23 -0800 (PST)
X-Received: by 10.55.76.197 with SMTP id z188mr463040qka.184.1481780963862;
        Wed, 14 Dec 2016 21:49:23 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id s49si220255qta.264.2016.12.14.21.49.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 14 Dec 2016 21:49:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52454 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cHOuv-00075q-AR
	for alex.bennee@linaro.org; Thu, 15 Dec 2016 00:49:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49602)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alastair@au1.ibm.com>) id 1cHOuk-0006tF-FE
	for qemu-arm@nongnu.org; Thu, 15 Dec 2016 00:49:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alastair@au1.ibm.com>) id 1cHOug-0003Fk-Ff
	for qemu-arm@nongnu.org; Thu, 15 Dec 2016 00:49:10 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:55806
	helo=mx0a-001b2d01.pphosted.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alastair@au1.ibm.com>)
	id 1cHOug-0003Et-Ad
	for qemu-arm@nongnu.org; Thu, 15 Dec 2016 00:49:06 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
	uBF5md5v128729
	for <qemu-arm@nongnu.org>; Thu, 15 Dec 2016 00:49:05 -0500
Received: from e23smtp07.au.ibm.com (e23smtp07.au.ibm.com [202.81.31.140])
	by mx0b-001b2d01.pphosted.com with ESMTP id 27bn2hs6bs-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <qemu-arm@nongnu.org>; Thu, 15 Dec 2016 00:49:05 -0500
Received: from localhost
	by e23smtp07.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-arm@nongnu.org> from <alastair@au1.ibm.com>;
	Thu, 15 Dec 2016 15:49:02 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
	by e23smtp07.au.ibm.com (202.81.31.204) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Thu, 15 Dec 2016 15:48:59 +1000
Received: from d23relay06.au.ibm.com (d23relay06.au.ibm.com [9.185.63.219])
	by d23dlp03.au.ibm.com (Postfix) with ESMTP id EF1743578066;
	Thu, 15 Dec 2016 16:48:58 +1100 (EST)
Received: from d23av06.au.ibm.com (d23av06.au.ibm.com [9.190.235.151])
	by d23relay06.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	uBF5mwg251839104; Thu, 15 Dec 2016 16:48:58 +1100
Received: from d23av06.au.ibm.com (localhost [127.0.0.1])
	by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
	uBF5mwcB011215; Thu, 15 Dec 2016 16:48:58 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
	by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	uBF5mv1M011206; Thu, 15 Dec 2016 16:48:58 +1100
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id A4C06A0351;
	Thu, 15 Dec 2016 16:48:57 +1100 (AEDT)
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: qemu-arm@nongnu.org
Date: Thu, 15 Dec 2016 16:48:07 +1100
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20161215054812.12602-1-alastair@au1.ibm.com>
References: <20161215054812.12602-1-alastair@au1.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16121505-0044-0000-0000-000002124276
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16121505-0045-0000-0000-0000062F12DE
Message-Id: <20161215054812.12602-4-alastair@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-12-15_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	spamscore=0 suspectscore=1
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
	definitions=main-1612150093
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.158.5
Subject: [Qemu-arm] [PATCH v4 3/8] qtest: Support setting named GPIOs
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
	qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>,
	Alastair D'Silva <alastair@d-silva.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mdIH/qcMmU4O

From: Alastair D'Silva <alastair@d-silva.org>

Some devices change their behaviour based on the state of their input GPIO
lines.

This patch allows testing of the variable behaviour by providing facilities
for the test to set the state of these GPIO lines.

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 qtest.c          | 42 ++++++++++++++++++++++++++++++++++++++++++
 tests/libqtest.c |  7 +++++++
 tests/libqtest.h | 29 +++++++++++++++++++++++++++++
 3 files changed, 78 insertions(+)

diff --git a/qtest.c b/qtest.c
index ad7e215..a947892 100644
--- a/qtest.c
+++ b/qtest.c
@@ -165,6 +165,11 @@ static bool qtest_opened;
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
@@ -344,6 +349,43 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
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
diff --git a/tests/libqtest.c b/tests/libqtest.c
index a433c3b..a7cdd3b 100644
--- a/tests/libqtest.c
+++ b/tests/libqtest.c
@@ -988,3 +988,10 @@ bool qtest_big_endian(QTestState *s)
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
index 99b14b1..3063bc9 100644
--- a/tests/libqtest.h
+++ b/tests/libqtest.h
@@ -190,6 +190,20 @@ void qtest_irq_attach(QTestState *s, const char *name, int irq,
         void *opaque);
 
 /**
+ * qtest_irq_set:
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
@@ -656,6 +670,21 @@ static inline void irq_attach(const char *name, int irq,
 }
 
 /**
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

