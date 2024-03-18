Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp532724ejb;
        Mon, 18 Mar 2024 03:06:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW21te3eAIjbPgg2KhhBTXNtc796/QG1huHT15re93FWNjPccsVj3dTnJly/atd0YhQM+vydPpm/GW646GnI9D0ZnPz+PLF
X-Google-Smtp-Source: AGHT+IEqwDGRGsm9VX6wjIksAQPQP6fja7XQICBF70l9C62OViAwYGbefspxCBzmUQSE8LLdGB/k
X-Received: by 2002:a05:690c:6f0c:b0:610:42ee:4deb with SMTP id jd12-20020a05690c6f0c00b0061042ee4debmr7462321ywb.5.1710756403310;
        Mon, 18 Mar 2024 03:06:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710756403; cv=none;
        d=google.com; s=arc-20160816;
        b=zaZZcaiNef2PCy2mPaXY79uwcaOcYUh4wBeqX93OSk/yVInKCuAZu+cnb84dMg1Vw7
         W9NOpwF5TdvB38INGjCb8FKPOw37wQV3EPzlyslZUglq/8Tz47fozpgI0e8nCfJmdMeu
         kluOBARSX11MkL4QrgWrcCg0cknDJSTiUxZTBg1CUnQ7CM5pp2li0Iqsq3UCqHBynwk4
         VqTrAA9vzHzvVl6tKMK3luvAMe/fML3WhbYa+3oQR9bz7yGTAh92DtXCazyh9SEHEy/m
         IrK9VDk5tZi0SaFFuv9gcTSOn7Wv6v7MNQneQfsHQAi2R2m8qZEQmpKdXfSUQ8GuFG7b
         qpFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=CYjr201DlEJ4l0jHNZURE4npfEFxYjcehCBVscFCuRE=;
        fh=2yFnOS6u3N27e/xD6y32Nd+ElgP8H2BQS9ByllTuMms=;
        b=Jx30XebMp+PFlqFDrvyA/fHwFNJzZpaXrdy1p5UthkQtRo7T05MZxkik65qMzm4yS/
         n5MZfiUlRG5UP0G6Gnv+xylJichYuKZ3iN6yO04EbP5lz0pqAOgSqosuWy9QcInumW1o
         MaTznSI8ukrEM9X9dBDVCgocx1ATcg47Weyxo9HpY6ruMQH7ES6tpnIzeUswMunLCm+n
         kNYb3uwxwErSQ8ZIMQwZ2o78cuRMQRo50DZ8tHznY0OfC5pM/J+0ArEORBiy2kypfTfS
         VuAStz1zFzTRcgGeu6NvNdrzj/dzodgRZYNNO+hroRp8k08stZWVbqDtkG6xmnVNh6C5
         UgOA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wED3Wv2F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d2-20020a05622a15c200b0042f4b9112f8si1939386qty.300.2024.03.18.03.06.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Mar 2024 03:06:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wED3Wv2F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rm9sa-0001GG-22; Mon, 18 Mar 2024 06:06:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rm9sS-0001F5-LN
 for qemu-arm@nongnu.org; Mon, 18 Mar 2024 06:05:59 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rm9sQ-00060v-Sj
 for qemu-arm@nongnu.org; Mon, 18 Mar 2024 06:05:56 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4140aadfe2eso9370155e9.1
 for <qemu-arm@nongnu.org>; Mon, 18 Mar 2024 03:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710756351; x=1711361151; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CYjr201DlEJ4l0jHNZURE4npfEFxYjcehCBVscFCuRE=;
 b=wED3Wv2Fg9AZfwtxDpYxlZSx5DRIp75AHQxbYjEkPKDCfEeNXfConYrbtOcQbfOW0w
 g0GYBZZe39zE9q2pvf9Z1bYzFZOhcZl715y+4ONbgobnmnBGs2Noa97RXIlvVn0omz7s
 2pg4kxDRnjhkOVA119JmSZfSEREHeiZHN2P7QHw+w70/Sdup3F5M/N+z9doi85yEFG7X
 FeoZJqJ+/CZ3eKQjQ4nwR382dFWaw7YW9pVq+vPmi72JbvIHyqh8fM+yVPdb8XzBQk5h
 Ukw+O+ByrFIJ6eYxhoC4nFpEdgDBeK5YaAOY0yStgm4GfvKBVNsZJb47AGNz4xCJwF+n
 FV+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710756351; x=1711361151;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CYjr201DlEJ4l0jHNZURE4npfEFxYjcehCBVscFCuRE=;
 b=YHWxLq7sMNs2dRlE0Xr9MIhqeJ7vyV2Cptu1BE64Cka1l+CKy1Psy2FpnFTV3aMTd0
 l9DkKznDd0Y66PMtE+QM7gf8IEajskcYwFziYRhdcy4Ts+1iHOpY5yEk1kQ+rJ9tTufI
 IJQMGoW1cG17fL4SKGyAQEAkjpiunWCwzNMSy2rCXslh+gY+nExkov7hGZjqBajYNuxa
 QQX/gv3j7ts3oz+M0OoMkT/Tpt4YLY+9+LIB75itfbsr6MVcqPvCRUnPTTHxfRS1FHwu
 4UYcEhoDs5H8XWW3T+mQnET5NHUWqpelyZ3Id9GlfSL8ch5z36KGqwDu/y+SCqsP+SEr
 ybhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeUJaaE+4jwNly2d/FJR/2ZSyMMM56k+qQnY7YITmiinRt9oUCieQUxw9gqdNZLaz8KMNHYOGopiY2fpiL66xEpErQ
