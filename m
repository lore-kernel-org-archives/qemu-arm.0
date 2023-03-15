Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp2600794ejb;
        Wed, 15 Mar 2023 07:53:27 -0700 (PDT)
X-Google-Smtp-Source: AK7set99qzoRdu8ovSgaLGKlYDQ6bM410K3BWLXBqPv0Gm7kHgqQsh+S0guzR3QMm9bTlyYCSb6L
X-Received: by 2002:a05:6214:48c:b0:5a1:a8c6:77a6 with SMTP id pt12-20020a056214048c00b005a1a8c677a6mr29799308qvb.21.1678892006782;
        Wed, 15 Mar 2023 07:53:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678892006; cv=none;
        d=google.com; s=arc-20160816;
        b=nBpyZTzXvVME/rEv6zpNzs/hFSIWrXT271VcFQU4mQSLNspJ3bab8bp5F8Zb92WSu1
         fUdhC9hrzW/WQcx+zmFb0riYr0hGYbKxTN1LzR+jLkr5iADz8CXGipvA4NsA8g1T47oJ
         UgV4ORgYddebF7GWHJKKgha+eOXZu5RMHoV1n0VvbO3/USu+88yQawyRiJQszndyk9If
         g34jJC9k7OKGeSUDTeRS4+sMDhs/1Vm9Sw34AJFeE97Nr8RAnB5sR5N3adi75s5wlXoc
         83kGzT8MJUOoAW5FgXK7yd7CX3Wxug/5xGzoNnGqszhaZ2SDRzVhS3uR8agsrhqxZbbG
         w05w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=UqO73fu1QzAYLZc/W3Tc5v4+ufqBgz+jIwZ324r1rM0=;
        b=vW9IIA+GrQj8z/swAX01S2km7FGzvEa5j1wsbAQWYqWH9LXqMS2lyPkYHBzKkyUSZl
         zoS6ux/NjR1aD5TFdRbswtRpPwPKxA6w2VdpfePfO3i2jIJba+h5PTAu7gdYNYZuTWlp
         Pmst3StBRd8cbKXHhGqW60J/LcgtGMENs7V1FvpFj/0Y38sRRg7NeHxh9SV2jbcIHoEf
         AyPbTslOU0kVzo9coI3nwt2bNq3NVFbeRx5YmZSCNUNKVQfwXfKJos2trQjmrtAs0pDu
         snKqh2Hz8vjcAsqb5ja/74Y/yN+5EqlU0PPBgYwhX4+o+GElUto9t4v/oG2dUXcF1CnR
         aBxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=h4mJ1pU9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t3-20020a0cb383000000b0056c23bb1597si4467606qve.88.2023.03.15.07.53.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Mar 2023 07:53:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=h4mJ1pU9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pcSV4-0003cB-Mm; Wed, 15 Mar 2023 10:53:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1pcSUw-0003aJ-QS; Wed, 15 Mar 2023 10:53:02 -0400
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1pcSUu-0002pv-DB; Wed, 15 Mar 2023 10:53:02 -0400
Received: by mail-il1-x136.google.com with SMTP id j6so6016640ilr.7;
 Wed, 15 Mar 2023 07:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678891975;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UqO73fu1QzAYLZc/W3Tc5v4+ufqBgz+jIwZ324r1rM0=;
 b=h4mJ1pU9784qm5wIqTjpnUnrcSauMt0zOLWTVayWRxn7VB0bfAlAGU6UDGggnnsQ/R
 2NK9gnwzH+suqgk7HPucMILnCUwcnIBEKZuuz4+Hk5c1wBiMWVx5W58HPevOD7BH+cdn
 zA4icbM4+LQLotMsbcqhqWWoe6sI4wSnPSGTL7mR0InB8grmEI6uaz81c1DJnCthmzt+
 yFVDGD5odHcTmRl1PI7yLZO6j/guFnZb+A78WyfosuPXYNyAvEltd6seZteA1bUz8qA1
 A9OnWDmbgei+Ls81Ff3GywnRaU+zvOlg1u8aCELTPjxHDSeCfe+dAQ40Ji/7s9mLWfs6
 I/bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678891975;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UqO73fu1QzAYLZc/W3Tc5v4+ufqBgz+jIwZ324r1rM0=;
 b=irZ9AGBizNa8Z8/Y4USKX1K/3C8dJChH48WnKu6WehfVfFFjQPncRfCczZpLW7ZW8x
 5BooWexIjcgHl7yjWmT0Hcf81Y5OUXzRnauId9vPdx4u0NMOYvIvJ/afMK6iAJ0KyMWo
 O0V/Zo0wohWLf3XK0SbOK7r5t20B1u74fE9Lk+Uhx5P7k1R9FKgdQI8UC5VjyTrNm5RC
 B9+ETGXO6gZ4aI/IXlVTbZvetXzZ1GA+4YxmM1R2AUn9ztU2yQgLRs4xMj09Qxf6Sa7M
 wt39+sJz2YeamRAV641WTJIfpOnYS7Qw+gKHpqWaCP9qxpMc//hkMggEJT2hoJVug1mb
 4U1g==
