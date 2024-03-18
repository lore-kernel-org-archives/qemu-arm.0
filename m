Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp573092ejb;
        Mon, 18 Mar 2024 04:33:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVZ7imxwg2KJLlqNczQ6uk+NJFMGm+3bintJXf4iLrxqnoRl0NzuT66SM8A1+zVnLBbob7vWQuZcqinQKREqCta3t2nbCVN
X-Google-Smtp-Source: AGHT+IFhgDjZFOJISIEYI6eNFEe53nZdyWES6pyHg7y26BOVmjyPtJAnJpzrb/7AxYJlo1EAgHaR
X-Received: by 2002:ac8:5a8d:0:b0:42e:f733:669d with SMTP id c13-20020ac85a8d000000b0042ef733669dmr15121059qtc.58.1710761592026;
        Mon, 18 Mar 2024 04:33:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710761592; cv=none;
        d=google.com; s=arc-20160816;
        b=FKzM8s5fmiFFq4OvMdgOa4+tlPTpTuOJNuxzeiAJvtNRxkYlbM1dSctXw8TIM9j/1/
         oOA3tT2jXx6zXHzqdN0XUUZDEG9qaXASIAVjvlS5kGSqmNaj7rs8zob8Y1bpSBHsbYe8
         qmJ4sLFPKC0pwcNJzKnKwZXrKIeAJn72eOsHGv8XeLIBsRc7+3fqEp57MMpoZtVuIA42
         j82YJRO9wZtgD26XyXZ+MlNjo73IOJmt5W9cJTkQ6qBsPIhgRK6f9f/FQMnVWmKTiU8c
         Yz8eJP1IeXlRbE9xhAdix1+eBGz84nQTueZ0R2q3g/QHW2FlczBURHvY88E3vAUXTe0q
         mwng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=awIh3lBTG+gHE0lcYbdt4h6RpA3aL2oraGQ+LIq+QwM=;
        fh=t44Gy1VASiXIoNlkjOUvkv5xpVuiNECntBEg8BIl5b4=;
        b=i8TsFigy0Jxm32Z6P04UstCOGkR/FFBSHWHn5N7Vz0LAxXKAo6ROhHOltXqmvlrrRM
         /DXbQavQq1P02EufNoT+WvkdcGKTtmB600zi3KJEQAQ+YO4RDwajvOPz3RykhaLCvS0g
         vHbgkzS+RtqJx57sTBROGnbhQT6KimVNqk3NJZDUoB7s/j9G3VQEgKs0wOc+u7GgFEYD
         aG2qP6Pi7vs70Mjcy0CiqPjNUN2vhvLmCglly99D2/53MRqkYdmxM48G+6d3sH1+8smz
         QJKCTCs3G6AMCqL896g5z5S9dsr3iVOCchCDJRAN9z1FPKv3PO/hn0L0+ry9mCxandbg
         tWSQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=t6abnBkU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v7-20020a05622a144700b0042eb8d52057si1966045qtx.320.2024.03.18.04.33.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Mar 2024 04:33:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=t6abnBkU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rmBDs-0008HD-R4; Mon, 18 Mar 2024 07:32:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmBDq-0008GE-Nr
 for qemu-arm@nongnu.org; Mon, 18 Mar 2024 07:32:06 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmBDn-000781-8R
 for qemu-arm@nongnu.org; Mon, 18 Mar 2024 07:32:06 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-33ed5b6bf59so1588054f8f.0
 for <qemu-arm@nongnu.org>; Mon, 18 Mar 2024 04:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710761520; x=1711366320; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=awIh3lBTG+gHE0lcYbdt4h6RpA3aL2oraGQ+LIq+QwM=;
 b=t6abnBkU2XUWkGK6POZGY+MO2BQ8GqPy+hx7OVZfjAC0kQNJCFXLmqz0nlhL//8otC
 XVzdFxDO50LZCyHfZLeOXwTwz3NcBfHLhK5KtsxxjmjmPX2z4miJyYcCfFzqx8sKhawy
 V5gduQN5/+FpaMjB1qAVBUEpYKb9D2/c/q0su/C3GQOIPNIvGICUBd5bif8Uffy69w3u
 N1PNxlch6v8Ns0kgr6Ih7PWther1bQdc5VToG7piQ1V4uWgA2WYJwtz9KCk/ENObCjso
 D/QPNf6kDFaMKMp2CcNPxBL0+FuHVcOHlltrtpMnk691vWALI67vl3vhxVbEUF+swwk4
 g95A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710761520; x=1711366320;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=awIh3lBTG+gHE0lcYbdt4h6RpA3aL2oraGQ+LIq+QwM=;
 b=DJTgD1ISdkJWCgHvFntAnwsdC9q4oTSXm3ftT25kAkCJ1n5CrGetc1ztDxXw7N37vA
 yPoYOackmvowp95Gf4ksgaT9GmHWapi5+p3Rgy2C3dUTY3wj/RPbFlSUTOS3a2nrUfPw
 nh4+llWqigxrqRbZ38TctOvFZIt+a4D13DY09SOiuXDm3S2EhMsMm+0n4Ac5Y+KvZRXC
 OlC3F3tKcnW13FWzrTbFVWFtfXlCBuVCQv8H5wsDrHhLZdF2BQ+bIHWN3av8INsq/bgb
 xKzrKhzvo5Mz0Kltd5i0NQV9o72cfptZk6s2whGoo7TzFYZhyuC3mjuwydLCs+BKglBa
 hSIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsZMpFlo0QN2gyKNez28iX92VOJ12U62s8MVpY3kLrEbTw5eu02X7PpTFjouMbqZ9rjSrdq2Mg0pNqKaUtLQJj9T+Z
