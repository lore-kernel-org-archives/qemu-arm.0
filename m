Received: by 2002:a17:906:6d0c:b0:9b2:89ee:1eb8 with SMTP id m12csp21ejr;
        Tue, 10 Oct 2023 02:31:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHe+an3/fZ/6KwvJuCaaI/Vpb2edbB4ireLCQrYAh8yneNgujw5psrKhmOsVEf5GYdzIf9i
X-Received: by 2002:a0c:fb02:0:b0:668:ecef:b997 with SMTP id c2-20020a0cfb02000000b00668ecefb997mr18018478qvp.41.1696930315581;
        Tue, 10 Oct 2023 02:31:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696930315; cv=none;
        d=google.com; s=arc-20160816;
        b=mhM7L5j6n6kXlyd/tfxANkC4JBl3eDThGxMRdZnbDMriyrIQzMbTmfL2DIPH06k+zP
         M9yUIN5gGxql+AKHAk23g98ghb9suew07HJn59bPwb429r1wMNY6rTJiHqiPb/8Zt/eq
         xmW610bWC2gPsWw5vdwwxh+8NYS2uH+q5HZe1CXfbYNboOAC1qkQYAWIELzkQtKMWXA1
         Q3JgKB6ndBPFvWxyxAnX9gKQUfyBMr6jXJ6tHkt8PKBQi1cb2jHIsM/O0L07S0HPf4XQ
         nG8BllEzkkPqfd7IQQLASQs+dhoNftkRAWnYdmjA6OfbmUhCKdKg1HUUHt7LVeZKqyfC
         sFEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ty5A8kcVGZ5VAZ2hfMU3PH9M5Fs6Xopxrwnt8GKnicA=;
        fh=iupQBrmerAoZOw8v6swRnyYBx+6KhbF7AbBF1Jawaz4=;
        b=BFuNef4pSbV4nitioQP7Qi3cxiMjT1bW1lyRauzJ4uFjnYXM1NeRPY+cDvQ7Mklo1v
         2jR/deS8vaYCbNZqF1TyZvMz/3wtE5VUJCPmpTn43oViD+kIm7YXGOy3+95YWfLVosgE
         bn90M43s8OHV2r2lepmmV0PZQ/OH39kcMGQr73TqYAk9Qw7INez+m3iwSEieylWvq2YX
         iiN2YOAZlJa0A/b9rGEN9YOv9KcBNgQ4C8f8fud5aQwBRwTj6wGK8NzjhgaNxac3lbwm
         /liY/Ed4F8qG82+Fv2Glayp8WpmnERkt5DhzsjFJ7fyAFGatZ5D3dthXbHvJ4JaDdWzK
         qzUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zniWLfBA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j3-20020a05620a410300b00767cc0f9316si7544692qko.289.2023.10.10.02.31.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Oct 2023 02:31:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zniWLfBA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qq95J-0002ia-1K; Tue, 10 Oct 2023 05:31:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qq94U-0000so-Ej
 for qemu-arm@nongnu.org; Tue, 10 Oct 2023 05:30:45 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qq94O-00087N-V9
 for qemu-arm@nongnu.org; Tue, 10 Oct 2023 05:30:34 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-533f193fc8dso9509633a12.2
 for <qemu-arm@nongnu.org>; Tue, 10 Oct 2023 02:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696930227; x=1697535027; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ty5A8kcVGZ5VAZ2hfMU3PH9M5Fs6Xopxrwnt8GKnicA=;
 b=zniWLfBANnCE1t8Yfh3k6j4lfrxCepBXZ8o0THtRaLla7edeeH1NbFkAte48JKXidT
 lFISkWVdlGV4ixVxmpqk5OOBY8JGNhDLEprMlfRdaUbIY/iqU1mJ48/cunEfwE3Toh8a
 olmu/vXAj9wAh3JeJTpfg8Z1zuvqI/9TaPq4biTXtfCBO3wrFLOAW4ZIF6PNqu8qDNCy
 F2BhidOWJzIw1ntRq1skTYg5mLWNgA3ZoEEtQh7r83XI8+/pESeYfMjlES5qNznT4PTk
 CslgH7olw7qAxGw0QjQJjzMCaaKXJdvXLoA216yqS8wriWDgFG0s6p663Wl9PCcSbMgM
 svBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696930227; x=1697535027;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ty5A8kcVGZ5VAZ2hfMU3PH9M5Fs6Xopxrwnt8GKnicA=;
 b=MJSvZXLqenXE6J9elRCIiYY3oac4c8NICR8YbOXnFQj30lWHR9SCy+WV4dvRcFxcr7
 odIV1qS8DlsfmkDL+Mve9VqzEty4r6LQANGJEq85zvHjHAEA2rhfCpr8qRh12mC1VIhk
 OeSvrh+PfRQE0przZlj3SpfV6BV7+IQVIyuf/0+HygB0+9fVvXoWkAnatlw5X62zTdVP
 uSv/y2xmmr8WAsOax6ydWvfJ727Gn7Vi8PNd+jbvONNgh5G+5Y+Np1qWHsgijlD+ke1y
 T44iXjbWXRMg+NJPTufKRbIZSh193rA8ERkoDnGT6d20JOkHTldtuylCTeJDqc8qzYV6
 xeFQ==
