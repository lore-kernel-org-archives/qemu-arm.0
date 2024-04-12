Received: by 2002:a17:906:4a51:b0:a52:fc6:5c40 with SMTP id a17csp375159ejv;
        Thu, 11 Apr 2024 23:21:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWcMT30F6yzLyB3QOj37E4jmRBF3cqoeHUc9MWxGvluqxLN+UVSW9wMhP2u9v/VJIgPPICmVe6kVhmBVAOBuOBZq6u3L+RR
X-Google-Smtp-Source: AGHT+IFV1bmJ+xarNsmX3wzplOblcD49rDOEDDB8Xv+On7SbtXXKWCJGYM8b/EwZhK3ErCHpK66f
X-Received: by 2002:ac8:5f06:0:b0:432:c8b7:7096 with SMTP id x6-20020ac85f06000000b00432c8b77096mr1764510qta.34.1712902883078;
        Thu, 11 Apr 2024 23:21:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712902883; cv=none;
        d=google.com; s=arc-20160816;
        b=iipmK35XsoF+1RlCA1rBbMXksjdlO2TAdahoxgduKHzmaZ5iD6BaTTsFcCNHR0FuR/
         6JyCe3eqS7/7LXZezTXJ7DPpMI0dpIVtlJfK7U+goWbEhAher6g0CWxu3TAIkq7ST84C
         H55CBm+HNYQpBQFK/oSPRaLCFecRGTDHNfSok7jAllIoxe/4JFb+eQ3ucRIWAkay9dDA
         IZSjbeXIV8eKJ0kB60ArPGI+6ZkfveIsXm/n9IUyrPB+Eo0OH/ISl1SmklBseT+QxUiF
         e3p8j2lVTuDF7hFjeI9C/YaqCxNPlCwLYZDFE23IDcL54gbAELUmwF/PDRkM76xl+Y8/
         IoOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=M3pHJXitrzW9t03hD8J9U0TGDtXrWQ6mDQ+QD6JttrI=;
        fh=FgpzUiSKNMTtMHyk5kkuAaa5ueEJtER2oT+Q/1wxShc=;
        b=aQ0tCXL3w8NPZ4N0zonp56/owphzIZmLj5kvj81bDnOFGU4k7IjLPEDyWECWgGX94G
         XFT1NyVpssSg001qzYwV+YaDlo5H/lIlRFaDTDnV9lSw6yYdsVL+f2pOb9pCtR3UxYms
         BLLtltw0Cb8qm21O6sfVS9hh8ZpA2bSon/uT0bVTzuS135NhQW0afIRxbUxPd0M1F9l5
         rAeWvH0D0f8uft941e5NkuxKQCeXsPHtvCrLvVWcgx7Xio/U02T897vnOIXBA0Vl1LmR
         jwkxymQkAxidpJ96y/wrm+kdTTq9hnqQhkuwdRfNU+1XXksTEkzzEcZZkLkML//bIWEJ
         Oi4A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CdqKS3m1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a25-20020a05620a439900b0078ec3adf209si2852495qkp.439.2024.04.11.23.21.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Apr 2024 23:21:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CdqKS3m1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rvAHg-00083Q-Ap; Fri, 12 Apr 2024 02:21:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rvAHX-00081h-2n
 for qemu-arm@nongnu.org; Fri, 12 Apr 2024 02:21:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rvAHV-0003x2-0U
 for qemu-arm@nongnu.org; Fri, 12 Apr 2024 02:21:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1712902860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M3pHJXitrzW9t03hD8J9U0TGDtXrWQ6mDQ+QD6JttrI=;
 b=CdqKS3m1CdznPf+bUSAuaYLLjoVb6G5ulalVgUpQLtbqBgI7jubjCup5k0BzTUePsLlp6P
 PodFc/l/GWv58GMxhh1OnE3FT11zt6wPY9ZSRqPZM0owdsq8gEPov90L1S8iS2jBlpkGwJ
 fAqjFwgSDnRWKJ3Zp7SCMvCuQvD8tiU=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-32-clnc3zOkMamtg1eqxIkzjQ-1; Fri,
 12 Apr 2024 02:20:56 -0400
X-MC-Unique: clnc3zOkMamtg1eqxIkzjQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0E9B828EA6E3;
 Fri, 12 Apr 2024 06:20:56 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.192.215])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 527551121306;
 Fri, 12 Apr 2024 06:20:53 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 2/2] hw: Add a Kconfig switch for the TYPE_CPU_CLUSTER device
Date: Fri, 12 Apr 2024 08:20:42 +0200
Message-ID: <20240412062042.105174-3-thuth@redhat.com>
In-Reply-To: <20240412062042.105174-1-thuth@redhat.com>
References: <20240412062042.105174-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.49,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: opwaS5EbPp0e

The cpu-cluster device is only needed for some few arm and riscv
machines. Let's avoid compiling and linking it if it is not really
necessary.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/Kconfig     | 3 +++
 hw/cpu/Kconfig     | 3 +++
 hw/cpu/meson.build | 2 +-
 hw/riscv/Kconfig   | 2 ++
 4 files changed, 9 insertions(+), 1 deletion(-)

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
index 38cdcfbe57..43a34c4c6e 100644
--- a/hw/cpu/meson.build
+++ b/hw/cpu/meson.build
@@ -1,4 +1,4 @@
-system_ss.add(files('core.c', 'cluster.c'))
+system_ss.add(when: 'CONFIG_CPU_CLUSTER', if_true: files('core.c', 'cluster.c'))
 
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

