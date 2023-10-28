Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp813866ejc;
        Sat, 28 Oct 2023 05:25:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlHL3zA0dcvhMIjLdqRm1UBD8LqHHXnpMieyloQtlW5VA1mmuDFPfUMFG+9ZFwEElliTxF
X-Received: by 2002:a05:622a:90a:b0:41e:2c87:e84 with SMTP id bx10-20020a05622a090a00b0041e2c870e84mr5272161qtb.30.1698495941310;
        Sat, 28 Oct 2023 05:25:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698495941; cv=none;
        d=google.com; s=arc-20160816;
        b=Wt6rukeB0TUJgSarIznQUF/yUFEvFASViVtzGj9Q3WRMjRJixzL+dxCKz/1+oI0TUn
         /HZOteZ11CAsLnNX9b3gK7dZex3X5q7krjHGy2YBPCicSaTy8CgLZRWlpU/YZV4hpmpZ
         rvelFwgWZD/jtRfxFLwPehlffs9Rq9gFfnTUN8uXcLINPdMXc4cBTJlj8zT3b9zbuZfw
         OQRV6f/Dz/dKBpTFx/XTutfbgspkTZKn/ltZQ0Hs+3zVtMBBWnnbbK/ysdd2Jq2FJK23
         fo1GMCKaW1jm7PO2RhZVoEhUydH0WFAHuHemrWuSO/xx1TbxWKoUOvv1FDVKgUgzpl2a
         ZwOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Z+50/O4PNCKQH2UPmRwpwa8C3hjwmP+3AadueA5nS0w=;
        fh=mPN9/WblWXCg2g59vjErH+E42ODcsdjD5KgDEJZDWAk=;
        b=ut9A9kGs2I7ocJi162PP4vylJMJHWPebJKuepmvBECKM2tOrYeXQyk/kELlajBeaei
         V36idOZnMWyas/30bhxOyW+4bQJZ7mRd3mfRF9LCyyCFFNW6j6/q5n/SwYsiOw1XOHfJ
         oF1o46LhnZVQO5gaPOMUQcwuaLqBYoKJaxxPHb78BBhhVexl2x8urie+56F2mqbkcsjn
         ZaXYGam7Bu+FO6+2XwAwwSPmAcT1jklO0k+HMLtTf03EMix+4IG2+tJDxkcwiWAvt8ij
         5GtqDXUqOdRIfUjr0/qHJ2nWcyNbtvoQ7lfh/axIFYvmSjPV0NqygodI5dhxvNJy02xN
         bs0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=PapyUXBe;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w4-20020a05622a190400b0041986d97773si2278387qtc.580.2023.10.28.05.25.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 28 Oct 2023 05:25:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=PapyUXBe;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qwiMj-0006Kk-QO; Sat, 28 Oct 2023 08:24:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1qwiMi-0006Jw-2C; Sat, 28 Oct 2023 08:24:32 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1qwiMg-0006lP-CW; Sat, 28 Oct 2023 08:24:31 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5409bc907edso4520477a12.0; 
 Sat, 28 Oct 2023 05:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698495867; x=1699100667; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z+50/O4PNCKQH2UPmRwpwa8C3hjwmP+3AadueA5nS0w=;
 b=PapyUXBeuUVf0POH/6KHuqPs+IigD3SggaKDpbhME/1n8E+il45JauEHKciIhLvH1u
 tF0t7yA+1gwXmdv+cEM3E0UPoJVxRbiJQWZ88ZuxQQjoeRyWkunq3UGxtBNMqYcVkolk
 snfk2AdZxdy9E+NmYxH/TQ0hG2jqfJ2KVPlrwlyCC1+7xZuDzxVJsoOEHpNLeAD9fqEC
 lM5ZSZqqhGGvKBHe5BGt9KQWFzbXacITsr9lYC7BZ+Mcz00hDNHQPncWyge6DNkar91L
 W7+h+iU97G7SMAXeNeEKg+p1yZ/AlueQrT6Y8T3Vx7HYZj6FcL5EFSd1ifsKPxxdFiM4
 DYUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698495867; x=1699100667;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z+50/O4PNCKQH2UPmRwpwa8C3hjwmP+3AadueA5nS0w=;
 b=vw4T+S89qaLjWEZNg6pPUetl+HtZRhSlrLIO89DT2Yp7xAfHLG3HyB39nqr2ztxTPo
 0yXsz3u7pbmxwUXhR7NDGX6B5EWJBLiDzP/FIQ02WawR7KZdl3dHioC4W1Z8cs3G0pZl
 TelOgX/qr4pnaZhPUfewMfSXy9SyAHnuP+u7Ueq+znQGq9Cq6lqBib/QmkD95qL6H+bm
 wVPz+BIUzeN0wXuymFtkvfciQZqn3GmrzhNu+AUVE17R4nqxcxARoqAImKmlAHYtXWGp
 SWtAhHVs15V9dWO0xQp2+pFp4H9cMACt7uV7k3axF1px5yvBxqqDu2rN32HnrcsXQLgA
 Ee/Q==
