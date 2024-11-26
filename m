Received: by 2002:a17:505:4c56:b0:1be9:327d:8ee3 with SMTP id do22csp1935623njc;
        Tue, 26 Nov 2024 03:23:20 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWAYDy5sTDgAJgHwTRJ1THNTLnHzg8kGNRAr/KAd/lKIFueoiWvoG0NCdUFkzbc/KUQ+jY2vx+hj0lBxw==@linaro.org
X-Google-Smtp-Source: AGHT+IEyNFn1BsbxwTqi4iJ+0qGoZZ+xifi7c7vL1spI+BXDmF171OvQn4reBQL2/5Z+az370aqo
X-Received: by 2002:a05:6214:27e5:b0:6d4:262d:da6c with SMTP id 6a1803df08f44-6d856c7ac90mr43794696d6.24.1732620200216;
        Tue, 26 Nov 2024 03:23:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732620200; cv=none;
        d=google.com; s=arc-20240605;
        b=fOIuBfDIxtKEC+xBpHaIzsbOZY43becYfM9fa4JJxtB2Z/cdEuhOyt4EYmVkVYpR6h
         wRk3vov4RIkXwHHByD2x+Wa5FH8PEhW77UZbm7lar1r2i+90aaGuRUZG7DfbId9ccXhH
         W9PKdblVgQHfoI0RVIFZIHT9/FB4mliz+XT5j6IYNAaSM4KNHvbnTXHnRBQx9MYBIgtn
         DFmN18E3nu34q+lDfLxHceVvInXbz3PzDFrU8S5v/NSkYMo5d9q+/GURFBHmwrcVo/Ah
         ZNgPtXp8tpSFDdemc4sns3Pfs53L4wAtB89mzqyV3hsWS9u7BKumcQaOn4AKD1fFYdpr
         Xsvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+qPY7Uz0dqRmk2gQ1cO3DBCcFXLLvxMC18yQC1ilSgA=;
        fh=yxukv0UjYgP8dJ2IfXGWhknMJJ9vhvd3rjyEM/51RGU=;
        b=E4L3/dCBzTBQTw2zik+SL1H+o5ZiAx9e9l/UFwNjfY2FjM0dsmbAfYnTPSN50hmXLK
         M+skJIDqc3qG/rcYpDtHwnmjjoGd42dzkQDL9A/DstW4OAw/Ipq9xUcDOwbwdm+kaW3B
         fup6pheeAz0DjFecrDO+tus4V97mLCrfooHyIwZ0ieSJahk2wfFYwyOssqPB4SGSgZDC
         ai5rzF6Cg98MqMLsEbHkPu1TE9el4Tqsu1QeHdmjIsBzln3NU3uU0hgfeZ1XCEwKmKy7
         afaGHH90Dznxy+oziF3lQDJsEFQ1m9MT1mrXnXulDYWJm33Rl8c2l5GjmaamLyp4a/vB
         Pxwg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G31NQHlv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d854389316si30645646d6.69.2024.11.26.03.23.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Nov 2024 03:23:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G31NQHlv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tFteE-0003ht-Fp; Tue, 26 Nov 2024 06:22:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tFteC-0003h7-60
 for qemu-arm@nongnu.org; Tue, 26 Nov 2024 06:22:24 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tFteA-0002XH-Hb
 for qemu-arm@nongnu.org; Tue, 26 Nov 2024 06:22:23 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-434a766b475so3618065e9.1
 for <qemu-arm@nongnu.org>; Tue, 26 Nov 2024 03:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732620141; x=1733224941; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+qPY7Uz0dqRmk2gQ1cO3DBCcFXLLvxMC18yQC1ilSgA=;
 b=G31NQHlvGZkGawebft97sYhAhilqUvGvkbd1zMeMwhwlN14M5eRWiTdyyCvvbnxC4R
 RP34PkS1VK4rlcCJ/lPYuUJR1oGU2dbuBxD8DbTBC/kIlCS8YWBugmj496sPikjghPQZ
 w8jdIfgZIUwIT9xpBaE+LWrmstHQDEk573vvWcVNlOqpgEd+oKx31Ge3/EUqrg1BZ4R1
 oQmGr1FdTou24m7GXGJtJ2gnhCVZIOQ8MyvVsLEZW6eSXAsfHn5FY6LXLW0iTGF3hnoU
 WKGAmMMyFBQ61vrXbrC+fAX43htEOU62rrRhwji0xmbnQ83nZb9KIhRF+XXZhBwMMnqp
 KJSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732620141; x=1733224941;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+qPY7Uz0dqRmk2gQ1cO3DBCcFXLLvxMC18yQC1ilSgA=;
 b=G+sIqVnajwU8n3PAp23dh0xG49NpBP2faVU4TBPYvPJi/78uNqkYQ71kLyX0cb+cVI
 mIEEvlZ68QwSvmIEnFNqeZQmhAqrlNvdaLBOIaTNplIyXeaFgWgNLVJmrJVrmEpuwHXU
 F77ubPOP8qyJIbL4uq0Q+tjFaj+jUOdl/aOWfMC8U2oyCu30EQ9fuXvmYPRwLBplZqEF
 itV3lLXbc2uK2Qx8hbZOOK6xfKhX59RT8+U46rCqeeHrzmEMTT6zdp4RySDkqdyjKE1j
 aqG03eBYhjr/s2K3AgnwMmtRP0RJtBslc9FDw/W+84WhvKZGUf+nsEzflRgb77QM6jtd
 tqQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMXqEY1TLMxY5fc37vofjzkKL6rTMQSU0EWsUzoJG5quA1EIE7IahYva6Lz6i8BfosgRM+2K8N/g==@nongnu.org
