Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp2600984ejb;
        Wed, 15 Mar 2023 07:53:38 -0700 (PDT)
X-Google-Smtp-Source: AK7set8018+TN7V9JpuiAJt4J5VMT/FOWKI5r+ZF5XAF4bcS9R8uZ48aAO+U+qjzupAJMf5/E8tX
X-Received: by 2002:ac8:58d4:0:b0:3b8:6442:2575 with SMTP id u20-20020ac858d4000000b003b864422575mr155173qta.49.1678892018092;
        Wed, 15 Mar 2023 07:53:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678892018; cv=none;
        d=google.com; s=arc-20160816;
        b=b/IY4emRxeE/JMGXzBrBbuJjRu74QMu+emDP3Qttd6avIpJvQUIE9sb6/NvrZ5Vzku
         xa8okcBRMwljvefufW4gP+YZ29fflWuj1UoY7AUyGSifWNG/ur12P3lmGU5F6EeKFdIe
         TqDxcMQf1b2Iy74+tdUZ8cZ+rusUhOVdPT5UUGUk+NFibGg+jYBDSkHxbQcQyd68kXve
         y5yFYLHc69b4XYqFSsPqH0eh2K/+W/0wzv2L2AWlFrq4deTBsF9Tyyq/fzfFEBGNdrYB
         Ymdmq1qAGSIRGJ3QKcpf/ehieLKUHoo6DT7H5wmZs4qvlxL190KJrCymbWkuhW3ax0hh
         ZNtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=AgrNnzU6fXbTM2E8uxqk9fSw2ZeUOdZlwQa83wFMx2M=;
        b=JIIkJwzrntlYHrSOBdq0bcBcHrBp5pEgFFYpFWh/+AKmdw63eSnc/esxQA3p6pOeWH
         PgtNkqVIjESSdZe/e1tctU7WcfXHpeJp/hflFO5pXssjjlfH4xfxTM7WeUIkIhOUWJ5a
         xa8OsqTxn9x/Oflli40Ata5FsTtc/hAYVac5Hzt/4golC1q/BSMtHqxg4qQ0PhBqyDSR
         YE6xQke/XKzEZfuiLcU6Tug8IoaluPgnJCSuEnng9tET2bHnHd9ELzGwrwo0h7Jw4d9b
         GgDZj5pc6EwbZ/cHRNAKOcLPS8KZFnraR6hVswvciB7serQlcivfZ88W8feNp42WrP2N
         W22A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=eNu8jtTW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a20-20020aed2794000000b003bd16d07e57si4057101qtd.515.2023.03.15.07.53.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Mar 2023 07:53:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=eNu8jtTW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pcSV4-0003cS-TM; Wed, 15 Mar 2023 10:53:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1pcSUw-0003aI-Pu; Wed, 15 Mar 2023 10:53:02 -0400
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1pcSUu-0002q3-E5; Wed, 15 Mar 2023 10:53:02 -0400
Received: by mail-il1-x12a.google.com with SMTP id j6so6016680ilr.7;
 Wed, 15 Mar 2023 07:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678891977;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AgrNnzU6fXbTM2E8uxqk9fSw2ZeUOdZlwQa83wFMx2M=;
 b=eNu8jtTWimXimMsY0B3a8z6ev1u2cXnu7k8wcKx5jIEj75fIgEkHE1jocQGU6sgwMp
 7QLgGGmMh6U9xz0Y1y7GoTRr2utwJxrCu5RVqv2T2xmr1mVkucKASeoGAYxS8YVPb/ip
 VJfKkdMym3BMD6hnk3WdqVj6Kl4YM++M9+qEd5h17AvO3dbNJQzUTeFMSa+4aoCUVqU1
 WGFR+OsEIiN8wEdJs8j9avnDDTG26wLkARXbaL6AzypNisefj/DJKQwLc/sX0t6wxjSu
 3YKNJO71hP0aFF/ypw2CJp0s4GCgK6HZARJ6j/XLjXPg0+R650oeqeLyALb6UxCJpmFi
 eveA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678891977;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=AgrNnzU6fXbTM2E8uxqk9fSw2ZeUOdZlwQa83wFMx2M=;
 b=nv5eFtD61TOHZLrpidjO7DpJzCc6qbFBvUFQqJ7+jq4IEniW013R8vFrZhZgQQJwuQ
 BMnfRIf/fBeQaXFyLhO1OFC6Z0pBdfNih7HtwCDjda307gjNXvf+TDAnxI3x+VHWEzrz
 iUlkT0OyDrqcdaM5u5SFm0G3GO1LD8s/VkkD3A5N10vR4yLmVGfUrps1TOYVFudiSb/p
 EXtGb+6UaCwtAHhx2oHd3Sj8CiKnNuTAQV1PzNSq5KiHkw+rSi7pG6fR/3pYX57xdX4r
 d77Svew2i3abrtr388MCQpKKO4vE3NotKZGq25F2qwi8gSGNSuADjMH9Ye2AruOJKG6q
 PHmw==
