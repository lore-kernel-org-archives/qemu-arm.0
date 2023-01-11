Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3820654ejc;
        Wed, 11 Jan 2023 00:51:57 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvuPYDbyFYS2GHn0NuntFw9Lm3CFfPr9fnRJN3ipqgXQVfg6qlB4c1LLDWujTEDlpsEa5Of
X-Received: by 2002:ac8:4e23:0:b0:3a6:9f4e:22b5 with SMTP id d3-20020ac84e23000000b003a69f4e22b5mr89249961qtw.20.1673427117731;
        Wed, 11 Jan 2023 00:51:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673427117; cv=none;
        d=google.com; s=arc-20160816;
        b=sUwVgn21/csD+GfeYrSy9ZkQ6794yu5ZZItZ/4/GeFEc5OFj3DBw3+grnqttc+AOpx
         BSHO5ZnAGihubkTYp2GnOfepSiOy1x6rPoSzlV8aBuyQdJnnfnaedKxJGt4pmI1puukp
         6kSXBOB6oAGJQzHkjW74KHFflQOwCd/cQJJ4U9tDi87mAdX0/UF0F0rUNrvYX6R4wHio
         BElXthkn2xWiEoogPOjS4pI86BeVtOZFToHv+ujTjezsGmRmM1xltMxL+svtr5gbD0f2
         UxnEIr0AbHf0lmMcKycF66FSbbRAky8LVwH16hfi9BUtLENaOdEjixP67siAMhPjA3mg
         xiug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=iDnNDu+oMICH4wdH8XoWszonkd1H38BArRChhxQlZUY=;
        b=CkzkT0GGALcmWZNQw8TfCxl9kwJNYmxDWZL3nlYTyyjF3KKi5mnNGXAKXJsk2y990h
         bqt9TS2XvwrhGIyyqZ7QNecQNTQnWeyM1R4NLlqM6VlUWuTpzkmY1sKuBVgU75KlML3l
         pQqkK42wnJ+wrlCcavsgldPJ3LNtuYH0lKU+sIfH5X7zRcCX1VoLhYLSXdYeUgyksIoN
         ZWYUCaMYA2PNDNd5pZfd1lmRma70yZBbMtGvCM6BIlJ2qV9bopVo+AVcZDZ7151ppJw3
         LaHW+xVaaDb3Sl3XPSXkonWdqCCs5o14WeE6FWp/fxZUcNexDy+AqSqYFLS0zWHTiL2W
         HP+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pke7i96a;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y28-20020a37f61c000000b006fc9b17e2bbsi7576910qkj.60.2023.01.11.00.51.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Jan 2023 00:51:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pke7i96a;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFWos-0003Pf-8U; Wed, 11 Jan 2023 03:50:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFWof-0003Gd-7m
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 03:50:38 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFWod-0007e7-5A
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 03:50:36 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so8981328wma.1
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 00:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iDnNDu+oMICH4wdH8XoWszonkd1H38BArRChhxQlZUY=;
 b=pke7i96aicODUbCCMtqiAD2ggXYbBh6JXivqZQnOJcDKrpvoEqSo2zJdwGmIvBl5xg
 yZwHRTWd1YcQeBG+IwX5uOKCEduo52I6In69jv0X3S+YzGAcTVX6D0+Y6dbTU7Ls/ad6
 bpGKkwtYpbh5ye2Mel9659WNHyoPyvd2vAe8xzniRJjNwgIaSltGBiE3KpXY5RDlDjA5
 VY1uw59ca2BZAylmcBhhjm7nP30hl6mqix6EXJu7RvSjUvSro24XUOI1CW0k7mff1ME0
 8rcb7+Im4ceBdlUokHnO+nITYF+LRaqfnoRhvTL+f/HX6yNDRbhZfgyaTg4dMtayr4Ew
 lxeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iDnNDu+oMICH4wdH8XoWszonkd1H38BArRChhxQlZUY=;
 b=mIgS7iGkvehZYr/Or5yNNr9OuQndQjvQTo0A/KtaIsaTDowg0M8n+Yjck2bo0gVEc2
 o5NbGstY1STtZXVRRfktv3cS3wj8T9YbWXJp1vZOt+t5JpMAxnxDs0G9qd6xSW2baTrX
 IWRUmSH92tUqa4xxf92VPIwN2W2z/JOeDCL8z4NRvP4LTKfwCsnsYyLzy553uJ4QleFs
 OllTGq5HkEdJf2u6YTwmi7GfMuOpm3UD7zglNxuOn6G2brica50Y3o3VHztk2a/praJz
 yu3koGxfIwYa2b+8fAxroTuVXKMnIPMoIoVkBXN0ZU1Kn1sfOPqPg+dg8WHIaEU/C3Lx
 ThnQ==
X-Gm-Message-State: AFqh2koGtTt4U072lngFBzUC8olu4gKRYv0sjyL1OV0x946s37PPUq4P
 fO3YCzn5potrhH5fug8Go9VZXhzOumJzEgNw
X-Received: by 2002:a05:600c:1d25:b0:3d3:50b9:b192 with SMTP id
 l37-20020a05600c1d2500b003d350b9b192mr61983619wms.18.1673427033020; 
 Wed, 11 Jan 2023 00:50:33 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 o19-20020a05600c511300b003d9862ec435sm5964179wms.20.2023.01.11.00.50.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 11 Jan 2023 00:50:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Jan Kiszka <jan.kiszka@web.de>,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 3/5] hw/i2c/bitbang_i2c: Change state calling
 bitbang_i2c_set_state() helper
Date: Wed, 11 Jan 2023 09:50:14 +0100
Message-Id: <20230111085016.44551-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230111085016.44551-1-philmd@linaro.org>
References: <20230111085016.44551-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: i58KdoBB+po8

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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

