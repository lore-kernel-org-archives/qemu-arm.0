Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp493064ejo;
        Mon, 11 Dec 2023 13:22:51 -0800 (PST)
X-Received: by 2002:a05:6512:b9c:b0:50b:cbb5:a0f with SMTP id b28-20020a0565120b9c00b0050bcbb50a0fmr2875704lfv.11.1702329771540;
        Mon, 11 Dec 2023 13:22:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702329771; cv=none;
        d=google.com; s=arc-20160816;
        b=toTz//a9HXXOZz5SyWYXh+ntCOCKfOSXIJddVSG/8aQX35p1dsVXCw0uD+h2VmQdCy
         ukDdsJ0YnwNNm/r8P57tlAs6LQ3G8YWl63L8AmnZsremGR/1V4BnGVMpx8ODZBXdc5vZ
         duk9+nAEl/t4WCzKp0qVdq2bhbXQCQc9qgZ1VACqfIzMTcftij6M+F3CTZctZMVxSxI3
         OvKsI5euqxrQFRP2EqwuMi1YkUa6yvsY+Vo3P31jLSsa8hVlx3UF/orpYWuyVsTvutHZ
         pTu/lKVd7MTng9IcgH6TN6gEuH0w8X4W+H/QnOFJGJDCvQu57g3uHu9Cs1JodYQHVStY
         LEMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=t6uthcvrcMhZYh7TDKG7c2NiXaXu0mJGOW4mt+82VSg=;
        fh=6uA3yvXeN55FEhLQ+7xhayEyGzy+Y3z2qOYV5oRrcR8=;
        b=nMxkL+KN3lJ0jwzxy61Ko6jzFvWkt9usBdrvHseaQjSTHZeJpuYrA/tiXIyriFqJtQ
         DmfGiSegECzbyykwb63FapS999IvRtydTbZhlQosHC4McWDgPtkgszAEWQwq8JUzynL2
         IC1ZSmnoth7TFw7ltZ9j0OlOuUqXeQiDpfEkCQ8kD7FTBfB7gawnSlKXoQ7RwEro9OPe
         7REL8VFjfmPQhrRGWtHFUWRi0arVJyNR7k4tMCUDw1u+TbMZh9oMJ7GBBLecqWt7zgzi
         GaGztK3HfIAa80w3LQWBJtoB+7NwRYnuNtZNXbKWNQOnNxt8lc9AaJNbCXyySt/fgZ1d
         PuBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x8auHQT4;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id br26-20020a170906d15a00b00a1cdf8b4535sor2018844ejb.18.2023.12.11.13.22.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 11 Dec 2023 13:22:51 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x8auHQT4;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702329771; x=1702934571; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t6uthcvrcMhZYh7TDKG7c2NiXaXu0mJGOW4mt+82VSg=;
        b=x8auHQT4lJDEsuLgkvJKKPs4/jbUzPpRdGUZrCyV7XDrRRfJrs+92ZXCCB3+6wRG2G
         N1uOlplnEH0sK7G8y+WYjA7uFZBVJbg/KHlprL7Gxllzgm3E5PJLrbcrXoZ/6a2YBpaM
         pLS8EowT9pJAumlwp2trw+NQ8GHNytX3847Onw0LDmVcwNvnUp5kbLc4HkmbsTejczwK
         /ZlJN1yokWi1lhIaFrg5GSm4uXtjCUJA/EkvuOVIxp5HfR0K5QeiT4917yQ1sKoE54tB
         DuTKmHcqX3ppYhMb1lT5kVuiEs7sP5VXzCPszQPNV2gHhiyuhbF9nt828Tp3brPQGLy/
         Vifg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702329771; x=1702934571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t6uthcvrcMhZYh7TDKG7c2NiXaXu0mJGOW4mt+82VSg=;
        b=B+wv9R9vifZtDZw7ox+1AnbSm0dnU/lCglurOo7oQ5oaBdki32Nhb8Mcf/Us6B80SX
         Mb1ZQ1OUWUHwylzi3MBe/VPR335xEjpEO4A8a4Rd3s0pbjA2LceS1G2XzUH+g97jhQP/
         V0pp7F1A/ACg+AyL9gbmCAHw8PRc613vqLhulvXZZj01Nkv8YrS21q+DKenjo3vOhsNY
         /OhDxqH37sqDLOie54TEy/tNDFtKxK4CjXVevgkzvclJZdj+wCj5qoffTAYv0MkbTsdp
         Mt5hp0JvUaRsMgdVfQsqQhmEOvz1jtL5N6/RH2tjpMwxyAUqLKS8mlnCAXNo/G470r3n
         6MUA==
