Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp6537908lfc;
        Tue, 16 Feb 2021 07:04:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxD5EDcI95V1ZPpt/qpTPDA9blfyIWsdKbwbq5sshk8MbxRiGPf4nbmhIqu2TeC8wiuucvi
X-Received: by 2002:a25:50d8:: with SMTP id e207mr26937565ybb.56.1613487864384;
        Tue, 16 Feb 2021 07:04:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613487864; cv=none;
        d=google.com; s=arc-20160816;
        b=JgLZ7PAKPlL49xcmjQfjOAmt2++CVNVBouruANbDC/RgFYCZks0Ncp2TdxYhiqManO
         mIewBSms/b7p5LmNbK54Ksh89DuwLGviKA6ElGM4qfkAkaOVCHSQag0sYJCusv8n9T9+
         +9izaprGy7MFK+C2VeazVI3ASrD0keAEW/SZ3mChWmVra4VhYlDBq2rcoWk0BFw1uEk2
         ojbuMRNtE9Ghn0lGSdcGkSIrh+selgn8VRF2NHq3vuiN7jvXe/yQvF7GmH8PBhOf8IG/
         xc18x5F4Coc5s7NNCzNi1E1722glVizHpLeizXDVq1Dr5Zg9bX/e4yjKQIVkKAIcLWHs
         Y8oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=b597akP+FG6Jg1mtFATlfY1D2ZSaA64KpWnJTOcwNR4=;
        b=D4kn+BFeTHsoittqARRCgJ9YbNPNhAJGtDgsa1Svco+mdFG++Egash4TTtEQHphbu5
         mbkiK8oLr0rTer+88k7pjDyxr25JpHiyVdMTH7Waq++SI+4HSOLZ6n/W0d3u9ohPUY5O
         vzB2DilJjjjSHw6qKHlYdsSpjgmvOkxLmW/ucqFSc/64IpMzjVOidsZ0g6VTYsnWm4YW
         MKwKPluKTTIoyzyeLbaUcJeyd6r6m4noFPwtPYX4wUN+mqFo1W2L+l1RFSk8w1XHKx2v
         MPZj6FLWA9wOZlNbbxOEDLdABXNSX5P0uON/iA8cX/Q6ySXDVW2XpQiCwKuS8pkbBjUV
         262A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k15si15767339ybd.261.2021.02.16.07.04.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Feb 2021 07:04:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lC1tn-00059x-NF
	for alex.bennee@linaro.org; Tue, 16 Feb 2021 10:04:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1lC1rI-0002f6-TW; Tue, 16 Feb 2021 10:01:48 -0500
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221]:53102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1lC1rH-00069o-4r; Tue, 16 Feb 2021 10:01:48 -0500
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id 6FAC5260131;
 Tue, 16 Feb 2021 16:01:45 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1EOdz1Zsqwzl; Tue, 16 Feb 2021 16:01:42 +0100 (CET)
Received: from puchatek.com (89-67-26-161.dynamic.chello.pl [89.67.26.161])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id CFCBA26072F;
 Tue, 16 Feb 2021 16:01:41 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: qemu-arm@nongnu.org
Subject: [PATCH v3 2/2] sbsa-ref: add 'max' to list of allowed cpus
Date: Tue, 16 Feb 2021 16:01:22 +0100
Message-Id: <20210216150122.3830863-3-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210216150122.3830863-1-marcin.juszkiewicz@linaro.org>
References: <20210216150122.3830863-1-marcin.juszkiewicz@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=213.251.184.221;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=muminek.juszkiewicz.com.pl
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Leif Lindholm <leif@nuviainc.com>,
 =?UTF-8?q?Rados=C5=82aw=20Biernacki?= <rad@semihalf.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iWOqo9VgEN70

Let add 'max' cpu while work goes on adding newer CPU types than
Cortex-A72. This allows us to check SVE etc support.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Acked-by: Leif Lindholm <leif@nuviainc.com>
---
 hw/arm/sbsa-ref.c | 1 +
 1 file changed, 1 insertion(+)

diff --git hw/arm/sbsa-ref.c hw/arm/sbsa-ref.c
index 276243d122..88dfb2284c 100644
--- hw/arm/sbsa-ref.c
+++ hw/arm/sbsa-ref.c
@@ -147,6 +147,7 @@ static const int sbsa_ref_irqmap[] = {
 static const char * const valid_cpus[] = {
     ARM_CPU_TYPE_NAME("cortex-a57"),
     ARM_CPU_TYPE_NAME("cortex-a72"),
+    ARM_CPU_TYPE_NAME("max"),
 };
 
 static bool cpu_type_valid(const char *cpu)
-- 
2.29.2

