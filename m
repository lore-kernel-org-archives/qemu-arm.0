Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp1676552lfc;
        Sun, 24 May 2020 20:47:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGi6q7sLqIOUJBMmmT+JOPpibzco5clBAWFpnZULqlPelR9jlH5/9MO1enyoPWErrljc5Z
X-Received: by 2002:ac8:7112:: with SMTP id z18mr1562882qto.274.1590378429634;
        Sun, 24 May 2020 20:47:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590378429; cv=none;
        d=google.com; s=arc-20160816;
        b=qlFCGM2Ku9U6Dui/BsNg9eL1F8aUKerscLYFD6pF/oJ33pFAdetqMyb8p+0K2xD5wX
         CdMFAAT4ndUtkIHF1c9X7/ejjSS02365hUTs1lgP79W/pntJEU5XjeZtceMKxw9caXF/
         043J6YcHAZWhAopy8UCAg2FH0/TcL9ryM1HRdsnFZ3TGcWO48rvrr9kd/bUb0qdqlftI
         DHQnPB1uTllEiciweigt5Ossf8uchHU1tQ9OEXUHBtkHgkugOXmQxheHUigZLzfT3sNa
         gw62IBoIL7GLIPLnI7YvgzUAcxLkl3gQm9mvkOLVn3RZlS+I0HaHVgowR8R9sypVs+OO
         WWrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=A80EDSkKnmPL8Q+dFqA3I3MZqZ/GPALeIVPMrzoZlZc=;
        b=zm11CwOkH5FfKt9VcVXevCXcrDxQDG057XYl5OUMxPL1icL+jZA/uQcirlT9iopZdK
         rOyJH5KjwuzFnKExbck21swI58A8CVXvUERilxKBR/KH9JH8sPa/mH6xo4HPyji7pRGU
         g2ZHoxr+/vTNKMyGqV58X0NpXTMcWZ3MgaybKhT3Da9I2C+vUiu2JoUSHg+0+dDbKkN6
         nuRfyZnyQxARUFyX3Mp56IIdb2ANlpPXcoZu0GhLtm7bKKD3QOZStNJB6QnTVA16V+fY
         PUUpUR1tUTgxH6jvqzT2U59Kbi/Hc3WXeWYfO9RTY3+2UPG08IoE3HdRTFXYNUi0W0Rn
         8U1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="Q7a5JY+/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c15si7980764qvo.71.2020.05.24.20.47.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 24 May 2020 20:47:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="Q7a5JY+/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:53146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jd44z-0001aV-1j
	for alex.bennee@linaro.org; Sun, 24 May 2020 23:47:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jd432-0008Dt-9d; Sun, 24 May 2020 23:45:39 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:38411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jd430-0006vp-Uu; Sun, 24 May 2020 23:45:08 -0400
Received: by mail-wr1-x433.google.com with SMTP id e1so15794036wrt.5;
 Sun, 24 May 2020 20:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A80EDSkKnmPL8Q+dFqA3I3MZqZ/GPALeIVPMrzoZlZc=;
 b=Q7a5JY+/x/Fx8Puy7mvB8bc96TFJwCYWRF1TNHrzBQ6wS280/G0dWTYtryHJp9/RG9
 BjV8BW6CmxY8NkIPacBmsCDs/n/8JDo+VNkPuh8K3XZGXLHQBj8eeSeKg++PavsFF6NI
 bgrD29jq1stlaQYZiYyAp4fskPLfpFNwy/jWuHH/BhDvCyVkOnCk/Nv1EoQt/s2Bc++5
 UX6IjzzSobNjtXHCJfXlEsZNnkn7GT9MoYJU1HRrWVgic+KjudfaV/RNMTzPjj/6vpXz
 N3hG6KJx01xhYx6GQT1tvLsdARhPVheO+bbc67WDfzV15qp5qm0B9MQ6GDJFC0GPMp7y
 tsGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=A80EDSkKnmPL8Q+dFqA3I3MZqZ/GPALeIVPMrzoZlZc=;
 b=hb3qpWlk80Nq+8IHooA5KNRetoTEj8E2mv2uMWKwYpPSTv0ilmUXD0K88LavgVkR67
 wftyTGntz715qvfX0xQe5yKiNPCl10DS77M0Gz1eZDQTRP28lFTnHhCwOJnX6LteAb9e
 pT5af4F9LNvSLQP9w6/IYxBSY4b8qa0qHnuEuUCCvpOkmSwM7E6UdfZaubojAFsV6ASo
 mSDZvYoXCUdycN1t00HLz2jPEN/Smb/wuzl606zhb5jWMO9w+jMx6Fa1Wjl8QfR31nnP
 Go1C9lntm72tMFCvM5Va+fBPh/JiT/2EKij0B0p9YMFV/RQz6Rx2H7X77b4OOF/qduka
 FRKA==
