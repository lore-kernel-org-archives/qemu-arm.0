Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2999689ejb;
        Wed, 25 Oct 2023 13:09:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8I/9Gkq2VVo5ouQXFt6NaLtEzqfUhFOZK+6OVUzOlhbI4tUYWorBJ0PP9WzzQO7br/nIX
X-Received: by 2002:a05:6214:c4b:b0:66d:66bd:e60a with SMTP id r11-20020a0562140c4b00b0066d66bde60amr13620747qvj.64.1698264583455;
        Wed, 25 Oct 2023 13:09:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698264583; cv=none;
        d=google.com; s=arc-20160816;
        b=ShNXY5bTPt7Ga2bXQnQuyl3c2DkrKH4pdVq/8q2b/Tmi8Qe5qctAb8wU4vnS/4wOoh
         oLr3/H97y1dseouAwRLLMiWHMJDqXZOM658DMOSRGodSwFt0eJXL5X3Y8W1Uu/FlHVq3
         PiHDVOCx+S8+r+Fo3YhXx4fWEyx8OxisIliaKUwuzvN7WzRauaJvL6fYiv+DQ/mh1H59
         nIiD5aRGiY+lYxcpgwXZJUsNjnkNrZf71Q+a6MqlseBRx526wDnIzYk4V+gPNEPrTc7t
         8tIq5D9VGOje88aT+wrx8FQe+4YnjwaNXmdWxEuCmflGCEyzf2fqLgXHcNKv6YKxyamg
         Kk0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=DrWB82mqgCwm3/T6+kc4cAacBf2kjxAiorZyTleLxk8=;
        fh=67Hov/BsT8RxH3/kFZB7fU49Uoc12n1VmFCLNpavJ9k=;
        b=OUbMl8sxQ6bC7W5ESahHqZ8UQD0yHtp0m3g65xGvF6d7nJi4JBBZ3JQagCA3OwDQf/
         pxPiO+dgtskdG27ntyl3DxViZsdg6ttCS8ztQRL3Cj71oGJxV2A6vmSpTPy3X3duhwyr
         Bha5tKnkXcnDjZ+SSIyOVaIKGu/dSKyS/2+KiKk+bxxwmqk2QnbhYA4AyfQdpq1eoTz4
         pLH3O1BV02Z8RXftv5IW80VpC2wHLnsO5qcBs5vpRiAcsQSQ91d7B929RSWzPilge3cc
         vP511DF6gFIaDWxWJlyF+JDVhohVNVPmtYQxSsDnQFjQVS+f6uAJmDgl8F3APhiS7VHR
         TBHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=I5MG31jX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bu12-20020ad455ec000000b0066d14c995e7si8983444qvb.359.2023.10.25.13.09.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Oct 2023 13:09:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=I5MG31jX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvkAP-0007Ij-Fw; Wed, 25 Oct 2023 16:07:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qvkAN-0007HV-Ky
 for qemu-arm@nongnu.org; Wed, 25 Oct 2023 16:07:47 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qvkAI-0003Qb-Tj
 for qemu-arm@nongnu.org; Wed, 25 Oct 2023 16:07:47 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-6b1d1099a84so119526b3a.1
 for <qemu-arm@nongnu.org>; Wed, 25 Oct 2023 13:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698264461; x=1698869261; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DrWB82mqgCwm3/T6+kc4cAacBf2kjxAiorZyTleLxk8=;
 b=I5MG31jXNjqA5oUTMvev5z+nW7ggzn2sP0luRadkhcU3vibUlVKRKrVvFLZE24uVO1
 yGzxWIgi94A6x2XudqLS6un+OAHJi8BWymHPTy9x67izmUrdCDKItg+PX3hc1NMrPrs5
 QerOuwpzEgeNHCgFsM/ayaOjBLSDh2R+Wt5vzbMVwv6P5jx2IyWmEIAJmlxZBJGv5E6G
 PNNvJJceCDaMbojYw3Q0YgIm0wJ8P2rPfFT/vNCaNH29xGFAZtCU+nk/QDr/957y0vsB
 Tw59SmJRQZUAdEee/Ew68mTtEFTB2VMgfIwvHUuwcO8XEk/tZlx6BYq62EEefptFFmS6
 QqCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698264461; x=1698869261;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DrWB82mqgCwm3/T6+kc4cAacBf2kjxAiorZyTleLxk8=;
 b=LRLdHNYpZGPUF1I6oOIwZvHVSV7j79KT80kYLovtrCGil7mRndfIn0WWd3iZro8ujk
 004mYQDLqH/CE9Y4tw3r/FBIJ/WqbwoHO26xGCSivqWDH98r6RrlDYbOsoS3UtI6n9hy
 RGWrbRfOp07oddPzXsAMjICUpoNeQgXeZyuzKIlIUoIG3iQEUrAidftcqcFmuwj8zIpt
 77Q4LR0+EBpagsm6Z1tRKjKMcgScTD+bSeCoFwk/Hc4MHtIMBoWitALMuS16oA5L9zPq
 3EFXlgFKO4du+38tulFK7zkvY//p9vnVxWWuSHf+b1PxzuGppIMEcE6NEgy2957m/q0/
 9d1Q==
X-Gm-Message-State: AOJu0YwuAsP7xfgLCmJvG2y6B15y3kfEAiR/PgLoMLym5+8tdKAY8Y4e
 DZcXmF1SGOsomoIYx3KAXC0dpsyVL0hZ3n3By52wWQ==
X-Received: by 2002:a05:6a00:939a:b0:68c:638b:e2c6 with SMTP id
 ka26-20020a056a00939a00b0068c638be2c6mr18880464pfb.9.1698264461302; 
 Wed, 25 Oct 2023 13:07:41 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
 by smtp.gmail.com with ESMTPSA id
 f1-20020aa79681000000b0068fe7c4148fsm9696768pfk.57.2023.10.25.13.07.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 13:07:40 -0700 (PDT)
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
Subject: [PATCH v4 03/13] hw/i386/acpi-microvm.c: Use common function to add
 virtio in DSDT
Date: Thu, 26 Oct 2023 01:37:03 +0530
Message-Id: <20231025200713.580814-4-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231025200713.580814-1-sunilvl@ventanamicro.com>
References: <20231025200713.580814-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: n8Cf9HNUpaw+

With common function to add virtio in DSDT created now, update microvm
code also to use it instead of duplicate code.

Suggested-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
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

