Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2443607ejb;
        Wed, 24 May 2023 03:19:22 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4Unz1NV1CaYdJw+59JPFkDbm1fAP/UzW1qL5R5gZhHAKXNBF/yyyd9XB5NUYzPKnTJ2w/L
X-Received: by 2002:a05:6214:27c5:b0:621:3523:d7c2 with SMTP id ge5-20020a05621427c500b006213523d7c2mr22526888qvb.22.1684923562598;
        Wed, 24 May 2023 03:19:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684923562; cv=none;
        d=google.com; s=arc-20160816;
        b=y4X2vwZa+qR4pULZv5N8agZ6LcF4Y7SCW6Kn9NbzLb5bS0Jl8mMFCLTL8JjLR0pTBu
         Fy3sIfB1ZXTorlr48hTlsk3nAMWtyn3kff7j4mtZGHdrUMopTialANyAQee7IL7BCihw
         sdrIe/5XtPBIcpdOSVE/HKF0wxJ6AcuoZHwimxz+GflljduFZZB5IbPkQLoMXGm7Omwz
         XM60G7x5KWAXq129yJNwVP/4yFnqFNvxPtrwP4nBTC4TSmGKVX5tJ4pwFdfzF4BrW5Ki
         kDitq6EotMgRCCwhNQR4SW9ud76RnVeWu8SMp6yZC/cijgbkXEmp37bwocI5lO2J30Fc
         BeUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=i2eHc6EduuRy9IXt0IrW6LdtP5rNELiZJU7Gubi9OL4=;
        b=eYfpjST0DPRLYWWa7T42g2m/FQ5g1s5aqyIjvZZajUe/0zxek6lhXBMI6iltLxRcUI
         7vJnR/cAvx5vdGRG4lhf1aAbs+yqRbN7j7rbj6msdgKKpoMYMC3oqXdUFKQrrUavwVjg
         bgLaRZK++cg9X6XiLZyeWiUumOL6civyQ0j6OdZ9mvM4qYn9fc2Qn8OhlKpQOdwWzk95
         itIdGhklWv9C5fWo35VM/BVm9N7KqInNlp63y/2WljR/sKCZI/Lj3OMNQxnIs+yWesZY
         4KU4BKuP85QI2/KxBIRMpNf++R0tMhsHsd/BYq3JFKcsWgiwaJ6ic3L5p9NnQVIQaqN/
         aNag==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id hf4-20020a0562140e8400b005d0f8c3315csi6463862qvb.173.2023.05.24.03.19.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 May 2023 03:19:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q1lZz-0003W4-N1; Wed, 24 May 2023 06:18:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q1lZn-0003Px-Vd; Wed, 24 May 2023 06:18:39 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q1lZk-0006dQ-8N; Wed, 24 May 2023 06:18:39 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id A89E4260BBC;
 Wed, 24 May 2023 12:18:34 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nOMNevhq1k0c; Wed, 24 May 2023 12:18:33 +0200 (CEST)
Received: from applejack.lan (83.21.125.167.ipv4.supernova.orange.pl
 [83.21.125.167])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id E4F35260C32;
 Wed, 24 May 2023 12:18:30 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH v2 5/5] hw/arm/sbsa-ref: use MachineClass->default_display
Date: Wed, 24 May 2023 12:18:23 +0200
Message-Id: <20230524101823.810737-5-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524101823.810737-1-marcin.juszkiewicz@linaro.org>
References: <e682f6d5-acbe-7910-54ef-4d75c88a3d28@redhat.com>
 <20230524101823.810737-1-marcin.juszkiewicz@linaro.org>
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
X-TUID: 0at9Pk8RDWko

Mark the default graphica via the new MachineClass->default_display
setting so that the machine-defaults code in vl.c can decide whether the
default graphics is usable or not (for example when compiling with the
"--without-default-devices" configure switch).

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 hw/arm/sbsa-ref.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 9a3d77d6b6..30ce7f7db4 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -649,7 +649,7 @@ static void create_pcie(SBSAMachineState *sms)
         }
 
         if (vga_interface_type != VGA_NONE) {
-            pci_create_simple(pci->bus, -1, "bochs-display");
+            pci_create_simple(pci->bus, -1, mc->default_display);
         }
     }
 
@@ -865,6 +865,7 @@ static void sbsa_ref_class_init(ObjectClass *oc, void *data)
     mc->default_ram_size = 1 * GiB;
     mc->default_ram_id = "sbsa-ref.ram";
     mc->default_cpus = 4;
+    mc->default_display = "bochs-display";
     mc->possible_cpu_arch_ids = sbsa_ref_possible_cpu_arch_ids;
     mc->cpu_index_to_instance_props = sbsa_ref_cpu_index_to_props;
     mc->get_default_cpu_node_id = sbsa_ref_get_default_cpu_node_id;
-- 
2.40.1

