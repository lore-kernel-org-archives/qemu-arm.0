Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3822671ejc;
        Wed, 11 Jan 2023 00:54:47 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsz4toRLLTSuo9g+U3w+y4hGNyqDr04J/7+Txuw6oCl1IvOf8MJ3JiE6pdjBJxwmFJUWQEz
X-Received: by 2002:a05:622a:3d1:b0:3b0:ea77:2d09 with SMTP id k17-20020a05622a03d100b003b0ea772d09mr1323356qtx.18.1673427287799;
        Wed, 11 Jan 2023 00:54:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673427287; cv=none;
        d=google.com; s=arc-20160816;
        b=WLVvD4lancUmwXw/jVJZu/4xl8m/GICZVAfVUHSQw0smqTVHxjTNkWvcVKjSAu41U9
         RmCNUSmUX6yf93oLMNxaQJF0jrRnJqtNr2iragS+q4hVyOw4Q+Ftg9QGgf3VsXqu5jic
         M0/NsImkMfaGA58vgiSENX088n7EebRXdFSjZ0/u68vEZaQ+3XxQdufZhvvshfFfagnx
         LGXIO3fAWQlI0Bo7jxIptaRf3l+VegshHMpuD2ZkmAacCfuz4YryXbc4xDo8GgTDtXRf
         1y02U6IZwPsWb2tKg2yI6cepgWvh9qriOrYoNE2B3DOz2VWKYzbRhJxtr9VO9VphesH/
         PeKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Uj4vMJ6IjNLjq+M6XLE4uewGsLuqMTdFQ7srLl6Qez8=;
        b=jizmczbtw6QmfxtUHUzzbagEyL2LHJvFmPEYDB10hMX24/Toew5+tXRbmxTk91Ke7p
         81RfyeYLfw2jpepHenjrRqZ8NaFnYkoBF5M/jPvl1CW54f+ss31LarEygnSu0MJfRT7v
         wtfzGc/TAMU6LJ3aBNGCTFjPDqUJsZ3632hgZVAPbF4XuzA3Pr18lTHEofMhAEtgJyoA
         U1TfiX+bdy3BdiPX3xeoFgDLIVPgs9lApR3lR90kACjENKLG6PPU3tQdLT3ohs5leaRt
         sxlzxIBI7dwqxW2002tSVHcHAXsNqco6LJMPtbJe8UBpyAP096Kh9aUMRFxEB/cfVNdO
         tiPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nn7K67Cq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m11-20020a05620a290b00b006fca0358d87si8475264qkp.239.2023.01.11.00.54.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Jan 2023 00:54:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nn7K67Cq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pFWou-0003T5-Hc; Wed, 11 Jan 2023 03:50:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFWon-0003Li-Sp
 for qemu-arm@nongnu.org; Wed, 11 Jan 2023 03:50:48 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFWom-0007jP-8C
 for qemu-arm@nongnu.org; Wed, 11 Jan 2023 03:50:45 -0500
Received: by mail-wr1-x42d.google.com with SMTP id z5so13243984wrt.6
 for <qemu-arm@nongnu.org>; Wed, 11 Jan 2023 00:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Uj4vMJ6IjNLjq+M6XLE4uewGsLuqMTdFQ7srLl6Qez8=;
 b=nn7K67CqhIZdqQiZ0FRG+l8zJK2tXJlgfvl+gnULYM5YIJhcEFfmSXLfvO+O2kZPHg
 5M8QgibkrAU8jtvEWWWn9cdrAQX+n41+4To2eGIdEtzAgSabo+Hm05POkgMtE/BVlLFu
 c4PUTL53OvDx1MrZfnQHuOli/kl0pVa/4/yvkOKy+myzVeeOJf08vzkuGy0K/7FwDxm2
 5yoUuWxBRSROlBK7mx+MxYLreTOaXf2jQTPMNRED15hJwfsbKZaMuVLKH+hJ/beQZQba
 ihZT0E7Oj03U4VUxwrUSFoo5wiNwkn93PzsQy4RnT5NlrWM6GLYO65nrb9I6a7JObfYs
 4TFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Uj4vMJ6IjNLjq+M6XLE4uewGsLuqMTdFQ7srLl6Qez8=;
 b=koanmeyJ6Sl++qTlkVViIPrhzhl+780nPN7DMXUpv0wOB8vvlPPioGZuSJVqc68S1V
 w2xRuAJxEiX47JpDaWLfTgxOUd96RjOJEVBJgR9XrR69BzKGsvQOXtPVRAH0KhNQOA44
 MYn/GJlE1cjyeKKt+Qc83sV93/CVqC+Ue3CMICo+x5OIqIMR3xhM6YzTJTZgb/hTavOL
 fBeytMSVsiyoXDuTSWsKwdxb0EVEQd9KlvmnlR1ncEA81fEyveHR5LSFWrSRTKfWBhCa
 jf5hZcCtEQ3ycRFnWeWOKSpp9jAnwS/pPy9opKRQUog5ddm9isg5l9niTwDPOEVbZGaK
 kDiA==
X-Gm-Message-State: AFqh2kpBrDvhuykfqZmpelG6rlAYpsSMPUWz5VqdFF8MYwncdb+npkEi
 6GM0w7sfF1ldR2IbU2iNu0tmhQ==
X-Received: by 2002:a5d:630d:0:b0:2ac:5b46:9c85 with SMTP id
 i13-20020a5d630d000000b002ac5b469c85mr15283173wru.68.1673427042808; 
 Wed, 11 Jan 2023 00:50:42 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 l13-20020adfe58d000000b00296730b5c3esm13272686wrm.102.2023.01.11.00.50.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 11 Jan 2023 00:50:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Jan Kiszka <jan.kiszka@web.de>,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 5/5] hw/i2c/bitbang_i2c: Convert DPRINTF() to trace events
Date: Wed, 11 Jan 2023 09:50:16 +0100
Message-Id: <20230111085016.44551-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230111085016.44551-1-philmd@linaro.org>
References: <20230111085016.44551-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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
X-TUID: bOSaVU/PT6S3

Convert the remaining DPRINTF debug macro uses to tracepoints.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/i2c/bitbang_i2c.c | 18 ++++++------------
 hw/i2c/trace-events  |  4 ++++
 2 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/hw/i2c/bitbang_i2c.c b/hw/i2c/bitbang_i2c.c
index efc49b7502..bb18954765 100644
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
 static const char * const sname[] = {
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

