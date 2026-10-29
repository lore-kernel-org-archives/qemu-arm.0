Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203F5606A31C
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Oct 2026 16:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YZ5s0kL2
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMSks-0005hW-ML; Thu, 29 Oct 2026 12:13:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xMSkm-0005cZ-Ct
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 12:13:25 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xMSkg-0000Xr-Dt
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 12:13:24 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4a20a37703bso19356315e9.1
 for <qemu-arm@nongnu.org>; Thu, 29 Oct 2026 09:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793290395; x=1793895195; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=DsZ3fg8a9/llmyBSpcJwT2G7xv6ARYkNazFQRvS0wFo=;
 b=YZ5s0kL2lGrQT59ApIl0o4+q6cyCnJoie+oH8iswrEIjcZOKNEZ7TRb3gB5K50CQbD
 qVVLPYdhS4BvXnrZvu3VSlxLkw0wkaEtv33N1bbG91YRi+xDZOH0qBgglHv05mex8Gsz
 olGW4f/2jOxSp30n7567Ge66GBIfcYrwkcO6lcZlnC7rQksxGbfQ6RTKXwmoBv+fYnJh
 0B+3mUwUxjt7ib7QLe0+af1WwM9s1H1oezl1cC7sbYqMqYMmOb7MRiYqCZJZwpR87Mi1
 76bA8njTnI7GDdlkqRqRL+YfDfTtB558Sp4yP8E3BZjSIpizle+rDLrTVr4uKjxVcCSM
 t6Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793290395; x=1793895195;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=DsZ3fg8a9/llmyBSpcJwT2G7xv6ARYkNazFQRvS0wFo=;
 b=Y9iPzhOimy8pjLKmCy9qCL/9CbsRlxcS2EDrVnOV+3CiUt2cPQ38MFJdJfTS4OyZSz
 gLN/KCfMRaEVXav1WgjrxH7lXhqswcvoLPQjZhrC9ji1Dw2rn3DbOzzHL7e8rIldVFCq
 bU32276elC2jI6hMp6LPtGwA4gCNYG8f4i0AI+CDGt3acH/qot5soFKzbuLS89/YjdOh
 yw7SrBeLJX2bhQAANoPUMa8BzWGG1G064TTOUi2XabtPVr5NRdqb+el15sEmmQpQMX+T
 gEYQWlEWAWthkOvPdz3qDev5xTLErhPiMEizLYpX/l3ddJDcwsH3k6OMzY/PeYAAQh/C
 0rFQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBygXVq3VdWf1lydImgWdimeLh17rG5ZsXBHlqQWNhRiHDhDS6FzSexjHW7drLMShsak2EkugnVAGQ==@nongnu.org
X-Gm-Message-State: AFq9FYKMqTwHL8auGZJDuMfNLASConOD5jZDKpt6ztTQ+ZdzuuV+6irT
 R3i3lsTmHtpAOHiZZlrtjbnL+X/59cegyah4PiXMW0lr2j4tMCH7chbogqlqT+C5Lxk=
X-Gm-Gg: AYBFou2ixgGSgeTf9iCPOTI9+iozmT6a97KutwqjoFiC/vLeSqQSv0YZCp4foXo3p3D
 ghdOfW6H24aaWLSvBbCzbpaN6c5bKhJAnGqrxE9Mm0kXzy2SWqFGwcSKhTvrislhDdA+PPo4Sh5
 6YveE427k3Eiu141GlxwgocDLWG6MUoGeuTDuSXTs7ttS0m/FpPXZXtDme/n+OhvSGib55awlta
 LDExy+2dqrY3W11Z7X05reo7Sj6YSuuEu5QUoaKFhs3HlgzUWigwFjKpduXiEEmiuQPiLv7Z+et
 /AvkO5rED+BY6eklW70HIjUgVuJzJs36/iS++RcAftdejoGWR5qCVbLS8OdGzlhWar1zY8MxUKi
 V0rBKkgpo1NW1HwogXQNeFlk0LTnlMIaoY12zohW9R4lRQJDR3mjlDDbH7wiIVps6lph7Dx5lk2
 bAxa/uKQ4rp35nzT4ukTpxvudnQLnLaEkLUKGRQYUUru4Wx0IMpul4LwoT7z/u5DsSNKue8RiTo
 yBxI5EUQgjPGikkcbeeVOZzJUwbduLMV/vFDuYfbwys1Xx+DCGwWtPMOPxTOTmVVxlG6e/8tDq1
 xgJYwCv1V+2WuoZDKOsySq/e7R0L
