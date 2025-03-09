Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp606412njc;
        Sun, 9 Mar 2025 06:53:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU+cZJkTYxOLEa29hFRiHUjzAEzXUY9jnqU4++H08XhGmTcPomOe66AYWKIjAAI4/B57HHWvuVzDx1eGw==@linaro.org
X-Google-Smtp-Source: AGHT+IGBZOLY0Z9IEV+XYvh+f6gRaHwWUQ6pREKJ2qs4le3M4nIQ0OCKyvPAiS5aVfXtW/MyuaA1
X-Received: by 2002:ad4:5c8e:0:b0:6e8:fb44:5bda with SMTP id 6a1803df08f44-6e900609592mr169406536d6.19.1741528381652;
        Sun, 09 Mar 2025 06:53:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741528381; cv=none;
        d=google.com; s=arc-20240605;
        b=FXwLalR9N9oD9TYnlspKpItqvvUU7wh6nao4PjmwLaL+4gpamHCzUxENEZjtBPpR8y
         AO4e92ma6DVQ6HuJwgaZhI4i8i14Z4nyVt7wmCBa+lxe8Bs7hZGXz2EzCA/M/KFJMC21
         aZtItPgakZ1N7mBvXs6yTg/WB5Xksga1yyDvjzvhvIDfbUDVrpdAZTo8oNzhpKf+GR9C
         p3Z3lvLQ37WSYDYtgm5uWGasUpOtR/0HiyF9HWmey0smbQa4p+ghXeRBmUSn9Y1o0Kw9
         HGh3MKTV4MkPALLxiQFhUh4n+jb7DDgUedxUBJ2kBjY3uY5g10VQonhOFzyJ+HKpP/6c
         Ns6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=O8tZK7aBxCKxDPkAn4/Vz+BlTdZiPZ62vS/YeE4Ouis=;
        fh=i/PI/VfZf54YsTwJ9sJhiHcO+8PSmdTrt3qYCjPMyJY=;
        b=MqrkF9oSEw1SH8Ydw/d9UAfg8vW/Eo29h9FtmC8vQ7VOiejcMgxnTa99RvFsZuT7MO
         SwTcgjgTN9f9C/z5CMTfmoc6fnXdTdUtiOxmvt1x0TxDSlvRUQ/vy6jHf+ysGbj3xhJ+
         LmmYwLususyQiMihvxENijDuejm6ha7tr1qod0+l6UkfnWL/xiSogb46Z2h0J+DfQscE
         2AHFP15EcCFtmS1mlaX3NWcICxItN2FHzIRJvdgrnMF8YFKaCAb2cWap/UFxLG0TTJ0N
         sy1GkZxfDqVVZW7ZomLpi2kJBclbb75fnEX9PZhhQnkAsz4tZlezYZ3b+C2i34B2Rkoe
         AUxA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ye25SORK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8f746776bsi74728676d6.432.2025.03.09.06.53.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 09 Mar 2025 06:53:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ye25SORK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1trH57-0008V4-4O; Sun, 09 Mar 2025 09:52:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1trH4v-0008H7-4z
 for qemu-devel@nongnu.org; Sun, 09 Mar 2025 09:52:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1trH4t-0002mP-1G
 for qemu-devel@nongnu.org; Sun, 09 Mar 2025 09:52:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741528346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O8tZK7aBxCKxDPkAn4/Vz+BlTdZiPZ62vS/YeE4Ouis=;
 b=Ye25SORKhiqoWlhSMXEbeopbn+If2ROuVb7I3dHd67fMB+uZhSJH9TcJXrUv8XGWN7AsI4
 MsxsHygNn0fN2jqdug6Pu/OYOld/uKQgIoeuRUQDoIMsWOgq90WPJuu8qqUslHEsfvfaWv
 I3qNFzzwmEcYC/9gZhx0vJQEFoGdwkE=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-45-tIyXLVA4Plqjw5CorHmhkw-1; Sun,
 09 Mar 2025 09:52:24 -0400
X-MC-Unique: tIyXLVA4Plqjw5CorHmhkw-1
X-Mimecast-MFC-AGG-ID: tIyXLVA4Plqjw5CorHmhkw_1741528343
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id BC588180035D; Sun,  9 Mar 2025 13:52:23 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.44.32.17])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 2B32A1956094; Sun,  9 Mar 2025 13:52:21 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 19/46] hw/intc/aspeed: Rename status_addr and addr to
 status_reg and reg for clarity
Date: Sun,  9 Mar 2025 14:51:03 +0100
Message-ID: <20250309135130.545764-20-clg@redhat.com>
In-Reply-To: <20250309135130.545764-1-clg@redhat.com>
References: <20250309135130.545764-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: o5T3LvuGNNfb

From: Jamin Lin <jamin_lin@aspeedtech.com>

