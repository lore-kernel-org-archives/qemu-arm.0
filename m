Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp485022njk;
        Thu, 23 Jan 2025 15:44:34 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXf2HVIN+CJGegmbI6g+laPJx4WDPrv8+T0vq1a5RNbPus3SILXxiPGWIKACGOJ0aMP/nm7DsU5ysEDQA==@linaro.org
X-Received: by 2002:a5d:588a:0:b0:38a:88f8:aadd with SMTP id ffacd0b85a97d-38bf57bea5emr24938068f8f.53.1737675873931;
        Thu, 23 Jan 2025 15:44:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737675873; cv=none;
        d=google.com; s=arc-20240605;
        b=NuXdO1Q7II2g7+xBldGtRips9a9JSA4i//DiuUWrD7B2RGF/3W+lhbgmjM74ojVgL8
         bIOz2HnLQKdlfx4FRER3/RjtFLUNvYPDfwvDTiuvFRmfoY5TDea2RMj57Itt0PsCLQ6H
         VBr5e4UvuA81Eitdhn/Zr7iNeaABUjH/G4TzuJQk2wolHdOEnv4SbFLUuA0VuZuJ4Hk4
         3+CoOzjFABn/u1qH32e9LV+mkG2unTqCd59g0Td5HrigFnkfH64CgYQUsmf2hzgDqBjj
         k4z50ClVMlHueMsda+iUzazn5hG9a2k8ER2OHotDfD1uHKT1IWnsaHjXqETgDpvHy3VB
         PdZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ce4xXqVbqUUJ3kwtGZLdz75HP+CS3yxZeowyzQLM8Ns=;
        fh=06fmhBE6BU/rYha+qJzaz96pzSHKdAY/Eb1Kp8RgOLU=;
        b=VB0Drt+WU2MAZ3WAV277nNU9ES4ZKdpwT/mV+YVgX66eVeGRrsgZ9+juXS5+f86YYS
         VH8wflrgWjo1wf4P4XyzEKeou43f5FDuKtzOLvMdLGH6RV9LJPta9EnguVIvGlmCQP4A
         tZZVHuOWAE4egqfzoZKEf+WwaTQuCmFjKXiGWfu+Yfl/FAwc4HktU7lhafIA53Z3oqXN
         39J8UzTw7hfkIGjAwzYxYcaN8iXqdoXRIhnJ9dfiNCfx4f07mbvKilg5G1gAygrxb4Te
         RwvTrnYfN0a3DsI+zZdDpsnGciiuO7BggXp9XWCH+eSsTgDwZglrMJIyQ1BYRqu+sanU
         6smw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sfSDKgl7;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-38c2a1c061asor430717f8f.8.2025.01.23.15.44.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 23 Jan 2025 15:44:33 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sfSDKgl7;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737675873; x=1738280673; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ce4xXqVbqUUJ3kwtGZLdz75HP+CS3yxZeowyzQLM8Ns=;
        b=sfSDKgl70YKw8hVrSeceXIqjoRR3duWJ2yPSf82ITqaEySELLy4icBnDyZPqUSKyO/
         xI3O4ZlHWeaVDCW5q5bhW3vL5j5Dc/RJQVS2ZsmMdD0TYAM47UrfFxVA7CmGictdSYQ/
         ChrhVrR4pxAp10lc1CicYCvMyMw746h8uzVN1CHybKWV0w4xm3VZopNQhSVE4GWkAIlE
         QIkbPFZGoGC86alv7VlGWb7y9wud7seK8mGMcQbTMdRVe32wUxtcUAuT1qYDLQiXsaDt
         nNrPAcB81q81hHNtCB2gqb7pDEOCrcVl1xGPldzkT4aY2FN+FI6OPA7PODn0cCTwTzKf
         FVFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737675873; x=1738280673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ce4xXqVbqUUJ3kwtGZLdz75HP+CS3yxZeowyzQLM8Ns=;
        b=ld/BHfWVDqI/mLuM0CQZ/AIVnouY7SLN05m31Vu5Hz6LOuxtEsmozp6jeoV8DvZ07f
         7oSreEXhLOKBzux/SIGha6NzTtoaTR8Pxv2tInxHszcImBIHfsZ0tzgxHtRq5UNokA4g
         eCJEZiwn8NlZF4oKYRYBp70MxIX5Pypz6ue/LvoR39HIqhjjqnw11s+91BYpXSpv27B3
         eBVgV0/T7zc+o5agiCLrSAkuFDJAQhMgo292tsiDX0vooXdO4COw5d3nDK2qU2NgKFGh
         VZnuB7DSFNF61EvzuSMKWKr3Cv0Xmg8xCwhMjrQykvbr56zf5g/jU/zcb8pO/zXoMFQR
         HHCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfN/39jmhiDdqJC7CK+0vsXd2v91zZjW6u+wI7XkNRItUStxeKeMpmQqI3uqi5M7RurQE4e9YB4384Ww==@linaro.org
