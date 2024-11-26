Received: by 2002:a17:505:4c56:b0:1be9:327d:8ee3 with SMTP id do22csp1936369njc;
        Tue, 26 Nov 2024 03:25:01 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW1MxA2cqyBL4jRBMOerDOdyVsmbjj0p/8Kt7vFoVXv7HJzPd+1uM4ZjLoRQ9KmqADOC4emuv8BCjm9IQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHdsHn68DLHjXtPmfPxTWFq313bmbK/NUR5l7PLzeELzAFoXMuZVF9iJRf4q+gvvsb3HEcf
X-Received: by 2002:a05:6214:29c3:b0:6d4:2029:ead1 with SMTP id 6a1803df08f44-6d450fe4eddmr271792936d6.29.1732620300915;
        Tue, 26 Nov 2024 03:25:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732620300; cv=none;
        d=google.com; s=arc-20240605;
        b=XKgoS8/ztko/v+/K7tZdmfhkYUmnP0KGTbnvrSWx43kkcs9ym5YavdzNeJO1G4+rnx
         KTzm8ZerPDZONNDUggEFSa3HnOlkxpnmMjAJ2u4eQJtbtd7ukwF8jYnsOXW2s2fe5202
         esrxdXYGsUC1Y8uaPWmMQTLFWl/N20lZmt0xI3eEQIKNs2gRcj5ublYdjO1rrGRUstOg
         4kFHPUhR2tzFJRXVGEzMJC0JjKGw9kCFVuJ5cSWLcxloFD7qywD09z+a7f5B+OenPam6
         wVM/seMjzOqcIAESXHYtUm68U5J6Onk4w9Vu5HKMP+Mb2Z6GHapIRSiHI/Y+sJW5B7ha
         Xmxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=V/FHFrkLjfSL+r0KQnjlYWTgmdb9j50qofDa5n4Bijs=;
        fh=siS/4HMv/4Bjpv+J3MqwgZ5TPB6jtxhL8giIGJt6+cQ=;
        b=O7kuGD0aIri405mJ74iv3cGFc6IrDQcGFey1esgnnwi6DG+/+3G3/DWsSqN2p5z1hI
         5BioR5sb5VnX7ZZyhqVGF1eMjZguL30ei54HJWE/R4Ov54YayjgkxicTRuuhdB0uKPM/
         gg8akY1VmiTSPwJRMI/ZHQMtBVcxF27CwvuMGZKI3tXbhlKAb6JFLJbHVa9Dl0JOYTJG
         7A0JZnJlzffeyHezmxj7qoPUUDhV5DyfRadIuiMfmCpDao/K5XA8JPuQuJ6ha0+I8h2k
         zXKO2AlM7mQjACBlx9EwSvpqHamanNh6O2ZwFgiMveQrzVlA2i5vJp9f/ypBVMbTdIYd
         dDKw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P4SX3nJ8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d84eea30e7si42669456d6.333.2024.11.26.03.25.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Nov 2024 03:25:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P4SX3nJ8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tFtfC-00041A-RN; Tue, 26 Nov 2024 06:23:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tFted-0003uH-QH
 for qemu-devel@nongnu.org; Tue, 26 Nov 2024 06:22:53 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tFteZ-0002gg-VJ
 for qemu-devel@nongnu.org; Tue, 26 Nov 2024 06:22:50 -0500
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3824038142aso3555201f8f.2
 for <qemu-devel@nongnu.org>; Tue, 26 Nov 2024 03:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732620166; x=1733224966; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V/FHFrkLjfSL+r0KQnjlYWTgmdb9j50qofDa5n4Bijs=;
 b=P4SX3nJ8Vp6RJZ+ihkQdj6vdIKHHI1dbmNsq42BoCGN9fw9FCVwFCPhZqMvctY7AIq
 6jQiCN7JUjJAPJoShU9MBou4+IFRiGMgUnl/Ke7MZ7ZRqnzKjyZk0jdDshtjg8Xt9UCH
 cCpmhpg8MEtYKMPWGAoRHbwS84HO7gE8gGN2/uURE/Bfmwrmh/mgcmFZ7nY2kbvSSx/F
 y9QO2aXxDbmL2aKtfl+tH65IqlblSR/tt3o8v/xtnEzZSWBa5s+M85Uhtlrk0ITCpqNF
 e9YifWPO+xtwtikySDHSgzXmlsaf4LtLJihCbir4hM3xVwDnEKb6rOA5Wy1jtx+PMtEm
 C+bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732620166; x=1733224966;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V/FHFrkLjfSL+r0KQnjlYWTgmdb9j50qofDa5n4Bijs=;
 b=fNL2qH7DmNr3o05LO+8ACrThQUX2HgBQTlHdLKhuKy3FxeqejUxS1IznDPteO0wgpe
 Gi4G4SNK3flTIJMptqIM780Ozv1ocDaspjzZCac7fi21dq3kj1CvcOMYrJvDvPycAGPj
 vJupvaQyfrRai3MpGUycDsV3wlEKiqvvrJb85MePqg2NVn7zJE7VxVeX0HRDhmBZC7S5
 BjnMHDXYpD12njHGUDIQN6EjFHdU5snzRy4Dz7eJr4Qk9gHQZ1fV+YpslLTJXgWxaEhk
 iuOTgoW/3mWgg1UAxtAKWXnM7a8PHKwq2wXnHaxUYhYv8T8KhJRIObaQ3K/qzTXAEhwL
 7Uqg==
