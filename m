Received: by 2002:a17:906:bfc6:b0:9a1:fa4e:495e with SMTP id us6csp347804ejb;
        Fri, 8 Sep 2023 04:23:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsIuAmtkntWEqjPhu4A1q3E+EjWBUsffgEcPslMK+0Dk+RWoR/Sx6s617igHwPPkAXTRtr
X-Received: by 2002:a05:620a:2ade:b0:76c:8d5f:5954 with SMTP id bn30-20020a05620a2ade00b0076c8d5f5954mr2048921qkb.70.1694172207274;
        Fri, 08 Sep 2023 04:23:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694172207; cv=none;
        d=google.com; s=arc-20160816;
        b=K+TrN9okqoCZvC4Zs3yk2lm5DtUnkiOebThN3Y1epjKbb7HcJGUml0bmJO3cBirsIa
         c813dlVOVElxSBE0S9B1mTIompzxtzasaBy4mfM5icRgOsZzqvGTvRK+EiTm+VFR3GZR
         HPTHaHu/Wb2NLuQ+ABBpYCEVPelu2ssLuS6XH6KcyDzhHmJnxHTFo7tyfPhyRDUZPjdc
         voyEjrI4PRA20Xqvv6Rya5rhcjgxDMwODTu1zuePJEtg2LghVNrGNjnfTLaTo/IlLn3L
         TOTyLWEfgSY9vf50k3AECdV1R4PM89/sF/V0qRPMoiRQwaLtkL6CHCtjtSGRCJUBatQl
         6kOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=K/YkGJmASUJnEMaMG4VGJ0aAEtMk9/BNtlzjAdGgNrE=;
        fh=xrkPdSTzLfgAPR/xILKWCY/2YOP2wIq4k78J4mWio7M=;
        b=hmMMi0YCmLfTJ8wDV00NuCg+/FWbqhrdFp6ezjrhQcdoY1U/Z3//TnK5dUrQFrajH2
         yRORSbgt/Uzpozb3G4XywpHNjETXDC+MVjBunfipoQe6y6F/HQCmrXvl6wQt48SlPOZ5
         Ij+yARY/WldDAoee9ydoqploc1ZxPfb1QsY1J5mXaUcH6fzaYWPHfBOyGZjNqj7eR12k
         k4fNSSlA6M46O4KcYSpOoqj/XZ2MQNpGpiP7bSa2pawAhSVJ8xV6NBpqbszPyPgEXM15
         godhQOuZTGFAzkvijn0oVCBZZVyGH/y/fE13+OlxD/m+4vhCGc3+P7wtm6wRE5pCMRu2
         b2AA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vG+EtTkh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bj21-20020a05620a191500b0076f1a6b0551si953850qkb.386.2023.09.08.04.23.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Sep 2023 04:23:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vG+EtTkh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qeZa7-00040E-Tj; Fri, 08 Sep 2023 07:23:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qeZa5-0003z6-KB
 for qemu-arm@nongnu.org; Fri, 08 Sep 2023 07:23:21 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qeZa0-0003ie-UP
 for qemu-arm@nongnu.org; Fri, 08 Sep 2023 07:23:21 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-401da71b83cso21693265e9.2
 for <qemu-arm@nongnu.org>; Fri, 08 Sep 2023 04:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694172194; x=1694776994; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K/YkGJmASUJnEMaMG4VGJ0aAEtMk9/BNtlzjAdGgNrE=;
 b=vG+EtTkhxGOiBMFDUfD4sFJpkgiXInUbX/4kf3IoiE0R1KwcgOrqaiRN9J5sbFVCAS
 FyIHGUgbz4l8VxmsKPA03os3Kybdw3pmabmgdQtLhkRyArOss1HyQBoeVkwTbuM69UF1
 LpI+JuM4fTl+jaCVQsZ1lcRhEFyhYPBOQW3VuedSQ4mna2SEvjGLXKhkN+5VFbugEreS
 dFyKCk5jQu47kciXi5NLupO+W0BUabOmxez7tgS6nurpVjy6k6HpncyxtwNDLUoUpSXm
 1CIr4kEvC2ZGp0FJEkgayJSuLtHPPI37nNgpxcb6CdTnXaFJZEFWoJTQNnkoLQZY7bU5
 OGgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694172194; x=1694776994;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K/YkGJmASUJnEMaMG4VGJ0aAEtMk9/BNtlzjAdGgNrE=;
 b=vn3QaC7JJx+9vADesbx3FaKs2WLd69Eo0PFLuNSCPYXtMLFkzqoYhRwW9oaItfIoMc
 kPMRKErP3clrQKRmsccrCO3JaApQJGt76tnlFwsyXA43Fkc/fcYLWBVdDOGXvBxKXAor
 jUF9Cp9UE0j8/LWpOLcXzELOce8tOMcAnVQ7tCVFygg18AONsHZI82nUcD6vwKdYHyDa
 NwGXBctyocgXK5BKjh69sgnVdOuV0QsFHXHI0mLk8cl433b9oOx6LQtzn1b9Ccktqi6V
 ulW3+5O3LoIJz3jV5cfLEBS3DGj6o99b3trSLUxJrL/9Sg1H1dBKx0X9/tZ4TxbthN/1
 3vHQ==
