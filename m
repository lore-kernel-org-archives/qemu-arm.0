Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E1EBF433CC
	for <qemu-arm@archiver.kernel.org>; Wed, 15 Apr 2026 21:57:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wD8E1-0002iC-H9; Wed, 15 Apr 2026 17:56:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wD8Dv-0002am-Le
 for qemu-arm@nongnu.org; Wed, 15 Apr 2026 17:56:39 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wD8Du-0002sc-7r
 for qemu-arm@nongnu.org; Wed, 15 Apr 2026 17:56:39 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-43d70b3e159so1870032f8f.0
 for <qemu-arm@nongnu.org>; Wed, 15 Apr 2026 14:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776290197; x=1776894997; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vuIqjkDFYw/UkV0TZBDvRk6uXE3wlZHhGyuhp0aPUMA=;
 b=RBKDgv7ximPB2GInQa14ECT1DEJGv4A/AdgyP+RbMjl8kGjtMnOc5X1JkqwqoQnmc6
 +KomiWK1hPZ2CfXcxesobPv0clIQ1niG0i8cXGcPg2FhSZw9z9/1oeRzTQkNmVA/akW9
 x8jvlEQEJYXX+V050irB8IiMOUEjQvxyQKLBwahmcTyKC7HKZI9mvDYPK2sgm98LPtz9
 znWuMexzUxjTzqL1W266+8PzjcBdn52vfOlU2kHH/O9Ao29LAIu42p9CS/rTcQZlNKT6
 8JNz/b/tr5op9VB5E6yOGcxe0rI22BtU+hlDAHpZtpA4GeJyhcCfXmzB45rAhcaWDSYA
 ni1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776290197; x=1776894997;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vuIqjkDFYw/UkV0TZBDvRk6uXE3wlZHhGyuhp0aPUMA=;
 b=Lm32Yv8oNKLvmOhIqNCN7FlUFb8pNMiGvNIxaRd3a5bhnV9BykFSRYWu8kmgIcOr19
 Z6WtYdaeluBNQKQWg7b5UlfikNru3BU9AyO7H94fpv2asEIJKJVX/FY/x+0js25ZErpC
 6FyIqm43ey+Mf6asb4hKTJihSZnccqGZiRbke+rZgeT1VB5M4YqQr3cS+KIF/Ooczyfl
 tp4KsNYmerL+FpjfIJj1SVl7Nv9hbl78xu/7bFhUBLE1z4WRinGuWhuHYY10RPe+YuOH
 O2AVp+hZsjDQEeRCo2IROH6XjO+2Wd1U4LlJIU07Vj0bQ8eyCN6iYj3ZClJ/HiZdgRf4
 ktwQ==
X-Gm-Message-State: AOJu0YycH3PmEvcDHz0NmLriW4EVPLSXRLaGmvoGCxRxNJ5oZ4XulRKV
 P581bj06xu6FpIKfn4HsF0GW4DUnhmRFbHA+DqZfv9++xBxW8rq/MqM7Z0mv77rMkls=
X-Gm-Gg: AeBDietG4ZUtyGAHNJAutcPQni5Bv5rmo/6B43FCEdvzru1ERLPBaEHFBBVgoLG21O+
 UsjChl9h/6WD51p1/Ie9IqGU+N7kORul7kZd/g32ziDPhYWBEHH2z4AQaCiHvZvjqufNUdKEHD5
 0+nh72HvxrSbneMbSQXRKI9V8UEC2UZZ113hHjkZyOOfMH9YP231QLfYvmDk8+AT6m/8e/kvOcx
 B5QKUL0Yk/gQqlgt/622lzk6NuiqesJpc1Nf0AF6fKft5qB0J4+ddJElW+kmthyZprcjjPp0eOs
 UuOhgdkX1NdOoI41lGobd9bIqrXejjrYp7QzDEvf6874vFigcFA+u2UjG76r2MZRk4lH77iL11d
 G9O1uB4jbTade4mEZbaEhWkymaDG+jRO1fKnzmGqtuWcnnMwL/udiJc0TXKYZ4rtzpNGcQA9fjE
 nvQICIkUNoo+TCqkxQBWqkuserg8tI2yeMl7+DOXIVEtEBDuOh+VD5s1WrtGwCerzsquGXFdtr
X-Received: by 2002:a5d:5f92:0:b0:43b:60f7:2283 with SMTP id
 ffacd0b85a97d-43d64289753mr35084545f8f.22.1776290196656; 
 Wed, 15 Apr 2026 14:56:36 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43ead3dfff3sm7480881f8f.26.2026.04.15.14.56.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Apr 2026 14:56:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-block@nongnu.org
Subject: [PATCH 8/8] target/riscv: Iterate vCPUs using CPU_FOREACH() macro
Date: Wed, 15 Apr 2026 23:55:39 +0200
Message-ID: <20260415215539.92629-9-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260415215539.92629-1-philmd@linaro.org>
References: <20260415215539.92629-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Most code iterates over vCPUs using the CPU_FOREACH()
macro. Prefer cpu_env(cpu) over &cpu->env.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/riscv/boot.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index e5490beda00..61e21678cd1 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -490,10 +490,11 @@ void riscv_setup_direct_kernel(hwaddr kernel_addr, hwaddr fdt_addr)
 {
     CPUState *cs;
 
-    for (cs = first_cpu; cs; cs = CPU_NEXT(cs)) {
-        RISCVCPU *riscv_cpu = RISCV_CPU(cs);
-        riscv_cpu->env.kernel_addr = kernel_addr;
-        riscv_cpu->env.fdt_addr = fdt_addr;
+    CPU_FOREACH(cs) {
+        CPURISCVState *env = cpu_env(cs);
+
+        env->kernel_addr = kernel_addr;
+        env->fdt_addr = fdt_addr;
     }
 }
 
-- 
2.53.0