X-Gm-Message-State: AO0yUKWksOj7Wdd47k7myMHjUVli84xW2twiapJ2tkMQm7ovoERKvJ27
 L0YOnMlZrKhEc2mEev/+vog=
X-Received: by 2002:a92:dac7:0:b0:318:8674:bf3 with SMTP id
 o7-20020a92dac7000000b0031886740bf3mr4693071ilq.19.1678891975439; 
 Wed, 15 Mar 2023 07:52:55 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 a10-20020a92c70a000000b00318ad12246fsm1658860ilp.1.2023.03.15.07.52.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 07:52:55 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Jean-Christophe Dubois <jcd@tribudubois.net>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 1/5] hw/net/imx_fec: Support two Ethernet interfaces connected
 to single MDIO bus
Date: Wed, 15 Mar 2023 07:52:44 -0700
Message-Id: <20230315145248.1639364-2-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315145248.1639364-1-linux@roeck-us.net>
References: <20230315145248.1639364-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::136;
 envelope-from=groeck7@gmail.com; helo=mail-il1-x136.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: uRFS47W6H4IF

The SOC on i.MX6UL and i.MX7 has 2 Ethernet interfaces. The PHY on each may
be connected to separate MDIO busses, or both may be connected on the same
MDIO bus using different PHY addresses. Commit 461c51ad4275 ("Add a phy-num
property to the i.MX FEC emulator") added support for specifying PHY
addresses, but it did not provide support for linking the second PHY on
a given MDIO bus to the other Ethernet interface.

To be able to support two PHY instances on a single MDIO bus, two properties
are needed: First, there needs to be a flag indicating if the MDIO bus on
a given Ethernet interface is connected. If not, attempts to read from this
bus must always return 0xffff. Implement this property as phy-connected.
Second, if the MDIO bus on an interface is active, it needs a link to the
consumer interface to be able to provide PHY access for it. Implement this
property as phy-consumer.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 hw/net/imx_fec.c         | 27 +++++++++++++++++++++++----
 include/hw/net/imx_fec.h |  2 ++
 2 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
index c862d96593..5d1f1f104c 100644
--- a/hw/net/imx_fec.c
+++ b/hw/net/imx_fec.c
@@ -282,11 +282,19 @@ static uint32_t imx_phy_read(IMXFECState *s, int reg)
     uint32_t val;
     uint32_t phy = reg / 32;
 
-    if (phy != s->phy_num) {
-        trace_imx_phy_read_num(phy, s->phy_num);
+    if (!s->phy_connected) {
         return 0xffff;
     }
 
+    if (phy != s->phy_num) {
+        if (s->phy_consumer && phy == s->phy_consumer->phy_num) {
+            s = s->phy_consumer;
+        } else {
+            trace_imx_phy_read_num(phy, s->phy_num);
+            return 0xffff;
+        }
+    }
+
     reg %= 32;
 
     switch (reg) {
@@ -343,11 +351,19 @@ static void imx_phy_write(IMXFECState *s, int reg, uint32_t val)
 {
     uint32_t phy = reg / 32;
 
-    if (phy != s->phy_num) {
-        trace_imx_phy_write_num(phy, s->phy_num);
+    if (!s->phy_connected) {
         return;
     }
 
+    if (phy != s->phy_num) {
+        if (s->phy_consumer && phy == s->phy_consumer->phy_num) {
+            s = s->phy_consumer;
+        } else {
+            trace_imx_phy_write_num(phy, s->phy_num);
+            return;
+        }
+    }
+
     reg %= 32;
 
     trace_imx_phy_write(val, phy, reg);
@@ -1327,6 +1343,9 @@ static Property imx_eth_properties[] = {
     DEFINE_NIC_PROPERTIES(IMXFECState, conf),
     DEFINE_PROP_UINT32("tx-ring-num", IMXFECState, tx_ring_num, 1),
     DEFINE_PROP_UINT32("phy-num", IMXFECState, phy_num, 0),
+    DEFINE_PROP_BOOL("phy-connected", IMXFECState, phy_connected, true),
+    DEFINE_PROP_LINK("phy-consumer", IMXFECState, phy_consumer, TYPE_IMX_FEC,
+                     IMXFECState *),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/net/imx_fec.h b/include/hw/net/imx_fec.h
index e3a8755db9..2d13290c78 100644
--- a/include/hw/net/imx_fec.h
+++ b/include/hw/net/imx_fec.h
@@ -270,6 +270,8 @@ struct IMXFECState {
     uint32_t phy_int;
     uint32_t phy_int_mask;
     uint32_t phy_num;
+    bool phy_connected;
+    struct IMXFECState *phy_consumer;
 
     bool is_fec;
 
-- 
2.39.2

