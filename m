Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4578946ejc;
        Mon, 27 Feb 2023 04:40:25 -0800 (PST)
X-Google-Smtp-Source: AK7set+xfqmodbIFLEbGJTPaHYwOAu8FzIBHcJ3KKKC2e2uwJUqh8qA6B97Jcb8wsX/A+3SsEvDI
X-Received: by 2002:a05:6214:da4:b0:56c:659d:435c with SMTP id h4-20020a0562140da400b0056c659d435cmr43380636qvh.24.1677501624981;
        Mon, 27 Feb 2023 04:40:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677501624; cv=none;
        d=google.com; s=arc-20160816;
        b=ecJhgnMAB8U6swQatZ9vK/vaLbYsX9aCeGlGoRDDAJh3iZ8Rxt+pxR677/E/nc0hBF
         TjteEEy0nZtRsC4vso+k5PnebUlr7X4aofAxOXUTCcN/OD9tZgiAKUqjRiT3yNLBlcpq
         aBxL5aazO0unx0ejQJKH0VnOGxRbfjUdJQJAR8wTTAosayWc9+nlydRdxMYgLbJ9pu/X
         5clHqV38mFGDrcMeciq/xOH+cGdtoImKfTAO1mG6L0m+z2L5kUeWjMpyOi0cjoPaxAhM
         LWB55H4wLAlEjnfjVD3P9rFkT9osXKENYkpQ1M36AxSQt4KBlB/+VS7mvbBUO3OcniDI
         ereA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=hHkorEEx1ryMbtnru8OP+7VqvXYQH8B0BY1UFqCCXgs=;
        b=kjYj9U9uw8uTPTET0rJQeutj6OKmf2U69g8Qe1JJwrakoVGJckeleOvcePnE6Dgkjm
         1ba1blc6ljVjfo+UPfaEzZYDO1QaRjm5rs8r/qMUAWtsU/oGziViJ4IixAlpcA3N8Tjp
         FkYy0ekLFrfdSKLmZwiyLgDfO4EHFW/gwrB0UEnpMgVwQuKYAKBzqi/DDfus5QLDH0zo
         QzrIoFITqamecFBWvmOVmOGt2YNjM1shoFZ/RkY5piclyVZ1UpvfwAHrjJBGNVkvc0E/
         v6PMo69lTnJTp2tYAk+DOIZCnXPXxGc4uz8mu6NhmjntDhb7zLFT1aWZstHYGbUdu8ED
         iVfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LAjrBcoF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t12-20020a0cde0c000000b0056eb06029f7si6315221qvk.421.2023.02.27.04.40.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Feb 2023 04:40:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LAjrBcoF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWcnM-0003OP-4J; Mon, 27 Feb 2023 07:40:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWcn2-000376-Er
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 07:39:38 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWcmz-0001F4-LN
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 07:39:36 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 r19-20020a05600c459300b003eb3e2a5e7bso2089868wmo.0
 for <qemu-arm@nongnu.org>; Mon, 27 Feb 2023 04:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hHkorEEx1ryMbtnru8OP+7VqvXYQH8B0BY1UFqCCXgs=;
 b=LAjrBcoFJHFyCKj5Wso9HN81hN/uyLx8R7vsT4Fdp1fvGCOLv3R8GCT8HUZ9pPmXW0
 gw3occjFJrophu+7cFvnsFFUSah0DWzMGMw91snD1SSN99ZgEhS1NNvKAlPg2VB8g6Wz
 PWYKrYrSeiUoFa8AeFMLEaMT2yB3lBa/wx1OWgVh2QtLGe+l+jiSfIs5BXs2Y2OBhu9M
 UmGQ5zWMucKzfyzguREUkNmIwn30LK1Oz0bnjLtZMaPwhDAhJHpo+99t3R8ViJOvqxyp
 5UfO7DjQ04Yf6vhejhmHTMDf5yvQcXtERN9sB7H77BYmMkuG3b3wvElzNLP6zEI4wb4t
 J8Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hHkorEEx1ryMbtnru8OP+7VqvXYQH8B0BY1UFqCCXgs=;
 b=sNxx7I48J0YpZ3wrsXPoSeLvUfcvzCUtHISKU7Mxerp4bz1R71UsDKBiDG+NdQk6oB
 HdxYU49QqRvEpkXBBydlKuGpU5W07m+hp3Osy7NuRbHuEqEe5y/Thps3VCcm4T2Ny+qo
 WUO/huunpi54smMO3XJeYPxaVo4Jani1RjV0k1hvBQcejprSo6KmEpPWox5Wr2ganXcQ
 BxBAEzhJ3TVqEoBfGs5ezy1u48yCjrKYj3XwgYAHTgitvBcxkNWzgj8UBydshVnaJLC/
 1oeUWnG3uoZgZVxDUT5N5JEVVZV14J2erq4dQMLD983hbvFF3ETprl2qtsgkQuCpZTXa
 O6Cw==
