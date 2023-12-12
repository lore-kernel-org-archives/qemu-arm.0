Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp865622ejo;
        Tue, 12 Dec 2023 04:36:28 -0800 (PST)
X-Received: by 2002:a17:906:7c44:b0:a19:a19b:78cc with SMTP id g4-20020a1709067c4400b00a19a19b78ccmr2953654ejp.143.1702384588295;
        Tue, 12 Dec 2023 04:36:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702384588; cv=none;
        d=google.com; s=arc-20160816;
        b=HoxiKY6Wxqx6UDGhZ0+BVeueAB2oKW9xydDOdc0E518z7jzEL2n0sAEu/ImzD97mZZ
         dG3WUdTlFcDaBXvBBWuL5Rs6n6naLBxqxCiuWFlsXJofEyGBHJoJmDzxbSphF942C93o
         bmqFIvoRDwiE/kfikDxwFY+WPKoS8gI6fmuEcxLDFvPlJFQ6ywAL/8TQn8JAHUT4tszK
         +xgLRAD3b6cqqEoUkk0zwMy38Naq2/BoLIB4daOn8AXOdKWy9BFC7wRbMXsUURglX0C5
         uVXjub4HLORxzJ9eyuve0BybkxyffJR1nD6We/GGWg8PuGvwJyP5zEr+4uzL92e8MXsu
         sXLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=XcUJPYPixvkbPwyuTaViLgu23Dq6vUSgutR3BpOkySY=;
        fh=vlFEGdij83GYetLrOUaCnR04sbYRvtckD5L7fw5192c=;
        b=WHD8imPhIVY5n1HwOafojekvc2ObQXV3QwnAlgOH1L9GwYP1qzxAWHrKAqJA3isim8
         VqoLpaQOupprBvF4Cultt5crupLMeGaoI+EKdzs2yb2uzrhQApo+3ccj9TFwn3UhB6cS
         +856HMEtOB9WNkDBiDCsWfTJPqZ2OfZWXLYNhnHkO5XTjL6QJb1/SLIfmprePaBet+V0
         lDQLpfy/nng58VT3E8EypU2BZ5QhuEU3Rr/slQ+MrKEcq/xDfKlUOftCQQJovlo9/F1O
         EkedyxFIWeogz2wvG0d64xvE9m8v5yjL4QsPAL5IytTbbPhrNoGiBfjJwqmNwrPUdCKG
         KH8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PgDkhAPF;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id qx6-20020a170907b58600b00a1f9ac439b4sor1281554ejc.15.2023.12.12.04.36.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Dec 2023 04:36:28 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PgDkhAPF;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702384588; x=1702989388; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XcUJPYPixvkbPwyuTaViLgu23Dq6vUSgutR3BpOkySY=;
        b=PgDkhAPFl2qhnf0iqwujyBv58ql7eeT16AzC0bfgMPf2fmiTJxGb3EP2n0JChWu739
         gNWyXVAwd4pK4Ru2ZA5UtPjbt5vte2fb1qWFrnx+5IkDR9d+7yHLWOHedTy9nC8OxMS0
         m29LcovJ0ADB0WFrh0QJYlyOcby8C0kThg6RCFw48mni+PFteBXRa2IQjOuZEDzLulKH
         kZ37GbN9X+SZflbsVS5hcBYQh9GYE+UALwy3MgDqluRD5zcJ23KH7yRRSh+4NuZ6LNd8
         ZAOm1Bw6jU9F9ouBHvv9hmEGCCEB80vr5wTCHhtSApjYt+uLxroYWFh3Ddqev6Dr1nC/
         QzuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702384588; x=1702989388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XcUJPYPixvkbPwyuTaViLgu23Dq6vUSgutR3BpOkySY=;
        b=fw9S2CpV2LDaeQ6I3epFcg7oCzWlPsLEVzGQS349+xfMnq01jKWbdVdr4aU1hYXxTa
         TJaaOYs09axXeHqVBVaCvvCE2kcnt0q+pckV71wF16JYPOpw5J+DNqcYrxj1mwP3qxa5
         efgoEtmw7siX+FhWWnpjSA0AXyWiblrtWctGxkwxywzwlNuwGkHvGGKWByxya3v09J9v
         xVkJzqK2AyZ0+4R+clQu2mS5Sn6xrSy/jDj8PS9Z7HNZxFZMDHm6lDE61OMTNfRTislG
         eUsIZivkmJHuwmqkmQWLzh/hO/whTN4+TI8AacZgTZeScOGEHSSFo2ffCKfV8aPq17Zz
         eAaA==
X-Gm-Message-State: AOJu0YyykivOtsN4BfAFsUI7Vkd1aVN/GENJSFzUO/BbKFbfo7Py3lHi
	uf2WReZuK/xFQU/aAw1wOFKZ9qe5
