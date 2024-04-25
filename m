Received: by 2002:a17:906:c0c2:b0:a52:4db9:938b with SMTP id bn2csp1283347ejb;
        Thu, 25 Apr 2024 04:09:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUxjRCVkiFn9CPjlJbcLetpQgPqaNyAG9R5+EPg5NHi7XPh/9KArNJF/6YS2xC7PS86meG2BgIp0cF4EcIzB/tl0FcJoGDM
X-Google-Smtp-Source: AGHT+IHy2U0jHXmMyrZfAImKsoADjrsTYQzWmNy3PZwoqBrWru1oDHiZTHAvaozmPebX7bdGhDu3
X-Received: by 2002:a05:6358:7a0b:b0:186:18a7:6b01 with SMTP id o11-20020a0563587a0b00b0018618a76b01mr4776063rwg.23.1714043398454;
        Thu, 25 Apr 2024 04:09:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714043398; cv=none;
        d=google.com; s=arc-20160816;
        b=egc+CDd2KcYGi1CLTUiDa2lx9KrxGT+ZZDiA3JhmGsTg+BtDdpXbyMcXsDwrerLFva
         cNUx31howXb3LQYzr6lvWiTG+iyMWfBleQSoslVm44m+g66p6i/83ZtRRpuoyYiOHMWT
         4AUUUtEmj3wAvZ6mEb8kcBDyneEkEMojPTZMShlH2fwfLwXfV1Zr8LBJf0kPqOLnZr4V
         oLem2arlupULummsETh+MI2OCZAbyvU/2oS/HD/LoEnh4Ps2Mw5aSR4imZGZYqQuF1VG
         dDQ3RKZVs69uCz/8kS7fEEwmCCy62C6efJ7lWP7V7IwyuQXBWMlmviGTZjIEZrXYDpTd
         HVbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=LbAs9YmrS9dSJaP9YCdhZk5wTEYcOSkfG+YJap7/m1c=;
        fh=nd9F8vZqf9f3DRxj9Ux/M0C8+0xI9oKSj5Zm4Vmbrgk=;
        b=QeBM9rYUM1Xeyc8e7n6vOK6516uTEbMD7X0rAGH8/ghBShIR7iYjZDBA1JdL1eSV3S
         zwJVtdBsfvJ7N7NBNhf378Qf9eQnsPwOsQ5UiziIVleH+3D/i1Fmi9cHKHLkX5RwT68J
         H768uqfNlFWlUmJchuNc4ILaxlnW1sTteQUzdxyiQMqveFU1i9QnCQS/HQt9W8h3t3Gr
         HEbJpJ+Tqfsn3fOclKJLRDsrQTLEk0HGibWgnnq/++B18HUhp9pb9BH9f46jmCUtbdqk
         ZiRjpe2qLaAXFgjiH7g7R+qJM1p7mf28zaavBkQ4Ek6bbNqOsH3UPw/sLhrCUWyQaPvI
         4HZQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=upb2cCJu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v30-20020a05622a189e00b004369f2476d9si18043787qtc.601.2024.04.25.04.09.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Apr 2024 04:09:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=upb2cCJu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rzwuK-0002vj-G1; Thu, 25 Apr 2024 07:04:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rzwsj-0008UP-3M
 for qemu-devel@nongnu.org; Thu, 25 Apr 2024 07:03:38 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rzwsb-00005s-E2
 for qemu-devel@nongnu.org; Thu, 25 Apr 2024 07:03:07 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-41adf155cffso6384055e9.2
 for <qemu-devel@nongnu.org>; Thu, 25 Apr 2024 04:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714042983; x=1714647783; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LbAs9YmrS9dSJaP9YCdhZk5wTEYcOSkfG+YJap7/m1c=;
 b=upb2cCJutQ4RH6YHzzcoh/SDNJoih4pUuQVugFQuUw/SYzlRKtBXLJVkLUhTaWhD12
 86gxQHirJvp/zOls6O3rP7PURSM3hSXhbz4aoIAS98Fgb5+sO17E2uiD9bisXYPPXwzv
 jUX1Q+etUnPzPnCmjMj0smUZngnFNRI3rXlLDlsgEk10YDwtaKkNQ6Oz+vUvQoYTd7YZ
 IvnAmQuDN//McM+FdPzTKIeOkHSOOarysxBBhea3gdeJtDtcuTZfqildmjRlt4e0rTD8
 FPt0LvRxeSUWNCr6ixC5z6UqlBa/Ro1mRi3szVPepMUPmhHg6syJNqr5MTJIV9AhxKAz
 W8+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714042983; x=1714647783;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LbAs9YmrS9dSJaP9YCdhZk5wTEYcOSkfG+YJap7/m1c=;
 b=ibNPqwXVnGq157gapBD6lellJsdmIFRqWf5oGuc8huBsdRNWQ0zZPt/K8KPHT1t9rf
 Q+MsujH0VKssLuo35XahUC/KDGxhsrkR5lW0KqsahD+3ATPQHXy3GW0G3bxY0In8aQom
 7DJ9pR934bOZcu+iRJNmdTrIJb9NqVlAkSoH6mXCXJ967xA3z9PA44sKyuwVAfdVSpGu
 Fr3om1209b412g6koWDG7WSCPqxZbXi30O9Ifdp3pcPCcu32vXyEN0+vZfSFNaAQzDeq
 /g26uOdlfEUdmlUh1uTUxbTL/9RJJemII74L6t7mYstNk1JuVMYKqswzYgyXqL5G80GV
 TTgQ==
X-Gm-Message-State: AOJu0YxIjlpOJCJHb8s1gjGltFvKCDLvaVsNx8JxjOzs+dmbbQO8o4hC
 BAz/RBZx6Ep0WX3W4G6SwxZqIcF5MVC51lQ0t4VERx4P/UkAIFMaolQycMhVx1Z4hxPP1z6SfOr
 S
X-Received: by 2002:a05:600c:154f:b0:418:e08c:817 with SMTP id
 f15-20020a05600c154f00b00418e08c0817mr3681618wmg.32.1714042983172; 
 Thu, 25 Apr 2024 04:03:03 -0700 (PDT)
Received: from localhost.localdomain ([92.88.170.77])
 by smtp.gmail.com with ESMTPSA id
 p9-20020a05600c1d8900b0041b13c5c9f9sm4678586wms.17.2024.04.25.04.03.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 25 Apr 2024 04:03:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PULL 11/22] hw: Add a Kconfig switch for the TYPE_CPU_CLUSTER device
Date: Thu, 25 Apr 2024 13:01:44 +0200
Message-ID: <20240425110157.20328-12-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240425110157.20328-1-philmd@linaro.org>
References: <20240425110157.20328-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: nJXXTkQYkzg0

From: Thomas Huth <thuth@redhat.com>

The cpu-cluster device is only needed for some few arm and riscv
machines. Let's avoid compiling and linking it if it is not really
necessary.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-ID: <20240415065655.130099-3-thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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
2.41.0

