Received: by 2002:a17:505:4c56:b0:1be9:327d:8ee3 with SMTP id do22csp1505943njc;
        Mon, 25 Nov 2024 10:14:54 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVltf+SY+nItyhUKMMy9V71Cp4ZhcqZSCNs1RBWh9yafUv2RhrJszsYPrJDISpE42sU4o0LDzOZ0upd5Q==@linaro.org
X-Google-Smtp-Source: AGHT+IEB7TLQoYOUfprHPVcYQikecCPDCsBo/hsgD2znRIwrX+hEakknd5LLVo//8SEWG54MbSTD
X-Received: by 2002:a05:6102:a53:b0:4a4:7312:9131 with SMTP id ada2fe7eead31-4addcc8fcb2mr13253153137.15.1732558493853;
        Mon, 25 Nov 2024 10:14:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732558493; cv=none;
        d=google.com; s=arc-20240605;
        b=ecZUuXHcr+430cqDMjNNR9s4HenoEl2LIuMC8eXAXo6A8pxRDX7NrnUwMgP+ddU3Sm
         +1A7EqESLbRxIA7zcmETDHNz6Pf/v61SEs//LicUJ8I8TIFa3675nDLZPbzEJj+EkEZw
         jB2k7eADOfedrbZLku0dGIf/Q3RXArnYuJvqs3NJNbke0Rkd9f+RuLeVwLp1874X/Otg
         kWa3Ur4tvD8pH+dBE5o5f1gmPtecZTIA5N0p+P6vn2/KTWmw0MZRKv+PVEJlHYQJUfcF
         lSj3OoPGfR+YW7g2K1rw6apeOm4T69imoXEA48M+YUGdU4kYij/ztnpuUUh456uNACrg
         tHbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=MKiSAmW0YTZOm2et5NElSEWiWu4k/YmN4d8Ua0BroHo=;
        fh=xcYvs5Wo83stOI4IJsii+kjc4Ii+xah14cJSoIMXVNo=;
        b=KPUebGrwNt9/tCWAHt39//rlImoEtcRTa2f2G/zj6uSeXUvkyX66aWeFpcko8/XJ+R
         tjSsCHqNYrPTcYLnjeSWbN8N8mcmXhgdmxtHzJXPobA8bcWFZKVyECA1BaQqP8CF+h3w
         KVvVDBm9XSSPcoymIWbHRX18NW1lvZYd3ACENd3/WGgz94KHoQIjAEe1Ba3x6pvyUcQ3
         db6N1PVlUNdj5TjqZ073RQ46bDnBHDZs/jkKiK363o8GilCpBGm85QDLAklV46ouxeLc
         UUmDHUvGbNWh1u3LzThqI8TYY0z5TIBAV8UFb2G73CCG6ZJLnMvQQ7dRdvIIEjVTdFUv
         KkOg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TizCsPU5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4af357de35fsi265475137.26.2024.11.25.10.14.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Nov 2024 10:14:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TizCsPU5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tFdbn-0001BH-7i; Mon, 25 Nov 2024 13:14:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tFdbW-000193-M3
 for qemu-arm@nongnu.org; Mon, 25 Nov 2024 13:14:34 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tFdbT-0005CC-Oh
 for qemu-arm@nongnu.org; Mon, 25 Nov 2024 13:14:34 -0500
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-382442b7d9aso3638886f8f.1
 for <qemu-arm@nongnu.org>; Mon, 25 Nov 2024 10:14:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732558470; x=1733163270; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MKiSAmW0YTZOm2et5NElSEWiWu4k/YmN4d8Ua0BroHo=;
 b=TizCsPU5vEAWkVR1OpR28FRSDPbYNGOkm8kuhsygy4+5uCpHxbUQW4fM+MwV8azUUQ
 vpzf0uDKmVNEr4l4r3R6SOUP2n+PV9LeZtPzhRTNP8leuhF4BucjJwIHy1sv7Oy1+Ctm
 7ke6V6dMvlxNKmdAq9iYxeG8Fklh7MjUsoKj/Fn55Tkdfc/mPkXjbWU6KMKkB66giE8k
 ZTGqGGXgeTLuQp/0RafdQWYRfskkI/2ma5bbCARCSe3bVc2/9zcv3UT5JgHOCW7InhdS
 QVqjSogQBr4iCOwLXYl7eHmB4qNVg71x5J6TF7LXUMDUMJzkXLhHyF/wbEKBqrKkgms3
 W2ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732558470; x=1733163270;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MKiSAmW0YTZOm2et5NElSEWiWu4k/YmN4d8Ua0BroHo=;
 b=C09XUXZjxHUQI2/UIzjMHJqyFCN+fnvD3GpIS3tKr85/fQqzGmZoTwB39SxumEi5A4
 NixnNMp6MPUfA0NyWkFqjS/MpQnxj2U2PMQw34JvAjF9NDyRXEXaVcKTfE1Q4FCFz5sj
 2+/YDt5x2FwLNelav5M92Osxp7KfO2PmkuGteyIKdl5dGHFPL0aoYt+BACB/0WjFq24G
 Xy92ju4nJ+4k49qekJR9bMoVMA3wAQJIoi3JP6SrlF+Z6ojpSMWzyd1P2Y8yd3g67DAl
 cSNBf3/96QGRLYTY7cmC+h4nzd189Ef1awGjtBUeGJl+YdodTrZpQDFf97/QtJ3QRl3t
 9JiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXp8tlUo7e5vrQ2JIxGFSftFX72efco8nlZlXxDbtTArwv9EfzU8JvnZwazdtU95NEWB1LUKMZ5qA==@nongnu.org
