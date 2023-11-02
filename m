Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp530103eja;
        Thu, 2 Nov 2023 10:03:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIFaepYtgI3q3as2veqhJ+Qqz3HCgAQsmZ6NJJl1swWeRiXm15W/NZLx5GqJ0/eUAF38Fr
X-Received: by 2002:a05:620a:4013:b0:774:2afe:97c4 with SMTP id h19-20020a05620a401300b007742afe97c4mr169495qko.12.1698944586480;
        Thu, 02 Nov 2023 10:03:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698944586; cv=none;
        d=google.com; s=arc-20160816;
        b=EvVQaHlfsdLhXki/0kOehMgx7w/gWUEijC+rqU3OLZW7cSev/ZElc16cELA3Ebu8Bg
         LMyHVRaAbjeNT3hH9A4Z4hdJ+7BxC7lSGAhIyu8KfZek9zMWM6JLa6M5T8HnMkU9mq7f
         zpLVMFT57Pv/k4XRg1pV1h/K6ig0MxaUiGo0rZv+kDmuw/V7dV7vZezMRj6DZYjFDSAB
         i0eu3jtmy/6MQ6Q5RFdE1vnJf4NFw9kvFV60EDpI1fo3qnRaN0IFNQb9HQ1dKR9LK8qg
         1cauq2HKPDJNOaxR5PLoTSjPpAiAP9wRqT0GWNFyw/A6r7ilXpWTUpApC2sJqlR4Xy7K
         SYbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=0G4mli43rxQIFAxng87lycqryCrXbuE4wxOKTPRmEvA=;
        fh=67Hov/BsT8RxH3/kFZB7fU49Uoc12n1VmFCLNpavJ9k=;
        b=UWL3sSZDOfoW69v9k33MtSVk/Lqy/GVYOLGL3g8aWvQVZZ75rDN8rsNPJ2QESfqk35
         sBsjxewUvEpPfsH06lb5THWsWeGoBLBKG2FSlUKtMoeeI9XJ+q0DGmQUf6Tnghu9yNtQ
         Cp1PtgW/s+SsTvMAfqfRbuAYAAROw/KQ+/4cSl3ZmO5OQ0fn/y26FCw9bPvxVbF340cl
         8zn7AoFMftOKCfJgkBzD78vsmpZpFJLevwrpUPnNCWAuOasckKwg13c2k8xL8nNbdSD4
         NlmCvooTFcHxnpoJM2c57QH4M04HJ9/C5lTsca31eeN8C+hjlEYrFDAsDZKC0FJV1g1A
         r4nQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b="Ubvp/F2c";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j30-20020a05620a001e00b0076daa449cb8si223980qki.224.2023.11.02.10.03.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Nov 2023 10:03:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b="Ubvp/F2c";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qyb5u-0002kp-IC; Thu, 02 Nov 2023 13:02:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qyb5s-0002hk-O6
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 13:02:56 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qyb5q-0003kz-IE
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 13:02:56 -0400
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-5bbd3eb2f8fso1845788a12.1
 for <qemu-arm@nongnu.org>; Thu, 02 Nov 2023 10:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698944572; x=1699549372; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0G4mli43rxQIFAxng87lycqryCrXbuE4wxOKTPRmEvA=;
 b=Ubvp/F2c9SJJ7eAZy/PgOJ2kRjxBEb6w/jMpRuad8kRPbhn9R+Ncg5Gi88nPzrD7UO
 8wRokrKNB1bP+So1j8TjPviK4zoMf1ywtAoHQkmPPWUORGYuBxbCjsfYxd1W/A7E6eR8
 2+atNM0I00xFHFcvizb4/UsKJO4faN1xwYpOYbiToASspAmcjAnmRgXnDuNgUFwQ8en9
 oOCPoeodyuObSoAw2TdIOUpO+z/MBaaovprMVRPcqjEA3P9XWBiY5xLyxMWpCIhvSAnw
 mCOZbAgbS9SMZ5aqXvw3OQ4Q3joXOvKpYR4Hqqd4qLzyQ12H+urwCnpguzeeOsNjYlzB
 NVsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698944572; x=1699549372;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0G4mli43rxQIFAxng87lycqryCrXbuE4wxOKTPRmEvA=;
 b=iklnXBQ+L2JHuH7WLSLlTiWgMMhwgE+7Ppu1Twsq/VFt2HAcyi51BLqGTpxFqOMKPo
 xWb+GWd9PcA4W++hSVyTcyTbUQrLAHQiC7ErhnFeVt8qBXip/9mSTZ6uiIvQYrIJdF3N
 0NWe2wj004ixk4pp34xEhbaR+39yxslqdoo3RndgkiS2chvADT4sVMId7SW/Sonka8eZ
 jclclAqpenrDhKSikvY3Q8Si3YyEUxlflIiXRQZdfv+C58xEviIafUuRqIbEod5S3bYe
 zaDQuWRLbcNNIlxXn3NW5L0a35KRP0YRNOc9lxCYaCHHHXRvdZR6Zu730Awh8DIvm8fZ
 3feA==
X-Gm-Message-State: AOJu0YzwsJ5LF+k/NweQiZdvo2x5XA/+UfaxC5wSrGFsKhbblaqQWVPO
 nFZha43rkJa4tNIMnYMLP5TRx3GQg9k7mjW41L8gzQ==
X-Received: by 2002:a17:90a:17ca:b0:280:cc28:9d2b with SMTP id
 q68-20020a17090a17ca00b00280cc289d2bmr138546pja.0.1698944572412; 
 Thu, 02 Nov 2023 10:02:52 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
 by smtp.gmail.com with ESMTPSA id
 18-20020a17090a031200b0026b70d2a8a2sm25098pje.29.2023.11.02.10.02.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 10:02:52 -0700 (PDT)
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
Subject: [PATCH v6 03/13] hw/i386/acpi-microvm.c: Use common function to add
 virtio in DSDT
Date: Thu,  2 Nov 2023 22:32:13 +0530
Message-Id: <20231102170223.2619260-4-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231102170223.2619260-1-sunilvl@ventanamicro.com>
References: <20231102170223.2619260-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pg1-x536.google.com
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
X-TUID: LOlwoZUE33E+

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