X-Gm-Message-State: AOJu0Yz9N1tHGUcpOeGeA05b0OO3j9tXquX6PBgvfA6GdACwqNOlnTSg
 U/tsvMBzxJH+C8clTD9eRErD0l1Mm4yZQpRBMId6dniquA5VD5XAAMRYqwVEcZIE8wBqNg9urwj
 R
X-Gm-Gg: ASbGncv4TvM0eVIYYbtfcvqMEpBccAPqdXQI/77xw+NrjEQOj9gGYGc8z7ppB32elas
 0C/OVTNDO/S0jQEXhZSn1QAw0U6WAwtl5+94Lr3hnjvKodJC60O6ALema2GLeYms8eexvvuEpvc
 q1J6GFZ/AOyBBKUmyTPR+z3V26uyng748wu7Xscj6cSuvazq22TMK+BjS8iNa6yPV6zlNWhvouq
 QAZTD6oCt2S7TlDTcXCh0930xd6NUofjUNVLmg/wF04vwJ+JMWUQYEWLfXiZmmkq9a5elbV
X-Received: by 2002:a5d:6d01:0:b0:382:4c36:e072 with SMTP id
 ffacd0b85a97d-38260b969b2mr13375617f8f.30.1732620165804; 
 Tue, 26 Nov 2024 03:22:45 -0800 (PST)
Received: from localhost.localdomain ([176.176.143.205])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fb264cdsm13228780f8f.49.2024.11.26.03.22.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 26 Nov 2024 03:22:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-riscv@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.0 v2 04/13] hw/pci: Introduce
 PCIBusFlag::PCI_BUS_BAR_AT_ADDR0_REFUSED
Date: Tue, 26 Nov 2024 12:22:03 +0100
Message-ID: <20241126112212.64524-5-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241126112212.64524-1-philmd@linaro.org>
References: <20241126112212.64524-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: podcOiDlcK/T

Some machines need PCI buses to allow access at BAR0.
Introduce the PCI_BUS_BAR_AT_ADDR0_REFUSED flag and the
pci_bus_refuse_bar_at_addr_0() helper. Set the flag in
pci_root_bus_internal_init() where all root buses are
created.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/pci/pci_bus.h | 6 ++++++
 hw/pci/pci.c             | 5 ++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/include/hw/pci/pci_bus.h b/include/hw/pci/pci_bus.h
index 6ecfe2e06d5..6d7bf682e8f 100644
--- a/include/hw/pci/pci_bus.h
+++ b/include/hw/pci/pci_bus.h
@@ -26,6 +26,7 @@ enum PCIBusFlag {
     PCI_BUS_EXTENDED_CONFIG_SPACE                           = 0x0002,
     /* This is a CXL Type BUS */
     PCI_BUS_CXL                                             = 0x0004,
+    PCI_BUS_BAR_AT_ADDR0_REFUSED                            = 0x0008,
 };
 
 #define PCI_NO_PASID UINT32_MAX
@@ -72,4 +73,9 @@ static inline bool pci_bus_allows_extended_config_space(PCIBus *bus)
     return !!(bus->flags & PCI_BUS_EXTENDED_CONFIG_SPACE);
 }
 
+static inline bool pci_bus_refuse_bar_at_addr_0(PCIBus *bus)
+{
+    return !!(bus->flags & PCI_BUS_BAR_AT_ADDR0_REFUSED);
+}
+
 #endif /* QEMU_PCI_BUS_H */
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index e05f8a828bb..27b66583e54 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -537,6 +537,9 @@ static void pci_root_bus_internal_init(PCIBus *bus, DeviceState *parent,
     bus->address_space_mem = mem;
     bus->address_space_io = io;
     bus->flags |= PCI_BUS_IS_ROOT;
+    if (machine_refuses_bar_at_addr_0()) {
+        bus->flags |= PCI_BUS_BAR_AT_ADDR0_REFUSED;
+    }
 
     /* host bridge */
     QLIST_INIT(&bus->child);
@@ -1479,7 +1482,7 @@ pcibus_t pci_bar_address(PCIDevice *d,
 {
     pcibus_t new_addr, last_addr;
     uint16_t cmd = pci_get_word(d->config + PCI_COMMAND);
-    bool bar_at_addr_0_refused = machine_refuses_bar_at_addr_0();
+    bool bar_at_addr_0_refused = pci_bus_refuse_bar_at_addr_0(pci_get_bus(d));
 
     if (type & PCI_BASE_ADDRESS_SPACE_IO) {
         if (!(cmd & PCI_COMMAND_IO)) {
-- 
2.45.2