X-Gm-Message-State: AOJu0YxDb0G5g6Wo3Vd0oYmAFJowmYCvlMFzHbTqK/RsC4SQsvP8BzwR
 sYcQLTHUcPdHDSu6CZfUlm43peT94EHH7YeLDM3IN3u2zdq9cilfrYwLCpmxL54=
X-Gm-Gg: ASbGncsWSJt/TRZmjfiLrsa6Qy/waEeprFFeMtIHACthRnUJYbHIs2hg7ct2W/YRIid
 B/9gqNqsleOTj2075KVJPagU4dTALF78lOJU9tZXV2YtcX1qJFlKGgrtqw++tRGHlYpGAIXfiUv
 NMcRNpxRb1jN3YqyW6cMUZBvXDWBkjGKuUb+46WaZZSzTkso46HnyQRxlGMUR4q202xWAfuKwxc
 CGUuYpRZat9zoZPwTDO8H5dxzD4s7L2pC3TSIkYPd/6jXu0JVIIIK8zxyVd9PxNhVzt+hnm
X-Received: by 2002:a05:6000:2d0b:b0:37d:5141:ee91 with SMTP id
 ffacd0b85a97d-38260b5e278mr7949691f8f.18.1732558469949; 
 Mon, 25 Nov 2024 10:14:29 -0800 (PST)
Received: from localhost.localdomain ([176.176.170.239])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fb2760asm11040421f8f.52.2024.11.25.10.14.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 25 Nov 2024 10:14:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.0 1/3] hw/boards: Convert no_sdcard flag to OnOffAuto
 tri-state
Date: Mon, 25 Nov 2024 19:14:18 +0100
Message-ID: <20241125181420.24424-2-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241125181420.24424-1-philmd@linaro.org>
References: <20241125181420.24424-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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
X-TUID: M/5uL9O+IsX2

MachineClass::no_sdcard is initialized as false by default.
To catch all uses, convert it to a tri-state, having the
current default (false) becoming AUTO.

No logical change intended.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/boards.h        | 2 +-
 hw/arm/xilinx_zynq.c       | 2 +-
 hw/core/null-machine.c     | 2 +-
 hw/s390x/s390-virtio-ccw.c | 2 +-
 system/vl.c                | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index 36fbb9b59d..86fcf9c81f 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -283,9 +283,9 @@ struct MachineClass {
         no_parallel:1,
         no_floppy:1,
         no_cdrom:1,
-        no_sdcard:1,
         pci_allow_0_address:1,
         legacy_fw_cfg_order:1;
+    OnOffAuto no_sdcard;
     bool is_default;
     const char *default_machine_opts;
     const char *default_boot_order;
diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index fde4d946b7..76bab2499f 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -463,7 +463,7 @@ static void zynq_machine_class_init(ObjectClass *oc, void *data)
     mc->desc = "Xilinx Zynq Platform Baseboard for Cortex-A9";
     mc->init = zynq_init;
     mc->max_cpus = ZYNQ_MAX_CPUS;
-    mc->no_sdcard = 1;
+    mc->no_sdcard = ON_OFF_AUTO_ON;
     mc->ignore_memory_transaction_failures = true;
     mc->valid_cpu_types = valid_cpu_types;
     mc->default_ram_id = "zynq.ext_ram";
diff --git a/hw/core/null-machine.c b/hw/core/null-machine.c
index f586a4bef5..b93056c0f7 100644
--- a/hw/core/null-machine.c
+++ b/hw/core/null-machine.c
@@ -53,7 +53,7 @@ static void machine_none_machine_init(MachineClass *mc)
     mc->no_parallel = 1;
     mc->no_floppy = 1;
     mc->no_cdrom = 1;
-    mc->no_sdcard = 1;
+    mc->no_sdcard = ON_OFF_AUTO_ON;
 }
 
 DEFINE_MACHINE("none", machine_none_machine_init)
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index fe03f716f3..8b40b87899 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -747,7 +747,7 @@ static void ccw_machine_class_init(ObjectClass *oc, void *data)
     mc->no_cdrom = 1;
     mc->no_floppy = 1;
     mc->no_parallel = 1;
-    mc->no_sdcard = 1;
+    mc->no_sdcard = ON_OFF_AUTO_ON;
     mc->max_cpus = S390_MAX_CPUS;
     mc->has_hotpluggable_cpus = true;
     mc->smp_props.books_supported = true;
diff --git a/system/vl.c b/system/vl.c
index 3bb8f2db9a..4a7c29a8ab 100644
--- a/system/vl.c
+++ b/system/vl.c
@@ -1350,7 +1350,7 @@ static void qemu_disable_default_devices(void)
     if (!has_defaults || machine_class->no_cdrom) {
         default_cdrom = 0;
     }
-    if (!has_defaults || machine_class->no_sdcard) {
+    if (!has_defaults || machine_class->no_sdcard == ON_OFF_AUTO_ON) {
         default_sdcard = 0;
     }
     if (!has_defaults) {
-- 
2.45.2

