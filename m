Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C94606A326
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Nov 2026 09:30:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xOtnA-0001X0-JP; Thu, 05 Nov 2026 04:29:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xOtn8-0001Qp-UG
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 04:29:55 -0500
Received: from mail-pf1-f177.google.com ([209.85.210.177])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xOtn5-00074N-Nc
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 04:29:54 -0500
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-8a05da1cc1fso712112b3a.2
 for <qemu-arm@nongnu.org>; Thu, 05 Nov 2026 01:29:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793870990; x=1794475790;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=hRQau7jFOLMcW9cDld4PZy7QHA0r3DkmWSHU69Dv0ic=;
 b=PYeB33e608FlB47wPJzhWq4Lhex2rfshOlnfMUwxjJNYWcOu31YtnuEkgFnFaqjiyo
 PTKmDyRDHID11lp29dXLMbdJNsPkNL2C3GNdunVDDadCIMA9TMIvJOKJsEYiU2PKH+J3
 IKxXuYLTMEbIaiJ6hwrXtrC5D61Z2Qu8tpPhvW3h9S1+DoH+wQnMR6AXGqhww0PftjRU
 gc0ySumQa6QcLmMUA2r3qR8OmTz7pxj9npxgPV3Wg6RzMi1P30JMQK3vS7d/ZxhC3Kvx
 LqyFOpBG/DFKScIHCRPVrslp5NVwg9p2PhGyjNi+E1Dddy5KgsnnR87QXvyXbxc4v3sc
 HnIw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwAXXhCAT12EV96jnjzndTDUF4euBDHq6YaNRwP3+3jeCrDULe5QcA2UcGuYEcf9X8n59rqaFeESQ==@nongnu.org
X-Gm-Message-State: APuU4Z8sA2eIs1+HVwS+FnWqwrUrJzLsRiRA+KTMHdUQei3W9ujLQnHx
 qowmQeJFY6Qb3njv7ZiTt6VXDVaBdjzCoh+3EBk5tyrhgXlUTscItyR3
X-Gm-Gg: AYBFou0En1I8sZxr627YNydA/ke+0xpLIAI48v6B9Gtk1rt5jCDx0MhQDqe8XbQ/IGA
 czP5t81OB0KuHzwYniIV3lKHYe+ZdMZh2v8weRYd+jIpAAD5HxVZO/N8K6pDINBZYMUTT+iqtFX
 wgs5eI8WcAx7tem33xPg8R1aJw/pzShGytcenzFTuz32s1yFjmNAC3Z1MlLoB1W1fgbvX5nGlUq
 Mk1ymt02NTVekreBiNJtNRE1OWl011jf1BnEhFl9UqMJCvMBapooEW2M+woZgPebR/f3W9LNhEq
 hEBp/+JSIKeSTRs+Tch4e1mUzepKA4xllygmqXTbP77oEML4TfhWQ3XYizX20bmnWnsh7FkLvtR
 iqvcyuFL7qtbamzSvNMdE6XB5Fxzlo+2nBI0NeAp+qi33lnc0qTgLNcqB9YpwHojXsVqo4R07Jv
 PruUwmNJ/51vut1XvPGlNe3AEXON65ocX4VG+gv4uoLKqc0A0ZNtxX4ow9SYBFvzu/XC2S2iM65
 /3jsjOU7Tf+iKMrxaqzjzFVBonko9uUmx3+nbqMtt0oq0TUQOi+erA4IVQL0rd0Ixy/V25Rx5W9
 /kTbGfc45Au3YdrtxMCaiTacBj52qPt+BTM7bzdyydrcPrVHbRHKqAYyqZ22ToHoAti+PUyWCFY
 xnGIia9Fh3QmHnElx+uH1UA==
X-Received: by 2002:a05:6a00:10d4:b0:89f:28c3:aab0 with SMTP id
 d2e1a72fcca58-8a9bf61f237mr15188701b3a.40.1793870989976; 
 Thu, 05 Nov 2026 01:29:49 -0800 (PST)
