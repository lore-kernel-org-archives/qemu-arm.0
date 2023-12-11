Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp492937ejo;
        Mon, 11 Dec 2023 13:22:36 -0800 (PST)
X-Received: by 2002:a17:907:94c9:b0:a11:2ad2:6563 with SMTP id dn9-20020a17090794c900b00a112ad26563mr3178161ejc.26.1702329755901;
        Mon, 11 Dec 2023 13:22:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702329755; cv=none;
        d=google.com; s=arc-20160816;
        b=Gchj6XTNlLohhJiN7R53aZJbkD0z8+GkW4QBFUAPtAiTL3MXjYRdeeWSbh1P+AFITL
         vrKM9BGpmk8FePgXZZZXznqvlqeGdUtg2ETG5F0QYDy6G/VFqKysKqU8U3e85ehyQTvf
         Fd1jm3gnYAcaxhEdU2JYxobq2wz5nYpTNpWgZHDNxPJj6BSxK/jVRLRpHD/pjooj63oP
         ekGrGETv32qlh3ybrGSEfzCVi7vysQo/s9n2QYj/L7gj3F1gT+3bMSw+15qIn7GkK42b
         xNATZpdFDsE4N/8Jm4W1e/FCE/W3G+AHkuHc6oPU7uZ2tLRWRU39g/MBByMkgnZokKhf
         C7nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=rDPDUy3GuLtVTYcoiToi/C6HdVw4jRlY7C7+srVSuzU=;
        fh=B0OEDADjyZZ394IF34p+Sju0laY+Le2V70wZ4wNEC7c=;
        b=oIHwh0wZDj4KhAzkN1oxT08s8Qlf49xlukH4lR6L/aEUIlshdLEU/HeoH5H0IUGfsi
         Aa0qK7B3pQZpVdsP4eXCSwVZma6J2mGMF8TfSkYR4hL6GVNi+oMztTXzeESewGKwveZn
         rlRi6TBX9RCYmI24gRIIm4G1HOk/+HwMc/8FoWDvCzAVF3NrgzGu5tv22Lny9YVAlYx7
         /tCH2+/VEiZBEInYqBepk+e02e9bAoVz3jD+ex7T3aKg+6g2YWB2tgOJDMGYwwfrd3aC
         9eMyLJuDrfKymw8nAly/bx/UoUjAyMAozHTkO+fklN/KQOugbYTCutgcsmruHNtH3JWn
         qz+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uqXBQod4;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id j20-20020a170906411400b00a1b68f77111sor2012415ejk.17.2023.12.11.13.22.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 11 Dec 2023 13:22:35 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uqXBQod4;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702329755; x=1702934555; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rDPDUy3GuLtVTYcoiToi/C6HdVw4jRlY7C7+srVSuzU=;
        b=uqXBQod4iRH9uyRGiMyXyocvIQtWRCpZYw/wyaj8DnPOE7JRbZocFYfpcscIWWYKEn
         IlmIXHoSEarDyEF8lStHMq5jNZuW0PEVvmrBZR6H4mOMrdmkXZWFyT/uS/rFP3H+wU/X
         Vz9eDOl1UDAFYaAJK2U7BXCRB41JPq6lCh+kEVN6FrHG605taAYA3p/hQv7zatj1poLD
         aR+n0q78SkIhiSiK7GRp9j1PofO1OI4HKK3fFJEr4Sz+5wRSFofoStHgYJwGJ00VAcoH
         2bcYYMeHvmXAELidBt9UeeKtR8b8si2Hd3dFgbnawU9BCnw2DZW4dOOJhTTq+deq5Ozq
         E13Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702329755; x=1702934555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rDPDUy3GuLtVTYcoiToi/C6HdVw4jRlY7C7+srVSuzU=;
        b=tAysa4DYfvvGnioXNmquV+hPiRU3cKb2ZT9WNWdcLCCfJpFXUkBTPQ5U4wU0WDXk9A
         rlYKSr+A/fUgvvRV0W/XriGjxr7HgoZgME182x2S0IH5cONIp6KU57zWNPuOQ2BmiLiW
         DcIH+ZsEBIcOk4RTDhZpYrpvV06SC1fhrQ9CwtroUH6iP+WzQwVzBoNQt77Dhc4Qz3Hp
         i/APdinmznfvXXbDqBsu91/+u+TX6rmdNPv5Ni9Lq3XhJZSJ5uKW+jqjCecAxHizn5JQ
         2G5joKXQsxcL8BECm95vPSsx4El1paDmhqN0C/b3qb92UzGOvCOx4isQEPWj9Z23Wpoj
         sJxQ==
X-Gm-Message-State: AOJu0Yw1mFoEtNlL4BV/X2T+1eZMVvJOWXMu6Lvqkgm5MtcTcPPQZe0m
	v3vClWZtI3snxD6Hd0fjsWj0vucU
