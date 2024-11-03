Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp1587299njc;
        Sun, 3 Nov 2024 06:35:14 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWwkp0qkBBaYEj7tdTdDaYeRK20NihXK5IQU4GfulKqOd/pvVZ02X0D83hSJ5KBYJGfthiovUJ8kZO2UA==@linaro.org
X-Google-Smtp-Source: AGHT+IEsIz3sH5uhMbf+A1MiUFy0HTbGpa5WblMY39ofAxispcooJvFQX5vDyrfAcXBMJiX7TcAR
X-Received: by 2002:a05:620a:c44:b0:7b1:7838:9423 with SMTP id af79cd13be357-7b2fb9bfd58mr1425103085a.64.1730644514718;
        Sun, 03 Nov 2024 06:35:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730644514; cv=none;
        d=google.com; s=arc-20240605;
        b=ZdLb85qDakgdZ2wk8XjIB9jO0bhazTnsLgPjYnKSMy9hHagBpMDMBoG0D6d9TMbabA
         arrD4/9oe4D0CINamUc0bkJoFGyupdBmT+JIe5hsrnCO1nyy80CkSaaeuYF+lmPUO0L7
         MmUvi7sm3IHsf7hpTTSRqpJD9mEzpCjwDRW4x12mi6V8iaIbMS3t4QG5mIPc2nVY+07t
         G5dbKdBGWp1ffcnKN62X0Q3KfHBTXFvP8EAtLP56O7tuX4U0/Rl+qnKejnvVI0gCJawv
         05m8heeTNzRo6rA5AYznSavkulhO/inptk1MxSpC3SDW5Btm6t7pO//eLWcduYo7O9vn
         9pMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=MK2+7m6Ph4dw8VXtBR6y8ZzWbe55VMIAgVQqAY/2DDs=;
        fh=HWZPk7hiIPOuKGBLJWaUwme2ypL/Q0J619b1v51dqKA=;
        b=gJsphfP1LC1NTaIxMbWFjt6EkkH4UevSu1JPJUDfPNh0zWZef83GPuwAFyLCdggLaj
         qD396SgLfEQigUt4mZcLF8+FapIC71kXT5Bz0b0voq/pqCTXXcq3cRbibUVWDwFy9vzQ
         FY17ryLdQPmIGF+Sih6cI9jPIfDQ+jtrXUmkx2zGrLc+o08CyGYsVStccsVuSYVySrP5
         G/2vq/dxApU0wyiqcwMveYjISnnMJ2h9BQDX/nXYDXVqDcxmdJGJwHnCBbvzjq6uTg0P
         PhbaSkVr8F/Ewr7lVpH+81oIyKbjHYwgN4KGzhEXOeUZdDj4BzF7d6tzXDgey+gPpeLn
         RgSQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="A/oZD2xn";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d35416e965si86280796d6.304.2024.11.03.06.35.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Nov 2024 06:35:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="A/oZD2xn";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t7bgZ-0000Tp-8g; Sun, 03 Nov 2024 09:34:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1t7bgX-0000Sf-B7; Sun, 03 Nov 2024 09:34:33 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1t7bgV-0001xQ-OH; Sun, 03 Nov 2024 09:34:33 -0500
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5c9362c26d8so6801802a12.1; 
 Sun, 03 Nov 2024 06:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730644469; x=1731249269; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MK2+7m6Ph4dw8VXtBR6y8ZzWbe55VMIAgVQqAY/2DDs=;
 b=A/oZD2xnXvZWnBIlJOKm/F0v3nXWpuxdrSpA+hiDUCILYJ69LTc7LpALGLv9f0TpNb
 6EiFG7S/tgWLdSVnyJwiKHcikFxvpYQutqV9zngn5kafhJYlaMol9vw7OXticm2W4RXP
 +dfyA5BNlzjx0Wk7xuOg/isxR2xL3wJA5VyFEV4BUhRR8I2fjkGEeXkuDdPQcsFe2AtY
 u5+QsGGC2f7hrf5m03BYUNuW0rC2A3sQJKHyoxYhAvnjwM1K3XjvIgeCirREkLB1IxJo
 ZjrnU0ZM/3GKBw1g4DzE5/6HVTsfT0H5Ey2WWGCIAOiu/v+ntLHrscliVnVJF9lkNdHc
 6fag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730644469; x=1731249269;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MK2+7m6Ph4dw8VXtBR6y8ZzWbe55VMIAgVQqAY/2DDs=;
 b=OD/2BWU9XhP5FZMwR7lfA4jo2p2svSLKHuTwZ4Req1xq+ucUI+mRhup6DkORKctsqQ
 aenQduwHeB3BmhOMj5NXAGsbiwdcW2yoAW2ViCgVfPWr+B3e3Cp/f3JVQZs9j6w6ZH7E
 /W3FWSu6nAnwVrPedjWQf/C5oX72ctP/4Nqye69wPFcHvgrSd7b40vuIWs1DSuRQLkbm
 FRfNMtHeP/mtx8KVFiKv3dp0Gr6prqFazh1BVJNu6sig45ESr3yNb4s0PacSM3nFGdcm
 9sBBozRg6Kuv+bNpg+wY5Ol6ReD2yhcWxm/qp0DSLh3urHenmF+MyZrYrqN5tAZoDHpb
 sc2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWz31zIO1CDwdjVhnXPG4tTgPzu38HPEhYVFLUT0Ja7I/E7k2/csO8fYib5JslIRagl1/WJOMrVFg==@nongnu.org,
 AJvYcCX08g4c/V4yvi/L/3ucRwR0zdfA3oRiHWi5Mwxy/5tv3tTiHP4OKIR5noqo6c5Fw5lVrjXaQQ6lfeDK+L3P@nongnu.org