X-Google-Smtp-Source: AGHT+IGi/ndeDCRsbzkeIyI2icMnKHZUcY+4/u1N6lfUPc61wGzcvq/Uq1c9+DdTK2NLoK55oG6rdw==
X-Received: by 2002:a17:907:20e9:b0:a19:a19b:78c5 with SMTP id rh9-20020a17090720e900b00a19a19b78c5mr3381195ejb.136.1702384587924;
        Tue, 12 Dec 2023 04:36:27 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id um7-20020a170907cb0700b00a1d8ba21d72sm6180806ejc.201.2023.12.12.04.36.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 12 Dec 2023 04:36:27 -0800 (PST)
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
Subject: [PATCH v2 20/23] exec: Declare abi_ptr type in its own 'abi_ptr.h' header
Date: Tue, 12 Dec 2023 13:33:56 +0100
Message-ID: <20231212123401.37493-21-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231212123401.37493-1-philmd@linaro.org>
References: <20231212123401.37493-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 3ZFSbLEXfi97

The abi_ptr type is declared in "exec/cpu_ldst.h" with all
the load/store helpers. Some source files requiring abi_ptr
type don't need the load/store helpers. In order to simplify,
create a new "exec/abi_ptr.h" header.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/abi_ptr.h    | 33 +++++++++++++++++++++++++++++++++
 include/exec/cpu_ldst.h   | 17 +++--------------
 include/exec/exec-all.h   |  1 +
 include/exec/translator.h |  5 ++++-
 accel/tcg/cputlb.c        |  1 +
 5 files changed, 42 insertions(+), 15 deletions(-)
 create mode 100644 include/exec/abi_ptr.h

diff --git a/include/exec/abi_ptr.h b/include/exec/abi_ptr.h
new file mode 100644
index 0000000000..2b6ae470c4
--- /dev/null
+++ b/include/exec/abi_ptr.h
@@ -0,0 +1,33 @@
+/*
+ * QEMU abi_ptr type
+ *
+ * SPDX-License-Identifier: LGPL-2.1-or-later
+ */
+#ifndef EXEC_ABI_PTR_H
+#define EXEC_ABI_PTR_H
+
+#include "cpu-param.h"
+
+#if defined(CONFIG_USER_ONLY)
+/*
+ * sparc32plus has 64bit long but 32bit space address
+ * this can make bad result with g2h() and h2g()
+ */
+#if TARGET_VIRT_ADDR_SPACE_BITS <= 32
+typedef uint32_t abi_ptr;
+#define TARGET_ABI_FMT_ptr "%x"
+#else
+typedef uint64_t abi_ptr;
+#define TARGET_ABI_FMT_ptr "%"PRIx64
+#endif
+
+#else /* !CONFIG_USER_ONLY */
+
+#include "exec/target_long.h"
+
+typedef target_ulong abi_ptr;
+#define TARGET_ABI_FMT_ptr TARGET_FMT_lx
+
+#endif /* !CONFIG_USER_ONLY */
+
+#endif
diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index 25e7239cc5..64e0319996 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -63,20 +63,11 @@
 #define CPU_LDST_H
 
 #include "exec/memopidx.h"
+#include "exec/abi_ptr.h"
 #include "qemu/int128.h"
 #include "cpu.h"
 
 #if defined(CONFIG_USER_ONLY)
-/* sparc32plus has 64bit long but 32bit space address
- * this can make bad result with g2h() and h2g()
- */
-#if TARGET_VIRT_ADDR_SPACE_BITS <= 32
-typedef uint32_t abi_ptr;
-#define TARGET_ABI_FMT_ptr "%x"
-#else
-typedef uint64_t abi_ptr;
-#define TARGET_ABI_FMT_ptr "%"PRIx64
-#endif
 
 #ifndef TARGET_TAGGED_ADDRESSES
 static inline abi_ptr cpu_untagged_addr(CPUState *cs, abi_ptr x)
@@ -120,10 +111,8 @@ static inline bool guest_range_valid_untagged(abi_ulong start, abi_ulong len)
     assert(h2g_valid(x)); \
     h2g_nocheck(x); \
 })
-#else
-typedef target_ulong abi_ptr;
-#define TARGET_ABI_FMT_ptr TARGET_FMT_lx
-#endif
+
+#endif /* CONFIG_USER_ONLY */
 
 uint32_t cpu_ldub_data(CPUArchState *env, abi_ptr ptr);
 int cpu_ldsb_data(CPUArchState *env, abi_ptr ptr);
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index df3d93a2e2..5b6be2de6c 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -22,6 +22,7 @@
 
 #include "cpu.h"
 #if defined(CONFIG_USER_ONLY)
+#include "exec/abi_ptr.h"
 #include "exec/cpu_ldst.h"
 #endif
 #include "exec/translation-block.h"
diff --git a/include/exec/translator.h b/include/exec/translator.h
index 6d3f59d095..574058b900 100644
--- a/include/exec/translator.h
+++ b/include/exec/translator.h
@@ -19,7 +19,10 @@
  */
 
 #include "qemu/bswap.h"
-#include "exec/cpu_ldst.h"	/* for abi_ptr */
+#include "exec/cpu-common.h"
+#include "exec/cpu-defs.h"
+#include "exec/abi_ptr.h"
+#include "cpu.h"
 
 /**
  * gen_intermediate_code
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index db3f93fda9..852a55fbb6 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -34,6 +34,7 @@
 #include "qemu/atomic.h"
 #include "qemu/atomic128.h"
 #include "exec/translate-all.h"
+#include "exec/abi_ptr.h"
 #include "trace.h"
 #include "tb-hash.h"
 #include "internal-common.h"
-- 
2.41.0