X-Google-Smtp-Source: AGHT+IGWTrFnrdu+BIym/Y7KGDpWmg+mrD8Ku5OoCmfyERaJKGIfeqHgX1KlQsVawhZpFZcq4s245A==
X-Received: by 2002:a17:907:c981:b0:a1b:6ed7:a44f with SMTP id uj1-20020a170907c98100b00a1b6ed7a44fmr2023369ejc.137.1702329755619;
        Mon, 11 Dec 2023 13:22:35 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id tk7-20020a170907c28700b00a1d1ebc2206sm5334509ejc.72.2023.12.11.13.22.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 11 Dec 2023 13:22:35 -0800 (PST)
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
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Riku Voipio <riku.voipio@iki.fi>
Subject: [PATCH 18/24] accel/tcg: Un-inline retaddr helpers to 'user-retaddr.h'
Date: Mon, 11 Dec 2023 22:19:55 +0100
Message-ID: <20231211212003.21686-19-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231211212003.21686-1-philmd@linaro.org>
References: <20231211212003.21686-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: FiFTToGtSAIL

set_helper_retaddr() is only used in accel/tcg/user-exec.c.

clear_helper_retaddr() is only used in accel/tcg/user-exec.c
and accel/tcg/user-exec.c.

No need to expose their definitions to all user-emulation
files including "exec/cpu_ldst.h", move them to a new
"user-retaddr.h" header (restricted to accel/tcg/).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/tcg/user-retaddr.h | 28 ++++++++++++++++++++++++++++
 include/exec/cpu_ldst.h  | 28 ++--------------------------
 accel/tcg/cpu-exec.c     |  3 +++
 accel/tcg/user-exec.c    |  1 +
 4 files changed, 34 insertions(+), 26 deletions(-)
 create mode 100644 accel/tcg/user-retaddr.h

diff --git a/accel/tcg/user-retaddr.h b/accel/tcg/user-retaddr.h
new file mode 100644
index 0000000000..e0f57e1994
--- /dev/null
+++ b/accel/tcg/user-retaddr.h
@@ -0,0 +1,28 @@
+#ifndef ACCEL_TCG_USER_RETADDR_H
+#define ACCEL_TCG_USER_RETADDR_H
+
+#include "qemu/atomic.h"
+
+extern __thread uintptr_t helper_retaddr;
+
+static inline void set_helper_retaddr(uintptr_t ra)
+{
+    helper_retaddr = ra;
+    /*
+     * Ensure that this write is visible to the SIGSEGV handler that
+     * may be invoked due to a subsequent invalid memory operation.
+     */
+    signal_barrier();
+}
+
+static inline void clear_helper_retaddr(void)
+{
+    /*
+     * Ensure that previous memory operations have succeeded before
+     * removing the data visible to the signal handler.
+     */
+    signal_barrier();
+    helper_retaddr = 0;
+}
+
+#endif
diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index 6061e33ac9..25e7239cc5 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -300,31 +300,7 @@ Int128 cpu_atomic_cmpxchgo_be_mmu(CPUArchState *env, abi_ptr addr,
                                   Int128 cmpv, Int128 newv,
                                   MemOpIdx oi, uintptr_t retaddr);
 
-#if defined(CONFIG_USER_ONLY)
-
-extern __thread uintptr_t helper_retaddr;
-
-static inline void set_helper_retaddr(uintptr_t ra)
-{
-    helper_retaddr = ra;
-    /*
-     * Ensure that this write is visible to the SIGSEGV handler that
-     * may be invoked due to a subsequent invalid memory operation.
-     */
-    signal_barrier();
-}
-
-static inline void clear_helper_retaddr(void)
-{
-    /*
-     * Ensure that previous memory operations have succeeded before
-     * removing the data visible to the signal handler.
-     */
-    signal_barrier();
-    helper_retaddr = 0;
-}
-
-#else
+#if !defined(CONFIG_USER_ONLY)
 
 #include "tcg/oversized-guest.h"
 
@@ -376,7 +352,7 @@ static inline CPUTLBEntry *tlb_entry(CPUState *cpu, uintptr_t mmu_idx,
     return &cpu->neg.tlb.f[mmu_idx].table[tlb_index(cpu, mmu_idx, addr)];
 }
 
-#endif /* defined(CONFIG_USER_ONLY) */
+#endif /* !defined(CONFIG_USER_ONLY) */
 
 #if TARGET_BIG_ENDIAN
 # define cpu_lduw_data        cpu_lduw_be_data
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index c938eb96f8..e591992d0c 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -44,6 +44,9 @@
 #include "tb-context.h"
 #include "internal-common.h"
 #include "internal-target.h"
+#if defined(CONFIG_USER_ONLY)
+#include "user-retaddr.h"
+#endif
 
 /* -icount align implementation. */
 
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 68b252cb8e..2575f0842f 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -31,6 +31,7 @@
 #include "tcg/tcg-ldst.h"
 #include "internal-common.h"
 #include "internal-target.h"
+#include "user-retaddr.h"
 
 __thread uintptr_t helper_retaddr;
 
-- 
2.41.0
