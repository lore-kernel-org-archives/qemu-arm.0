Received: by 2002:a17:906:d96:b0:a23:4dac:818 with SMTP id m22csp852533eji;
        Mon, 18 Dec 2023 07:03:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGCjYjB+I9AbyY6dqJuM2QAegHrTC/sxKN4aVs4aHFBKjYCyi1x/838xFIIU2Q8WvSGX8b/
X-Received: by 2002:a05:620a:569:b0:780:f10d:939c with SMTP id p9-20020a05620a056900b00780f10d939cmr598538qkp.154.1702911835188;
        Mon, 18 Dec 2023 07:03:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702911835; cv=none;
        d=google.com; s=arc-20160816;
        b=dcfCpEJieGn5A8GwffNniBs9sVVaXuAmHB9ZxHWVcEv/UooQl66iY6AjvqVjnBvMw0
         rur0euyOQfWk2qQILCsea7kidkEuV0lsG8PsFRYsopKTu2BLuFrp+bKFGIMI6a83D5Co
         YO73AcHeU9rQTiY6nIz5502Lfgzev9emyeEsW1QTK8aMYHMwYVRUYhjzNHWSe5ea8JSW
         4wv3X51fubpB0pYmEufMjcwgJTz2BgFcourIu6Vji9Tf4qcGSIueBsCB//rpH758pEYf
         /jxx9moCRla4E+w46KV25XTU7DvBjH25YTHpDrWzmhexJ6Ph6lV6hgnOQy9qcGthTfdf
         DLiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=0G4mli43rxQIFAxng87lycqryCrXbuE4wxOKTPRmEvA=;
        fh=67Hov/BsT8RxH3/kFZB7fU49Uoc12n1VmFCLNpavJ9k=;
        b=D+O2ezoDY8fyo0fnziNaRYA+mD+WX1e+sTX1HuXACH9b/SnjSZxieISiUk9afmzXaL
         hMQojkIaRoPP/rGCLE7ThewpsWLFjuyiy7/2cfdfZO02mi3r+VnX5CXsRmQWffymfaEw
         nhKLDYtwKbB2Elx5Vu/0raAzRiPV2Fh1Z5j5hqj+9x5mBhReqQed1BiivMSToD7thPx3
         /OYYorxetgcCRxswr8R+2XtmV/U+J1b2BNs+xHxIPEP0AzeNaOSrCXcaHnKx0bOOp1T+
         2Ga4IgjdCVgguIM/XkHdDuMIyebiu4pFOIMrpA+diqq1x8qbvo7FI23YiOTq/zpo4uNH
         INMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=dAO799Ub;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ea24-20020a05620a489800b0077dc528f856si26288982qkb.19.2023.12.18.07.03.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Dec 2023 07:03:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=dAO799Ub;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rFF9O-0001Ts-Ob; Mon, 18 Dec 2023 10:03:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1rFF9M-0001Pv-Ps
 for qemu-arm@nongnu.org; Mon, 18 Dec 2023 10:03:20 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1rFF9K-0007As-B8
 for qemu-arm@nongnu.org; Mon, 18 Dec 2023 10:03:20 -0500
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-6d3cb1ccccbso841131b3a.0
 for <qemu-arm@nongnu.org>; Mon, 18 Dec 2023 07:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1702911796; x=1703516596; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0G4mli43rxQIFAxng87lycqryCrXbuE4wxOKTPRmEvA=;
 b=dAO799UbSSA2mWbptf0SzEeJ8j34GT0NTRQJBp+Axk49wKoCJmtIwkoTQ3iXowWxrY
 6mhJOVZ8KFa2IaKYPvAFBFMfTAVccY9QDtJDZRTDRwtHBiknB49eoOi7lDs+BhTZrIVA
 qTut6iIP2R3DY6v9OLsLOzjSEWuFrzYgl1mMewL/+RDUBcHJfXP1w+ryKrAWyCC1hZ74
 USPhMJjJ9v1mSnK56M/43sUeSMyypuNCWfw0UHltBHdwDhjAQs/wes6mX/bwYGvx5Cdz
 pEKTPykMBq7nUlgAAPJK5a+JzKUm9l62CMffJB9SNQ8hHVaJbwxxzpAbJpZJHtu8pdMo
 7Kfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702911796; x=1703516596;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0G4mli43rxQIFAxng87lycqryCrXbuE4wxOKTPRmEvA=;
 b=JvCoPGDeSGtzv1fxnsgRuID2Pg8pZzsNNor5MWY1f8xURMpjt5Z5w5StV0EZ+zzMnc
 bGN7i1g+EliNsWv6PpAWL9bEN3OBgdAtH1IMybekQ1oYA+lMNvnjpEwBaLg8vclT05Gw
 gyVl34PhF55ywikODIGnfpo+LQRE6b+jeo3oUg0kEjPK7cld4yhXD2KpAGitjFihy1vM
 /4X0hxzTFAg+p7Il1Q4zeIFsHFIaZ3VYpz+w7AfviUynbmpXSfEQeGvxczImG/aTDRs5
 WxwqyGMyHojcI5tbimoHXsh++ZkHFPuPAN9vwOof3+UU+SnpSwJJkdIqSuTiEKmLnvxy
 CUSg==
X-Gm-Message-State: AOJu0YwZzd5nzlDY7cvcC/0JywwjFN3iCbgqH7HURUUcuHKsrEpaPZBB
 REVpZKlbHOQTI8zb/i645Ti6U1PUBR6y0XTJmAc=
X-Received: by 2002:aa7:8c42:0:b0:6d6:3a0:ae34 with SMTP id
 e2-20020aa78c42000000b006d603a0ae34mr809312pfd.16.1702911796452; 
 Mon, 18 Dec 2023 07:03:16 -0800 (PST)
Received: from sunil-pc.Dlink ([106.51.188.200])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a056a000a0100b006c06779e593sm18975505pfh.16.2023.12.18.07.03.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 07:03:16 -0800 (PST)
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
Subject: [PATCH v8 03/13] hw/i386/acpi-microvm.c: Use common function to add
 virtio in DSDT
Date: Mon, 18 Dec 2023 20:32:37 +0530
Message-Id: <20231218150247.466427-4-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231218150247.466427-1-sunilvl@ventanamicro.com>
References: <20231218150247.466427-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: Oyt63FISxwqU

With common function to add virtio in DSDT created now, update microvm
code also to use it instead of duplicate code.

Suggested-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
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

