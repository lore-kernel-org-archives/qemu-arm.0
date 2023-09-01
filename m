Received: by 2002:a17:907:76b5:b0:9a1:fa4e:495e with SMTP id jw21csp496046ejc;
        Fri, 1 Sep 2023 02:43:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHof7oTOXDsTE4ME8f8akS19Hyq9ntMeI/e5G2l2Gm09Y7NQR9yKVRPEzlgg8N4/p4U8yI9
X-Received: by 2002:a0c:e043:0:b0:641:8bf9:e0ec with SMTP id y3-20020a0ce043000000b006418bf9e0ecmr1936048qvk.0.1693561427742;
        Fri, 01 Sep 2023 02:43:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693561427; cv=none;
        d=google.com; s=arc-20160816;
        b=xyIkCPPbZiXHuFpC+zBBIp5PBotaicwh+n+bZqYiQ8GhmBzelvK2Mcn1yiObAu+o9s
         KiwIKQS3hH+3PMnH5DkNc09UQ64mQJesduvqkn02ALd67aC1C4cSeQDeRYZQ4Op4nWmp
         29ea5gjTsovsjsOcHdk+im1njStFPshZTbAteHM5RIA7zY+WpkSHbCr/IVySCYCayYLR
         GOIWgJcPkD8k5VpIhbknTPECvmVmGVvrgAxs1rYs6ve4vQPNB2Cew4VoaVeMFONo2uiD
         jLzem27oCsuAsmW9YRqnSIqvzDY3tVxdCnatMif3O65ZD01V00NynuWYaUiuk6hyDkLG
         QnKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=MeJFAgG4cWqAaKn+PJeZ1uhoAB5/zbA2L09zHFX4XaY=;
        fh=sAFxsovMRUpeK1m2ZrUTkWk2zuchzNgVidyR5jMbIm8=;
        b=TonUpwJ0o0dknytmQJbz5EORf8kfYE9pdt2NJi7vVES22kDlzEOSjHMQ0giY2Iiv1b
         pM6qNKsQyHXp3iLaLO2YX0OdLrVinuVU/OodMrID8jt+bNVSKdyBm/oNgukmdH1QNlxc
         sTXTvH6I1er9NymU3tlYPvV05gSXoVWS0QacyUAWppP1mvcmeChwuzxceN4EkIhF1/i8
         msg9ruU79Rkh2Dzhvjj62INeh6wcMXcCkN02EELSsV4BYpY3FIu8hIWJ3DjlYipYFKPS
         x4T6+jMzcYoTiD/W3UqV1u6m2iszbqbmhfWC+l408RDEuYTrHYltonnsKQSK9ph/ZmMi
         wfiA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q10-20020a0c8cca000000b0064a4279495esi2047570qvb.507.2023.09.01.02.43.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Sep 2023 02:43:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qc0gF-0002GA-OU; Fri, 01 Sep 2023 05:43:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=SnXb=ER=kaod.org=clg@ozlabs.org>)
 id 1qc0gB-00025F-QG; Fri, 01 Sep 2023 05:43:04 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=SnXb=ER=kaod.org=clg@ozlabs.org>)
 id 1qc0g9-00032X-0J; Fri, 01 Sep 2023 05:43:03 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4RcY440NVqz4wy9;
 Fri,  1 Sep 2023 19:43:00 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4RcY4221q3z4x2D;
 Fri,  1 Sep 2023 19:42:58 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 17/26] hw/sd: Introduce sd_cmd_handler type
Date: Fri,  1 Sep 2023 11:42:05 +0200
Message-ID: <20230901094214.296918-18-clg@kaod.org>
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
X-TUID: OEB2q5/xMmDT

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Add 2 command handler arrays in SDProto, for CMD and ACMD.
Have sd_normal_command() / sd_app_command() use these arrays:
if an command handler is registered, call it, otherwise fall
back to current code base.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-Id: <20210624142209.1193073-5-f4bug@amsat.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/sd/sd.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index f6aa3b0a80bf..889c44a5c07c 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -87,8 +87,12 @@ enum SDCardStates {
     sd_disconnect_state,
 };
 
+typedef sd_rsp_type_t (*sd_cmd_handler)(SDState *sd, SDRequest req);
+
 typedef struct SDProto {
     const char *name;
+    sd_cmd_handler cmd[SDMMC_CMD_MAX];
+    sd_cmd_handler acmd[SDMMC_CMD_MAX];
 } SDProto;
 
 struct SDState {
@@ -1031,6 +1035,10 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         return sd_illegal;
     }
 
+    if (sd_proto(sd)->cmd[req.cmd]) {
+        return sd_proto(sd)->cmd[req.cmd](sd, req);
+    }
+
     switch (req.cmd) {
     /* Basic commands (Class 0 and Class 1) */
     case 0:  /* CMD0:   GO_IDLE_STATE */
@@ -1575,6 +1583,11 @@ static sd_rsp_type_t sd_app_command(SDState *sd,
     trace_sdcard_app_command(sd_proto(sd)->name, sd_acmd_name(req.cmd),
                              req.cmd, req.arg, sd_state_name(sd->state));
     sd->card_status |= APP_CMD;
+
+    if (sd_proto(sd)->acmd[req.cmd]) {
+        return sd_proto(sd)->acmd[req.cmd](sd, req);
+    }
+
     switch (req.cmd) {
     case 6:  /* ACMD6:  SET_BUS_WIDTH */
         if (sd->spi) {
-- 
2.41.0

