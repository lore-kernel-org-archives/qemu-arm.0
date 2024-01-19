Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp881926ejg;
        Fri, 19 Jan 2024 03:44:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IErRY7nBtV9KT5RXDoOKP2bZW+CooO+xnFDTV2xR9ciQ2EOtMZ4umyhU2wpaJrC1FjxH2Zj
X-Received: by 2002:a05:620a:430f:b0:783:23a1:8b45 with SMTP id u15-20020a05620a430f00b0078323a18b45mr1653947qko.108.1705664651828;
        Fri, 19 Jan 2024 03:44:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705664651; cv=none;
        d=google.com; s=arc-20160816;
        b=UXqsjELi2EidymiW4pzuqYMWnTNbnHab8muAUVCSu2DiKnZak1RM8i0t1dK0alD0Cj
         U+ktY5DJmLh5eK6iJp6bnd/IIk3gO7Qgrgrq2fRE8LBbBWUcuMZzRdQLaQfj+3zqVXjr
         AnlK/Djg4s4Uq3AHlrTcJ973hw+wXvu+SyQM1tiFBQr9jwmESwhlW3QdxJ5YluN8h2o+
         vslZT8R3ACvm9ytKNtI/QgcHi7tdS1ZxAQzgDtMpG9KNOaxM4Yp/1AbI0KmydiRgIlqS
         WWZGShFT+eFmrAO+N2UadpDGOlGMQsr0ngc5dJAt1YLKPW0yQYGlVpMoPdrH1epD+Aa5
         Mw8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=jLRXy22Xor5y6P0/iN4HTYPsSbdEgm9rijeYJNuVZIA=;
        fh=xyhJj9tfvEKpRpUcgN+Ggw682L07EpOsT6z0FH/aTQk=;
        b=vRE5ZIS3hbVSH9tXLfoXnU4PvRakJvyUh7P2SGFExMpbT9u2pC8FYG7fgBj44CPsiO
         eX80O0NpehhOjwWCbF6Zyl+NySLDNUFYMQ+79uMJiEv3Lr6rtannjfByQvdVVTcGyGEI
         pxQKIbcgpUUapSs59cNraz+Aj97mOnLJHUdjK91ghViZVBP1oIBuDGR1+FSI/ixUnSD5
         NtMkpynjb3Is7MRF79jeePw31NA6Mnor6FKgx38se2zhU8gR7qXSuNWDmlBE2fI5D3DK
         r5VztxH/rtZvuYVfeqUHDRel/G3JeVF5FTzrd6DfGMkd1vXYfwA46q5ywgery5NmC4Cg
         RU5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rhMELx5I;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y6-20020a05620a0e0600b00781adc17f0fsi15857213qkm.63.2024.01.19.03.44.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jan 2024 03:44:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rhMELx5I;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rQnBZ-0005qU-KD; Fri, 19 Jan 2024 06:37:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQnBY-0005fS-7I
 for qemu-devel@nongnu.org; Fri, 19 Jan 2024 06:37:20 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQnBU-0002z8-Uw
 for qemu-devel@nongnu.org; Fri, 19 Jan 2024 06:37:19 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40e80046246so3929215e9.1
 for <qemu-devel@nongnu.org>; Fri, 19 Jan 2024 03:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705664235; x=1706269035; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jLRXy22Xor5y6P0/iN4HTYPsSbdEgm9rijeYJNuVZIA=;
 b=rhMELx5IewmlbyOQ8VNkeyx6gJQ2pEdpuMFcvSLGghD5vKUuZn++wxiCs4XFCKN0OJ
 dyRKHwXcY5rabKWz8fKmUEH8y6vBtxSBDpAIxhCnwqhQSwvBJQYicwc9q0L2kvifvyL5
 6NhylwIJ+h8xMRuPhbJajn9kDmdi+F4vastGzUzCyORLlt1Sg/CkbaIxHDvcXHR3VUFb
 baOlKVEVshU7Y+L5aQ6nhoaC809Z41aSAnP72denK8W5fD0XwQu7NCY2zbFVRIBnlfZT
 hkHMfnVeEctPVDjv0xwaHIg08+RYJ/WzqtHkfwtcNQR9ibFYisXm+irPGgYa7YVeWqTS
 wRiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705664235; x=1706269035;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jLRXy22Xor5y6P0/iN4HTYPsSbdEgm9rijeYJNuVZIA=;
 b=VfPQ8xMLkQnutIV65n3WXn2Erg8rZN/Z0AZXUz6lbOhDTnlQvw1JUcH/WNga3QGW82
 /hzYJ7tfZAPbwqjpPxwdGkdw2C7MAxa6eb9Hz2z32l7ki7176sa8pxnfQrrhaEdkGMYI
 E86nMypPof+edbL91fh1JPqF55HYp2yhHt4mZrlr65TLFPwAgqPO4xc2WRPXSIjxATgN
 HUQEktQxw32Q5s8P0moSUN/XxHbWsRCNOfasZ9a7zNskCeRh7e5hrceZ2MTn5yhdGZdu
 kDkkRH7SYMzSQfEEY2xbhRrWpaeM4YDnMKDUlc9Hn9SnzbcF6OOvfZTZpYJB7vI13RVh
 UJ1Q==