X-Gm-Message-State: AOJu0Yy3c5S0YqO6fv3MTpu1EVDvNWD3j6N1xgC98lbTIW0R6JVkmfwZ
 efWyMh4JrIXpgFmJc9XbV19trtszWXI=
X-Received: by 2002:a17:907:1c25:b0:9ae:50e3:7e40 with SMTP id
 nc37-20020a1709071c2500b009ae50e37e40mr4172825ejc.52.1698495867279; 
 Sat, 28 Oct 2023 05:24:27 -0700 (PDT)
Received: from archlinux.. (dynamic-089-012-044-170.89.12.pool.telefonica.de.
 [89.12.44.170]) by smtp.gmail.com with ESMTPSA id
 a13-20020a170906190d00b009ae3d711fd9sm2706687eje.69.2023.10.28.05.24.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Oct 2023 05:24:26 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Mads Ynddal <mads@ynddal.dk>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 1/6] hw/watchdog/wdt_imx2: Trace MMIO access
Date: Sat, 28 Oct 2023 14:24:10 +0200
Message-ID: <20231028122415.14869-2-shentey@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231028122415.14869-1-shentey@gmail.com>
References: <20231028122415.14869-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: iRBl7eq0FsTG

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/watchdog/wdt_imx2.c   | 24 ++++++++++++++++++------
 hw/watchdog/trace-events |  4 ++++
 2 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/hw/watchdog/wdt_imx2.c b/hw/watchdog/wdt_imx2.c
index e776a2fbd4..885ebd3978 100644
--- a/hw/watchdog/wdt_imx2.c
+++ b/hw/watchdog/wdt_imx2.c
@@ -17,6 +17,7 @@
 #include "hw/qdev-properties.h"
 
 #include "hw/watchdog/wdt_imx2.h"
+#include "trace.h"
 
 static void imx2_wdt_interrupt(void *opaque)
 {
@@ -67,20 +68,29 @@ static void imx2_wdt_reset(DeviceState *dev)
 static uint64_t imx2_wdt_read(void *opaque, hwaddr addr, unsigned int size)
 {
     IMX2WdtState *s = IMX2_WDT(opaque);
+    uint16_t value = 0;
 
     switch (addr) {
     case IMX2_WDT_WCR:
-        return s->wcr;
+        value = s->wcr;
+        break;
     case IMX2_WDT_WSR:
-        return s->wsr;
+        value = s->wsr;
+        break;
     case IMX2_WDT_WRSR:
-        return s->wrsr;
+        value = s->wrsr;
+        break;
     case IMX2_WDT_WICR:
-        return s->wicr;
+        value = s->wicr;
+        break;
     case IMX2_WDT_WMCR:
-        return s->wmcr;
+        value = s->wmcr;
+        break;
     }
-    return 0;
+
+    trace_imx2_wdt_read(addr, value);
+
+    return value;
 }
 
 static void imx_wdt2_update_itimer(IMX2WdtState *s, bool start)
@@ -137,6 +147,8 @@ static void imx2_wdt_write(void *opaque, hwaddr addr,
 {
     IMX2WdtState *s = IMX2_WDT(opaque);
 
+    trace_imx2_wdt_write(addr, value);
+
     switch (addr) {
     case IMX2_WDT_WCR:
         if (s->wcr_locked) {
diff --git a/hw/watchdog/trace-events b/hw/watchdog/trace-events
index 2739570652..874968cc06 100644
--- a/hw/watchdog/trace-events
+++ b/hw/watchdog/trace-events
@@ -17,6 +17,10 @@ cmsdk_apb_watchdog_lock(uint32_t lock) "CMSDK APB watchdog: lock %" PRIu32
 aspeed_wdt_read(uint64_t addr, uint32_t size) "@0x%" PRIx64 " size=%d"
 aspeed_wdt_write(uint64_t addr, uint32_t size, uint64_t data) "@0x%" PRIx64 " size=%d value=0x%"PRIx64
 
+# wdt_imx2.c
+imx2_wdt_read(uint32_t addr, uint16_t data) "[0x%" PRIx32 "] -> 0x%" PRIx16
+imx2_wdt_write(uint32_t addr, uint16_t data) "[0x%" PRIx32 "] <- 0x%" PRIx16
+
 # spapr_watchdog.c
 spapr_watchdog_start(uint64_t flags, uint64_t num, uint64_t timeout) "Flags 0x%" PRIx64 " num=%" PRId64 " %" PRIu64 "ms"
 spapr_watchdog_stop(uint64_t num, uint64_t ret) "num=%" PRIu64 " ret=%" PRId64
-- 
2.42.0

