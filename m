Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2447670ejb;
        Wed, 24 May 2023 03:28:48 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6h9OoQE60PPTGtjPmsm+Dm84+F9ylT6HcQaTHTzh29QpbnaqZ+m+8DV8IoKp4PJaNqp7RQ
X-Received: by 2002:a05:622a:387:b0:3f3:69ea:274d with SMTP id j7-20020a05622a038700b003f369ea274dmr26433121qtx.45.1684924127880;
        Wed, 24 May 2023 03:28:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684924127; cv=none;
        d=google.com; s=arc-20160816;
        b=zng4k+JBapWrraqTkMQIOzjVsFRVXqUAsQMWP9MlMMC6gzBit3nY8JUAijpdlyJiEu
         7EdbsJTJTLrcxHsJrkQsU8aEhWBfjHe8PM45yPbBSqHrTW4DlEOTF77UHc5xlBe/CAiF
         s91ILsxYY0GKjuMlHRx3Y6fa4pe9IIWl8fuJGDnDeG7TEFBMfLw8nkWz5e3i36yE5Ffo
         3dOUAvoctb5p3IzaCwoGfcZxxLm0UtDpyaH61cGoSgobG+f4IeedhETKKdgUExyIkCHJ
         HAplAZn2zxsCRsO5qk6gB8gaACATak3OjkEdYUvQPv2wR4bt/IcxabWNAstFYibRUrp8
         WVXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=3e9LymC1Yc9KvB15ELruVVHR08VNyMQ7IqdBakyZxug=;
        b=r+yflAT0Ew8vTN7oVaL01lLfnJd+1HTOQLSgpiKfg7tQcKIYxShurljKJ/MTKUskhO
         t+r9TEu4FbUD7g3TPBwpMC1arUJwn1ZVdU4c4ASJQOM84cvEtgpfxSDkFeRQ+sqv2o2u
         F9gPbBxY6wxbokuHAsQCGlf7X9JOCdCpPuOioNlHAi8/QVbt1FzVQMlNvROv2zsyIOTk
         9a6jt2riSQKHnImaZHPY0xcMRo+MJCgHOSELCUOrz2U1isYzxory9nXVNtn5xl+AP5kJ
         A8lm7tj0RQ9GEQxr8Z8hpfeD1viH0RjwYw8nvR0oa4BkDgKF+NJxn7UZJLXsBCskO7Nr
         0INA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gi10-20020a056214248a00b0060b965f8904si6439021qvb.459.2023.05.24.03.28.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 May 2023 03:28:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q1lim-0007xM-02; Wed, 24 May 2023 06:27:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q1liX-0007pl-EC; Wed, 24 May 2023 06:27:42 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q1liU-0000OI-RM; Wed, 24 May 2023 06:27:41 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id 95279260BC0;
 Wed, 24 May 2023 12:27:36 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X8FxYvjZTYBK; Wed, 24 May 2023 12:27:34 +0200 (CEST)
Received: from applejack.lan (83.21.125.167.ipv4.supernova.orange.pl
 [83.21.125.167])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 64814260287;
 Wed, 24 May 2023 12:27:34 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v3 1/5] hw/arm: Use MachineClass->default_nic in the sbsa-ref
 machine
Date: Wed, 24 May 2023 12:27:25 +0200
Message-Id: <20230524102729.810892-2-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524102729.810892-1-marcin.juszkiewicz@linaro.org>
References: <20230524102729.810892-1-marcin.juszkiewicz@linaro.org>
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
X-TUID: qZFUepwWSm1c

From: Thomas Huth <thuth@redhat.com>

Mark the default NIC via the new MachineClass->default_nic setting
so that the machine-defaults code in vl.c can decide whether the
default NIC is usable or not (for example when compiling with the
"--without-default-devices" configure switch).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/sbsa-ref.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 792371fdce..9c3e670ec6 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -596,6 +596,7 @@ static void create_pcie(SBSAMachineState *sms)
     hwaddr size_mmio_high = sbsa_ref_memmap[SBSA_PCIE_MMIO_HIGH].size;
     hwaddr base_pio = sbsa_ref_memmap[SBSA_PCIE_PIO].base;
     int irq = sbsa_ref_irqmap[SBSA_PCIE];
+    MachineClass *mc = MACHINE_GET_CLASS(sms);
     MemoryRegion *mmio_alias, *mmio_alias_high, *mmio_reg;
     MemoryRegion *ecam_alias, *ecam_reg;
     DeviceState *dev;
@@ -641,7 +642,7 @@ static void create_pcie(SBSAMachineState *sms)
             NICInfo *nd = &nd_table[i];
 
             if (!nd->model) {
-                nd->model = g_strdup("e1000e");
+                nd->model = g_strdup(mc->default_nic);
             }
 
             pci_nic_init_nofail(nd, pci->bus, nd->model, NULL);
@@ -858,6 +859,7 @@ static void sbsa_ref_class_init(ObjectClass *oc, void *data)
     mc->minimum_page_bits = 12;
     mc->block_default_type = IF_IDE;
     mc->no_cdrom = 1;
+    mc->default_nic = "e1000e";
     mc->default_ram_size = 1 * GiB;
     mc->default_ram_id = "sbsa-ref.ram";
     mc->default_cpus = 4;
-- 
2.40.1