X-Gm-Message-State: AOJu0Yy9t3jsTHS1+//YAMHejMkEXGNqoqpYxQX1VyHEE39xaIuyTMz/
 1vqONuahwl9TZewHADDL8RhkViZNr/uFJxo5/F4e/lqob9Jizwx9MUrPRPUEqxU=
X-Gm-Gg: ASbGncsJyvO+H7hzihGfbuepBMZ6Pm+WLsQL7Mobg41LwcGp1Qmb+Eob+wABvYa24MW
 /peTkNILKGVo47WNwmH2E3Afk0yYNvQt45yBPWaYEqIpCThuwWGSr0OgASX5Pc0zJ8RiVGXzCF7
 sn5TJciThxz8PFcVZ3Vq4fqiIE7203ptb5hNh/pQBFaymCSoJ0epbI/Y+pDvns7CY8xSE0U8rZ2
 HuOZCxpggpUeAt+W9IG828xyGHUFUzdqrTRWGKonBwlPeT4rcv9oHPtGiYkGn6I7sO8QPWZ
X-Received: by 2002:a05:600c:a12:b0:434:a19a:5965 with SMTP id
 5b1f17b1804b1-434a19a5bf9mr43582535e9.6.1732620141039; 
 Tue, 26 Nov 2024 03:22:21 -0800 (PST)
Received: from localhost.localdomain ([176.176.143.205])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434a50613c5sm25019945e9.0.2024.11.26.03.22.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 26 Nov 2024 03:22:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-riscv@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.0 v2 01/13] hw/pci: Do not declare PCIBus::flags mask
 as enum
Date: Tue, 26 Nov 2024 12:22:00 +0100
Message-ID: <20241126112212.64524-2-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241126112212.64524-1-philmd@linaro.org>
References: <20241126112212.64524-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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
X-TUID: zs16XHFUUKUw

We use PCIBus::flags to mask various flags. It is not
an enum, and doing so confuses static analyzers. Rename
the enum as singular. Use a generic unsigned type for
the mask.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/pci/pci_bus.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/hw/pci/pci_bus.h b/include/hw/pci/pci_bus.h
index 22613125462..6ecfe2e06d5 100644
--- a/include/hw/pci/pci_bus.h
+++ b/include/hw/pci/pci_bus.h
@@ -19,7 +19,7 @@ struct PCIBusClass {
     uint16_t (*numa_node)(PCIBus *bus);
 };
 
-enum PCIBusFlags {
+enum PCIBusFlag {
     /* This bus is the root of a PCI domain */
     PCI_BUS_IS_ROOT                                         = 0x0001,
     /* PCIe extended configuration space is accessible on this bus */
@@ -32,7 +32,7 @@ enum PCIBusFlags {
 
 struct PCIBus {
     BusState qbus;
-    enum PCIBusFlags flags;
+    unsigned flags;
     const PCIIOMMUOps *iommu_ops;
     void *iommu_opaque;
     uint8_t devfn_min;
-- 
2.45.2

