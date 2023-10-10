Received: by 2002:a17:906:fa85:b0:9b6:5cec:e61e with SMTP id lt5csp14108ejb;
        Tue, 10 Oct 2023 02:31:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkpC9MVHOn5SnkIh4wGWWOYoTtgxGnVx9qQMmqJMr2mW0dqQjXZsF+Oy6GdTdElatQcd02
X-Received: by 2002:a05:620a:1a86:b0:773:bf62:b274 with SMTP id bl6-20020a05620a1a8600b00773bf62b274mr19961995qkb.61.1696930303741;
        Tue, 10 Oct 2023 02:31:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696930303; cv=none;
        d=google.com; s=arc-20160816;
        b=09iapXYiCVApOxDS5ss5maRDkmSXdkWDXrhWU8n9A8X6Gp2luuQ2Z2HI958bwRTmx/
         c/JTnKFEqDt+Rp6SU8a+Sri8KENFzf94ai1lbwb6lui0DdghBDBtkC7PgxMalLDWO+V0
         qtUgoVuX9y689E72RVNXqFM1HtagRXzOJnY1WqpUXAS4joPtf+6D1/uFagd62nmX2fMp
         9NA4Y/j/OyKZagDTPN0/fjCm8HnezexCGe+n0oszoF0Y/3e2IHotR5ciYHmpwtgXlaAV
         aPZmPRZWJ5r5VupACt+3eXeRtesrPqipJLkQ0EGRcX3fxyafJcNua1E/v+z169WBaG/8
         WpEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=CIEk/ao3BM11WiVM3nzCCvuXQBDA4Jx8RUa5x+46rK0=;
        fh=iupQBrmerAoZOw8v6swRnyYBx+6KhbF7AbBF1Jawaz4=;
        b=Be4SEUP90tC32glv9ziw5nEwI38I51CYT57pwrlxbc+41PcRKYcNBs566O7A0yloli
         i6APmlb2TDjTagrx4QKp4GNZnqswJQIrNaN0n6rHtABLz6GNFtwN/b0alfoXoeq5eyaW
         Uqyg9ZqSNntAI0tpCdLTFWJBjMasf7Qk5zFE2gZULYwcrQFsBoU2sZvzazwrLKeEi5lX
         m2L2Xx9xVMoCA0cz24gxJSqF7ui6dktB/QI7TyYvw0eRuJT0lrPvh9uWdxs8RL2h9KRQ
         K9PcslumkNisN3f2TTL0mbRN3iXYbWheiHfd1/26MoVBEk96WcldeMHkgclLnSipejZu
         535Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Mjs7yt9O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bq39-20020a05620a46a700b00774396341a3si7642685qkb.363.2023.10.10.02.31.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Oct 2023 02:31:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Mjs7yt9O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qq93n-00006S-8u; Tue, 10 Oct 2023 05:29:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qq93l-0008Tm-Dv
 for qemu-arm@nongnu.org; Tue, 10 Oct 2023 05:29:49 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qq93j-0007j8-JN
 for qemu-arm@nongnu.org; Tue, 10 Oct 2023 05:29:49 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-9b2cee55056so986509466b.3
 for <qemu-arm@nongnu.org>; Tue, 10 Oct 2023 02:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696930186; x=1697534986; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CIEk/ao3BM11WiVM3nzCCvuXQBDA4Jx8RUa5x+46rK0=;
 b=Mjs7yt9OSWpfEHWrRaHzARwGXb0J/LDr53IVFXfGgO2/5VEssVpJOqJ9HAOznp1emy
 M4gtN7RVAqHCQrEfINYvYzHWBlNm5WzrDZlGUvVkPE4xZBoD4xnEJK+e/gTO61Ok/jlD
 t+Jci3iZVBqIEiCWoNJmobuvvAtVXbzFMDuK+xircIXzpcKXRcZmEjHNVgNlYoJxWFsB
 o93VebqkoVOn4FnqD1ux/GWcYG76d1zVnVqkSmdxZdg4iBz7LMcMPYQXvsPy+nRYyK+m
 v/xxe03PJWJ1UbKr6Fh0DOkcG/4nVuvSQ+az27aGcyk41SLeILEGbxuCdJxEVdrwZ2KT
 MKYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696930186; x=1697534986;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CIEk/ao3BM11WiVM3nzCCvuXQBDA4Jx8RUa5x+46rK0=;
 b=JAV0SNT5WjD9+t5UKvT+1eZVTJGnf8T+znOyXFiH0NOHDcKa0eB7csZZzQxP1d4LyM
 BpTRGgp/i+s0O9GKErEJFpBpStn1sv3TbZFfwMr9uJBKRNgnrbYAPoLcuWUGVXKB0DQb
 9zYxKt9mW55OUbUgHoX5Dmhuci7QvpObX6ZYA12fSKSFi11GDAPtMgF7F3Jl2YRSjcIp
 wElc5szJ1gOU+Ds7YRIfvTiobc4wHicN8IH+pk0zDiDSIgaWFdDvI7x+V/XH12ADo3/R
 BluiT27AL411vbl6oqdxXV4osvpEIOJVBSy3TxOyeFShbmqYKwC38yPpY+qVKAVwhWwS
 NniQ==
X-Gm-Message-State: AOJu0YyZ1rVYP8jdb3WAFubhZuoo80HcPZTystqH8orO1/57n/dX60e1
 u2KgD8Aahj4gPZhUA2FlCiVKdw==
X-Received: by 2002:a17:906:19b:b0:9a5:c9a8:1816 with SMTP id
 27-20020a170906019b00b009a5c9a81816mr16089250ejb.58.1696930186347; 
 Tue, 10 Oct 2023 02:29:46 -0700 (PDT)
