Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EABDC54F54
	for <qemu-arm@archiver.kernel.org>; Fri, 31 Jul 2026 12:49:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wpmfL-0006Ms-0a; Fri, 31 Jul 2026 08:48:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1wpmfA-0006Ls-4b
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 08:48:32 -0400
Received: from mail-wr1-f52.google.com ([209.85.221.52])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1wpmf8-0002ct-OH
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 08:48:31 -0400
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-47ddf7b09e5so1175102f8f.1
 for <qemu-arm@nongnu.org>; Fri, 31 Jul 2026 05:48:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785502109; x=1786106909;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=S23pR2ZvsSLYFR0+0DeQ83TbuXFd8+C0obNCg2DOLig=;
 b=OIGv2Zj29UxKdVUUbicpUtsw9ZboqQg3UpYwg9XONJYjlYY28g+ww7Tt+QmLXnub2p
 sbUjdlV/keVbZ1pAKHtToEcp7RLIMwrdTi2hxzKcXB8Q/LWhjU0T4RRAL+uH03z5nTcZ
 JxM6PgBKon0bblsfRK7lT9dnM7Nb1RlwPVJPYPebYNIA7OskabaulivXpc9LoDWPbDS8
 OpgqC20p0Eme1HUi7AqL5XSpjzJMX1d0FE4FfxlMtqReSOrmdZ3uOqdNPgOJpmFhyUu3
 +MvcZP1PArw3YgKTUZBmzWqGR2IZiO5FrF4hTy33kkvfZdWLGx92C+IOyOigO6G1koWe
 1+7w==
X-Forwarded-Encrypted: i=1;
 AHgh+RoGGbfsDOmlX9XEE9LhN89cBtLzW9SJt6pEhzJbJbzGLChF8PHiF/CVM5CKidyfbs7twzGuaaFj9Q==@nongnu.org
X-Gm-Message-State: AOJu0YznC6kOlnDT9QiKV8/Y3KKwgLI7buWO+uRbjgtPAetZLFYlJoSW
 SnbHTkZVu4InpTzDTIuFjQwdXsnUWBXjsZMT/qMG8NVsvMnRkKC8YMJX
X-Gm-Gg: AR+sD13OsRxGOBM++VGd6G/B4/ApR8sE1Kd/xRdJ8eCGFDbDoFmxRWwOPV7Zu0BKetl
 /HxbRlb188GIdiNU5Jkd5JOpQiOiWlFD5e+TCGEMdLd153yezfGukd+WYaDqt2+uhKNoiH/v2ON
 bCFobafg8DvUmEiH6Yb/ufvxAxDpcqN4MybvNfkMXn9fkV4a2j3F7amOGWfYMYHZjbiAygne2lv
 DPQ0rz3OAtrRaDc0CmMnMl2fxoy8aqL4NoJKheEYPaO2YVpeg0owrPC2Rx4I3Qu4UAjNGIwQp3c
 yv5JrKr1vpvZf0gDLcsCy585eUVo6PCL/1SLyZ10AA8h+dzh54sawtoJCNv/iIDJENYJvUcScWY
 95/+Ly661qqklbbAiSfzF5y8EZBQEQnQ1yGLi3GfqJWxJ6O0ZeJvmkbJj6dcpaik7lnYhLh5sKB
 v9lmDMSov79uM8pL12857aPp9VNalg8MNNDhSkWZfNMrd+K3u/IwSeTtYb74OlbIDaNNE+lCsnS
 zxsXSwOQRVu/rpV9stmddJdtJbrCac9CeYT
X-Received: by 2002:a05:6000:2504:b0:47f:7c50:2222 with SMTP id
 ffacd0b85a97d-47fd2adcf89mr4133005f8f.24.1785502109144; 
 Fri, 31 Jul 2026 05:48:29 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fd458b73asm3927899f8f.29.2026.07.31.05.48.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2026 05:48:28 -0700 (PDT)
Date: Fri, 31 Jul 2026 12:45:23 +0200
Subject: [PATCH v2 24/25] hw/arm: catalina: drive pca9554 io expander input
 pins externally
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-sanmiguel-bmc-locator-v2-24-1266926ba769@free.fr>
References: <20260731-sanmiguel-bmc-locator-v2-0-1266926ba769@free.fr>
In-Reply-To: <20260731-sanmiguel-bmc-locator-v2-0-1266926ba769@free.fr>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 qemu-arm@nongnu.org, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Thomas Huth <th.huth+qemu@posteo.eu>, 
 =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Emmanuel Blot <eblot@meta.com>, Emmanuel Blot <emmanuel.blot@free.fr>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785494709; l=1675;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=EtxfxNQ4ajDXh5xrjgZPSfhgjy+Z8hKW5J2/81txDi0=;
 b=3uhiNc8DNYIaTMNhkdWS2vMAaIVje9oq6moOgrhv1yblmCtAGe9N9xL9Z4PgdQ255jEsxXcKF
 eLi8DJ4nLEpD7CbTyJtxBjK9pB7v92+6DhmmDiGR1LhER6IJDIk5N9A
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.221.52; envelope-from=eblot.ml@gmail.com;
 helo=mail-wr1-f52.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
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

Create io_expander5 (pca9554@27) with hw-dir=true so its pin%d QOM
properties drive the external input level of each pin, matching the
pca9555 expanders, instead of the legacy behaviour that forces the pin
to an output. This lets external agents, including tests, stimulate the
input pins and have the guest read them back.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 hw/arm/aspeed_ast2600_catalina.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/hw/arm/aspeed_ast2600_catalina.c b/hw/arm/aspeed_ast2600_catalina.c
index 928e140b21..69e072c932 100644
--- a/hw/arm/aspeed_ast2600_catalina.c
+++ b/hw/arm/aspeed_ast2600_catalina.c
@@ -545,9 +545,16 @@ static void catalina_bmc_i2c_init(AspeedMachineState *bmc)
     i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 5), TYPE_TMP75, 0x4f);
 
     /* i2c1mux0ch6 */
-    /* io_expander5 - pca9554@27 */
-    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 6),
-                            TYPE_PCA9554, 0x27);
+    /* io_expander5 - pca9554@27 (external agents drive its input pins) */
+    {
+        I2CBus *bus = pca954x_i2c_get_bus(i2c_mux, 6);
+        I2CSlave *ioexp = i2c_slave_new(TYPE_PCA9554, 0x27);
+
+        object_property_add_child(OBJECT(bus), "0x27", OBJECT(ioexp));
+        object_property_set_bool(OBJECT(ioexp), "hw-dir", true,
+                                 &error_abort);
+        i2c_slave_realize_and_unref(ioexp, bus, &error_abort);
+    }
     /* io_expander6 - pca9555@25 */
     i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 6),
                             TYPE_PCA9555, 0x25);

-- 
2.50.1


