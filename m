Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24928C43458
	for <qemu-arm@archiver.kernel.org>; Sun,  5 Jul 2026 14:42:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wgNws-0006FF-63; Sun, 05 Jul 2026 10:35:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wgNwq-00067G-Do
 for qemu-arm@nongnu.org; Sun, 05 Jul 2026 10:35:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wgNwo-0001SZ-Rs
 for qemu-arm@nongnu.org; Sun, 05 Jul 2026 10:35:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1783262154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BTnu3PjGzlRsbS7CoAoKXq3Veho6h75memFBiQUlhOk=;
 b=Sip9WtErnFBeufpazMVb85Y5F3ZPFeuZIq7yv2VPnFXlbUJbwpoU+/eAVQhGdHM0nyngfl
 wFoxhYAVjOAbHkFwFgHK+QXKVU9NU0KzQkeShnTWUtaS4XLnfgwVmMVYpewYm7nQk+5bRB
 fk8t4RWugijotQTvPL8LKdPJL3R4e7A=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-578-sfP-HNDiN6OWs0uSu-ZKHw-1; Sun, 05 Jul 2026 10:35:53 -0400
X-MC-Unique: sfP-HNDiN6OWs0uSu-ZKHw-1
X-Mimecast-MFC-AGG-ID: sfP-HNDiN6OWs0uSu-ZKHw_1783262152
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-475b0b4e8d5so1525519f8f.1
 for <qemu-arm@nongnu.org>; Sun, 05 Jul 2026 07:35:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783262152; x=1783866952;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=BTnu3PjGzlRsbS7CoAoKXq3Veho6h75memFBiQUlhOk=;
 b=J4pgBauqu0MZ43zHHsTp9D5ANfGEOiKD1iObuyUnbaXUO/0PPROeqFNinEujQH3X8B
 fnAXp2FHQMHfS2Npz1ecczzYaivG6YwRU8Ia4csIJJUkdiLzHUtEGHKYJEItw8Cooxdw
 IJdZtsfFdgyFFhaSboFSFPKajfXkwbt/+AmFLC92J3TTdP9q2dIoW+MsN1JlKQEhpnFu
 SCln0LqIT+N2viFYqMEkkeA1OtJCcg5lGjMBL2iw8q7aRc0542imm3w4YgF7ia3PZtEP
 cpbbKuufRdTiEhWVp5cJuzzKU4G5F91wfqoasUuk/SxKS0TDaPL2E2dKA0xTpWvPKTsc
 HrgQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqsCqOl0/r+v9aQ5FTvzkuaU+M9IkC4lxj5R3b6TZbBWzCM9awBV49zzLzqq37Wm9ZnMz2QkJDW+Q==@nongnu.org
X-Gm-Message-State: AOJu0YzSUZl/fkIweNLXghfVpIloqGKzA04pbi+Q/Qe7MOSDe4jhHhgB
 2BUcFHZGlbkmMnLgKbHQDMgppPvbPk07VP+2joPiaM1mBxkYJ6xFRwBppG6/IbWk2SvU8Rjz7WT
 vUJi0zQEnfPDVJnaQ5ysoKsOWzcU9CabZmtmTbhkco6m1nK8ZcJ387g==
X-Gm-Gg: AfdE7cne8b6cWGdCvxHvYpa3U0rK/cnvVwtz4WXCtp7ru401bzmHKoiOiUQUMeepj+H
 j4o9khJeCjd0VJMdRvcFeO/G8uX8/74CnmtkjBduH7PTD0qUCkuT9WWkEoBi8EqouFDSJQNOrcd
 HHuPKXP+Km9NU6PZujZEbS7c1yMoJ75d9gn0Gw8QTW0NWB+GlQMAYxDlgz8anZ3WfCaYUid2YdJ
 WIf222pd8uXXj7PFWVNbQzxf3WmjVTb5Yjc8xgFcG+z3LHVaOEypshbsw2YBajwV1KKIb2tIcHZ
 1QCoFvWbr6MkQfcumdQ6Rjq5aw1mjkdfvn3svMmH3cAg3vmIgaQswq82HdwmUP2RdE2M6qc/zNG
 j9s4QbiLEZ2wWzDWsqvaUOlgnWtPa+xgF
X-Received: by 2002:a5d:5509:0:b0:478:19e7:22a2 with SMTP id
 ffacd0b85a97d-47aac4eb421mr5845192f8f.25.1783262151732; 
 Sun, 05 Jul 2026 07:35:51 -0700 (PDT)
X-Received: by 2002:a5d:5509:0:b0:478:19e7:22a2 with SMTP id
 ffacd0b85a97d-47aac4eb421mr5845165f8f.25.1783262151150; 
 Sun, 05 Jul 2026 07:35:51 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-68-31.inter.net.il. [80.230.68.31])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47aa039afacsm15387892f8f.19.2026.07.05.07.35.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jul 2026 07:35:50 -0700 (PDT)