Received: from m1x-phil.lan (aif79-h01-176-172-113-148.dsl.sta.abo.bbox.fr.
 [176.172.113.148]) by smtp.gmail.com with ESMTPSA id
 n10-20020aa7c78a000000b00535204ffdb4sm7430597eds.72.2023.10.10.02.29.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 10 Oct 2023 02:29:45 -0700 (PDT)
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
Subject: [PATCH 05/18] target/hexagon: Declare QOM definitions in 'cpu-qom.h'
Date: Tue, 10 Oct 2023 11:28:47 +0200
Message-ID: <20231010092901.99189-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231010092901.99189-1-philmd@linaro.org>
References: <20231010092901.99189-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62e.google.com
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
X-TUID: t/6E+hvxnjMi

"target/foo/cpu.h" contains the target specific declarations.

A heterogeneous setup need to access target agnostic declarations
(at least the QOM ones, to instantiate the objects).

Our convention is to add such target agnostic QOM declarations in
the "target/foo/cpu-qom.h" header.

Extract QOM definitions from "cpu.h" to "cpu-qom.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/hexagon/cpu-qom.h | 35 +++++++++++++++++++++++++++++++++++
 target/hexagon/cpu.h     | 23 +----------------------
 2 files changed, 36 insertions(+), 22 deletions(-)
 create mode 100644 target/hexagon/cpu-qom.h

diff --git a/target/hexagon/cpu-qom.h b/target/hexagon/cpu-qom.h
new file mode 100644
index 0000000000..cd45850c64
--- /dev/null
+++ b/target/hexagon/cpu-qom.h
@@ -0,0 +1,35 @@
+/*
+ * QEMU Hexagon CPU QOM header (target agnostic)
+ *
+ * Copyright(c) 2019-2023 Qualcomm Innovation Center, Inc. All Rights Reserved.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef QEMU_HEXAGON_CPU_QOM_H
+#define QEMU_HEXAGON_CPU_QOM_H
+
+#include "hw/core/cpu.h"
+#include "qom/object.h"
+
+#define TYPE_HEXAGON_CPU "hexagon-cpu"
+
+#define HEXAGON_CPU_TYPE_SUFFIX "-" TYPE_HEXAGON_CPU
+#define HEXAGON_CPU_TYPE_NAME(name) (name HEXAGON_CPU_TYPE_SUFFIX)
+
+#define TYPE_HEXAGON_CPU_V67 HEXAGON_CPU_TYPE_NAME("v67")
+#define TYPE_HEXAGON_CPU_V68 HEXAGON_CPU_TYPE_NAME("v68")
+#define TYPE_HEXAGON_CPU_V69 HEXAGON_CPU_TYPE_NAME("v69")
+#define TYPE_HEXAGON_CPU_V71 HEXAGON_CPU_TYPE_NAME("v71")
+#define TYPE_HEXAGON_CPU_V73 HEXAGON_CPU_TYPE_NAME("v73")
+
+OBJECT_DECLARE_CPU_TYPE(HexagonCPU, HexagonCPUClass, HEXAGON_CPU)
+
+typedef struct HexagonCPUClass {
+    CPUClass parent_class;
+
+    DeviceRealize parent_realize;
+    ResettablePhases parent_phases;
+} HexagonCPUClass;
+
+#endif
diff --git a/target/hexagon/cpu.h b/target/hexagon/cpu.h
index 10cd1efd57..7c3b993035 100644
--- a/target/hexagon/cpu.h
+++ b/target/hexagon/cpu.h
@@ -20,11 +20,10 @@
 
 #include "fpu/softfloat-types.h"
 
+#include "cpu-qom.h"
 #include "exec/cpu-defs.h"
 #include "hex_regs.h"
 #include "mmvec/mmvec.h"
-#include "qom/object.h"
-#include "hw/core/cpu.h"
 #include "hw/registerfields.h"
 
 #define NUM_PREGS 4
@@ -36,18 +35,8 @@
 #define PRED_WRITES_MAX 5                   /* 4 insns + endloop */
 #define VSTORES_MAX 2
 
-#define TYPE_HEXAGON_CPU "hexagon-cpu"
-
-#define HEXAGON_CPU_TYPE_SUFFIX "-" TYPE_HEXAGON_CPU
-#define HEXAGON_CPU_TYPE_NAME(name) (name HEXAGON_CPU_TYPE_SUFFIX)
 #define CPU_RESOLVING_TYPE TYPE_HEXAGON_CPU
 
-#define TYPE_HEXAGON_CPU_V67 HEXAGON_CPU_TYPE_NAME("v67")
-#define TYPE_HEXAGON_CPU_V68 HEXAGON_CPU_TYPE_NAME("v68")
-#define TYPE_HEXAGON_CPU_V69 HEXAGON_CPU_TYPE_NAME("v69")
-#define TYPE_HEXAGON_CPU_V71 HEXAGON_CPU_TYPE_NAME("v71")
-#define TYPE_HEXAGON_CPU_V73 HEXAGON_CPU_TYPE_NAME("v73")
-
 void hexagon_cpu_list(void);
 #define cpu_list hexagon_cpu_list
 
@@ -127,16 +116,6 @@ typedef struct CPUArchState {
     VTCMStoreLog vtcm_log;
 } CPUHexagonState;
 
-OBJECT_DECLARE_CPU_TYPE(HexagonCPU, HexagonCPUClass, HEXAGON_CPU)
-
-typedef struct HexagonCPUClass {
-    /*< private >*/
-    CPUClass parent_class;
-    /*< public >*/
-    DeviceRealize parent_realize;
-    ResettablePhases parent_phases;
-} HexagonCPUClass;
-
 struct ArchCPU {
     /*< private >*/
     CPUState parent_obj;
-- 
2.41.0

