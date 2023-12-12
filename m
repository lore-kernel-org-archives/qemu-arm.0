Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp864384ejo;
        Tue, 12 Dec 2023 04:34:12 -0800 (PST)
X-Received: by 2002:a17:906:1841:b0:a19:a19b:4218 with SMTP id w1-20020a170906184100b00a19a19b4218mr1905243eje.131.1702384452191;
        Tue, 12 Dec 2023 04:34:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702384452; cv=none;
        d=google.com; s=arc-20160816;
        b=LvbLS2uyrDJ71YO5NxTve1kzXSNc2l7S5c5v2j8m86a0y4x1bx4vhGi/igbBUH2NG4
         ykYsIVtmufYLzyS7bPGJchWBCQfMDYKNtLhTfWpku2qnDQJb+fZCfDdB7rMhcmEJ+RlS
         FGu3frmnJJ030VkxWBRw+OuViNy4CbEBOgINvwezMBTddYIw+gxlxaFIff8EWNHYWpsv
         BUwxONih4Vh2Z4IheBYFLGiHbSer4X53/HPgDr8Uua5YVTB9BwFqOrt7dniyrWAbs+uo
         2Pt1ZelSL/vRYPjV+n9Hyzyiz4EpySnkbxFsgsqoSDM7JlJFDgP2qUhsO8KCApbxPMtr
         t2rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ek5eH89m6U4onfJDQbwgikjGRZL4xGCW1/xN2ORw4ro=;
        fh=vlFEGdij83GYetLrOUaCnR04sbYRvtckD5L7fw5192c=;
        b=iuNq+mlS8gJnI06j2HFQpiSsEZHRaouoTwhUs17B2rQGo5vBKIF9z7mBLo5KsTpo6g
         NhGFszdigG2acNzb/YWuXVBZgv4FYpr0V+LW1Fq9WNve1gtL47dxB8jHgLWgbEiW2WNI
         YkZC2mtq1kF5XiO6J3AJ2Wun46++nG4Zrfy8Qg7j9YfLPeDovyFPv3/Qr6LmedHUrUao
         K4J1zN1hCkHNqljcjES2nL2SEwSHXYwDg10aWyTlUjrjUcoJggTvg30bg/YQ4F2Muq/4
         KsM0NwGzbxXKAnpEaDTSydSmnDqrxMzz0Txl2Bvj6oelzwxiRKOVeZXDd1lA/GVywTA+
         tqTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pTyWnxfW;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id hz11-20020a1709072ceb00b00a192c5bfe6esor1871948ejc.1.2023.12.12.04.34.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Dec 2023 04:34:12 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pTyWnxfW;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702384452; x=1702989252; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ek5eH89m6U4onfJDQbwgikjGRZL4xGCW1/xN2ORw4ro=;
        b=pTyWnxfWRlc1Y7Y6URBl/D9frAbkKZ9L8RLLcyVjWn6Ve6sAJjuigHVXx3XpQ0r/CG
         bw6Cma0XkGO0WRjof0+9T+ItuG3VAEGZPSuSHJuCWarligklfXW4R01Glk5Aqy0KTQMO
         2KsHTdRdhvzznmvgmQ+lMIsso0ny7qj1qfWdRjqMo3EfFOVUf2AaLWRJVMJ97H3jsmfN
         cbYVUImet6NuG4g+ylDFFJ6X5SB2jsweDwGPK+TqfFNaKKOtDZ1RPN6h0agT4eEHpFX3
         zXgHaQKdq5I/yhLRCFv262si3pssnaPYA3qFykfax0eyFDgGmgLFqo05kmbFtoMM+Hjx
         tsBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702384452; x=1702989252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ek5eH89m6U4onfJDQbwgikjGRZL4xGCW1/xN2ORw4ro=;
        b=uKcvG5Em2kwnZliUrNaAqUtUKbMtIoywtlF7NmGhX6tf+d7JivPotsuRyEfsOdlGBr
         tkVJz3KqutgEm+vdoZT3Ih0gW0b+uH6/zw9W/QNovjv8s6eebK5rU9dc43apeIqKdeje
         AFQi0sTrAORqYQs6pDK3HWR5rsjtg6O2AwAOk5g5uSgC+LkmcKynnY9eiN5yWyJl35l0
         oV7lHKFUnLCIpqiOuRu6cyerfVqdf2gisg91lEy0IrKpZTxNWvtyAvAFk6SfpNbHKxX0
         VQFy5V7QHpbHBJdH2854pOhSuY7/D8Uinbma9J3wodUH+vrOXSCeu4ybc1pEFGNPt1vl
         vxQg==
X-Gm-Message-State: AOJu0YwV0CkQETwXS5Q683GxEr8leik7+8tZYpkSb1VbkU9nJZh0uuob
	tiBYClTByO8asQ04vpVGJvRwgSahB86okIeMSJV4AgmW
X-Google-Smtp-Source: AGHT+IFBHZ2/jWW2AkikjY0zIuTT+PxnUkcMnGaFhesUbqMGzvxdFjcSr85mnVL4Fe8nIxjFgxsMcw==
X-Received: by 2002:a17:906:e294:b0:a19:a19b:421e with SMTP id gg20-20020a170906e29400b00a19a19b421emr2004022ejb.137.1702384451860;
        Tue, 12 Dec 2023 04:34:11 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id uv6-20020a170907cf4600b00a1e443bc037sm6274678ejc.147.2023.12.12.04.34.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 12 Dec 2023 04:34:11 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-riscv@nongnu.org,
	Brian Cain <bcain@quicinc.com>,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anton Johansson <anjo@rev.ng>,
	Warner Losh <imp@bsdimp.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 01/23] exec: Include 'cpu.h' before validating CPUArchState placement
Date: Tue, 12 Dec 2023 13:33:37 +0100
Message-ID: <20231212123401.37493-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231212123401.37493-1-philmd@linaro.org>
References: <20231212123401.37493-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: PXeflqrIMEV1

CPUArchState 'env' field is defined within the ArchCPU structure,
so we need to include each target "cpu.h" header which defines it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Warner Losh <imp@bsdimp.com>
---
 include/exec/cpu-all.h | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 5340907cfd..9a7b5737d3 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -411,10 +411,6 @@ static inline bool tlb_hit(uint64_t tlb_addr, vaddr addr)
 /* accel/tcg/cpu-exec.c */
 int cpu_exec(CPUState *cpu);
 
-/* Validate correct placement of CPUArchState. */
-QEMU_BUILD_BUG_ON(offsetof(ArchCPU, parent_obj) != 0);
-QEMU_BUILD_BUG_ON(offsetof(ArchCPU, env) != sizeof(CPUState));
-
 /**
  * env_archcpu(env)
  * @env: The architecture environment
@@ -437,4 +433,9 @@ static inline CPUState *env_cpu(CPUArchState *env)
     return (void *)env - sizeof(CPUState);
 }
 
+/* Validate correct placement of CPUArchState. */
+#include "cpu.h"
+QEMU_BUILD_BUG_ON(offsetof(ArchCPU, parent_obj) != 0);
+QEMU_BUILD_BUG_ON(offsetof(ArchCPU, env) != sizeof(CPUState));
+
 #endif /* CPU_ALL_H */
-- 
2.41.0
