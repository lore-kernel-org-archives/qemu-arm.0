Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 656C5CC6B33
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Oct 2026 10:28:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHIeP-0001LD-G9; Thu, 15 Oct 2026 06:25:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHIeK-0001Eo-V9
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 06:25:25 -0400
Received: from mail-wm1-f53.google.com ([209.85.128.53])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHIeI-0003ia-5S
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 06:25:24 -0400
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4956869750eso33951305e9.2
 for <qemu-arm@nongnu.org>; Thu, 15 Oct 2026 03:25:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792059920; x=1792664720;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=55Fgqc9VQyRpyCCP2Jau8AxqRXuSeRGIW2uq0lzhQEw=;
 b=ftvLGEnggolNnQwmocawHM2kC9Q0iycRYPwOvYSIzBTre2744J44nSgcu/E7A9VRsz
 kXRjQyXxM0B0ocOtmAIzdmvhwgtWdm33v5BHn+zZYM/vyIgQW+VL/MosVcsuxGdQ6O05
 q194ltn1YbeDe9Da2vO2MEosUPz6Yo7YqbXWbHmB4U8s9q5jymCSSZZban+C/4tLjh9R
 MeC9Ym4gGlE34NGn2/D+Lksdh+x4zrdoRkXGKGPTo8jbxz+T90E5dfaIAafewyyXkUbd
 s/Y4hceVZyM6ZJMQt7Vx3AMiJHauWXQcm7+ron/K6r7TW5zpEmOkbNDLKyuhjWlrWgkU
 mMTA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzNJtO2URToRo/cdM8EZLbMdiSplzXIDQ4rHxWKiMAYDPIefGa9hKu0m858EOkMC6TJiEGqw0JKZA==@nongnu.org
X-Gm-Message-State: AFq9FYIBKXGoql/UYjyVV8rIXx7yw9LUm3cEuV8gGlweKErVLFZH1a6G
 0XC7Ovd46iq/gAhHjpMGb5PXVa+RePL0yx6LvSLKYVdxAPInNSPe5Z1x
X-Gm-Gg: AYBFou1YozfeGUGq1DflpaNGaJbi2CE280Zz5ytxaHu9eKPi0aC2znTTZen8+wa7/td
 kcMEz1rYIsiQdVPYySECNxWIy5ZNF7gydjcxw227Ylwra9pE+jHSJJi7G7U2gNk9uGtGFfzfXJE
 V0cQ41i0ML2OK7whrI8fcE6IEKa01dw0D7QA4GZdVV7Cct1Jhsac5ZDN+9rqHb83qDLG3rM4GSz
 BYKGC3jhyyloqYgw5SlFvb+pt5I0YEtZ+hfe/eGd8Vph155ZVXcQB3wQltk9meIM6iFLth+apLT
 QhSHh+R6QgJTfgJTXyQJ3kVPRnhAVebWQr1SnUoogcO22K9AD9ndxUcHTIebzhLxUj7xtP9UNYZ
 bcI/hi6mSoycv0cf8531vSlMlWR5c25j2+NZIDajYrJEMz1jGcg2KsJFdAgPPFt8YVxR4ADTMMz
 1mavS91tAa/OQyThK78iC0S/rEfU6kBRGKObTULHq4rnkbrAonmxw/mFN5s6TzYuk8pBXnVg5Zx
 aKCMpoYP9NUHE9PmZOJed+ILv/L4bnIC2/sLWXBAYGIZC0=
X-Received: by 2002:a05:600c:8b65:b0:49e:6683:d23c with SMTP id
 5b1f17b1804b1-4a18e3ef1bdmr345050635e9.0.1792059920506; 
 Thu, 15 Oct 2026 03:25:20 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1bd9b8ebdsm69844415e9.10.2026.10.15.03.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 03:25:20 -0700 (PDT)
Date: Thu, 15 Oct 2026 11:27:58 +0200
Subject: [PATCH v3 11/50] hw/rtc: ds1338: prefix the file-local helpers
 with ds1338_
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261015-bmc-minerva-v3-11-7d50c8a108e5@free.fr>
References: <20261015-bmc-minerva-v3-0-7d50c8a108e5@free.fr>
In-Reply-To: <20261015-bmc-minerva-v3-0-7d50c8a108e5@free.fr>
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
 Emmanuel Blot <emmanuel.blot@free.fr>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792056475; l=2103;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=FMkjbHnVM4vN5NqR+DRLvhBEQGGHcj2pwxki5uk8mq4=;
 b=oQPF/Etz71xicNB2QlisxChLVRN5OlR6W/80dZOYIHylDcRQVDf4DPkC+7UrrjtqtsysWc3Z9
 jXlZ3BFuIi1AxggnbHO64G+FloWEpuBocXWQ7t2jTq+F5MqHxFgDK1a
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.128.53; envelope-from=eblot.ml@gmail.com;
 helo=mail-wm1-f53.google.com
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

Reviewed-by: Cédric Le Goater <clg@redhat.com>
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
2.53.0-Meta


