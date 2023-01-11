Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3820034ejc;
        Wed, 11 Jan 2023 00:51:01 -0800 (PST)
X-Google-Smtp-Source: AMrXdXumQ55qKQ0GX5a7D/ttSTuK+ogGp1yRaxTBcMvTbXtIacA+yOTmbp+aLZNg9opIacrAqje7
X-Received: by 2002:a05:622a:4c88:b0:3a8:21a5:d93 with SMTP id ez8-20020a05622a4c8800b003a821a50d93mr115042693qtb.39.1673427061409;
        Wed, 11 Jan 2023 00:51:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673427061; cv=none;
        d=google.com; s=arc-20160816;
        b=hgG9seP77Bb4Ew1Ta6M14zXq0zDOoF9XycxfMgwl0KYFH+dBsmryvo+5TkBsl9eGg8
         b/VhSd4LMxziSEv/nM/fh5MXgb8jBy0wJTtxDcGQM1huxcKvcYAisE4JpsHXLbEbdydC
         pSETU4wu8kXib/jDBEtfBTYhD+hmsNmxxKYZVFkALMOwm2Au0oJ5zGQSqyRUzSH9fvMI
         yInOX6a9TkxDwMnJu9cNMb1VmJpMGvOJI4HP4Omo1tC3nc0zr8E+/rBHnzO/p00ZVilc
         QQeeORtlw64wRNHqirvG/zXEZ4UsZAks5oHK/J1Nfbaz850+bd4G4/LERJDA/AF6Bbwj
         TUTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=F1k/7mPGH5gDcWWku0OjBNNAk942aGuA5NQSFVWJSqE=;
        b=wLnWF37GTWubhYiuOvItrQkof/5mP8PauDMmn/E0UwyL2+QxCvfZN6eSDzInqByCpD
         LxnAjeyEhEpOPioBt8jkZrDmWXIYv/z0+YiqBZ0TQlZBasrnWjHaf3MUTRW1hFgb/KOO
         fCFYSyMjUXyAtwAGkxTS4SHmTNZ8DNJ+0t0izkdnldSSsr/U6ghgI/PftrQCNcehz5ni
         8N9y5dVLQvhD2i/JfJKRp92nOrZgFtNYw2IS8PtbSSjc5Q6ukDu8tYmMv0NJqeocLH23
         EX8rHd+y0Wb55QU7E1ODFBvWuGhsQPjK9HX4JjT1XIa5xlpQn7c9Q3NHwPRObwsWV0YD
         ocPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YdQP44Uz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dt22-20020a05620a479600b00705c2785684si3733002qkb.10.2023.01.11.00.51.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Jan 2023 00:51:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YdQP44Uz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pFWot-0003Ry-8q; Wed, 11 Jan 2023 03:50:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFWoj-0003Jk-3w
 for qemu-arm@nongnu.org; Wed, 11 Jan 2023 03:50:41 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFWoh-0007h7-An
 for qemu-arm@nongnu.org; Wed, 11 Jan 2023 03:50:40 -0500
Received: by mail-wr1-x42a.google.com with SMTP id e3so5086237wru.13
 for <qemu-arm@nongnu.org>; Wed, 11 Jan 2023 00:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F1k/7mPGH5gDcWWku0OjBNNAk942aGuA5NQSFVWJSqE=;
 b=YdQP44UzORDUM2gwiED1ZAncZYIEgNPk70Z3okWesFAwhaGWfhuhu6JLrgH40cEJtF
 TTpCt2psGRmAcEKuYxWBi3EjnyH0zeyDXAtc1wfDFYIwUr/Sc08EVNfeS5pYFF/86aCm
 0LcYjO11dWnRTvtqy+jX5yd3a8YKoLpnOn67MkbtcDjix9WTJLdrcvxpT3I66SlMo9Dm
 uQjc4WCRLuhxjVvTmQDGprBglJYCqQOVZJ+hKrnM2KxqxLyeFjJzJ3VS/JdE55ZjnAZl
 rd/dTscwK1UsoJU3wbYzAOr1OqVCFqhpBkXJ+FFvE/+RsOEqMOJxdSWhfsauAaWxbHLz
 FaiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F1k/7mPGH5gDcWWku0OjBNNAk942aGuA5NQSFVWJSqE=;
 b=5h7BvJPxaBA0lQjv60p0z9/c2a8abi8xw0RyoayUdSLyD5Z0rm/VSCBEFP8M9vgFgL
 sgxnhdQzfDeBd4gtzsFNzyCTai37c3fzIV/VQDt70ob45LaEzakzzNH5ujvOEcKiMnQ2
 vPsu5OKojxihr6stE55MKAeNt+jBgbJPl5ol748vuJLYiQzYrVDM1/qHIcW1asD87VUe
 zcdX5r3SsfC2lZZO8oW9QS3yTNWOZDGEuBh2X8xP/62ulWjBQ1Orp8vGAUQczXY0lLJQ
 O4WWRePF7u2iKXHJiAHQYQWhAGcaQAml15PE4tEJb4fb2jYFaj8ay6RUHr42WSMS6r4U
 ESpg==