X-Gm-Message-State: AOJu0YwbwNGvKSXrGzd2RxJGKBlMJ4fRHIK1b6NX8DTqQtnywkHHM1os
 jU0f9/ABrJpuIrRy6V9jJx24Eg==
X-Received: by 2002:a1c:4b0b:0:b0:402:ee59:ff49 with SMTP id
 y11-20020a1c4b0b000000b00402ee59ff49mr2030454wma.9.1694172194657; 
 Fri, 08 Sep 2023 04:23:14 -0700 (PDT)
Received: from m1x-phil.lan (lfb24-h01-176-173-167-175.dsl.sta.abo.bbox.fr.
 [176.173.167.175]) by smtp.gmail.com with ESMTPSA id
 y23-20020a7bcd97000000b003fee6f027c7sm4966259wmj.19.2023.09.08.04.23.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 08 Sep 2023 04:23:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>,
 Gavin Shan <gshan@redhat.com>
Cc: Chris Wulff <crwulff@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-s390x@nongnu.org,
 Weiwei Li <liweiwei@iscas.ac.cn>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Nicholas Piggin <npiggin@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Greg Kurz <groug@kaod.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 qemu-ppc@nongnu.org, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Marek Vasut <marex@denx.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Michael Rolnik <mrolnik@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-riscv@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Bin Meng <bin.meng@windriver.com>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Song Gao <gaosong@loongson.cn>,
 Stafford Horne <shorne@gmail.com>, Yanan Wang <wangyanan55@huawei.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Brian Cain <bcain@quicinc.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Thomas Huth <thuth@redhat.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH 4/4] hw/cpu: Call object_class_dynamic_cast() once in
 cpu_class_by_name()
Date: Fri,  8 Sep 2023 13:22:34 +0200
Message-ID: <20230908112235.75914-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230908112235.75914-1-philmd@linaro.org>
References: <20230908112235.75914-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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
X-TUID: +muREWzEaKjn

Leverage the public CPUClass::cpu_resolving_type field and
call object_class_dynamic_cast() once in cpu_class_by_name().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/core/cpu-common.c   | 3 ++-
 target/alpha/cpu.c     | 3 +--
 target/arm/cpu.c       | 4 +---
 target/avr/cpu.c       | 4 +---
 target/cris/cpu.c      | 4 +---
 target/hexagon/cpu.c   | 4 +---
 target/loongarch/cpu.c | 5 +----
 target/m68k/cpu.c      | 4 +---
 target/openrisc/cpu.c  | 4 +---
 target/riscv/cpu.c     | 4 +---
 target/rx/cpu.c        | 2 +-
 target/tricore/cpu.c   | 4 +---
 target/xtensa/cpu.c    | 4 +---
 13 files changed, 14 insertions(+), 35 deletions(-)

diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index 2d24261a6a..f4a2ccebea 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -157,7 +157,8 @@ ObjectClass *cpu_class_by_name(const char *typename, const char *cpu_model)
     cc = CPU_CLASS(oc);
     assert(cc->cpu_resolving_type && cc->class_by_name);
     oc = cc->class_by_name(cpu_model);
-    if (oc == NULL || object_class_is_abstract(oc)) {
+    if (oc == NULL || object_class_is_abstract(oc)
+                   || !object_class_dynamic_cast(oc, cc->cpu_resolving_type)) {
         return NULL;
     }
     return oc;
diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index 0ddea8004c..b184fcc123 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -126,8 +126,7 @@ static ObjectClass *alpha_cpu_class_by_name(const char *cpu_model)
     int i;
 
     oc = object_class_by_name(cpu_model);
-    if (oc != NULL && object_class_dynamic_cast(oc, TYPE_ALPHA_CPU) != NULL &&
-        !object_class_is_abstract(oc)) {
+    if (oc != NULL && !object_class_is_abstract(oc)) {
         return oc;
     }
 
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 9e51bde170..d29040cd8c 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2300,9 +2300,7 @@ static ObjectClass *arm_cpu_class_by_name(const char *cpu_model)
     oc = object_class_by_name(typename);
     g_strfreev(cpuname);
     g_free(typename);
-    if (!oc || !object_class_dynamic_cast(oc, TYPE_ARM_CPU)) {
-        return NULL;
-    }
+
     return oc;
 }
 
diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index f6004169ac..53735ff1dd 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -159,9 +159,7 @@ static ObjectClass *avr_cpu_class_by_name(const char *cpu_model)
     ObjectClass *oc;
 
     oc = object_class_by_name(cpu_model);
-    if (object_class_dynamic_cast(oc, TYPE_AVR_CPU) == NULL) {
-        oc = NULL;
-    }
+
     return oc;
 }
 