X-Received: by 2002:a05:600c:3b24:b0:49c:fa20:cbfd with SMTP id
 5b1f17b1804b1-4a966774f2dmr129732585e9.20.1793290394984; 
 Thu, 29 Oct 2026 09:13:14 -0700 (PDT)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4aa7fdb75e0sm74978355e9.10.2026.10.29.09.13.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2026 09:13:14 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 0F3675FBBB;
 Thu, 29 Oct 2026 16:13:12 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Chao Liu <chao.liu@processmission.com>,
 Tyrone Ting <kfting@nuvoton.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Hao Wu <wuhaotsh@google.com>, Halil Pasic <pasic@linux.ibm.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 8/8] target/arm: fix bcm2835 migration issue
Date: Thu, 29 Oct 2026 16:13:10 +0000
Message-ID: <20261029161310.2065290-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261029161310.2065290-1-alex.bennee@linaro.org>
References: <20261029161310.2065290-1-alex.bennee@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

We don't take care to force re-validation of the config on migration
leading to a crash when the defaults don't match the migration stream.
The other frame-buffers seem to do a similar thing in post-loads to
address this.

Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4668
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---

Bellow is an AI imported qtest-ification of the test case with the bug
report. I didn't think it was worth adding as a commit (and this will
be dropped when merged) but in case anyone wants to see how it looks
and think if it meets the bar for code legibility and understanding.

--8<---------------cut here---------------start------------->8---
new file    tests/qtest/bcm2835-fb-test.c
@@ -0,0 +1,109 @@
+/*
+ * QTest testcase for BCM2835 Framebuffer
+ *
+ * Copyright (c) 2026 QEMU contributors
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "libqtest.h"
+#include "migration/migration-qmp.h"
+
+#define MBOX_ADDR 0x3f00b8a0
+#define PROP_BUFFER_ADDR 0x30000000
+
+static void test_bcm2835_fb_resize_migrate(void)
+{
+    g_autofree char *tmpdir = g_dir_make_tmp("qtest-bcm2835-fb-XXXXXX", NULL);
+    g_autofree char *migfile = g_build_filename(tmpdir, "fb.state", NULL);
+    g_autofree char *mig_uri = g_strdup_printf("file:%s", migfile);
+    g_autofree char *ppm_path = g_build_filename(tmpdir, "out.ppm", NULL);
+    QTestState *src, *dst;
+    QDict *rsp;
+    FILE *f;
+    char header[64];
+
+    /* Start source machine */
+    src = qtest_init("-accel tcg -M raspi3b -m 1G -display none -S");
+
+    /*
+     * Configure 1024x768 framebuffer via property mailbox.
+     * Buffer at 0x30000000:
+     * - size: 0x30 (48 bytes)
+     * - request code: 0
+     * - tag: 0x00048003 (SET_PHYSICAL_WIDTH_HEIGHT)
+     * - val buf size: 8
+     * - req/resp indicator: 8
+     * - width: 1024
+     * - height: 768
+     * - end tag: 0
+     */
+    qtest_writel(src, PROP_BUFFER_ADDR + 0x00, 0x30);
+    qtest_writel(src, PROP_BUFFER_ADDR + 0x04, 0x00000000);
+    qtest_writel(src, PROP_BUFFER_ADDR + 0x08, 0x00048003);
+    qtest_writel(src, PROP_BUFFER_ADDR + 0x0c, 8);
+    qtest_writel(src, PROP_BUFFER_ADDR + 0x10, 8);
+    qtest_writel(src, PROP_BUFFER_ADDR + 0x14, 1024);
+    qtest_writel(src, PROP_BUFFER_ADDR + 0x18, 768);
+    qtest_writel(src, PROP_BUFFER_ADDR + 0x1c, 0x00000000);
+
+    /* Post buffer address ORed with property channel (8) to Mailbox 1 */
+    qtest_writel(src, MBOX_ADDR, PROP_BUFFER_ADDR | 8);
+
+    /* Migrate source to file */
+    qtest_qmp_assert_success(src,
+        "{ 'execute': 'migrate', 'arguments': { 'uri': %s } }", mig_uri);
+    wait_for_migration_complete(src);
+    qtest_quit(src);
+
+    /* Start destination and load state */
+    dst = qtest_initf("-accel tcg -M raspi3b -m 1G -display none -S "
+                      "-incoming %s", mig_uri);
+    wait_for_migration_complete(dst);
+
+    /* Request screendump from destination */
+    rsp = qtest_qmp(dst,
+        "{ 'execute': 'screendump', 'arguments': { 'filename': %s } }",
+        ppm_path);
+    if (qdict_haskey(rsp, "error")) {
+        QDict *error = qdict_get_qdict(rsp, "error");
+        const char *class = qdict_get_str(error, "class");
+        if (g_str_equal(class, "CommandNotFound")) {
+            /* Built without pixman */
+            qobject_unref(rsp);
+            qtest_quit(dst);
+            unlink(migfile);
+            rmdir(tmpdir);
+            g_test_skip("screendump command not available (without pixman)");
+            return;
+        }
+    }
+    g_assert(!qdict_haskey(rsp, "error"));
+    qobject_unref(rsp);
+
+    /* Check PPM header for 1024x768 resolution */
+    f = fopen(ppm_path, "r");
+    g_assert_nonnull(f);
+    g_assert_nonnull(fgets(header, sizeof(header), f));
+    g_assert_cmpstr(header, ==, "P6\n");
+    g_assert_nonnull(fgets(header, sizeof(header), f));
+    g_assert_cmpstr(header, ==, "1024 768\n");
+    fclose(f);
+
+    qtest_quit(dst);
+
+    unlink(ppm_path);
+    unlink(migfile);
+    rmdir(tmpdir);
+}
+
+int main(int argc, char **argv)
+{
+    g_test_init(&argc, &argv, NULL);
+
+    qtest_add_func("/bcm2835/fb/resize_migrate",
+                   test_bcm2835_fb_resize_migrate);
+
+    return g_test_run();
+}
modified    tests/qtest/meson.build
@@ -283,7 +283,7 @@ qtests_aarch64 = \
     ['tpm-tis-device-test', 'tpm-tis-device-swtpm-test'] : []) +                                         \
   (config_all_devices.has_key('CONFIG_XLNX_ZYNQMP_ARM') ? ['xlnx-can-test', 'fuzz-xlnx-dp-test'] : []) + \
   (config_all_devices.has_key('CONFIG_XLNX_VERSAL') ? ['xlnx-canfd-test', 'xlnx-versal-trng-test'] : []) + \
