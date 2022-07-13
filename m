Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp69190lfp;
        Wed, 13 Jul 2022 00:54:08 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vdg4WJCcx1a9h/qLPMyIRdQJ8Vu3GmUi9IqfHv3ZzNECKlIKTqDH8dZMYxQz9ykL/R+tkN
X-Received: by 2002:a05:622a:189a:b0:31e:b7fd:de10 with SMTP id v26-20020a05622a189a00b0031eb7fdde10mr1753569qtc.290.1657698848303;
        Wed, 13 Jul 2022 00:54:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657698848; cv=none;
        d=google.com; s=arc-20160816;
        b=NgXUwqzVnUQhCRwP4Km2OtCeQNcD9P36N1qcrcLoragsk/2eQXgVXmH72L2iCeRlfi
         CPfA0XdyKiV94RnFz0wFCA0Z1JMuOv92fwFV9XDN7ZJmoQ4BOT0Qtg7OhmuRVOkmtAeR
         ZJIP6CUSRp8v18QYSlOhrO0CvDE+3Fd5F5fDltvy62bDUQTneo1REyMVJkwlaVFb6MH/
         /scrHEtI0Kyn83hOZ3UcuTHfHEPDka0OFq/jJfFmcnfRLkv2PWuBrjou8YYstIj2kemR
         qM3GCRRnVQDJ9O19etYuKXrtJFGD+dN553LyI77R/QDINk/o7ExM8l0Jn+8zurVRD+5m
         flFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=CW4jPABm70pxmKsRQZs+n1DfNH0NV1KkWQmnTFUmgJA=;
        b=zb/chfahw+Tr05jzBsmcV8QaO0biQJyXEBtsM2VQjcTsDlPiSDOrKL7v50sDMnGHo3
         uM3QHAd1wsXiBH6iv4r1XbjGy6iam3yqbhS9+5IPBPjGrAnpeks0ErDTd4D2+CSIq26o
         U0nVBnpzpCHnQnqSSQyxyNXsYtAg1BAsMFsGmeZ04X4bvXVYYd8qF6+0NsHDoJ6+u3/N
         sBWb18AvZKN4b9cX4e5gi7YAkKXYFpzWRT4XPQO7PU78eXWNfrdoBXeYp/WUToMAeMlz
         5xhHUJlSd8KTAI6O5DGTcc6igPyhnI5mso+aOgHwESyAdECksAfaaQyJ/lKZsIWffPJP
         inVA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t2-20020a05621421a200b0045a85f98984si6630419qvc.11.2022.07.13.00.54.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Jul 2022 00:54:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oBXCB-0007pD-Ql
	for alex.bennee@linaro.org; Wed, 13 Jul 2022 03:54:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=zHgX=XS=kaod.org=clg@ozlabs.org>)
 id 1oBXBL-0007ns-2a; Wed, 13 Jul 2022 03:53:15 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:47885
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=zHgX=XS=kaod.org=clg@ozlabs.org>)
 id 1oBXBJ-0002XC-5e; Wed, 13 Jul 2022 03:53:14 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LjVGs5NZPz4ySg;
 Wed, 13 Jul 2022 17:53:09 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LjVGq2MD2z4ySW;
 Wed, 13 Jul 2022 17:53:07 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Delevoryas <pdel@fb.com>, Titus Rwantare <titusr@google.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 02/19] hw/i2c/pmbus: Add idle state to return 0xff's
Date: Wed, 13 Jul 2022 09:52:38 +0200
Message-Id: <20220713075255.2248923-3-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220713075255.2248923-1-clg@kaod.org>
References: <20220713075255.2248923-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=zHgX=XS=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
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
X-TUID: 6BjrHEx2gRF/

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

