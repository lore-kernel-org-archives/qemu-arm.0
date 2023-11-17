Received: by 2002:a17:907:1006:b0:9d0:bf65:29fa with SMTP id ox6csp215624ejb;
        Thu, 16 Nov 2023 23:18:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE6uw4YcFEOMoegsR0IDaJZa87qg4SrziueDcfI++vmc5oLZTsxTTzJFwYJTAtYDJuLJRmp
X-Received: by 2002:a05:620a:244f:b0:778:a18b:9026 with SMTP id h15-20020a05620a244f00b00778a18b9026mr6174395qkn.19.1700205489537;
        Thu, 16 Nov 2023 23:18:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700205489; cv=none;
        d=google.com; s=arc-20160816;
        b=0ssXsNqaND4atk8oxhl7Cve7ytoNIk9HJBrBUo+W8IZvbvTb4kgE21P6MIskGhROLs
         26PqQJruYAjlJQ1e8iVnp4MQVvKRNdMWBt38f0E6Tvxya4h07LsLGMCurmgcsAZDjALp
         qA4JRkTgvKKkq1K8qzAv/ApOVN2pFyZtYS4eVMGyay5DJrd6YOZqcPllgiFyg3dKExFF
         anbrnT94fUP8IJjgBiOTw2kkkKd3dY9pjFAz9pTDzZ1vdyEfFhB71XS1ijA/z/EEX5Vp
         g/NfU0yTnGr0rGb4HRYAqPM31B4jMRsYKyZMdhXXiRCKoGHOOMA4RcsZcU4I8f9JXOlO
         ql+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=CHdKGB9IdVR9xVcd4O1PYbu10XnVv29sfGXQ2wqVVus=;
        fh=/iNNmKky1DrOYOLWnTIBUxaMagIUG/IvUjT5dhZ7EH4=;
        b=n1wWHrabdmfZ/96kDa/2FLGd6mS3SbHrQFD2nzLadxmH/9tXyCqixoLT49+QTNOVg3
         MWbYTQySTh1pQhd/LpuAnaNQmcxcPHRKiR++f6aWOjb6KLz0RDakdu4A/7PY4qRd5Z68
         6KaM5aMjzV1+B+MCT4NslQlPqfXfiNoYjQnfzyvMti3msxQEM9+RTj/tkD3A5Z6SjEcd
         spBMYVignBlF/U7bWqqUgIT3CnRub/2wg0XntZIMgGMS1c42UtHKX4YslAvHuvBvuYfN
         QWXEJt3Jj8+0IV5Gxzy4hPdG5KuKr4Gw3gKqJWrmkh2waalfcNfCmNQR55ci07LVkrhI
         5Qdw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e9nVJquO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k1-20020a05620a414100b00778a5708429si1191434qko.724.2023.11.16.23.18.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Nov 2023 23:18:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e9nVJquO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r3t6V-0005NA-5m; Fri, 17 Nov 2023 02:17:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3t6O-0005JU-44
 for qemu-arm@nongnu.org; Fri, 17 Nov 2023 02:17:20 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3t6K-0004GY-7Y
 for qemu-arm@nongnu.org; Fri, 17 Nov 2023 02:17:19 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4079ed65582so12809785e9.1
 for <qemu-arm@nongnu.org>; Thu, 16 Nov 2023 23:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700205434; x=1700810234; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CHdKGB9IdVR9xVcd4O1PYbu10XnVv29sfGXQ2wqVVus=;
 b=e9nVJquOed/Ba0IwNQX3PJV6LcyTUTvHAcMVSpuD6aNC+TYgCF8MbxxyPG4Oa2iAUg
 06kZt8uk+BNestrxVb7w14BClgTF28d5G00EIfN48BePlxBqjJvVBSj9wEUfgSeg5sgw
 modZvWAEJok1h1g7MBvgxT3nUpI9nXgQpZkNUBqMm+ZF266k9LfC2PB6AVsv5UltvvBF
 FB09qYD/t5pmOhr3eqHDfDsS0V6GwfuYxicMW3l9+ANQ4oIsfDlTtYsi5MAyWK4JVwXl
 pso+WqVWBEYkneCZ6HAdi33kD77YwO+6fGwflm7QDgCEQDYZdJY5a6VHQbDEN0W7l8Yn
 iWlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700205434; x=1700810234;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CHdKGB9IdVR9xVcd4O1PYbu10XnVv29sfGXQ2wqVVus=;
 b=OTbmKiWljnz3CNfLsMXJIBTfzw5xKDY0YJyyxV/YiRw1nlbo11+cpBxi7nbTgXJ7wJ
 cOxNtHKjMlR631PklQmfBGaXfzXOAfoBtKDHGGpBrz5ceYD9CRL3cZK2MqxJJtSRxCTJ
 iIlA1GBDzkCnWo2D1S5YQTlUsEHvBzJstaluEDUUB41JmfHl7c04vPFVg6DeonctK1PK
 2g9Ws/+FzOrBGlDMlawtOLgWIJ5Y4phodfYg7m2GAbbGCxbOae6k3CmJzAwbjtFyQ+gn
 6bMbDXIHlh6xl0GRc5IortnD54oqNU4G/aDTNVQzS01hBywnh/Pz9Xo6IHn5dZTcMXw2
 PL0Q==
X-Gm-Message-State: AOJu0YwJn6//CUcG0Rz7R0TmjzHPtfiC75icHp1wUpRRiAf98XXTBP4R
 ZtLv5vCE2uFJHku05cRIiw1g9w==