diff --git a/target/cris/cpu.c b/target/cris/cpu.c
index adde4f599d..b307d0b9db 100644
--- a/target/cris/cpu.c
+++ b/target/cris/cpu.c
@@ -95,9 +95,7 @@ static ObjectClass *cris_cpu_class_by_name(const char *cpu_model)
     typename = g_strdup_printf(CRIS_CPU_TYPE_NAME("%s"), cpu_model);
     oc = object_class_by_name(typename);
     g_free(typename);
-    if (oc != NULL && !object_class_dynamic_cast(oc, TYPE_CRIS_CPU)) {
-        oc = NULL;
-    }
+
     return oc;
 }
 
diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
index 2d4fed838d..4b8d63c4a7 100644
--- a/target/hexagon/cpu.c
+++ b/target/hexagon/cpu.c
@@ -63,9 +63,7 @@ static ObjectClass *hexagon_cpu_class_by_name(const char *cpu_model)
     oc = object_class_by_name(typename);
     g_strfreev(cpuname);
     g_free(typename);
-    if (!oc || !object_class_dynamic_cast(oc, TYPE_HEXAGON_CPU)) {
-        return NULL;
-    }
+
     return oc;
 }
 
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 189dfd32d1..1eb2c579eb 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -646,10 +646,7 @@ static ObjectClass *loongarch_cpu_class_by_name(const char *cpu_model)
         }
     }
 
-    if (object_class_dynamic_cast(oc, TYPE_LOONGARCH_CPU)) {
-        return oc;
-    }
-    return NULL;
+    return oc;
 }
 
 void loongarch_cpu_dump_state(CPUState *cs, FILE *f, int flags)
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index bd7bb103d7..e8b86c80f1 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -111,9 +111,7 @@ static ObjectClass *m68k_cpu_class_by_name(const char *cpu_model)
     typename = g_strdup_printf(M68K_CPU_TYPE_NAME("%s"), cpu_model);
     oc = object_class_by_name(typename);
     g_free(typename);
-    if (oc != NULL && object_class_dynamic_cast(oc, TYPE_M68K_CPU) == NULL) {
-        return NULL;
-    }
+
     return oc;
 }
 
diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index 5e1e0576e0..7aac9105bd 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -168,9 +168,7 @@ static ObjectClass *openrisc_cpu_class_by_name(const char *cpu_model)
     typename = g_strdup_printf(OPENRISC_CPU_TYPE_NAME("%s"), cpu_model);
     oc = object_class_by_name(typename);
     g_free(typename);
-    if (oc != NULL && !object_class_dynamic_cast(oc, TYPE_OPENRISC_CPU)) {
-        return NULL;
-    }
+
     return oc;
 }
 
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index e8f04ef82b..0170e288e7 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -619,9 +619,7 @@ static ObjectClass *riscv_cpu_class_by_name(const char *cpu_model)
     oc = object_class_by_name(typename);
     g_strfreev(cpuname);
     g_free(typename);
-    if (!oc || !object_class_dynamic_cast(oc, TYPE_RISCV_CPU)) {
-        return NULL;
-    }
+
     return oc;
 }
 
diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index 2a6df418a8..879d4fcdef 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -111,7 +111,7 @@ static ObjectClass *rx_cpu_class_by_name(const char *cpu_model)
     char *typename;
 
     oc = object_class_by_name(cpu_model);
-    if (oc != NULL && object_class_dynamic_cast(oc, TYPE_RX_CPU) != NULL) {
+    if (oc != NULL) {
         return oc;
     }
     typename = g_strdup_printf(RX_CPU_TYPE_NAME("%s"), cpu_model);
diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index ffe5158786..f65b8761b0 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -140,9 +140,7 @@ static ObjectClass *tricore_cpu_class_by_name(const char *cpu_model)
     typename = g_strdup_printf(TRICORE_CPU_TYPE_NAME("%s"), cpu_model);
     oc = object_class_by_name(typename);
     g_free(typename);
-    if (!oc || !object_class_dynamic_cast(oc, TYPE_TRICORE_CPU)) {
-        return NULL;
-    }
+
     return oc;
 }
 
diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index 13bed05d0c..6d96e5ab27 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -141,9 +141,7 @@ static ObjectClass *xtensa_cpu_class_by_name(const char *cpu_model)
     typename = g_strdup_printf(XTENSA_CPU_TYPE_NAME("%s"), cpu_model);
     oc = object_class_by_name(typename);
     g_free(typename);
-    if (oc == NULL || !object_class_dynamic_cast(oc, TYPE_XTENSA_CPU)) {
-        return NULL;
-    }
+
     return oc;
 }
 
-- 
2.41.0

