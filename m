Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2089135ejc;
        Mon, 9 Jan 2023 00:41:49 -0800 (PST)
X-Google-Smtp-Source: AMrXdXttXpAqfM0zJYnNC6WQMGOVu6k1DCj9z/FFU9XvXc3b2shC9LcXhPWXYpdk/dPIyhGl17nv
X-Received: by 2002:a05:6214:260b:b0:532:ab2:992f with SMTP id gu11-20020a056214260b00b005320ab2992fmr35483692qvb.3.1673253709008;
        Mon, 09 Jan 2023 00:41:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673253708; cv=none;
        d=google.com; s=arc-20160816;
        b=c8jihiufs4S/h8Doh/KtxexLqFkBaPHHdSuQyLqtic0TQZPG9XDtYjLgmUyQYU9rk4
         fu8DKISAFIIDQGJQDYO2CwPDR73uSn/Gdpv84siq3kIQI3HtYTwteUQh3diiNvVIZRAP
         yHygHMJLlJsJmGqN/wg/tT7fZkhhgI755m/1/8LM32wGSGLYSMICqkb6UIwu/SUY5uFi
         ehip+NkScvcXRq08TMcv+a2rOVneqR+i5Vy0K/CHsgacuVUbdDy4fRPY6qnBdRBQeZOn
         E5S0xqrk+8a3xoGwTgmcNkeb1uD2LfnIM6uCJq855UysQyyXD6s2BKsip32vN3LzxF+C
         Y7PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=jJ6oumXx0s46lM7s2kykoKISxxsiXAQ5N5QK1WgQl4I=;
        b=bGXfeteuUvqKj/XTbDHJRy5vusjV1rBSconWBa/uOMH9iFxtKL+LNhmtlLDQYU6smA
         YqQFshJBHGGgI2pgTHGEgewZg/EvZDGmDfj7C7hoJp/d7htcN5XzkDzZimmO6wz98+BZ
         gelYcwqepYowceZV4S7ZrDCphyhRjsToUpHixc7vgHXnxIIUgsX9L+MOyc+YSNABA9Vt
         8o0ki6IxPEgmuiU3PDDiGkaLK7YOA+VC1lf9UVHuuojK/zjdZqLaC6oc25ZhPOGxGoaV
         chmWlqbR0BexQT264xGyj2K952REIMH8n9bFmhFxb4tVMAxe7tqHomR3mOJAI3bdJ7w+
         l+Jw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Yavy+ORR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ef13-20020a05620a808d00b00704b1052c38si4264683qkb.336.2023.01.09.00.41.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jan 2023 00:41:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Yavy+ORR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pEniz-0005lV-Nq; Mon, 09 Jan 2023 03:41:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEniz-0005lD-2o
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 03:41:45 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEnix-0001e5-DQ
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 03:41:44 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 k22-20020a05600c1c9600b003d1ee3a6289so5998364wms.2
 for <qemu-arm@nongnu.org>; Mon, 09 Jan 2023 00:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jJ6oumXx0s46lM7s2kykoKISxxsiXAQ5N5QK1WgQl4I=;
 b=Yavy+ORRYI+PCW0FoOAkryDjunEHMv4VbCloNwKNkbyRCzdm3JuXUcf5dL2TcZzORV
 FlN+ZBJdM1WsonoO+v2ie0zDvNXeEkFn0mD6spBnYchyENb4McReZMoJQaKJTlThEYTE
 2ZcsUdVlKu1LtOjIfc7d5FJZbXdHbkr/mgOQ5cX4GUaek2SND/8i/QbbpmHDH9JiP2SY
 qLKI/E5rl10jbQPQCThC9IiMsj3LALX8dImKXdl/4ayPZbRjPTgyuULmtAgM3+EMKGw7
 uiPrkQrTuk2Mzn85K+dH6IrSiPbfJomnuTPwt36OSEhmjtRaCyzmAUOmd1k9cBUpPZ52
 SQfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jJ6oumXx0s46lM7s2kykoKISxxsiXAQ5N5QK1WgQl4I=;
 b=UrxNdqSalgWzigupghfhB34L9v0gtNsCDcjUIJUU4Vf+8iqYfjuNyXLqrGd5g/skIx
 2ekvOdHh4adsRzkagw/ilhVFzBiUHnsUC3akFeOuBQUai+G7Qu5UUAukKWHhhQ/bQdHL
 /HdSFtuGzpe6fFxqA5ZoTWIHQWqvPs5LAtoYqcbE+6ryJSaxDShdBf44hzCGY6o6gu+1
 vAO6t63B5y7K8bwQ/Tvrlscf5nTKX5UfP+QnVXhaxseu1FKdKg3dNbzNfH8beJs7msZ4
 V5+BAUmxtHHzORQucOC5KLCifeeTd7a91hBwLA7VBk0gSBjxfDKrhgvzbqyWqpBFu9IE
 3bjQ==
X-Gm-Message-State: AFqh2kro+VJht8JRXa6++jGnvFyqKnN52momAGAx75qhNBPztSTYi6mM
 Y9cmegePLAEY2Ao3nf+R0sUrhA==
