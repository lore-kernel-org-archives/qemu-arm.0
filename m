Received: by 2002:a17:906:6d0c:b0:9b2:89ee:1eb8 with SMTP id m12csp427ejr;
        Tue, 10 Oct 2023 02:32:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUKpWyGzxzfSk/znR292aExuUasm0I/VlTFCLtwI3fDEVvAYdpu3GYl9cunvDIoJn1YhA0
X-Received: by 2002:a05:622a:1889:b0:403:72fa:630b with SMTP id v9-20020a05622a188900b0040372fa630bmr23101904qtc.58.1696930374389;
        Tue, 10 Oct 2023 02:32:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696930374; cv=none;
        d=google.com; s=arc-20160816;
        b=RN1whCZ/JthmIZvXhIaCFg6ajYgWhg+ZsGgXY7z2e5L6TaFNRj0GkELkhENYp9Om6c
         FbvoDcAwf4cVeZ1ni1tpUET0KuylH5XCEoSzgx62DHqELb++AYrTmpe2JB5dbMX+MDfp
         8DGvmEQWisiQcWhdyLBkFyl4NReXZokdZZJoNP31PiKZmUa0cemhRITrv3SDufXedS/0
         8kSgQbn6C6X4AHnOfoQuxNesiNa/0sCMTcOBYh2lqJOO8j6puEDZyq7GU7DRmn/ZgZFt
         Ixhk+/OHl/WuvQWrCPnwT+Hz2DXcWR5yvVXDmdQ4i6DwW5UXKn1WrILzUpoufgxpdqdt
         wuEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=NKemy3mrOQvsycwsAw7RG7OOitRzhA3E8db/8fyu+SQ=;
        fh=iupQBrmerAoZOw8v6swRnyYBx+6KhbF7AbBF1Jawaz4=;
        b=V2+OHIj0D5o2OqZvBjS9cD/11w+KQna1SFXmLe9njyvaPGUo4L4AjzM5uGEwumtCCD
         0rVq3UhaecDXBSguz0GSSUpuC5OdOvw/dvclW1dNz3UegU4h0FqG232GCgzB56/JMlOS
         ShGBlfa7gLxNLSzqfQPmFhbSJQf642+lDx8DQ3mjaz2yA6xgPHM9cXCRkZBnCUlWVmq6
         wiSbTPqaOPho1rgg1yJBc8JcGvTbn5f6Ez3pCP5Jd7juV2POwgcwcVuzgwkIGf/2zVCw
         nMp32DLsmPEWslQ22cvoXe5yti5al/x05a7t4x0wHzCMTe6bSMsOS7lF4+gjB+cC1hbl
         /M7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dwBEbjyr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c14-20020a05622a058e00b004109d20c07dsi7369042qtb.499.2023.10.10.02.32.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Oct 2023 02:32:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dwBEbjyr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qq93v-0000Un-E6; Tue, 10 Oct 2023 05:29:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qq93t-0000Oq-Pn
 for qemu-arm@nongnu.org; Tue, 10 Oct 2023 05:29:57 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qq93r-0007mm-T8
 for qemu-arm@nongnu.org; Tue, 10 Oct 2023 05:29:57 -0400
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-9b275afb6abso1423804866b.1
 for <qemu-arm@nongnu.org>; Tue, 10 Oct 2023 02:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696930194; x=1697534994; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NKemy3mrOQvsycwsAw7RG7OOitRzhA3E8db/8fyu+SQ=;
 b=dwBEbjyrSzUuv7XYSj8sFlC1jELSU4zOhRTpVet/BFhBoVa+rFMpP65WQ6ss03wneG
 gaVT4Bmpy8PcLADacQeGeV5M9dApeZbWNQrW919Sfo8SphzLAQql6wLEGALAGTS0MTsK
 6CCVZQY1GDM2jOj/fr6nhYYP9bR/7SkROYJyg63udNn+7h/WW13KhFReYwsXAQDQj+9j
 mg8xcso0iIs8OpAtXfEo0jbe94s2O1sS/MPPi4XTwkW026M7V8c8eRJov2vpk8iRbCRf
 7qzy4eFGzq4qAHcaLKe+08oGIQ0I8YfZCUA0E4cmGGN/I6XTWTrbRda17ozsPMKPKOih
 5LZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696930194; x=1697534994;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NKemy3mrOQvsycwsAw7RG7OOitRzhA3E8db/8fyu+SQ=;
 b=iTXBvDKeHjS7GhSkIoicrpEuR4Wl4ZFoV7jZKCrTv7qdQwbyYeBpQYlixmu9aldkNv
 gzr6gStzBEkxb/9OXvRp9gdENAw6b5Oxi7bIVn+Pwnck2XIWZa9StF1B3xEodwG1N3mg
 /7081TvMcnqCXLR1RncvXq3eqKI0y2Lwcyox6CvYYAOXqBFqZWJ/sOHUyqF1u+tsT4ep
 Gp4vgpohDBmx8/UoLMgz9w+freFCzTPtIk3n4x6JIQcr8uBUPWQBkB82Bb66VhW5cXoa
 e0DXgLIZSz8e11Q4XIsv/xHCTjj5/sOnVK8gMUsZ46vDLcFcdmtcyou0mp6KMFkDeL6q
 X2mQ==