X-Gm-Message-State: AOJu0Yxdoek3XDOptUWgCYNNTdOZqeGe3DgNRbeBDUDcaJgbZ6eKnkxE
 DRyXtF58FGC4fVKJ9eTDYzOazo/xjA4d+JwCSrHTcoz3v9bIAg5BZDtShN34W4oqLUtbruW7bR2
 5roE=
X-Received: by 2002:a05:600c:198a:b0:414:860:bdc5 with SMTP id
 t10-20020a05600c198a00b004140860bdc5mr3998787wmq.17.1710756351440; 
 Mon, 18 Mar 2024 03:05:51 -0700 (PDT)
Received: from m1x-phil.lan (vit94-h02-176-184-29-165.dsl.sta.abo.bbox.fr.
 [176.184.29.165]) by smtp.gmail.com with ESMTPSA id
 hg12-20020a05600c538c00b004140f81e513sm3398470wmb.37.2024.03.18.03.05.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 18 Mar 2024 03:05:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.1 1/3] ui/console: Introduce API to change console
 orientation
Date: Mon, 18 Mar 2024 11:05:40 +0100
Message-ID: <20240318100543.78846-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240318100543.78846-1-philmd@linaro.org>
References: <20240318100543.78846-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: CmArehBxqDfT

Extract the following methods:

  - qemu_console_set_rotate()
  - qemu_console_is_rotated()
  - qemu_console_get_rotate_arcdegree()

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/ui/console.h |  3 +++
 ui/console.c         | 16 ++++++++++++++++
 ui/input.c           |  9 ++++-----
 3 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/include/ui/console.h b/include/ui/console.h
index a4a49ffc64..86ba36e391 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -422,15 +422,18 @@ bool qemu_console_is_visible(QemuConsole *con);
 bool qemu_console_is_graphic(QemuConsole *con);
 bool qemu_console_is_fixedsize(QemuConsole *con);
 bool qemu_console_is_gl_blocked(QemuConsole *con);
+bool qemu_console_is_rotated(QemuConsole *con);
 char *qemu_console_get_label(QemuConsole *con);
 int qemu_console_get_index(QemuConsole *con);
 uint32_t qemu_console_get_head(QemuConsole *con);
 int qemu_console_get_width(QemuConsole *con, int fallback);
 int qemu_console_get_height(QemuConsole *con, int fallback);
+unsigned qemu_console_get_rotate_arcdegree(QemuConsole *con);
 /* Return the low-level window id for the console */
 int qemu_console_get_window_id(QemuConsole *con);
 /* Set the low-level window id for the console */
 void qemu_console_set_window_id(QemuConsole *con, int window_id);
+void qemu_console_set_rotate(QemuConsole *con, unsigned arcdegree);
 
 void console_select(unsigned int index);
 void qemu_console_resize(QemuConsole *con, int width, int height);
diff --git a/ui/console.c b/ui/console.c
index 832055675c..84aee76846 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -37,6 +37,7 @@
 #include "trace.h"
 #include "exec/memory.h"
 #include "qom/object.h"
+#include "sysemu/sysemu.h"
 
 #include "console-priv.h"
 
@@ -207,6 +208,21 @@ void qemu_console_set_window_id(QemuConsole *con, int window_id)
     con->window_id = window_id;
 }
 
+void qemu_console_set_rotate(QemuConsole *con, unsigned arcdegree)
+{
+    graphic_rotate = arcdegree;
+}
+
+bool qemu_console_is_rotated(QemuConsole *con)
+{
+    return graphic_rotate != 0;
+}
+
+unsigned qemu_console_get_rotate_arcdegree(QemuConsole *con)
+{
+    return graphic_rotate;
+}
+
 void graphic_hw_invalidate(QemuConsole *con)
 {
     if (!con) {
diff --git a/ui/input.c b/ui/input.c
index dc745860f4..951806bf05 100644
--- a/ui/input.c
+++ b/ui/input.c
@@ -1,5 +1,4 @@
 #include "qemu/osdep.h"
-#include "sysemu/sysemu.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-ui.h"
 #include "trace.h"
@@ -179,10 +178,10 @@ static int qemu_input_transform_invert_abs_value(int value)
   return (int64_t)INPUT_EVENT_ABS_MAX - value + INPUT_EVENT_ABS_MIN;
 }
 
-static void qemu_input_transform_abs_rotate(InputEvent *evt)
+static void qemu_input_transform_abs_rotate(QemuConsole *src, InputEvent *evt)
 {
     InputMoveEvent *move = evt->u.abs.data;
-    switch (graphic_rotate) {
+    switch (qemu_console_get_rotate_arcdegree(src)) {
     case 90:
         if (move->axis == INPUT_AXIS_X) {
             move->axis = INPUT_AXIS_Y;
@@ -341,8 +340,8 @@ void qemu_input_event_send_impl(QemuConsole *src, InputEvent *evt)
     qemu_input_event_trace(src, evt);
 
     /* pre processing */
-    if (graphic_rotate && (evt->type == INPUT_EVENT_KIND_ABS)) {
-            qemu_input_transform_abs_rotate(evt);
+    if (qemu_console_is_rotated(src) && (evt->type == INPUT_EVENT_KIND_ABS)) {
+        qemu_input_transform_abs_rotate(src, evt);
     }
 
     /* send event */
-- 
2.41.0

