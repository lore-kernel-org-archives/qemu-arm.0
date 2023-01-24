Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3915634ejc;
        Tue, 24 Jan 2023 12:07:08 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvFSMOylFsykzZAdoZ437VJRbFsGhNYRypOJOvCmgOlrwXcaDlU4jbCzmdW/8hTXYLQKPaF
X-Received: by 2002:a05:6214:3b01:b0:534:2344:e1ff with SMTP id nm1-20020a0562143b0100b005342344e1ffmr49248007qvb.17.1674590827941;
        Tue, 24 Jan 2023 12:07:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674590827; cv=none;
        d=google.com; s=arc-20160816;
        b=pt0q4+I9l1+617U7Dx3jg2Xuptet5GpNlC0k0BfgvzlMIsF7nMezGOBKL3JAbjCqCp
         0P58K7i0xAfkO8Ula0dNSj4/HW10vGBEQ/Rv0RlivZbdB2zbwMMmkFZfUoi2CpB6zG8M
         HARVo+E9/dZ7nV1Qj9LTx22W67JPNNveR+hWiCF0cRlTCLnGDA+5k/jTZ6Q17ciRnQ+d
         nZ/hygeCol50x9WUAw3kAxOgZTiEanZ2rTeGl+I2Yd8kZ6Z1G7RIn2y4rNRe/ydUC8qW
         x+ifCtDpD8GcEDVP6OPm6RokU/MBSeRAh4DWYvi1QfhB7tXb/nKHzH5JHh3y3TP4OFCT
         7uZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=t0W82eVkxLwYifr8Md1HSizhjhSvEnFURdJQhGghNKw=;
        b=vKO76ei2BoIcgio2/+n5M6D9ZGjERMPNj3E4RFMxL2tMLw8cHu10dSNNfpqirl93ql
         yDXcNeejngVS31HsRnyewwPv4OhiL9C3P2YOOIZPEd8Lk9g3UsgZCGeiMu5OKfAqDuLX
         WKRW5QE9vXe8xE/GZRJcOvt2Ksw3qvJ6byHdIhqHdPYb08n5fSoNj/vZVGc3LZb8YnY3
         1UYE9QympNcyGkAI1CE9NZz0Y4gNfkCJDCUxXfBoWu72ScFrJCtOE2Tccyvmm/pe7aHw
         xTjvUH9Uu0vhF34WGFPs0yHm8FE+DSE65nghRn0tuxRvMxqJK8f9T6LgXD0zIMHT6HXg
         0CUw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id lx9-20020a0562145f0900b005376ef97535si825606qvb.467.2023.01.24.12.07.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Jan 2023 12:07:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pKPUQ-0000hL-PY; Tue, 24 Jan 2023 15:01:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1pKPUH-0000Zg-CJ
 for qemu-arm@nongnu.org; Tue, 24 Jan 2023 15:01:48 -0500
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1pKPUF-0002v9-3M
 for qemu-arm@nongnu.org; Tue, 24 Jan 2023 15:01:44 -0500
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id A9D56260839;
 Tue, 24 Jan 2023 21:01:40 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n7pddvEkiQHT; Tue, 24 Jan 2023 21:01:38 +0100 (CET)
Received: from puchatek.com (83.8.199.139.ipv4.supernova.orange.pl
 [83.8.199.139])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 48B85260084;
 Tue, 24 Jan 2023 21:01:38 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: Radoslaw Biernacki <rad@semihalf.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>
Cc: qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH] sbsa-ref: remove cortex-a76 from list of supported cpus
Date: Tue, 24 Jan 2023 21:01:13 +0100
Message-Id: <20230124200113.1768552-1-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.39.0
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
X-TUID: PS+RI2PqT2Un

Cortex-A76 supports 40bits of address space. sbsa-ref's memory
starts above this limit.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 hw/arm/sbsa-ref.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 4bb444684f..67c1f68c54 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -145,7 +145,6 @@ static const int sbsa_ref_irqmap[] = {
 static const char * const valid_cpus[] = {
     ARM_CPU_TYPE_NAME("cortex-a57"),
     ARM_CPU_TYPE_NAME("cortex-a72"),
-    ARM_CPU_TYPE_NAME("cortex-a76"),
     ARM_CPU_TYPE_NAME("neoverse-n1"),
     ARM_CPU_TYPE_NAME("max"),
 };
-- 
2.39.0

