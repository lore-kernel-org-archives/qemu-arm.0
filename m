Received: by 2002:a17:907:1751:b0:a52:4db9:938b with SMTP id lf17csp1045493ejc;
        Sun, 14 Apr 2024 23:58:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXi6z35bw3nB44iPbDDLsRbz7VlXIwNVtkht7ZxkFw2ysyeJm9aP6gtYAAAuH2CuXi2MNHqbLzAyi8UWEOkV84rm0sS2O6D
X-Google-Smtp-Source: AGHT+IEBy5aByQ0mn/0QoG9lJUjHtwsPkiDQlvx5kp+s6lFL9SAEpxBqmDgzKex/NZEFIaxRznB8
X-Received: by 2002:a05:622a:1a81:b0:437:1ec3:3b6c with SMTP id s1-20020a05622a1a8100b004371ec33b6cmr387194qtc.30.1713164280712;
        Sun, 14 Apr 2024 23:58:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713164280; cv=none;
        d=google.com; s=arc-20160816;
        b=qlRS0I9YkDpb+D3UguClueEQX9secXRx3V8i8qIQ8vxyG7eSxEtYK7zdP4LQ+nSXm7
         LTiBFzlCND+gsAnqddxrb3TjcWQV0kljSUBlXs8BI9mA1AZm9Sc4A8/9FpsbTp+xTynz
         VZn8LcyAxBUd2lcsVp/nsW3e8OsD6eDNiThhXylVgr6BMJqPCqN86BGr8JFz/QEdFZ3R
         8DY5roMblphh5itnA9mchP8NSqJd7yZQR/XCOYf0oIo4cD/El8flaqm0UIVQ4QgZndqQ
         r7S66G2i+VqAZpk+2DnZuFtJGdlot3sKeJufemd2ekDabnGKmYX8k6p9Jmd5aXJvuaA9
         uZDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8KZmZrq7Mb+200IsjYG9ksH3TZh5RNNYtpl57wmZs0s=;
        fh=FgpzUiSKNMTtMHyk5kkuAaa5ueEJtER2oT+Q/1wxShc=;
        b=O6QeSoA3vFWRqQ2lxMtynYyWv9YOUOx9kxhCJc4wEo/Dx3RL+NVdQzCGWpgdq6L+/A
         0IyhTTyDOAd7ofX1DtqFkypyrV7XSLsr7JVgMX7IA9AmrQmhgJ+EmDU8Jo6tcoLY5eHu
         +jNPvPEXCHwqM8ToWPpaLfzTCLHEzWKbc/RTybd8xkZJM1QlUwhdhYdGtFypt/zTj2BQ
         444GUcvWfcri5BDyO1X33Pq5ymGBtXgavuLN3X9H/a7bWzGwrRZHVg6saezG+fx3CCX1
         HQWxJOdbuwNWuTWGIXNmK4sR96caPjem1yxWBXkZSsnsnBL01qgXERaZ/tHSUv4Oi655
         G2jw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RzO1SA9X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n18-20020ac85a12000000b00436f79fb885si2221072qta.86.2024.04.14.23.58.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 14 Apr 2024 23:58:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RzO1SA9X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rwGHJ-0004BO-K8; Mon, 15 Apr 2024 02:57:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rwGHI-0004Ay-1X
 for qemu-arm@nongnu.org; Mon, 15 Apr 2024 02:57:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rwGHG-0005Nh-Fs
 for qemu-arm@nongnu.org; Mon, 15 Apr 2024 02:57:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1713164237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8KZmZrq7Mb+200IsjYG9ksH3TZh5RNNYtpl57wmZs0s=;
 b=RzO1SA9XPpAE5QILpbGJdgPW6/TvgrPYiLpHZYqOLHhlERkhSp58aPluZ2DME/1/clGr08
 ttEscFAbJ/gshH9paQ9gJ3QX/zeMNgmHIP20etc7jOKX53kjAbirWRvMNAhfdz/mPzvgMT
 6KeQDEZWxEdStPE8KH2zxeC7tFoxNWA=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-128-WCq81KAKMTSj3O-jVmo4vw-1; Mon,
 15 Apr 2024 02:57:12 -0400