X-Gm-Message-State: AOAM531xZLBh1ey7LLqt5CMV5IVnpAYXKndCJjjvBgIZ0g1w/6hsCXf1
 D+gyAkaEHxozR9116gxTyEItXJrT5E0=
X-Received: by 2002:a5d:6806:: with SMTP id w6mr13727886wru.324.1590378304686; 
 Sun, 24 May 2020 20:45:04 -0700 (PDT)
Received: from localhost.localdomain (71.red-88-21-204.staticip.rima-tde.net.
 [88.21.204.71])
 by smtp.gmail.com with ESMTPSA id n9sm17555150wmj.5.2020.05.24.20.45.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2020 20:45:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] hw/display/dpcd: Convert debug printf()s to trace events
Date: Mon, 25 May 2020 05:44:58 +0200
Message-Id: <20200525034459.28535-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200525034459.28535-1-f4bug@amsat.org>
References: <20200525034459.28535-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SgdL1Imdckf2

Convert DPRINTF() to trace events and remove ifdef'ry.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/display/dpcd.c       | 16 +++-------------
 hw/display/trace-events |  4 ++++
 2 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/hw/display/dpcd.c b/hw/display/dpcd.c
index 0c1b7b35fb..64463654a1 100644
--- a/hw/display/dpcd.c
+++ b/hw/display/dpcd.c
@@ -32,16 +32,7 @@
 #include "hw/misc/auxbus.h"
 #include "migration/vmstate.h"
 #include "hw/display/dpcd.h"
-
-#ifndef DEBUG_DPCD
-#define DEBUG_DPCD 0
-#endif
-
-#define DPRINTF(fmt, ...) do {                                                 \
-    if (DEBUG_DPCD) {                                                          \
-        qemu_log("dpcd: " fmt, ## __VA_ARGS__);                                \
-    }                                                                          \
-} while (0)
+#include "trace.h"
 
 #define DPCD_READABLE_AREA                      0x600
 
@@ -70,8 +61,8 @@ static uint64_t dpcd_read(void *opaque, hwaddr offset, unsigned size)
                                        offset);
         ret = 0;
     }
+    trace_dpcd_read(offset, ret);
 
-    DPRINTF("read 0x%" PRIX8 " @0x%" HWADDR_PRIX "\n", ret, offset);
     return ret;
 }
 
@@ -80,8 +71,7 @@ static void dpcd_write(void *opaque, hwaddr offset, uint64_t value,
 {
     DPCDState *e = DPCD(opaque);
 
-    DPRINTF("write 0x%" PRIX8 " @0x%" HWADDR_PRIX "\n", (uint8_t)value, offset);
-
+    trace_dpcd_write(offset, value);
     if (offset < DPCD_READABLE_AREA) {
         e->dpcd_info[offset] = value;
     } else {
diff --git a/hw/display/trace-events b/hw/display/trace-events
index e6e22bef88..00543f1601 100644
--- a/hw/display/trace-events
+++ b/hw/display/trace-events
@@ -151,3 +151,7 @@ artist_vram_write(unsigned int size, uint64_t addr, uint64_t val) "%u 0x%"PRIx64
 artist_fill_window(unsigned int start_x, unsigned int start_y, unsigned int width, unsigned int height, uint32_t op, uint32_t ctlpln) "start=%ux%u length=%ux%u op=0x%08x ctlpln=0x%08x"
 artist_block_move(unsigned int start_x, unsigned int start_y, unsigned int dest_x, unsigned int dest_y, unsigned int width, unsigned int height) "source %ux%u -> dest %ux%u size %ux%u"
 artist_draw_line(unsigned int start_x, unsigned int start_y, unsigned int end_x, unsigned int end_y) "%ux%u %ux%u"
+
+# dpcd.c
+dpcd_read(uint32_t addr, uint8_t val) "read addr:0x%"PRIx32" val:0x%02x"
+dpcd_write(uint32_t addr, uint8_t val) "write addr:0x%"PRIx32" val:0x%02x"
-- 
2.21.3

