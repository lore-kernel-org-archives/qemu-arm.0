Received: by 2002:a17:907:76b5:b0:9a1:fa4e:495e with SMTP id jw21csp496402ejc;
        Fri, 1 Sep 2023 02:44:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHq9j01sNhA5v/3GZbREQqXDX9c7Yj7reR5VMRQYaSfu8nZcmDbBdz3Sl8BYzZoraQYHoHw
X-Received: by 2002:a0c:8d0a:0:b0:651:6545:c74d with SMTP id r10-20020a0c8d0a000000b006516545c74dmr1933765qvb.52.1693561469230;
        Fri, 01 Sep 2023 02:44:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693561469; cv=none;
        d=google.com; s=arc-20160816;
        b=V1OKxOLSnx8EEJQhY5mhOqswlpMky7JpufGDghtWxrE8tFnqVUP/lwTaa1UaTH5b+y
         adNfQ94Vh0CLfkiC7Z7dStwmBwuI6pwLTjSrskS04LydOkY7Bru4ubI7jaZWZ2juZ5x5
         Q6vXc+89sc8e6EIZK8b/65Wjp7mZKfWPbVnBijHFNZdXX+WjuaRVqU3jLd5MeJAkh2ng
         10uGbMwMf7W5KJg59xa30yIofbddhAzWGBa5W7N+er1i1/xps4WIkfZ2igtOsYwJjTJV
         xzRA6r7ClqcN0x00rGpcLReCxwZSxwAa3cryNhrSIhKHnrffdBVotm5pprsF5Y5g6DbI
         Ky/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=iNCZyiLgNI7Uv3B2DtI+CbxKLRcsCcU5ZsEydQgu5gc=;
        fh=0FldW4XPCIVeBr3v546UBzvfCk0aVDrArGpyFJOOCns=;
        b=UZO+7R10NBmNnpUCoDP0gPe57UBYbbcn+onrNbgtSr2IR+dxCT33Ff8y6CnoDedUoC
         vOD8qLFyo0xZ2sCUq4UeIJqHY01C3ih2ItY1VecqxzyWO3S6ir++5ZIOTqMuXtVkcUUH
         y1KoRO739TPb4DoUpaS3m2N9ejei3JwtrL1MTUY9ADXIAD0oZdfVEhduf5Xz57+Qzkqv
         P41snBotOoban8SKJ76Nc22aSBQ6v47X8FCBfk7m69bxbzeNpSSD2p7So8kwTTZ03R9T
         Z9+rLzC8m5CDd5csl6V+jGcMz1eOnl8gGYeakhEqttIz9cEh0ckJ6+Smt9+q8NjNZjHU
         OycQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i9-20020a0cf109000000b0064f4fff8b43si2035245qvl.130.2023.09.01.02.44.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Sep 2023 02:44:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qc0gK-0002ct-J5; Fri, 01 Sep 2023 05:43:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=SnXb=ER=kaod.org=clg@ozlabs.org>)
 id 1qc0gF-0002Gi-Tq; Fri, 01 Sep 2023 05:43:08 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=SnXb=ER=kaod.org=clg@ozlabs.org>)
 id 1qc0gD-00032X-9o; Fri, 01 Sep 2023 05:43:07 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4RcY482Rxyz4wy9;
 Fri,  1 Sep 2023 19:43:04 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4RcY465tcsz4x2n;
 Fri,  1 Sep 2023 19:43:02 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 19/26] hw/sd: Add sd_cmd_unimplemented() handler
Date: Fri,  1 Sep 2023 11:42:07 +0200
Message-ID: <20230901094214.296918-20-clg@kaod.org>
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
X-TUID: mpxy/jP8qW9D

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[ clg: Fix redundant assignment of .cmd ]
Message-Id: <20210624142209.1193073-7-f4bug@amsat.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/sd/sd.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 83a0d6825147..e88bfcb8c802 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1011,6 +1011,15 @@ static sd_rsp_type_t sd_cmd_illegal(SDState *sd, SDRequest req)
     return sd_illegal;
 }
 
+/* Commands that are recognised but not yet implemented. */
+static sd_rsp_type_t sd_cmd_unimplemented(SDState *sd, SDRequest req)
+{
+    qemu_log_mask(LOG_UNIMP, "%s: CMD%i not implemented\n",
+                  sd_proto(sd)->name, req.cmd);
+
+    return sd_illegal;
+}
+
 static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
 {
     uint32_t rca = 0x0000;
@@ -1565,9 +1574,6 @@ static sd_rsp_type_t sd_app_command(SDState *sd,
 
     switch (req.cmd) {
     case 6:  /* ACMD6:  SET_BUS_WIDTH */
-        if (sd->spi) {
-            goto unimplemented_spi_cmd;
-        }
         switch (sd->state) {
         case sd_transfer_state:
             sd->sd_status[0] &= 0x3f;
@@ -1698,12 +1704,6 @@ static sd_rsp_type_t sd_app_command(SDState *sd,
     default:
         /* Fall back to standard commands.  */
         return sd_normal_command(sd, req);
-
-    unimplemented_spi_cmd:
-        /* Commands that are recognised but not yet implemented in SPI mode.  */
-        qemu_log_mask(LOG_UNIMP, "SD: CMD%i not implemented in SPI mode\n",
-                      req.cmd);
-        return sd_illegal;
     }
 
     qemu_log_mask(LOG_GUEST_ERROR, "SD: ACMD%i in a wrong state\n", req.cmd);
@@ -2139,6 +2139,9 @@ static const SDProto sd_proto_spi = {
         [26]        = sd_cmd_illegal,
         [52 ... 54] = sd_cmd_illegal,
     },
+    .acmd = {
+        [6]         = sd_cmd_unimplemented,
+    },
 };
 
 static const SDProto sd_proto_sd = {
-- 
2.41.0

