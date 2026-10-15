Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFFFFCC6B33
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Oct 2026 15:16:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHN8p-0002Xf-DZ; Thu, 15 Oct 2026 11:13:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHN8Z-0002Kl-Df
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 11:12:57 -0400
Received: from mail-wm1-f41.google.com ([209.85.128.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHN8W-00023s-P3
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 11:12:55 -0400
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4a1635f7c89so22615435e9.2
 for <qemu-arm@nongnu.org>; Thu, 15 Oct 2026 08:12:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792077171; x=1792681971;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=6k06hv6TlsIcMhbYVsrL8kcfuMSG0eFTZp4YScCwOos=;
 b=ixUSiO9IHsHVT64GbvRoHOjpSdbp2gsB9GMfVaXBY3YzerOd5CPLmpf6DMSe9NfKBX
 fSsJew67EJB4TTTBqj3WfFcgpZ+8wKd01s7Wd6I0Cf+DNLjSE79M9FJCfoIBH2Uv4Sd6
 aJOiQJpZbMBO02B40NU+UyRqlFRI+kNxRM0iYon6s+j7DkNAy1oiZvEYr6wA2+iWQ9jv
 DQBie4yGSlOSbrPtA/Wm+Z0mjeNywX8yRLZMSqXO4ALcem87UuEz1CjocK8JFZ1uQDzx
 PMQpprTf8bk4r8h5kGs837+pQK/hubiN0Q0oGxUN00RK7JDEfJeqmVXvzLpLZea1XGcz
 Oq8w==
X-Forwarded-Encrypted: i=1;
 AKwUvBw8SuuNIaL12GGE9Mg4885wmpzHDKlKRjC9FfBHXaqsVvIBmzqDBzRMFlLyuFYqG8G44TyCtA8r1w==@nongnu.org
X-Gm-Message-State: AFq9FYKGd1bagT+nrJIRODxisAWYOusa5wmI4qm9P9m12XtZ3aTYz/oE
 P5gPSDLkrazJeQXu6V1hOPrCtxpJNY84gkKISOtg+cD1pBI77/R2mPYx
X-Gm-Gg: AYBFou17fK5SiKI4IBHcpmLWyaZJ2+Lgg+aHnDkvQsvJbc1kfsYBmtDUW8pp95TIyaQ
 K+Ur/iIpFgemirbx4Y/kbCZrNjtwQWYDtLEBLghNT6Tv3QPK0zoTGDDiXoQSgA7GFLUBduGs22t
 QwJpjmqbfeh3ymf0ENMgxSV8/ruSjDrlbVe9gS7Fy1d3frVJmwAlFVbqSZrNwT2UdP+2RHmGYzk
 BmCsYvuSkTQIsSrIMrR8eCFcMidqadz9iHkOQF6nGfh91wA9Prw6v3DwIMeGKdLYfUFEQ7MxORu
 jkGdSEyxYFBC1Cn2L07tprvHL1vnrtH6oHB8Lv6KkfjkWLkxnLBIRA15LFfuLm1mSafcpoTdSie
 eKtn9hy0CfBRyLQ3/RqvsOjET8dQW+65nXnFBGLv0lyaAoAHZTBSEIvh3l/WTuXUga7RJVmvUyQ
 4UUxFIhi09fMN4hAltHUaI5bXUfDSDxRYhX6piR0tqkqz2idRXTxELi8SqnMvfQJSmaq1tnj1zV
 OYNwhrhlZDOtRzjOpg6rGWifsCmJSb1oT2TvLr76AloCw==
X-Received: by 2002:a05:600c:6099:b0:4a0:1feb:de6a with SMTP id
 5b1f17b1804b1-4a18e4e7a85mr371149685e9.30.1792077171229; 
 Thu, 15 Oct 2026 08:12:51 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1bd99faf3sm76622495e9.14.2026.10.15.08.12.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 08:12:48 -0700 (PDT)
Date: Thu, 15 Oct 2026 13:57:58 +0200
Subject: [PATCH 20/22] tests/qtest: tmp105: cover the Config low byte
 across a migration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-bmc-clemente-v1-20-bf591886b5b6@free.fr>
References: <20261015-bmc-clemente-v1-0-bf591886b5b6@free.fr>
In-Reply-To: <20261015-bmc-clemente-v1-0-bf591886b5b6@free.fr>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 qemu-arm@nongnu.org, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Emmanuel Blot <emmanuel.blot@free.fr>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792065466; l=2836;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=/7gRDZ/TdLiUJ6z39Z25ycHPu6U7M4Ou+l3WbL5867o=;
 b=9HVCBw159TJbTvpleCFrLX+akvmA+h1eaopoTBm07rOrob51X2cIHupH8BTAENgdgD6uUhl08
 9vXE+8kPVmTCZXb+epYPi/YVlIZ3NZMxO19BtIfixAw4cX9ReOnc10R
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.128.41; envelope-from=eblot.ml@gmail.com;
 helo=mail-wm1-f41.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
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
Reply-to:  Emmanuel Blot <emmanuel.blot@free.fr>
From:  Emmanuel Blot via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

The byte rides in an optional subsection, so a dropped field or a wrong
needed() gate would have gone unnoticed.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 tests/qtest/tmp105-test.c | 50 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/tests/qtest/tmp105-test.c b/tests/qtest/tmp105-test.c
index b21deb1128..1bb7dcc265 100644
--- a/tests/qtest/tmp105-test.c
+++ b/tests/qtest/tmp105-test.c
@@ -9,6 +9,9 @@
 
 #include "qemu/osdep.h"
 
+#include <glib/gstdio.h>
+
+#include "libqtest.h"
 #include "libqtest-single.h"
 #include "libqos/qgraph.h"
 #include "libqos/i2c.h"
@@ -468,6 +471,52 @@ static void test_tmp1075_config_width(void *obj, void *data,
     g_assert_cmphex(i2c_get8(i2cdev, TMP105_REG_CONFIG), ==, 0x00);
 }
 
+/* The low byte of the Config register rides in an optional subsection. */
+static void test_tmp1075_migration(void *obj, void *data,
+                                   QGuestAllocator *alloc)
+{
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+    g_autofree char *tmpfs = NULL;
+    g_autofree char *mig_path = NULL;
+    g_autofree char *uri = NULL;
+    GString *dest_cmdline;
+    GError *err = NULL;
+    QTestState *from, *to;
+    QDict *rsp;
+
+    tmpfs = g_dir_make_tmp("tmp1075-test-XXXXXX", &err);
+    g_assert_no_error(err);
+    g_assert(tmpfs);
+
+    mig_path = g_strdup_printf("%s/socket.mig", tmpfs);
+    uri = g_strdup_printf("unix:%s", mig_path);
+
+    /* A low byte away from its reset value, so the subsection is emitted. */
+    i2c_set16(i2cdev, TMP105_REG_CONFIG, 0x605a);
+    g_assert_cmphex(i2c_get16(i2cdev, TMP105_REG_CONFIG), ==, 0x605a);
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
+    from = i2cdev->bus->qts;
+    i2cdev->bus->qts = to;
+    g_assert_cmphex(i2c_get16(i2cdev, TMP105_REG_CONFIG), ==, 0x605a);
+    i2cdev->bus->qts = from;
+
+    qtest_quit(to);
+    g_unlink(mig_path);
+    g_rmdir(tmpfs);
+    g_string_free(dest_cmdline, true);
+}
+
 static void tmp105_register_nodes(void)
 {
     QOSGraphEdgeOptions opts = {
@@ -536,5 +585,6 @@ static void tmp105_register_nodes(void)
 
     qos_add_test("device-id", "tmp1075", test_tmp1075_device_id, NULL);
     qos_add_test("config-width", "tmp1075", test_tmp1075_config_width, NULL);
+    qos_add_test("migration", "tmp1075", test_tmp1075_migration, NULL);
 }
 libqos_init(tmp105_register_nodes);

-- 
2.53.0-Meta