X-Gm-Message-State: AOJu0YykI7ItbpTm8VmVPhgPBrmVjkg6jog6bQO5xmW2KYfJKSgwPu+V
 MLSlV/VcIxWaq1wgPU6OBxTeGQ==
X-Received: by 2002:aa7:c55a:0:b0:532:c81b:99b1 with SMTP id
 s26-20020aa7c55a000000b00532c81b99b1mr15462000edr.18.1696930227507; 
 Tue, 10 Oct 2023 02:30:27 -0700 (PDT)
Received: from m1x-phil.lan (aif79-h01-176-172-113-148.dsl.sta.abo.bbox.fr.
 [176.172.113.148]) by smtp.gmail.com with ESMTPSA id
 g26-20020aa7c59a000000b00530ccd180a3sm7276170edq.97.2023.10.10.02.30.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 10 Oct 2023 02:30:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-arm@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Paolo Bonzini <pbonzini@redhat.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-riscv@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Bin Meng <bin.meng@windriver.com>, Yanan Wang <wangyanan55@huawei.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Marek Vasut <marex@denx.de>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-ppc@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>, Stafford Horne <shorne@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Chris Wulff <crwulff@gmail.com>,
 Sergio Lopez <slp@redhat.com>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Eduardo Habkost <eduardo@habkost.net>, Brian Cain <bcain@quicinc.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-s390x@nongnu.org
Subject: [PATCH 10/18] target/riscv: Inline target specific
 TYPE_RISCV_CPU_BASE definition
Date: Tue, 10 Oct 2023 11:28:52 +0200
Message-ID: <20231010092901.99189-11-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231010092901.99189-1-philmd@linaro.org>
References: <20231010092901.99189-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x534.google.com
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
X-TUID: E1ahIYV+Jenm

TYPE_RISCV_CPU_BASE depends on the TARGET_RISCV32/TARGET_RISCV64
definitions which are target specific. Such target specific
definition taints "cpu-qom.h".

Since "cpu-qom.h" must be target agnostic, remove its target
specific definition uses by inlining TYPE_RISCV_CPU_BASE in the
two machines using it.

"target/riscv/cpu-qom.h" is now fully target agnostic.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/riscv/cpu-qom.h | 8 +-------
 hw/riscv/spike.c       | 8 +++++++-
 hw/riscv/virt.c        | 8 +++++++-
 3 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
index 8cb67b84a4..f607687384 100644
--- a/target/riscv/cpu-qom.h
+++ b/target/riscv/cpu-qom.h
@@ -1,5 +1,5 @@
 /*
- * QEMU RISC-V CPU QOM header
+ * QEMU RISC-V CPU QOM header (target agnostic)
  *
  * Copyright (c) 2023 Ventana Micro Systems Inc.
  *
@@ -43,12 +43,6 @@
 #define TYPE_RISCV_CPU_VEYRON_V1        RISCV_CPU_TYPE_NAME("veyron-v1")
 #define TYPE_RISCV_CPU_HOST             RISCV_CPU_TYPE_NAME("host")
 
-#if defined(TARGET_RISCV32)
-# define TYPE_RISCV_CPU_BASE            TYPE_RISCV_CPU_BASE32
-#elif defined(TARGET_RISCV64)
-# define TYPE_RISCV_CPU_BASE            TYPE_RISCV_CPU_BASE64
-#endif
-
 typedef struct CPUArchState CPURISCVState;
 
 OBJECT_DECLARE_CPU_TYPE(RISCVCPU, RISCVCPUClass, RISCV_CPU)
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 81f7e53aed..eae49da6d6 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -349,7 +349,13 @@ static void spike_machine_class_init(ObjectClass *oc, void *data)
     mc->init = spike_board_init;
     mc->max_cpus = SPIKE_CPUS_MAX;
     mc->is_default = true;
-    mc->default_cpu_type = TYPE_RISCV_CPU_BASE;
+#if defined(TARGET_RISCV32)
+    mc->default_cpu_type = TYPE_RISCV_CPU_BASE32;
+#elif defined(TARGET_RISCV64)
+    mc->default_cpu_type = TYPE_RISCV_CPU_BASE64;
+#else
+#error unsupported target
+#endif
     mc->possible_cpu_arch_ids = riscv_numa_possible_cpu_arch_ids;
     mc->cpu_index_to_instance_props = riscv_numa_cpu_index_to_props;
     mc->get_default_cpu_node_id = riscv_numa_get_default_cpu_node_id;
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 5edc1d98d2..620a4e5f07 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1685,7 +1685,13 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     mc->desc = "RISC-V VirtIO board";
     mc->init = virt_machine_init;
     mc->max_cpus = VIRT_CPUS_MAX;
-    mc->default_cpu_type = TYPE_RISCV_CPU_BASE;
+#if defined(TARGET_RISCV32)
+    mc->default_cpu_type = TYPE_RISCV_CPU_BASE32;
+#elif defined(TARGET_RISCV64)
+    mc->default_cpu_type = TYPE_RISCV_CPU_BASE64;
+#else
+#error unsupported target
+#endif
     mc->pci_allow_0_address = true;
     mc->possible_cpu_arch_ids = riscv_numa_possible_cpu_arch_ids;
     mc->cpu_index_to_instance_props = riscv_numa_cpu_index_to_props;
-- 
2.41.0

