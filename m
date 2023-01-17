Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2784458ejc;
        Tue, 17 Jan 2023 14:06:30 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvtFYYlLXbJja5MOBgWhfldotz9yEXlL3qTZtWzh3jLtGE24Z5kYo41VUPzE67TMdglDwzM
X-Received: by 2002:ac8:6f09:0:b0:3b6:35b2:5803 with SMTP id bs9-20020ac86f09000000b003b635b25803mr6794248qtb.17.1673993190792;
        Tue, 17 Jan 2023 14:06:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673993190; cv=none;
        d=google.com; s=arc-20160816;
        b=Xhl6p6YUSZjCggJvDiR3WsZv5OkvI6fptAX3DhiAfx0/YN5gzz5tALd6KykmBI/QG9
         KwHPIKLq50cRSFNM7EzbzLBGat/+1jLFSTCQpQVFT1HhWd/TkGLtURPoDZWULHIgT0U2
         IGsyaKKZy9JwdOLIvdEeLB5g9EIEbCReMxTtZdwHOc3/RCg/tNCfNnudrGeqJdR6r6qd
         rXZHIYlA1kBQsAj791wPGK9qv8r5LMooDCuIT9P2gF7HNwv/vNeFzSJN5pYPRk/GY5Mn
         LxaDeOf0nizcAMEQd26zN88tpIPAfOViPnmHuKKUJmY6yjbQoayTF2lE31rtgVUH6rzR
         3upw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature:dkim-filter;
        bh=yXi+mt++/YFlHhcyEovyhSOK0vSYyDtMhazv/ZJw/O0=;
        b=UKM3b1yzlGXzRBxZJIqUgXtrk4EKb9maAV/RJhVotvWmNcJIDnu5yyRrcd9AgyeJgT
         M+7z5gK4BHf2+m1JYiUX+/Lnasj4/YKldyRo4au68ybxzcz/yj2V8ChrXT3ebVfw4/r8
         aMJ5F/CNiDH/B+9mNSjfc7JQfbP6PmPTCJI8ldUoYIBLmeYr+C4OUej8vV7U3H06pTkV
         hQj5CZPmA4AteF51lG+iloR/W8lWgmooXFNNdfISmDzndpVlUSy723ez/UwNgsp5i1dz
         15nAIsFXiEUKec45eKGOMvmUxs58CHAWElmM6D7YXpxqQdBn+e2Uv2wwqHQj82eUTuMQ
         v5gA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linux.microsoft.com header.s=default header.b=Yf5mtcSj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r15-20020ac867cf000000b003adaead7c33si1749984qtp.727.2023.01.17.14.06.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Jan 2023 14:06:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linux.microsoft.com header.s=default header.b=Yf5mtcSj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pHu5N-0003eB-6w; Tue, 17 Jan 2023 17:05:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pHu5J-0003d2-3w; Tue, 17 Jan 2023 17:05:40 -0500
Received: from linux.microsoft.com ([13.77.154.182])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pHu5G-0006rS-3o; Tue, 17 Jan 2023 17:05:35 -0500
Received: from localhost.localdomain (unknown [77.64.253.186])
 by linux.microsoft.com (Postfix) with ESMTPSA id A266220E09E4;
 Tue, 17 Jan 2023 14:05:31 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com A266220E09E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1673993132;
 bh=yXi+mt++/YFlHhcyEovyhSOK0vSYyDtMhazv/ZJw/O0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Yf5mtcSjvn1CL0SvzOuDPtoTJ2Ku8NIeEi+v5VWtizzA3RLTQopUIG/P6X2mq6BmV
 njetrVVF2OF4EO+eFnXuDTx6iZ/RLm2aOWHVFANkv4ASQyRhAUDAJN0RWViqTQlIOV
 BGIG8wvqDqQxYGP4cDsXIoCjMAJAu48WDmxb/h/Q=
From: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v2 2/4] hw/char/pl011: implement a reset method
Date: Tue, 17 Jan 2023 23:05:21 +0100
Message-Id: <20230117220523.20911-3-eiakovlev@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230117220523.20911-1-eiakovlev@linux.microsoft.com>
References: <20230117220523.20911-1-eiakovlev@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=13.77.154.182;
 envelope-from=eiakovlev@linux.microsoft.com; helo=linux.microsoft.com
X-Spam_score_int: -197
X-Spam_score: -19.8
X-Spam_bar: -------------------
X-Spam_report: (-19.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: s/tQjVKKZ2d6

PL011 currently lacks a reset method. Implement it.

Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
---
 hw/char/pl011.c | 31 ++++++++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 329cc6926d..404d52a3b8 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -397,11 +397,6 @@ static void pl011_init(Object *obj)
     s->clk = qdev_init_clock_in(DEVICE(obj), "clk", pl011_clock_update, s,
                                 ClockUpdate);
 
-    s->read_trigger = 1;
-    s->ifl = 0x12;
-    s->cr = 0x300;
-    s->flags = 0x90;
-
     s->id = pl011_id_arm;
 }
 
@@ -413,11 +408,37 @@ static void pl011_realize(DeviceState *dev, Error **errp)
                              pl011_event, NULL, s, NULL, true);
 }
 
+static void pl011_reset(DeviceState *dev)
+{
+    PL011State *s = PL011(dev);
+    int i;
+
+    s->lcr = 0;
+    s->rsr = 0;
+    s->dmacr = 0;
+    s->int_enabled = 0;
+    s->int_level = 0;
+    s->ilpr = 0;
+    s->ibrd = 0;
+    s->fbrd = 0;
+    s->read_pos = 0;
+    s->read_count = 0;
+    s->read_trigger = 1;
+    s->ifl = 0x12;
+    s->cr = 0x300;
+    s->flags = 0x90;
+
+    for (i = 0; i < ARRAY_SIZE(s->irq); i++) {
+        qemu_irq_lower(s->irq[i]);
+    }
+}
+
 static void pl011_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
 
     dc->realize = pl011_realize;
+    dc->reset = pl011_reset;
     dc->vmsd = &vmstate_pl011;
     device_class_set_props(dc, pl011_properties);
 }
-- 
2.34.1

