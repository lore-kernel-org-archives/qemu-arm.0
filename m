Received: by 2002:a17:907:76b5:b0:9a1:fa4e:495e with SMTP id jw21csp496432ejc;
        Fri, 1 Sep 2023 02:44:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuFXj7w8iHqEX2Y9A/UEq1oa9dvQt8BieK3Nxo+jxxffV/Z2j+SzhDH3Spcjhfp+A2hyQg
X-Received: by 2002:a0c:f4d2:0:b0:647:2f8f:8c29 with SMTP id o18-20020a0cf4d2000000b006472f8f8c29mr1700885qvm.48.1693561472865;
        Fri, 01 Sep 2023 02:44:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693561472; cv=none;
        d=google.com; s=arc-20160816;
        b=sZshrpnszRxArPmVFDskTPNtpB0VPqqXW/A4qH83tJXXfi+t+q7eFQEhAhH2xD9LRy
         DZowxGaush55p7l8t7XNO7xfG95zTXfqbdBhw6LUR2VvvGoxjPXL3xA3CljJXOOZrty5
         DmsSVWExPVzMVpm+leM4Y2Eyj3gsM33jNWeGoAfK6/TJdFtCEhfDfBkn8aEwOY5SPrEm
         +Et7miIvVo+lL04mBPAgGFjOSX8i5k3h3FXEEOF+lvRgjyJT+oCdoB8X5ilqXVDunHEs
         IU4/ZMOeTmUQeg0c0Lwb+/bJpqa9RKGfP7+L0oXcoktjdVFw0ngvOyTq7W/1s09DKFDm
         cmjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=1BLIrNyVfCivsjfZ5ORSKPavJojsslslzD2FBIGPVoY=;
        fh=0FldW4XPCIVeBr3v546UBzvfCk0aVDrArGpyFJOOCns=;
        b=ZKlY53j5Q3CqJEKEHneFUnZgMlD2+Z3BFcI8DW02wNhXEhOBtEPER+EocylyhEBK+P
         k9TSYq0lzbxJYjVZGl5oRHOXqhRxjJ66ScQsku1stnsQ2nSeeKoH/LAfP8fYdffkukXO
         Ir8bknzPV8x3Pv7iV0b0iOLofx9F4FDUXOWzu/wxHm045MYAJmdrHBvcxdRVNQJMPCa6
         pdpzeG5isIYSppeWUZrwyDLZRF+d1lECMUsMZKqSiFhpHXgUmUY3NMfZyAFnMkfmzl/w
         Iy69lQWI+CDSdAR74ucc61M6bi10BHvI7q47sF+nzeD4JKSWxMqUbU7BF+/xWsYKKdhh
         Ha/w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dp14-20020a05620a2b4e00b0076da7b8732bsi2199782qkb.175.2023.09.01.02.44.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Sep 2023 02:44:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qc0gI-0002WG-RA; Fri, 01 Sep 2023 05:43:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=SnXb=ER=kaod.org=clg@ozlabs.org>)
 id 1qc0g8-000206-Td; Fri, 01 Sep 2023 05:43:00 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=SnXb=ER=kaod.org=clg@ozlabs.org>)
 id 1qc0g5-00032X-GX; Fri, 01 Sep 2023 05:42:59 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4RcY3z3gK2z4wy6;
 Fri,  1 Sep 2023 19:42:55 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4RcY3x75Njz4x2D;
 Fri,  1 Sep 2023 19:42:53 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 15/26] hw/sd: When card is in wrong state,
 log which spec version is used
Date: Fri,  1 Sep 2023 11:42:03 +0200
Message-ID: <20230901094214.296918-16-clg@kaod.org>
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
X-TUID: VKm19jNS8COg

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Add the sd_version_str() helper.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/sd/sd.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 4412559c05be..20e62aff70b6 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -145,6 +145,19 @@ struct SDState {
 
 static void sd_realize(DeviceState *dev, Error **errp);
 
+static const char *sd_version_str(enum SDPhySpecificationVersion version)
+{
+    static const char *sdphy_version[] = {
+        [SD_PHY_SPECv1_10_VERS]     = "v1.10",
+        [SD_PHY_SPECv2_00_VERS]     = "v2.00",
+        [SD_PHY_SPECv3_01_VERS]     = "v3.01",
+    };
+    if (version >= ARRAY_SIZE(sdphy_version)) {
+        return "unsupported version";
+    }
+    return sdphy_version[version];
+}
+
 static const char *sd_state_name(enum SDCardStates state)
 {
     static const char *state_name[] = {
@@ -968,8 +981,9 @@ static bool address_in_range(SDState *sd, const char *desc,
 
 static sd_rsp_type_t sd_invalid_state_for_cmd(SDState *sd, SDRequest req)
 {
-    qemu_log_mask(LOG_GUEST_ERROR, "SD: CMD%i in a wrong state: %s\n",
-                  req.cmd, sd_state_name(sd->state));
+    qemu_log_mask(LOG_GUEST_ERROR, "SD: CMD%i in a wrong state: %s (spec %s)\n",
+                  req.cmd, sd_state_name(sd->state),
+                  sd_version_str(sd->spec_version));
 
     return sd_illegal;
 }
-- 
2.41.0

