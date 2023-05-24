Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2443337ejb;
        Wed, 24 May 2023 03:18:51 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6uqjQRpke6rQXjE/p5uyy04WBOUca32a6HyK6wVChxcg1SCIGDurFakNfq9AL4c1DN6dKA
X-Received: by 2002:a05:6214:528a:b0:5ef:8159:b9a9 with SMTP id kj10-20020a056214528a00b005ef8159b9a9mr26931540qvb.21.1684923531271;
        Wed, 24 May 2023 03:18:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684923531; cv=none;
        d=google.com; s=arc-20160816;
        b=OjQ0WPE/VDg8VG69T0JZdW92f7gyzcgbK1HXgEyufFlx+wA4fE0MEZWAiHH4otqJvZ
         L83HKuF5oIfLc+cJ2Tnc4VMVzhPf5ZpoYLWfnX58oXJE73HEAmTuONCTj+tjC+uLXbrG
         8ZB2Wxb3vIAXRwn3iBAFkgjyjaf12vB8usPbeLIFQMx5LGFnJWA5Cyr32KcwqYua7ZCd
         BwskrFAi2PQM8F+97ShQ6jLAaDH6gxleJJkzuqqlrzoBVBYuMLaxfmGt3zx4v14+bmyi
         XZCiN/g/2RArWiX5t5GRScIWmOfdFHV8ctDrSoZNV0thSsNKsFMP1NRF96p5OwDpxfGl
         2p8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=3e9LymC1Yc9KvB15ELruVVHR08VNyMQ7IqdBakyZxug=;
        b=FGLDqsKiaaSJtFqXzUhxwEeO+8PiiauWkr1x4AU8P7N58QYrmUkzKFZiSTPab4kmax
         BuzXSoqvMztkz0hYti/9p3kf5cwSQmc9Ae0q0UkU1bVkDvJFxq4P2zyzWWecV0rniSKY
         GTbgJ/aAfxw112btxh6kJMhvjK52p1/WRWvzObN46w/CW7756sMy+Gib1+w7I9wBxYKH
         qiWX03GnkiGYde5Vqw2k7nRJbvIMZ9og/aMzQw5Rkt1p9XKwlTOFQcgJGMLFB4fScGkg
         aiRDJhDQlXmyp4+0FpRdYxtTXoLARXi3Iu0sADYiOfG3x5X0mXkBZ9jnHvOH7yG/0Ff1
         zAWA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d6-20020a05621421c600b005ef6e02d541si12776qvh.188.2023.05.24.03.18.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 May 2023 03:18:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q1lZq-0003Qp-03; Wed, 24 May 2023 06:18:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q1lZn-0003Pq-H6; Wed, 24 May 2023 06:18:39 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q1lZh-0006cb-Pg; Wed, 24 May 2023 06:18:36 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id 0CE9A260BC0;
 Wed, 24 May 2023 12:18:31 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id on9A4neb-3d6; Wed, 24 May 2023 12:18:29 +0200 (CEST)
Received: from applejack.lan (83.21.125.167.ipv4.supernova.orange.pl
 [83.21.125.167])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id B0374260249;
 Wed, 24 May 2023 12:18:28 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 1/5] hw/arm: Use MachineClass->default_nic in the sbsa-ref
 machine
Date: Wed, 24 May 2023 12:18:19 +0200
Message-Id: <20230524101823.810737-1-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <e682f6d5-acbe-7910-54ef-4d75c88a3d28@redhat.com>
References: <e682f6d5-acbe-7910-54ef-4d75c88a3d28@redhat.com>
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
X-TUID: QyaFiTJQ1SF4

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

