Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40E1606A324
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Nov 2026 10:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mebH8PTx
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xNpLq-0004of-WF; Mon, 02 Nov 2026 05:33:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lorandmarton.dev@gmail.com>)
 id 1xNpLm-0004o6-F9
 for qemu-arm@nongnu.org; Mon, 02 Nov 2026 05:33:15 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lorandmarton.dev@gmail.com>)
 id 1xNpLj-0007Fi-W4
 for qemu-arm@nongnu.org; Mon, 02 Nov 2026 05:33:14 -0500
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-48e00eee27dso1301607f8f.0
 for <qemu-arm@nongnu.org>; Mon, 02 Nov 2026 02:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793615590; x=1794220390; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=RczUIxregWa1M8gqPkz64zsf3SPjohpyF1RKCj4FQ7c=;
 b=mebH8PTx8u5edkKn4BvXbkRG1NJUfkeEpaaKNFoh5lDHCM/bmZ7qRspIubYvdUVBOB
 NSssbhS4KhsJzUWWPHB7op/dKE++nLt00R0qZ+jpQ5PeiUf6DkMfAR5rgGd3yU//sqxq
 N136it8tKjitwao13PApJjho9CQLeZ1isghggV3PxnvyzS4+q+bhmKO26nyd6KGYUCKq
 qASDw7ORzlbLmYog9uJ9qdtkvr2kQLIKrgy+oTUQf061lZWumDGCt029ZbKA02fMecDU
 3yMRhdXKQgf5gxk6MB/EOErJ18FHiMHFwsffSDLVO+WAaAefmoebx1njMlvznTRSLxrp
 iF2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793615590; x=1794220390;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=RczUIxregWa1M8gqPkz64zsf3SPjohpyF1RKCj4FQ7c=;
 b=B2pyUrt2EA/6yRgyngJClwMNSg6l1tNswv9/ZpOFsYsNnryiaYgHi3JJan5gZK/WMu
 tzo1rhKwagKncHuFG2XE/f8+MSBlJgbLHU9SpsZp5TV3yI53BMLurAzid19/GsDME+lk
 xp9sir2WFaQrPij40XMcTfp38qjXBu3BfIP+plNfXP4WvoKUVq54akIbPkWm1AUrTcrV
 nMgnK8sKcMYrV4QvdAnjMmWyD5DgYqb3KdPCnGCICPfh40K9GS5dHLJUC61ZatruMpyj
 6rvXeGfn8U2lVkNJk3zvcN04uB37evpHtn+kinbGUa0SflPkHmLKPNjoTytQ1XgCHJKk
 9sJA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzH/iWVG9jAtl/dayOn31AP5/4fBy+LbaEQUE2ks/sVPbk/Bg5VM5ZRp3R3G53+xotO6RwYIxAhdw==@nongnu.org
X-Gm-Message-State: APuU4Z9DfFhTlLGkXgVGbmyrxz3FYTwskse4y039dkFTZHRtULvWEgO8
 GRE/XInynYTy9YpOVYWU29nu0k7xLrAOIZJNvYzstUiPnFD14rdBYI40
X-Gm-Gg: AYBFou1HarpAz9+AFK5O/MHlVpsJsJkJK6ACaKDTh26pZuQmVnv17XNcDFNuECbeZL1
 9d6y+V62xWQlQ6xyNMJq7r2gnQByqg/8wEsrnl4nR248votpHP7fp1MUSVewHH4voBvBAXgMnRK
 Oc9YMAuDQDxkgytFV1M9IhBKhVhkQaZ3aPM2hawR3vK9vJbL6ycpe+AqMhMR6NuhoS9baTgk+Zi
 Tnj/ZkbhUV8Fy8l3nFbjM0jM08F2yCClVTKXlKk1GUXRbVNlLZFd/2ndOUYAReXahVWKgbojisW
 gWDi/8Spskw23ydW87iPDMOMy2wwq2L1KGyqXHpnaQZ/YNTUj347Sbn03guv+bnFk4zPociiQw5
 7opQtkkGM5I5CPXtq2p1PaoOmqHVyIydh+bruNqZC7BNFruSGSJS/LZ/vBJagcPtzABVRu3Nkzh
 w0JZONdiB/Aw+v8gDSX8vFv9KHQcUIY5+4jEVOgU8TgSVAk02n/L6OrXehPq7ZqtOlr6pQ5VZxd
 xOCPmTPLvL6aC5PxV/FqClUE0+vuHM14f/cWT2FeTp+b7wiqVxyf+peJ0jMPKKdEW0znQTcsecy
 Twri+iV6KcTIFo+8xMwksGp7VczVdedExTzXz4A1zU7+rw3cG92bVgriuUDs3IkzYNYte38cuCb
 FWQ==
X-Received: by 2002:a05:6000:40d9:b0:48e:202:6718 with SMTP id
 ffacd0b85a97d-48e6e3042camr22388501f8f.25.1793615590178; 
 Mon, 02 Nov 2026 02:33:10 -0800 (PST)
