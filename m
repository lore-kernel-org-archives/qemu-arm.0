Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp2676077eja;
        Mon, 6 Nov 2023 03:04:14 -0800 (PST)
X-Received: by 2002:a19:670f:0:b0:500:d960:8b6d with SMTP id b15-20020a19670f000000b00500d9608b6dmr21268152lfc.33.1699268654290;
        Mon, 06 Nov 2023 03:04:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699268654; cv=none;
        d=google.com; s=arc-20160816;
        b=LRaMKXORsOMfVFjWoi+tm/aq549NlPPYZxP4ZxTUvjdZjdhVycS8EWf1eA8FySiY1U
         5qsWrxUxHxRNLw8+z5TTCK7agmmK9ifeMwtYk+c6TRQ2kQseyXRvIipj1+aqRvZNx85m
         l0B+T4Mh/MbvCmlOZu1yId9JQ/CZ1B5ZnNg5xA6xhO2nOzlcgmHMPotX4+m4/Bf0lqNF
         +8cwAWId2XoibYnTjo02l2Ung7MMKDpts+XkQYw91uvRgh1GBkW2l8s5hbw+xl4cepw+
         LEV/eh4XAZDzXUQRYI4uf2U0PSgV0YXO7UoxUv5LJmMLIgr+dZ0TU/BXx9TaYR4g6L5u
         7Yog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=e2dhS3KlkYuIzlj4JyHbDi+Agmw3+gkCUCmK+83aHSA=;
        fh=HORlicMaqSt/rX9EVe6G+kP8BEdWajpTx2RDDSJwWhc=;
        b=rTBbTaJXIEoqJwCG0kAWQNwngJ0da/dACHov5OfTDGLIagBQ3eF/3AQF99q0gqXCR9
         juYigDT92MnhHeB4n3RaYibWomSV9y3PJwGVZRirC0fhsh7o4gkPhdVQ/a5PM/X1klmh
         HOxF1dWhNOvGrbBou7jRRRKTWzX9SgcRyAEPbMlR19oW/lRsxid3r2f+sBZZus0mh84B
         2vXrxWdbx6HGDGnWjL5MXnxTJ0A7FQpp2j7G1VKLHzrWu/zXQuTj6b0XYc6jkqVc6MZw
         k0muOccYtCdgUeComzhT8hc93C8VSDghKZsjp17uBD4S+vnunLUQ14CKOykBtSafB4g8
         908w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Te9CyUh+;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 17-20020a05600c021100b0040680cf8f12sor1693965wmi.1.2023.11.06.03.04.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 06 Nov 2023 03:04:14 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Te9CyUh+;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699268654; x=1699873454; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e2dhS3KlkYuIzlj4JyHbDi+Agmw3+gkCUCmK+83aHSA=;
        b=Te9CyUh+sfGyY06+WZyJE64ik7xjToSEiOCa/lLVBfLh39FxGdYBOl8d7ky9rGxJ6d
         ITvq+qLgWRNW7zVaMdGFU5N7jULPnemXPeX60tFEi8TMaCEok53m9UL7sbaZwXXb3sdp
         2Jdx6rKQszuFTQdIWDE5IbECm2WMScxs8Yn+FNqECPPgSFeVw7IQYQyYHn11mqoUjhs7
         1BnKokqeTcPDWhW/MPdIdSo3yTvdmwGAuLu9Jvw/wLCJvIeK2p5xXg/rXDXsa4jesq2c
         fvIu0u3ULCoq28T7SpZL+SzYPn3xwI6znG2w6Ks8+0mTIQDD12pFRKudsJ1A9pekEEly
         /7aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699268654; x=1699873454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e2dhS3KlkYuIzlj4JyHbDi+Agmw3+gkCUCmK+83aHSA=;
        b=spISqJhpL9OsBJQKnBZvH728V8MNCmRBDrc9SlaAtGv3zsatdefXZHap0x/GYThd9g
         rrnCVFFmQsxlvy+p86b9iHdmPZxqSk0GuSWBCx5Rxngi30M0enzvDZ9q8NChMLofqcdr
         xPaGvoAtTF9rfCQj2ODtmdSi66Yc2KcSLpNufjaQhZuHoPZEyuLIJ7nh6cmVl1oMBUju
         JNANBOZC1hUGnS1jwl6aj8CI5N8BSj1ow3BifwJFczjHrdq+cjKnOLmSDqz57OyhVjiz
         kDmWObYLI9DORmzqCbYsmz78UcEDS47cWUOhYuk676F5dRraAx1JmicvMs5GAQY0AChZ
         WGUQ==
