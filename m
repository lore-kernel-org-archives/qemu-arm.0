Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp26402njc;
        Wed, 13 Nov 2024 17:15:09 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVNgqI5kT6eCY9FMioot3Q7EKLwYiJxQrkmsR4VFWezAvXzzJ3oWMP4vRYXsVjtPu/XJuovDKl1g7s/cA==@linaro.org
X-Received: by 2002:a05:600c:46cc:b0:431:157a:986e with SMTP id 5b1f17b1804b1-432b7515947mr173084215e9.20.1731546909414;
        Wed, 13 Nov 2024 17:15:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731546909; cv=none;
        d=google.com; s=arc-20240605;
        b=Daq0POCUbeOGl7c8imW7bUb6IiJYZf3kKKoYjvKv5T0RovwYv9sK6ISlo9erezFKik
         PpYip34crBWesAfcQWV7QwK3DvrNr3Lu1chlA9L5hMgAlt4+2oPqW+VhtkYu5qZUa2YH
         1cLAVJQkLG+P+ouzfLY8D/BBR3UTfn4hJ9dqNPzyoh0kZEvRllpFzI3mv5ff9gpAMvsq
         4TBrlCC0zE8Eyy5POfVdYIUICNx/XbFjfDbm3NPn8C/Lo/Xx8xh95T+2ZCuhdUAxJJ1r
         ff5MBWa2Yn/TndyVByU1HopWXJH54AI5365f/q28mTfEjF7Qg7Q29EFuvc6HB/urSWzS
         P1Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=H8uiLmmGjHl/HLmoj7E2H8Y9eTAxD3FMaBkjbXtSXv0=;
        fh=wzPjwGQHpjEnNMFZp/YJxagZYFYvQATGvUhETLiowak=;
        b=V81GHlsYi3WS6H7s8ni3RhLxtNQfKkoIsvEsIF0E9+GTU8NmdBlBvrfMhu+Im2df4t
         E7e3GoxLYon4AReFwD5MpBE0TGYeEt7bIXEmy+9SLxBNJ6VCoxHsosWRhVo3fLkmS9a1
         Em/dpgeCSkwgV7d33z/LBMpKrC5Kv24ekjunXp4E8x89etxOjsNA0RtNoOO+26w/WMoS
         bjStEYrJl2YaNPXQf4mGjZPGCk70NnUtilaDP3zDpiLxX/+NVIsNSsOps/hwn7M5FAhT
         ZaDjjMGkxiheZd0f0+bIKc42GUP0PNFZ1Lk9d3dsO36MgpF46Z3EWnGUye35evGEG8iY
         TkVw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SkKes3OH;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-381ed96fddasor4617085f8f.2.2024.11.13.17.15.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 13 Nov 2024 17:15:09 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SkKes3OH;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731546909; x=1732151709; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H8uiLmmGjHl/HLmoj7E2H8Y9eTAxD3FMaBkjbXtSXv0=;
        b=SkKes3OHmJDo34bmVlc47woDJMrnPMrJhprioOUtUH/ivVY34Ft4tz9m5vYlI/H9YV
         Qn8i6Vsb7eM+Tg08DPGFKI5O15+mPIpV+Rfi8iSaQFHDc1V3buNYsOs7AKd13YnQccOK
         IE06FQGZfTDlI5GSbbKyu6vFT2s14gkijIhQmoA/D0wQEtEPY8Wkhmf1LkQKwETVIyHN
         v7HjcDtFNy7qMnnav8oyLWm2X8K6RoGRldqFNigSkmg+PX7oG7RFcobr8pECpRDuXH5Z
         9JHX+3SbPcddLy45NW39WD2uaMpLKMmiQGS+aNH5igPMb/wgAQw/sAJyOoo0sFXW40Ev
         OfRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731546909; x=1732151709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H8uiLmmGjHl/HLmoj7E2H8Y9eTAxD3FMaBkjbXtSXv0=;
        b=CyH/GGJjyeXOgQQWuKuE1ZEHvyp7C4CfV8zOECAfX2/LHOsB3XsGOJvIa8kKoan1rb
         4XMtPP3KS76jb8rG4TtQSq61GvLZrjWv0zg/YAufo334pdYgc23Hteq6HD2zlpA4Ishp
         Rl5DxgjXcTjqzJxO0UyuZ1yPNYNsNled9DN77WVmf2NlKGM31G8ColgsSgROEgYXI58a
         j3aH1ewfrzNP5P9gymJLpUZUeyMR2U9+LwtVxUHiTZB5OsxsixeUf6ZUaGDrZE5APF10
         tgTFSHZnZup05kg3gFswp+JX3WlC0JmtELtTVhg8cj/yKld9hLnXORB4YXEn/Dr5TXcI
         bL/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXmK+S7YNma/+zYuTJsGj5O4MRHGKgN17IVa+nsVxx6WEk6MrS5AfN/ZuSV3jUKqOHrspSlOrCKSBopRQ==@linaro.org
