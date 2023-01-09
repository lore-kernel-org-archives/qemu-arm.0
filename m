Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2091298ejc;
        Mon, 9 Jan 2023 00:46:31 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt7Y1VyIyruOiqpgVx886YWPLu+BB+KIIaLW8P/QXGF/Y1RSzki29HOVaLenYuNXhIR6plD
X-Received: by 2002:a05:6214:330e:b0:532:1250:9bb7 with SMTP id mo14-20020a056214330e00b0053212509bb7mr21490252qvb.34.1673253991704;
        Mon, 09 Jan 2023 00:46:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673253991; cv=none;
        d=google.com; s=arc-20160816;
        b=tFar7toOareAnCTkr7VeyAyFDaT2jTAAYR6eI+UzMLUq0ugNTaR+O3W40oP0C6na4p
         ZOUtqCT9/DzyYkeLeT21hkSbiuz1vEceXBeJJzXnEfkYcrcHkc0WaJxuX2d+7b8htSX0
         qGJ8qnUgp9OhJtNPBkRl+Q5Eb6brchQkYLS5DHNZMrUPslg83Ju5kMhOn8pVnJcoZZAe
         nT5L+oyGF5+VI1FnJodMVLnm88y3vrDVknuytdUPk5NTiOSFMVoVE3NtbW0KfWZlevqW
         CUaxY4OPlShFRkz2WxvHxIB+bdI20draXhQysZmW8hlkMXudN6LPWjGjXP0T7SxCcE20
         AFjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=mW/xOcmu0qY6WycKJ96K7bzJF3hE191cAtI16SbiYiY=;
        b=GnXqrdYCXjI/yQCWXJKMa4AR/4bEuoo4k5SsPQjsXdfTQyGBq/okOtRhQFRCas3pER
         7cdwSYsfQK7XBW8JdBrvF9V8LFm0IhTGjiOwBC9J5poSBv/1TEl2Fexf2qoACPadBcoi
         HeMF55yiexdL60pj83Ojvs+zFlxVH6JMv+uE4hrTDO7lpZhjhMODDTekcdZSvN9/UbGh
         QOWrl1cYjlHRNp4KW1Wt0EZ84nEdIN96Tm+fBbxy+Dgdb04dnRiIiAXLykRyZ+YzNAX2
         6W69SgWKQMTu42rBPqopNmeGh3wu0K4zIp4czwCz2zfexBxVxTAKFH+sU1oYT+JGWWHO
         5kZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bin2DoOy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o3-20020a05620a2a0300b006f728fb70f3si4624099qkp.500.2023.01.09.00.46.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jan 2023 00:46:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bin2DoOy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pEnix-0005kU-3m; Mon, 09 Jan 2023 03:41:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEniu-0005hy-R0
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 03:41:40 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEnit-0002C8-3a
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 03:41:40 -0500
Received: by mail-wm1-x32e.google.com with SMTP id g10so5705403wmo.1
 for <qemu-arm@nongnu.org>; Mon, 09 Jan 2023 00:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mW/xOcmu0qY6WycKJ96K7bzJF3hE191cAtI16SbiYiY=;
 b=bin2DoOyGNeYdFHOhQHvOFswCq6sz0R8SGKtIo26F6R9oMwJ9a/0JuuPi/BtpqD25G
 n+fkpJ5Js/Cnax6qKNnzKJZZDkB7D6UfZXXahdNXD29XvRMev0Ljyiv5Bvpep6L5KHva
 Upw/te0XC1WcTZPL+SLKac1t4IUbsMf2ttkIQfjNBGz5XhtSQobkDnZl7HznJEug3jXc
 LMvU3BFn9hJb36clU2LtV5CMSHEa0OVMdgXHQ9DC+GT+nVSgEXtPfRXPYZGKrvYmjvCx
 OZCON9QvIzl/xh2eXqD+HuWBYTUOVUF/JEL3IRchgRkR1xgWzJPA0vM3kARKJI9yFRFi
 n46w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mW/xOcmu0qY6WycKJ96K7bzJF3hE191cAtI16SbiYiY=;
 b=l/OeAQYVMd4npf60n4sc2ryoKr5tqkFpzEn9Iu9T3vMIII2DSMPIT6z0F03rzz+SR6
 aDgdHDxiBWD4TqYoU9dTeAuRmSMjgew3Oqu0mqsX6s/vDRWJ9+KahYy25JITJW40lGjk
 IsSyXCob2y4qMQpTUCWllSToO2l1BMIB6t0sf7iCuUebD+J16Q9wcR7OmCBPLhvZx4t5
 dUcIfpooQRb6C+XUgenWUxIkImpjSnUDx6+Bo3yfeC1LXhk3Y7ewwbkxzSgegcxZxlom
 iekbHsieJst5ydZVEFI8zVezscUjIXu0J9yJoa/1zDdq2bfVJFz9tNQZQzdGUGJncKVh
 RZKA==
