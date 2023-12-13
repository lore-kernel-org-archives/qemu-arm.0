Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1698521ejo;
        Wed, 13 Dec 2023 07:24:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHv6CxdBVy5OtAGmy4V1G3SgCLoSbZcZAUql2oGNBhyxpBrwC936hNguPzALmkCEopeiuwl
X-Received: by 2002:a05:620a:c0a:b0:77e:fba3:9d23 with SMTP id l10-20020a05620a0c0a00b0077efba39d23mr7310214qki.135.1702481073926;
        Wed, 13 Dec 2023 07:24:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702481073; cv=none;
        d=google.com; s=arc-20160816;
        b=hXNcZSR1yM89lGcqz1abrnkEHpJyNtJak7qQ/7dd0YmWESCAaw0JHqElwksABcUwDI
         b9y0+QI8igaLX/RC+t6dN5j/kTgi9+NR9aVIq2NUPwBG6KqHIS5EfzTeJwLlz4VE8TwD
         f5fctbHD63H2d1JumTCwb4sT+xqM+pXFOkrd3nENuqn8AaeUhsZAvIDMabBdC3y0lF6I
         bm+e0A01MEO5Eil0N0qcme/mVlQxQIrLl4MDScNph6x8PkdzYcbXKwk/W5B2gAh3Q7vl
         hFYC3EZoepqbZjbiaTNoZJGbSCbIIHS9YcXhrI0qkzMuTRKiyQdoN2/Mi+4dTKqAfUSm
         rpJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=ybqRWK4HgPcyr51ZRhSwhspIirUpVXmhKwGVvfg2fog=;
        fh=6pWz0S/RTNNh5TaWalpacmSI6QJrGk8qVf0mXbYj/wk=;
        b=QFCR0go1hLvnqqODSFtDqbVVdOpPoe6HdsRrcNVKQ6WKZ1Wdu+IjkczAANxCElh8TR
         Kt55DHGSumERNx6tfIV+m30a0161jBZbPH41Zwyt7JbLZH/Od6I4qv44tRS8Ju9L1528
         KZwUZrnOVlLe7TWRCNrlSYUvcuwrhxxlb5mZqmNw7hfkbwgPCQguZqAJfb104Mijl3Js
         EJISEgHcXLlOWSjvtFnJdyWroxAPlvb3KyYsPGvEevgPSC1uQJpCStNp9yjqpGgllnuZ
         cCI0lLhmjq3V8qVTcLrNKpVpjYJFEFl6DlxSnClT1qe2DbFeyh1abV7QJ52eKJdOC4ak
         7l3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=XAbXqgoG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m19-20020a05620a24d300b0077f62e42f75si10465892qkn.584.2023.12.13.07.24.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Dec 2023 07:24:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=XAbXqgoG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rDR64-0002WS-Su; Wed, 13 Dec 2023 10:24:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <n.ostrenkov@gmail.com>)
 id 1rDR62-0002VD-Pc; Wed, 13 Dec 2023 10:24:26 -0500
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <n.ostrenkov@gmail.com>)
 id 1rDR60-0002Zo-Sq; Wed, 13 Dec 2023 10:24:26 -0500
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2cc2683fdaaso29457211fa.0; 
 Wed, 13 Dec 2023 07:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702481062; x=1703085862; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ybqRWK4HgPcyr51ZRhSwhspIirUpVXmhKwGVvfg2fog=;
 b=XAbXqgoGGXBf6J1iiwE/ph29mxj48CKvfBP2J1P8zKFaVRWNO1cTewFIV6blpArZ8F
 9A5owl/KWSD5/AWiTzLweqShNEGMtblZM9qyDsGWVHF5rjJ34reufk2d6VZNDaTQFzfk
 U/5B353nkWdaIuvTntevW9gqxldPARs7+n+DE7u7i4fh5L9J8rdHb1HVicFtDwC1QNaW
 OXkhjrc2Zn7aaSSiVw67imf2wywwFpFtdJ+xnhwTb//U8OR3qh0TGWYqt5cyKisP8pcg
 fxuvGNbk0uCw/44L2LqN/8p9whr7Jv4EKRtU6rXcy2K+l6oCFhvJMVQAZJ9OnJ48wqnu
 7sJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702481062; x=1703085862;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ybqRWK4HgPcyr51ZRhSwhspIirUpVXmhKwGVvfg2fog=;
 b=Fq+MazFpUVvul2vrc1Hhzdbdsohj591AafkPYGrR67d352AvvVMaDaGwGIHPjY+7TS
 HiRANYVQKzF3oEq8KYPrs6fNTtONY4u/wbXxGZQf2jSw9AS8P6x3Wb9dpUEJqdOgTqT5
 Q3DavgJKLfvu/c5oQR37w6JbvjDqSAEwm1bkmwHDsbX44S3x2OpbxGZ17Fx2to1XCYOg
 tjYvLMyPL0FrjMVHfIOzRwwkuoBt2mO9cKJkMjGewpcKgJuO92VCsuegVkPiyP7Id5BD
 /9mOHgEWXwpo0ZQfHXO9lAQgRdb9NKXrWoXb53V+DddvoSeA5FxzP4rX8XmSWewiQE9I
 owpw==
