Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp4482547lfb;
        Tue, 24 Nov 2020 04:59:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx1YZoip7OoP4MfKC6dsYybL8PEPq4EAdxPT4EzEyWPwQoCaiG2395shZtrHb6xLr1Oycle
X-Received: by 2002:a25:680d:: with SMTP id d13mr6853545ybc.92.1606222787424;
        Tue, 24 Nov 2020 04:59:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606222787; cv=none;
        d=google.com; s=arc-20160816;
        b=A4dL/u3eihkKmGhQsWZTwQwqI/G8EJ72kAXgtEANgKV0R2npq+63fsDlNIeeoEGk9l
         27Z/fKwgPe1zEjEwko3PVRX/JUEFIeoKCer6ceUKXmok16AxitgQ0TVybun1uibNImxD
         hSwDvNjTAz380DsojXlptbRTLn7oPO1jBQuUatTnLCovDF11J+CYqYDSYkFQXbZbTsap
         BO8/G1mF3uQOqI54Tp8h+lbRAoyOr7bgFKbHLi1uLxPM8IBJ9kZkdJWpNiLya+YzzAAN
         kyfgaTXsRKSOrFUKOSEMVeQx6D2Ciox/3Re+64rB5wLvk/QviFgBcQooShe+UjEqosuw
         /tlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=tsokdVPyR0Osi/tkKsJyjpQGEsEzVkuzOC4YH1h/lQk=;
        b=0YmC1RE3hrEbEs6J4CBVUh/pcyho/pHf+GJqilO1F5zYaXNgcp4PV3/YsRbRzvJ9nD
         L3H09qDSyOlinbz1CBHwsVMcMoLn15FnXIfpjgh4zdGFbxPejuQZwzriHW6IZ73uP5py
         hKRGoYncCooKCAyw2lpKDfyf3fpEZM+9z3uH5ODryNb/ouh2uwz9EzbbeX+orl3HFh6V
         prn7KbZY4nF8ImDx27mwuag3nhaZBVlVn4+J1aufx5MXIGgHeDHqt2KGFyJXlFP1Ny14
         9DTx+sWVhKsWZPg6XPf5Xe2jXqbdnlmT3GfGo7TsNLfbhnEfJqVM5yMH/rfiOwmI/CI3
         T/6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q82si15567037ybc.446.2020.11.24.04.59.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Nov 2020 04:59:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1khXv8-0006Y6-NO
	for alex.bennee@linaro.org; Tue, 24 Nov 2020 07:59:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1khXum-0006Wz-M2; Tue, 24 Nov 2020 07:59:25 -0500
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221]:48592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1khXuj-0006v9-E4; Tue, 24 Nov 2020 07:59:24 -0500
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id 03042260374;
 Tue, 24 Nov 2020 13:59:18 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WsSyoJWW_Mgt; Tue, 24 Nov 2020 13:59:15 +0100 (CET)
Received: from puchatek.local (89-67-26-161.dynamic.chello.pl [89.67.26.161])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 7367026026F; 
 Tue, 24 Nov 2020 13:59:15 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: qemu-arm@nongnu.org
Subject: [PATCH] sbsa-ref: allow to use Cortex-A53/57/72 cpus
Date: Tue, 24 Nov 2020 13:59:12 +0100
Message-Id: <20201124125912.1108631-1-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <e79639f0-041e-d190-c895-0e1f24d64102@linaro.org>
References: <e79639f0-041e-d190-c895-0e1f24d64102@linaro.org>
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
X-TUID: IpjTQVNKfVlC

Trusted Firmware now supports A72 on sbsa-ref by default [1] so enable
it for QEMU as well. A53 was already enabled there.

1. https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/7117

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 hw/arm/sbsa-ref.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git hw/arm/sbsa-ref.c hw/arm/sbsa-ref.c
index 7d9e180c0d..4a5ea42938 100644
--- hw/arm/sbsa-ref.c
+++ hw/arm/sbsa-ref.c
@@ -143,6 +143,24 @@ static const int sbsa_ref_irqmap[] = {
     [SBSA_GWDT] = 16,
 };
 
+static const char * const valid_cpus[] = {
+    ARM_CPU_TYPE_NAME("cortex-a53"),
+    ARM_CPU_TYPE_NAME("cortex-a57"),
+    ARM_CPU_TYPE_NAME("cortex-a72"),
+};
+
+static bool cpu_type_valid(const char *cpu)
+{
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(valid_cpus); i++) {
+        if (strcmp(cpu, valid_cpus[i]) == 0) {
+            return true;
+        }
+    }
+    return false;
+}
+
 static uint64_t sbsa_ref_cpu_mp_affinity(SBSAMachineState *sms, int idx)
 {
     uint8_t clustersz = ARM_DEFAULT_CPUS_PER_CLUSTER;
@@ -649,9 +667,8 @@ static void sbsa_ref_init(MachineState *machine)
     const CPUArchIdList *possible_cpus;
     int n, sbsa_max_cpus;
 
-    if (strcmp(machine->cpu_type, ARM_CPU_TYPE_NAME("cortex-a57"))) {
-        error_report("sbsa-ref: CPU type other than the built-in "
-                     "cortex-a57 not supported");
+    if (!cpu_type_valid(machine->cpu_type)) {
+        error_report("mach-virt: CPU type %s not supported", machine->cpu_type);
         exit(1);
     }
 
-- 
2.28.0