X-Gm-Message-State: AO0yUKXfTSbRA5H1rqiDz7etL8URfEPV8vznEqTRtnOXluLt5so9RpxS
 Cl2H1t/vgRztQbG1u5OkWqjJVw==
X-Received: by 2002:a05:600c:1895:b0:3df:1673:90b6 with SMTP id
 x21-20020a05600c189500b003df167390b6mr18937339wmp.39.1677501571969; 
 Mon, 27 Feb 2023 04:39:31 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 t25-20020a7bc3d9000000b003e896d953a8sm12632266wmj.17.2023.02.27.04.39.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 04:39:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PULL 006/123] target/cpu: Restrict do_transaction_failed() handlers
 to sysemu
Date: Mon, 27 Feb 2023 13:36:50 +0100
Message-Id: <20230227123847.27110-7-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227123847.27110-1-philmd@linaro.org>
References: <20230227123847.27110-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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
X-TUID: 2MOACXWtWIV/

The 'hwaddr' type is only available / meaningful on system emulation.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221216215519.5522-6-philmd@linaro.org>
---
 target/arm/internals.h |  2 ++
 target/m68k/cpu.h      |  2 ++
 target/riscv/cpu.h     | 10 +++++-----
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 759b70c646..2ad4fc4633 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -614,6 +614,7 @@ G_NORETURN void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
                                             MMUAccessType access_type,
                                             int mmu_idx, uintptr_t retaddr);
 
+#ifndef CONFIG_USER_ONLY
 /* arm_cpu_do_transaction_failed: handle a memory system error response
  * (eg "no device/memory present at address") by raising an external abort
  * exception
@@ -623,6 +624,7 @@ void arm_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
                                    MMUAccessType access_type,
                                    int mmu_idx, MemTxAttrs attrs,
                                    MemTxResult response, uintptr_t retaddr);
+#endif
 
 /* Call any registered EL change hooks */
 static inline void arm_call_pre_el_change_hook(ARMCPU *cpu)
diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index 68ed531fc3..048d5aae2b 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -581,10 +581,12 @@ static inline int cpu_mmu_index (CPUM68KState *env, bool ifetch)
 bool m68k_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                        MMUAccessType access_type, int mmu_idx,
                        bool probe, uintptr_t retaddr);
+#ifndef CONFIG_USER_ONLY
 void m68k_cpu_transaction_failed(CPUState *cs, hwaddr physaddr, vaddr addr,
                                  unsigned size, MMUAccessType access_type,
                                  int mmu_idx, MemTxAttrs attrs,
                                  MemTxResult response, uintptr_t retaddr);
+#endif
 
 #include "exec/cpu-all.h"
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index df9cbc0d3f..d8e72c3e7c 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -579,11 +579,6 @@ G_NORETURN void  riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
 bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                         MMUAccessType access_type, int mmu_idx,
                         bool probe, uintptr_t retaddr);
-void riscv_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
-                                     vaddr addr, unsigned size,
-                                     MMUAccessType access_type,
-                                     int mmu_idx, MemTxAttrs attrs,
-                                     MemTxResult response, uintptr_t retaddr);
 char *riscv_isa_string(RISCVCPU *cpu);
 void riscv_cpu_list(void);
 
@@ -591,6 +586,11 @@ void riscv_cpu_list(void);
 #define cpu_mmu_index riscv_cpu_mmu_index
 
 #ifndef CONFIG_USER_ONLY
+void riscv_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
+                                     vaddr addr, unsigned size,
+                                     MMUAccessType access_type,
+                                     int mmu_idx, MemTxAttrs attrs,
+                                     MemTxResult response, uintptr_t retaddr);
 hwaddr riscv_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request);
 void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env);
-- 
2.38.1