X-Gm-Message-State: AOJu0YwsDktEHkwrf77ETnM7yZwQY/Y28FI8sxDl0l5i5/Puyu7jWuEE
	Z8Z7+p6SiuGOwh77vF9eY28bg/vy
X-Google-Smtp-Source: AGHT+IFlpVH0gwUDj/yMopdJoeguSuQyN6Lebwbbjz5C0g1LrsAluDRrDlDlHZ53Q8jSf07ddyD6kw==
X-Received: by 2002:a17:906:284:b0:a19:940f:b9d3 with SMTP id 4-20020a170906028400b00a19940fb9d3mr2189538ejf.25.1702329771198;
        Mon, 11 Dec 2023 13:22:51 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id tj10-20020a170907c24a00b00a1db7b77675sm5407638ejc.90.2023.12.11.13.22.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 11 Dec 2023 13:22:50 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>,
	Peter Xu <peterx@redhat.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Eduardo Habkost <eduardo@habkost.net>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	Warner Losh <imp@bsdimp.com>,
	Claudio Fontana <cfontana@suse.de>,
	Brian Cain <bcain@quicinc.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 20/24] exec: Declare abi_ptr type in its own 'tcg/abi_ptr.h' header
Date: Mon, 11 Dec 2023 22:19:57 +0100
Message-ID: <20231211212003.21686-21-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231211212003.21686-1-philmd@linaro.org>
References: <20231211212003.21686-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 2ifGd4o5qcW6

The abi_ptr type is declared in "exec/cpu_ldst.h" with all
the load/store helpers. Some source files requiring abi_ptr
type don't need the load/store helpers. In order to simplify,
create a new "tcg/abi_ptr.h" header.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/cpu_ldst.h   | 17 +++--------------
 include/exec/exec-all.h   |  1 +
 include/exec/translator.h |  5 ++++-
 include/tcg/abi_ptr.h     | 32 ++++++++++++++++++++++++++++++++
 accel/tcg/cputlb.c        |  1 +
 5 files changed, 41 insertions(+), 15 deletions(-)
 create mode 100644 include/tcg/abi_ptr.h

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index 25e7239cc5..c69f02b699 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -65,18 +65,9 @@
 #include "exec/memopidx.h"
 #include "qemu/int128.h"
 #include "cpu.h"
+#include "tcg/abi_ptr.h"
 
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
index df3d93a2e2..6a634c0889 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -22,6 +22,7 @@
 
 #include "cpu.h"
 #if defined(CONFIG_USER_ONLY)
+#include "tcg/abi_ptr.h"
 #include "exec/cpu_ldst.h"
 #endif
 #include "exec/translation-block.h"
diff --git a/include/exec/translator.h b/include/exec/translator.h
index 6d3f59d095..16d2449292 100644
--- a/include/exec/translator.h
+++ b/include/exec/translator.h
@@ -19,7 +19,10 @@
  */
 
 #include "qemu/bswap.h"
-#include "exec/cpu_ldst.h"	/* for abi_ptr */
+#include "exec/cpu-common.h"
+#include "exec/cpu-defs.h"
+#include "cpu.h"
+#include "tcg/abi_ptr.h"
 
 /**
  * gen_intermediate_code
diff --git a/include/tcg/abi_ptr.h b/include/tcg/abi_ptr.h
new file mode 100644
index 0000000000..415e31cabb
--- /dev/null
+++ b/include/tcg/abi_ptr.h
@@ -0,0 +1,32 @@
+/*
+ * TCG abi_ptr type
+ *
+ * SPDX-License-Identifier: LGPL-2.1-or-later
+ */
+#ifndef TCG_ABI_PTR_H
+#define TCG_ABI_PTR_H
+
+#include "cpu-param.h"
+
+#if defined(CONFIG_USER_ONLY)
+/* sparc32plus has 64bit long but 32bit space address
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
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index db3f93fda9..c4500d3261 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -41,6 +41,7 @@
 #ifdef CONFIG_PLUGIN
 #include "qemu/plugin-memory.h"
 #endif
+#include "tcg/abi_ptr.h"
 #include "tcg/tcg-ldst.h"
 #include "tcg/oversized-guest.h"
 
-- 
2.41.0
