Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3046714ejc;
        Mon, 23 Jan 2023 08:25:05 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtuno/gmmBwKyKp/oyf6A+OZB+IZYKk/WMmSme0/MY+SmR23L/YXVRs0SuAm8GUQqrEeypg
X-Received: by 2002:a0c:aace:0:b0:535:5cd6:38a6 with SMTP id g14-20020a0caace000000b005355cd638a6mr18058823qvb.50.1674491105614;
        Mon, 23 Jan 2023 08:25:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674491105; cv=none;
        d=google.com; s=arc-20160816;
        b=jPFXz+qLrbkNu4xJuKrbDSJS3BcRfBJxDRJ3/8fkhFo273NkjBZov2cqTYy5exNaZy
         RtaIqrNM01DtOI9JrjdaR3EucsJzJ6iVBemuDt5OkpKBK9tLu/XDALT3FMEYsp2pdtUH
         N1N869CvAGZ+dDtshb1rscyQaW8Rzs0wimvjxizVGxm6eGveYLMps0qKTYjAxZXx6tas
         ApxwqCrQI7RWrniZlotEmrIijmCJI67CORR/JGR04U7Cm76dN/6k/sb18LorT9Px9X2l
         VRjw5qT09iSXJPMfVpy+cPYX8ReGHuzWioOb3wiUdJ5FOSgkmCFwZpRi/YiVNWZ4Tj6d
         ZfiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature:dkim-filter;
        bh=4oqNjtWV5XHXopxp73MULIexxMjPeEHnzsjLi/LM2aU=;
        b=IQaUFCtGMkHNznZVDhFrKnEdi5O8q8+XSKeA3ru4OYZIoOc8SUeAKHAue6b3vTp+8D
         r0U291e3s6MNC9pNJZPR2CA8Tdk78T3tBsngXIK3+OvztXOJpUbtsuVyQKF4drzAFDgr
         XT1wudomXeFpAyNCi0S8UjjXThTbz6PVuhPXBu4iWQUoB/Cl2SkHceXnOUxVllH89mjs
         FSS/zE6e/tVFcyRq85C8guB2WKyOEX1X8J5Zh8bQHslwKYu0LeqfevegnMCrjw/NcTt9
         qIGZdTWiTksPo+G7A3CKOZjAlq4rYkuRZQyokW6omBa6zhqltRr+OWpSXuuqIhOjN1lR
         ynKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linux.microsoft.com header.s=default header.b=i7c8nd9e;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kj3-20020a056214528300b004c788489378si15695804qvb.455.2023.01.23.08.25.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Jan 2023 08:25:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linux.microsoft.com header.s=default header.b=i7c8nd9e;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJzbL-0007eE-Od; Mon, 23 Jan 2023 11:23:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pJzbH-0007b5-Ps; Mon, 23 Jan 2023 11:23:15 -0500
Received: from linux.microsoft.com ([13.77.154.182])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pJzbF-0003aN-Sn; Mon, 23 Jan 2023 11:23:15 -0500
Received: from localhost.localdomain (unknown [77.64.253.114])
 by linux.microsoft.com (Postfix) with ESMTPSA id 3ECD420E2C01;
 Mon, 23 Jan 2023 08:23:11 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 3ECD420E2C01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1674490992;
 bh=4oqNjtWV5XHXopxp73MULIexxMjPeEHnzsjLi/LM2aU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=i7c8nd9eequBlWd1HiYBDQ6SlvXognEiwNvZI57YZubC27nQTzGtyz7CGdHIvOlQ7
 aodEi64nWve9XjG2K92gN6xmCaWZlRSyUvHXckA2qy7VNE9ANLzIiW/4yrCWMyA/Z3
 Z2dAXDtBV/mEocWKr4HaG5WjdOlaLYWhjRbOUvbE=
From: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	peter.maydell@linaro.org,
	philmd@linaro.org
Subject: [PATCH v4 1/5] hw/char/pl011: refactor FIFO depth handling code
Date: Mon, 23 Jan 2023 17:23:00 +0100
Message-Id: <20230123162304.26254-2-eiakovlev@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123162304.26254-1-eiakovlev@linux.microsoft.com>
References: <20230123162304.26254-1-eiakovlev@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=13.77.154.182;
 envelope-from=eiakovlev@linux.microsoft.com; helo=linux.microsoft.com
