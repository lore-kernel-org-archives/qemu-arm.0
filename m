Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp2614807lff;
        Thu, 19 Dec 2019 11:01:51 -0800 (PST)
X-Google-Smtp-Source: APXvYqwZQ3Ez35Nhz2FRZiqS884pkxFXNqK0zJSjqTqL9OC0KEZXFvASVHeWtxykc9x+LcKbfav0
X-Received: by 2002:a05:6830:128e:: with SMTP id z14mr9911553otp.184.1576782111168;
        Thu, 19 Dec 2019 11:01:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576782111; cv=none;
        d=google.com; s=arc-20160816;
        b=KynXH7UxCyj7XsJ1NnDCS6cjaX1uU8UBXwyjJq9YUAoPlxptdIdGYujxlMIbfkCm9y
         6nQ0nw0OstEtKHdltyxH3bqQ+uFUXVEZ0dyMzNZrjyfA9eRk8Kj6iTkin+HVbtaHNWi4
         ZCP6/F4Qff4eteUASc0kQs7FeBKFYU+8cNBFEo8Eukwl9CUTyiOvxQ0pSznroRq7C6hH
         o6GzbUeviWuFW7jeuDhPZTPfVKABdxuQ+/yUDJa7+x9pJPbnoR7oLMRejsYoDNCnHg3D
         Qcc/vj862bUHnBuHB4k19JMgypRYUKUD67xO9+JM9+cCEFADcUC9fRwdpZVEmI41Wy5r
         oIpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=JsHtfge5h+5q2LZhmNIpaj2lzwktX3gFRpdUNeSwNQI=;
        b=MKMStedTvTmcjeY/xTilE4RgDQXOxacLoRPvVOMR/MSDm1gTdM2R8bV2960r0+fJQ9
         Vugan30yx/2C9K5NGl2lg7y336zdNMbtPX6iZfosa8xNkmhxSPbNaZjYeVL5jX72kgE0
         jV/H/Ax7nHbt4JYPzop0gjVT5FgDPTPWwnl66c8AlRVr6/9OZu3xdAtk8gNDRTwByTlU
         rqJLSDgtl/4hUtT2Hl3hP6zL94Ws0JdRj71TXX/FK+Yc/MDjKv3WTpc401DcvQowjmAq
         imps66FsywWo45R06hSJtUMxsvvP7uyx2v/6qFCVl29IRlptlTuw/0NY87qLeFeAgcM/
         yGEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=AxqVhc0A;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e22si3984079oti.74.2019.12.19.11.01.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Dec 2019 11:01:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=AxqVhc0A;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ii13W-0003Ks-CI
	for alex.bennee@linaro.org; Thu, 19 Dec 2019 14:01:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39562)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ii0te-00072I-SW
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 13:51:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ii0td-0007kP-C5
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 13:51:38 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:40531)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ii0td-0007fY-4k; Thu, 19 Dec 2019 13:51:37 -0500
Received: by mail-wm1-x344.google.com with SMTP id t14so6738813wmi.5;
 Thu, 19 Dec 2019 10:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JsHtfge5h+5q2LZhmNIpaj2lzwktX3gFRpdUNeSwNQI=;
 b=AxqVhc0AEZh1OEee/AvnEa+KucuM+1JvChO4bzf1IaK0NMw5Oluazg5ZXm+As+ki/r
 GRBOh8OwvUfomKIztwEauMgbCIV4GWs/nXTVh1IYG63uzuLGiMLOKvhgyBdRD6a9ExTr
 BW/OAqhnZH6rIxNJGzCcVdZCBUDr7ekksShf4lG3rRy7n71M5hcdfnejebT3xGi48flk
 //ynxSxEVIVoWMUg2EwESTsawVVVZnADKFQpOyoHEfqQZaz6SRYEk9gQzLT9lTBDGi+7
 rMcUb/Ml0z4XNL4H0cjurPaDrolA0OvTuKPF1n2kR/YB27oafAv4FVdpcN8xMzCDTOM0
 UE8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=JsHtfge5h+5q2LZhmNIpaj2lzwktX3gFRpdUNeSwNQI=;
 b=gIcVtE2Xe6O/DDYyGgS0mPT7HKUlVO0s/hToe50722XWi08KOO+1DxMVQXYHPklFn0
 eRUe7k+2ssUKr7NuEV1WypUi/gbZUTpyNXAFJDgUB4lqaRaT5MrJvnsS3rVOFY/skHJt
 q1lFipGQR5yc+nWPkLHn+CPxKONsD0bhbsSyggDJgH9U/oVPUUNHxlczPHPwh2AT2p8q
 /c86qGUDgr5bZb6RWFW+eTqoY0L9zy+FmNjQ+8cjGi2qQGbOJZLDe7HCLe2/08xQRF29
 coI7D2rs6A1HIF4Zsi742n7UqDk6km4TO4kZbdDOo0fDmKWuRKq06yWlybA9GsSvO2Zj
 fG9w==
