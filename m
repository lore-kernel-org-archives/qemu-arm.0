Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2318944njk;
        Mon, 27 Jan 2025 01:43:39 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWSyv2ZFp2FnMvUmi4lg/EMSsADsFFa9ZO4jOchMu6xNOhH/wTG9HJH2W1gY5ggsdJW3Wm1VsDR4BoYtg==@linaro.org
X-Google-Smtp-Source: AGHT+IEoaSwckVSCZKqZRR3pWHZXgmvyKWBVSgM+CmTbxR2z5se/2CEEHrE9seQ1EyO/13Sr9jgE
X-Received: by 2002:ac8:590e:0:b0:456:919a:11e4 with SMTP id d75a77b69052e-46e5b806549mr220981941cf.20.1737971019693;
        Mon, 27 Jan 2025 01:43:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737971019; cv=none;
        d=google.com; s=arc-20240605;
        b=Skyl5tZirQ1XFFG93zSwg4uh1wlcbQuGUyR36H3rcY4Xj6clTpw67hL4MXsUBzmESJ
         oqnCekKXJm3rrqrEj1ufoRcVYJ3B2ImiFFR0LmX+gyJaOzeYyHP1xIxCDhWYVpwYaGY2
         wbEbYQeCYhTZjXvaupu1EqsPy2v1T+2ghODfkn2T/bb+pwIGueZ4qIYsG6kTSJXNNfav
         qnmiGOW0FNxZ5Qr31FzJZV1Dl1pof+99AWHiwBXhW+9U+yWfLx3Kf6gtDMVeX4Ey9UOE
         ah4gdhrYdVb+UZpPFlqjo1zaLbLiLPPAch9rIH8Bo98VWpzz7EHhuqr7H/VLtoqbpr1p
         8axw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=xNPwhTpaz34u5lSlNxX/kXU9REYVHuHQVuZhmQvf+KY=;
        fh=i/PI/VfZf54YsTwJ9sJhiHcO+8PSmdTrt3qYCjPMyJY=;
        b=KOcuTG5YqdS7t9ZwjO0FxdYUsWfthNUoY5jCM8071Bwqe480wz5EEeXJQQaTCmf4M3
         RaY5Z6MunozLyUaeOJxEoqTVplATPMzp6aFW+AGOIZvmMIwrOtyFdf9wg3hvGoUC95lJ
         TulXXrlBC3j9/TISiW5UhLEllTEXTZI9fAHSck66iIVGtVD70J9Cc0UPTGj2yqRDtT5I
         hxtWEmkWRmKvrWaCrvjI88GRKuFx7JqjjCjbxFxWjhRpKWx8n0Pw0SPAr1//uXH/AfC/
         Jwv2EB4XAdgIwVvjIkyCFRonUKymR8bHKj9298NQ+N8IjkA+8m28ID8HWvcPsql9mFM3
         kcjg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=N9EKNuBN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e66bc8033si92629101cf.604.2025.01.27.01.43.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 01:43:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=N9EKNuBN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcLe9-0006D5-J3; Mon, 27 Jan 2025 04:43:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tcLe7-0006Ce-1D
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 04:43:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tcLe5-0005Qp-3e
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 04:43:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737970984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xNPwhTpaz34u5lSlNxX/kXU9REYVHuHQVuZhmQvf+KY=;
 b=N9EKNuBNTs6FclWEgHLWlMau5JsiWoOC3Z5T1yCSwEflKplVr0g4jEUfHou2jvBbAo6syb
 NGWwlaqcAAtHvXof6uVUks5gJlBlaSp18z/4lsY2hnFiuzVO85tbEWdvAHf1ZSxL5TD+rL
 pALnWKJhLgp0XQccmm1u3dFq18hOhO4=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-182-YYplK-hdOruu0ImGiSMU9w-1; Mon,
 27 Jan 2025 04:42:59 -0500
X-MC-Unique: YYplK-hdOruu0ImGiSMU9w-1
X-Mimecast-MFC-AGG-ID: YYplK-hdOruu0ImGiSMU9w
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 2DA771800378; Mon, 27 Jan 2025 09:42:58 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.63])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 666161800365; Mon, 27 Jan 2025 09:42:56 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 04/12] hw/timer/aspeed: Refactor Timer Callbacks for
 SoC-Specific Implementations
Date: Mon, 27 Jan 2025 10:42:31 +0100
Message-ID: <20250127094239.636526-5-clg@redhat.com>
In-Reply-To: <20250127094239.636526-1-clg@redhat.com>
References: <20250127094239.636526-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.299,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.01,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: pg2Jx7kJyWQm

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
Reviewed-by: Cédric Le Goater <clg@redhat.com>
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