X-Gm-Message-State: AOJu0Yxr8jXzknBO09Wmuen53WEymA2gyrIEZEF6JDdKuzvZnRNOT+sZ
 VPaYozKOX+LHgDZ/sNbF6lobKPk6V62JEiMpcAzmLSyQnR7FVJ/R9tHwSt1Yn7mfzyfZyJD+SL8
 +AKZpqQ==
X-Received: by 2002:a7b:cb46:0:b0:40e:78e0:adf with SMTP id
 v6-20020a7bcb46000000b0040e78e00adfmr498602wmj.182.1705664234809; 
 Fri, 19 Jan 2024 03:37:14 -0800 (PST)
Received: from localhost.localdomain (91-163-26-170.subs.proxad.net.
 [91.163.26.170]) by smtp.gmail.com with ESMTPSA id
 f11-20020adff98b000000b00337d5cd0d8asm3184111wrr.90.2024.01.19.03.37.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 19 Jan 2024 03:37:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PULL 28/36] target/riscv: Rename tcg_cpu_FOO() to include 'riscv'
Date: Fri, 19 Jan 2024 12:34:57 +0100
Message-ID: <20240119113507.31951-29-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240119113507.31951-1-philmd@linaro.org>
References: <20240119113507.31951-1-philmd@linaro.org>
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: DyH2Ejck6Wb0

The tcg_cpu_FOO() names are riscv specific, so rename
them as riscv_tcg_cpu_FOO() (as other names in this file)
to ease navigating the code.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-ID: <20240111120221.35072-6-philmd@linaro.org>
---
 target/riscv/tcg/tcg-cpu.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 14133ff665..994ca1cdf9 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -929,7 +929,7 @@ static bool riscv_cpu_is_vendor(Object *cpu_obj)
  *   -> cpu_exec_realizefn()
  *      -> tcg_cpu_realize() (via accel_cpu_common_realize())
  */
-static bool tcg_cpu_realize(CPUState *cs, Error **errp)
+static bool riscv_tcg_cpu_realize(CPUState *cs, Error **errp)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     Error *local_err = NULL;
@@ -1372,7 +1372,7 @@ static bool riscv_cpu_has_max_extensions(Object *cpu_obj)
     return object_dynamic_cast(cpu_obj, TYPE_RISCV_CPU_MAX) != NULL;
 }
 
-static void tcg_cpu_instance_init(CPUState *cs)
+static void riscv_tcg_cpu_instance_init(CPUState *cs)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     Object *obj = OBJECT(cpu);
@@ -1386,7 +1386,7 @@ static void tcg_cpu_instance_init(CPUState *cs)
     }
 }
 
-static void tcg_cpu_init_ops(AccelCPUClass *accel_cpu, CPUClass *cc)
+static void riscv_tcg_cpu_init_ops(AccelCPUClass *accel_cpu, CPUClass *cc)
 {
     /*
      * All cpus use the same set of operations.
@@ -1394,30 +1394,30 @@ static void tcg_cpu_init_ops(AccelCPUClass *accel_cpu, CPUClass *cc)
     cc->tcg_ops = &riscv_tcg_ops;
 }
 
-static void tcg_cpu_class_init(CPUClass *cc)
+static void riscv_tcg_cpu_class_init(CPUClass *cc)
 {
-    cc->init_accel_cpu = tcg_cpu_init_ops;
+    cc->init_accel_cpu = riscv_tcg_cpu_init_ops;
 }
 
-static void tcg_cpu_accel_class_init(ObjectClass *oc, void *data)
+static void riscv_tcg_cpu_accel_class_init(ObjectClass *oc, void *data)
 {
     AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
 
-    acc->cpu_class_init = tcg_cpu_class_init;
-    acc->cpu_instance_init = tcg_cpu_instance_init;
-    acc->cpu_target_realize = tcg_cpu_realize;
+    acc->cpu_class_init = riscv_tcg_cpu_class_init;
+    acc->cpu_instance_init = riscv_tcg_cpu_instance_init;
+    acc->cpu_target_realize = riscv_tcg_cpu_realize;
 }
 
-static const TypeInfo tcg_cpu_accel_type_info = {
+static const TypeInfo riscv_tcg_cpu_accel_type_info = {
     .name = ACCEL_CPU_NAME("tcg"),
 
     .parent = TYPE_ACCEL_CPU,
-    .class_init = tcg_cpu_accel_class_init,
+    .class_init = riscv_tcg_cpu_accel_class_init,
     .abstract = true,
 };
 
-static void tcg_cpu_accel_register_types(void)
+static void riscv_tcg_cpu_accel_register_types(void)
 {
-    type_register_static(&tcg_cpu_accel_type_info);
+    type_register_static(&riscv_tcg_cpu_accel_type_info);
 }
-type_init(tcg_cpu_accel_register_types);
+type_init(riscv_tcg_cpu_accel_register_types);
-- 
2.41.0

