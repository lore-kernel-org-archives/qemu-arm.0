Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp442936njb;
        Fri, 13 Dec 2024 05:35:31 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVRUbpS9MlySWGtopPAn21XDuPt7MNK2CSOKAK/T2RXdZ/3/MDZoZifpd6DRL3iITJuv1U5/w7yrk1OKw==@linaro.org
X-Google-Smtp-Source: AGHT+IFVFOzavDwMZUimQnerG83isp8OvAJh41NcrpTDsEhce+F4hLUjZB0R4Xw2ey6kalSxY09C
X-Received: by 2002:a05:622a:1181:b0:45f:bc9e:c69c with SMTP id d75a77b69052e-467a57192dbmr37803581cf.7.1734096931247;
        Fri, 13 Dec 2024 05:35:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734096931; cv=none;
        d=google.com; s=arc-20240605;
        b=KxJ6EigvWC8ZWkQ1SN/LQtPZ3b82TM6JUKp5zA5uz5en2YH8QIAXVgs2PMM3pRJKgZ
         ywuuBquGbpnnXQUYKcRO12fpxI5hXEdj9OU/jt54IWVrCS9dnzS/LI6cbMNvTN+0nnF4
         Ts+Tn0P7wCHQzABq5q9FhIQsnKNH7DNg58p82gU4CWYJyZXl601G/aeLpKiMVV0nUmzd
         uYRBDO0lZo0QLx7583TbWmYug4Zgma73MckeWQ2XZEB7fp74VgfU84EKwKIZ8pZjwiy5
         kDauVqd7rNAUMRp8qP5Ztht3XzXxsscBhi+6g4fOeXwhn+Taa90Ixyjnr5FR/ZwJ4/R3
         Fs8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=NOp9iHpt/Xa4k++YQIG/ZHdZLo2cw6SbKLu+TNop+/w=;
        fh=5/bEEfneXpYiCSLu1RRtIdWOVpk1SgQYYFlk2zFRZHo=;
        b=NrXRDvWodzznkL2zZlrd9/VgWri9kga1JngisTn8gzcnV0msZXR4Spj1XMfzf4WaX7
         nvxLo6iQYAAW1mFQf2MTHleN22utDBYMpPS4YJmqtCPGOtSsvcRQskJJaBCK7fsIa+gQ
         THbuLj4TPx2Edzto4i1J1GzdGnyZBgZY2XdKCtStpsdeAh5nTjCOGU6YcMw/e1B9FfZj
         HYo4IWfOMFeKXZHWhaTGCvM7KctOitXNX5pxZlg9ZfztVMNKi8k3NrCTisynxvTjekY7
         lscY09fZMFgfzTQ151xNRJxh2ZZ/3ZlFn121q+UWcbSQuJxAHKMHF9Ibzk6gVmE8uUdS
         IqAw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IT7EvcZu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-467477828d9si173633631cf.142.2024.12.13.05.35.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Dec 2024 05:35:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IT7EvcZu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tM5pB-00061J-Pz; Fri, 13 Dec 2024 08:35:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tM5oE-0005Eu-Tk
 for qemu-arm@nongnu.org; Fri, 13 Dec 2024 08:34:26 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tM5oB-00017O-JS
 for qemu-arm@nongnu.org; Fri, 13 Dec 2024 08:34:22 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4361d5dcf5bso18400195e9.3
 for <qemu-arm@nongnu.org>; Fri, 13 Dec 2024 05:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734096858; x=1734701658; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NOp9iHpt/Xa4k++YQIG/ZHdZLo2cw6SbKLu+TNop+/w=;
 b=IT7EvcZu5hPaCdWncg15GtHUYg+1+E0ArkTR5TdcUBHZtViWx4bMh6bv1dP2tkbQl6
 4yoLCiJswOILA5Unn1HPy/uWis5DuYj4CiaXp9Oe3nfh7K024FwnKQE3tPmfNxy9Ax55
 ZYJYdLBbCUp1zyrfsdRlOG01BW1Jc3QkFbmmJzl8vzC1AeDgcEXGs5Q8gbgO5/MrqhXi
 j18b4LV4u9bhPRjLBBUaAIrvm3W2AxMGVO+AIkY33U/Bu1sB16iCO7siWgagEV83IeA4
 5G6YJenRtyJQexesw+Zvt9qSPLpBF0vx/k83S8hImVt+45NgLidOno9kfqPMT0GuwiBN
 /C0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734096858; x=1734701658;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NOp9iHpt/Xa4k++YQIG/ZHdZLo2cw6SbKLu+TNop+/w=;
 b=mGAOPuKWFGytbLVf8Fp/SdPKGwL6/YHbS8stxRMDyHbQ3Cl+gD6C6KRJPTsCptgbd3
 E0kSX4RdyIf8rcSZI7SNEmx+0HwMrPJmnz+EocudDdKk01S4wlPZAb5FpDexg1Od8FKg
 1NJ5MHHFeZ9BV49I69CINCjjD00MtMH0x8D8FsG1w/sI6KDZfN9t8yzK8Tsstaxy9UMi
 CW+lD237pJ8n7FqjnA6Btf3x2gK39o4q3yowj3ad6WaSwZwb9Ag6LLPtRV5eAjb/qeBA
 yHxaLdpcx1Skz1/L/dmWP8W7wivlLFlHXzyXF+w0r62d/ALTyJPvWk75vzjaKJ6QUNfT
 kSJQ==