X-MC-Unique: WCq81KAKMTSj3O-jVmo4vw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 724933C23FCC;
 Mon, 15 Apr 2024 06:57:11 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.192.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1DB8BC13FA1;
 Mon, 15 Apr 2024 06:57:07 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v2 2/2] hw: Add a Kconfig switch for the TYPE_CPU_CLUSTER
 device
Date: Mon, 15 Apr 2024 08:56:55 +0200
Message-ID: <20240415065655.130099-3-thuth@redhat.com>
In-Reply-To: <20240415065655.130099-1-thuth@redhat.com>
References: <20240415065655.130099-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.127,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: L0t2Ef8SdeFw

The cpu-cluster device is only needed for some few arm and riscv
machines. Let's avoid compiling and linking it if it is not really
necessary.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/Kconfig     | 3 +++
 hw/cpu/Kconfig     | 3 +++
 hw/cpu/meson.build | 3 ++-
 hw/riscv/Kconfig   | 2 ++
 4 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index d97015c45c..5d4015b75a 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -485,6 +485,7 @@ config XLNX_ZYNQMP_ARM
     select AHCI
     select ARM_GIC
     select CADENCE
+    select CPU_CLUSTER
     select DDC
     select DPCD
     select SDHCI
@@ -503,6 +504,7 @@ config XLNX_VERSAL
     default y
     depends on TCG && AARCH64
     select ARM_GIC
+    select CPU_CLUSTER
     select PL011
     select CADENCE
     select VIRTIO_MMIO
@@ -688,6 +690,7 @@ config ARMSSE
     select CMSDK_APB_DUALTIMER
     select CMSDK_APB_UART
     select CMSDK_APB_WATCHDOG
+    select CPU_CLUSTER
     select IOTKIT_SECCTL
     select IOTKIT_SYSCTL
     select IOTKIT_SYSINFO
diff --git a/hw/cpu/Kconfig b/hw/cpu/Kconfig
index f776e884cd..baff478e1b 100644
--- a/hw/cpu/Kconfig
+++ b/hw/cpu/Kconfig
@@ -12,3 +12,6 @@ config A15MPCORE
 config ARM11MPCORE
     bool
     select ARM11SCU
+
+config CPU_CLUSTER
+    bool
diff --git a/hw/cpu/meson.build b/hw/cpu/meson.build
index 38cdcfbe57..9d36bf8ae2 100644
--- a/hw/cpu/meson.build
+++ b/hw/cpu/meson.build
@@ -1,4 +1,5 @@
-system_ss.add(files('core.c', 'cluster.c'))
+system_ss.add(files('core.c'))
+system_ss.add(when: 'CONFIG_CPU_CLUSTER', if_true: files('cluster.c'))
 
 system_ss.add(when: 'CONFIG_ARM11MPCORE', if_true: files('arm11mpcore.c'))
 system_ss.add(when: 'CONFIG_REALVIEW', if_true: files('realview_mpcore.c'))
diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index 5d644eb7b1..fc72ef0379 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -9,6 +9,7 @@ config IBEX
 config MICROCHIP_PFSOC
     bool
     select CADENCE_SDHCI
+    select CPU_CLUSTER
     select MCHP_PFSOC_DMC
     select MCHP_PFSOC_IOSCB
     select MCHP_PFSOC_MMUART
@@ -68,6 +69,7 @@ config SIFIVE_E
 config SIFIVE_U
     bool
     select CADENCE
+    select CPU_CLUSTER
     select RISCV_ACLINT
     select SIFIVE_GPIO
     select SIFIVE_PDMA
-- 
2.44.0

