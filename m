Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp1952901ejd;
        Thu, 18 Apr 2024 12:27:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUIdTBRpyH8n1Etk8XldoIiANRCWpUo5R4be8x3VrR2+/2h+ghCyyNQZQEZOVB/z01RbJ/v9TBP0Nrs0YTE8m2BjdFa2ss0
X-Received: by 2002:a05:6512:512:b0:515:bc26:24d8 with SMTP id o18-20020a056512051200b00515bc2624d8mr2085963lfb.66.1713468439522;
        Thu, 18 Apr 2024 12:27:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713468439; cv=none;
        d=google.com; s=arc-20160816;
        b=fzsDR3+ajyYxtVpRwhGVLgcThYOkeo62tnVj/ooP29hi1jOJtVDRtDP3zhJO769/Du
         oqJCCvmkeW6pk5Ml5LukpCEI4HE0Wmqfje1bIShWZxqxr7bIFrD046/ph95RXu3ev9fT
         zhei8Y1AuBPPAjEOr3Z5yGWJijaLDa5d7qPUI5m9EJay03bTIBguWKNXfdqslXWhQsIt
         uPJVjQ/uHod2l69721Q1iM+3hTvieh6w5xUkX7rLHsv698LvZqMN/XIv9C85CXoSo6vj
         3EgNwuanUS+TULTdGfKch6g5gBIngjSx5iSjh1pQdypA8eQPWVb1j1SYs2xyqxp+MpIL
         lqew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=koVgyajCEgUVl/LMvNKONPGr1ZhJ2eug5WfoAqRNjUs=;
        fh=rkcCbXOP/Jfttq+7Iyjeu0cDFcjpddcwa56mRym1AS8=;
        b=Mq7a9BryZy/T3YAaf4FA5WtnTa5iZOFFEMW8BcwSQJ0iVimK2sy1Tqg0Z1L6bhYZE/
         rdnDIi/m8Wa/Mt/FNNneRsLrsBmxn37d3FC4SxGk2Tb6GJo8eNwT07poUR94u2l48F52
         KTBjYj3z0zgnCuyWQSsfxzH7CbpZ8hnpi4K36Cm0lR8hZOWOh4sD0HhsGWgfOvIANvyF
         2JqestFCEMgy3hfqbTdQ27LSVS0EzsvHx0cJrrqfhPqcEQK8Wc7J0tfPfpaqR0E6miz4
         MKC72OqH+zVt8CwrqhGBYthnm3vCk7tVzR92b4OzZqFFk2IgW3j9QLi4NdLfJuguN7hs
         Fivw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mcFcbqa8;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id kv4-20020a17090778c400b00a55659e10d4sor729525ejc.1.2024.04.18.12.27.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 18 Apr 2024 12:27:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mcFcbqa8;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713468439; x=1714073239; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=koVgyajCEgUVl/LMvNKONPGr1ZhJ2eug5WfoAqRNjUs=;
        b=mcFcbqa8yWYt9Bgv3aYqJcG2sCKbceWnsTu0WBLBdFyth47oZSTqJbjTeT3m7GghxP
         11+9f8GkOPg5fOcLWAWBb+hDbsWen5h3rlu3LImtEKf1Wt9gARjZ2npE3faPtJXDOBLM
         bs6xOK6kWsRfee+TWcC6SQLkw8wz1J9npUo/la7PvspTk9/AkwNFzVZTaD6IYVxCu4Ky
         rEtfJaW0rilSMEHQmVl8AHzvyykf+Jfg2jklywYpbJJZ0V4RWRUYi27oBrpjOymN/t/M
         hnnuImJeWL8J0lZ6oF4C7cJZsiwK1TmPpj8L06WrSHtHxcGV215DowedFYef3JIunJQI
         +6yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713468439; x=1714073239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=koVgyajCEgUVl/LMvNKONPGr1ZhJ2eug5WfoAqRNjUs=;
        b=xAN2bSRqNbBFE4USVQ9XDNYUCmJYr6ICj1d8Lvj5W/rLLNAjqRhoEGdLi2B29r91zR
         9B7Mpj48aSyMHqGFxYju+o2/nvOa0VY/YLq3V2pdBdUs/ffJTcR7jVYDQ3zKCQ8merxE
         3u1hH6Chkic5gi37zssbsT8qpIotWcbo9V9CbzxTW97viy7hb3Gtt8ZY6xPUoz/x1qXV
         rOdS7/6dl89vkjZ9BG02Z2PJ6IkLs2JbbbMgXyHUQw5Jnd03AwhQ9xzxrV32RK44NwC1
         yS724Zp2ZMf70TmqRUitVC1PoWSfG9K2AIgyS2GNX1N8ZhaWsjihrvUsHOM4evzup+oT
         0kMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbSYNkIxGdg5eEyuRAAPfhbiEbS7kNesYc/w6McscPwxlgmD842U7LyPtxLbt3KBXMh1NoRl1/kuyWChiND212dUS8eWve
X-Gm-Message-State: AOJu0YwqkQ/jtKR4lqA54glgUYGcIRveBUQhKVfIL2XRl5rBiLvuoODY
	Y2qr2nEO3AE0EAIqPVMY1GTbdSXzQSvJ3WzLZI9Yn+fAK95zdTBjXkQS+lmsl+omiA==
