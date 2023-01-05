Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp286561ejb;
        Thu, 5 Jan 2023 04:58:27 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt5/4WtJzRA+pW7FPUDDqIC0NjTxn2aI3POQKcp7HBjat8Bv/HKh5V1JpDAajDkA2Qpc0aM
X-Received: by 2002:ac8:7758:0:b0:39c:da21:f1a2 with SMTP id g24-20020ac87758000000b0039cda21f1a2mr72286305qtu.3.1672923506906;
        Thu, 05 Jan 2023 04:58:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672923506; cv=none;
        d=google.com; s=arc-20160816;
        b=IQVu3Ebf7AmaXtrLixp4enQKtpNhA9W/3ioyTmniqiXakqgMIVTJ3kgPlfVNoK3sIl
         Wc8g5vnCP3GtsbPAZEDruwYybk2cW4U0YD0JP1eon6zHIBKN/PfVBzWDMAJ3l+iRZnO5
         XBJ2ltY0MW8e9fu8BQmUbcmg4xGuVO88FzpstEkkabABFcv395ER2GRdYY5vbT/9zCPC
         n6SCZHfz2xkb5b57Vm1DJnrwCiKeCNERvYP3dFXbqyE+jgBO10u9DEB7RiVwlpi8ZTCI
         moEdxLwoyxb+oby1N9mJ25qJW1+JM8OoLe0p2TxsplnftaY+7oYcDGyGBXKHM/A9Ma3b
         Z15Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=3TEscsyf7BJ2rmEXmJBzuxDPV1Tbcy9I5OpaojVQ4BQ=;
        b=hxBW2CRyORu1XACDnxMh+K8YCMiayk8gfzEbnPdWN7yA24fA1AoC7byCIv7GwQb9cq
         0T2F0QJxMYyiSvnUB1MyJBUw0HlvrSHK0jytWE0zLemw1ATYjfVgAuFSbA4iWHmFf4cE
         PT+8ia9qPU5JHQ4Myos1Ep8Z/S5yqPFcI3OFLktqelaGrxqXKr9L7PekYcse6vSJNZy/
         6S+a71gmLbRSApSYwBvX//rq9KSa2f/gJUH9/fl40heCRjihYFgLlIfghnNmq5N6ggVG
         CD4xzyFrMn0twwyrLX2dU6c+4MfGu1/9JYojU09HNfWaaipfoZAwOqssLSvISP0y+gkR
         ANiw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j2-20020ac874c2000000b003a81bb6a1c4si19144246qtr.406.2023.01.05.04.58.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Jan 2023 04:58:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pDPoh-0008BU-0y; Thu, 05 Jan 2023 07:57:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1pDPod-0008B0-CU; Thu, 05 Jan 2023 07:57:51 -0500
Received: from [125.120.148.222] (helo=liuqiang-OptiPlex-7060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1pDPo7-00055E-Oz; Thu, 05 Jan 2023 07:57:51 -0500
Received: from localhost (liuqiang-OptiPlex-7060 [local])
 by liuqiang-OptiPlex-7060 (OpenSMTPD) with ESMTPA id 85a66881;
 Thu, 5 Jan 2023 12:57:16 +0000 (UTC)
From: Qiang Liu <cyruscyliu@gmail.com>
To: qemu-devel@nongnu.org
Cc: Qiang Liu <cyruscyliu@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:Xilinx ZynqMP and...)
Subject: [PATCH] hw/display/xlnx_dp: fix overflow in xlnx_dp_aux_push_rx_fifo()
Date: Thu,  5 Jan 2023 20:57:12 +0800
Message-Id: <20230105125713.450275-1-cyruscyliu@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 125.120.148.222 (failed)
Received-SPF: softfail client-ip=125.120.148.222;
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
X-TUID: 7jE7Qvcejl4L

Check s->rx_fifo before pushing data into it.

Fixes: 58ac482a66de ("introduce xlnx-dp")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1419
Reported-by: Qiang Liu <cyruscyliu@gmail.com>
Signed-off-by: Qiang Liu <cyruscyliu@gmail.com>
---
 hw/display/xlnx_dp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
index 322e2faadd..972473d94f 100644
--- a/hw/display/xlnx_dp.c
+++ b/hw/display/xlnx_dp.c
@@ -508,6 +508,10 @@ static void xlnx_dp_aux_set_command(XlnxDPState *s, uint32_t value)
     case READ_AUX:
     case READ_I2C:
     case READ_I2C_MOT:
+        if (nbytes > fifo8_num_free(&s->rx_fifo)) {
+            qemu_log_mask(LOG_GUEST_ERROR, "xlnx_dp: RX length > available fifo data length");
+            nbytes = fifo8_num_free(&s->rx_fifo);
+        }
         s->core_registers[DP_AUX_REPLY_CODE] = aux_request(s->aux_bus, cmd,
                                                xlnx_dp_aux_get_address(s),
                                                nbytes, buf);
-- 
2.25.1

