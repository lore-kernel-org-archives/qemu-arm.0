Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp4332ejb;
        Tue, 6 Jun 2023 21:42:17 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5W6MduZRPf6CE9iqOb36Y7waVzcg+SSkz/3MCH2CNdLPuuEEYJLvdF98HJlhgYN+BfQbKv
X-Received: by 2002:a05:620a:45a1:b0:75e:b8b0:a4b2 with SMTP id bp33-20020a05620a45a100b0075eb8b0a4b2mr817115qkb.69.1686112937345;
        Tue, 06 Jun 2023 21:42:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686112937; cv=none;
        d=google.com; s=arc-20160816;
        b=QA0QGzvNURYQ9zVvORWEPV7r1Hat4/IGdk6a4Q+1gM6fqWwTNrga7/zLnDvUa9l9rq
         hC1MuxGBcKvdc7QhREQ+cm+aeFRdmJSZUz+1NWH9cWxCcA08yaO+AJ5wv4AYOnBz8q+V
         Rzio7gwV8W30dIp1prM7Ki/FHqFqzTD9tG5QNv1gHJRLV3yfi1TBzSElo4c2V51KiAkx
         f+L8nWaGDbzLEwdKqPFXzMbyiYNa9rAk+0F2w6kWc0Jz/U8Jclca34+QfHSbiH9KLhPJ
         PF5ZO8yiU01dFDZrUUvWy53JGY2uzCo5t6ZenzubnGaCysXyFxCza+R6gzFgscfhzyYd
         YtwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=p0zrPMouz3L3KWrSQzTFRuTZFl4b/QfrZukdW2974f4=;
        b=g4yPR2GyL/gUcB7Loztl1Xk3Wko5kScXoG6Q4TxcfvCunsCDVp7EcgGl6mQmd84Xzf
         YIZzWXsaIuuBEwmMWoSay0ozI9nK2YTYpWVzaIBvkkmGcJlyAAQDcByikAFFgU0t50LD
         brtVK2jI+jxdlHFfvrTDYc/2g7SByS9783I56InVCW7MOqM4XFVN8EP520lEgdw2CkpW
         dbRpVMDvK3oky7iGogo0eWPQXLb3xvmzJUDgOxXWVl4xNdlHfYYfgFCo2DTCMEB4s+7S
         RvkdOSDC5V1kR+b7EJYU0ActjsEjz+UW4IRjxnJrJqEuJnnE5humePqkzcBCQfuM05WI
         EY2A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cz30-20020a05620a36de00b0075d1df60ae5si4716544qkb.729.2023.06.06.21.42.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jun 2023 21:42:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q6ky4-0001o2-CV; Wed, 07 Jun 2023 00:40:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5JAy=B3=kaod.org=clg@ozlabs.org>)
 id 1q6ky3-0001ng-Nn; Wed, 07 Jun 2023 00:40:19 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5JAy=B3=kaod.org=clg@ozlabs.org>)
 id 1q6ky2-0003nw-1Q; Wed, 07 Jun 2023 00:40:19 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4QbZQR2ggfz4x4B;
 Wed,  7 Jun 2023 14:40:15 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4QbZQN3xgrz4x4F;
 Wed,  7 Jun 2023 14:40:12 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v2 05/12] hw/ssi: Introduce a ssi_get_cs() helper
Date: Wed,  7 Jun 2023 06:39:36 +0200
Message-Id: <20230607043943.1837186-6-clg@kaod.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230607043943.1837186-1-clg@kaod.org>
References: <20230607043943.1837186-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=5JAy=B3=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
X-TUID: VDjNjrecsM+t

Simple routine to retrieve a DeviceState object on a SPI bus using its
address/cs. It will be useful for the board to wire the CS lines.

Cc: Alistair Francis <alistair@alistair23.me>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/ssi/ssi.h |  2 ++
 hw/ssi/ssi.c         | 15 +++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/include/hw/ssi/ssi.h b/include/hw/ssi/ssi.h
index 9e0706a5248c..01662521b09a 100644
--- a/include/hw/ssi/ssi.h
+++ b/include/hw/ssi/ssi.h
@@ -112,4 +112,6 @@ SSIBus *ssi_create_bus(DeviceState *parent, const char *name);
 
 uint32_t ssi_transfer(SSIBus *bus, uint32_t val);
 
+DeviceState *ssi_get_cs(SSIBus *bus, uint8_t addr);
+
 #endif
diff --git a/hw/ssi/ssi.c b/hw/ssi/ssi.c
index d4409535429c..7c71fce0db90 100644
--- a/hw/ssi/ssi.c
+++ b/hw/ssi/ssi.c
@@ -27,6 +27,21 @@ struct SSIBus {
 #define TYPE_SSI_BUS "SSI"
 OBJECT_DECLARE_SIMPLE_TYPE(SSIBus, SSI_BUS)
 
+DeviceState *ssi_get_cs(SSIBus *bus, uint8_t addr)
+{
+    BusState *b = BUS(bus);
+    BusChild *kid;
+
+    QTAILQ_FOREACH(kid, &b->children, sibling) {
+        SSIPeripheral *kid_ssi = SSI_PERIPHERAL(kid->child);
+        if (kid_ssi->addr == addr) {
+            return kid->child;
+        }
+    }
+
+    return NULL;
+}
+
 static const TypeInfo ssi_bus_info = {
     .name = TYPE_SSI_BUS,
     .parent = TYPE_BUS,
-- 
2.40.1

