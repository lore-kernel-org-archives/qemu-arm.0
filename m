Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4555429ejb;
        Tue, 20 Dec 2022 10:33:33 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsAaWyswEUXGqqWMLohTT85tycDmNRmikHSMPfTSRQpaTfK4f8rY0nMdrdW0TngDZMv4+A/
X-Received: by 2002:a05:6214:3787:b0:4f3:7d92:13a9 with SMTP id ni7-20020a056214378700b004f37d9213a9mr27670553qvb.15.1671561212873;
        Tue, 20 Dec 2022 10:33:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671561212; cv=none;
        d=google.com; s=arc-20160816;
        b=qx6d6uUZb4ntx+RvvL13YtSvOwdGjp1b82ovCKcPwRHbqLirzSJoqcGexGsQjW6u9v
         HU4Kn458hlmuGDeBe11vr046sHfq+uKgqUaLTw0nB+cu8uSC5wZd0/G8WE95G7CIykAY
         g11QndZ8eOW7ZKpsf01wuvtEk0i4llxv0WFswb93x34eOHA4Xoq9muKlzZkXtUDz6Y0Q
         BR6Kao5jG1WG0YomZgQBRt1q2vdDT7zLX1zruKQ0F33CW+VK8fpXyakYdb1VkA+7szxD
         gtZP7jkAeTLXAUXk5RlxCDuTAqXhsT1klyigBMjlOD68QP3UU8EbFH0qBqoLF59V8wpL
         vRpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=mysGEuWDZ/+HJ99Xg+GAHX/L7Ka3JyO+DGFpjgaPyU4=;
        b=Xstg9Rl1RrBzvyegCByBVDRbdZCEuZDQHxPKG/37oNFTnD6rLwe+OMY+RDdhAEyT4W
         fS93IWMD9JFR6cEjHa9WnsJXczJ53+1DNkrBSlh8y03ohIczgLp+q7LS+QvOnNQ5mNkJ
         FNkAbVFTfqYyBiZxHlwOe84PpB01BgR33ayaTT4ciPobKj/n7/c981CcpaGnkKSa4nUU
         ZtPfr3MF5edPb4H880dthW3L+dAnBxh0HCUqY17WRBCtzg7m0+MV1UPfM9MrDEEiCogN
         hPxm03z80a/dfk2paOf5ggw5AkxJNKlBrfebOM416jG9ZNyZSUEfFa3KTyMQx76JlCYt
         lxaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jp11-20020ad45f8b000000b004c71609b11esi5482092qvb.137.2022.12.20.10.33.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Dec 2022 10:33:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p7gPG-0001Mi-US; Tue, 20 Dec 2022 12:27:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1p7gPA-0001LD-FR; Tue, 20 Dec 2022 12:27:52 -0500
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1p7gP7-00057f-9y; Tue, 20 Dec 2022 12:27:52 -0500
Received: (Authenticated sender: jcd@tribudubois.net)
 by mail.gandi.net (Postfix) with ESMTPSA id 38767E0005;
 Tue, 20 Dec 2022 17:27:45 +0000 (UTC)
From: Jean-Christophe Dubois <jcd@tribudubois.net>
To: qemu-devel@nongnu.org
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>,
	qemu-arm@nongnu.org
Subject: [PATCH] i.MX6UL: Add a specific GPT timer instance for the i.MX6UL
Date: Tue, 20 Dec 2022 18:27:43 +0100
Message-ID: <0f5e2f5b92a72c2d96212d09c7d96f84d855e12c.1671548388.git.jcd@tribudubois.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1671548388.git.jcd@tribudubois.net>
References: <cover.1671548388.git.jcd@tribudubois.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=217.70.183.196; envelope-from=jcd@tribudubois.net;
 helo=relay4-d.mail.gandi.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: FcoDHoIJCV9M
Message-ID: <20221220172743.tnreolUf1FeC6nzSZSCOgoo3jaS7HoQUvN7L6ynkPJM@z>

The i.MX6UL doesn't support CLK_HIGH ou CLK_HIGH_DIV clock source.

Signed-off-by: Jean-Christophe Dubois <jcd@tribudubois.net>
---
 hw/arm/fsl-imx6ul.c        |  2 +-
 hw/misc/imx6ul_ccm.c       |  6 ------
 hw/timer/imx_gpt.c         | 25 +++++++++++++++++++++++++
 include/hw/timer/imx_gpt.h |  1 +
 4 files changed, 27 insertions(+), 7 deletions(-)

