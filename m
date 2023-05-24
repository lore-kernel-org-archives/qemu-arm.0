Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2393450ejb;
        Wed, 24 May 2023 01:21:01 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4YXJeoaVlmOpQCjlFu1Ioqo1F9zOoayvx3/pSWizE9W/+MZlGUphW7p4na783/8kUfOFOq
X-Received: by 2002:ad4:5d48:0:b0:616:4c4b:c9b9 with SMTP id jk8-20020ad45d48000000b006164c4bc9b9mr30371169qvb.37.1684916461752;
        Wed, 24 May 2023 01:21:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684916461; cv=none;
        d=google.com; s=arc-20160816;
        b=rkvO8wh6Vzz4M+E0qZuT9Vg3VTRmn60PNSudKaiI6h69DyYIyB6xZFQbjRQ8y1Cr+u
         wLnuGYAEAGPMRPUbzGzmX3twzthUcOPt2rzVIPbbQQVKFusPPQu+PF/aIKn36gi82skS
         kHVy9JcUuJ/IIQeuRJqC0PNeQK7f5wQFt3JNYftdzzwvqS5KDtSOr0Z6ifDLCwSZWFW7
         EmcKg0P3fpps32Ha0K7BNrK0zrSi/dfeXL9BbYbpJOdSpeH/2wTPh7WObwAj7dBfNR0g
         SMl6tr9VaCi/g9NOvgZHx3xm7Tzhh4nfqWf3Lgmt8wq5Me0Q9gt+3ZbsGBfygHL5EgUp
         FzDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=tKoJGBYIgfApa6z6v9N/YjXhD95adNm6Ki5W9wz0M50=;
        b=yHUrxeJ58bhWkMBaIP5ip/ZITk/UDC3x5UgA4aF7kJBYEi409ip825gaRPKl0prQM/
         oIumo72Jjp64JgDaAOF0hrgUBMLq6voRWh3pjwCG93Kk94zFaVR/FL8RqfnXPGCD9SCO
         1Ozl8KBVudVR4LgDJbwpSMw3QwL84LK1efowQ0sc9s06jtWQ9eISHuwTKYZmrR/5G21w
         +tpUuQkmB3epd2TkkY0RTv2I9YGBvtCvxgnDuTmcBJZzJabQVbj0gdENyZ3o+dIrQ8/D
         WpXLBTsxXulOVymnHBVP/nOfOX931dhLyBw3xpqrXZ1qEqihZesAwj9WZ2T17U/3la0M
         x9Iw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cUrVtccM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jq9-20020ad45fc9000000b0061b5c7b3f91si3723261qvb.13.2023.05.24.01.21.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 May 2023 01:21:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cUrVtccM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q1jjk-0006X3-FL; Wed, 24 May 2023 04:20:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1q1jjh-0006Wk-GR
 for qemu-arm@nongnu.org; Wed, 24 May 2023 04:20:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1q1jjf-0005hY-NW
 for qemu-arm@nongnu.org; Wed, 24 May 2023 04:20:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684916442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=tKoJGBYIgfApa6z6v9N/YjXhD95adNm6Ki5W9wz0M50=;
 b=cUrVtccM4YOPUa+NTVvhIwE7HaKyPC6IDsQA31F3jfiTawM5tN0ylz/5nLX3WwAHS44vos
 9bzN1KrYYvYM8aUGMDW5rdbsMEZ9DvwQWGWQVv0NqljWXgeXC2x1qg3iIHZEo6puK9Qhwy
 PuHpRKni2nGiGpJmiNU+juTiRuIW0ys=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-463-vQKVsVF5N7W2CRucLPEOWA-1; Wed, 24 May 2023 04:20:40 -0400
X-MC-Unique: vQKVsVF5N7W2CRucLPEOWA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC5ED8007D9;
 Wed, 24 May 2023 08:20:39 +0000 (UTC)
Received: from thuth.com (unknown [10.39.194.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C3FF37AE4;
 Wed, 24 May 2023 08:20:38 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Radoslaw Biernacki <rad@semihalf.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>
Subject: [PATCH] hw/arm: Use MachineClass->default_nic in the sbsa-ref machine
Date: Wed, 24 May 2023 10:20:37 +0200
Message-Id: <20230524082037.1620952-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: XWr8A+EO/dVA

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
2.31.1