X-Gm-Message-State: AOJu0YyqW3VQqywnQLm3MleRU1cN2k0t6M29uMzVnzcPRHX27+BOuLul
 uy5HAUP40ZmKEaIrYlKuX8gAdXRgX1/fvI+e
X-Received: by 2002:a05:651c:19a0:b0:2cc:1fb5:8ea9 with SMTP id
 bx32-20020a05651c19a000b002cc1fb58ea9mr3475476ljb.2.1702481061637; 
 Wed, 13 Dec 2023 07:24:21 -0800 (PST)
Received: from localhost.localdomain ([176.120.189.69])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a2e9812000000b002c9f3ba5c22sm1881355ljj.118.2023.12.13.07.24.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Dec 2023 07:24:21 -0800 (PST)
From: Nikita Ostrenkov <n.ostrenkov@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Andrey Smirnov <andrew.smirnov@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Nikita Ostrenkov <n.ostrenkov@gmail.com>
Subject: [PATCH v2] fsl-imx: add simple RTC emulation for i.MX6 and i.MX7
 boards
Date: Wed, 13 Dec 2023 15:24:08 +0000
Message-Id: <20231213152408.2533-1-n.ostrenkov@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=n.ostrenkov@gmail.com; helo=mail-lj1-x230.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: g8luBQ66/QxN

Signed-off-by: Nikita Ostrenkov <n.ostrenkov@gmail.com>
---
 hw/misc/imx7_snvs.c         | 70 +++++++++++++++++++++++++++++++++----
 hw/misc/trace-events        |  4 +--
 include/hw/misc/imx7_snvs.h |  7 +++-
 3 files changed, 71 insertions(+), 10 deletions(-)

diff --git a/hw/misc/imx7_snvs.c b/hw/misc/imx7_snvs.c
index a245f96cd4..98fe51aa66 100644
--- a/hw/misc/imx7_snvs.c
+++ b/hw/misc/imx7_snvs.c
@@ -13,28 +13,79 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/timer.h"
 #include "hw/misc/imx7_snvs.h"
 #include "qemu/module.h"
+#include "sysemu/sysemu.h"
 #include "sysemu/runstate.h"
 #include "trace.h"
 
