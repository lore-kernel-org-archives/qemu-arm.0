Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp1290504lfc;
        Sat, 30 May 2020 02:22:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0yJcnEhu1vXDPPCAgm7ddhEwKiEzGnAX/aHUA7LfO+ShonmA9QsqC+olxDH/hid9EUXYz
X-Received: by 2002:a25:7c46:: with SMTP id x67mr20354621ybc.279.1590830565620;
        Sat, 30 May 2020 02:22:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590830565; cv=none;
        d=google.com; s=arc-20160816;
        b=gIDO3oFT4w5gNDsjPtr1b4+cKPtnXZd7ckaDX9GNlRYkIuQR7Uu5kRud4RpXE6zN7c
         p3uGDXPxJduz/Dcbe4AXCqSfcm0DIABzKxDOBT7ysg3Mxh3dfiItQ7YHSeI/v1kZECC1
         o81mwG3Uqlj95diP1kGo3YVY9s0Ckddr3nbLd0R9REjPMp4QnKrrELVBAjXOjpMpbi0q
         7f6qd1K0j63btpSZs67MbTfV41HPQn5DRi7nskykCoOMqDtqnxRb5X8z9fcjRf5F4V0/
         1YTi6Hy2M2I9Nn2PQaCiLctTm63xPy5LUb5T/HJ1RfUIeARz8gMe5UMVyS19ZopOVcTS
         yc0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=UMLUSx5ffkbJsLpCXPlei2jZ9+s3G7t5o6C+HyvFjy0=;
        b=aZFBG/Cfem3f6UbhGtXuCNfU0UemSN3fTxEnOr8GbhyaxU/IAX4VADhowsNZJsBJsv
         ofOxEhc4dxcS+W5ZyLCi/T/48OtuzPrs00UJQhg3JYXK+F+iWz26GSRyZbGAL0ePW0O0
         46dNP2p8JiTVb7jB2uYKYujIGVYpPqS5kKYn+8r1NfMxQ+7byA4szx4KEk8hNorADgdi
         hWaWi4GenJjnpbLlaYQRG51iH2MTuoxUyRBmqHGWmQUM123FumEddWKzxHPa69ejqP0Y
         YV2b/pjtNYOpL9QDWhMz5JYlQmfiydEjMSLSgy89+R0hpsAaI1oiu9cLA+FJwLeI4BuZ
         lpsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n63si10002794ybc.120.2020.05.30.02.22.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 30 May 2020 02:22:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jexhV-0000QU-1m
	for alex.bennee@linaro.org; Sat, 30 May 2020 05:22:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1jexhN-0000Kx-TT; Sat, 30 May 2020 05:22:38 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:3769 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1jexhM-0006yP-J7; Sat, 30 May 2020 05:22:37 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id A31619B39CB490453C06;
 Sat, 30 May 2020 17:22:29 +0800 (CST)
Received: from localhost (10.173.222.233) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.487.0; Sat, 30 May 2020
 17:22:22 +0800
From: Ying Fang <fangying1@huawei.com>
To: <drjones@redhat.com>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [PATCH] target/arm/cpu: adjust virtual time for cortex series cpu
Date: Sat, 30 May 2020 17:22:04 +0800
Message-ID: <20200530092204.1746-1-fangying1@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.173.222.233]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=fangying1@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/30 05:22:30
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, zhang.zhanghailiang@huawei.com,
 wu.wubin@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1Cm4cc3oY/ik

Virtual time adjustment was implemented for virt-5.0 machine type,
but the cpu property was enabled only for host-passthrough and
max cpu model. Let's add it for arm cortex series cpu which has
the gernic timer feature enabled.

Signed-off-by: Ying Fang <fangying1@huawei.com>
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 32bec156f2..a564141b22 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1973,6 +1973,9 @@ static void cortex_a7_initfn(Object *obj)
     cpu->ccsidr[1] = 0x201fe00a; /* 32K L1 icache */
     cpu->ccsidr[2] = 0x711fe07a; /* 4096K L2 unified cache */
     define_arm_cp_regs(cpu, cortexa15_cp_reginfo); /* Same as A15 */
+    if (kvm_enabled()) {
+        kvm_arm_add_vcpu_properties(obj);
+    }
 }
 
 static void cortex_a15_initfn(Object *obj)
@@ -2015,6 +2018,9 @@ static void cortex_a15_initfn(Object *obj)
     cpu->ccsidr[1] = 0x201fe00a; /* 32K L1 icache */
     cpu->ccsidr[2] = 0x711fe07a; /* 4096K L2 unified cache */
     define_arm_cp_regs(cpu, cortexa15_cp_reginfo);
+    if (kvm_enabled()) {
+        kvm_arm_add_vcpu_properties(obj);
+    }
 }
 
 #ifndef TARGET_AARCH64
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index cbc5c3868f..3922347b83 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -137,6 +137,9 @@ static void aarch64_a57_initfn(Object *obj)
     cpu->gic_vpribits = 5;
     cpu->gic_vprebits = 5;
     define_arm_cp_regs(cpu, cortex_a72_a57_a53_cp_reginfo);
+    if (kvm_enabled()) {
+        kvm_arm_add_vcpu_properties(obj);
+    }
 }
 
 static void aarch64_a53_initfn(Object *obj)
@@ -190,6 +193,9 @@ static void aarch64_a53_initfn(Object *obj)
     cpu->gic_vpribits = 5;
     cpu->gic_vprebits = 5;
     define_arm_cp_regs(cpu, cortex_a72_a57_a53_cp_reginfo);
+    if (kvm_enabled()) {
+        kvm_arm_add_vcpu_properties(obj);
+    }
 }
 
 static void aarch64_a72_initfn(Object *obj)
@@ -241,6 +247,9 @@ static void aarch64_a72_initfn(Object *obj)
     cpu->gic_vpribits = 5;
     cpu->gic_vprebits = 5;
     define_arm_cp_regs(cpu, cortex_a72_a57_a53_cp_reginfo);
+    if (kvm_enabled()) {
+        kvm_arm_add_vcpu_properties(obj);
+    }
 }
 
 void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
-- 
2.23.0