Rename the variables "status_addr" to "status_reg" and "addr" to "reg" because
they are used as register index. This change makes the code more appropriate
and improves readability.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Link: https://lore.kernel.org/qemu-devel/20250307035945.3698802-3-jamin_lin@aspeedtech.com
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 hw/intc/aspeed_intc.c | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/hw/intc/aspeed_intc.c b/hw/intc/aspeed_intc.c
index 033b574c1e24..465f41e4fd35 100644
--- a/hw/intc/aspeed_intc.c
+++ b/hw/intc/aspeed_intc.c
@@ -60,7 +60,7 @@ static void aspeed_intc_set_irq(void *opaque, int irq, int level)
 {
     AspeedINTCState *s = (AspeedINTCState *)opaque;
     AspeedINTCClass *aic = ASPEED_INTC_GET_CLASS(s);
-    uint32_t status_addr = GICINT_STATUS_BASE + ((0x100 * irq) >> 2);
+    uint32_t status_reg = GICINT_STATUS_BASE + ((0x100 * irq) >> 2);
     uint32_t select = 0;
     uint32_t enable;
     int i;
@@ -92,7 +92,7 @@ static void aspeed_intc_set_irq(void *opaque, int irq, int level)
 
     trace_aspeed_intc_select(select);
 
-    if (s->mask[irq] || s->regs[status_addr]) {
+    if (s->mask[irq] || s->regs[status_reg]) {
         /*
          * a. mask is not 0 means in ISR mode
          * sources interrupt routine are executing.
@@ -108,8 +108,8 @@ static void aspeed_intc_set_irq(void *opaque, int irq, int level)
          * notify firmware which source interrupt are coming
          * by setting status register
          */
-        s->regs[status_addr] = select;
-        trace_aspeed_intc_trigger_irq(irq, s->regs[status_addr]);
+        s->regs[status_reg] = select;
+        trace_aspeed_intc_trigger_irq(irq, s->regs[status_reg]);
         aspeed_intc_update(s, irq, 1);
     }
 }
@@ -117,17 +117,17 @@ static void aspeed_intc_set_irq(void *opaque, int irq, int level)
 static uint64_t aspeed_intc_read(void *opaque, hwaddr offset, unsigned int size)
 {
     AspeedINTCState *s = ASPEED_INTC(opaque);
-    uint32_t addr = offset >> 2;
+    uint32_t reg = offset >> 2;
     uint32_t value = 0;
 
-    if (addr >= ASPEED_INTC_NR_REGS) {
+    if (reg >= ASPEED_INTC_NR_REGS) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: Out-of-bounds read at offset 0x%" HWADDR_PRIx "\n",
                       __func__, offset);
         return 0;
     }
 
-    value = s->regs[addr];
+    value = s->regs[reg];
     trace_aspeed_intc_read(offset, size, value);
 
     return value;
@@ -138,12 +138,12 @@ static void aspeed_intc_write(void *opaque, hwaddr offset, uint64_t data,
 {
     AspeedINTCState *s = ASPEED_INTC(opaque);
     AspeedINTCClass *aic = ASPEED_INTC_GET_CLASS(s);
-    uint32_t addr = offset >> 2;
+    uint32_t reg = offset >> 2;
     uint32_t old_enable;
     uint32_t change;
     uint32_t irq;
 
-    if (addr >= ASPEED_INTC_NR_REGS) {
+    if (reg >= ASPEED_INTC_NR_REGS) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: Out-of-bounds write at offset 0x%" HWADDR_PRIx "\n",
                       __func__, offset);
@@ -152,7 +152,7 @@ static void aspeed_intc_write(void *opaque, hwaddr offset, uint64_t data,
 
     trace_aspeed_intc_write(offset, size, data);
 
-    switch (addr) {
+    switch (reg) {
     case R_GICINT128_EN:
     case R_GICINT129_EN:
     case R_GICINT130_EN:
@@ -177,7 +177,7 @@ static void aspeed_intc_write(void *opaque, hwaddr offset, uint64_t data,
 
         /* disable all source interrupt */
         if (!data && !s->enable[irq]) {
-            s->regs[addr] = data;
+            s->regs[reg] = data;
             return;
         }
 
@@ -187,12 +187,12 @@ static void aspeed_intc_write(void *opaque, hwaddr offset, uint64_t data,
         /* enable new source interrupt */
         if (old_enable != s->enable[irq]) {
             trace_aspeed_intc_enable(s->enable[irq]);
-            s->regs[addr] = data;
+            s->regs[reg] = data;
             return;
         }
 
         /* mask and unmask source interrupt */
-        change = s->regs[addr] ^ data;
+        change = s->regs[reg] ^ data;
         if (change & data) {
             s->mask[irq] &= ~change;
             trace_aspeed_intc_unmask(change, s->mask[irq]);
@@ -200,7 +200,7 @@ static void aspeed_intc_write(void *opaque, hwaddr offset, uint64_t data,
             s->mask[irq] |= change;
             trace_aspeed_intc_mask(change, s->mask[irq]);
         }
-        s->regs[addr] = data;
+        s->regs[reg] = data;
         break;
     case R_GICINT128_STATUS:
     case R_GICINT129_STATUS:
@@ -220,7 +220,7 @@ static void aspeed_intc_write(void *opaque, hwaddr offset, uint64_t data,
         }
 
         /* clear status */
-        s->regs[addr] &= ~data;
+        s->regs[reg] &= ~data;
 
         /*
          * These status registers are used for notify sources ISR are executed.
@@ -233,7 +233,7 @@ static void aspeed_intc_write(void *opaque, hwaddr offset, uint64_t data,
         }
 
         /* All source ISR execution are done */
-        if (!s->regs[addr]) {
+        if (!s->regs[reg]) {
             trace_aspeed_intc_all_isr_done(irq);
             if (s->pending[irq]) {
                 /*
@@ -241,9 +241,9 @@ static void aspeed_intc_write(void *opaque, hwaddr offset, uint64_t data,
                  * notify firmware which source interrupt are pending
                  * by setting status register
                  */
-                s->regs[addr] = s->pending[irq];
+                s->regs[reg] = s->pending[irq];
                 s->pending[irq] = 0;
-                trace_aspeed_intc_trigger_irq(irq, s->regs[addr]);
+                trace_aspeed_intc_trigger_irq(irq, s->regs[reg]);
                 aspeed_intc_update(s, irq, 1);
             } else {
                 /* clear irq */
@@ -253,7 +253,7 @@ static void aspeed_intc_write(void *opaque, hwaddr offset, uint64_t data,
         }
         break;
     default:
-        s->regs[addr] = data;
+        s->regs[reg] = data;
         break;
     }
 
-- 
2.48.1

