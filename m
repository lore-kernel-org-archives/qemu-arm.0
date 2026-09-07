Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C73CC79FA1
	for <qemu-arm@archiver.kernel.org>; Mon,  7 Sep 2026 16:44:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x3cSa-0003aN-BU; Mon, 07 Sep 2026 12:44:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1x3cSZ-0003Uh-79
 for qemu-arm@nongnu.org; Mon, 07 Sep 2026 12:44:43 -0400
Received: from mail-wr1-f50.google.com ([209.85.221.50])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1x3cSW-00039u-2k
 for qemu-arm@nongnu.org; Mon, 07 Sep 2026 12:44:42 -0400
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-48584dc164fso3540719f8f.0
 for <qemu-arm@nongnu.org>; Mon, 07 Sep 2026 09:44:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788799478; x=1789404278;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=vPB5f/PPZ/fTGUrJWi/0AwBmdqaHERhdZDqmO3v6YS0=;
 b=Ij6wFrhwTPYrJehCplGLLC0J9n48uM0Xqe5auepGDVkYZCeLJn8pA5oEaoTKBy0je6
 sX7GZLCm18ASwjjeyMbonM6l2O2pEA3Mi8Y6dFt+5dbfkyJ1yKjYl8XxT0kZc9lD7YVD
 YZyBmlCDUWASOqW4omPS7TOKeaUEIBuUoZ4jpr1pq1ImPpQIcQ/X3StTfMEOoRxYEH3+
 Hw+XqGTDA06w6A8N4vnngC91xktuxMEfBEjKOKYkpvBHXFVUSK9kF7ExeFzT6H4spzto
 EK87lPm1wjz5mXxE4EbxWq/fVoy8H70A6DG0fwB//6eRaNDNsAZM8ZZRX5IRXA8ffU3C
 ktDw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxTyLtEycbauTPIQMlbZV1H6p+FAZf06DxPYfyTyQjWNUZbWOAwkqtJMh30VH4+/XtAINWVXifOAw==@nongnu.org
X-Gm-Message-State: AFuF++mahwPQVkZoyzYrlIXnd/rc6ChaSNFjuoCb5vHMBMNl7/MefcTp
 KklwcSpRpZ2WTGH3VSDH1vj+Cir70LUX60knlkRD62bg0MU/KZqCOLQx
X-Gm-Gg: AYBFou2fP+vy82B7zj7NCUirc6QdQJVNAEdSnZWbo0XZZ4sujSLLyDixGEyb4YnrvCN
 US86QeOBcqiTrp8XyJw9jKLNFnVQIHFR3kU/Mjy2Z2FlHz/zRrw36iuffJYoBwZ3bD0Y9ebXM6Y
 9M4yFF4clBGGnyz8+rfS1uhENIPrFVgnnUFHyb18vefQIek6q+Rjoh/nWQWNvRnleYwjejKnPV6
 LhUQRvgI5HBWuUQzcN9ueQBxc8sAEMKYQrgCz656Bi3si4D8tUYKm2+LY0k8uaSNyVGMOESCHqV
 +frJ/XxlybI5H/rr+QXnNNvipUFV6LwLyjFDYLtRnhlmyoFgvLgBSZ4yoJ0IpnCS/7/BSXdipuh
 LOVe80pm7ExfxQY3wq5BqYRRs2Ko8jHNzAOr23iwt8NRWpOxvozugp1ThoXpo7CmmFneCra081k
 9AOb8S/cckxMrQRiUmyIk6a7cFQ/RopmlaBcualFxTQVxpaBexhgqKGQvNR8W2eC/NspqO1NdO9
 J/khWDzqgRtBmSGyEkeWzM2PRXj6WHTDrvs+iK96EjRQg==
X-Received: by 2002:a05:6000:470c:b0:485:8a46:705c with SMTP id
 ffacd0b85a97d-4858a4671b8mr21557003f8f.46.1788799478484; 
 Mon, 07 Sep 2026 09:44:38 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485883927a3sm23015695f8f.11.2026.09.07.09.44.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2026 09:44:38 -0700 (PDT)
Date: Mon, 07 Sep 2026 18:42:01 +0200
Subject: [PATCH 11/50] hw/rtc: ds1338: prefix the file-local helpers with
 ds1338_
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-bmc-minerva-v1-11-0d83ad610c3b@free.fr>
References: <20260907-bmc-minerva-v1-0-0d83ad610c3b@free.fr>
In-Reply-To: <20260907-bmc-minerva-v1-0-0d83ad610c3b@free.fr>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org, 
 Patrick Leis <venture@google.com>, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Emmanuel Blot <emmanuel.blot@free.fr>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788799320; l=2049;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=4sMpXciwY1X59HescikiS3PryefwPgkY5TQZ1q6pfqQ=;
 b=uSaJznH3FOG8c+yD3ATwl7VuNxgErZBEkZOqbUIASUkavFu1CREfsyLsPzg5jz2YtoZmu2x2Q
 61Rt+Q3/k8+AA2QhSFjwyIHQltWfCGX2vOkH331NfNs0AZQ/VJOgsir
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.221.50; envelope-from=eblot.ml@gmail.com;
 helo=mail-wr1-f50.google.com
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

Two static helpers predate the rest of the file and carry no device
prefix.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 hw/rtc/ds1338.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/rtc/ds1338.c b/hw/rtc/ds1338.c
index 74aee6c746..1755a3a37c 100644
--- a/hw/rtc/ds1338.c
+++ b/hw/rtc/ds1338.c
@@ -57,7 +57,7 @@ static const VMStateDescription vmstate_ds1338 = {
     }
 };
 
-static void capture_current_time(DS1338State *s)
+static void ds1338_capture_current_time(DS1338State *s)
 {
     /* Capture the current time into the secondary registers
      * which will be actually read by the data transfer operation.
@@ -85,7 +85,7 @@ static void capture_current_time(DS1338State *s)
     s->nvram[6] = to_bcd(now.tm_year - 100);
 }
 
-static void inc_regptr(DS1338State *s)
+static void ds1338_inc_regptr(DS1338State *s)
 {
     /* The register pointer wraps around after 0x3F; wraparound
      * causes the current time/date to be retransferred into
@@ -93,7 +93,7 @@ static void inc_regptr(DS1338State *s)
      */
     s->ptr = (s->ptr + 1) & (NVRAM_SIZE - 1);
     if (!s->ptr) {
-        capture_current_time(s);
+        ds1338_capture_current_time(s);
     }
 }
 
@@ -108,7 +108,7 @@ static int ds1338_event(I2CSlave *i2c, enum i2c_event event)
          * START_SEND, because the guest can't get at that data
          * without going through a START_RECV which would overwrite it.
          */
-        capture_current_time(s);
+        ds1338_capture_current_time(s);
         break;
     case I2C_START_SEND:
         s->addr_byte = true;
@@ -129,7 +129,7 @@ static uint8_t ds1338_recv(I2CSlave *i2c)
 
     trace_ds1338_recv(s->ptr, res);
 
-    inc_regptr(s);
+    ds1338_inc_regptr(s);
     return res;
 }
 
@@ -204,7 +204,7 @@ static int ds1338_send(I2CSlave *i2c, uint8_t data)
     } else {
         s->nvram[s->ptr] = data;
     }
-    inc_regptr(s);
+    ds1338_inc_regptr(s);
     return 0;
 }
 

-- 
2.50.1


