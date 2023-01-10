Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3017170ejc;
        Tue, 10 Jan 2023 01:17:56 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvLy8gWgDoizjzpo6GyQ61ZzabTSjco7IEQNJYMehpRQ5Mm+fQ4dyypFz0gZS9Zk7uQ2HQM
X-Received: by 2002:a05:6214:2e85:b0:532:2aea:dd6 with SMTP id oc5-20020a0562142e8500b005322aea0dd6mr14603844qvb.40.1673342275835;
        Tue, 10 Jan 2023 01:17:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673342275; cv=none;
        d=google.com; s=arc-20160816;
        b=aZWGOVQQpbJkz9o5BXIMicMD7MSQTObmmTqqdp9gHnwwvaEvvbYqpiqfmk2iD/jUbS
         a5J3cz82WieoKko/lhkMnNSjg8QX2NvaU95v0Cfx8lszq9m2NAlogO54MrelgO6C7fW+
         Ec+O20VdrxktWkq2JM4e0Ng1IUoC+EFsvkycV58r03esRZusYBRfcPxmGrmhWBiZfI+u
         L4gldZqVqHJO0rHw3Rmta4nlRG9af3DiUZrvJGReVlMFnbz4EQZSQlanF7yAGqgSODBH
         n7tTMdyaXAs8idGcyz4QCbPlLWaeeINlnKTp2Ic0H/XjUMd7/pqRrECHGjRgxoynOHMX
         i8bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=YTYPqD95cY5TwqXLZ5zIgXtmsM6zTeYLc7VV77204BU=;
        b=soGg8rV5vkWF+mzHY+uZDoVDXKYupMh1UxqNcl0dor+SuZ9Fssk9EJZMTKIWmbpxA7
         vFaz1gjkt/1Jggh4DwVn5uZ779V6MQ+3ZdOCWFAIPvpEAH/IHW7zDNbgzSUNb34+SvKy
         KpoBGeflpNlqNFVWVjkjmCma4+51b1CJWf4D1kfW2gArPWtPowCQ8WhmEMACd3z0N1WP
         BmpZinjU7O9/VxmKDRWSl+OF5PrX4sZbkJdC/S/gAZIpyv6n+S6fwpayX8kYMZaFG1UB
         Y6tcL/LZHAAJWMMQSr7Y0Lq/2M+HLi7pxyBWnS1kCRgbG/sptmiUBMcPVzHaQTTdSMsg
         XZ+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eggjPYCc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f14-20020a0562141d2e00b00531bfc6b3casi6314861qvd.188.2023.01.10.01.17.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Jan 2023 01:17:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eggjPYCc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pFA1D-0006l2-J4; Tue, 10 Jan 2023 03:30:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFA1A-0006hq-SJ
 for qemu-arm@nongnu.org; Tue, 10 Jan 2023 03:30:01 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFA19-0006IE-9K
 for qemu-arm@nongnu.org; Tue, 10 Jan 2023 03:30:00 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 p3-20020a05600c1d8300b003d9ee5f125bso4684505wms.4
 for <qemu-arm@nongnu.org>; Tue, 10 Jan 2023 00:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YTYPqD95cY5TwqXLZ5zIgXtmsM6zTeYLc7VV77204BU=;
 b=eggjPYCc4xn/NK5p5yg68Sq4fZyFvEQtpAOmXKiQ0G+NdIfSHKHWSriObpl7Cvz1FE
 9FV40vwFJmLxn02ypMbOi588HbamYm27/7Cf6fjbwGsgN5dE85Fxn65bFleAmA+5ufdq
 xjwBI8Zzs+7HyD/6iBW2ufpD3jylMG29FMO8qFzEgfn/oXxp9QtcSf+Z0gs53AGBxR3V
 +HaXe9wRAXcv9azkxqVxdWQ1p45VMsQDUvOoqU+p4gNTNgqldz/NpSa9/eJs70tM6mt9
 uGnwcS2iDhidHTR8n9yY5gELuhYxtY9PJhSCPnljM/fuTIvjOT2cYxkfvQ4I0OCDmHIU
 ghZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YTYPqD95cY5TwqXLZ5zIgXtmsM6zTeYLc7VV77204BU=;
 b=igcYfgc4W6PJYkNOQnvPIdjUHLroDpD2R8SBnlU1VziYRRrpMqFEEX/94euHvPS6hk
 Cu0puS59cFyuftUEHwuHLvqDZm+0/VrmZ3J+istt1SBfI/RFoNDn6D/j3jKk1HRUbg0Y
 mhb2XoZq2MApnkjsGPpsqSdnJU4HINXxJ1CvuW6VKlwgzLbEAhPlle5mEYcq30jpARjC
 U/u2d5ASdgTJyBPhprcteVHprFlVzlsUKeVvKKf3325j+5ZYR82DKjGsLp54gGYrxx0J
 I6I7YpAk8wQ/f0qptwGJ3uufvK4H+wrEQPPcqV1BHbMq/dchEVwAArd7eeCsfWwXaMSl
 /3sA==
X-Gm-Message-State: AFqh2kr6mc2ervF6V+N9UzZigDAXoX1F6PW3w/foGIb9jZ2TeXmqx5yK
 wS/SJzYYe7Mj65lTgk1a32Mz+Q==
X-Received: by 2002:a05:600c:4f48:b0:3c6:f7ff:6f87 with SMTP id
 m8-20020a05600c4f4800b003c6f7ff6f87mr49313237wmq.11.1673339398585; 
 Tue, 10 Jan 2023 00:29:58 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 o5-20020a05600c510500b003b4ff30e566sm841192wms.3.2023.01.10.00.29.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 10 Jan 2023 00:29:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Jan Kiszka <jan.kiszka@web.de>,
 qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 5/5] hw/i2c/bitbang_i2c: Convert DPRINTF() to trace events
Date: Tue, 10 Jan 2023 09:29:32 +0100
Message-Id: <20230110082932.24386-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110082932.24386-1-philmd@linaro.org>
References: <20230110082932.24386-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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
X-TUID: RDoQh65+8O0e

Convert the remaining DPRINTF debug macro uses to tracepoints.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/i2c/bitbang_i2c.c | 18 ++++++------------
 hw/i2c/trace-events  |  4 ++++
 2 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/hw/i2c/bitbang_i2c.c b/hw/i2c/bitbang_i2c.c
index 8a67ff6fae..d6589f0d4a 100644
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
@@ -71,8 +63,10 @@ static void bitbang_i2c_enter_stop(bitbang_i2c_interface *i2c)
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
 
@@ -137,11 +131,11 @@ int bitbang_i2c_set(bitbang_i2c_interface *i2c, int line, int level)
 
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
@@ -161,7 +155,7 @@ int bitbang_i2c_set(bitbang_i2c_interface *i2c, int line, int level)
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

