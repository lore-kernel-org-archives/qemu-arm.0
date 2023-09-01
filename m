Received: by 2002:a17:907:76b5:b0:9a1:fa4e:495e with SMTP id jw21csp497080ejc;
        Fri, 1 Sep 2023 02:45:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqXe4Ac9Oi4BWhDQPTTcWijWftQqFp1WRFIqJnY/2ehSQF5uK2mXrP3buf0e+MW2J8xKj6
X-Received: by 2002:a05:620a:408a:b0:76f:14dd:b164 with SMTP id f10-20020a05620a408a00b0076f14ddb164mr2457712qko.0.1693561550244;
        Fri, 01 Sep 2023 02:45:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693561550; cv=none;
        d=google.com; s=arc-20160816;
        b=K/pxfwq0Pf8ONpDI2xykvo4RAm7hhlWQS1UPLDXTI+rV3cfxV/HF47attizc/jac7E
         KQ572+pLubQVoUgrIC+3PBd7yvpw+jvQghxF/Lu/u86tUY4vSKrc0oQ9dSbKxcTN9zbu
         9OyWdjzVE6/6NxTmlguOMXIEyZ97nL3L8qVwxxT31rhgBTyX5GxtcmpVTlWcuWuCQbqp
         GDdRGky1KAoluZlNx9UpS61f7AsUtJaG5O1s8ML1HBPgjYbgvCs5h/a3EI+NEek3GKTr
         k0SG8kFvBfcs6t5/s5wr3oz5zf1lDSZg70XGaSXhYBhH23bgHT5fOEBStM4GLYnQKGO5
         TwEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=0uBzhRQzUCJN9z7pCxbR/94asa+gedOJtUrAJT2U4lA=;
        fh=ipiim5DCGYA2ikoUX40V23Wa8pyYq12zTq5i3+APbVQ=;
        b=gJ9Q34V9FJ/X5QLp/8Kxh7clynbomfVUBpN7GGBeRIfzTlQahC4SrRP9L2+ocaE8U8
         U5ivuAHOHRtSpZfM2gkqSEwJ6923rTifjkwNTaLmi9vGY21B5lbgFwrGo2IgPuKjVhdy
         rS/O4t09NR6tUqrLVd2TnSFBfQ7Foi3Wt8ALG60XrXhI0YShawKUPlWSokL1WOJiHpkC
         2v/zYIf6rhh5cSGWLuP7jP/UwsGUV8dGNPlWWp+VfIe9VNMvUp9U7AZtAWEOi0cKcxcR
         kGqgaoCrEUbk1mObTDjv4/9PA6qQLvbdOEfhBC0Py4ilKJ/nnC8DShPcikFxBqr5Q1kv
         IN4w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m17-20020ae9e711000000b007670c6a9dd9si2119630qka.333.2023.09.01.02.45.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Sep 2023 02:45:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qc0gV-00034H-Al; Fri, 01 Sep 2023 05:43:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=SnXb=ER=kaod.org=clg@ozlabs.org>)
 id 1qc0gS-0002vk-55; Fri, 01 Sep 2023 05:43:20 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=SnXb=ER=kaod.org=clg@ozlabs.org>)
 id 1qc0gP-0003Bq-Ob; Fri, 01 Sep 2023 05:43:19 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4RcY4M3BJxz4x3F;
 Fri,  1 Sep 2023 19:43:15 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4RcY4K4nQcz4x2b;
 Fri,  1 Sep 2023 19:43:13 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 24/26] hw/sd: Add sd_cmd_SEND_TUNING_BLOCK() handler
Date: Fri,  1 Sep 2023 11:42:12 +0200
Message-ID: <20230901094214.296918-25-clg@kaod.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230901094214.296918-1-clg@kaod.org>
References: <20230901094214.296918-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=SnXb=ER=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: u7U3lijekgzM

From: Joel Stanley <joel@jms.id.au>

Signed-off-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/sd/sd.c | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index b46072424108..00a59450b726 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1062,6 +1062,22 @@ static sd_rsp_type_t sd_cmd_SEND_RELATIVE_ADDR(SDState *sd, SDRequest req)
     }
 }
 
+static sd_rsp_type_t sd_cmd_SEND_TUNING_BLOCK(SDState *sd, SDRequest req)
+{
+        if (sd->spec_version < SD_PHY_SPECv3_01_VERS) {
+            return sd_cmd_illegal(sd, req);
+        }
+
+        if (sd->state != sd_transfer_state) {
+            return sd_invalid_state_for_cmd(sd, req);
+        }
+
+        sd->state = sd_sendingdata_state;
+        sd->data_offset = 0;
+
+        return sd_r1;
+}
+
 static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
 {
     uint32_t rca = 0x0000;
@@ -1305,17 +1321,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         }
         break;
 
-    case 19:    /* CMD19: SEND_TUNING_BLOCK (SD) */
-        if (sd->spec_version < SD_PHY_SPECv3_01_VERS) {
-            return sd_invalid_state_for_cmd(sd, req);
-        }
-        if (sd->state == sd_transfer_state) {
-            sd->state = sd_sendingdata_state;
-            sd->data_offset = 0;
-            return sd_r1;
-        }
-        break;
-
     case 23:    /* CMD23: SET_BLOCK_COUNT */
         if (sd->spec_version < SD_PHY_SPECv3_01_VERS) {
             return sd_invalid_state_for_cmd(sd, req);
@@ -2152,6 +2157,7 @@ static const SDProto sd_proto_sd = {
         [2]         = sd_cmd_ALL_SEND_CID,
         [3]         = sd_cmd_SEND_RELATIVE_ADDR,
         [5]         = sd_cmd_illegal,
+        [19]        = sd_cmd_SEND_TUNING_BLOCK,
         [52 ... 54] = sd_cmd_illegal,
         [58]        = sd_cmd_illegal,
         [59]        = sd_cmd_illegal,
-- 
2.41.0

