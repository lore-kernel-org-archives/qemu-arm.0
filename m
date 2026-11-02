Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B14606A324
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Nov 2026 10:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mu27C7v3
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xNpaA-0001QE-1b; Mon, 02 Nov 2026 05:48:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lorandmarton.dev@gmail.com>)
 id 1xNpa7-0001PZ-T0
 for qemu-arm@nongnu.org; Mon, 02 Nov 2026 05:48:03 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lorandmarton.dev@gmail.com>)
 id 1xNpa4-0008Tw-5d
 for qemu-arm@nongnu.org; Mon, 02 Nov 2026 05:48:03 -0500
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-48e4831c028so2538320f8f.0
 for <qemu-arm@nongnu.org>; Mon, 02 Nov 2026 02:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793616478; x=1794221278; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/cFPK9HEiAOzGkCoUazLe0BNTzAQy/CEgRN+RGdETGg=;
 b=Mu27C7v3y0lFz4WT+f+/dDcoLWscagbe7dLgh2UzPfrK7gburcxHDZqEm+qu3+F3/A
 cG/U7EFOCqzmwjpSoDagj4SwdrD/lierjVQ9H/BxCbrIq2mMX2HeJjKtFMWy/s8AAGJU
 8YfLXJhNo6DEOaVlhIMrulH4e3caXwt/Mf/HZnbzo4h/Cqp/GweQISR/0hwNcOC5WZCo
 f2gtvFyWupPnkkNVu4UkG6Bh3TVpraB7AZltAoFDInRnXHbKCQp6Scjq4OCTH8dRgXwL
 ntv90MYQGmneBML+d2hcZ4ij4I2uKs5IPIYxgQV5OHKBIsXwEvnNtDQ0vWFCHf6XQ5uY
 ZF+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793616478; x=1794221278;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=/cFPK9HEiAOzGkCoUazLe0BNTzAQy/CEgRN+RGdETGg=;
 b=VcKHAfRjAVfDHXxVbCZKQQ/c0jhe1yw9zDcAWssBZUnPm+acx/zg0beKzNE9A8bJbQ
 IBXmt5NqngP3ARpEuKxXu4jTLY/RakwjtxguFHQ8KCjaNWjK4oV7GuDkiDRDcT31WcSQ
 hFf8Ac5novxSuHWWnnPsfNKDeOkmAbh6YURuSnHNqjp3QPVp5BXtN1P5SSN1o+MejbVe
 l+xkg+S/KnDQVlUqmPHkTrRtKKHzzTpDk4TyIC/z/mXFpGo/MdkySWAdJmfKVqM+b79Q
 5QaC/bMHpcI2gs0ff4vKYW5AToTG1CKs1rMttds2VaLO1mV91P9MaTd2K0D8l7XwlXQW
 qkOw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzXgLeCpuPsQklbGK/0whIdh8DfIYMBpwHlxC99gmE8p/2MOnA5DaIQLM7mbJ9ky4RA5OdW/7cAvw==@nongnu.org
X-Gm-Message-State: APuU4Z+mJo/9mydvdlee6WRS7sj248l75VEm9rF/5rblk80d8/r6PYMi
 RTUubD7ox3tbzyBuRzY9HIXP/QJe+vDgeiW78xI8jNqyZf0EmUL1Aear
X-Gm-Gg: AYBFou18HyP8C5hFlqiRgiKvIY6ajuXsT+GEKANJTCCAnsJ0uf0lN50dvv3kKiphClj
 n33AUdMe4GgQZLN7xLux5/V21rKkh3VJMiHtfj4YE8UsR8oR6ZY1m/V8v6L0+jN9fOmY9n1R9Q0
 UoRB+tsCujguZ4AHeeYPDBk+mT+NhDzW0hM12JpvqoC2V7dVF2qQS0HmTj4tM0fYZAIVtnrJ9J1
 Tckrb+eTrZc7oTI/HJUYxgd2WnxOZz0wjpy7gw0zYarEQsMfnEzzKAox/SDXZ9BmhmRn87pHKMm
 6fBPi1RJ77LA3PV+C/kSmuyvOnFY/xJrv0Uq2QRIpEfAi0SOaQgqEXoyvueXcnvxN4HfUEd9fTh
 4V21i5Da0pSrysJBHtEuNcdWsdkKk9f3T4G+4n6syxs9MJrNe8P0DItAbJUxsLOJ8Ceb2+zB6ja
 mhfCdQlUZ5FBzvxXJJCJ3QMGc6fn0fKhxUCZ9SyQ9FX1500cO1ImYCVp6QPYpYDDAIVs3bLGsSn
 x7AG4skaC4oQKDHc/c00TkDwSWR1iMr7zCyFjRUvxAqRs/5t00OY9SPwWDlANz1n0S1encrBsCu
 xlKIk4iGpQkNNAldo1KBiMao0K05QDGX6szuSvbq4bb232Qe5ifc3hgj5zCuPAIJD3Fu66F7vRz
 BkLX8qyqMlrqeNd1YGYCVT5E=
