Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp1157322ejq;
        Sat, 6 May 2023 11:34:54 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6agkzaEK9S5XUqSUSOEsF9WQ0HmbRX579DOgc3XCPo+jD/q2Cu8tqq/I1snOkboDLiaZlk
X-Received: by 2002:a05:6214:b69:b0:61b:5e9b:a15d with SMTP id ey9-20020a0562140b6900b0061b5e9ba15dmr9277197qvb.36.1683398094632;
        Sat, 06 May 2023 11:34:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683398094; cv=none;
        d=google.com; s=arc-20160816;
        b=RhgHKFyQG/574Z1Z2FQ5l4KeWJR4vnSMJrTqUOXNGorhBlAfheIuXfYOH8XW+mgo41
         VjYOSfJVQShTaaxEcHCY1pje5ayNdQsBsV8EESEiCA9qHWMg00jNDzS2cmKy5d5M9/49
         W+J6RNiIoEnjCbXJq0cqMi36+2WNzMuPgeSTWhEIrGX/tsGjqQmEwifenluhxiaPcSPK
         e5YPe9QCHVHCE67KfoNuoFHaJmae5EOY37kirD25nxgxoZVVw+qwEggLM4JIL/0bDfAb
         Of4pHltXoBazekd6UtazO2vUdoelhwBYpwgJECcEVT/WZtJBqv+lsOki52lmvO6uXXOP
         I0tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=2/VhimHaER6YjMC2/MbItSJTN/wMPhQhiWh2qqUmrHM=;
        b=j/xBkM05L+PsWHIaWY5aVKzU6MjEb0X9msZcr7+Gz6F0oUEAFNy5Nauom5U0OCH70S
         vHCCpLmT6jfV4b17aM8zDnWKBrFcUzORrfhk8ZpxgB6scYWIRIzIoiaQfMws0/lSgXFH
         4mR5kRlJtXoQ/1HAmPacWxHY0EKi3eoeQ4hhxSx+XRJCdPla++E/prnrnDlmgjPTWtxc
         OMHJcPuNqHk+mp5VbPQpL/7UGANeI0YVupbkgahJO452U3d+vzenLPT0erfvZNg45wrS
         T7YNbcP5Vzr8ii0+0LDZKpJ5u0zxMfg/WBxs7wquLOmi2acMCQL83DE4u+ePKG24EUpr
         53pg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pc6-20020a05620a840600b0074e2cddb4e4si1632756qkn.703.2023.05.06.11.34.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 06 May 2023 11:34:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pvMjn-0001VA-3T; Sat, 06 May 2023 14:34:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1pvMjl-0001Ug-As; Sat, 06 May 2023 14:34:29 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1pvMjj-00009s-A1; Sat, 06 May 2023 14:34:29 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id 99CF6260ABD;
 Sat,  6 May 2023 20:34:23 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FRsTU8jqsByL; Sat,  6 May 2023 20:34:21 +0200 (CEST)
Received: from applejack.lan (83.11.34.59.ipv4.supernova.orange.pl
 [83.11.34.59])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 1A8F4260202;
 Sat,  6 May 2023 20:34:20 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH] sbsa-ref: switch default cpu core to Neoverse-N1
Date: Sat,  6 May 2023 20:34:17 +0200
Message-Id: <20230506183417.1360427-1-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=213.251.184.221;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=muminek.juszkiewicz.com.pl
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: aqlL3u2498p8

The world outside moves to newer and newer cpu cores. Let move SBSA
Reference Platform to something newer as well.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 hw/arm/sbsa-ref.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 0b93558dde..a1562f944a 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -852,7 +852,7 @@ static void sbsa_ref_class_init(ObjectClass *oc, void *data)
 
     mc->init = sbsa_ref_init;
     mc->desc = "QEMU 'SBSA Reference' ARM Virtual Machine";
-    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a57");
+    mc->default_cpu_type = ARM_CPU_TYPE_NAME("neoverse-n1");
     mc->max_cpus = 512;
     mc->pci_allow_0_address = true;
     mc->minimum_page_bits = 12;
-- 
2.39.2