X-Gm-Message-State: AOJu0Yx381XJ8EL7Z6tyRHwnYA5OOxymxetJNYHgMf4Pv8b4qvoyxN9K
 qTPzBYL6enujqxRt9kMpFETehiy8h6D0uhx3JqXOOGxgWZvlbQj5+i9NO+glZCs=
X-Gm-Gg: ASbGncsQvVdkiO655LRh3mBQJgRPgLpq+4xF5ZMxd+8BIDc+yLJqg9o5h4irVo38nre
 fBYN+6W1FlOqQN1NOgQWwNeNAJ5U+dO721sXBT/cvOYddLmMBrDDNWJy31FsZV++U0efqvZiUP+
 v0/4GOFyenC9bsitCaAencegQWr60Kk05H002ivg2nzC+ELsmF9LwWDvnil3zpZR7XRPJY7w4m6
 teqqMkFmdmYqCZQ9t53P2sxkWCXKJmdbJmgPoTpkOiWV/H3sGuL1nBs1BI7Df4PGER6R7lezD+F
 1kjH9v1lUiOSt7SjTD4Ib8eHkBKMe4C5Ls9S
X-Received: by 2002:a05:600c:3b1d:b0:435:192:63fb with SMTP id
 5b1f17b1804b1-4362aa1361emr24812965e9.3.1734096857974; 
 Fri, 13 Dec 2024 05:34:17 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-387824c2bf2sm7010324f8f.55.2024.12.13.05.34.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Dec 2024 05:34:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 5/7] hw/pci: Add pci_bus_add_fw_cfg_extra_pci_roots() helper
Date: Fri, 13 Dec 2024 14:33:50 +0100
Message-ID: <20241213133352.10915-6-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241213133352.10915-1-philmd@linaro.org>
References: <20241213133352.10915-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 4qcPKEW+LCE7

pci_bus_add_fw_cfg_extra_pci_roots() calls the fw_cfg
API with PCI bus specific arguments.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 include/hw/pci/pci.h |  3 +++
 hw/pci/pci.c         | 16 ++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index c0717e31219..603c456c3a8 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -297,6 +297,9 @@ int pci_bus_get_irq_level(PCIBus *bus, int irq_num);
 uint32_t pci_bus_get_slot_reserved_mask(PCIBus *bus);
 void pci_bus_set_slot_reserved_mask(PCIBus *bus, uint32_t mask);
 void pci_bus_clear_slot_reserved_mask(PCIBus *bus, uint32_t mask);
+bool pci_bus_add_fw_cfg_extra_pci_roots(FWCfgState *fw_cfg,
+                                        PCIBus *bus,
+                                        Error **errp);
 /* 0 <= pin <= 3 0 = INTA, 1 = INTB, 2 = INTC, 3 = INTD */
 static inline int pci_swizzle(int slot, int pin)
 {
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 8844251eceb..bf0a1840dbe 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -217,6 +217,22 @@ static uint16_t pcibus_numa_node(PCIBus *bus)
     return NUMA_NODE_UNASSIGNED;
 }
 
+bool pci_bus_add_fw_cfg_extra_pci_roots(FWCfgState *fw_cfg,
+                                        PCIBus *bus,
+                                        Error **errp)
+{
+    Object *obj;
+
+    if (!bus) {
+        return true;
+    }
+    obj = OBJECT(bus);
+
+    return fw_cfg_add_file_from_generator(fw_cfg, obj->parent,
+                                          object_get_canonical_path_component(obj),
+                                          "etc/extra-pci-roots", errp);
+}
+
 static GByteArray *pci_bus_fw_cfg_gen_data(Object *obj, Error **errp)
 {
     PCIBus *bus = PCI_BUS(obj);
-- 
2.45.2

