Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp443225njb;
        Fri, 13 Dec 2024 05:35:57 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXLHzsM2IqWqj3Ij1hTc3D4iSbm4/+XYpjuRvuwADfhwbIUAGFQ7Nf7M4CUrYCY0u2lUl5XIZPnxCWklg==@linaro.org
X-Google-Smtp-Source: AGHT+IF/OPbHDMUqKVF8Vgnfctp9gohtPgc3RWkyfXzmjkse85Q6Ioo92yviAdwLi/PBgBDdUfE7
X-Received: by 2002:a05:620a:6089:b0:7b6:f998:3368 with SMTP id af79cd13be357-7b6fbf459d4mr395751885a.57.1734096957635;
        Fri, 13 Dec 2024 05:35:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734096957; cv=none;
        d=google.com; s=arc-20240605;
        b=bQBAAXEkCH91RnmCEcQa5ZSnIr0KzwVSPlvw84O/kfewFZPb4n74q9+N4O/Ycp9JUQ
         /zfxKf1nKrc5fXN3UTHAg8ljDOoCN4jalRP37q13XpyO8nsBnwigg1gQKoZ+977LhahY
         99b4PubTIk3OL+s1HcjZN+Sl0HoabbRZ6ByTGOxONUB219ajNY+r328DpTC8XDPO2DUh
         nCrZPwi/7PekYgwAoS87MAkWC+yDAncb0ugwjPkxckfbXg+hoKgkFhqSd7Au3j50jn4P
         CbIYODqYW55l59D0jG2TKo/1L49z6TtUU3xa26TFMdpZhiEcHmae9euMwaOhMAjPVuKv
         GVMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=keEAo9CNDWNBW9lBlzlrISyY+AFYXI3pGoxc0E2DIgY=;
        fh=5/bEEfneXpYiCSLu1RRtIdWOVpk1SgQYYFlk2zFRZHo=;
        b=XH+mfBTdDRUMp1FswU/AmWXwGRaHq3k+7UCmMWzifj93HfVWmgR6JgBFXMT2CvCLjT
         s5mnG5djw6i5n1u54jSEpBSaxLv5gyrEJzZS7iXsm6JH8ZgdernNjVXqgD/Lmcer+iJs
         zVDUUp6PGWgcOFfoBhuIRZAJnvLPsBSrjV/8SOw6fKRSQ0U2kxlS6ffREocWV5tupwy2
         nXTodaqjcBSI0pPqYpW8GvgD8+mVFFWPGfoSbz/HUELw4EDgO4nyIaEW5KDzeENZgXqa
         o5jjjP4PpZg6XglrouhqiIKwmFZd6jiJdCS67Hcs/YVwW9LS+w9udiMEQwEDlE46JDPi
         +YHA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Krziu5I0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6ea4793a9si791093985a.397.2024.12.13.05.35.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Dec 2024 05:35:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Krziu5I0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tM5pE-0006BK-Kg; Fri, 13 Dec 2024 08:35:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tM5oB-0005EZ-DE
 for qemu-devel@nongnu.org; Fri, 13 Dec 2024 08:34:21 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tM5o8-00016Z-VC
 for qemu-devel@nongnu.org; Fri, 13 Dec 2024 08:34:18 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4361dc6322fso11740655e9.3
 for <qemu-devel@nongnu.org>; Fri, 13 Dec 2024 05:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734096853; x=1734701653; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=keEAo9CNDWNBW9lBlzlrISyY+AFYXI3pGoxc0E2DIgY=;
 b=Krziu5I0VYSwqQ6p0LCHeMRO2LNvOJyQigB56OtHvOrwIsWRD2SS0miohndyzqsaXC
 OdBlLqXMFpBR3s+RhkPNFJVtkDwhMd1WQeX04prbgifX+69uDK0mHPuhvm5ZJ1CN0E42
 HtHSBLmyIwExRlYcgPPFsbJst2qqXv5CU8GqoYGUywbhI4bgA7brjYNbBZC+C1Swrk+q
 xaYmx8dk1BoSfGqvDSMfAj5IOaVQr4mTJkW8asPdvFukk6BOveDnRt+F68IfW0YYvCSm
 y0TrXH0XIN60K6Y/PfXIAkds9qIHg7SpnLmNptMkf2jrytnjQF1yctFi+0YU85OB5WR/
 96Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734096853; x=1734701653;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=keEAo9CNDWNBW9lBlzlrISyY+AFYXI3pGoxc0E2DIgY=;
 b=ajZ1XvXrpygQeqH/ISLKArRhV6bW5ZyZsNKgKqhiKF/uZcRHPmwI5IEoWFc2aAZK5H
 TX+G4b74wc/ystvDVRVaW/vGWYKcAkYizjcYXo07k8yiiuc6L1aw5eLa2xASAI7PxCJz
 MlXn2yxUNz3cjvIz9PoIzqG4CFIK6Dw4VhTJph7fhtaDbXnh5TsoNaXIufcpRfIX8Qc2
 By4sRS9iekR2kEeSanTJodIulsfnvfPknVA29q46FyIwK6NDao0HuKuPb8ZWUPgFpejN
 eo7+/b8VCjDC4s1L/zfZCOe/LYMwZxBFD7MQr8v6CzDKq5QrZZICs/6kWww1MRUKnbYH
 Q9RA==
