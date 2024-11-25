Received: by 2002:a17:505:4c56:b0:1be9:327d:8ee3 with SMTP id do22csp1311177njc;
        Mon, 25 Nov 2024 06:06:52 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUqw23h+/S6sJt5eexBYEUvI3tR65jv6aeFOX7AWlOXc+4WMkRBBC5MJSU694+ESzKxgr107Rn5OaP2zw==@linaro.org
X-Google-Smtp-Source: AGHT+IG5wKXXIVLPEPla8jErUXxdGnB57q9KBmexi9s4L+bW2BG8tqdrCMqXl2c6oGtEbQJm4Dth
X-Received: by 2002:a05:6000:1f82:b0:382:4bb3:9050 with SMTP id ffacd0b85a97d-38260be5fb7mr10277302f8f.57.1732543593791;
        Mon, 25 Nov 2024 06:06:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732543593; cv=none;
        d=google.com; s=arc-20240605;
        b=PonWJ3SX2BvTirgxB9IjUOlks4qHL2JkUeRwVJqfqLCTPkecy4Q6eYgaA2giRpjMSJ
         UyFU2zwvlhqgIEhHetfPQ9hrhIfkZy1zj3JKshOHkQpVBqQJ0xAFwu88TT1BqpyS9y07
         o0UmI/oILjTSdR0BXZbluDalOyvda19t7xG60o4wiItZWgLGVK1ndXMVRrWvg1GyfRtA
         apIKfwrAfW1tegdmnhJD+pPCmTJatsfOutL2eEFRViyVVB/D9iisbVyaF4+OuTGxGplV
         sRjKLTAd0bNIW877krlazWB+UGZ2fN5Zwy7GAbWTX/qGNqelGjn3oe4Mg8UTEQDoQNOm
         yvow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=bzQt7LYQ0+9fV8zZopMVzvqsJnnAOoFEcI7W3eeHOtg=;
        fh=H/GJM1rxtihb7UkYoYK/2gQYC2SFknzH1IZC4qFjth0=;
        b=SuEC/S94HQRoQcsanGEf+wtydkWnduZTqaYB6VYfGQukYURAphPWJ1mutHm0z7/RoX
         gPCPRdnzXnponlKInFqOr5TgzS89LHfj46m96fR/CJabRAbb5XloR4YLGLxM9Y9KEg+d
         lj5FXJGVF+2pajRd6Hmamm0P+/VMGafnpi83f/E/tq4gYf25R1UYf7B9BHqgJcV0kBFu
         rdBpl6Ge8ePup9ZE+GDbAXSlc9FleF0o+nds5l2MTGP8EebtIQ/efy1afFoMwHkqWQQU
         NWzxM2xBUoUXQGLV9wB6fplyFnoEzzZk6JgMzOvOGox14xoGvgT9uvlUQhhZnWAkTI+G
         asuA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bug7QNop;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-433b01c35f0si46225e9.5.2024.11.25.06.06.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Nov 2024 06:06:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bug7QNop;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tFZjQ-00023i-U8; Mon, 25 Nov 2024 09:06:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tFZjM-00021n-L7
 for qemu-arm@nongnu.org; Mon, 25 Nov 2024 09:06:24 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tFZjI-0006Y7-L3
 for qemu-arm@nongnu.org; Mon, 25 Nov 2024 09:06:22 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-434a1639637so5006755e9.1
 for <qemu-arm@nongnu.org>; Mon, 25 Nov 2024 06:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732543579; x=1733148379; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bzQt7LYQ0+9fV8zZopMVzvqsJnnAOoFEcI7W3eeHOtg=;
 b=bug7QNopQ/aUzl6OsovFq2Z4orsEwFxEisewcRiZHc6IRI5VgBt8zAPYMk9EI5X3XM
 3iZ3pdlNdFvst8PmysalErnlvBtDo49AtI2hna9sDwkurup1o1HbvnbDH+VAyqJMSgAS
 wvQHfQpFkbicOgsjyaq+NQUAiXIstUnE5czgTsVDorkrNe2GGGylkwf833Ylj7KzPCn4
 FJeLXRjE/kZdBWAJD1ORwZ9LtLCnXeS8a8U2k3gvNBR13pu6EUJWn3jIg5t4uVejmvyk
 sCIYIQOknZvW805BlpRVF41sWjlwZMurqKbEIbzRDmd1v7MIFp7WzGsOw0+oGPRLWbKR
 UgaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732543579; x=1733148379;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bzQt7LYQ0+9fV8zZopMVzvqsJnnAOoFEcI7W3eeHOtg=;
 b=YptJW1zu45xaUDblu1/9PysTUBTPzndx+EvDlmL0LSKNohNqkL9RT03mU4Bn2LCyWb
 qrkcgWqFnSFyt1CF2gIcC7uazqjgIrho/X19xd+p2eFrvr4Kq8y5PRS+OwcbfW2H059Q
 N2tA9G2Ts8bQwbiLFJ3W+bAslN1qs2blBhc8RWEB/OPqKe4XAdVTe694seiItN8NbDm8
 T4OQpewckckmhVOeY1pGivcZxu5WdsV811Cfpz9EfHd5go+wW77ZTibzNuUziIONw2ac
 VS7pGJVIO9z6zkpqLRGb+xmlNqBGfrkBwBNQPo4dnBxeTDKfEt5CjVL7tQZPIhDjnFEy
 EvcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJJxV9F9XZ4miYm8tQ/DBa3idqjQ9CdaPZ1xV9sPzETAKsyqxAyL99u5auQAj5Cv4vlzf/47iaJA==@nongnu.org
