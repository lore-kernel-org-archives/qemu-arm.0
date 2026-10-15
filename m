Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 190CDCC6B39
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Oct 2026 15:16:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHN8U-0002DV-0q; Thu, 15 Oct 2026 11:12:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHN8R-0002A8-Eo
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 11:12:47 -0400
Received: from mail-wr1-f50.google.com ([209.85.221.50])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHN8P-00022Y-04
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 11:12:47 -0400
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-48c5358fc28so472993f8f.0
 for <qemu-arm@nongnu.org>; Thu, 15 Oct 2026 08:12:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792077163; x=1792681963;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=TAKWq5OaS0dmrW3Pgr9SxuBdpwdzx7tYDqztdgweZoA=;
 b=dX1B86fmZoDVlxCmMRinDvsEY604pd2shpBsXw7dOQhNkHW037PM169+m40jU19ZUZ
 2ND+4GGD/F0b9OzaQhZMlFYY7B+srceNeMRi5OErPILxSazDv0a//fdPEcpZAhruAiKL
 n6yVKovV89i8xwye3cdRF+DW2ye7rqr/vbrqzEg3ygddjX6udbiIJk5xWZFgD+Bonek9
 /7Hrgz7u9XwkWcv+q8ddab+bvpZ4I3pnPxqMxTaMBtcMYp026Mn4SzIYlejk+I+BI7UQ
 bm1XR/QhKZY4X/f1BjT7f7EkCvvPdshP7fN8QbojsA35Damc74O6KfjWEpGAYFCHG3Q/
 c9zA==
X-Forwarded-Encrypted: i=1;
 AKwUvBygHZVa09ed+RyCszKjKxXabBcUQdv4ITxBEpY0HRHfEdalU3lTaaDXA7/USa5hHIR0M5t56pb2JA==@nongnu.org
X-Gm-Message-State: AFq9FYJpIwuhWTMZVnTF8iLSy3d+cad81FroUhwTLCrW+UBvuKwxe/us
 ViXIpD3TGGbN+tImQMZ7BqZSR9EXsto17P3odm1j3Nn7dHxgvSGh1CWN
X-Gm-Gg: AYBFou2zKf+PlkQrCenUBWXdUU3Ae5W/opoF/QhsxD+8kmECfAXLlFjs6pueSho2XZc
 26ezsESbacwtazoE7xherYJLWdeumymULovIvJJKsL9TWsEscJkb7ncSaZnm9By/nBoxbq9xvaT
 UyBq96weydQb68fsCqwO1+pgW53ju61DHGPxUF0H9uW/Y3nUcjI7zVnw0apjj+Jr+CMFVaCbJ0K
 mlptsd6qJyHnlesTUb4I6ZAzK7QWX+sHNybzV6ooIfh39Gy6VQJzypE0/oE+s3EPPucWCqrs1qi
 /btb78YRuqTo6JVo5T0cUUwOrTu6CCrtG8GkTu+wc2vbwrHYgTt1XwEzlAX4ae5zAKei+ws8odK
 j1u3866VEKZrnPnt/mxKUUl5CZB25dhQPT3iBJCsR48cfooXcVC0XrEXeZKvPsYj3eQFDfGepV1
 A3dyBYnOM/4mLN2UVTI1fZw8qQSGOGvpl2a4hHOi3Faf0xE5fZ4izAxi9QMh6n0cO0M1ELCV+Sr
 ly1mT9xRJj5f+q6CAmm6TN43d7K7toNDHtvXpNCjDrD9wUrG1romqfm
X-Received: by 2002:a05:6000:25ca:b0:48d:f69e:9cfd with SMTP id
 ffacd0b85a97d-48df69e9e8emr4135417f8f.27.1792077162491; 
 Thu, 15 Oct 2026 08:12:42 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48df3cbb78asm5888592f8f.48.2026.10.15.08.12.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 08:12:37 -0700 (PDT)
Date: Thu, 15 Oct 2026 13:57:57 +0200
Subject: [PATCH 19/22] tests/qtest: tmp105: cover the TMP1075 config
 register width
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-bmc-clemente-v1-19-bf591886b5b6@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792065465; l=2217;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=eKNsPNpZHCrr7lt5jUn9ATmHMoMqISDae/0HeUQWVVY=;
 b=Xcnz4/tCybsk3M59LoRaorgPeZA/vcFX24JqOolZuEe8iBs41X1FYNu1z00bcD8Q2SZG6WaSB
 EwpuoU8e7hUBIJCu1hUPosekvvjYsHwe3ZW+0st3NnS0T0pYjqqazqD
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.221.50; envelope-from=eblot.ml@gmail.com;
 helo=mail-wr1-f50.google.com
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

Nothing pinned the 16-bit Config register: neither its single-byte
compatibility nor the low byte, which drives nothing but keeps what it
is given.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 tests/qtest/tmp105-test.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/tests/qtest/tmp105-test.c b/tests/qtest/tmp105-test.c
index 426c4f9ae7..b21deb1128 100644
--- a/tests/qtest/tmp105-test.c
+++ b/tests/qtest/tmp105-test.c
@@ -441,6 +441,33 @@ static void test_tmp1075_device_id(void *obj, void *data,
                     TMP1075_DEVICE_ID);
 }
 
+/*
+ * The Config register is 16 bits wide but stays compatible with 8-bit access:
+ * the control bits are the upper byte, the lower byte drives nothing.
+ */
+static void test_tmp1075_config_width(void *obj, void *data,
+                                      QGuestAllocator *alloc)
+{
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+
+    /* A single-byte write reaches the control byte and leaves the rest. */
+    i2c_set8(i2cdev, TMP105_REG_CONFIG, 0x60);
+    g_assert_cmphex(i2c_get8(i2cdev, TMP105_REG_CONFIG), ==, 0x60);
+    g_assert_cmphex(i2c_get16(i2cdev, TMP105_REG_CONFIG), ==, 0x60ff);
+
+    /* A word write keeps both bytes. */
+    i2c_set16(i2cdev, TMP105_REG_CONFIG, 0x6200);
+    g_assert_cmphex(i2c_get16(i2cdev, TMP105_REG_CONFIG), ==, 0x6200);
+
+    /* The low byte survives a single-byte write to the control byte. */
+    i2c_set8(i2cdev, TMP105_REG_CONFIG, 0x60);
+    g_assert_cmphex(i2c_get16(i2cdev, TMP105_REG_CONFIG), ==, 0x6000);
+
+    /* The one-shot bit always reads back as zero. */
+    i2c_set8(i2cdev, TMP105_REG_CONFIG, TMP105_CONFIG_OS);
+    g_assert_cmphex(i2c_get8(i2cdev, TMP105_REG_CONFIG), ==, 0x00);
+}
+
 static void tmp105_register_nodes(void)
 {
     QOSGraphEdgeOptions opts = {
@@ -508,5 +535,6 @@ static void tmp105_register_nodes(void)
     qos_node_consumes("tmp1075", "i2c-bus", &tmp1075_opts);
 
     qos_add_test("device-id", "tmp1075", test_tmp1075_device_id, NULL);
+    qos_add_test("config-width", "tmp1075", test_tmp1075_config_width, NULL);
 }
 libqos_init(tmp105_register_nodes);

-- 
2.53.0-Meta