diff --git a/hw/arm/fsl-imx6ul.c b/hw/arm/fsl-imx6ul.c
index f189712329..d88d6cc1c5 100644
--- a/hw/arm/fsl-imx6ul.c
+++ b/hw/arm/fsl-imx6ul.c
@@ -81,7 +81,7 @@ static void fsl_imx6ul_init(Object *obj)
      */
     for (i = 0; i < FSL_IMX6UL_NUM_GPTS; i++) {
         snprintf(name, NAME_SIZE, "gpt%d", i);
-        object_initialize_child(obj, name, &s->gpt[i], TYPE_IMX7_GPT);
+        object_initialize_child(obj, name, &s->gpt[i], TYPE_IMX6UL_GPT);
     }
 
     /*
diff --git a/hw/misc/imx6ul_ccm.c b/hw/misc/imx6ul_ccm.c
index a65d031455..e01bb68ac7 100644
--- a/hw/misc/imx6ul_ccm.c
+++ b/hw/misc/imx6ul_ccm.c
@@ -522,12 +522,6 @@ static uint32_t imx6ul_ccm_get_clock_frequency(IMXCCMState *dev, IMXClk clock)
     case CLK_32k:
         freq = CKIL_FREQ;
         break;
-    case CLK_HIGH:
-        freq = CKIH_FREQ;
-        break;
-    case CLK_HIGH_DIV:
-        freq = CKIH_FREQ / 8;
-        break;
     default:
         qemu_log_mask(LOG_GUEST_ERROR, "[%s]%s: unsupported clock %d\n",
                       TYPE_IMX6UL_CCM, __func__, clock);
diff --git a/hw/timer/imx_gpt.c b/hw/timer/imx_gpt.c
index 80b8302639..7222b1b387 100644
--- a/hw/timer/imx_gpt.c
+++ b/hw/timer/imx_gpt.c
@@ -115,6 +115,17 @@ static const IMXClk imx6_gpt_clocks[] = {
     CLK_HIGH,      /* 111 reference clock */
 };
 
+static const IMXClk imx6ul_gpt_clocks[] = {
+    CLK_NONE,      /* 000 No clock source */
+    CLK_IPG,       /* 001 ipg_clk, 532MHz*/
+    CLK_IPG_HIGH,  /* 010 ipg_clk_highfreq */
+    CLK_EXT,       /* 011 External clock */
+    CLK_32k,       /* 100 ipg_clk_32k */
+    CLK_NONE,      /* 101 not defined */
+    CLK_NONE,      /* 110 not defined */
+    CLK_NONE,      /* 111 not defined */
+};
+
 static const IMXClk imx7_gpt_clocks[] = {
     CLK_NONE,      /* 000 No clock source */
     CLK_IPG,       /* 001 ipg_clk, 532MHz*/
@@ -539,6 +550,13 @@ static void imx6_gpt_init(Object *obj)
     s->clocks = imx6_gpt_clocks;
 }
 
+static void imx6ul_gpt_init(Object *obj)
+{
+    IMXGPTState *s = IMX_GPT(obj);
+
+    s->clocks = imx6ul_gpt_clocks;
+}
+
 static void imx7_gpt_init(Object *obj)
 {
     IMXGPTState *s = IMX_GPT(obj);
@@ -566,6 +584,12 @@ static const TypeInfo imx6_gpt_info = {
     .instance_init = imx6_gpt_init,
 };
 
+static const TypeInfo imx6ul_gpt_info = {
+    .name = TYPE_IMX6UL_GPT,
+    .parent = TYPE_IMX25_GPT,
+    .instance_init = imx6ul_gpt_init,
+};
+
 static const TypeInfo imx7_gpt_info = {
     .name = TYPE_IMX7_GPT,
     .parent = TYPE_IMX25_GPT,
@@ -577,6 +601,7 @@ static void imx_gpt_register_types(void)
     type_register_static(&imx25_gpt_info);
     type_register_static(&imx31_gpt_info);
     type_register_static(&imx6_gpt_info);
+    type_register_static(&imx6ul_gpt_info);
     type_register_static(&imx7_gpt_info);
 }
 
diff --git a/include/hw/timer/imx_gpt.h b/include/hw/timer/imx_gpt.h
index ff5c8a351a..5a1230da35 100644
--- a/include/hw/timer/imx_gpt.h
+++ b/include/hw/timer/imx_gpt.h
@@ -78,6 +78,7 @@
 #define TYPE_IMX25_GPT "imx25.gpt"
 #define TYPE_IMX31_GPT "imx31.gpt"
 #define TYPE_IMX6_GPT "imx6.gpt"
+#define TYPE_IMX6UL_GPT "imx6ul.gpt"
 #define TYPE_IMX7_GPT "imx7.gpt"
 
 #define TYPE_IMX_GPT TYPE_IMX25_GPT
-- 
2.34.1

