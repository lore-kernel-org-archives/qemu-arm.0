Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1385584lfb;
        Fri, 20 Nov 2020 07:10:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyV/Cvws5zhOKl5a6X+lYtwO0z7gt/iIsTDlw6QgLj/PD4UDdUBMpa/iZPOoTxOjabet5wr
X-Received: by 2002:a4a:9cc7:: with SMTP id d7mr14470840ook.8.1605885053195;
        Fri, 20 Nov 2020 07:10:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605885053; cv=none;
        d=google.com; s=arc-20160816;
        b=hZdavrCfUbBaAM5TsWOWLa1O7D1kPGkLULsaJ0p25Gj8sawq/OXr7m1ixYs2aYFvHN
         6+VBueFSsknnqAwRqR4pj9SJhtFFKKZaqIDio2LuDBvpoowKBhmyCzm+yOxpRTHV0iGs
         RwP9qPnM9vMEmMecTwNqkPVLdPpnD3Dk6SJk+tTzqWr2K9pxWEEqC+fS5rTDiuF9yuvY
         V/O7dqTeaeTX75cYiaJntB5/UtXHI+SsTVc39PP+Mn2rx8dFH075m8n+VfF9zzs6IiP0
         I4g2J7bBOZbJ2uOm1m0axMQS1LkKPlyixbeXYrE4CziJcDDmhHBnEySezbjGEInLZvxf
         GpYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=OtoAX/fDCEUBE7DL6XMej4vk4ZkRaIZuFHNwbvb4sB8=;
        b=ON0rFF1CqheJd50hY6lx5Ww2xNew/jf4ZOdiP9b8rrT0yrl/3bt5TGbgvulSJpAIO6
         v52OimmCrKe6MjaDfdGc9L1bI2/VHNZxKQAUR4L/FJcoIiaeD0tIjQ6JEiy3gVl4CWAZ
         /CdmWScdVyJ1B8Yr7tuGqgcImosbhd9sKAhCm2XsogAOrpCqEPqsTTWpUHOwzXltCcnZ
         OpIYLdlA9ugnHdG9ytL+eCridfNQfvhX30zHLlhdeNWDNJt+VRxgCAteRen5emhR0jyz
         /EkpGiz4TFQnVwoAqSbcq/84JU5t+ugZOTQXvsRl7hD76nc4FfkSxgS3vclxd7KEIgeV
         yN4g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h1si654670uac.21.2020.11.20.07.10.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Nov 2020 07:10:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kg83o-0005dI-HJ
	for alex.bennee@linaro.org; Fri, 20 Nov 2020 10:10:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1kg7E9-0002tW-5h; Fri, 20 Nov 2020 09:17:29 -0500
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221]:35314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1kg7E7-0002iK-1D; Fri, 20 Nov 2020 09:17:28 -0500
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id A652226036D;
 Fri, 20 Nov 2020 15:17:22 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ol5HqVUr2XQl; Fri, 20 Nov 2020 15:17:20 +0100 (CET)
Received: from puchatek.local (89-67-26-161.dynamic.chello.pl [89.67.26.161])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 09EC026026E; 
 Fri, 20 Nov 2020 15:17:19 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: qemu-arm@nongnu.org
Subject: [PATCH] sbsa-ref: allow to use Cortex-A53/57/72 cpus
Date: Fri, 20 Nov 2020 15:17:05 +0100
Message-Id: <20201120141705.246690-1-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.28.0
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
X-Mailman-Approved-At: Fri, 20 Nov 2020 10:10:43 -0500
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
X-TUID: ZrrkKGiluj8A

Trusted Firmware now supports A72 on sbsa-ref by default [1] so enable
it for QEMU as well. A53 was already enabled there.

1. https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/7117

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

diff --git hw/arm/sbsa-ref.c hw/arm/sbsa-ref.c
index 7d9e180c0d..b9909279f1 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -143,6 +143,24 @@ static const int sbsa_ref_irqmap[] = {
     [SBSA_GWDT] = 16,
 };
 
+static const char *valid_cpus[] = {
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