X-Gm-Message-State: AOJu0YxpJGgNI+4FLoTIqQPmW+N9yYTMuLjKY9AdY5ZBLPnEemOWtXHC
 NWVfb1yOP/8N2YUU5iJQwqOqfIB35Yn3thJbcKcUdcyoc8XbaJLv0DSS0Q==
X-Received: by 2002:a05:6402:1e8a:b0:5ce:caa1:ca55 with SMTP id
 4fb4d7f45d1cf-5cecaa1cda1mr4871181a12.1.1730644469044; 
 Sun, 03 Nov 2024 06:34:29 -0800 (PST)
Received: from archlinux.. (pd9ed7f6d.dip0.t-ipconnect.de. [217.237.127.109])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ceac74c667sm3350723a12.20.2024.11.03.06.34.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Nov 2024 06:34:28 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 4/4] hw/sensor/tmp105: Convert printf() to trace event,
 add tracing for read/write access
Date: Sun,  3 Nov 2024 15:33:30 +0100
Message-ID: <20241103143330.123596-5-shentey@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241103143330.123596-1-shentey@gmail.com>
References: <20241103143330.123596-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-TUID: X0Jk0iaH4zBL

printf() unconditionally prints to the console which disturbs `-serial stdio`.
Fix that by converting into a trace event. While at it, add some tracing for
read and write access.

Fixes: 7e7c5e4c1ba5 "Nokia N800 machine support (ARM)."
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 meson.build            | 1 +
 hw/sensor/trace.h      | 1 +
 hw/sensor/tmp105.c     | 7 ++++++-
 hw/sensor/trace-events | 6 ++++++
 4 files changed, 14 insertions(+), 1 deletion(-)
 create mode 100644 hw/sensor/trace.h
 create mode 100644 hw/sensor/trace-events

diff --git a/meson.build b/meson.build
index 2c9086a3fe..19df8d7125 100644
--- a/meson.build
+++ b/meson.build
@@ -3476,6 +3476,7 @@ if have_system
     'hw/s390x',
     'hw/scsi',
     'hw/sd',
+    'hw/sensor',
     'hw/sh4',
     'hw/sparc',
     'hw/sparc64',
diff --git a/hw/sensor/trace.h b/hw/sensor/trace.h
new file mode 100644
index 0000000000..e4721560b0
--- /dev/null
+++ b/hw/sensor/trace.h
@@ -0,0 +1 @@
+#include "trace/trace-hw_sensor.h"
diff --git a/hw/sensor/tmp105.c b/hw/sensor/tmp105.c
index 9d7b911f59..ef2824f3e1 100644
--- a/hw/sensor/tmp105.c
+++ b/hw/sensor/tmp105.c
@@ -27,6 +27,7 @@
 #include "qapi/visitor.h"
 #include "qemu/module.h"
 #include "hw/registerfields.h"
+#include "trace.h"
 
 FIELD(CONFIG, SHUTDOWN_MODE,        0, 1)
 FIELD(CONFIG, THERMOSTAT_MODE,      1, 1)
@@ -150,17 +151,21 @@ static void tmp105_read(TMP105State *s)
         s->buf[s->len++] = ((uint16_t) s->limit[1]) >> 0;
         break;
     }
+
+    trace_tmp105_read(s->i2c.address, s->pointer);
 }
 
 static void tmp105_write(TMP105State *s)
 {
+    trace_tmp105_write(s->i2c.address, s->pointer);
+
     switch (s->pointer & 3) {
     case TMP105_REG_TEMPERATURE:
         break;
 
     case TMP105_REG_CONFIG:
         if (FIELD_EX8(s->buf[0] & ~s->config, CONFIG, SHUTDOWN_MODE)) {
-            printf("%s: TMP105 shutdown\n", __func__);
+            trace_tmp105_write_shutdown(s->i2c.address);
         }
         s->config = FIELD_DP8(s->buf[0], CONFIG, ONE_SHOT, 0);
         s->faults = tmp105_faultq[FIELD_EX8(s->config, CONFIG, FAULT_QUEUE)];
diff --git a/hw/sensor/trace-events b/hw/sensor/trace-events
new file mode 100644
index 0000000000..a3fe54fa6d
--- /dev/null
+++ b/hw/sensor/trace-events
@@ -0,0 +1,6 @@
+# See docs/devel/tracing.rst for syntax documentation.
+
+# tmp105.c
+tmp105_read(uint8_t dev, uint8_t addr) "device: 0x%02x, addr: 0x%02x"
+tmp105_write(uint8_t dev, uint8_t addr) "device: 0x%02x, addr 0x%02x"
+tmp105_write_shutdown(uint8_t dev) "device: 0x%02x"
-- 
2.47.0