X-Received: by 2002:a05:6000:4383:b0:48b:f92:1f67 with SMTP id
 ffacd0b85a97d-48e6e30b9afmr19475243f8f.21.1793616478118; 
 Mon, 02 Nov 2026 02:47:58 -0800 (PST)
Received: from localhost.localdomain (email.telematik-zentrum.de.
 [87.138.218.176]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b728ddsm19137425f8f.9.2026.11.02.02.47.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2026 02:47:57 -0800 (PST)
From: Lorand Marton <lorandmarton.dev@gmail.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, philmd@oss.qualcomm.com, qemu-arm@nongnu.org,
 farosas@suse.de, lvivier@redhat.com, pbonzini@redhat.com,
 jasowangio@gmail.com, marcelomanzo@gmail.com, serg.oker@gmail.com
Subject: [PATCH 1/2] hw/net/bcm2838_genet: wrap the TX consumer index at 16
 bits
Date: Mon,  2 Nov 2026 11:47:56 +0100
Message-ID: <0bd9bd85fd70c12f7e9ad77ad92a0ac1a778a29e.1793613972.git.lorandmarton.dev@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1793613972.genet-ring-fixes-v1.git.lorandmarton.dev@gmail.com>
References: <cover.1793613972.genet-ring-fixes-v1.git.lorandmarton.dev@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=lorandmarton.dev@gmail.com; helo=mail-wr1-x42d.google.com
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
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The producer and consumer indexes of a GENET DMA ring are 16-bit
counters (Linux bcmgenet masks them with DMA_P_INDEX_MASK and
DMA_C_INDEX_MASK). bcm2838_genet_tx() counted the consumer index up in
a uint32_t and compared it with the 16-bit producer index, so the first
transmit that crossed the wrap (consumer 0xfffe, producer 0x0001) never
ended the loop: the device sent the ring's descriptors forever with the
BQL held, and the guest and the monitor hung. A guest sending a
sustained stream hung after about 65k descriptors on one ring.

Wrap the index, and test a transmit across the wrap.

Signed-off-by: Lorand Marton <lorandmarton.dev@gmail.com>
---
 hw/net/bcm2838_genet.c           |   4 +-
 tests/qtest/bcm2838-genet-test.c | 101 +++++++++++++++++++++++++++++++
 tests/qtest/meson.build          |   2 +
 3 files changed, 106 insertions(+), 1 deletion(-)
 create mode 100644 tests/qtest/bcm2838-genet-test.c

diff --git a/hw/net/bcm2838_genet.c b/hw/net/bcm2838_genet.c
index 53bba99b38..557a8a9636 100644
--- a/hw/net/bcm2838_genet.c
+++ b/hw/net/bcm2838_genet.c
@@ -521,7 +521,9 @@ static uint64_t bcm2838_genet_tx(BCM2838GenetState *s, unsigned int ring_index,
         }
 
         num_descs++;
-        cons_index_fld++;
+        /* The indexes count modulo 2^16 */
+        cons_index_fld = (cons_index_fld + 1)
+                         & R_GENET_DMA_CONS_INDEX_INDEX_MASK;
         s->regs.tdma.descs[desc_index].length_status =
             FIELD_DP32(s->regs.tdma.descs[desc_index].length_status,
                        GENET_RDMA_LENGTH_STATUS, OWN, 1);
diff --git a/tests/qtest/bcm2838-genet-test.c b/tests/qtest/bcm2838-genet-test.c
new file mode 100644
index 0000000000..393abd7da2
--- /dev/null
+++ b/tests/qtest/bcm2838-genet-test.c
@@ -0,0 +1,101 @@
+/*
+ * QTest testcase for the BCM2838 GENET DMA rings
+ *
+ * Frames go out over a socket netdev. The producer and consumer indexes
+ * of a ring count modulo 2^16.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/bitops.h"
+#include "qemu/bswap.h"
+#include "libqtest.h"
+
+#define GENET_BASE          0xfd580000
+
+#define RING_START_ADDR     0x14
+#define RING_END_ADDR       0x1c
+
+#define TDMA_DESC(i)        (0x4000 + (i) * 12)
+#define TDMA_RING(r)        (0x4c00 + (r) * 0x40)
+#define TRING_READ_PTR      0x00
+#define TRING_CONS_INDEX    0x08
+#define TRING_PROD_INDEX    0x0c
+#define TDMA_RING_CFG       0x5040
+#define TDMA_CTRL           0x5044
+#define TSB_LEN             64      /* transmit status block */
+
+#define DESCS_PER_RING      4
+#define BUF_SIZE            2048
+#define BUF_BASE            0x100000
+#define FRAME_LEN           60
+
+static void genet_writel(QTestState *qts, uint32_t off, uint32_t val)
+{
+    qtest_writel(qts, GENET_BASE + off, val);
+}
+
+static uint32_t genet_readl(QTestState *qts, uint32_t off)
+{
+    return qtest_readl(qts, GENET_BASE + off);
+}
+
+/* Transmit across the wrap of the 16-bit consumer index */
+static void test_tx_index_wrap(void)
+{
+    const unsigned r = 0, n = 3;
+    const uint16_t first = 0xfffe;
+    uint8_t frame[FRAME_LEN] = { 0 };
+    uint8_t pkt[4 + FRAME_LEN];
+    int sv[2];
+    QTestState *qts;
+
+    g_assert_cmpint(socketpair(PF_UNIX, SOCK_STREAM, 0, sv), ==, 0);
+    qts = qtest_initf("-M raspi4b -nic socket,fd=%d,model=bcm2838-genet",
+                      sv[1]);
+    close(sv[1]);
+
+    memset(frame, 0xff, 6);
+    stw_be_p(frame + 12, 0x88b5);
+    for (unsigned i = 0; i < n; i++) {
+        frame[14] = i;
+        qtest_memset(qts, BUF_BASE + i * BUF_SIZE, 0, TSB_LEN);
+        qtest_memwrite(qts, BUF_BASE + i * BUF_SIZE + TSB_LEN, frame,
+                       sizeof(frame));
+        /* SOP, EOP, buffer length */
+        genet_writel(qts, TDMA_DESC(i), BIT(13) | BIT(14) |
+                     (TSB_LEN + FRAME_LEN) << 16);
+        genet_writel(qts, TDMA_DESC(i) + 4, BUF_BASE + i * BUF_SIZE);
+        genet_writel(qts, TDMA_DESC(i) + 8, 0);
+    }
+    genet_writel(qts, TDMA_RING(r) + RING_START_ADDR, 0);
+    genet_writel(qts, TDMA_RING(r) + RING_END_ADDR, DESCS_PER_RING * 3 - 1);
+    genet_writel(qts, TDMA_RING(r) + TRING_READ_PTR, 0);
+    genet_writel(qts, TDMA_RING(r) + TRING_CONS_INDEX, first);
+    genet_writel(qts, TDMA_RING(r) + TRING_PROD_INDEX, first);
+    genet_writel(qts, TDMA_RING_CFG, BIT(r));
+    genet_writel(qts, TDMA_CTRL, 1 | BIT(1 + r));
+
+    genet_writel(qts, TDMA_RING(r) + TRING_PROD_INDEX,
+                 (uint16_t)(first + n));
+    g_assert_cmphex(genet_readl(qts, TDMA_RING(r) + TRING_CONS_INDEX) &
+                    0xffff, ==, (uint16_t)(first + n));
+
+    for (unsigned i = 0; i < n; i++) {
+        g_assert_cmpint(recv(sv[0], pkt, sizeof(pkt), MSG_WAITALL), ==,
+                        sizeof(pkt));
+        g_assert_cmpuint(ldl_be_p(pkt), ==, FRAME_LEN);
+        g_assert_cmpuint(pkt[4 + 14], ==, i);
+    }
+
+    qtest_quit(qts);
+    close(sv[0]);
+}
+
+int main(int argc, char **argv)
+{
+    g_test_init(&argc, &argv, NULL);
+    qtest_add_func("/bcm2838-genet/tx-index-wrap", test_tx_index_wrap);
+    return g_test_run();
+}
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 46d4fc1d2b..36af0b267a 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -284,6 +284,8 @@ qtests_aarch64 = \
   (config_all_devices.has_key('CONFIG_XLNX_ZYNQMP_ARM') ? ['xlnx-can-test', 'fuzz-xlnx-dp-test'] : []) + \
   (config_all_devices.has_key('CONFIG_XLNX_VERSAL') ? ['xlnx-canfd-test', 'xlnx-versal-trng-test'] : []) + \
   (config_all_devices.has_key('CONFIG_RASPI') ? ['bcm2835-dma-test', 'bcm2835-i2c-test', 'bcm2835-ic-test'] : []) +  \
+  (config_all_devices.has_key('CONFIG_RASPI') and host_os != 'windows' ?
+    ['bcm2838-genet-test'] : []) + \
   (config_all_accel.has_key('CONFIG_TCG') and                                            \
    config_all_devices.has_key('CONFIG_TPM_TIS_I2C') ? ['tpm-tis-i2c-test', 'tpm-tis-i2c-swtpm-test'] : []) + \
   (config_all_devices.has_key('CONFIG_ASPEED_SOC') ? qtests_aspeed64 : []) + \
-- 
2.56.0


