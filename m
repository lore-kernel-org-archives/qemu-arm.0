Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2089342ejc;
        Mon, 9 Jan 2023 00:42:19 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtphQq3r0c60umWwBhf+SvyR6h2jjPLCz8P3WmE6NqE9Rkx1V3j2ZMNXXLe6dtO95+H+D/R
X-Received: by 2002:ac8:7cc:0:b0:3ab:67cc:e8fe with SMTP id m12-20020ac807cc000000b003ab67cce8femr79238358qth.27.1673253739254;
        Mon, 09 Jan 2023 00:42:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673253739; cv=none;
        d=google.com; s=arc-20160816;
        b=AXleCCxGnr8niMQQsf6oij+qyK7cHv58saFq21YV6+71I8QOwTZTH00fwgh6e6+jf/
         RjY5kPKZFnWWymbafZZ2EM/q27jMd1b1oIKlyZQA/IBYRqMwkMetPnwvXiWHyUW9GTdL
         vtk1e40i1DRDhSuBwYeDLf2JyODgONxJQ8eyrU9EVx9mQpo02yaZlgVD3pOyivn0Cl6p
         TBvt7n4IzE5e6VV5G8rLVz58TaT2QJBooBNcrsgIaErvC0OsO0W/2Th+qu+5ZbauZOVH
         7s1rjoYAKplwbHdAzLbUUHPDRhqTwlx1ITWsHK8ElGoK+vazN6F0zvHzGZ/lK4g+TyRx
         +q9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=rJ7Ld9KMG3cV36Q3MxoGtMbfv5FoM/NwLMR+8A4FApY=;
        b=gsI79j9CZQxJt/nQXfkN0VyEOipTKNams13JIpFyZ9CoimcxTNN3evzDTLr3RUJVhB
         aY02oeBrgBXZPYkPBlrKhgvL8bCS4/EQrzl6DQcL1YJNqg/XRcoO68ISWXUkbBpMPpOG
         bBUQZSInN/JGY8bMuAD96vloXRCIWRAze6eGLPfU/RGP6PT/3HzzjKMmjHVR3v7EaaO2
         TFjIClBFumTFpFcOLRxZzPqdj33FZSWQAsHUAlpudoK8M9P6faYMJUXuhK1nytjXxh+F
         SrcvOaw8lM7tH3C08r7qGmAlRouL+IIVq/xgl+iE0617QUc/z9eOnqqRhPIxRy/M7U4B
         T9+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qachPbsK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v15-20020ac8728f000000b003a4f294f6a9si3971998qto.745.2023.01.09.00.42.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jan 2023 00:42:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qachPbsK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pEnj4-0005om-Og; Mon, 09 Jan 2023 03:41:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEnj3-0005oa-M9
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 03:41:49 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEnj1-0001eP-W4
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 03:41:49 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so8433029wmb.2
 for <qemu-arm@nongnu.org>; Mon, 09 Jan 2023 00:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rJ7Ld9KMG3cV36Q3MxoGtMbfv5FoM/NwLMR+8A4FApY=;
 b=qachPbsKzMR+AMKRNhD4UGtfFP1ArC77+F3/gsw6SbkjSbjkhLM6aJGpEJJWb8SFIK
 VnWxvcR7jgak923oQrD2S4R5+lQ+F/DYuesknN5e3oU++WaLkaGO/20/K8poZwG2yT/s
 TsW3t/rysBYtNucAGyfWro+1sVL5zJlBoi6IwzzjU6RStYfS+RlUh9WRxuzsSh7gh/A2
 khag8XexU0XnotBkg71iwCIh1PRY1F7ztlk6118KFsXP6iDYE/7Fj0GgOSDFON9VPTs6
 vdaxuD4XYWo9dsEj7pL1CTsFN74fvgElldGAd5Mwd6iWjxai0HJTtLV+twrpujKkKzEP
 RQPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rJ7Ld9KMG3cV36Q3MxoGtMbfv5FoM/NwLMR+8A4FApY=;
 b=xiy1jujS2uKtDJTsVthJwHCW3WHAGRQUQFTtNtw2tNYuWviVSwyMN4PHEtDaxLCqaT
 djMMLSzOXT3GhmHMsKYvfoJaOD/KWq40cFxFZspnMFjzkFZQdGEfWPVabfxuQrE4fQFA
 M6g2E09XGGWomBiB8j5T3yG6tZMRIYkxRHvjxpqomyz/Byikr/pD8K0NU0n9ZZNeMFu+
 rP1Z5zag1l2KSuk550Qz8NU+JLsskOsOmjZeul03jngt3uXlx9tzalDm+GIONptVfMUF
 G1fCtWBPVTYorTQwBdjzoTFvJeV5APDJh1+zG3kl0D9SVSHt5Z3DQHbUpzPSsXvzFxkZ
 Tr+g==