+#define RTC_FREQ    32768ULL
+
+static uint64_t imx7_snvs_get_count(IMX7SNVSState *s)
+{
+    int64_t ticks = muldiv64(qemu_clock_get_ns(rtc_clock), RTC_FREQ, 
+                             NANOSECONDS_PER_SECOND);
+    return s->tick_offset + ticks;
+}
+
 static uint64_t imx7_snvs_read(void *opaque, hwaddr offset, unsigned size)
 {
-    trace_imx7_snvs_read(offset, 0);
+    IMX7SNVSState *s = opaque;
+    uint64_t ret = 0;
 
-    return 0;
+    switch (offset) {
+    case SNVS_LPSRTCMR:
+        ret = (imx7_snvs_get_count(s) >> 32) & 0x7fffU;
+        break;
+    case SNVS_LPSRTCLR:
+        ret = imx7_snvs_get_count(s) & 0xffffffffU;
+        break;
+    case SNVS_LPCR:
+        ret = s->lpcr;
+        break;
+    }
+
+    trace_imx7_snvs_read(offset, ret, size);
+
+    return ret;
 }
 
 static void imx7_snvs_write(void *opaque, hwaddr offset,
                             uint64_t v, unsigned size)
 {
-    const uint32_t value = v;
-    const uint32_t mask  = SNVS_LPCR_TOP | SNVS_LPCR_DP_EN;
+    trace_imx7_snvs_write(offset, v, size);
+
+    IMX7SNVSState *s = opaque;
 
-    trace_imx7_snvs_write(offset, value);
+    uint64_t new_value = 0, snvs_count = 0;
 
-    if (offset == SNVS_LPCR && ((value & mask) == mask)) {
-        qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
+    if (offset == SNVS_LPSRTCMR || offset == SNVS_LPSRTCLR) {
+        snvs_count = imx7_snvs_get_count(s);
+    }
+
+    switch (offset) {
+    case SNVS_LPSRTCMR:
+        new_value = (snvs_count & 0xffffffffU) | (v << 32);
+        break;
+    case SNVS_LPSRTCLR:
+        new_value = (snvs_count & 0x7fff00000000ULL) | v;
+        break;
+    case SNVS_LPCR: {
+        s->lpcr = v;
+
+        const uint32_t value = v;
+        const uint32_t mask  = SNVS_LPCR_TOP | SNVS_LPCR_DP_EN;
+
+        if ((value & mask) == mask) {
+            qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
+        }
+        break;
+    }
+    }
+
+    if (offset == SNVS_LPSRTCMR || offset == SNVS_LPSRTCLR) {
+        s->tick_offset += new_value - snvs_count;
     }
 }
 
@@ -59,11 +110,16 @@ static void imx7_snvs_init(Object *obj)
 {
     SysBusDevice *sd = SYS_BUS_DEVICE(obj);
     IMX7SNVSState *s = IMX7_SNVS(obj);
+    struct tm tm;
 
     memory_region_init_io(&s->mmio, obj, &imx7_snvs_ops, s,
                           TYPE_IMX7_SNVS, 0x1000);
 
     sysbus_init_mmio(sd, &s->mmio);
+
+    qemu_get_timedate(&tm, 0);
+    s->tick_offset = mktimegm(&tm) -
+        qemu_clock_get_ns(rtc_clock) / NANOSECONDS_PER_SECOND;
 }
 
 static void imx7_snvs_class_init(ObjectClass *klass, void *data)
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index 05ff692441..85725506bf 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -116,8 +116,8 @@ imx7_gpr_read(uint64_t offset) "addr 0x%08" PRIx64
 imx7_gpr_write(uint64_t offset, uint64_t value) "addr 0x%08" PRIx64 "value 0x%08" PRIx64
 
 # imx7_snvs.c
-imx7_snvs_read(uint64_t offset, uint32_t value) "addr 0x%08" PRIx64 "value 0x%08" PRIx32
-imx7_snvs_write(uint64_t offset, uint32_t value) "addr 0x%08" PRIx64 "value 0x%08" PRIx32
+imx7_snvs_read(uint64_t offset, uint64_t value, unsigned size) "i.MX SNVS read: offset 0x%08" PRIx64 " value 0x%08" PRIx64 " size %u"
+imx7_snvs_write(uint64_t offset, uint64_t value, unsigned size) "i.MX SNVS write: offset 0x%08" PRIx64 " value 0x%08" PRIx64 " size %u"
 
 # mos6522.c
 mos6522_set_counter(int index, unsigned int val) "T%d.counter=%d"
diff --git a/include/hw/misc/imx7_snvs.h b/include/hw/misc/imx7_snvs.h
index 14a1d6fe6b..26c497b8ed 100644
--- a/include/hw/misc/imx7_snvs.h
+++ b/include/hw/misc/imx7_snvs.h
@@ -20,7 +20,9 @@
 enum IMX7SNVSRegisters {
     SNVS_LPCR = 0x38,
     SNVS_LPCR_TOP   = BIT(6),
-    SNVS_LPCR_DP_EN = BIT(5)
+    SNVS_LPCR_DP_EN = BIT(5),
+    SNVS_LPSRTCMR = 0x050, /* Secure Real Time Counter MSB Register */
+    SNVS_LPSRTCLR = 0x054, /* Secure Real Time Counter LSB Register */
 };
 
 #define TYPE_IMX7_SNVS "imx7.snvs"
@@ -31,6 +33,9 @@ struct IMX7SNVSState {
     SysBusDevice parent_obj;
 
     MemoryRegion mmio;
+
+    int64_t tick_offset;
+    uint64_t lpcr;
 };
 
 #endif /* IMX7_SNVS_H */
-- 
2.34.1

