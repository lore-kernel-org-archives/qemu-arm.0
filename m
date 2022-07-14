Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp727655lfp;
        Thu, 14 Jul 2022 08:46:38 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vQntsZMF3zA78ZvVTtWnMHRjz2h8/6cMPjMGmKd16VCpn+me8ivDuMO8xlCEaSQb0ljTX2
X-Received: by 2002:a05:6214:2521:b0:472:f72b:a58f with SMTP id gg1-20020a056214252100b00472f72ba58fmr8320654qvb.97.1657813598444;
        Thu, 14 Jul 2022 08:46:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657813598; cv=none;
        d=google.com; s=arc-20160816;
        b=Tg53zNZVmeCbUsEmfjVfvgsglYVVao8qaXX+CQaMz8BZbGJoQeC7YFjtqypYS+2yLo
         DkRYLcX5y1kfoaOp+VCNSWBJ930dkwsZy5UvYglDulnrS+P45cf2s+z8Buj8dF/8AXJm
         vjhCNj64f8+VVc91V92X01B6p6X//G10h46eUHZF79HN3JT5htchY+bzJiTwlDNjUo6e
         ITlA7czHM/G69s0lRO6zWesmrrtr6JNEpZ9AHaEdcxZ1L8+9Pc0bUoBZQXBUioT1qrE7
         hYO8Ifr1bD0NjjeYnwDZgBovD5acmCY/SC4QX82AW30EidEsZvZgJq2bJEQD4eJqHJa7
         /8tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=CW4jPABm70pxmKsRQZs+n1DfNH0NV1KkWQmnTFUmgJA=;
        b=CFwC5C1K0JdfF5eo7iziqz5A2hCk/+5ITip7A6L9VgjXcnNxXWC5Sdxqbv04793A9z
         T1A1vreWMXNo2b3aMl2NBWd0wrmn0D3AyEilT6+JQVF6poIyLMR1Yo3AgSioxPtxb6YV
         r3UAdjRVdoZEdwAi5KIy4HU7FobqcEKP28NXkfKd9VZRUXPCXgTJM6Ru3T+1NefB8VLv
         ZVz59mU7X9re503wIKyPNBhNY8zJKP8ylHKOzHFsVtzpNVOxAnAvOMBkRQEbLt7CR8o+
         KGztGVTuB8ZBN2agOoAtZmoGHbBYWNTAUMU/sMuoPzp64/y1kGe6f8FnSuwL6laT8MLM
         FNTA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bb39-20020a05622a1b2700b0031ed2695f88si1051041qtb.565.2022.07.14.08.46.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Jul 2022 08:46:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oC12z-0005GH-T7
	for alex.bennee@linaro.org; Thu, 14 Jul 2022 11:46:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=QWOl=XT=kaod.org=clg@ozlabs.org>)
 id 1oC11f-0005FD-NW; Thu, 14 Jul 2022 11:45:17 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:36341
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=QWOl=XT=kaod.org=clg@ozlabs.org>)
 id 1oC11d-0000Vt-HU; Thu, 14 Jul 2022 11:45:14 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LkJj01rrQz4ySg;
 Fri, 15 Jul 2022 01:45:08 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LkJhy0w0hz4xj5;
 Fri, 15 Jul 2022 01:45:05 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Peter Delevoryas <pdel@fb.com>,
 Titus Rwantare <titusr@google.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 02/19] hw/i2c/pmbus: Add idle state to return 0xff's
Date: Thu, 14 Jul 2022 17:44:39 +0200
Message-Id: <20220714154456.2565189-3-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220714154456.2565189-1-clg@kaod.org>
References: <20220714154456.2565189-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=QWOl=XT=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_LOW=-0.7,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: deybl8mSCBR4

From: Peter Delevoryas <pdel@fb.com>

Signed-off-by: Peter Delevoryas <pdel@fb.com>
Reviewed-by: Titus Rwantare <titusr@google.com>
Message-Id: <20220701000626.77395-2-me@pjd.dev>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/i2c/pmbus_device.h | 7 +++++++
 hw/i2c/pmbus_device.c         | 9 +++++++++
 2 files changed, 16 insertions(+)

diff --git a/include/hw/i2c/pmbus_device.h b/include/hw/i2c/pmbus_device.h
index 0f4d6b3fada0..93f5d57c9dc6 100644
--- a/include/hw/i2c/pmbus_device.h
+++ b/include/hw/i2c/pmbus_device.h
@@ -155,6 +155,7 @@ enum pmbus_registers {
     PMBUS_MFR_MAX_TEMP_1            = 0xC0, /* R/W word */
     PMBUS_MFR_MAX_TEMP_2            = 0xC1, /* R/W word */
     PMBUS_MFR_MAX_TEMP_3            = 0xC2, /* R/W word */
+    PMBUS_IDLE_STATE                = 0xFF,
 };
 
 /* STATUS_WORD */
@@ -527,6 +528,12 @@ int pmbus_page_config(PMBusDevice *pmdev, uint8_t page_index, uint64_t flags);
  */
 void pmbus_check_limits(PMBusDevice *pmdev);
 
+/**
+ * Enter an idle state where only the PMBUS_ERR_BYTE will be returned
+ * indefinitely until a new command is issued.
+ */
+void pmbus_idle(PMBusDevice *pmdev);
+
 extern const VMStateDescription vmstate_pmbus_device;
 
 #define VMSTATE_PMBUS_DEVICE(_field, _state) {                       \
diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
index 749a33af827b..4071a88cfcd1 100644
--- a/hw/i2c/pmbus_device.c
+++ b/hw/i2c/pmbus_device.c
@@ -261,6 +261,11 @@ void pmbus_check_limits(PMBusDevice *pmdev)
     }
 }
 
+void pmbus_idle(PMBusDevice *pmdev)
+{
+    pmdev->code = PMBUS_IDLE_STATE;
+}
+
 /* assert the status_cml error upon receipt of malformed command */
 static void pmbus_cml_error(PMBusDevice *pmdev)
 {
@@ -980,6 +985,10 @@ static uint8_t pmbus_receive_byte(SMBusDevice *smd)
         }
         break;
 
+    case PMBUS_IDLE_STATE:
+        pmbus_send8(pmdev, PMBUS_ERR_BYTE);
+        break;
+
     case PMBUS_CLEAR_FAULTS:              /* Send Byte */
     case PMBUS_PAGE_PLUS_WRITE:           /* Block Write-only */
     case PMBUS_STORE_DEFAULT_ALL:         /* Send Byte */
-- 
2.35.3

