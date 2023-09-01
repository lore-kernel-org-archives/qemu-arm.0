Received: by 2002:a17:907:76b5:b0:9a1:fa4e:495e with SMTP id jw21csp497029ejc;
        Fri, 1 Sep 2023 02:45:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZ3ADILQT0AugI31ipDxGzmkVVazSKycmtGFF1ED67njnfcFz30rBMX2cMp1Unm2qGOGnc
X-Received: by 2002:a05:620a:4590:b0:765:a89b:ce04 with SMTP id bp16-20020a05620a459000b00765a89bce04mr2343296qkb.59.1693561545513;
        Fri, 01 Sep 2023 02:45:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693561545; cv=none;
        d=google.com; s=arc-20160816;
        b=Dms+lSXnpuYTr9AFI7hJnyaJvWx6d5s1fNwu2OQxZCgWf8kzAcrPa7o3rwyibagUNt
         nqm8RVK/ii2F8EaCmTZq2xzO258qnr2WmOe8zub4nat0xMp6/z3HmIw9BhXTsI+6VCNN
         jBazXmI+WZA8ngIg+i54inGBwMNw0hMmaqO1HKVQ834UZqv5W4u5DiAm6Y4s5rvxZe1L
         Y3tswkP2lVnaltpcvF/6CxzDjqEqloHFQ99KrCPwteTdQSsZ+syVlnhvWi1mYTMzRQ0o
         G8KhpYY3q8ahEExZRT9XyMW9m51K9g2UU++YudaJMhlIRsbkgzDqk/fkdIb3gekxc4Y3
         vAXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=kfrxVkkDpSbWy4zcrLc72DNUkVBubZ8PY78R9b89HKU=;
        fh=0FldW4XPCIVeBr3v546UBzvfCk0aVDrArGpyFJOOCns=;
        b=MJWDTkMa7828kuIqP9Wl1GyN+gJByaJ7C3OgvDFj4J3hwRefDlgMV3XMhHwwpw2KJW
         AihGHZs7akMKHzK5Vn12MxYu0Atrmcz3fqi7uO06krDyhN2J6sZapCW3cfDdeQAWXnk9
         R9KOrU5DlEQab9wZ/Q5V6ui0iUysUTUx7n2UphhiJspRJJ+rgD6+EKKspXhebYCg9q20
         PlwJjZi6yR1IZ17zbfkJ63zsaLtSlGB91JIWYY9pc+XXG0ZcoSnbWxjHaP8kNOiCVsbs
         o2F+IQbKbFufclaaksvayLeSXhfPNlNp/xAQywXtF09cxOxhUsW6e3Q6rKeMp58me7yM
         mQAg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l4-20020a05620a0c0400b0076dad8619a5si2144020qki.284.2023.09.01.02.45.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Sep 2023 02:45:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qc0gV-00034d-IX; Fri, 01 Sep 2023 05:43:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=SnXb=ER=kaod.org=clg@ozlabs.org>)
 id 1qc0gU-00032s-3F; Fri, 01 Sep 2023 05:43:22 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=SnXb=ER=kaod.org=clg@ozlabs.org>)
 id 1qc0gR-0003CS-Pq; Fri, 01 Sep 2023 05:43:21 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4RcY4P3KMtz4x3G;
 Fri,  1 Sep 2023 19:43:17 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4RcY4M6lBQz4x3D;
 Fri,  1 Sep 2023 19:43:15 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 25/26] hw/sd: Add sd_cmd_SET_BLOCK_COUNT() handler
Date: Fri,  1 Sep 2023 11:42:13 +0200
Message-ID: <20230901094214.296918-26-clg@kaod.org>
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
X-TUID: LXggYT+jXFpV

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/sd/sd.c | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 00a59450b726..d1c0b132c227 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1078,6 +1078,21 @@ static sd_rsp_type_t sd_cmd_SEND_TUNING_BLOCK(SDState *sd, SDRequest req)
         return sd_r1;
 }
 
+static sd_rsp_type_t sd_cmd_SET_BLOCK_COUNT(SDState *sd, SDRequest req)
+{
+        if (sd->spec_version < SD_PHY_SPECv3_01_VERS) {
+            return sd_cmd_illegal(sd, req);
+        }
+
+        if (sd->state != sd_transfer_state) {
+            return sd_invalid_state_for_cmd(sd, req);
+        }
+
+        sd->multi_blk_cnt = req.arg;
+
+        return sd_r1;
+}
+
 static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
 {
     uint32_t rca = 0x0000;
@@ -1321,20 +1336,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         }
         break;
 
-    case 23:    /* CMD23: SET_BLOCK_COUNT */
-        if (sd->spec_version < SD_PHY_SPECv3_01_VERS) {
-            return sd_invalid_state_for_cmd(sd, req);
-        }
-        switch (sd->state) {
-        case sd_transfer_state:
-            sd->multi_blk_cnt = req.arg;
-            return sd_r1;
-
-        default:
-            break;
-        }
-        break;
-
     /* Block write commands (Class 4) */
     case 24:  /* CMD24:  WRITE_SINGLE_BLOCK */
     case 25:  /* CMD25:  WRITE_MULTIPLE_BLOCK */
@@ -2158,6 +2159,7 @@ static const SDProto sd_proto_sd = {
         [3]         = sd_cmd_SEND_RELATIVE_ADDR,
         [5]         = sd_cmd_illegal,
         [19]        = sd_cmd_SEND_TUNING_BLOCK,
+        [23]        = sd_cmd_SET_BLOCK_COUNT,
         [52 ... 54] = sd_cmd_illegal,
         [58]        = sd_cmd_illegal,
         [59]        = sd_cmd_illegal,
-- 
2.41.0