X-Gm-Message-State: AFqh2kpjsz0YESgNpSlgCJ6xMbNDEzudjerxu/0Fq47VV5Q56ptET00e
 HlqdCZHaO7Ams4ZHHpJ/Ly2hmg==
X-Received: by 2002:a5d:4587:0:b0:27f:a81:b819 with SMTP id
 p7-20020a5d4587000000b0027f0a81b819mr40538188wrq.22.1673427037903; 
 Wed, 11 Jan 2023 00:50:37 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 m10-20020a056000008a00b002683695bf97sm13029515wrx.58.2023.01.11.00.50.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 11 Jan 2023 00:50:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Jan Kiszka <jan.kiszka@web.de>,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 4/5] hw/i2c/bitbang_i2c: Trace state changes
Date: Wed, 11 Jan 2023 09:50:15 +0100
Message-Id: <20230111085016.44551-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230111085016.44551-1-philmd@linaro.org>
References: <20230111085016.44551-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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
X-TUID: f522DhyecqyI

Trace bitbang state machine changes with trace events.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i2c/bitbang_i2c.c | 33 ++++++++++++++++++++++++++++-----
 hw/i2c/trace-events  |  3 +++
 2 files changed, 31 insertions(+), 5 deletions(-)

diff --git a/hw/i2c/bitbang_i2c.c b/hw/i2c/bitbang_i2c.c
index bf4b781393..efc49b7502 100644
--- a/hw/i2c/bitbang_i2c.c
+++ b/hw/i2c/bitbang_i2c.c
@@ -16,6 +16,7 @@
 #include "hw/sysbus.h"
 #include "qemu/module.h"
 #include "qom/object.h"
+#include "trace.h"
 
 //#define DEBUG_BITBANG_I2C
 
@@ -26,15 +27,41 @@ do { printf("bitbang_i2c: " fmt , ## __VA_ARGS__); } while (0)
 #define DPRINTF(fmt, ...) do {} while(0)
 #endif
 
+/* bitbang_i2c_state enum to name */
+static const char * const sname[] = {
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
@@ -73,7 +100,6 @@ int bitbang_i2c_set(bitbang_i2c_interface *i2c, int line, int level)
             return bitbang_i2c_nop(i2c);
         }
         if (level == 0) {
-            DPRINTF("START\n");
             /* START condition.  */
             bitbang_i2c_set_state(i2c, SENDING_BIT7);
             i2c->current_addr = -1;
@@ -122,7 +148,6 @@ int bitbang_i2c_set(bitbang_i2c_interface *i2c, int line, int level)
             /* NACK (either addressing a nonexistent device, or the
              * device we were sending to decided to NACK us).
              */
-            DPRINTF("Got NACK\n");
             bitbang_i2c_set_state(i2c, SENT_NACK);
             bitbang_i2c_enter_stop(i2c);
             return bitbang_i2c_ret(i2c, 1);
@@ -147,11 +172,9 @@ int bitbang_i2c_set(bitbang_i2c_interface *i2c, int line, int level)
 
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

