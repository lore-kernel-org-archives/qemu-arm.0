Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1CC8CA0ED1
	for <qemu-arm@archiver.kernel.org>; Mon, 11 Aug 2025 21:37:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ulaCP-0007H3-Pg; Mon, 11 Aug 2025 17:36:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3Y2KaaAgKCNw9FGJJGCPEMMEJC.AMKOCKS-8PKLMLELS.MPE@flex--bhillier.bounces.google.com>)
 id 1ulaCN-0007Ge-5H
 for qemu-arm@nongnu.org; Mon, 11 Aug 2025 17:36:55 -0400
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3Y2KaaAgKCNw9FGJJGCPEMMEJC.AMKOCKS-8PKLMLELS.MPE@flex--bhillier.bounces.google.com>)
 id 1ulaCB-0001SB-OF
 for qemu-arm@nongnu.org; Mon, 11 Aug 2025 17:36:54 -0400
Received: by mail-pf1-x44a.google.com with SMTP id
 d2e1a72fcca58-76bfab12672so9687779b3a.0
 for <qemu-arm@nongnu.org>; Mon, 11 Aug 2025 14:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1754948195; x=1755552995; darn=nongnu.org;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=eZmDu3jdm85zT/kkoUu6drjP5lcoEw7fmNxr6cvxvOc=;
 b=FfsWSXzUG1lpk611EoPBjJjYzGrVHCOL3qzOs4/QQCQ7esVEKilhrCHCvjiUb4QfAm
 ZuHwqSAEvUM/+EvAqsS1Lo6lDWAidI0aUqQssr/1r0E6qFrRP032OwFhkQWi6yP3k4xX
 Fq3BPaPAKfXQl4cgQmJ0GmRGGiOJxls5xJAMH/5YBj+VataiAEhiZlslJFBEwstdN0/e
 /3zFrzFVGJPKxah3wzsaAhoc4Ux+WeOeoPofPvnANx/XOjJs5Y5ViVQL9vtwf5MspJ83
 /jYWNEVDydEUHogb01k6mAg5Iz2lWet5vN5ATNwCkGrBFy0wbK4pOT7H3sgbr9VeGeZP
 S3cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754948195; x=1755552995;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eZmDu3jdm85zT/kkoUu6drjP5lcoEw7fmNxr6cvxvOc=;
 b=EDc/UD1a2zcI81VzJAekfl+FU+dN1Rrur7mi3hytmmw2tlhXB1/c10+GsIMf8x2HK9
 b2LjVARlZIpTRKbFXMQzx5n4+d+r53VHFwllu/kgAl2uW62t5ZSVq6aLPudaJrRX+n37
 9gEdbCLpKhOLlKufDQc0kfs+V7JVubTbvr4P3Ran8lyEG4+P/crM1gd8lL+YYZWeyBKO
 kKW5PA8IDJs/x6+73EOd8P46RIYzTlcj+vtqq/73lwxje88E/rnUXP8darbfUlIBvSwZ
 9127AJHkLmeyymdrgU5OZrEp52bGZNpReiISMgG2OL7DmGZ77FitYY86nCdFR0j/C1ez
 BQNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNrI079pCEWznUavViVojs753iVZ/TJLJPNROrFNPPokt5nQ2IJuVJWJMX1PIx4aljmAqVc1uVWQ==@nongnu.org
X-Gm-Message-State: AOJu0YyFqPjg43gns1mgULLAALR/fNQ6tJt8kefp5AlF78WQem0tuTUX
 FN5DouP9jcPhrjkwU6vhMN4Hjp1CEU0xXEy8En6afrM9fa1rVIWyFYGWBE2eXBHQjvcHJNvCN1K
 eSMiTvW/B6wJBdQ==
X-Google-Smtp-Source: AGHT+IG94lKLP9Y8GMEv/VHbQbhw3MdTobj5no2b5qJW7sNIP6qpEjibOgqGlj2zML+Gk9MXsX71uxcrhuoXyA==
X-Received: from pfbmy9-n2.prod.google.com
 ([2002:a05:6a00:6d49:20b0:76c:4298:869f])
 (user=bhillier job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:4fce:b0:748:ed51:1305 with SMTP id
 d2e1a72fcca58-76c460906b2mr17113212b3a.5.1754948195094; 
 Mon, 11 Aug 2025 14:36:35 -0700 (PDT)
Date: Mon, 11 Aug 2025 21:36:31 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.rc0.155.g4a0f42376b-goog
Message-ID: <20250811213631.2197063-1-bhillier@google.com>
Subject: [PATCH v2] hw/sensor: add stub for ADM1266 blackbox
From: Ben Hillier <bhillier@google.com>
To: wuhaotsh@google.com, kfting@nuvoton.com
Cc: philmd@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::44a;
 envelope-from=3Y2KaaAgKCNw9FGJJGCPEMMEJC.AMKOCKS-8PKLMLELS.MPE@flex--bhillier.bounces.google.com;
 helo=mail-pf1-x44a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, T_SPF_HELO_TEMPERROR=0.01, T_SPF_TEMPERROR=0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: Titus Rwantare <titusr@google.com>

This patch fixes a bug that causes a kernel panic when calling ADM1266_BLACKBOX_INFORMATION.

Log Message:

adm1266 5-0042: Could not read blackbox!
Kernel panic - not syncing: stack-protector: Kernel stack is corrupted in: adm1266_nvmem_read+0x168/0x170

Signed-off-by: Titus Rwantare <titusr@google.com>
---
 hw/sensor/adm1266.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/hw/sensor/adm1266.c b/hw/sensor/adm1266.c
index 9017ce6116..cd11526c2b 100644
--- a/hw/sensor/adm1266.c
+++ b/hw/sensor/adm1266.c
@@ -75,6 +75,7 @@ typedef struct ADM1266State {
 static const uint8_t adm1266_ic_device_id[] = {0x03, 0x41, 0x12, 0x66};
 static const uint8_t adm1266_ic_device_rev[] = {0x08, 0x01, 0x08, 0x07, 0x0,
                                                 0x0, 0x07, 0x41, 0x30};
+static const uint8_t adm1266_blackbox_info[] = {0x04, 0x00, 0x00, 0x00, 0x00};
 
 static void adm1266_exit_reset(Object *obj, ResetType type)
 {
@@ -125,6 +126,17 @@ static uint8_t adm1266_read_byte(PMBusDevice *pmdev)
         pmbus_send(pmdev, adm1266_ic_device_rev, sizeof(adm1266_ic_device_rev));
         break;
 
+    case ADM1266_BLACKBOX_CONFIG:
+        return 0;
+
+    case ADM1266_READ_BLACKBOX:
+        return 0;
+
+    case ADM1266_BLACKBOX_INFORMATION:
+        pmbus_send(pmdev, adm1266_blackbox_info,
+                   sizeof(adm1266_blackbox_info));
+        break;
+
     default:
         qemu_log_mask(LOG_UNIMP,
                       "%s: reading from unimplemented register: 0x%02x\n",
@@ -154,6 +166,9 @@ static int adm1266_write_data(PMBusDevice *pmdev, const uint8_t *buf,
         pmbus_receive_block(pmdev, (uint8_t *)s->mfr_rev, sizeof(s->mfr_rev));
         break;
 
+    case ADM1266_BLACKBOX_CONFIG:
+    case ADM1266_READ_BLACKBOX:
+    case ADM1266_BLACKBOX_INFORMATION:
     case ADM1266_SET_RTC:   /* do nothing */
         break;
 
-- 
2.51.0.rc0.155.g4a0f42376b-goog


