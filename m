Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp1863954ejc;
        Mon, 30 Oct 2023 06:22:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTN1suLyH9kxUTDyCYJEckpDUbdRerxewI6+0Y9urVcX4Hw/h9Q1b73Rq8KYOkmftioUUs
X-Received: by 2002:a05:6870:ef0f:b0:1e9:dd69:2fbf with SMTP id qq15-20020a056870ef0f00b001e9dd692fbfmr10600648oab.48.1698672141783;
        Mon, 30 Oct 2023 06:22:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698672141; cv=none;
        d=google.com; s=arc-20160816;
        b=unGUyV1EpQ0C6Gl/LvatHvOAk2caigQT+cIex4r+2JoLSueEwkXxZseg5t7pMFj2f9
         mOqaDoEZ6jQZqcU1If38hoF6w5VHBMJZYroSLbiHfspynY/zc8BR+mrr9h+u9ptrCK53
         3yw8nW+sP7W79/8+hH11Z64pzPSSyXevH9Y0hoxJs1MR0dz+3p5TWgFCYGHR8roEnIOO
         A+6kbBVD4YMmq5/rAEK0DWmz1Sw2egmuDaqoKZknBVXLwsbbcqS4NFH6rj/t7REcpcHB
         H3FLIf7pI9bAIUVWmkuJ6uLONdv9/6LPv0vTT4mjIH+EJSioKG9CxMXEyyL+1NdS2NC6
         fSew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Gj3Rp2NxdAvXLBlpU2SKgm21Lwc0GSM72ztmmw3HKvQ=;
        fh=67Hov/BsT8RxH3/kFZB7fU49Uoc12n1VmFCLNpavJ9k=;
        b=kavjP0xSdOVAkoNi2pKpxNg2MZcW39MjiXhTEVlckJjsv/FufmRjMbT7HbYoRSLken
         HC3ix/NVRXjH0OF5aZbRqzGc9Rd7M+jP7RwU6MWFEZ/qMFel79xvmvRqZYH2xnw54v32
         3txE5qAvhkiPnaktmecksDLbYJ+vsgs1vhVdZssMRNnJ6oAAx+z8N72cdGvf1H9cbY0d
         FCQd10kDo33wYU8Liq6xtuZiTn2/fJbMjyi8YmjtjGN/4fVkloKU5I+FS0x7IYL36g42
         1QTHRSuDl0RV9ynYo8pDKW4y9QjhIK/4zJjIQkbMr/hSrkpGjS0/7XklG8EjOrkUksII
         Ebfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=Z4tcBdnh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a6-20020ac85b86000000b004196c772a18si5524075qta.477.2023.10.30.06.22.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Oct 2023 06:22:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=Z4tcBdnh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qxSD0-0006k5-Pb; Mon, 30 Oct 2023 09:21:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qxSCw-0006hC-J5
 for qemu-devel@nongnu.org; Mon, 30 Oct 2023 09:21:30 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qxSCt-0002qJ-Oc
 for qemu-devel@nongnu.org; Mon, 30 Oct 2023 09:21:30 -0400
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-5a9bc2ec556so2960621a12.0
 for <qemu-devel@nongnu.org>; Mon, 30 Oct 2023 06:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698672086; x=1699276886; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gj3Rp2NxdAvXLBlpU2SKgm21Lwc0GSM72ztmmw3HKvQ=;
 b=Z4tcBdnhGYzNgp2PWTWmFWhN7XqqWnymztnqBzUgR8wBpUw1rBn1X8lIPRfFtVmN8E
 avwRx+wuZeeNb8N44GKoUHSKvEzzqv7L8rxLDI2TJOVYnQKR95//Pmj6SceP9jxzWXZ9
 cADrSKl/9kAeOHvKl9xSWE7UKw8j/InkqUh/Mf+oOTWVq8UL/4nA+DJcOmiSVM+qlEnl
 ds/dtH5ZEks7Uv1dEfm22I9HLyN0ApriMgNwGuXZCEbnQqrIKm9E2rXWT99GNOydnlC4
 2YqzcrBy9ZRbuy8SRTxznxSimzY4I8f7SgCza3fgJJws0DWrY/DhM5b7lp+ckpNWWtwY
 TUjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698672086; x=1699276886;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gj3Rp2NxdAvXLBlpU2SKgm21Lwc0GSM72ztmmw3HKvQ=;
 b=okR1/amHR5njmzLvbT3YZRf4izgeTUCl2Dp19k8UZHsa5x+EOnMIQL4wFlwjtoAv1D
 7YL/bMcelFWmEEPznbxYVtfgnIuikFq5mUk+RVD2M7rn1y2kmjhEr8IoYI44j1foCNrc
 47vbg4Qvj++SPmm+xLeVrsKSvwqTnueDlJb1z8bcZhslPwhqO61O41RJbjXEIpGxuPDx
 /UBL/9Z01e8AhgoW46li2/euaNVO1OcWBOQIH1S/jqa+5gH8OlvACqrTJLsE5hjX9bwR
 ui6xoIPThH2BTj5Et+yfEENJ9v4NP0hOtOL8PSK9r1tNF6UO2IivqNCzpLK51vWm3LVm
 MzxQ==
