Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2469694ejb;
        Wed, 24 May 2023 04:15:03 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6XCnOkfA3UfSnKxNHArKK8ipAfIVgAWa8DrxQA+K9/rt7OJsX2tPnO5k4MnYTF5oB6bXdv
X-Received: by 2002:a05:6214:5298:b0:616:58f1:2844 with SMTP id kj24-20020a056214529800b0061658f12844mr26883820qvb.45.1684926903089;
        Wed, 24 May 2023 04:15:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684926903; cv=none;
        d=google.com; s=arc-20160816;
        b=OPFdXqsZa7MzciN0OjoqINqS1oX4Z43gdCxEq4fJ4Y70CwGIlb2QRHZS3c8nvLTFS+
         3juZlKoDAxh/UTefn2O4HLb8LvmA++fjZ3izvzNfEPm4TPnkjPShr7m3RJWGSZ8SWv3f
         ZnP4JyxGGTs4jdeHC/cJYd9LDSlkAm9Pigzz/vWm/A/W4uGIdzGbs7GBdeexim4+9CkA
         gH7p33E385yXTQUpj8byM/WuEPODZpEedKK7i7QywZiboCleucWSecsHjQhRG756nNOI
         OP0RLA1DI2R5KUb+e80TJwEmFW1bUEUOds5h2Gxj4aafefHoZuTFD4I0ATbg6vFoOyjQ
         by8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=4JKroT921zfW/eAU4WalsTRSNrA1pWnv9/gfDL7VpfE=;
        b=OWzn6Cj0PUe2F+7n7sMVCHQzxejqgRuBtW2Z3NMs1siwk8nS+GJ5fv/n0ZgXmv4Brw
         s3khTqYqL6Ksz6SqZ4zLm5KKmufIBVPd5sBAXQs7LnFu07vy90hLFtOPgB9Tvj5FUMOB
         gH9xPcHBvh0mgfh4x6V/QmnVE1f0VqGhhW+WiMLONYy9Ot2BZ6cq6Fu21UznGQz+8U3B
         wMYjtLmWPBVRietKGkF9WJJmg25gqWwux/Fn1N/zFfsyel8WJMyOPnnaiSPlssZ7wrZy
         8+278UopD4F+vhtqOGtrz7PQMnseXqJaKB3sveL8PWApxwgwoXFek9QzWYdSl7qAS3aE
         Ahhw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t13-20020ad45bcd000000b006165a0e3785si6408609qvt.544.2023.05.24.04.15.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 May 2023 04:15:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q1mS5-0006PI-7W; Wed, 24 May 2023 07:14:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q1mS4-0006MH-0H; Wed, 24 May 2023 07:14:44 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q1mS2-0003vf-2n; Wed, 24 May 2023 07:14:43 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id 5CE29260249;
 Wed, 24 May 2023 13:14:39 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ubtGt9K5xrbo; Wed, 24 May 2023 13:14:37 +0200 (CEST)
Received: from applejack.lan (83.21.125.167.ipv4.supernova.orange.pl
 [83.21.125.167])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id AF66C2602AC;
 Wed, 24 May 2023 13:14:36 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH 1/3] hw/arm: Use MachineClass->default_nic in the sbsa-ref
 machine
Date: Wed, 24 May 2023 13:14:11 +0200
Message-Id: <20230524111413.833912-2-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524111413.833912-1-marcin.juszkiewicz@linaro.org>
References: <20230524111413.833912-1-marcin.juszkiewicz@linaro.org>
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
X-TUID: UWvS7mnvyYhn

From: Thomas Huth <thuth@redhat.com>

Mark the default NIC via the new MachineClass->default_nic setting
so that the machine-defaults code in vl.c can decide whether the
default NIC is usable or not (for example when compiling with the
"--without-default-devices" configure switch).

Signed-off-by: Thomas Huth <thuth@redhat.com>
Tested-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

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

