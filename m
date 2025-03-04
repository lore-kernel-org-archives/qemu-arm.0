Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp3099357njb;
        Mon, 3 Mar 2025 22:49:31 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXCZX5hwPlXZX8PJlMoYOBruVIZW/SF8w7YoI8YJ4XazgSB/GVIqWj9rJoHRc5XH9NI8cLHRLXl4QWsVg==@linaro.org
X-Google-Smtp-Source: AGHT+IEXZXfdGdiVsXaeardcZG6v/Mw9MmWYQ+lmm91+ua7qm7Oq08GLM4ROZMWpTw1/HB9NsEVY
X-Received: by 2002:a05:620a:3915:b0:7c0:8345:4e8e with SMTP id af79cd13be357-7c39c4b6076mr2302164785a.21.1741070970931;
        Mon, 03 Mar 2025 22:49:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741070970; cv=none;
        d=google.com; s=arc-20240605;
        b=ZYUJHZCBXw6d4uHkXCLph9gdzhLPc5dYQSZQ1tGhfQcF9YB4y70pOipaQF3taTM1fu
         Xy2bX8qZd1JFvxTehfc2+HBmg5QRwe2ALLfwm2ZrylliJk0iLTty1pd+zCJAh/Hx0UpP
         OcOCMUtPO+IdT9EK7q+nsQykA9ZE4I/SLqkcRA1TBFN3z9b6lLhdkFTObdtQTZuESsrs
         e56GFcYAdNrH/zbib482qzFmGEJXvJPH4St9cRs7cYhcOk4lu8WE1bfhE46SNlRNrme7
         efS90yb6I2/uxiUuShMDc/g27HOP15Cg8AY7ggbhUFpAAeSixxmHe3d73YH0P/T4hhno
         Vp2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=Oh6hYPJHoDXatd9QTwVzXJ3QYa8S7qCzVkrCHYEkWIM=;
        fh=Gb4TIc8MExyZGNjx5T60USxFFuCM6mshEZ2Ta2WMSD4=;
        b=H6z6U9RmOHaGVBIupSdeLE3/4TunSsjGpdq9CZqhEusOSU6BR5zpuBeTf9KL2ZI8ic
         Ln6aN7l1fdOkarUqh42jKQ3/cqBs/smqv4VBcDt6R7VacrCbi+N4xHcywH9G8b091dmj
         rFdOWBVm71k57VrPybmz7JA88DjtZ4PKg2Hs478/3pvJ5x7xc+nXVUkHj7XR93lMFQun
         3FR0MILw4nbxZQJ+skMsd1agfzJDGkWsNr5GDzQv0lunKyTj8IXvL07i4s/MNsav2ZMo
         KIH6rHfk7YK+2PJy6/n1tx+CPsnPejM5HI9EBBgr1fzrKAezzZiWAHRCjF0PWXYotCjU
         4tzg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c36fee7f7bsi1044123285a.93.2025.03.03.22.49.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Mar 2025 22:49:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tpM4R-0006c0-LP; Tue, 04 Mar 2025 01:48:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tpM4O-0006b2-KP; Tue, 04 Mar 2025 01:48:00 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tpM4N-0003IK-16; Tue, 04 Mar 2025 01:48:00 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 4 Mar
 2025 14:47:11 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 4 Mar 2025 14:47:11 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v5 5/6] hw/arm/aspeed_ast27x0.c Separate HW Strap Registers
 for SCU and SCUIO
Date: Tue, 4 Mar 2025 14:47:07 +0800
Message-ID: <20250304064710.2128993-6-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250304064710.2128993-1-jamin_lin@aspeedtech.com>
References: <20250304064710.2128993-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: UtdB733gDtW/

There is one hw-strap1 register in the SCU (CPU DIE) and another hw-strap1
register in the SCUIO (IO DIE). The values of these two registers should not be
the same. To reuse the current design of hw-strap, hw-strap1 is assigned to the
SCU and sets the value in the SCU hw-strap1 register, while hw-strap2 is
assigned to the SCUIO and sets the value in the SCUIO hw-strap1 register.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/arm/aspeed_ast27x0.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index a48f47b74e..92487bf229 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -333,14 +333,21 @@ static void aspeed_soc_ast2700_init(Object *obj)
                          sc->silicon_rev);
     object_property_add_alias(obj, "hw-strap1", OBJECT(&s->scu),
                               "hw-strap1");
-    object_property_add_alias(obj, "hw-strap2", OBJECT(&s->scu),
-                              "hw-strap2");
     object_property_add_alias(obj, "hw-prot-key", OBJECT(&s->scu),
                               "hw-prot-key");
 
     object_initialize_child(obj, "scuio", &s->scuio, TYPE_ASPEED_2700_SCUIO);
     qdev_prop_set_uint32(DEVICE(&s->scuio), "silicon-rev",
                          sc->silicon_rev);
+    /*
+     * There is one hw-strap1 register in the SCU (CPU DIE) and another
+     * hw-strap1 register in the SCUIO (IO DIE). To reuse the current design
+     * of hw-strap, hw-strap1 is assigned to the SCU and sets the value in the
+     * SCU hw-strap1 register, while hw-strap2 is assigned to the SCUIO and
+     * sets the value in the SCUIO hw-strap1 register.
+     */
+    object_property_add_alias(obj, "hw-strap2", OBJECT(&s->scuio),
+                                  "hw-strap1");
 
     snprintf(typename, sizeof(typename), "aspeed.fmc-%s", socname);
     object_initialize_child(obj, "fmc", &s->fmc, typename);
-- 
2.34.1

