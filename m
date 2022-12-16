Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp1733532ejb;
        Fri, 16 Dec 2022 13:55:59 -0800 (PST)
X-Received: by 2002:a17:907:c80f:b0:7c1:75e9:1180 with SMTP id ub15-20020a170907c80f00b007c175e91180mr23715406ejc.22.1671227759768;
        Fri, 16 Dec 2022 13:55:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671227759; cv=none;
        d=google.com; s=arc-20160816;
        b=Svhr6+POX/enwyB1KhcGD0j/3Q8Z+Il2JeGak/mONaUMswqybPA6nKFJi15dILubJR
         9o9CkR4I9dl0Pp8ErtvwI6YS2Sr99jdGr87slBAK/FmeQF2XsSSoeVDCUG2kgQX/WHjt
         g9Iiy9/Xn19tmr1wAwA9D3JUbIUqL1CbaNyZylZZwA+yjeZON1xkyQZBWSU2X15y8jTK
         jLV01OUvhY1vgxFSOeSgj3LH35xjEEZF4ZnLQcb+XlZ40LOe1F5Ze5ylL/EAss2O8hgt
         5UKhEdxEtTuVxF2+vVLQS9Z0RKfl16z2L0oKtjvsccsNjSUMlhTRNN9+fD2bxZCtDa07
         5Vjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Pk8E2AjZn31oa9IhgwNXOyvN0Kf6YBgcqfW7HGQm56M=;
        b=rWOshWbky1jfdZkQ88pRTkBSOBlWWGQNhMI6UTFZgVZrsUGk89UUv1SK+/5BRKmDqO
         Yb4hG9zhOKL1eljHgVw3kMizpFqU3tbn0FOthe0pSYDRmEcAEUqZeZQguhK+9XUKzK68
         /3mrtbBa9ei2QTYOMLkeVF5jmzViGhLiRK68uF2ifdYPNeP31wWb3P6BWXNFBOJMm3Np
         UpUPjTU41lIPGUtVNWUW7RlI3CnyYELNdEL/23ZTX62eoqxqZos3BkvBpZA7gw/vdkio
         7NqLMyG4gbOzPGaSoFFn8+y4cmYwanZ73HaA/VHfaGi9wXMTPyd7dCZKM5T/uW+CuEt+
         v4HA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Dw0tCLft;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m10-20020a170906848a00b007ad7e81a306sor1834308ejx.53.2022.12.16.13.55.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 16 Dec 2022 13:55:59 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Dw0tCLft;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pk8E2AjZn31oa9IhgwNXOyvN0Kf6YBgcqfW7HGQm56M=;
        b=Dw0tCLftkXtEaitQ5Jly8qTyc8IMfcBrJglEK9yS36kfuJZ8Sz6FWVga9H3oEkx6ks
         vedh5zXZUfjlH3Bd2n2N93QHuyIaDjY+bi49BSexONf3xQGHp4IXd72BoyPCzNq4Df+L
         JrAuSLehYrSvXkHLDuZtTIFah0Z+T46mmZcs3IxHSteIZ8S0+0hdk3+fAT5c+oGOC1lf
         /6cb6ph8w5XEZWG1XjgY6QQgLAMMjks4ZJcz5UIsDHhdDr4a0Zq++0M3k8FvAaTDxedh
         MLV78rP7yB4yy0n2KV1G7CMIRTwS0WUXPlBmvN6HsuupiC4gK/XQ18lybnGi2fR2vJdk
         paYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pk8E2AjZn31oa9IhgwNXOyvN0Kf6YBgcqfW7HGQm56M=;
        b=bWlX9EsxvAELXX0Zs4G5L3SHilFx2utt1zzqAmCKqWTKb2LSoF1eWMLxjUMf+PPzBZ
         tVSApW+jDm7PIxKBSPID92Z+HcQVihS7+UkYMOT1DAnm7zQKQGIFZKWPgVUHiZdFaPLC
         bsBrY7WgnW1qeaipcxMM0isbbbBHieMBaoFjkdSB6m6Dc1rKwWzq7f6VFVlTFL6nhbPG
         YxLtlHbPn0qcXHwnZ6X3EVVwmZiOpuujZfBn7StnSNs6nmWza+gwMBSzCIvXbNyUqIHp
         wWwO3vnbfhMxxaQGo8Nnp0Y77sJZnBYeC/YSlBoAWHamWOPlZWl9qMFI4a8Y84qkJK0P
         yggA==
X-Gm-Message-State: ANoB5pmyQMm51vASoCxKQV163RHatOovNQUGtn/Zuy7Kwk/Z/OIsJg++
	0rSXgCr3VZy9NlQGc7W7JjxVLIBT1O5oMzXn3WA10Q==
X-Google-Smtp-Source: AA0mqf5C/EOPursnJ8tMWp/JMeEiPXZqq3kciTnDo0W7NNU0c8QnFiXjCEmk1jRk5QQq0uZsNX9Upw==
X-Received: by 2002:a17:906:d10d:b0:7c1:4623:400e with SMTP id b13-20020a170906d10d00b007c14623400emr18254030ejz.16.1671227759469;
        Fri, 16 Dec 2022 13:55:59 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id 27-20020a170906301b00b00782539a02absm1278990ejz.194.2022.12.16.13.55.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 16 Dec 2022 13:55:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Marek Vasut <marex@denx.de>,
	Bin Meng <bin.meng@windriver.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	qemu-riscv@nongnu.org,
	kvm@vger.kernel.org,
	Stafford Horne <shorne@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Chris Wulff <crwulff@gmail.com>
Subject: [PATCH v3 5/5] target/cpu: Restrict do_transaction_failed() handlers to sysemu
Date: Fri, 16 Dec 2022 22:55:19 +0100
Message-Id: <20221216215519.5522-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221216215519.5522-1-philmd@linaro.org>
References: <20221216215519.5522-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: WE/m/jEgDiZp

The 'hwaddr' type is only available / meaningful on system emulation.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/internals.h |  2 ++
 target/m68k/cpu.h      |  2 ++
 target/riscv/cpu.h     | 10 +++++-----
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 161e42d50f..14eb791226 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -624,6 +624,7 @@ G_NORETURN void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
                                             MMUAccessType access_type,
                                             int mmu_idx, uintptr_t retaddr);
 
+#ifndef CONFIG_USER_ONLY
 /* arm_cpu_do_transaction_failed: handle a memory system error response
  * (eg "no device/memory present at address") by raising an external abort
  * exception
@@ -633,6 +634,7 @@ void arm_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
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
index 758336295b..fc1f72e5c3 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -559,11 +559,6 @@ G_NORETURN void  riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
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
 
@@ -571,6 +566,11 @@ void riscv_cpu_list(void);
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