Date: Sun, 5 Jul 2026 10:35:49 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Leif Lindholm <leif.lindholm@oss.qualcomm.com>, qemu-arm@nongnu.org
Subject: [PULL 28/44] arm: add tracing events to sbsa_gwdt
Message-ID: <88e1d327fdb73e22479c97139fb237dabf6788ff.1783261895.git.mst@redhat.com>
References: <cover.1783261895.git.mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cover.1783261895.git.mst@redhat.com>
X-Mailer: git-send-email 2.51.2.2891.g4157995a80.dirty
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Th56HybBdm6T-5PAYIL4UypHrSogE-qA1hay-6ioKqA_1783262152
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Igor Mammedov <imammedo@redhat.com>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Ani Sinha <anisinha@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Message-ID: <20260702145856.1539572-3-imammedo@redhat.com>
---
 hw/watchdog/sbsa_gwdt.c  | 8 ++++++++
 hw/watchdog/trace-events | 9 +++++++++
 2 files changed, 17 insertions(+)

diff --git a/hw/watchdog/sbsa_gwdt.c b/hw/watchdog/sbsa_gwdt.c
index b739a3ce3c..acb970e8b3 100644
--- a/hw/watchdog/sbsa_gwdt.c
+++ b/hw/watchdog/sbsa_gwdt.c
@@ -24,6 +24,7 @@
 #include "migration/vmstate.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
+#include "trace.h"
 
 static const VMStateDescription vmstate_sbsa_gwdt = {
     .name = "sbsa-gwdt",
@@ -62,6 +63,7 @@ static uint64_t sbsa_gwdt_rread(void *opaque, hwaddr addr, unsigned int size)
         qemu_log_mask(LOG_GUEST_ERROR, "bad address in refresh frame read :"
                         " 0x%x\n", (int)addr);
     }
+    trace_sbsa_gwdt_refresh_read(addr, ret);
     return ret;
 }
 
@@ -93,6 +95,7 @@ static uint64_t sbsa_gwdt_read(void *opaque, hwaddr addr, unsigned int size)
         qemu_log_mask(LOG_GUEST_ERROR, "bad address in control frame read :"
                         " 0x%x\n", (int)addr);
     }
+    trace_sbsa_gwdt_control_read(addr, ret);
     return ret;
 }
 
@@ -127,6 +130,7 @@ static void sbsa_gwdt_rwrite(void *opaque, hwaddr offset, uint64_t data,
                              unsigned size) {
     SBSA_GWDTState *s = SBSA_GWDT(opaque);
 
+    trace_sbsa_gwdt_refresh_write(offset, data);
     if (offset == SBSA_GWDT_WRR) {
         s->wcs &= ~(SBSA_GWDT_WCS_WS0 | SBSA_GWDT_WCS_WS1);
 
@@ -141,6 +145,7 @@ static void sbsa_gwdt_write(void *opaque, hwaddr offset, uint64_t data,
                              unsigned size) {
     SBSA_GWDTState *s = SBSA_GWDT(opaque);
 
+    trace_sbsa_gwdt_control_write(offset, data);
     switch (offset) {
     case SBSA_GWDT_WCS:
         s->wcs = data & SBSA_GWDT_WCS_EN;
@@ -180,6 +185,7 @@ static void wdt_sbsa_gwdt_reset(DeviceState *dev)
 {
     SBSA_GWDTState *s = SBSA_GWDT(dev);
 
+    trace_sbsa_gwdt_reset();
     timer_del(s->timer);
 
     s->wcs  = 0;
@@ -196,10 +202,12 @@ static void sbsa_gwdt_timer_sysinterrupt(void *opaque)
 
     if (!(s->wcs & SBSA_GWDT_WCS_WS0)) {
         s->wcs |= SBSA_GWDT_WCS_WS0;
+        trace_sbsa_gwdt_ws0_asserted();
         sbsa_gwdt_update_timer(s, TIMEOUT_REFRESH);
         qemu_set_irq(s->irq, 1);
     } else {
         s->wcs |= SBSA_GWDT_WCS_WS1;
+        trace_sbsa_gwdt_ws1_asserted();
         qemu_log_mask(CPU_LOG_RESET, "Watchdog timer expired.\n");
         /*
          * Reset the watchdog only if the guest gets notified about
diff --git a/hw/watchdog/trace-events b/hw/watchdog/trace-events
index d85b3ca769..b388f7b250 100644
--- a/hw/watchdog/trace-events
+++ b/hw/watchdog/trace-events
@@ -42,3 +42,12 @@ k230_wdt_interrupt(void) "K230 WDT interrupt"
 k230_wdt_reset(void) "K230 WDT system reset"
 k230_wdt_restart(void) "K230 WDT restart"
 k230_wdt_reset_device(void) "K230 WDT device reset"
+
+#sbsa_gwdt.c
+sbsa_gwdt_refresh_read(uint64_t addr, uint32_t value) "[0x%" PRIx64 "] -> 0x%" PRIx32
+sbsa_gwdt_refresh_write(uint64_t addr, uint64_t value) "[0x%" PRIx64 "] <- 0x%" PRIx64
+sbsa_gwdt_control_read(uint64_t addr, uint32_t value) "[0x%" PRIx64 "] -> 0x%" PRIx32
+sbsa_gwdt_control_write(uint64_t addr, uint64_t value) "[0x%" PRIx64 "] <- 0x%" PRIx64
+sbsa_gwdt_ws0_asserted(void) "WS0 signal is asserted"
+sbsa_gwdt_ws1_asserted(void) "WS1 signal is asserted"
+sbsa_gwdt_reset(void) "reset watchdog to default state"
-- 
MST