X-Gm-Message-State: AOJu0YxyplQmjtgMPDSe75H3viSXmuEKfny19Dns9Ug8i7GfWy6dm92F
 tlO0h1fKxwYciCzHvAa/a/ooNTnONCqaCh4+bujfqebY6YlzyrZ+RkXUuWVZ6z4ghiRBguszO3y
 /
X-Received: by 2002:a05:6000:18ce:b0:341:715e:36d6 with SMTP id
 w14-20020a05600018ce00b00341715e36d6mr2144217wrq.34.1710761520731; 
 Mon, 18 Mar 2024 04:32:00 -0700 (PDT)
Received: from m1x-phil.lan (vit94-h02-176-184-29-165.dsl.sta.abo.bbox.fr.
 [176.184.29.165]) by smtp.gmail.com with ESMTPSA id
 y10-20020a5d4aca000000b0033e03d37685sm9617334wrs.55.2024.03.18.04.31.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 18 Mar 2024 04:32:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.1 v2 3/3] ui/console: Add 'rotate_arcdegree' field to
 allow per-console rotation
Date: Mon, 18 Mar 2024 12:31:40 +0100
Message-ID: <20240318113140.88151-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240318113140.88151-1-philmd@linaro.org>
References: <20240318113140.88151-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: D7YZX9Kcjxdk

Add the 'rotate_arcdegree' field to QemuGraphicConsole and
remove the use of the 'graphic_rotate' global.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 ui/console.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/ui/console.c b/ui/console.c
index 84aee76846..94624c37ae 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -37,7 +37,6 @@
 #include "trace.h"
 #include "exec/memory.h"
 #include "qom/object.h"
-#include "sysemu/sysemu.h"
 
 #include "console-priv.h"
 
@@ -51,6 +50,8 @@ typedef struct QemuGraphicConsole {
 
     QEMUCursor *cursor;
     int cursor_x, cursor_y, cursor_on;
+
+    unsigned rotate_arcdegree;
 } QemuGraphicConsole;
 
 typedef QemuConsoleClass QemuGraphicConsoleClass;
@@ -210,17 +211,23 @@ void qemu_console_set_window_id(QemuConsole *con, int window_id)
 
 void qemu_console_set_rotate(QemuConsole *con, unsigned arcdegree)
 {
-    graphic_rotate = arcdegree;
+    QemuGraphicConsole *gc = QEMU_GRAPHIC_CONSOLE(con);
+
+    gc->rotate_arcdegree = arcdegree;
 }
 
 bool qemu_console_is_rotated(QemuConsole *con)
 {
-    return graphic_rotate != 0;
+    QemuGraphicConsole *gc = QEMU_GRAPHIC_CONSOLE(con);
+
+    return gc->rotate_arcdegree != 0;
 }
 
 unsigned qemu_console_get_rotate_arcdegree(QemuConsole *con)
 {
-    return graphic_rotate;
+    QemuGraphicConsole *gc = QEMU_GRAPHIC_CONSOLE(con);
+
+    return gc->rotate_arcdegree;
 }
 
 void graphic_hw_invalidate(QemuConsole *con)
-- 
2.41.0

