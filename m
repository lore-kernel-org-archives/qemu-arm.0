Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp490537lfy;
        Fri, 21 Aug 2020 10:35:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxS3Zy1R+ndHhZbNR3hzKUadASeJXRA7AsIoyrGtNvbsbHXcxNuHH8S4h9GOoOk2q53g0yJ
X-Received: by 2002:a25:4252:: with SMTP id p79mr5612650yba.229.1598031351257;
        Fri, 21 Aug 2020 10:35:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598031351; cv=none;
        d=google.com; s=arc-20160816;
        b=PowEU3YRZMuhywSwV7psExiNxVpEvoB1BUMPf6fhMDTElCjCKezfbiF+qRVefX7BUA
         1myqAOK74fC2TXJ3CV0yVVsk3ofWmJCehhyZejO8Dp2aiFEq7UEOQ9QWNS8w8Iz6+JES
         RrblczptRpLYuo6NFgiDWieBj55aFG8203SmV/suLdCToUH273kU8YT5w3jCBwkqoQN3
         FZIpPM6eCYqGgBQOBjM6zZ+gmskLxo3TqKYYeYoK2Z3p9fAxrvPJ3XBoUXzu5u8EjmUQ
         hNhlN8DQ5N7PnkmLWmip6ngEWzU/keNeGWQz2WAKK1nG0HPwaeIyETWzFbIqPNj9jOiN
         K+Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=t2AXewhSqJh0kBZThS6xJGNW5Vas7WuOoZOyr5gsCOA=;
        b=mcoUZS25bdLGluhuOuerNZ8Eok8ukyqhHzNX2vyI/RGRbj+CqcnY4ilj6jV64iY6UY
         iBDYWrIwBoPNa/b0CvLgViTlhK5c+/26ERl+fj5YQosCWLiVpYVyXFY4kC5Y+amjHft5
         YnyPXpmiUR50FSW9sfaXYU+bjIf3HBa1vcHPufUs5H4mO4yII5pBtimMeJVJOi5HjlqJ
         nXlWj2IjCIhdVRLPiYuNBfR4zWuKBlOLn/74JUj6fRmty1JfZc2GsTuXULxPfH4gTEh2
         snwQzs8BREEn/PIPZz2n85cC5vaoi1J7opXH6fwK02Rs1kulPqlP8Rv2C4e3E2G+TG7+
         DHjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rb3jWaYb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q203si2721313ybq.221.2020.08.21.10.35.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Aug 2020 10:35:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rb3jWaYb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:39334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k9AxC-0004XJ-J8
	for alex.bennee@linaro.org; Fri, 21 Aug 2020 13:35:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k9ArF-0001Yz-9t; Fri, 21 Aug 2020 13:29:41 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:53850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k9ArD-0001DC-MZ; Fri, 21 Aug 2020 13:29:40 -0400
Received: by mail-wm1-x336.google.com with SMTP id u18so2637013wmc.3;
 Fri, 21 Aug 2020 10:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t2AXewhSqJh0kBZThS6xJGNW5Vas7WuOoZOyr5gsCOA=;
 b=rb3jWaYbqU5x2TEg+8pRIeXF7iFkU/pWYrnxC1Rqn+Y9K+t0VJiNjO+wg2M+bm9jri
 i+O1f9ANL/aiNVv+4LXoKl6M/IkDwaXoD0lC6OwFuKpVpxCae7t3337DiX7KHj5j3j3Y
 uQJcAS+K6t/cW6OhfCiprUR18+9zxxKMkpk1R0uIQ+xGWERSge3nKGf9vQAuqfP8s4iV
 1IyWYLzCXn8M8pk+kC+wXchjQcAYRc7+IRYEs24rcr1lQ7DQoLiBR7jApxWifx1B6iqR
 kCUYeN4OrrBald7pj90JXCGHObN86BIP39G+27cgAFk78W8ptCcnqzQAD3ILIgz+tV3z
 D0hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=t2AXewhSqJh0kBZThS6xJGNW5Vas7WuOoZOyr5gsCOA=;
 b=jxN3NOnNOYJP+xT3MehoggxwmamOYrd+J0YISrqdDrxZSalf/MeEvxY3BjcoAAVKMF
 hbGNOur2v52mY0P4QRJWGazJbxSJios9JsbEYaez/xFZ9QImJT/vIskI6hcJedvpti1Z
 jyybzMH5vQOX7hr7HcpAAyYsduJPcjgSNjT22k3sIne7vVTnmiR9FReQwlyb1327jikF
 EMV9oJjInhdoMlHj9Zn0dxRacE8MAtAePAbN0BSMTw4MHDXVz3oeBFVO8uQk0aLyn/+I
 fnwCe8s8FoVhLQYQfMchxEw8hUE0C1yvtEGsnxuWRBydiO7uUVzpupgPXpBof3ibI15M
 LSjg==
X-Gm-Message-State: AOAM530J5ZHzi2QIUFkuuODRcpzJEd+geQMKlBOAFdhRDEcGH1VMlCrb
 3VLYOXcdbAUjdZUftPxumOC8rd8JCrM=
X-Received: by 2002:a1c:7203:: with SMTP id n3mr4348800wmc.149.1598030977295; 
 Fri, 21 Aug 2020 10:29:37 -0700 (PDT)