X-Gm-Message-State: AO0yUKXI0Lm/qEc8Rs0kHANIUOomZN1tSuLu6T9TM9L4g1lVQ17I3Nrc
 I03D9GC74daY8aLj3WzmwJo=
X-Received: by 2002:a92:ccc3:0:b0:319:2bf:54b2 with SMTP id
 u3-20020a92ccc3000000b0031902bf54b2mr4677963ilq.5.1678891977076; 
 Wed, 15 Mar 2023 07:52:57 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a02b384000000b00406101d2dcbsm1177830jan.125.2023.03.15.07.52.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 07:52:56 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Jean-Christophe Dubois <jcd@tribudubois.net>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 2/5] fsl-imx6ul: Add fec[12]-phy-connected properties
Date: Wed, 15 Mar 2023 07:52:45 -0700
Message-Id: <20230315145248.1639364-3-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315145248.1639364-1-linux@roeck-us.net>
References: <20230315145248.1639364-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::12a;
 envelope-from=groeck7@gmail.com; helo=mail-il1-x12a.google.com
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
X-TUID: pKLcGIwIyfT0

Add fec[12]-phy-connected properties and use it to set phy-connected
and phy-consumer properties for imx_fec.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 hw/arm/fsl-imx6ul.c         | 20 ++++++++++++++++++++
 include/hw/arm/fsl-imx6ul.h |  1 +
 2 files changed, 21 insertions(+)

diff --git a/hw/arm/fsl-imx6ul.c b/hw/arm/fsl-imx6ul.c
index d88d6cc1c5..2189dcbb72 100644
--- a/hw/arm/fsl-imx6ul.c
+++ b/hw/arm/fsl-imx6ul.c
@@ -407,7 +407,23 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
 
     /*
      * Ethernet
+     *
+     * We must use two loops since phy_connected affects the other interface
+     * and we have to set all properties before calling sysbus_realize().
      */
+    for (i = 0; i < FSL_IMX6UL_NUM_ETHS; i++) {
+        object_property_set_bool(OBJECT(&s->eth[i]), "phy-connected",
+                                 s->phy_connected[i], &error_abort);
+        /*
+         * If the MDIO bus on this controller is not connected, assume the
+         * other controller provides support for it.
+         */
+        if (!s->phy_connected[i]) {
+            object_property_set_link(OBJECT(&s->eth[1 - i]), "phy-consumer",
+                                     OBJECT(&s->eth[i]), &error_abort);
+        }
+    }
+
     for (i = 0; i < FSL_IMX6UL_NUM_ETHS; i++) {
         static const hwaddr FSL_IMX6UL_ENETn_ADDR[FSL_IMX6UL_NUM_ETHS] = {
             FSL_IMX6UL_ENET1_ADDR,
@@ -620,6 +636,10 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
 static Property fsl_imx6ul_properties[] = {
     DEFINE_PROP_UINT32("fec1-phy-num", FslIMX6ULState, phy_num[0], 0),
     DEFINE_PROP_UINT32("fec2-phy-num", FslIMX6ULState, phy_num[1], 1),
+    DEFINE_PROP_BOOL("fec1-phy-connected", FslIMX6ULState, phy_connected[0],
+                     true),
+    DEFINE_PROP_BOOL("fec2-phy-connected", FslIMX6ULState, phy_connected[1],
+                     true),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/arm/fsl-imx6ul.h b/include/hw/arm/fsl-imx6ul.h
index 1952cb984d..9ee15ae38d 100644
--- a/include/hw/arm/fsl-imx6ul.h
+++ b/include/hw/arm/fsl-imx6ul.h
@@ -89,6 +89,7 @@ struct FslIMX6ULState {
     MemoryRegion       ocram_alias;
 
     uint32_t           phy_num[FSL_IMX6UL_NUM_ETHS];
+    bool               phy_connected[FSL_IMX6UL_NUM_ETHS];
 };
 
 enum FslIMX6ULMemoryMap {
-- 
2.39.2