Received: from localhost.localdomain (email.telematik-zentrum.de.
 [87.138.218.176]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b9b54dsm18886774f8f.47.2026.11.02.02.33.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2026 02:33:09 -0800 (PST)
From: Lorand Marton <lorandmarton.dev@gmail.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, philmd@oss.qualcomm.com, qemu-arm@nongnu.org,
 farosas@suse.de, lvivier@redhat.com, pbonzini@redhat.com,
 alistair@alistair23.me
Subject: [PATCH 5/5] hw/misc/bcm2835_cprman: a PLL channel divider of 0
 divides by 256
Date: Mon,  2 Nov 2026 11:33:08 +0100
Message-ID: <6262fa90e0dcbb87c33ed61c53ef55e83335a45f.1793613972.git.lorandmarton.dev@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1793613972.bcm2835-fixes-v1.git.lorandmarton.dev@gmail.com>
References: <cover.1793613972.bcm2835-fixes-v1.git.lorandmarton.dev@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=lorandmarton.dev@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The 8-bit DIV field of an A2W PLL channel divides by 256 when it is 0,
as Linux clk-bcm2835 describes it (CLK_DIVIDER_MAX_AT_ZERO on the PLL
dividers: 2^width at 0). pll_channel_update() took 0 as 255, so the
channel and every clock fed from it ran 0.4% fast, and QEMU and the
guest disagreed on its rate.

Test the rate of PLLD_PER against PLLD with the divider at 0.

Fixes: 957458111280 ("hw/misc/bcm2835_cprman: implement PLL channels behaviour")
Signed-off-by: Lorand Marton <lorandmarton.dev@gmail.com>
---
 hw/misc/bcm2835_cprman.c          |  6 ++--
 tests/qtest/bcm2835-cprman-test.c | 49 +++++++++++++++++++++++++++++++
 tests/qtest/meson.build           |  3 +-
 3 files changed, 54 insertions(+), 4 deletions(-)
 create mode 100644 tests/qtest/bcm2835-cprman-test.c

diff --git a/hw/misc/bcm2835_cprman.c b/hw/misc/bcm2835_cprman.c
index 10cad07623..144e553432 100644
--- a/hw/misc/bcm2835_cprman.c
+++ b/hw/misc/bcm2835_cprman.c
@@ -184,10 +184,10 @@ static void pll_channel_update(CprmanPllChannelState *channel)
 
     if (!div) {
         /*
-         * It seems that when the divider value is 0, it is considered as
-         * being maximum by the hardware (see the Linux driver).
+         * A divider of 0 divides by 256, one more than the largest value
+         * the field holds (Linux clk-bcm2835 uses CLK_DIVIDER_MAX_AT_ZERO).
          */
-        div = R_A2W_PLLx_CHANNELy_DIV_MASK;
+        div = 1 << R_A2W_PLLx_CHANNELy_DIV_LENGTH;
     }
 
     /* Some channels have an additional fixed divider */
diff --git a/tests/qtest/bcm2835-cprman-test.c b/tests/qtest/bcm2835-cprman-test.c
new file mode 100644
index 0000000000..49a5245639
--- /dev/null
+++ b/tests/qtest/bcm2835-cprman-test.c
@@ -0,0 +1,49 @@
+/*
+ * QTest testcase for the BCM2835 clock manager
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "libqtest.h"
+#include "qobject/qdict.h"
+
+#define CPRMAN_BASE     0x3f101000
+#define A2W_PLLD_PER    0x1540
+#define A2W_PASSWORD    0x5a000000
+#define CPRMAN_PATH     "/machine/soc/peripherals/cprman"
+
+/* The frequency of a clock, from its period in 2^-32 ns */
+static uint64_t clock_hz(QTestState *qts, const char *path)
+{
+    QDict *rsp = qtest_qmp(qts, "{ 'execute': 'qom-get', 'arguments': "
+                           "{ 'path': %s, 'property': 'qtest-clock-period' } }",
+                           path);
+    uint64_t period = qdict_get_int(rsp, "return");
+
+    qobject_unref(rsp);
+    g_assert_cmpuint(period, !=, 0);
+    return (1000000000ULL << 32) / period;
+}
+
+/* A PLL channel divider of 0 divides by 256 */
+static void test_channel_div_zero(void)
+{
+    QTestState *qts = qtest_init("-M raspi3b");
+    uint32_t per = qtest_readl(qts, CPRMAN_BASE + A2W_PLLD_PER);
+    uint64_t pll_hz, chan_hz;
+
+    qtest_writel(qts, CPRMAN_BASE + A2W_PLLD_PER,
+                 A2W_PASSWORD | (per & ~0xffu));
+    pll_hz = clock_hz(qts, CPRMAN_PATH "/plld/out");
+    chan_hz = clock_hz(qts, CPRMAN_PATH "/plld-per/out");
+    g_assert_cmpuint((pll_hz + chan_hz / 2) / chan_hz, ==, 256);
+    qtest_quit(qts);
+}
+
+int main(int argc, char **argv)
+{
+    g_test_init(&argc, &argv, NULL);
+    qtest_add_func("/bcm2835-cprman/channel-div-zero", test_channel_div_zero);
+    return g_test_run();
+}
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 76448c5d4f..02fd0ca73a 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -286,7 +286,8 @@ qtests_aarch64 = \
   (config_all_devices.has_key('CONFIG_XLNX_ZYNQMP_ARM') ? ['xlnx-can-test', 'fuzz-xlnx-dp-test'] : []) + \
   (config_all_devices.has_key('CONFIG_XLNX_VERSAL') ? ['xlnx-canfd-test', 'xlnx-versal-trng-test'] : []) + \
   (config_all_devices.has_key('CONFIG_RASPI') ? ['bcm2835-dma-test', 'bcm2835-i2c-test', 'bcm2835-ic-test',
-                                                    'bcm2835-spi-test', 'bcm2835-systmr-test'] : []) +  \
+                                                    'bcm2835-cprman-test', 'bcm2835-spi-test',
+                                                    'bcm2835-systmr-test'] : []) +  \
   (config_all_accel.has_key('CONFIG_TCG') and                                            \
    config_all_devices.has_key('CONFIG_TPM_TIS_I2C') ? ['tpm-tis-i2c-test', 'tpm-tis-i2c-swtpm-test'] : []) + \
   (config_all_devices.has_key('CONFIG_ASPEED_SOC') ? qtests_aspeed64 : []) + \
-- 
2.56.0


