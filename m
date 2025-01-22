Received: by 2002:a17:505:840b:b0:1be9:327d:8ee3 with SMTP id lq11csp603217njc;
        Tue, 21 Jan 2025 23:10:37 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU9V7GzaJnVlAgvqMBhhYmsH7Uu5prN3p2do7r5vQyaQLl6vEbjFlHf4WrHt/PXtHV5wA6lJefb8WJLug==@linaro.org
X-Google-Smtp-Source: AGHT+IHINdzRsaBz4B8WO8BVpWemS38mgu0U7ySrY9SBSKbOqeDEkC4HDJNnRhscg9gvIm8vkhaD
X-Received: by 2002:a05:622a:311:b0:467:672a:abb8 with SMTP id d75a77b69052e-46e12a1e603mr323040831cf.5.1737529837374;
        Tue, 21 Jan 2025 23:10:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737529837; cv=none;
        d=google.com; s=arc-20240605;
        b=OWFCulhokI5/KALpSGe2/5RXdV55OSHYIcmHQeeMD1xJHKcnrBZWBRaDMmTMvXwhxi
         RPof25c2Qp5MMZiBTXuVkprYWGeRGfYFEfMKQUqwtKbcaL33UUXGQkDhBeqmabZgJb0C
         693dbYgEG5yWxDJ8v3Ir/hcrUzJgIw+eZTaLclTsFzSJON/ZcyyMMjFFcBaVjgimHOyv
         VykF0H2gMw5ATOqFCiORJ6tikD2m7W1BOw6HpYun799wNpZuRizsEb8iLywe/wj1lCtZ
         i6cVfXeDFkvUGYnWxkBWmA1d434tfKblpN1aO0a/MmMWn8Iygl4X91ilpgziF0yTUxMH
         Pb7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=0ZA1go/C/CGZZBr0BaFM7Sf1Rus0FnCIC3wK4bQP9NQ=;
        fh=CQ3JhhEpLx6WUtQxwLyuUdUASVLLkjylcjrkyER1RTM=;
        b=GftoSOvWEYyQCkjKNv2BD8grUpSUmt7+75Igr97YrdsoPGqkJJGTu7yJAKfv/BsH36
         IMkq7XaeQGERoN3Hkkqh2nVwNpupNkXoTmDr1rrq1TdSXblERMZyk4eZgdB9rN932oFS
         vXCAFSrqlouTuEYVtWBiUowynsUlRPn3VVcC2p599TubM1iCCSe/r6yb1BJg3PwIJxkf
         Y42ceNO1avARxEYRXkCAGYU7XZzMvu2FU+EynciJBlYTuOhuSKIIt2Po3zlC9MHV20Dt
         xcxDJ+E1bdrKgtOpVThRvejj18J+/4g3W4EQdmEJfKU2unTFhpXtMHMNqbAQVNJeeUJ+
         Sygg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="gSu1ZhK/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e2f8b5897si77953091cf.426.2025.01.21.23.10.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jan 2025 23:10:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="gSu1ZhK/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1taUrw-0005Dr-2y; Wed, 22 Jan 2025 02:09:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1taUru-0005Cg-Ln
 for qemu-arm@nongnu.org; Wed, 22 Jan 2025 02:09:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1taUrs-0008PP-UH
 for qemu-arm@nongnu.org; Wed, 22 Jan 2025 02:09:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737529780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0ZA1go/C/CGZZBr0BaFM7Sf1Rus0FnCIC3wK4bQP9NQ=;
 b=gSu1ZhK/qvKYTb3xrpm2Q+xqveka18bDMCZR0uCKA+VURW55F36syMy1/QhO/BDmDDnGoa
 vWACJ+GFFOke/ZBuelyll38/u0IAxDOigdpb3ZtGrbGNQ4HUDRZD4QSQp8aLNtcQxYkB4E
 KxzfUSm63elH+EZj+/tABbXqVoomwPc=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-176-T4BUVnIuMU-FRnwJP3V2Bg-1; Wed,
 22 Jan 2025 02:09:32 -0500