Received: from localhost.localdomain (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id 32sm5315471wrn.86.2020.08.21.10.29.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 10:29:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/23] hw/sd/pl181: Replace disabled fprintf()s by trace events
Date: Fri, 21 Aug 2020 19:29:05 +0200
Message-Id: <20200821172916.1260954-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200821172916.1260954-1-f4bug@amsat.org>
References: <20200821172916.1260954-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Beniamino Galvani <b.galvani@gmail.com>, Michael Walle <michael@walle.cc>,
 qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ejthc0ipBSSd

Convert disabled DPRINTF() to trace events and remove ifdef'ry.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Acked-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20200705204630.4133-9-f4bug@amsat.org>
---
 hw/sd/pl181.c      | 26 +++++++++-----------------
 hw/sd/trace-events | 10 ++++++++++
 2 files changed, 19 insertions(+), 17 deletions(-)

diff --git a/hw/sd/pl181.c b/hw/sd/pl181.c
index f69488ebac3..574500ce600 100644
--- a/hw/sd/pl181.c
+++ b/hw/sd/pl181.c
@@ -17,15 +17,7 @@
 #include "qemu/module.h"
 #include "qemu/error-report.h"
 #include "qapi/error.h"
-
-//#define DEBUG_PL181 1
-
-#ifdef DEBUG_PL181
-#define DPRINTF(fmt, ...) \
-do { printf("pl181: " fmt , ## __VA_ARGS__); } while (0)
-#else
-#define DPRINTF(fmt, ...) do {} while(0)
-#endif
+#include "trace.h"
 
 #define PL181_FIFO_LEN 16
 
@@ -158,7 +150,7 @@ static void pl181_fifo_push(PL181State *s, uint32_t value)
     n = (s->fifo_pos + s->fifo_len) & (PL181_FIFO_LEN - 1);
     s->fifo_len++;
     s->fifo[n] = value;
-    DPRINTF("FIFO push %08x\n", (int)value);
+    trace_pl181_fifo_push(value);
 }
 
 static uint32_t pl181_fifo_pop(PL181State *s)
@@ -172,7 +164,7 @@ static uint32_t pl181_fifo_pop(PL181State *s)
     value = s->fifo[s->fifo_pos];
     s->fifo_len--;
     s->fifo_pos = (s->fifo_pos + 1) & (PL181_FIFO_LEN - 1);
-    DPRINTF("FIFO pop %08x\n", (int)value);
+    trace_pl181_fifo_pop(value);
     return value;
 }
 
@@ -184,7 +176,7 @@ static void pl181_do_command(PL181State *s)
 
     request.cmd = s->cmd & PL181_CMD_INDEX;
     request.arg = s->cmdarg;
-    DPRINTF("Command %d %08x\n", request.cmd, request.arg);
+    trace_pl181_command_send(request.cmd, request.arg);
     rlen = sdbus_do_command(&s->sdbus, &request, response);
     if (rlen < 0)
         goto error;
@@ -201,16 +193,16 @@ static void pl181_do_command(PL181State *s)
             s->response[2] = ldl_be_p(&response[8]);
             s->response[3] = ldl_be_p(&response[12]) & ~1;
         }
-        DPRINTF("Response received\n");
+        trace_pl181_command_response_pending();
         s->status |= PL181_STATUS_CMDRESPEND;
     } else {
-        DPRINTF("Command sent\n");
+        trace_pl181_command_sent();
         s->status |= PL181_STATUS_CMDSENT;
     }
     return;
 
 error:
-    DPRINTF("Timeout\n");
+    trace_pl181_command_timeout();
     s->status |= PL181_STATUS_CMDTIMEOUT;
 }
 
@@ -262,11 +254,11 @@ static void pl181_fifo_run(PL181State *s)
         s->status |= PL181_STATUS_DATAEND;
         /* HACK: */
         s->status |= PL181_STATUS_DATABLOCKEND;
-        DPRINTF("Transfer Complete\n");
+        trace_pl181_fifo_transfer_complete();
     }
     if (s->datacnt == 0 && s->fifo_len == 0) {
         s->datactrl &= ~PL181_DATA_ENABLE;
-        DPRINTF("Data engine idle\n");
+        trace_pl181_data_engine_idle();
     } else {
         /* Update FIFO bits.  */
         bits = PL181_STATUS_TXACTIVE | PL181_STATUS_RXACTIVE;
diff --git a/hw/sd/trace-events b/hw/sd/trace-events
index 5f09d32eb2c..a87d7355fb8 100644
--- a/hw/sd/trace-events
+++ b/hw/sd/trace-events
@@ -62,3 +62,13 @@ milkymist_memcard_memory_write(uint32_t addr, uint32_t value) "addr 0x%08x value
 # pxa2xx_mmci.c
 pxa2xx_mmci_read(uint8_t size, uint32_t addr, uint32_t value) "size %d addr 0x%02x value 0x%08x"
 pxa2xx_mmci_write(uint8_t size, uint32_t addr, uint32_t value) "size %d addr 0x%02x value 0x%08x"
+
+# pl181.c
+pl181_command_send(uint8_t cmd, uint32_t arg) "sending CMD%02d arg 0x%08" PRIx32
+pl181_command_sent(void) "command sent"
+pl181_command_response_pending(void) "response received"
+pl181_command_timeout(void) "command timeouted"
+pl181_fifo_push(uint32_t data) "FIFO push 0x%08" PRIx32
+pl181_fifo_pop(uint32_t data) "FIFO pop 0x%08" PRIx32
+pl181_fifo_transfer_complete(void) "FIFO transfer complete"
+pl181_data_engine_idle(void) "data engine idle"
-- 
2.26.2

