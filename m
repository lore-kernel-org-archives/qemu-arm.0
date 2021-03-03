Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp5438164lfg;
        Wed, 3 Mar 2021 07:16:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxeIX+TuTtfseqtS7oXj9NEAWkuKtP9kKTs8zZyx/Oj3tUz0Y+7p9CkPQ3Cf7n+i0J64R28
X-Received: by 2002:a9d:3a37:: with SMTP id j52mr22409830otc.328.1614784618987;
        Wed, 03 Mar 2021 07:16:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614784618; cv=none;
        d=google.com; s=arc-20160816;
        b=V2BxPx2aSpm740Q09m25hCO34ovqiW+CzxyUhMwMohWDB6VdTEjjUvNPtSNK2MXPgR
         cM9E/edfpPIXWzUIU7iMmFd0FdVnAnoPs3oqhUrlkCnSrFMKPWto5xcmYIpeZdowVaHU
         kGB1IRQEibijVpqVy8udbVmlX+Hhdjg/iZuHOntORhzN2UoDWywxHaS+hdngAgIVR1r6
         RUZ4VYVSRlhFqVQO2X7cpnmDHpwAmSrrutXqQJNz9QOU0ceaat43BooCmZKw+Xpl97bp
         xrsa0fguHdobUxBjnj3tUIlq+ZW2PC49+hHZJOtfnNIppock2oGaSpsJ4wlgqFJLEsMm
         sr2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=Z6r8W5vhy8nhZlydjEupFAthleHQ06p/bbp0EAjeqEU=;
        b=WhAYtLLkK0R3MkMmsmX/FrLZW2cpHlKPxCPAN+9ISM4CFjaQnBd7yIchIMZtZRk82N
         UtorYAP14/VNykTaR3Y+tM/5+PQ4kyuSw/U60FME+CggYqoQV8SVfcxHHPWitMABpC4L
         bL0k9qss+0V+AqxBDFZgjEs+FyLca6akUHAz+jwvlMjDEI9A+rHs9HzkOkWTFPNmG4mO
         965Fx51iRZmf4NKPGCnvHtczghdOwuYOqY7cMUi4PBBh1JruCZ6fCuS5MDkUOC28sFEm
         qZSq4HcDf5eoLVaq+c3UoFBMibaim0/ccQICwjaVr+MTTBq32XXKC2jLUhjt3r8h5x2e
         3y1g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g17si14069725otn.90.2021.03.03.07.16.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Mar 2021 07:16:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHTFC-0004mV-8O
	for alex.bennee@linaro.org; Wed, 03 Mar 2021 10:16:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1lHTF4-0004lY-0N; Wed, 03 Mar 2021 10:16:50 -0500
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221]:55822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1lHTF2-0003pP-6B; Wed, 03 Mar 2021 10:16:49 -0500
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id 28278260AD8;
 Wed,  3 Mar 2021 16:16:44 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yqQziC_f4iEX; Wed,  3 Mar 2021 16:16:42 +0100 (CET)
Received: from puchatek.lan (89-67-26-161.dynamic.chello.pl [89.67.26.161])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id A366B2606A7;
 Wed,  3 Mar 2021 16:16:41 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: qemu-arm@nongnu.org
Subject: [PATCH] arm: bump amount of PMU counters to pass SBSA ACS
Date: Wed,  3 Mar 2021 16:16:34 +0100
Message-Id: <20210303151634.3421880-1-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.29.2
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
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vbQ+KwFioYAL

Arm BSA (Base System Architecture) specification says:

B_PE_09: PEs must implement the FEAT_PMUv3p1 extension, and the base
system must expose a minimum of four programmable PMU counters to the
operating system.

B_PE_21: The base system must expose a minimum of two programmable PMU
counters to a hypervisor.

It is then repeated in SBSA (Server Base System Architecture)
specification in level 3 requirements:

Each PE must implement a minimum of six programmable PMU counters.

So let make QEMU provide those 6 PMU counters.

SBSA-ACS says now:

  12 : Check number of PMU counters      : Result:  PASS

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 0e1a3b9421..02e25b5c22 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -38,7 +38,7 @@
 #endif
 
 #define ARM_CPU_FREQ 1000000000 /* FIXME: 1 GHz, should be configurable */
-#define PMCR_NUM_COUNTERS 4 /* QEMU IMPDEF choice */
+#define PMCR_NUM_COUNTERS 6 /* QEMU IMPDEF choice */
 
 #ifndef CONFIG_USER_ONLY
 
-- 
2.29.2