X-MC-Unique: T4BUVnIuMU-FRnwJP3V2Bg-1
X-Mimecast-MFC-AGG-ID: T4BUVnIuMU-FRnwJP3V2Bg
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id E7D55195418F; Wed, 22 Jan 2025 07:09:29 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.154])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 4B1963003FD2; Wed, 22 Jan 2025 07:09:27 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Troy Lee <troy_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH 4/9] hw/timer/aspeed: Refactor Timer Callbacks for
 SoC-Specific Implementations
Date: Wed, 22 Jan 2025 08:09:04 +0100
Message-ID: <20250122070909.1138598-5-clg@redhat.com>
In-Reply-To: <20250122070909.1138598-1-clg@redhat.com>
References: <20250122070909.1138598-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.086,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: wv0P5dfgeRZu

From: Jamin Lin <jamin_lin@aspeedtech.com>

The register set have a significant change in AST2700. The TMC00-TMC3C
are used for TIMER0 and TMC40-TMC7C are used for TIMER1. In additional,
TMC20-TMC3C and TMC60-TMC7C are reserved registers for TIMER0 and TIMER1,
respectively.

Besides, each TIMER has their own control and interrupt status register.
In other words, users are able to set control and interrupt status for TIMER0
in one register. Both aspeed_timer_read and aspeed_timer_write callback
functions are not compatible AST2700.

Introduce common read and write functions for ASPEED timers.
Modify the aspeed_timer_read and aspeed_timer_write functions to delegate to
SoC-specific callbacks first.
Update the AST2400, AST2500, AST2600 and AST1030 specific read and write
functions to call the common implementations for common register accesses.

This refactoring improves the organization of call delegation and prepares the
codebase for future SoC-specific specializations, such as the AST2700.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Link: https://lore.kernel.org/r/20250113064455.1660564-2-jamin_lin@aspeedtech.com
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 hw/timer/aspeed_timer.c | 55 ++++++++++++++++++++++++++++++-----------
 hw/timer/trace-events   |  2 +-
 2 files changed, 41 insertions(+), 16 deletions(-)

diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
index 4868651ad489..24ba40cbe9b4 100644
--- a/hw/timer/aspeed_timer.c
+++ b/hw/timer/aspeed_timer.c
@@ -239,9 +239,8 @@ static uint64_t aspeed_timer_get_value(AspeedTimer *t, int reg)
     return value;
 }
 
-static uint64_t aspeed_timer_read(void *opaque, hwaddr offset, unsigned size)
+static uint64_t aspeed_timer_read_common(AspeedTimerCtrlState *s, hwaddr offset)
 {
-    AspeedTimerCtrlState *s = opaque;
     const int reg = (offset & 0xf) / 4;
     uint64_t value;
 
@@ -256,10 +255,11 @@ static uint64_t aspeed_timer_read(void *opaque, hwaddr offset, unsigned size)
         value = aspeed_timer_get_value(&s->timers[(offset >> 4) - 1], reg);
         break;
     default:
-        value = ASPEED_TIMER_GET_CLASS(s)->read(s, offset);
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIx "\n",
+                      __func__, offset);
+        value = 0;
         break;
     }
-    trace_aspeed_timer_read(offset, size, value);
     return value;
 }
 
@@ -431,12 +431,11 @@ static void aspeed_timer_set_ctrl2(AspeedTimerCtrlState *s, uint32_t value)
     trace_aspeed_timer_set_ctrl2(value);
 }
 
-static void aspeed_timer_write(void *opaque, hwaddr offset, uint64_t value,
-                               unsigned size)
+static void aspeed_timer_write_common(AspeedTimerCtrlState *s, hwaddr offset,
+                                      uint64_t value)
 {
     const uint32_t tv = (uint32_t)(value & 0xFFFFFFFF);
     const int reg = (offset & 0xf) / 4;
-    AspeedTimerCtrlState *s = opaque;
 
     switch (offset) {
     /* Control Registers */
@@ -451,11 +450,25 @@ static void aspeed_timer_write(void *opaque, hwaddr offset, uint64_t value,
         aspeed_timer_set_value(s, (offset >> TIMER_NR_REGS) - 1, reg, tv);
         break;
     default:
-        ASPEED_TIMER_GET_CLASS(s)->write(s, offset, value);
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIx "\n",
+                      __func__, offset);
         break;
     }
 }
 