X-Gm-Message-State: AOJu0YwqUpXxMJ1prYA1nM4VGD/S2YDRyMeIe4VOPSh7Kpvmg20WJr4+
	HH3XMU/sVcvIGqpec347YD8vL8ZB
X-Google-Smtp-Source: AGHT+IEBVIn/0r+UoLYA97Mnp+piCsSmfP4bBhuQ8Q479GVHXuAJkDevEs+mH3EZ9a+ZFr4LoWGeXw==
X-Received: by 2002:a05:600c:5116:b0:409:2825:6dd5 with SMTP id o22-20020a05600c511600b0040928256dd5mr23574505wms.13.1699268653839;
        Mon, 06 Nov 2023 03:04:13 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (176-131-220-199.abo.bbox.fr. [176.131.220.199])
        by smtp.gmail.com with ESMTPSA id n26-20020a1c721a000000b0040849ce7116sm11652236wmc.43.2023.11.06.03.04.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 06 Nov 2023 03:04:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org,
	qemu-s390x@nongnu.org,
	qemu-block@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Anton Johansson <anjo@rev.ng>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: [PULL 05/60] accel/tcg: Declare tcg_flush_jmp_cache() in 'exec/tb-flush.h'
Date: Mon,  6 Nov 2023 12:02:37 +0100
Message-ID: <20231106110336.358-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106110336.358-1-philmd@linaro.org>
References: <20231106110336.358-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: vm+s4SCw2+lF

"exec/cpu-common.h" is meant to contain the declarations
related to CPU usable with any accelerator / target
combination.

tcg_flush_jmp_cache() is specific to TCG, so restrict its
declaration by moving it to "exec/tb-flush.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Anton Johansson <anjo@rev.ng>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230918104153.24433-2-philmd@linaro.org>
---
 include/exec/cpu-common.h | 1 -
 include/exec/tb-flush.h   | 2 ++
 accel/tcg/cputlb.c        | 1 +
 accel/tcg/tcg-accel-ops.c | 1 +
 hw/core/cpu-common.c      | 1 +
 plugins/core.c            | 1 -
 6 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index 30c376a4de..f700071d12 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -46,7 +46,6 @@ void cpu_list_unlock(void);
 unsigned int cpu_list_generation_id_get(void);
 
 void tcg_flush_softmmu_tlb(CPUState *cs);
-void tcg_flush_jmp_cache(CPUState *cs);
 
 void tcg_iommu_init_notifier_list(CPUState *cpu);
 void tcg_iommu_free_notifier_list(CPUState *cpu);
diff --git a/include/exec/tb-flush.h b/include/exec/tb-flush.h
index d92d06565b..142c240d94 100644
--- a/include/exec/tb-flush.h
+++ b/include/exec/tb-flush.h
@@ -23,4 +23,6 @@
  */
 void tb_flush(CPUState *cs);
 
+void tcg_flush_jmp_cache(CPUState *cs);
+
 #endif /* _TB_FLUSH_H_ */
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index b8c5e345b8..6ea95ca03c 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -24,6 +24,7 @@
 #include "exec/memory.h"
 #include "exec/cpu_ldst.h"
 #include "exec/cputlb.h"
+#include "exec/tb-flush.h"
 #include "exec/memory-internal.h"
 #include "exec/ram_addr.h"
 #include "tcg/tcg.h"
diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index d885cc1d3c..7ddb05c332 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -34,6 +34,7 @@
 #include "qemu/timer.h"
 #include "exec/exec-all.h"
 #include "exec/hwaddr.h"
+#include "exec/tb-flush.h"
 #include "exec/gdbstub.h"
 
 #include "tcg-accel-ops.h"
diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index bab8942c30..29c917c5dc 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -27,6 +27,7 @@
 #include "qemu/main-loop.h"
 #include "exec/log.h"
 #include "exec/cpu-common.h"
+#include "exec/tb-flush.h"
 #include "qemu/error-report.h"
 #include "qemu/qemu-print.h"
 #include "sysemu/tcg.h"
diff --git a/plugins/core.c b/plugins/core.c
index fcd33a2bff..49588285dd 100644
--- a/plugins/core.c
+++ b/plugins/core.c
@@ -21,7 +21,6 @@
 #include "qemu/xxhash.h"
 #include "qemu/rcu.h"
 #include "hw/core/cpu.h"
-#include "exec/cpu-common.h"
 
 #include "exec/exec-all.h"
 #include "exec/tb-flush.h"
-- 
2.41.0
