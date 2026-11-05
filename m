Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFFF9606A32D
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Nov 2026 09:30:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xOtmu-0000aK-UN; Thu, 05 Nov 2026 04:29:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xOtmt-0000Wy-GM
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 04:29:39 -0500
Received: from mail-pl1-f175.google.com ([209.85.214.175])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xOtmr-00072v-7V
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 04:29:39 -0500
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-2e9d1114320so13164255ad.3
 for <qemu-arm@nongnu.org>; Thu, 05 Nov 2026 01:29:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793870975; x=1794475775;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=tMqRetAxiQAIvpDJW998EtamxiidvOknZM6HJPGhQpw=;
 b=B2jEYlORWn2bL1EqsY99I2Xfdft9JXEzp19qAnLM4hfSXo0f501uPNz6YLnIkx0Vas
 SKkhKQ3EwWLHKJrh2OprCo7vbpQVlvcLGiyHoNWh3D6lnKf2weTInqcJ5tl57uNmnSFr
 XUSpb7i1izWVTVnT6t5FOpFjrlsH9Y0Tsfk7cLQkiaqSIwOgPkhOW8CouhE62iyGMx2O
 HxPxd5+Pbt41l8KSB088Ydrj5JyCNuKE+zZEAYU8L5FBvmDHRLN2rtnWkjzkPp1kcj7A
 4/06ViluHns67ULrXPxEOLzqi/lVdlKUgo8VwBr+3Q7oPkLeO04aGw/z2OqIFng0Z/pe
 5KZw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxjOjfH4fd9JmSAsUw8ynm9RIHqpVozejqOOzfcXSiYyZDKQfjXSm4Ht+tI5WulquVlMYdlXAxTpw==@nongnu.org
X-Gm-Message-State: APuU4Z84y2OfrRl/ouiTyYSsLIw71GCHX8jJf5/dNnSzGKE5XnaQ1uqJ
 nZefK2UdpXz40usTpHVLSWNe07vpuiKGnUesusp+2HOMcTZTuUS/MjKZ
X-Gm-Gg: AYBFou2n++MD7OnLn2b+Ew6oPlH2WhY5eGMuX0kuD/uLKmPU8jyzXPi82Ul0VBGArr8
 glewDNgdpGdQuv7fprogQ2QWyA3iC1Q/zfLzYJxTaAF6lKeewCFSEiMtXMxxroS3Fd9PNE3+qzS
 xVZ7g5Zrl23e/eHWZN3IJeJktoQkdAEh1NxrPvyS8R37Ve1tC5UXDq4dNncMEu6B+toOMBcEy36
 XCeWoohJr2Hb1wFdrfQ1rVQ1XgAU+kXSAei93rGUdohC+YOMdQtcHc2y2R19fpbePhEYbWnyBs7
 qcEdRirQUlPkPN8rUsBOfofPr2yc0sy0Bi4BrFtrlQnoR7WCuwY80Hg2+rHTatbjPDGT0UU+krR
 Ohn+FGC9oScv7TwVJPlN3K86LNm6VS5gHdpEOGEfOQ3IJ0emqQjvhym/FUAQVvOgT1WMJY+Gndz
 Me1wsihMxy+Y4rIDeYXbH2KoOoMDIAD1JPIub629l91IfP56walZb/vSmTB5v+oZpcl4paP084h
 EMlVLjsherzxOEJtETF00YlUM0KHrVvY7f3RVYlMqRj+lS9+ulf8y2eVPuPNeYX4eewzHQKGiD/
 1DmowJ2iMHQt6MV9EFPv4Qqeg1/9maB2hxyVwrjihSzIPfT1jTBxQk3CcHZIMj/C4wVMvUVD0Eu
 4
X-Received: by 2002:a17:902:f712:b0:2ed:acb:aa96 with SMTP id
 d9443c01a7336-2ed0acbd23fmr42094725ad.24.1793870975358; 
 Thu, 05 Nov 2026 01:29:35 -0800 (PST)