X-Spam_score_int: -197
X-Spam_score: -19.8
X-Spam_bar: -------------------
X-Spam_report: (-19.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: DzkJH7k6ntxt

PL011 can be in either of 2 modes depending guest config: FIFO and
single register. The last mode could be viewed as a 1-element-deep FIFO.

Current code open-codes a bunch of depth-dependent logic. Refactor FIFO
depth handling code to isolate calculating current FIFO depth.

One functional (albeit guest-invisible) side-effect of this change is
that previously we would always increment s->read_pos in UARTDR read
handler even if FIFO was disabled, now we are limiting read_pos to not
exceed FIFO depth (read_pos itself is reset to 0 if user disables FIFO).

Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/char/pl011.c         | 30 ++++++++++++++++++------------
 include/hw/char/pl011.h |  5 ++++-
 2 files changed, 22 insertions(+), 13 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index c076813423..3fa3b75d04 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -81,6 +81,17 @@ static void pl011_update(PL011State *s)
     }
 }
 
+static bool pl011_is_fifo_enabled(PL011State *s)
+{
+    return (s->lcr & 0x10) != 0;
+}
+
+static inline unsigned pl011_get_fifo_depth(PL011State *s)
+{
+    /* Note: FIFO depth is expected to be power-of-2 */
+    return pl011_is_fifo_enabled(s) ? PL011_FIFO_DEPTH : 1;
+}
+
 static uint64_t pl011_read(void *opaque, hwaddr offset,
                            unsigned size)
 {
@@ -94,8 +105,7 @@ static uint64_t pl011_read(void *opaque, hwaddr offset,
         c = s->read_fifo[s->read_pos];
         if (s->read_count > 0) {
             s->read_count--;
-            if (++s->read_pos == 16)
-                s->read_pos = 0;
+            s->read_pos = (s->read_pos + 1) & (pl011_get_fifo_depth(s) - 1);
         }
         if (s->read_count == 0) {
             s->flags |= PL011_FLAG_RXFE;
@@ -273,11 +283,7 @@ static int pl011_can_receive(void *opaque)
     PL011State *s = (PL011State *)opaque;
     int r;
 
-    if (s->lcr & 0x10) {
-        r = s->read_count < 16;
-    } else {
-        r = s->read_count < 1;
-    }
+    r = s->read_count < pl011_get_fifo_depth(s);
     trace_pl011_can_receive(s->lcr, s->read_count, r);
     return r;
 }
@@ -286,15 +292,15 @@ static void pl011_put_fifo(void *opaque, uint32_t value)
 {
     PL011State *s = (PL011State *)opaque;
     int slot;
+    unsigned pipe_depth;
 
-    slot = s->read_pos + s->read_count;
-    if (slot >= 16)
-        slot -= 16;
+    pipe_depth = pl011_get_fifo_depth(s);
+    slot = (s->read_pos + s->read_count) & (pipe_depth - 1);
     s->read_fifo[slot] = value;
     s->read_count++;
     s->flags &= ~PL011_FLAG_RXFE;
     trace_pl011_put_fifo(value, s->read_count);
-    if (!(s->lcr & 0x10) || s->read_count == 16) {
+    if (s->read_count == pipe_depth) {
         trace_pl011_put_fifo_full();
         s->flags |= PL011_FLAG_RXFF;
     }
@@ -359,7 +365,7 @@ static const VMStateDescription vmstate_pl011 = {
         VMSTATE_UINT32(dmacr, PL011State),
         VMSTATE_UINT32(int_enabled, PL011State),
         VMSTATE_UINT32(int_level, PL011State),
-        VMSTATE_UINT32_ARRAY(read_fifo, PL011State, 16),
+        VMSTATE_UINT32_ARRAY(read_fifo, PL011State, PL011_FIFO_DEPTH),
         VMSTATE_UINT32(ilpr, PL011State),
         VMSTATE_UINT32(ibrd, PL011State),
         VMSTATE_UINT32(fbrd, PL011State),
diff --git a/include/hw/char/pl011.h b/include/hw/char/pl011.h
index dc2c90eedc..926322e242 100644
--- a/include/hw/char/pl011.h
+++ b/include/hw/char/pl011.h
@@ -27,6 +27,9 @@ OBJECT_DECLARE_SIMPLE_TYPE(PL011State, PL011)
 /* This shares the same struct (and cast macro) as the base pl011 device */
 #define TYPE_PL011_LUMINARY "pl011_luminary"
 
+/* Depth of UART FIFO in bytes, when FIFO mode is enabled (else depth == 1) */
+#define PL011_FIFO_DEPTH 16
+
 struct PL011State {
     SysBusDevice parent_obj;
 
@@ -39,7 +42,7 @@ struct PL011State {
     uint32_t dmacr;
     uint32_t int_enabled;
     uint32_t int_level;
-    uint32_t read_fifo[16];
+    uint32_t read_fifo[PL011_FIFO_DEPTH];
     uint32_t ilpr;
     uint32_t ibrd;
     uint32_t fbrd;
-- 
2.34.1