X-Gm-Message-State: AOJu0YyCZAwtyjzk0L+N2souY7ehoaTmuVcQg4n2GS+CyPkvWHN/geXl
	6UTVFnlygTR7S6BFvdkpr6OyPgTBIww5tidyjHkN4GxkazmH5UeKE5SnXekUB4jl1g==
X-Gm-Gg: ASbGnctaYXGQv8FBd9qTSNX/Htssh3cGw1fFV6Q97SmabT7TLMeBv5ViecGF2U2fvM1
	BHa7/H9Xmgk3d7wsW/Bp89VFhaCKwwZw8Jagn/g90RKwxftcwaNR096+s3rpREHnw6q6ngsqV7l
	mgf2cyA0/msMKkv2kXR2rFDrappqqal+q8Neb+eMDP5lhJN88K0lpX8/EVsuARv2GV7a0yu/wVz
	0lTHTrzpT2trF9omMEtfD/yQ+EK688UoXVKUTvJ65EySH2VVLQIV01Y8wtouyHN315c+7ZA37WV
	ZDxepBnimRGyRTm/kN5UY0deknnf206I7xJS2Av3XGa66A5CP7U/Z06ze42Bm9rF6g==
X-Google-Smtp-Source: AGHT+IF2OW+qflIazHPgiEcST7oe1qZGT6aj/Hik/HFfGWbVcOJj4aFV8515DLdGfzbOF2nObYCMQg==
X-Received: by 2002:a05:6000:144a:b0:38a:9c1b:df5b with SMTP id ffacd0b85a97d-38bf566a279mr25563799f8f.30.1737675873434;
        Thu, 23 Jan 2025 15:44:33 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1c4006sm982952f8f.94.2025.01.23.15.44.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 23 Jan 2025 15:44:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	qemu-s390x@nongnu.org,
	xen-devel@lists.xenproject.org,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 03/20] gdbstub: Check for TCG before calling tb_flush()
Date: Fri, 24 Jan 2025 00:43:57 +0100
Message-ID: <20250123234415.59850-4-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250123234415.59850-1-philmd@linaro.org>
References: <20250123234415.59850-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: UWiBphHA8qMN

Use the tcg_enabled() check so the compiler can elide
the call when TCG isn't available, allowing to remove
the tb_flush() stub.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/stubs/tcg-stub.c | 4 ----
 gdbstub/system.c       | 5 ++++-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/accel/stubs/tcg-stub.c b/accel/stubs/tcg-stub.c
index 7f4208fddf2..b2b9881bdfb 100644
--- a/accel/stubs/tcg-stub.c
+++ b/accel/stubs/tcg-stub.c
@@ -14,10 +14,6 @@
 #include "exec/tb-flush.h"
 #include "exec/exec-all.h"
 
-void tb_flush(CPUState *cpu)
-{
-}
-
 G_NORETURN void cpu_loop_exit(CPUState *cpu)
 {
     g_assert_not_reached();
diff --git a/gdbstub/system.c b/gdbstub/system.c
index 8ce79fa88cf..7f047a285c8 100644
--- a/gdbstub/system.c
+++ b/gdbstub/system.c
@@ -22,6 +22,7 @@
 #include "system/cpus.h"
 #include "system/runstate.h"
 #include "system/replay.h"
+#include "system/tcg.h"
 #include "hw/core/cpu.h"
 #include "hw/cpu/cluster.h"
 #include "hw/boards.h"
@@ -171,7 +172,9 @@ static void gdb_vm_state_change(void *opaque, bool running, RunState state)
         } else {
             trace_gdbstub_hit_break();
         }
-        tb_flush(cpu);
+        if (tcg_enabled()) {
+            tb_flush(cpu);
+        }
         ret = GDB_SIGNAL_TRAP;
         break;
     case RUN_STATE_PAUSED:
-- 
2.47.1
