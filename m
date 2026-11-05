Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DBF3606A328
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Nov 2026 09:29:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xOtlm-0006kV-4P; Thu, 05 Nov 2026 04:28:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xOtlY-0006ea-6J
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 04:28:16 -0500
Received: from mail-pg1-f169.google.com ([209.85.215.169])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xOtlT-0006v3-7M
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 04:28:15 -0500
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-cc4aa18f9afso767416a12.3
 for <qemu-arm@nongnu.org>; Thu, 05 Nov 2026 01:28:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793870884; x=1794475684;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=xROCpkWUYC71TnBZuGFxVWBBqmZSEffjxEv7jnCU0Jc=;
 b=t5yj4q4U3k0t8nvJBmjZ189Kqr9woYItrOGqjSWk+Z3eJ+cu461GvUElr3CLYFhuL9
 hLyg1lLtl0/j1ILjSCcf3aeSHOAo74wSKCT3HB9YQiKCdnRYnE/j+9uZ4uUnrZNL5vw/
 ypY1jqGhHuiaBBwDEUMJonRRI6CQGH0V1xJbNkD05W/D7Ko0mbeEQqpDY+BS2JZMWzze
 wsejEASizccIvFtQk45EHHX4OMXEoIgQnjKt2eVRRlSpM7P2+QHj0UQTCeFUquL1BeNw
 ybEyJJR67Z1iMjffkcm62CIRiYVS5oWSfTJOIyXmNY94XgbTolRTPdw4rjg0PdfrFqvW
 1r0Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBx2YYqQcrJ5208YAyh6zZut1ToVQ/81oy5WeN51k4fhOu58ZT4f6DFQMrzUUNRGc8g1LT6AYN/Q5Q==@nongnu.org
X-Gm-Message-State: APuU4Z+RxrGPpj+L+IZ2apD1xCoiQZBZEMaojpEuXhC8L4VcZH0Hbj33
 3L7+6uq++Cv320JMhGR6wXyacDqHqzIY4rEliKpV1O92bVhJsCrJ7rtx
X-Gm-Gg: AYBFou2DA9rCOQlQ3KnLKnAMz4iV4YUKemDZUL3GdR3i9/RdapoUcTzqwye64A/q2O1
 s330/+zEhNtmKls/7hYCKyB54nhb3qgq3yMisTm2RfIrwz5jcSAXEgKGettKAKueSzYLn9WSPo/
 EfNm8HrdbDdCK74rvawFjjBwg/RmILDN34nCqbbXyt4b/9WnwDD29fmIRvkNnGhQnIsfuF3hvkY
 LiLygEJP0AKMipXR7cN28hULEyy8XEBI7iHJ3MqvMQL2ufXHa4llo4Ajzd7LSH7rpE5YJOr8w7i
 W5BSW766RcCORL+A2DQgEhlmlvdTiuB+tlhWi+Uw02ighY/we2q3jd0HrKFR4xjvOpLj8774Lmt
 0pTLvm11yOkjx1WUI9HhPTB0nE/+AoGYK8ccpF5vXO2q63rQmYr+N11+7DUHkMQCaJGyFm2s5aR
 MmYxX7k3C3Hcpocp15iNvizmRyLtmsWLyDggkwKdg/kVnTH/vmd/eZRdHbQRSKYKlsDdUZg5s/I
 h00lcpYuBYEl7JdWD6hp11lnWjRCZNcrz92qTWwJGFHOF0+qHxB5vZ3u/jYOq9tEHkgIGESLo80
 Az4V5GjyzuWLdlyacpn47QjT6laSKu0fbkkVbHCJaXbOx5N32aTEVYQ0Sf3JkLP9Xu+D74NANU5
 q
X-Received: by 2002:a17:90b:28c7:b0:3a0:a912:e759 with SMTP id
 98e67ed59e1d1-3ae897ee62amr15881143a91.25.1793870884072; 
 Thu, 05 Nov 2026 01:28:04 -0800 (PST)
Received: from localhost (118-163-122-149.hinet-ip.hinet.net.
 [118.163.122.149]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3b0b90def97sm2554833a91.7.2026.11.05.01.28.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2026 01:28:03 -0800 (PST)
Date: Thu, 05 Nov 2026 17:25:41 +0800
Subject: [PATCH 02/16] hw/sensor: tmp421: name the parent object field
 parent_obj
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-sensor-tmp421-v1-2-c46853f5e1f0@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793870742; l=1266;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=LKRPZEbS+SgjV2hPOICiQGuvSWwSj93umhoLaBNzCtE=;
 b=x3tqdVLnIyF3m70IKnZE6uQ5qNKI7Xb7kTy/lCMZBC54TqGMDRLW5VOh4Q6/Zc41p5fGLjrz/
 uoWD2wPsGnvCHsPdxs7sIUnlxa/OzbcaNiY+u3TzyMUsc7qxuyGTeG+
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.215.169; envelope-from=eblot.ml@gmail.com;
 helo=mail-pg1-f169.google.com
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

Follow the QOM convention for the embedded I2CSlave, matching the other
hw/sensor I2C devices. No functional change.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 hw/sensor/tmp421.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/sensor/tmp421.c b/hw/sensor/tmp421.c
index 84c6ebec41..55e261a090 100644
--- a/hw/sensor/tmp421.c
+++ b/hw/sensor/tmp421.c
@@ -52,7 +52,7 @@ static const DeviceInfo devices[] = {
 
 struct TMP421State {
     /*< private >*/
-    I2CSlave i2c;
+    I2CSlave parent_obj;
     /*< public >*/
 
     int16_t temperature[4];
@@ -299,7 +299,7 @@ static const VMStateDescription vmstate_tmp421 = {
         VMSTATE_UINT8(status, TMP421State),
         VMSTATE_UINT8(rate, TMP421State),
         VMSTATE_INT16_ARRAY(temperature, TMP421State, 4),
-        VMSTATE_I2C_SLAVE(i2c, TMP421State),
+        VMSTATE_I2C_SLAVE(parent_obj, TMP421State),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -335,7 +335,7 @@ static void tmp421_realize(DeviceState *dev, Error **errp)
 {
     TMP421State *s = TMP421(dev);
 
-    tmp421_reset(&s->i2c);
+    tmp421_reset(&s->parent_obj);
 }
 
 static void tmp421_class_init(ObjectClass *klass, const void *data)

-- 
2.53.0-Meta