X-Gm-Message-State: AOJu0YzFDWGzMWo16wIv6UJOw6C+07+6+YffyOMhS1bNl0a8tTTr/ECn
	hfU4nTcgEwMsRq94D+nJMZRjKm85zXPR89coOpUvKupjeyRhNar27Tdqkz1WirKKg3GwqzoHKVb
	/8QA=
X-Google-Smtp-Source: AGHT+IHK50zmBoBB15u0Bg6EGMq2iWpXvibiYXl8HwVfa1E+/x1N83Vl6CClqN1LX+DTgZLH9wKKkA==
X-Received: by 2002:a5d:59a6:0:b0:37d:4d3f:51e6 with SMTP id ffacd0b85a97d-381f186bf72mr19363024f8f.14.1731546908922;
        Wed, 13 Nov 2024 17:15:08 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([176.187.209.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed987d95sm19923679f8f.44.2024.11.13.17.15.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 13 Nov 2024 17:15:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Anton Johansson <anjo@rev.ng>,
	qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	Peter Xu <peterx@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 14/24] exec: Declare tlb_init/destroy() in 'exec/cputlb.h'
Date: Thu, 14 Nov 2024 02:12:59 +0100
Message-ID: <20241114011310.3615-15-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241114011310.3615-1-philmd@linaro.org>
References: <20241114011310.3615-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: v+FO8IHMDNHR

Move CPU TLB related methods to "exec/cputlb.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/cputlb.h   | 28 +++++++++++++++++++++++-----
 include/exec/exec-all.h | 17 -----------------
 accel/tcg/cpu-exec.c    |  1 +
 3 files changed, 24 insertions(+), 22 deletions(-)

diff --git a/include/exec/cputlb.h b/include/exec/cputlb.h
index 6cac7d530f..5386e53806 100644
--- a/include/exec/cputlb.h
+++ b/include/exec/cputlb.h
@@ -22,15 +22,33 @@
 
 #include "exec/cpu-common.h"
 
-#ifdef CONFIG_TCG
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
+
+/**
+ * tlb_init - initialize a CPU's TLB
+ * @cpu: CPU whose TLB should be initialized
+ */
+void tlb_init(CPUState *cpu);
+
+/**
+ * tlb_destroy - destroy a CPU's TLB
+ * @cpu: CPU whose TLB should be destroyed
+ */
+void tlb_destroy(CPUState *cpu);
 
-#if !defined(CONFIG_USER_ONLY)
-/* cputlb.c */
 void tlb_protect_code(ram_addr_t ram_addr);
 void tlb_unprotect_code(ram_addr_t ram_addr);
-#endif
 
-#endif /* CONFIG_TCG */
+#else
+
+static inline void tlb_init(CPUState *cpu)
+{
+}
+static inline void tlb_destroy(CPUState *cpu)
+{
+}
+
+#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
 
 #ifndef CONFIG_USER_ONLY
 
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 2c06e54387..d792203773 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -47,17 +47,6 @@ static inline bool cpu_loop_exit_requested(CPUState *cpu)
 }
 
 #if !defined(CONFIG_USER_ONLY) && defined(CONFIG_TCG)
-/* cputlb.c */
-/**
- * tlb_init - initialize a CPU's TLB
- * @cpu: CPU whose TLB should be initialized
- */
-void tlb_init(CPUState *cpu);
-/**
- * tlb_destroy - destroy a CPU's TLB
- * @cpu: CPU whose TLB should be destroyed
- */
-void tlb_destroy(CPUState *cpu);
 /**
  * tlb_flush_page:
  * @cpu: CPU whose TLB should be flushed
@@ -242,12 +231,6 @@ void tlb_set_page(CPUState *cpu, vaddr addr,
                   hwaddr paddr, int prot,
                   int mmu_idx, vaddr size);
 #else
-static inline void tlb_init(CPUState *cpu)
-{
-}
-static inline void tlb_destroy(CPUState *cpu)
-{
-}
 static inline void tlb_flush_page(CPUState *cpu, vaddr addr)
 {
 }
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 8163295f34..8770493590 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -24,6 +24,7 @@
 #include "hw/core/tcg-cpu-ops.h"
 #include "trace.h"
 #include "disas/disas.h"
+#include "exec/cputlb.h"
 #include "exec/exec-all.h"
 #include "tcg/tcg.h"
 #include "qemu/atomic.h"
-- 
2.45.2
