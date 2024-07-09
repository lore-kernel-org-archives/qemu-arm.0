Received: by 2002:a05:7022:1005:b0:83:cb6b:1575 with SMTP id em5csp1559794dlb;
        Tue, 9 Jul 2024 08:27:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVv9xlalvIffydsVYzbX0e8NxnBv//HOD56IP3BaaC1MgyEXMbo3B0CtWbzCvZEpuqyeoGTkkyWPw6O/3ymGGpsAzT1mz5t
X-Google-Smtp-Source: AGHT+IEzdqWrM+mC77ua7IjM3vsqYc1ZA8dUSncDG9kn+QGWQxQRhCQsuwKb8x9t7qO/2vezSVCC
X-Received: by 2002:a05:6102:2b8a:b0:48c:3e33:998f with SMTP id ada2fe7eead31-4903221f439mr3574405137.31.1720538842147;
        Tue, 09 Jul 2024 08:27:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720538842; cv=none;
        d=google.com; s=arc-20160816;
        b=fXSlyFYJNiQKTtPyfZ07pnf/Ss/NhTCXAspGdnpb07b348RIT2Z0119TITQyiv2MTU
         yBRl/pVHY02DiskdH9DkSU/1/ueVD7lVpvuf9S1PoBFmv4HV5qfc5IgngO4tVIZ4TA6f
         tHmRC19kXwIUu8j4JY4t/3xu+fqCyAlT4wDxcatZbH9SvnnTL5PF3GxOif71bPqjG73T
         jmfgWIiH8U5fymGMGYEXFSzoFnnlFmqelem1NXB/XrHdvklkAx7+EIlobjiGROT+5Gq8
         asxcgpkwVPHIab2YEZ9D6guXJngNNpq2fjKM8Vu0Mf6t19xoVRb6YiAQJkFUANiDLbH9
         MTmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=bwlDS3Fem601L5/uj6bQqEPalzfsgOLIBKrXuQLdMJU=;
        fh=FTbbPrkcFOTABrhnlIgLgb2V+67s1XK5x7UnuAmZO6s=;
        b=XuSt+egH+5uu1QEa7wZFKp4obNLJJfJqquHDUVBcUugY0Y6bAGhcbYJ7vR/P77LjM3
         NHdjjXLa6v7SwEhPuI0U7kFr+r3ZmuguIG9DrO///W6KHRKxQyBkuUhUEI9XdgsN3w72
         BDqq8y4DwQKvNo0ZlNgln6ROgrrodXMAnIzn+hgzyEOX7tvhutmY1mYWQ6RzegzP/kiO
         j7VsMZAgYuKsK+y4TDsyBdb6tvKksRYT37nukK3dJ2eTOxp1EQe3nAOcGi9tpQJtuvi0
         d0BgEOEX79NxbNn3FesXY1xklMzKdfCw7woMFeSm3uzarYH4l7zpErhPxxwwEfXL/wFM
         /LFg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FjYgybO3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-490315409b8si342111137.220.2024.07.09.08.27.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jul 2024 08:27:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FjYgybO3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sRCkB-0005y5-3y; Tue, 09 Jul 2024 11:27:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sRCk8-0005jL-Ru
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 11:27:00 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sRCk6-0006JQ-SE
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 11:27:00 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4266ea6a412so11480245e9.1
 for <qemu-arm@nongnu.org>; Tue, 09 Jul 2024 08:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720538816; x=1721143616; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bwlDS3Fem601L5/uj6bQqEPalzfsgOLIBKrXuQLdMJU=;
 b=FjYgybO3Sjth2k4OcmUcrv8Qh0KXzPAJniD0aHyIIrE/b9vUfPpka3LgAEyR8KxPGD
 +UVBbtt246ubUA5crTU4BhgOKDABGM4RX5LdVBnCPYafeWYjQPK2Vs2C6jq8atBiMlM8
 d96NGOFiu3doqTpdrZXiJ5ui5ODs4kfvDx4hGfU8RF9nCI4a7/hq/5Gf0i4Y5McoLL+p
 ZfiU2WvW1gzCMd88NcrZbcsw5gN8pPg9Ey9u5nvnlC/P74rr7M6XLGMovoV64sj8hPAF
 TnfV/tuoKfh1AsCaa96Ve3lx9Hui9zHAv8UaBvAcRdkdJkm66G+Qb7htKvl3V11PSFav
 gyKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720538816; x=1721143616;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bwlDS3Fem601L5/uj6bQqEPalzfsgOLIBKrXuQLdMJU=;
 b=r9OZhiY05rE55mxohzlm9cPoe0vW5fEwUmIZHJGtmdfIoaLh3LdGkyAQ+CjkSavXjg
 szioi3U6D8aqOnWbJsDfz3sYUxJQHWIFcprOw9JX8zyU8omKNpZRDYtcvLO2ymBDRP/l
 Qad2WJ408p+WzwvueiECtRRgIr15tZBdflD6cjK6QrxTxagVseMPHvGcFLMcMg0Z0LND
 HnANF9+nyw0EDzPZzMX1skAiLWO+3k4k64hYO50sNieuXuzYbq6HsoPjlJWVqX1hsmdw
 eUu0q74b1yt+PiRDGM5Xai/BNfiXUr1SUrasMg2g9vraOvNrqn9vcLtkH/lLWXNBGu5u
 HSqQ==