X-Gm-Message-State: AFqh2koAct20QlvMegZ19+u++Ua9sgyaY4FrvfzpSExuMrpixMOBFcCn
 AvnEPtmSj2naSmPc10d7VKPC3RQmaJn3zVWP
X-Received: by 2002:a7b:ce8e:0:b0:3d7:1b84:e377 with SMTP id
 q14-20020a7bce8e000000b003d71b84e377mr47660529wmj.27.1673253707375; 
 Mon, 09 Jan 2023 00:41:47 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 he5-20020a05600c540500b003d9ed40a512sm4853414wmb.45.2023.01.09.00.41.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 00:41:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, qemu-trivial@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 5/5] hw/i2c/bitbang_i2c: Convert DPRINTF() to trace events
Date: Mon,  9 Jan 2023 09:41:21 +0100
Message-Id: <20230109084121.72138-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109084121.72138-1-philmd@linaro.org>
References: <20230109084121.72138-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: MyAWX2D2PzQA

Convert the remaining DPRINTF debug macro uses to tracepoints.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i2c/bitbang_i2c.c | 18 ++++++------------
 hw/i2c/trace-events  |  4 ++++
 2 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/hw/i2c/bitbang_i2c.c b/hw/i2c/bitbang_i2c.c
index 9fa19cf8b1..ffc5b95410 100644
--- a/hw/i2c/bitbang_i2c.c
+++ b/hw/i2c/bitbang_i2c.c
@@ -18,14 +18,6 @@
 #include "qom/object.h"
 #include "trace.h"
 
-//#define DEBUG_BITBANG_I2C
-
-#ifdef DEBUG_BITBANG_I2C
-#define DPRINTF(fmt, ...) \
-do { printf("bitbang_i2c: " fmt , ## __VA_ARGS__); } while (0)
-#else
-#define DPRINTF(fmt, ...) do {} while(0)
-#endif
 
 /* bitbang_i2c_state enum to name */
 static const char *sname[] = {
@@ -72,8 +64,10 @@ static void bitbang_i2c_enter_stop(bitbang_i2c_interface *i2c)
 /* Set device data pin.  */
 static int bitbang_i2c_ret(bitbang_i2c_interface *i2c, int level)
 {
+    trace_bitbang_i2c_data(i2c->last_clock, i2c->last_data,
+                           i2c->device_out, level);
     i2c->device_out = level;
-    //DPRINTF("%d %d %d\n", i2c->last_clock, i2c->last_data, i2c->device_out);
+
     return level & i2c->last_data;
 }
 
@@ -138,11 +132,11 @@ int bitbang_i2c_set(bitbang_i2c_interface *i2c, int line, int level)
 
         if (i2c->current_addr < 0) {
             i2c->current_addr = i2c->buffer;
-            DPRINTF("Address 0x%02x\n", i2c->current_addr);
+            trace_bitbang_i2c_addr(i2c->current_addr);
             ret = i2c_start_transfer(i2c->bus, i2c->current_addr >> 1,
                                      i2c->current_addr & 1);
         } else {
-            DPRINTF("Sent 0x%02x\n", i2c->buffer);
+            trace_bitbang_i2c_send(i2c->buffer);
             ret = i2c_send(i2c->bus, i2c->buffer);
         }
         if (ret) {
@@ -162,7 +156,7 @@ int bitbang_i2c_set(bitbang_i2c_interface *i2c, int line, int level)
     }
     case RECEIVING_BIT7:
         i2c->buffer = i2c_recv(i2c->bus);
-        DPRINTF("RX byte 0x%02x\n", i2c->buffer);
+        trace_bitbang_i2c_recv(i2c->buffer);
         /* Fall through... */
     case RECEIVING_BIT6 ... RECEIVING_BIT0:
         data = i2c->buffer >> 7;
diff --git a/hw/i2c/trace-events b/hw/i2c/trace-events
index 2a479c1c12..b0ab237b0f 100644
--- a/hw/i2c/trace-events
+++ b/hw/i2c/trace-events
@@ -2,6 +2,10 @@
 
 # bitbang_i2c.c
 bitbang_i2c_state(const char *old_state, const char *new_state) "state %s -> %s"
+bitbang_i2c_addr(uint8_t addr) "Address 0x%02x"
+bitbang_i2c_send(uint8_t byte) "TX byte 0x%02x"
+bitbang_i2c_recv(uint8_t byte) "RX byte 0x%02x"
+bitbang_i2c_data(unsigned dat, unsigned clk, unsigned old_out, unsigned new_out) "dat %u clk %u out %u -> %u"
 
 # core.c
 
-- 
2.38.1