X-Received: by 2002:a1c:7206:0:b0:3fe:4cbc:c345 with SMTP id
 n6-20020a1c7206000000b003fe4cbcc345mr14096613wmc.41.1700205434169; 
 Thu, 16 Nov 2023 23:17:14 -0800 (PST)
Received: from m1x-phil.lan (bd137-h02-176-184-46-187.dsl.sta.abo.bbox.fr.
 [176.184.46.187]) by smtp.gmail.com with ESMTPSA id
 u3-20020a05600c00c300b0040648217f4fsm5905684wmm.39.2023.11.16.23.17.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 16 Nov 2023 23:17:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Igor Mammedov <imammedo@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Felipe Balbi <balbi@kernel.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>,
 Alistair Francis <alistair@alistair23.me>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Helge Deller <deller@gmx.de>,
 Subbaraya Sundeep <sbhatta@marvell.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Gavin Shan <gshan@redhat.com>
Subject: [PATCH-for-8.2? v2 1/4] hw/core/machine: Constify
 MachineClass::valid_cpu_types[]
Date: Fri, 17 Nov 2023 08:17:01 +0100
Message-ID: <20231117071704.35040-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231117071704.35040-1-philmd@linaro.org>
References: <20231117071704.35040-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: GoQ8e2HmqUkv

From: Gavin Shan <gshan@redhat.com>

Constify MachineClass::valid_cpu_types[i], as suggested by Richard
Henderson.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
[PMD: Constify HPPA machines,
      restrict valid_cpu_types to machine_class_init() handlers]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/boards.h |  2 +-
 hw/hppa/machine.c   | 22 ++++++++++------------
 hw/m68k/q800.c      | 11 +++++------
 3 files changed, 16 insertions(+), 19 deletions(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index a735999298..da85f86efb 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -273,7 +273,7 @@ struct MachineClass {
     bool has_hotpluggable_cpus;
     bool ignore_memory_transaction_failures;
     int numa_mem_align_shift;
-    const char **valid_cpu_types;
+    const char * const *valid_cpu_types;
     strList *allowed_dynamic_sysbus_devices;
     bool auto_enable_numa_with_memhp;
     bool auto_enable_numa_with_memdev;
diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index 9d08f39490..c8da7c18d5 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -672,19 +672,18 @@ static void hppa_nmi(NMIState *n, int cpu_index, Error **errp)
     }
 }
 
-static const char *HP_B160L_machine_valid_cpu_types[] = {
-    TYPE_HPPA_CPU,
-    NULL
-};
-
 static void HP_B160L_machine_init_class_init(ObjectClass *oc, void *data)
 {
+    static const char * const valid_cpu_types[] = {
+        TYPE_HPPA_CPU,
+        NULL
+    };
     MachineClass *mc = MACHINE_CLASS(oc);
     NMIClass *nc = NMI_CLASS(oc);
 
     mc->desc = "HP B160L workstation";
     mc->default_cpu_type = TYPE_HPPA_CPU;
-    mc->valid_cpu_types = HP_B160L_machine_valid_cpu_types;
+    mc->valid_cpu_types = valid_cpu_types;
     mc->init = machine_HP_B160L_init;
     mc->reset = hppa_machine_reset;
     mc->block_default_type = IF_SCSI;
@@ -709,19 +708,18 @@ static const TypeInfo HP_B160L_machine_init_typeinfo = {
     },
 };
 
-static const char *HP_C3700_machine_valid_cpu_types[] = {
-    TYPE_HPPA64_CPU,
-    NULL
-};
-
 static void HP_C3700_machine_init_class_init(ObjectClass *oc, void *data)
 {
+    static const char * const valid_cpu_types[] = {
+        TYPE_HPPA64_CPU,
+        NULL
+    };
     MachineClass *mc = MACHINE_CLASS(oc);
     NMIClass *nc = NMI_CLASS(oc);
 
     mc->desc = "HP C3700 workstation";
     mc->default_cpu_type = TYPE_HPPA64_CPU;
-    mc->valid_cpu_types = HP_C3700_machine_valid_cpu_types;
+    mc->valid_cpu_types = valid_cpu_types;
     mc->init = machine_HP_C3700_init;
     mc->reset = hppa_machine_reset;
     mc->block_default_type = IF_SCSI;
diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index 1d7cd5ff1c..83d1571d02 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -726,19 +726,18 @@ static GlobalProperty hw_compat_q800[] = {
 };
 static const size_t hw_compat_q800_len = G_N_ELEMENTS(hw_compat_q800);
 
-static const char *q800_machine_valid_cpu_types[] = {
-    M68K_CPU_TYPE_NAME("m68040"),
-    NULL
-};
-
 static void q800_machine_class_init(ObjectClass *oc, void *data)
 {
+    static const char * const valid_cpu_types[] = {
+        M68K_CPU_TYPE_NAME("m68040"),
+        NULL
+    };
     MachineClass *mc = MACHINE_CLASS(oc);
 
     mc->desc = "Macintosh Quadra 800";
     mc->init = q800_machine_init;
     mc->default_cpu_type = M68K_CPU_TYPE_NAME("m68040");
-    mc->valid_cpu_types = q800_machine_valid_cpu_types;
+    mc->valid_cpu_types = valid_cpu_types;
     mc->max_cpus = 1;
     mc->block_default_type = IF_SCSI;
     mc->default_ram_id = "m68k_mac.ram";
-- 
2.41.0