X-Gm-Message-State: AOJu0YwYVJSSeNIEbw9H6KIfds+8wzZ0yHx5RGIVrtDqPVwJiJYV2UOz
 kd7y1GnK1mk4ARppbrgwQ1c2g/NJ61iscHlXefucSWCJPeqzYQ1N58SOsE/Hfg8=
X-Gm-Gg: ASbGncsy+7oQsJ42F3NF8NvgdCO+YPfkrC577LKPHuhPJGJW5m9QL/0Xl/y8K4CsY6c
 OlSYrOJhXMj//BT0XyD7Z1cYeB3uRltta04DvfTTfyOPhgoUKfwYfX6FO2IteOZFrk8W7tRiE0T
 NXE2A+dSaxrGiQZAXZGfSVVVSknBy/zmnUuYaTXFRiYNoRnS/OPxBpqVaLb2lf5RWY7BDa7DVgU
 1gl7Y3VwnVzWHrS78mjslefCcNn82tVYwnuQ8QbJ5aDTsez2MTBMT7iGBXIVFb6yyLlN4M8
X-Received: by 2002:a05:6000:2102:b0:382:3419:46e6 with SMTP id
 ffacd0b85a97d-38260be1efcmr8856441f8f.52.1732543568479; 
 Mon, 25 Nov 2024 06:06:08 -0800 (PST)
Received: from localhost.localdomain ([176.176.170.239])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fbedf40sm10338059f8f.98.2024.11.25.06.06.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 25 Nov 2024 06:06:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, Zhao Liu <zhao1.liu@intel.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, Radoslaw Biernacki <rad@semihalf.com>,
 Thomas Huth <thuth@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-ppc@nongnu.org
Subject: [PATCH-for-10.0 1/8] hw/pci/pci_bus: Introduce
 PCIBusFlags::PCI_BUS_IO_ADDR0_ALLOWED
Date: Mon, 25 Nov 2024 15:05:28 +0100
Message-ID: <20241125140535.4526-2-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241125140535.4526-1-philmd@linaro.org>
References: <20241125140535.4526-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: GMcAvIGjag9j

Some machines need PCI buses to allow access at BAR0.
Introduce the PCI_BUS_IO_ADDR0_ALLOWED flag and the
pci_bus_allows_io_addr0_access() helper, so machines
can set this flag during creation, similarly to how
they do with the PCI_BUS_EXTENDED_CONFIG_SPACE flag.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/pci/pci_bus.h | 6 ++++++
 hw/pci/pci.c             | 1 +
 2 files changed, 7 insertions(+)

diff --git a/include/hw/pci/pci_bus.h b/include/hw/pci/pci_bus.h
index 2261312546..5c8b0d2887 100644
--- a/include/hw/pci/pci_bus.h
+++ b/include/hw/pci/pci_bus.h
@@ -26,6 +26,7 @@ enum PCIBusFlags {
     PCI_BUS_EXTENDED_CONFIG_SPACE                           = 0x0002,
     /* This is a CXL Type BUS */
     PCI_BUS_CXL                                             = 0x0004,
+    PCI_BUS_IO_ADDR0_ALLOWED                                = 0x0008,
 };
 
 #define PCI_NO_PASID UINT32_MAX
@@ -72,4 +73,9 @@ static inline bool pci_bus_allows_extended_config_space(PCIBus *bus)
     return !!(bus->flags & PCI_BUS_EXTENDED_CONFIG_SPACE);
 }
 
+static inline bool pci_bus_allows_io_addr0_access(PCIBus *bus)
+{
+    return !!(bus->flags & PCI_BUS_IO_ADDR0_ALLOWED);
+}
+
 #endif /* QEMU_PCI_BUS_H */
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 1416ae202c..de3f93646f 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -1475,6 +1475,7 @@ pcibus_t pci_bar_address(PCIDevice *d,
     MachineClass *mc = MACHINE_GET_CLASS(qdev_get_machine());
     bool allow_0_address = mc->pci_allow_0_address;
 
+    allow_0_address |= pci_bus_allows_io_addr0_access(pci_get_bus(d));
     if (type & PCI_BASE_ADDRESS_SPACE_IO) {
         if (!(cmd & PCI_COMMAND_IO)) {
             return PCI_BAR_UNMAPPED;
-- 
2.45.2