-  (config_all_devices.has_key('CONFIG_RASPI') ? ['bcm2835-dma-test', 'bcm2835-i2c-test', 'bcm2835-ic-test'] : []) +  \
+  (config_all_devices.has_key('CONFIG_RASPI') ? ['bcm2835-dma-test', 'bcm2835-fb-test', 'bcm2835-i2c-test', 'bcm2835-ic-test'] : []) +  \
   (config_all_accel.has_key('CONFIG_TCG') and                                            \
    config_all_devices.has_key('CONFIG_TPM_TIS_I2C') ? ['tpm-tis-i2c-test', 'tpm-tis-i2c-swtpm-test'] : []) + \
   (config_all_devices.has_key('CONFIG_ASPEED_SOC') ? qtests_aspeed64 : []) + \
@@ -424,6 +424,8 @@ qtests = {
   'ast2700-hace-test': [files('aspeed-hace-utils.c', 'ast2700-hace-test.c'),
                         crypto],
   'ast2700-smc-test': files('aspeed-smc-utils.c', 'ast2700-smc-test.c'),
+  'bcm2835-fb-test': files('migration/migration-qmp.c',
+                           'migration/migration-util.c'),
   'bios-tables-test': [io, 'boot-sector.c', 'acpi-utils.c', 'tpm-emu.c'],
   'cdrom-test': files('boot-sector.c'),
   'dbus-vmstate-test': files('migration/migration-qmp.c',
--8<---------------cut here---------------end--------------->8---
---
 hw/display/bcm2835_fb.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/display/bcm2835_fb.c b/hw/display/bcm2835_fb.c
index bd58f625fcd..c5731521b57 100644
--- a/hw/display/bcm2835_fb.c
+++ b/hw/display/bcm2835_fb.c
@@ -352,10 +352,21 @@ static const MemoryRegionOps bcm2835_fb_ops = {
     .valid.max_access_size = 4,
 };
 
+static int bcm2835_fb_post_load(void *opaque, int version_id)
+{
+    BCM2835FBState *s = opaque;
+
+    bcm2835_fb_validate_config(&s->config);
+    s->invalidate = true;
+    qemu_console_resize(s->con, s->config.xres, s->config.yres);
+    return 0;
+}
+
 static const VMStateDescription vmstate_bcm2835_fb = {
     .name = TYPE_BCM2835_FB,
     .version_id = 1,
     .minimum_version_id = 1,
+    .post_load = bcm2835_fb_post_load,
     .fields = (const VMStateField[]) {
         VMSTATE_BOOL(lock, BCM2835FBState),
         VMSTATE_BOOL(invalidate, BCM2835FBState),
-- 
2.47.3


