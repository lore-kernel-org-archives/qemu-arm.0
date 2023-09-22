Received: by 2002:a17:906:5293:b0:9ae:5796:d6c1 with SMTP id c19csp1421829ejm;
        Fri, 22 Sep 2023 09:04:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGB/DKRFIcoD+ZxQEFMR86zCIQZ1iwgwUYivzocBxu/yA/mg+tjsbc3TEoX3dOMEJy65eB
X-Received: by 2002:a05:622a:10b:b0:412:2dd3:e0fc with SMTP id u11-20020a05622a010b00b004122dd3e0fcmr183263qtw.5.1695398670837;
        Fri, 22 Sep 2023 09:04:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695398670; cv=none;
        d=google.com; s=arc-20160816;
        b=sHycPslPRXsF8mBld7sy63SGPhCLCoOaCEbkJzf135AhgUMqVu0KBUxJJCwEzOblD+
         Uy0JTmldstV0B/grfKPeVEdWDK/o2XSwGMQwDsqi81grzj+2V8ZeBqLNIhvFryrg7Y1k
         MyVmZ/AjfeIuKWeM+ZowuNE7PAWqcHxjPt0/rYP9s89px1HmsUrF/AfUfVWuQTKW9UjZ
         zq5BFoDoZlIe7noo7NXgnPxD+05jmpN7xltfICj3Wcqg+WHkoNu2PrOArVHBp9SYnQTG
         K5znML2yWceo0MFfhXeuN2AyqkYwRUi4ZfIUunc+sA+siN0f3IvEGWaT4a6dpJln/Czw
         JQVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=9wK5dLLKpTycyoXEtHm64FZYsG0IBraWUM9PFgJ99wg=;
        fh=S2APpbBrpM+VqLE1Vn55XwNx8S+N0ykq53OdZwk4Avo=;
        b=IedvQ6aAAKLcw6sqZrGQIKt4woLwCDnkzzYm8s2yppqk2v7Ms4e5N75cb9RGM35iy9
         llAeLh4RXps2rTEA03hz5DRVkqtI81Lq4xZ8phDjKCEfC84r7wAGpreS0rv3b3LTxc2B
         B7gxXbDezc3XnlDvaVikFXBeAnPPaTJHE0J0Tv28hECmIuMQS/zij6pIQMkcudaZuxEl
         aqc+WuHbSir8CkvlZkFvlYbuMAISZkIGnK/Qk17FHc0gl4aMsklplZzoZTqLlHHNlvgb
         1Xg4f48lAB39WczwgJsW/A4+8/GIA8//+/CVoPC3Ugf2Zk5qBNDcUwBJEK7D1aL5SQR4
         5LFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h4-20020a05622a170400b0041669279c2bsi2403287qtk.792.2023.09.22.09.04.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Sep 2023 09:04:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qjiZI-0001ER-5o; Fri, 22 Sep 2023 11:59:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=/LOp=FG=kaod.org=clg@ozlabs.org>)
 id 1qjiZG-0001Ci-HF; Fri, 22 Sep 2023 11:59:46 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=/LOp=FG=kaod.org=clg@ozlabs.org>)
 id 1qjiZE-00064f-UC; Fri, 22 Sep 2023 11:59:46 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4RscR24gpkz4wxQ;
 Sat, 23 Sep 2023 01:59:42 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4RscR04XXdz4wxj;
 Sat, 23 Sep 2023 01:59:40 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 4/4] aspeed/timer: Clean up local variable shadowing
Date: Fri, 22 Sep 2023 17:59:24 +0200
Message-ID: <20230922155924.1172019-5-clg@kaod.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230922155924.1172019-1-clg@kaod.org>
References: <20230922155924.1172019-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=/LOp=FG=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: MAgplEVJneiW

commit 8137355e850f ("aspeed/timer: Fix behaviour running Linux")
introduced a MAX() expression to calculate the next timer deadline :

    return calculate_time(t, MAX(MAX(t->match[0], t->match[1]), 0));

The second MAX() is not necessary since the compared values are an
unsigned and 0. Simply remove it and fix warning :

  ../hw/timer/aspeed_timer.c: In function ‘calculate_next’:
  ../include/qemu/osdep.h:396:31: warning: declaration of ‘_a’ shadows a previous local [-Wshadow=compatible-local]
    396 |         typeof(1 ? (a) : (b)) _a = (a), _b = (b);       \
        |                               ^~
  ../hw/timer/aspeed_timer.c:170:12: note: in expansion of macro ‘MAX’
    170 |     next = MAX(MAX(calculate_match(t, 0), calculate_match(t, 1)), 0);
        |            ^~~
  ../hw/timer/aspeed_timer.c:170:16: note: in expansion of macro ‘MAX’
    170 |     next = MAX(MAX(calculate_match(t, 0), calculate_match(t, 1)), 0);
        |                ^~~
  /home/legoater/work/qemu/qemu-aspeed.git/include/qemu/osdep.h:396:31: note: shadowed declaration is here
    396 |         typeof(1 ? (a) : (b)) _a = (a), _b = (b);       \
        |                               ^~
  ../hw/timer/aspeed_timer.c:170:12: note: in expansion of macro ‘MAX’
    170 |     next = MAX(MAX(calculate_match(t, 0), calculate_match(t, 1)), 0);
        |            ^~~

Cc: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/timer/aspeed_timer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
index 9c20b3d6ad8a..72161f07bbee 100644
--- a/hw/timer/aspeed_timer.c
+++ b/hw/timer/aspeed_timer.c
@@ -167,7 +167,7 @@ static uint64_t calculate_next(struct AspeedTimer *t)
         qemu_set_irq(t->irq, t->level);
     }
 
-    next = MAX(MAX(calculate_match(t, 0), calculate_match(t, 1)), 0);
+    next = MAX(calculate_match(t, 0), calculate_match(t, 1));
     t->start = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
 
     return calculate_time(t, next);
-- 
2.41.0

