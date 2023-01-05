Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp249085ejb;
        Thu, 5 Jan 2023 04:00:58 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuAf3JSbPdjkhgeprSRBZxTPlLJgwmXWYoifZP3AhsNGBowznCXiOUdpZl2p0qrNYaeMaFa
X-Received: by 2002:ac8:7615:0:b0:3a6:9622:ea85 with SMTP id t21-20020ac87615000000b003a69622ea85mr75279460qtq.54.1672920058274;
        Thu, 05 Jan 2023 04:00:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672920058; cv=none;
        d=google.com; s=arc-20160816;
        b=IIgA24h3a/xRF0X9uXf1TZBRd8gCyMXBMdnJ1MUVOXcB1xcsvPI7P4XCsFGPPDcQcn
         Su82/3/qtbb111TFirKgZeQtW501vl6xJ5IYTM0iIeYqRtgTLsKLRJ0Lb4xc3CXwqPOr
         G4dipKNLl4oevL5Iakyyf+yU4lkJn2Y8B34z8ueVFsgx1o0XfILvHpPvSr1kXSAkt8Yr
         m2r56PvGNUQcmSxy9U1pzECDgw/r7CuwGC8j4h9509TMb6mqEt55UEpmSwCDcn3CODq3
         KZmr8HTI1Tpn88zFJ1i6KioUkgOwrkuoljF1lhEJE+zu9DZZxOkuDp19rEwwA5ygcwRm
         KAoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=FLBwoZ+PyR5+42wvmYRbDRIloJHl/Ibdh6xLaaouHCE=;
        b=Ec2anL3dOykaPeieRMYHa5aHAHfiI7EeJ/fZwbmhpTMICBZ6xHqpfpkCYE0gtb+VL/
         pHRw5whhcmeKbSQUmN/eWnD4gopardHsE64MQYlIK15x56Wxld7uh1J1o4K+0ZHhb1l6
         Zp72Rb7F2GeupUBzeTL4P+iRvQ45bs5Aor/kU1qcq2ZTEiQ/s/+mtH8goTeLlG4bOTqV
         s4nP04PCHk/GX4Ptt4F9io+ueDg/igt/4tPReII+hUds91upWqiKabILJKwJhN42qtIr
         v+zaaNbwqXQwkpQcyhCCrx/ygZCBhR7TC36hgFSiwOFITTQDoXenSjdH77+IpC1NkWJ7
         czRA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d1-20020ac81181000000b003a7e5da777esi18746854qtj.206.2023.01.05.04.00.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Jan 2023 04:00:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pDOvE-0007zT-Je; Thu, 05 Jan 2023 07:00:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1pDOvB-0007yO-U9; Thu, 05 Jan 2023 07:00:33 -0500
Received: from [125.120.151.138] (helo=liuqiang-OptiPlex-7060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1pDOvA-0000CE-2C; Thu, 05 Jan 2023 07:00:33 -0500
Received: from localhost (liuqiang-OptiPlex-7060 [local])
 by liuqiang-OptiPlex-7060 (OpenSMTPD) with ESMTPA id 0a22dadd;
 Thu, 5 Jan 2023 11:53:46 +0000 (UTC)
From: Qiang Liu <cyruscyliu@gmail.com>
To: qemu-devel@nongnu.org
Cc: Qiang Liu <cyruscyliu@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:Xilinx ZynqMP and...)
Subject: [PATCH] hw/display/xlnx_dp: fix underflow in xlnx_dp_aux_pop_tx_fifo()
Date: Thu,  5 Jan 2023 19:53:38 +0800
Message-Id: <20230105115338.442479-1-cyruscyliu@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 125.120.151.138 (failed)
Received-SPF: softfail client-ip=125.120.151.138;
 envelope-from=cyruscyliu@gmail.com; helo=liuqiang-OptiPlex-7060
X-Spam_score_int: 48
X-Spam_score: 4.8
X-Spam_bar: ++++
X-Spam_report: (4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_ADSP_CUSTOM_MED=0.001,
 FORGED_GMAIL_RCVD=1, FREEMAIL_FROM=0.001, FSL_HELO_NON_FQDN_1=0.001,
 HELO_NO_DOMAIN=0.001, NML_ADSP_CUSTOM_MED=0.9, RCVD_IN_PBL=3.335,
 RDNS_NONE=0.793, SPF_SOFTFAIL=0.665, SPOOFED_FREEMAIL=0.001,
 SPOOFED_FREEMAIL_NO_RDNS=0.001, SPOOF_GMAIL_MID=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
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
X-TUID: O36l+Fr8O4H3

Fixes: 58ac482a66de ("introduce xlnx-dp")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1418
Reported-by: Qiang Liu <cyruscyliu@gmail.com>
Signed-off-by: Qiang Liu <cyruscyliu@gmail.com>
---
 hw/display/xlnx_dp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
index 407518c870..322e2faadd 100644
--- a/hw/display/xlnx_dp.c
+++ b/hw/display/xlnx_dp.c
@@ -520,6 +520,10 @@ static void xlnx_dp_aux_set_command(XlnxDPState *s, uint32_t value)
     case WRITE_AUX:
     case WRITE_I2C:
     case WRITE_I2C_MOT:
+        if (nbytes > fifo8_num_used(&s->tx_fifo)) {
+            qemu_log_mask(LOG_GUEST_ERROR, "xlnx_dp: TX length > fifo data length");
+            nbytes = fifo8_num_used(&s->tx_fifo);
+        }
         for (i = 0; i < nbytes; i++) {
             buf[i] = xlnx_dp_aux_pop_tx_fifo(s);
         }
-- 
2.25.1