X-Gm-Message-State: AOJu0YwBVSSrU6co6fFA6J1Y7cO6LLnUvvYRK5FpRdAn0p5LxEQ55FQb
 5dgvLUpapQxrl0I+aBcowWVPAMvnf1CmSXAOQf2FGQ==
X-Received: by 2002:a17:90a:199e:b0:280:9073:c474 with SMTP id
 30-20020a17090a199e00b002809073c474mr335428pji.38.1698672086384; 
 Mon, 30 Oct 2023 06:21:26 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
 by smtp.gmail.com with ESMTPSA id
 15-20020a17090a000f00b0027ced921e80sm8122412pja.38.2023.10.30.06.21.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Oct 2023 06:21:25 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>, Haibo Xu <haibo1.xu@intel.com>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v5 03/13] hw/i386/acpi-microvm.c: Use common function to add
 virtio in DSDT
Date: Mon, 30 Oct 2023 18:50:48 +0530
Message-Id: <20231030132058.763556-4-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231030132058.763556-1-sunilvl@ventanamicro.com>
References: <20231030132058.763556-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pg1-x535.google.com
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
X-TUID: s/3l6+Uao37+

With common function to add virtio in DSDT created now, update microvm
code also to use it instead of duplicate code.

Suggested-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/i386/acpi-microvm.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
index 2909a73933..279da6b4aa 100644
--- a/hw/i386/acpi-microvm.c
+++ b/hw/i386/acpi-microvm.c
@@ -37,6 +37,7 @@
 #include "hw/pci/pci.h"
 #include "hw/pci/pcie_host.h"
 #include "hw/usb/xhci.h"
+#include "hw/virtio/virtio-acpi.h"
 #include "hw/virtio/virtio-mmio.h"
 #include "hw/input/i8042.h"
 
@@ -77,19 +78,7 @@ static void acpi_dsdt_add_virtio(Aml *scope,
             uint32_t irq = mms->virtio_irq_base + index;
             hwaddr base = VIRTIO_MMIO_BASE + index * 512;
             hwaddr size = 512;
-
-            Aml *dev = aml_device("VR%02u", (unsigned)index);
-            aml_append(dev, aml_name_decl("_HID", aml_string("LNRO0005")));
-            aml_append(dev, aml_name_decl("_UID", aml_int(index)));
-            aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
-
-            Aml *crs = aml_resource_template();
-            aml_append(crs, aml_memory32_fixed(base, size, AML_READ_WRITE));
-            aml_append(crs,
-                       aml_interrupt(AML_CONSUMER, AML_LEVEL, AML_ACTIVE_HIGH,
-                                     AML_EXCLUSIVE, &irq, 1));
-            aml_append(dev, aml_name_decl("_CRS", crs));
-            aml_append(scope, dev);
+            virtio_acpi_dsdt_add(scope, base, size, irq, index, 1);
         }
     }
 }
-- 
2.39.2