Received: from localhost (118-163-122-149.hinet-ip.hinet.net.
 [118.163.122.149]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8b09af91d24sm1759590b3a.29.2026.11.05.01.29.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2026 01:29:49 -0800 (PST)
Date: Thu, 05 Nov 2026 17:25:55 +0800
Subject: [PATCH 16/16] tests/qtest: tmp421: cover the register form of the
 migration stream
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-sensor-tmp421-v1-16-c46853f5e1f0@free.fr>
References: <20261105-sensor-tmp421-v1-0-c46853f5e1f0@free.fr>
In-Reply-To: <20261105-sensor-tmp421-v1-0-c46853f5e1f0@free.fr>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, eblot@meta.com, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 qemu-arm@nongnu.org, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Emmanuel Blot <emmanuel.blot@free.fr>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793870743; l=3815;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=KCKssRn/w/mRE8Rh274RLtAfGbpNnr2ePuT78VSY79A=;
 b=wGcVW44wmQZo44v/sifNQgtTmtsxOF5xTpY9gQkXfi3zHF9TFfOoUE+KOHd/qb9jHe5uWuUih
 M6AgtLtVbpWBMgv44AYk4XnLhBsqyd/KnwUTi92MdQdcrEC7Wa7fB+c
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.210.177; envelope-from=eblot.ml@gmail.com;
 helo=mail-pf1-f177.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-to:  Emmanuel Blot <emmanuel.blot@free.fr>
From:  Emmanuel Blot via <qemu-arm@nongnu.org>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A stream with no measurement subsection has the shape of every stream
written before that subsection existed; loading one exercises the
conversion back from the register form. The temperature is picked so
that form reproduces it exactly, and picked in the extended range,
where the top register bit is part of the value rather than a sign.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 tests/qtest/tmp421-test.c | 66 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/tests/qtest/tmp421-test.c b/tests/qtest/tmp421-test.c
index 6c5332211b..5be2abc822 100644
--- a/tests/qtest/tmp421-test.c
+++ b/tests/qtest/tmp421-test.c
@@ -8,6 +8,8 @@
 
 #include "qemu/osdep.h"
 
+#include <glib/gstdio.h>
+#include "libqtest.h"
 #include "libqtest-single.h"
 #include "libqos/qgraph.h"
 #include "libqos/i2c.h"
@@ -224,6 +226,69 @@ static void test_n_correct(void *obj, void *data, QGuestAllocator *alloc)
     }
 }
 
+static int qtest_get_temperature(QTestState *qts, const char *id,
+                                 unsigned channel)
+{
+    g_autofree char *prop = g_strdup_printf("temperature%u", channel);
+    QDict *response;
+    int ret;
+
+    response = qtest_qmp(qts, "{ 'execute': 'qom-get', 'arguments': "
+                         "{ 'path': %s, 'property': %s } }", id, prop);
+    g_assert(qdict_haskey(response, "return"));
+    ret = qdict_get_int(response, "return");
+    qobject_unref(response);
+    return ret;
+}
+
+/*
+ * A stream written before the measurement was held in millidegrees carries
+ * only the register form. The subsection holding the measurement is left out
+ * whenever that form can reproduce it, so an exactly representable extended
+ * range temperature -- whose register value has its top bit set, and is not
+ * a negative number -- travels the same path such a stream takes.
+ */
+static void test_migration(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *i2cdev = obj;
+    g_autofree char *tmpfs = NULL;
+    g_autofree char *mig_path = NULL;
+    g_autofree char *uri = NULL;
+    GString *dest_cmdline;
+    GError *err = NULL;
+    QTestState *to;
+    QDict *rsp;
+
+    tmpfs = g_dir_make_tmp("tmp421-test-XXXXXX", &err);
+    g_assert_no_error(err);
+    g_assert(tmpfs);
+
+    mig_path = g_strdup_printf("%s/socket.mig", tmpfs);
+    uri = g_strdup_printf("unix:%s", mig_path);
+
+    i2c_set8(i2cdev, TMP421_CONFIG_REG_1, TMP421_CONFIG_RANGE);
+    set_temperature(TMP421_TEST_ID, 0, 100000);
+    g_assert_cmphex(i2c_get16(i2cdev, TMP421_TEMP_MSB0), ==, 0xA400);
+
+    dest_cmdline = g_string_new(qos_get_current_command_line());
+    g_string_append_printf(dest_cmdline, " -incoming %s", uri);
+    to = qtest_init(dest_cmdline->str);
+
+    rsp = qmp("{ 'execute': 'migrate', 'arguments': { 'uri': %s } }", uri);
+    g_assert(qdict_haskey(rsp, "return"));
+    qobject_unref(rsp);
+
+    qmp_eventwait("STOP");
+    qtest_qmp_eventwait(to, "RESUME");
+
+    g_assert_cmpint(qtest_get_temperature(to, TMP421_TEST_ID, 0), ==, 100000);
+
+    qtest_quit(to);
+    g_unlink(mig_path);
+    g_rmdir(tmpfs);
+    g_string_free(dest_cmdline, true);
+}
+
 static void tmp421_register_node(const TMP421Variant *var, const char *type,
                                  uint8_t addr)
 {
@@ -255,6 +320,7 @@ static void tmp421_register_nodes(void)
     /* Temperature encoding is variant-independent; exercise it once. */
     qos_add_test("temperature", "tmp421", test_temperature, NULL);
     qos_add_test("range-saturation", "tmp421", test_range_saturation, NULL);
+    qos_add_test("migration", "tmp421", test_migration, NULL);
 }
 
 libqos_init(tmp421_register_nodes);

-- 
2.53.0-Meta


