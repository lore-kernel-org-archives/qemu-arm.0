Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C1C5C5B56A
	for <qemu-arm@archiver.kernel.org>; Tue, 11 Aug 2026 16:39:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wtpOL-0004LJ-Qw; Tue, 11 Aug 2026 12:31:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1wtpOJ-00049X-Ll
 for qemu-arm@nongnu.org; Tue, 11 Aug 2026 12:31:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1wtpOF-0000tY-Pz
 for qemu-arm@nongnu.org; Tue, 11 Aug 2026 12:31:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1786465907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HZ8ftIcO5iuAdNMnG4DB9cRAIEo/ItmBethyre8VL6o=;
 b=it2XaULlLIAqzDQ1X3hmltuOPOTPoJBdsEG9qQOtNa+OksXUK4xxZWSM8FbxVR717LSVaE
 H+EUHBDBUOO8r1sLXVQYbtQrjjUl4lkuypiX34UQG4N3jAR0e3Hlr2HAcIEIlS2c9EzcXy
 GcQs49jXKrCW6Oqb32hk+HLBXE8w3VY=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-10-rNWBQuB1MUijTcDpxdwq3A-1; Tue,
 11 Aug 2026 12:31:43 -0400
X-MC-Unique: rNWBQuB1MUijTcDpxdwq3A-1
X-Mimecast-MFC-AGG-ID: rNWBQuB1MUijTcDpxdwq3A_1786465902
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 95E34195609F; Tue, 11 Aug 2026 16:31:42 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.44.48.12])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id B45B7195DF91; Tue, 11 Aug 2026 16:31:40 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Emmanuel Blot <emmanuel.blot@free.fr>, Glenn Miles <milesg@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 55/83] tests/qtest: pca9554: test absence of command
 auto-increment
Date: Tue, 11 Aug 2026 18:29:10 +0200
Message-ID: <20260811162938.1403216-56-clg@redhat.com>
In-Reply-To: <20260811162938.1403216-1-clg@redhat.com>
References: <20260811162938.1403216-1-clg@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: O6TYfvF3_iLHlvytFN32vIPPJTOGUHU6w_61TiG17eY_1786465902
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.102,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

From: Emmanuel Blot <emmanuel.blot@free.fr>

The PCA9554 selects one of its four registers with a single command byte
and does not auto-increment the register pointer, so a multi-byte I2C
transfer keeps addressing the register chosen by the command byte instead
of walking through the register map.

Add a test covering this: a two-byte read returns the addressed register
twice, and a two-byte write updates only that register, leaving its
neighbour untouched.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
Reviewed-by: Glenn Miles <milesg@linux.ibm.com>
Link: https://lore.kernel.org/qemu-devel/20260709-catalina-upgrade-v1-22-82a63fead90c@free.fr
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 tests/qtest/pca9554-test.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/tests/qtest/pca9554-test.c b/tests/qtest/pca9554-test.c
index 74237df611ea..0da1f3304b9d 100644
--- a/tests/qtest/pca9554-test.c
+++ b/tests/qtest/pca9554-test.c
@@ -102,6 +102,33 @@ static void test_polarity_with_output(void *obj, void *data,
     g_assert_cmphex(i2c_get8(dev, PCA9554_OUTPUT), ==, 0xA5);
 }
 
+/*
+ * The PCA9554 has no auto-increment: the command pointer never advances, so
+ * multi-byte reads and writes all target the addressed register.
+ */
+static void test_no_autoincrement(void *obj, void *data,
+                                  QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+    uint8_t buf[2];
+
+    /* Distinct values in adjacent registers. */
+    i2c_set8(dev, PCA9554_OUTPUT, 0xAA);
+    i2c_set8(dev, PCA9554_POLARITY, 0x33);
+
+    /* Two reads from OUTPUT return OUTPUT twice, not OUTPUT then POLARITY. */
+    i2c_read_block(dev, PCA9554_OUTPUT, buf, 2);
+    g_assert_cmphex(buf[0], ==, 0xAA);
+    g_assert_cmphex(buf[1], ==, 0xAA);
+
+    /* The second written byte overwrites OUTPUT; POLARITY is untouched. */
+    buf[0] = 0x12;
+    buf[1] = 0x34;
+    i2c_write_block(dev, PCA9554_OUTPUT, buf, 2);
+    g_assert_cmphex(i2c_get8(dev, PCA9554_OUTPUT), ==, 0x34);
+    g_assert_cmphex(i2c_get8(dev, PCA9554_POLARITY), ==, 0x33);
+}
+
 static void pca9554_register_nodes(void)
 {
     QOSGraphEdgeOptions opts = {
@@ -120,6 +147,7 @@ static void pca9554_register_nodes(void)
                  NULL);
     qos_add_test("polarity-with-output", "pca9554", test_polarity_with_output,
                  NULL);
+    qos_add_test("no-autoincrement", "pca9554", test_no_autoincrement, NULL);
 }
 
 libqos_init(pca9554_register_nodes);
-- 
2.55.0