X-Google-Smtp-Source: AGHT+IGUKx1BaAucoqEBkcKvR0ggaq6VcW3+/vbLpdXj+U90uCMnnNyN02Af7LhJb66dZ9m1Y8QZCA==
X-Received: by 2002:a17:906:6013:b0:a52:ec:a87d with SMTP id o19-20020a170906601300b00a5200eca87dmr48021ejj.74.1713468439142;
        Thu, 18 Apr 2024 12:27:19 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.151.213])
        by smtp.gmail.com with ESMTPSA id n22-20020a170906119600b00a51a9d87570sm1269573eja.17.2024.04.18.12.27.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 18 Apr 2024 12:27:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anton Johansson <anjo@rev.ng>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 16/24] exec: Move GUEST_ADDR_MAX definition to 'cpu_ldst.h'
Date: Thu, 18 Apr 2024 21:25:15 +0200
Message-ID: <20240418192525.97451-17-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240418192525.97451-1-philmd@linaro.org>
References: <20240418192525.97451-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: NPtxjx4/D5c6

GUEST_ADDR_MAX is only used in accel/tcg/user-exec.c
and "exec/cpu_ldst.h". Move it from "exec/cpu-all.h"
to "exec/cpu_ldst.h" so we can avoid including
"exec/cpu-all.h" in accel/tcg/user-exec.c.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/cpu-all.h  | 34 +---------------------------------
 include/exec/cpu_ldst.h | 30 ++++++++++++++++++++++++++++++
 accel/tcg/cpu-exec.c    |  1 -
 3 files changed, 31 insertions(+), 34 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index e75ec13cd0..554b937ddb 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -63,39 +63,7 @@
 
 /* MMU memory access macros */
 
-#if defined(CONFIG_USER_ONLY)
-#include "exec/user/abitypes.h"
-
-/*
- * If non-zero, the guest virtual address space is a contiguous subset
- * of the host virtual address space, i.e. '-R reserved_va' is in effect
- * either from the command-line or by default.  The value is the last
- * byte of the guest address space e.g. UINT32_MAX.
- *
- * If zero, the host and guest virtual address spaces are intermingled.
- */
-extern unsigned long reserved_va;
-
-/*
- * Limit the guest addresses as best we can.
- *
- * When not using -R reserved_va, we cannot really limit the guest
- * to less address space than the host.  For 32-bit guests, this
- * acts as a sanity check that we're not giving the guest an address
- * that it cannot even represent.  For 64-bit guests... the address
- * might not be what the real kernel would give, but it is at least
- * representable in the guest.
- *
- * TODO: Improve address allocation to avoid this problem, and to
- * avoid setting bits at the top of guest addresses that might need
- * to be used for tags.
- */
-#define GUEST_ADDR_MAX_                                                 \
-    ((MIN_CONST(TARGET_VIRT_ADDR_SPACE_BITS, TARGET_ABI_BITS) <= 32) ?  \
-     UINT32_MAX : ~0ul)
-#define GUEST_ADDR_MAX    (reserved_va ? : GUEST_ADDR_MAX_)
-
-#else
+#if !defined(CONFIG_USER_ONLY)
 
 #include "exec/hwaddr.h"
 
diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index 6d47d3114a..07649a01c1 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -73,8 +73,38 @@
 
 #if defined(CONFIG_USER_ONLY)
 
+#include "user/abitypes.h"
 #include "user/guest-base.h"
 
+/*
+ * If non-zero, the guest virtual address space is a contiguous subset
+ * of the host virtual address space, i.e. '-R reserved_va' is in effect
+ * either from the command-line or by default.  The value is the last
+ * byte of the guest address space e.g. UINT32_MAX.
+ *
+ * If zero, the host and guest virtual address spaces are intermingled.
+ */
+extern unsigned long reserved_va;
+
+/*
+ * Limit the guest addresses as best we can.
+ *
+ * When not using -R reserved_va, we cannot really limit the guest
+ * to less address space than the host.  For 32-bit guests, this
+ * acts as a sanity check that we're not giving the guest an address
+ * that it cannot even represent.  For 64-bit guests... the address
+ * might not be what the real kernel would give, but it is at least
+ * representable in the guest.
+ *
+ * TODO: Improve address allocation to avoid this problem, and to
+ * avoid setting bits at the top of guest addresses that might need
+ * to be used for tags.
+ */
+#define GUEST_ADDR_MAX_                                                 \
+    ((MIN_CONST(TARGET_VIRT_ADDR_SPACE_BITS, TARGET_ABI_BITS) <= 32) ?  \
+     UINT32_MAX : ~0ul)
+#define GUEST_ADDR_MAX    (reserved_va ? : GUEST_ADDR_MAX_)
+
 #ifndef TARGET_TAGGED_ADDRESSES
 static inline abi_ptr cpu_untagged_addr(CPUState *cs, abi_ptr x)
 {
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 225e5fbd3e..7bfd558027 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -31,7 +31,6 @@
 #include "exec/log.h"
 #include "qemu/main-loop.h"
 #include "sysemu/cpus.h"
-#include "exec/cpu-all.h"
 #include "sysemu/cpu-timers.h"
 #include "exec/replay-core.h"
 #include "sysemu/tcg.h"
-- 
2.41.0