X-Gm-Message-State: AOJu0Yy874sPQFDmYliplxsqB3jLiN8pN4wOOyF5bbR1d0uAG7MMhP29
 /FUc4Z6e0mdsH686Trx5215jLw==
X-Received: by 2002:a17:907:3da3:b0:9ae:614f:b159 with SMTP id
 he35-20020a1709073da300b009ae614fb159mr12111310ejc.36.1696930194440; 
 Tue, 10 Oct 2023 02:29:54 -0700 (PDT)
Received: from m1x-phil.lan (aif79-h01-176-172-113-148.dsl.sta.abo.bbox.fr.
 [176.172.113.148]) by smtp.gmail.com with ESMTPSA id
 w13-20020a170906480d00b0098d2d219649sm8226101ejq.174.2023.10.10.02.29.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 10 Oct 2023 02:29:53 -0700 (PDT)
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
Subject: [PATCH 06/18] target/loongarch: Declare QOM definitions in 'cpu-qom.h'
Date: Tue, 10 Oct 2023 11:28:48 +0200
Message-ID: <20231010092901.99189-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231010092901.99189-1-philmd@linaro.org>
References: <20231010092901.99189-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62f.google.com
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
X-TUID: aEU4B5CD6SrH

"target/foo/cpu.h" contains the target specific declarations.

A heterogeneous setup need to access target agnostic declarations
(at least the QOM ones, to instantiate the objects).

Our convention is to add such target agnostic QOM declarations in
the "target/foo/cpu-qom.h" header.

Extract QOM definitions from "cpu.h" to "cpu-qom.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/loongarch/cpu-qom.h | 38 ++++++++++++++++++++++++++++++++++++++
 target/loongarch/cpu.h     | 26 +-------------------------
 2 files changed, 39 insertions(+), 25 deletions(-)
 create mode 100644 target/loongarch/cpu-qom.h

diff --git a/target/loongarch/cpu-qom.h b/target/loongarch/cpu-qom.h
new file mode 100644
index 0000000000..d577af9f6e
--- /dev/null
+++ b/target/loongarch/cpu-qom.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * QEMU LoongArch CPU QOM header (target agnostic)
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ */
+
+#ifndef LOONGARCH_CPU_QOM_H
+#define LOONGARCH_CPU_QOM_H
+
+#include "hw/core/cpu.h"
+#include "qom/object.h"
+
+#define TYPE_LOONGARCH_CPU "loongarch-cpu"
+#define TYPE_LOONGARCH32_CPU "loongarch32-cpu"
+#define TYPE_LOONGARCH64_CPU "loongarch64-cpu"
+
+OBJECT_DECLARE_CPU_TYPE(LoongArchCPU, LoongArchCPUClass,
+                        LOONGARCH_CPU)
+
+#define LOONGARCH_CPU_TYPE_SUFFIX "-" TYPE_LOONGARCH_CPU
+#define LOONGARCH_CPU_TYPE_NAME(model) model LOONGARCH_CPU_TYPE_SUFFIX
+
+/**
+ * LoongArchCPUClass:
+ * @parent_realize: The parent class' realize handler.
+ * @parent_phases: The parent class' reset phase handlers.
+ *
+ * A LoongArch CPU model.
+ */
+struct LoongArchCPUClass {
+    CPUClass parent_class;
+
+    DeviceRealize parent_realize;
+    ResettablePhases parent_phases;
+};
+
+#endif
diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index 40e70a8119..22cebc6280 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -17,6 +17,7 @@
 #include "exec/memory.h"
 #endif
 #include "cpu-csr.h"
+#include "cpu-qom.h"
 
 #define IOCSRF_TEMP             0
 #define IOCSRF_NODECNT          1
@@ -383,29 +384,6 @@ struct ArchCPU {
     const char *dtb_compatible;
 };
 
-#define TYPE_LOONGARCH_CPU "loongarch-cpu"
-#define TYPE_LOONGARCH32_CPU "loongarch32-cpu"
-#define TYPE_LOONGARCH64_CPU "loongarch64-cpu"
-
-OBJECT_DECLARE_CPU_TYPE(LoongArchCPU, LoongArchCPUClass,
-                        LOONGARCH_CPU)
-
-/**
- * LoongArchCPUClass:
- * @parent_realize: The parent class' realize handler.
- * @parent_phases: The parent class' reset phase handlers.
- *
- * A LoongArch CPU model.
- */
-struct LoongArchCPUClass {
-    /*< private >*/
-    CPUClass parent_class;
-    /*< public >*/
-
-    DeviceRealize parent_realize;
-    ResettablePhases parent_phases;
-};
-
 /*
  * LoongArch CPUs has 4 privilege levels.
  * 0 for kernel mode, 3 for user mode.
@@ -482,8 +460,6 @@ void loongarch_cpu_list(void);
 
 #include "exec/cpu-all.h"
 
-#define LOONGARCH_CPU_TYPE_SUFFIX "-" TYPE_LOONGARCH_CPU
-#define LOONGARCH_CPU_TYPE_NAME(model) model LOONGARCH_CPU_TYPE_SUFFIX
 #define CPU_RESOLVING_TYPE TYPE_LOONGARCH_CPU
 
 #endif /* LOONGARCH_CPU_H */
-- 
2.41.0