X-Gm-Message-State: APjAAAWvehfFsVpY0iX08Rq/++yKoUXQ6uWvYOnwoTpBA3z4kkwmxn+Y
 GYv4Q5GlcTFZA9b2y3CQUIRNp0UG
X-Received: by 2002:a05:600c:54c:: with SMTP id
 k12mr11859443wmc.124.1576781495869; 
 Thu, 19 Dec 2019 10:51:35 -0800 (PST)
Received: from x1w.redhat.com (34.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.34])
 by smtp.gmail.com with ESMTPSA id b67sm7435494wmc.38.2019.12.19.10.51.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2019 10:51:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	Niek Linnenbank <nieklinnenbank@gmail.com>
Subject: [RFC PATCH 05/13] hw/timer/allwinner: Rename the ptimer field
Date: Thu, 19 Dec 2019 19:51:19 +0100
Message-Id: <20191219185127.24388-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191219185127.24388-1-f4bug@amsat.org>
References: <20191219185127.24388-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 79KwvwwEMoCd

We will later use the 'timer' field name to access all the
timer related fields. The name is already use, we need to
rename first. 'ptimer' is a good name.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/timer/allwinner-a10-pit.h |  2 +-
 hw/timer/allwinner-a10-pit.c         | 34 ++++++++++++++--------------
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/include/hw/timer/allwinner-a10-pit.h b/include/hw/timer/allwinner-a10-pit.h
index c28ee5ca47..a60b9f3031 100644
--- a/include/hw/timer/allwinner-a10-pit.h
+++ b/include/hw/timer/allwinner-a10-pit.h
@@ -20,7 +20,7 @@ struct AwA10PITState {
     SysBusDevice parent_obj;
     /*< public >*/
     qemu_irq irq[AW_PIT_TIMER_MAX];
-    ptimer_state * timer[AW_PIT_TIMER_MAX];
+    ptimer_state * ptimer[AW_PIT_TIMER_MAX];
     AwA10TimerContext timer_context[AW_PIT_TIMER_MAX];
     MemoryRegion iomem;
     uint32_t clk_freq[4];
diff --git a/hw/timer/allwinner-a10-pit.c b/hw/timer/allwinner-a10-pit.c
index 00f7cc492d..effdf91344 100644
--- a/hw/timer/allwinner-a10-pit.c
+++ b/hw/timer/allwinner-a10-pit.c
@@ -83,7 +83,7 @@ static uint64_t a10_pit_read(void *opaque, hwaddr offset, unsigned size)
         case AW_A10_PIT_TIMER_INTERVAL:
             return s->interval[index];
         case AW_A10_PIT_TIMER_COUNT:
-            s->count[index] = ptimer_get_count(s->timer[index]);
+            s->count[index] = ptimer_get_count(s->ptimer[index]);
             return s->count[index];
         default:
             qemu_log_mask(LOG_GUEST_ERROR,
@@ -109,7 +109,7 @@ static uint64_t a10_pit_read(void *opaque, hwaddr offset, unsigned size)
     return 0;
 }
 
-/* Must be called inside a ptimer transaction block for s->timer[index] */
+/* Must be called inside a ptimer transaction block for s->ptimer[index] */
 static void a10_pit_set_freq(AwA10PITState *s, int index)
 {
     uint32_t prescaler, source, source_freq;
@@ -119,7 +119,7 @@ static void a10_pit_set_freq(AwA10PITState *s, int index)
     source_freq = s->clk_freq[source];
 
     if (source_freq) {
-        ptimer_set_freq(s->timer[index], source_freq / prescaler);
+        ptimer_set_freq(s->ptimer[index], source_freq / prescaler);
     } else {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid clock source %u\n",
                       __func__, source);
@@ -148,27 +148,27 @@ static void a10_pit_write(void *opaque, hwaddr offset, uint64_t value,
         switch (offset & 0x0f) {
         case AW_A10_PIT_TIMER_CONTROL:
             s->control[index] = value;
-            ptimer_transaction_begin(s->timer[index]);
+            ptimer_transaction_begin(s->ptimer[index]);
             a10_pit_set_freq(s, index);
             if (s->control[index] & AW_A10_PIT_TIMER_RELOAD) {
-                ptimer_set_count(s->timer[index], s->interval[index]);
+                ptimer_set_count(s->ptimer[index], s->interval[index]);
             }
             if (s->control[index] & AW_A10_PIT_TIMER_EN) {
                 int oneshot = 0;
                 if (s->control[index] & AW_A10_PIT_TIMER_MODE) {
                     oneshot = 1;
                 }
-                ptimer_run(s->timer[index], oneshot);
+                ptimer_run(s->ptimer[index], oneshot);
             } else {
-                ptimer_stop(s->timer[index]);
+                ptimer_stop(s->ptimer[index]);
             }
-            ptimer_transaction_commit(s->timer[index]);
+            ptimer_transaction_commit(s->ptimer[index]);
             break;
         case AW_A10_PIT_TIMER_INTERVAL:
             s->interval[index] = value;
-            ptimer_transaction_begin(s->timer[index]);
-            ptimer_set_limit(s->timer[index], s->interval[index], 1);
-            ptimer_transaction_commit(s->timer[index]);
+            ptimer_transaction_begin(s->ptimer[index]);
+            ptimer_set_limit(s->ptimer[index], s->interval[index], 1);
+            ptimer_transaction_commit(s->ptimer[index]);
             break;
         case AW_A10_PIT_TIMER_COUNT:
             s->count[index] = value;
@@ -241,7 +241,7 @@ static const VMStateDescription vmstate_a10_pit = {
         VMSTATE_UINT32(count_lo, AwA10PITState),
         VMSTATE_UINT32(count_hi, AwA10PITState),
         VMSTATE_UINT32(count_ctl, AwA10PITState),
-        VMSTATE_PTIMER_ARRAY(timer, AwA10PITState, AW_PIT_TIMER_MAX),
+        VMSTATE_PTIMER_ARRAY(ptimer, AwA10PITState, AW_PIT_TIMER_MAX),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -259,10 +259,10 @@ static void a10_pit_reset(DeviceState *dev)
         s->control[i] = AW_A10_PIT_DEFAULT_CLOCK;
         s->interval[i] = 0;
         s->count[i] = 0;
-        ptimer_transaction_begin(s->timer[i]);
-        ptimer_stop(s->timer[i]);
+        ptimer_transaction_begin(s->ptimer[i]);
+        ptimer_stop(s->ptimer[i]);
         a10_pit_set_freq(s, i);
-        ptimer_transaction_commit(s->timer[i]);
+        ptimer_transaction_commit(s->ptimer[i]);
     }
     s->watch_dog_mode = 0;
     s->watch_dog_control = 0;
@@ -280,7 +280,7 @@ static void a10_pit_timer_cb(void *opaque)
     if (s->control[i] & AW_A10_PIT_TIMER_EN) {
         s->irq_status |= 1 << i;
         if (s->control[i] & AW_A10_PIT_TIMER_MODE) {
-            ptimer_stop(s->timer[i]);
+            ptimer_stop(s->ptimer[i]);
             s->control[i] &= ~AW_A10_PIT_TIMER_EN;
         }
         a10_pit_update_irq(s);
@@ -305,7 +305,7 @@ static void a10_pit_init(Object *obj)
 
         tc->container = s;
         tc->index = i;
-        s->timer[i] = ptimer_init(a10_pit_timer_cb, tc, PTIMER_POLICY_DEFAULT);
+        s->ptimer[i] = ptimer_init(a10_pit_timer_cb, tc, PTIMER_POLICY_DEFAULT);
     }
 }
 
-- 
2.21.0