Received: from localhost (118-163-122-149.hinet-ip.hinet.net.
 [118.163.122.149]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ed0906ebedsm15925785ad.31.2026.11.05.01.29.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2026 01:29:34 -0800 (PST)
Date: Thu, 05 Nov 2026 17:25:53 +0800
Subject: [PATCH 14/16] tests/qtest: tmp421: cover per-variant channels and
 enablement
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-sensor-tmp421-v1-14-c46853f5e1f0@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793870743; l=3174;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=6nvwu9Ryau4lnUGBjjuEHQaAZ8bpboeH30ZpsRWrAg8=;
 b=m3LRqZgamggLJweBwY5it6HAEKh0lGseXbug+AaA1/30DIjcGGwmO+gZrjz2kH51GX/F+nwWA
 Ox5YWsIsjqgBzsc5SXFL9ISASuMvnkVFfmd8EK763+RRWOzRua27DhK
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.214.175; envelope-from=eblot.ml@gmail.com;
 helo=mail-pl1-f175.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
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
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Check that each variant exposes only its own temperature properties,
that writing an absent channel's enable bit is ignored, and that
disabling a present channel makes it read back as zero.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 tests/qtest/tmp421-test.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/tests/qtest/tmp421-test.c b/tests/qtest/tmp421-test.c
index 390f17b6b2..04f9252188 100644
--- a/tests/qtest/tmp421-test.c
+++ b/tests/qtest/tmp421-test.c
@@ -22,6 +22,7 @@
 #define TMP421_CONFIG_REG_1             0x09
 #define    TMP421_CONFIG_RANGE            (1 << 2)
 #define TMP421_CONFIG_REG_2             0x0A
+#define    TMP421_CONFIG_REN              (1 << 4)
 #define TMP421_CONVERSION_RATE_REG      0x0B
 #define TMP421_TEMP_LSB0                0x10
 #define TMP421_RESET                    0xFC
@@ -78,6 +79,15 @@ static void set_temperature(const char *id, unsigned channel, int value)
     qobject_unref(response);
 }
 
+static bool has_temperature(const char *id, unsigned channel)
+{
+    QDict *response = qmp_get_temperature(id, channel);
+    bool present = qdict_haskey(response, "return");
+
+    qobject_unref(response);
+    return present;
+}
+
 static void test_ids(void *obj, void *data, QGuestAllocator *alloc)
 {
     const TMP421Variant *var = data;
@@ -156,6 +166,31 @@ static void test_range_saturation(void *obj, void *data,
     g_assert_cmphex(i2c_get16(i2cdev, TMP421_TEMP_MSB0), ==, 0xD5F0);
 }
 
+static void test_channels(void *obj, void *data, QGuestAllocator *alloc)
+{
+    const TMP421Variant *var = data;
+    QI2CDevice *i2cdev = obj;
+
+    /* Only the variant's own channels expose a temperature property. */
+    for (unsigned ch = 0; ch < 4; ch++) {
+        g_assert_true(has_temperature(var->id, ch) == (ch < var->nchannels));
+    }
+
+    /* Absent channel enables and reserved bits are dropped on write. */
+    i2c_set8(i2cdev, TMP421_CONFIG_REG_2, 0xff);
+    g_assert_cmphex(i2c_get8(i2cdev, TMP421_CONFIG_REG_2), ==,
+                    var->config2_reset);
+
+    /* Disabling remote channel 1 makes it read back as zero. */
+    set_temperature(var->id, 1, 25001);
+    g_assert_cmphex(i2c_get16(i2cdev, TMP421_TEMP_MSB0 + 1), ==, 0x1900);
+    i2c_set8(i2cdev, TMP421_CONFIG_REG_2,
+             var->config2_reset & ~TMP421_CONFIG_REN);
+    g_assert_cmphex(i2c_get16(i2cdev, TMP421_TEMP_MSB0 + 1), ==, 0);
+    i2c_set8(i2cdev, TMP421_CONFIG_REG_2, var->config2_reset);
+    g_assert_cmphex(i2c_get16(i2cdev, TMP421_TEMP_MSB0 + 1), ==, 0x1900);
+}
+
 static void tmp421_register_node(const TMP421Variant *var, const char *type,
                                  uint8_t addr)
 {
@@ -170,6 +205,8 @@ static void tmp421_register_node(const TMP421Variant *var, const char *type,
 
     qos_add_test("ids", type, test_ids,
                  &(QOSGraphTestOptions) { .arg = (void *)var });
+    qos_add_test("channels", type, test_channels,
+                 &(QOSGraphTestOptions) { .arg = (void *)var });
 }
 
 static void tmp421_register_nodes(void)

-- 
2.53.0-Meta