+static uint64_t aspeed_timer_read(void *opaque, hwaddr offset, unsigned size)
+{
+    AspeedTimerCtrlState *s = ASPEED_TIMER(opaque);
+    return ASPEED_TIMER_GET_CLASS(s)->read(s, offset);
+}
+
+static void aspeed_timer_write(void *opaque, hwaddr offset, uint64_t value,
+                               unsigned size)
+{
+    AspeedTimerCtrlState *s = ASPEED_TIMER(opaque);
+    ASPEED_TIMER_GET_CLASS(s)->write(s, offset, value);
+}
+
 static const MemoryRegionOps aspeed_timer_ops = {
     .read = aspeed_timer_read,
     .write = aspeed_timer_write,
@@ -475,12 +488,15 @@ static uint64_t aspeed_2400_timer_read(AspeedTimerCtrlState *s, hwaddr offset)
         break;
     case 0x38:
     case 0x3C:
-    default:
         qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIx "\n",
                 __func__, offset);
         value = 0;
         break;
+    default:
+        value = aspeed_timer_read_common(s, offset);
+        break;
     }
+    trace_aspeed_timer_read(offset, value);
     return value;
 }
 
@@ -495,10 +511,12 @@ static void aspeed_2400_timer_write(AspeedTimerCtrlState *s, hwaddr offset,
         break;
     case 0x38:
     case 0x3C:
-    default:
         qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIx "\n",
                 __func__, offset);
         break;
+    default:
+        aspeed_timer_write_common(s, offset, value);
+        break;
     }
 }
 
@@ -514,12 +532,15 @@ static uint64_t aspeed_2500_timer_read(AspeedTimerCtrlState *s, hwaddr offset)
         value = s->ctrl3 & BIT(0);
         break;
     case 0x3C:
-    default:
         qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIx "\n",
                 __func__, offset);
         value = 0;
         break;
+    default:
+        value = aspeed_timer_read_common(s, offset);
+        break;
     }
+    trace_aspeed_timer_read(offset, value);
     return value;
 }
 
@@ -548,8 +569,7 @@ static void aspeed_2500_timer_write(AspeedTimerCtrlState *s, hwaddr offset,
         break;
 
     default:
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIx "\n",
-                __func__, offset);
+        aspeed_timer_write_common(s, offset, value);
         break;
     }
 }
@@ -564,12 +584,15 @@ static uint64_t aspeed_2600_timer_read(AspeedTimerCtrlState *s, hwaddr offset)
         break;
     case 0x38:
     case 0x3C:
-    default:
         qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIx "\n",
                 __func__, offset);
         value = 0;
         break;
+    default:
+        value = aspeed_timer_read_common(s, offset);
+        break;
     }
+    trace_aspeed_timer_read(offset, value);
     return value;
 }
 
@@ -586,10 +609,12 @@ static void aspeed_2600_timer_write(AspeedTimerCtrlState *s, hwaddr offset,
         aspeed_timer_set_ctrl(s, s->ctrl & ~tv);
         break;
     case 0x38:
-    default:
         qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIx "\n",
                 __func__, offset);
         break;
+    default:
+        aspeed_timer_write_common(s, offset, value);
+        break;
     }
 }
 
diff --git a/hw/timer/trace-events b/hw/timer/trace-events
index 5cfc369fba46..c5b6db49f587 100644
--- a/hw/timer/trace-events
+++ b/hw/timer/trace-events
@@ -31,7 +31,7 @@ aspeed_timer_ctrl_overflow_interrupt(uint8_t i, bool enable) "Timer %" PRIu8 ":
 aspeed_timer_ctrl_pulse_enable(uint8_t i, bool enable) "Timer %" PRIu8 ": %d"
 aspeed_timer_set_ctrl2(uint32_t value) "Value: 0x%" PRIx32
 aspeed_timer_set_value(int timer, int reg, uint32_t value) "Timer %d register %d: 0x%" PRIx32
-aspeed_timer_read(uint64_t offset, unsigned size, uint64_t value) "From 0x%" PRIx64 ": of size %u: 0x%" PRIx64
+aspeed_timer_read(uint64_t offset, uint64_t value) "From 0x%" PRIx64 ": 0x%" PRIx64
 
 # armv7m_systick.c
 systick_reload(void) "systick reload"
-- 
2.48.1