X-Gm-Message-State: AOJu0YyDE7/f0RPdlYTFnQocYBVw82JzxjdJ0Whf2sRt/8vULl+UH6/B
 HN+95Y3VoNdA+GTDkpYMabY4mUzvOKCTF4gAH7V+6sr1mJ6Fb4z4de5QDH1rxeNgl78rwpq9mfK
 T
X-Gm-Gg: ASbGncsyq3BH3fX6XSrCo5OoXycbfiUD22Ps1uhnkJTfx3sqE1YluCOQD2S2MJ8EppQ
 jB7ig4fEIrOj1hmu+Kf14u/ktENIGnosYEr5tar0uh1ZB3wMtgAqRLuV6xf4+KUqO4OW0rd89dQ
 /RRmsangnPXYCTdi6x7czvY0DRdeK5u0ffUiSI7YQcOVhsBmTcQ2HQWYt8Gy70nDqWD0DVwKhaG
 AZEyYZlrygGjm+NOfi5qKEvy1Z/sPx1Nq8cclavpML3exORf4ACLGDeYZJmeFq/xwedezId9eZh
 FUDKEodaRRdzmZQ/FXXTI+nMytgwXVMdhheO
X-Received: by 2002:a5d:584b:0:b0:386:1cd3:8a09 with SMTP id
 ffacd0b85a97d-38880abfd60mr2192970f8f.1.1734096853442; 
 Fri, 13 Dec 2024 05:34:13 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436256b4556sm48690705e9.33.2024.12.13.05.34.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Dec 2024 05:34:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 4/7] hw/pci: Have PCI_BUS implement
 TYPE_FW_CFG_DATA_GENERATOR_INTERFACE
Date: Fri, 13 Dec 2024 14:33:49 +0100
Message-ID: <20241213133352.10915-5-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241213133352.10915-1-philmd@linaro.org>
References: <20241213133352.10915-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: fxmDe6jqjox+

The FW_CFG_DATA_GENERATOR interface allows any object to
produce a blob of data consumable by the fw_cfg device.
Implement that for PCI bus objects.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/pci/pci.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 1416ae202c3..8844251eceb 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -46,6 +46,7 @@
 #include "hw/pci/msix.h"
 #include "hw/hotplug.h"
 #include "hw/boards.h"
+#include "hw/nvram/fw_cfg.h"
 #include "qapi/error.h"
 #include "qemu/cutils.h"
 #include "pci-internal.h"
@@ -216,11 +217,41 @@ static uint16_t pcibus_numa_node(PCIBus *bus)
     return NUMA_NODE_UNASSIGNED;
 }
 
+static GByteArray *pci_bus_fw_cfg_gen_data(Object *obj, Error **errp)
+{
+    PCIBus *bus = PCI_BUS(obj);
+    GByteArray *byte_array;
+    uint64_t extra_hosts = 0;
+
+    if (!bus) {
+        return NULL;
+    }
+
+    QLIST_FOREACH(bus, &bus->child, sibling) {
+        /* look for expander root buses */
+        if (pci_bus_is_root(bus)) {
+            extra_hosts++;
+        }
+    }
+
+    if (!extra_hosts) {
+        return NULL;
+    }
+    extra_hosts = cpu_to_le64(extra_hosts);
+
+    byte_array = g_byte_array_new();
+    g_byte_array_append(byte_array,
+                        (const void *)&extra_hosts, sizeof(extra_hosts));
+
+    return byte_array;
+}
+
 static void pci_bus_class_init(ObjectClass *klass, void *data)
 {
     BusClass *k = BUS_CLASS(klass);
     PCIBusClass *pbc = PCI_BUS_CLASS(klass);
     ResettableClass *rc = RESETTABLE_CLASS(klass);
+    FWCfgDataGeneratorClass *fwgc = FW_CFG_DATA_GENERATOR_CLASS(klass);
 
     k->print_dev = pcibus_dev_print;
     k->get_dev_path = pcibus_get_dev_path;
@@ -232,6 +263,8 @@ static void pci_bus_class_init(ObjectClass *klass, void *data)
 
     pbc->bus_num = pcibus_num;
     pbc->numa_node = pcibus_numa_node;
+
+    fwgc->get_data = pci_bus_fw_cfg_gen_data;
 }
 
 static const TypeInfo pci_bus_info = {
@@ -240,6 +273,10 @@ static const TypeInfo pci_bus_info = {
     .instance_size = sizeof(PCIBus),
     .class_size = sizeof(PCIBusClass),
     .class_init = pci_bus_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_FW_CFG_DATA_GENERATOR_INTERFACE },
+        { }
+    }
 };
 
 static const TypeInfo cxl_interface_info = {
-- 
2.45.2