X-Gm-Message-State: AOJu0YzuR5jyb67R/mTKUrAEB2WizW0toXUTgdN1S1eiSl5bfSheDeN6
 ItI19jgiwSg441W1w/zr7tCF/Ul4CHLJYsLJrwJ5xFzKzkceZnPAOlb0SOIHH9vgtIocRFcdXsj
 A
X-Received: by 2002:a05:600c:2112:b0:426:6416:aa7a with SMTP id
 5b1f17b1804b1-426708f06damr23851025e9.34.1720538816441; 
 Tue, 09 Jul 2024 08:26:56 -0700 (PDT)
Received: from m1x-phil.lan (vau06-h02-176-184-43-20.dsl.sta.abo.bbox.fr.
 [176.184.43.20]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4266857c28esm98167515e9.2.2024.07.09.08.26.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 09 Jul 2024 08:26:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, qemu-block@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Bin Meng <bmeng.cn@gmail.com>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Luc Michel <luc.michel@amd.com>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v47 09/19] hw/sd/sdcard: Implement eMMC sleep state (CMD5)
Date: Tue,  9 Jul 2024 17:25:46 +0200
Message-ID: <20240709152556.52896-10-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240709152556.52896-1-philmd@linaro.org>
References: <20240709152556.52896-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: 5xbh0/4TjUiy

From: Luc Michel <luc.michel@amd.com>

The JEDEC standards specifies a sleep state where the eMMC won't answer
any command appart from RESET and WAKEUP and go to low power state.
Implement this state and the corresponding command number 5.

Signed-off-by: Luc Michel <luc.michel@amd.com>
Signed-off-by: Francisco Iglesias <francisco.iglesias@amd.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Cédric Le Goater <clg@redhat.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Message-Id: <20240628070216.92609-90-philmd@linaro.org>
---
 hw/sd/sd.c | 47 +++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 45 insertions(+), 2 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 05c1b85476..adba53e822 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1236,8 +1236,19 @@ static sd_rsp_type_t sd_cmd_to_sendingdata(SDState *sd, SDRequest req,
 /* CMD0 */
 static sd_rsp_type_t sd_cmd_GO_IDLE_STATE(SDState *sd, SDRequest req)
 {
-    sd->state = sd_idle_state;
-    sd_reset(DEVICE(sd));
+    if (sd->state == sd_sleep_state) {
+        switch (req.arg) {
+        case 0x00000000:
+        case 0xf0f0f0f0:
+            break;
+        default:
+            return sd_r0;
+        }
+    }
+    if (sd->state != sd_inactive_state) {
+        sd->state = sd_idle_state;
+        sd_reset(DEVICE(sd));
+    }
 
     return sd_is_spi(sd) ? sd_r1 : sd_r0;
 }
@@ -1294,6 +1305,30 @@ static sd_rsp_type_t emmc_cmd_SET_RELATIVE_ADDR(SDState *sd, SDRequest req)
     }
 }
 
+/* CMD5 */
+static sd_rsp_type_t emmc_cmd_sleep_awake(SDState *sd, SDRequest req)
+{
+    bool do_sleep = extract32(req.arg, 15, 1);
+
+    switch (sd->state) {
+    case sd_sleep_state:
+        if (!do_sleep) {
+            /* Awake */
+            sd->state = sd_standby_state;
+        }
+        return sd_r1b;
+
+    case sd_standby_state:
+        if (do_sleep) {
+            sd->state = sd_sleep_state;
+        }
+        return sd_r1b;
+
+    default:
+        return sd_invalid_state_for_cmd(sd, req);
+    }
+}
+
 /* CMD6 */
 static sd_rsp_type_t sd_cmd_SWITCH_FUNCTION(SDState *sd, SDRequest req)
 {
@@ -1696,6 +1731,7 @@ static sd_rsp_type_t sd_cmd_APP_CMD(SDState *sd, SDRequest req)
     case sd_ready_state:
     case sd_identification_state:
     case sd_inactive_state:
+    case sd_sleep_state:
         return sd_invalid_state_for_cmd(sd, req);
     case sd_idle_state:
         if (!sd_is_spi(sd) && sd_req_get_rca(sd, req) != 0x0000) {
@@ -2018,6 +2054,12 @@ int sd_do_command(SDState *sd, SDRequest *req,
         req->cmd &= 0x3f;
     }
 
+    if (sd->state == sd_sleep_state && req->cmd) {
+        qemu_log_mask(LOG_GUEST_ERROR, "SD: Card is sleeping\n");
+        rtype = sd_r0;
+        goto send_response;
+    }
+
     if (sd->card_status & CARD_IS_LOCKED) {
         if (!cmd_valid_while_locked(sd, req->cmd)) {
             sd->card_status |= ILLEGAL_COMMAND;
@@ -2467,6 +2509,7 @@ static const SDProto sd_proto_emmc = {
         [2]  = {0,  sd_bcr,  "ALL_SEND_CID", sd_cmd_ALL_SEND_CID},
         [3]  = {0,  sd_ac,   "SET_RELATIVE_ADDR", emmc_cmd_SET_RELATIVE_ADDR},
         [4]  = {0,  sd_bc,   "SEND_DSR", sd_cmd_unimplemented},
+        [5]  = {0,  sd_ac,   "SLEEP/AWAKE", emmc_cmd_sleep_awake},
         [7]  = {0,  sd_ac,   "(DE)SELECT_CARD", sd_cmd_DE_SELECT_CARD},
         [9]  = {0,  sd_ac,   "SEND_CSD", sd_cmd_SEND_CSD},
         [10] = {0,  sd_ac,   "SEND_CID", sd_cmd_SEND_CID},
-- 
2.41.0