X-Received: by 2002:a05:600c:1c9d:b0:3d1:f3eb:c718 with SMTP id
 k29-20020a05600c1c9d00b003d1f3ebc718mr55762456wms.19.1673253702592; 
 Mon, 09 Jan 2023 00:41:42 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 e18-20020a05600c4e5200b003d9876aa04asm12553969wmq.41.2023.01.09.00.41.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 00:41:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, qemu-trivial@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 4/5] hw/i2c/bitbang_i2c: Trace state changes
Date: Mon,  9 Jan 2023 09:41:20 +0100
Message-Id: <20230109084121.72138-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109084121.72138-1-philmd@linaro.org>
References: <20230109084121.72138-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: f0LStzuorCff

Trace bitbang state machine changes with trace events.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i2c/bitbang_i2c.c | 34 +++++++++++++++++++++++++++++-----
 hw/i2c/trace-events  |  3 +++
 2 files changed, 32 insertions(+), 5 deletions(-)

diff --git a/hw/i2c/bitbang_i2c.c b/hw/i2c/bitbang_i2c.c
index bf4b781393..9fa19cf8b1 100644
--- a/hw/i2c/bitbang_i2c.c
+++ b/hw/i2c/bitbang_i2c.c
@@ -16,6 +16,7 @@
 #include "hw/sysbus.h"
 #include "qemu/module.h"
 #include "qom/object.h"
+#include "trace.h"
 
 //#define DEBUG_BITBANG_I2C
 
@@ -26,15 +27,42 @@ do { printf("bitbang_i2c: " fmt , ## __VA_ARGS__); } while (0)
 #define DPRINTF(fmt, ...) do {} while(0)
 #endif
 
+/* bitbang_i2c_state enum to name */
+static const char *sname[] = {
+#define NAME(e) [e] = stringify(e)
+    NAME(STOPPED),
+    [SENDING_BIT7] = "SENDING_BIT7 (START)",
+    NAME(SENDING_BIT6),
+    NAME(SENDING_BIT5),
+    NAME(SENDING_BIT4),
+    NAME(SENDING_BIT3),
+    NAME(SENDING_BIT2),
+    NAME(SENDING_BIT1),
+    NAME(SENDING_BIT0),
+    NAME(WAITING_FOR_ACK),
+    [RECEIVING_BIT7] = "RECEIVING_BIT7 (ACK)",
+    NAME(RECEIVING_BIT7),
+    NAME(RECEIVING_BIT6),
+    NAME(RECEIVING_BIT5),
+    NAME(RECEIVING_BIT4),
+    NAME(RECEIVING_BIT3),
+    NAME(RECEIVING_BIT2),
+    NAME(RECEIVING_BIT1),
+    NAME(RECEIVING_BIT0),
+    NAME(SENDING_ACK),
+    NAME(SENT_NACK)
+#undef NAME
+};
+
 static void bitbang_i2c_set_state(bitbang_i2c_interface *i2c,
                                   bitbang_i2c_state state)
 {
+    trace_bitbang_i2c_state(sname[i2c->state], sname[state]);
     i2c->state = state;
 }
 
 static void bitbang_i2c_enter_stop(bitbang_i2c_interface *i2c)
 {
-    DPRINTF("STOP\n");
     if (i2c->current_addr >= 0)
         i2c_end_transfer(i2c->bus);
     i2c->current_addr = -1;
@@ -73,7 +101,6 @@ int bitbang_i2c_set(bitbang_i2c_interface *i2c, int line, int level)
             return bitbang_i2c_nop(i2c);
         }
         if (level == 0) {
-            DPRINTF("START\n");
             /* START condition.  */
             bitbang_i2c_set_state(i2c, SENDING_BIT7);
             i2c->current_addr = -1;
@@ -122,7 +149,6 @@ int bitbang_i2c_set(bitbang_i2c_interface *i2c, int line, int level)
             /* NACK (either addressing a nonexistent device, or the
              * device we were sending to decided to NACK us).
              */
-            DPRINTF("Got NACK\n");
             bitbang_i2c_set_state(i2c, SENT_NACK);
             bitbang_i2c_enter_stop(i2c);
             return bitbang_i2c_ret(i2c, 1);
@@ -147,11 +173,9 @@ int bitbang_i2c_set(bitbang_i2c_interface *i2c, int line, int level)
 
     case SENDING_ACK:
         if (data != 0) {
-            DPRINTF("NACKED\n");
             bitbang_i2c_set_state(i2c, SENT_NACK);
             i2c_nack(i2c->bus);
         } else {
-            DPRINTF("ACKED\n");
             bitbang_i2c_set_state(i2c, RECEIVING_BIT7);
         }
         return bitbang_i2c_ret(i2c, 1);
diff --git a/hw/i2c/trace-events b/hw/i2c/trace-events
index af181d43ee..2a479c1c12 100644
--- a/hw/i2c/trace-events
+++ b/hw/i2c/trace-events
@@ -1,5 +1,8 @@
 # See docs/devel/tracing.rst for syntax documentation.
 
+# bitbang_i2c.c
+bitbang_i2c_state(const char *old_state, const char *new_state) "state %s -> %s"
+
 # core.c
 
 i2c_event(const char *event, uint8_t address) "%s(addr:0x%02x)"
-- 
2.38.1

