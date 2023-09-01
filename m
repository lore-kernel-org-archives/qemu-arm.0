Received: by 2002:a17:907:76b5:b0:9a1:fa4e:495e with SMTP id jw21csp497025ejc;
        Fri, 1 Sep 2023 02:45:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHj9m0/gW4ZS3sRZMlwwc+vmuNJ7AXJH9M/+qBYjnzpkIg9dQcgnTTOvZKXyU1Ab2Js3Ajo
X-Received: by 2002:ac8:580f:0:b0:403:a9aa:56d6 with SMTP id g15-20020ac8580f000000b00403a9aa56d6mr2663513qtg.58.1693561544840;
        Fri, 01 Sep 2023 02:45:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693561544; cv=none;
        d=google.com; s=arc-20160816;
        b=kBpGm+zpHJ/XBlxmLcglwPWPaoR8ibZPPC7YH4/6Qz/AcO0zctFVDA7pcbonTK8B84
         ZOdcwOXdPL1ELYoF9gQmqMvDcBw8ziowU+Ti6tPmvhDOCD6yyDhUpFKCzrKba8oPw2z8
         85G7t56B0wAmRGTv1OL1Ga1W2GJKke2lTGanximLs8Si2YdnwkKaFU9Q6cIE9CWmRtBE
         Vp1+u51SVBkxzigKDi3OZ2v1waYRThefzUSZPEQ1Fbol2hl8K4sTJrc+R9sQFnk3PFr7
         Es8FS1mss1Npqk6GccyzujuYNIzanDm5h2imq4stlQWYHMMdJtjZ0DExr+BOT4JKtvwn
         fdXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=laSCXRuI0WgUEvINvw9vpQy5W/8jzIb8mbvxlhYEp5w=;
        fh=sAFxsovMRUpeK1m2ZrUTkWk2zuchzNgVidyR5jMbIm8=;
        b=t6Rf1p8tW3krOAJqegYuDgtW9YYSJnZa+4SwLtQM4UOg4d4HdK39+S5YQ1J5mu1AHe
         1GVntf68VZ6L2hpTshjehdlA+9hXZ8lUvU5xNZSuXZFExrlgOHYHYsGthNixnmzuSMZK
         6kql0xJfYyT4EXLl6Ff/kIOOShisgITfE0E70y3lbg53WzkjXyc8TyEhv9OTG9Zk9cvx
         322pwB61YtOulbCYaIMnnfwkVva0Ddgma5P5Jepg0iJDzKLDZ3w2620gFu3VmRTbm1r8
         V2EBRd6nUAWJ90dnxB/tvE16nCh2/q+K3iUPbzwx0HPIvyC/Soozi2/tLKtDZoUI+sqY
         Zifw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d12-20020ac85acc000000b004039e75c91csi2165841qtd.345.2023.09.01.02.45.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Sep 2023 02:45:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qc0gV-00035P-M7; Fri, 01 Sep 2023 05:43:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=SnXb=ER=kaod.org=clg@ozlabs.org>)
 id 1qc0gU-00032r-0n; Fri, 01 Sep 2023 05:43:22 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=SnXb=ER=kaod.org=clg@ozlabs.org>)
 id 1qc0gF-000398-Ks; Fri, 01 Sep 2023 05:43:21 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4RcY4B4Pgbz4x2W;
 Fri,  1 Sep 2023 19:43:06 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4RcY48629Qz4wy6;
 Fri,  1 Sep 2023 19:43:04 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 20/26] hw/sd: Add sd_cmd_GO_IDLE_STATE() handler
Date: Fri,  1 Sep 2023 11:42:08 +0200
Message-ID: <20230901094214.296918-21-clg@kaod.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230901094214.296918-1-clg@kaod.org>
References: <20230901094214.296918-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=SnXb=ER=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
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
X-TUID: lrXe8lRUWJQT

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-Id: <20210624142209.1193073-8-f4bug@amsat.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/sd/sd.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index e88bfcb8c802..535b72ff5c2a 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1020,6 +1020,16 @@ static sd_rsp_type_t sd_cmd_unimplemented(SDState *sd, SDRequest req)
     return sd_illegal;
 }
 
+static sd_rsp_type_t sd_cmd_GO_IDLE_STATE(SDState *sd, SDRequest req)
+{
+    if (sd->state != sd_inactive_state) {
+        sd->state = sd_idle_state;
+        sd_reset(DEVICE(sd));
+    }
+
+    return sd->spi ? sd_r1 : sd_r0;
+}
+
 static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
 {
     uint32_t rca = 0x0000;
@@ -1059,18 +1069,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
 
     switch (req.cmd) {
     /* Basic commands (Class 0 and Class 1) */
-    case 0:  /* CMD0:   GO_IDLE_STATE */
-        switch (sd->state) {
-        case sd_inactive_state:
-            return sd->spi ? sd_r1 : sd_r0;
-
-        default:
-            sd->state = sd_idle_state;
-            sd_reset(DEVICE(sd));
-            return sd->spi ? sd_r1 : sd_r0;
-        }
-        break;
-
     case 1:  /* CMD1:   SEND_OP_CMD */
         sd->state = sd_transfer_state;
         return sd_r1;
@@ -2132,6 +2130,7 @@ void sd_enable(SDState *sd, bool enable)
 static const SDProto sd_proto_spi = {
     .name = "SPI",
     .cmd = {
+        [0]         = sd_cmd_GO_IDLE_STATE,
         [2 ... 4]   = sd_cmd_illegal,
         [5]         = sd_cmd_illegal,
         [7]         = sd_cmd_illegal,
@@ -2147,6 +2146,7 @@ static const SDProto sd_proto_spi = {
 static const SDProto sd_proto_sd = {
     .name = "SD",
     .cmd = {
+        [0]         = sd_cmd_GO_IDLE_STATE,
         [1]         = sd_cmd_illegal,
         [5]         = sd_cmd_illegal,
         [52 ... 54] = sd_cmd_illegal,
-- 
2.41.0