X-Gm-Message-State: AFqh2kqe13oIvQRWt75k3k5IzEzYSBo/VvmIIb2HpOPaV6Me0dCC54ve
 AV5H6wkeXi5CfkSwuoYvVDmPAw==
X-Received: by 2002:a05:600c:44c9:b0:3d1:f6b3:2ce3 with SMTP id
 f9-20020a05600c44c900b003d1f6b32ce3mr55081306wmo.35.1673253697877; 
 Mon, 09 Jan 2023 00:41:37 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 i14-20020a05600c354e00b003d1d5a83b2esm16588329wmq.35.2023.01.09.00.41.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 00:41:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, qemu-trivial@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 3/5] hw/i2c/bitbang_i2c: Change state calling
 bitbang_i2c_set_state() helper
Date: Mon,  9 Jan 2023 09:41:19 +0100
Message-Id: <20230109084121.72138-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109084121.72138-1-philmd@linaro.org>
References: <20230109084121.72138-1-philmd@linaro.org>
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
X-TUID: ri7plvNV8SIn

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i2c/bitbang_i2c.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/hw/i2c/bitbang_i2c.c b/hw/i2c/bitbang_i2c.c
index e41cb63daa..bf4b781393 100644
--- a/hw/i2c/bitbang_i2c.c
+++ b/hw/i2c/bitbang_i2c.c
@@ -26,13 +26,19 @@ do { printf("bitbang_i2c: " fmt , ## __VA_ARGS__); } while (0)
 #define DPRINTF(fmt, ...) do {} while(0)
 #endif
 
+static void bitbang_i2c_set_state(bitbang_i2c_interface *i2c,
+                                  bitbang_i2c_state state)
+{
+    i2c->state = state;
+}
+
 static void bitbang_i2c_enter_stop(bitbang_i2c_interface *i2c)
 {
     DPRINTF("STOP\n");
     if (i2c->current_addr >= 0)
         i2c_end_transfer(i2c->bus);
     i2c->current_addr = -1;
-    i2c->state = STOPPED;
+    bitbang_i2c_set_state(i2c, STOPPED);
 }
 
 /* Set device data pin.  */
@@ -69,7 +75,7 @@ int bitbang_i2c_set(bitbang_i2c_interface *i2c, int line, int level)
         if (level == 0) {
             DPRINTF("START\n");
             /* START condition.  */
-            i2c->state = SENDING_BIT7;
+            bitbang_i2c_set_state(i2c, SENDING_BIT7);
             i2c->current_addr = -1;
         } else {
             /* STOP condition.  */
@@ -96,7 +102,7 @@ int bitbang_i2c_set(bitbang_i2c_interface *i2c, int line, int level)
     case SENDING_BIT7 ... SENDING_BIT0:
         i2c->buffer = (i2c->buffer << 1) | data;
         /* will end up in WAITING_FOR_ACK */
-        i2c->state++; 
+        bitbang_i2c_set_state(i2c, i2c->state + 1);
         return bitbang_i2c_ret(i2c, 1);
 
     case WAITING_FOR_ACK:
@@ -117,13 +123,14 @@ int bitbang_i2c_set(bitbang_i2c_interface *i2c, int line, int level)
              * device we were sending to decided to NACK us).
              */
             DPRINTF("Got NACK\n");
+            bitbang_i2c_set_state(i2c, SENT_NACK);
             bitbang_i2c_enter_stop(i2c);
             return bitbang_i2c_ret(i2c, 1);
         }
         if (i2c->current_addr & 1) {
-            i2c->state = RECEIVING_BIT7;
+            bitbang_i2c_set_state(i2c, RECEIVING_BIT7);
         } else {
-            i2c->state = SENDING_BIT7;
+            bitbang_i2c_set_state(i2c, SENDING_BIT7);
         }
         return bitbang_i2c_ret(i2c, 0);
     }
@@ -134,18 +141,18 @@ int bitbang_i2c_set(bitbang_i2c_interface *i2c, int line, int level)
     case RECEIVING_BIT6 ... RECEIVING_BIT0:
         data = i2c->buffer >> 7;
         /* will end up in SENDING_ACK */
-        i2c->state++;
+        bitbang_i2c_set_state(i2c, i2c->state + 1);
         i2c->buffer <<= 1;
         return bitbang_i2c_ret(i2c, data);
 
     case SENDING_ACK:
-        i2c->state = RECEIVING_BIT7;
         if (data != 0) {
             DPRINTF("NACKED\n");
-            i2c->state = SENT_NACK;
+            bitbang_i2c_set_state(i2c, SENT_NACK);
             i2c_nack(i2c->bus);
         } else {
             DPRINTF("ACKED\n");
+            bitbang_i2c_set_state(i2c, RECEIVING_BIT7);
         }
         return bitbang_i2c_ret(i2c, 1);
     }
-- 
2.38.1

