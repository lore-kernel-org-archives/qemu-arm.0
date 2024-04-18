Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp1952592ejd;
        Thu, 18 Apr 2024 12:26:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWXpqTuR/q/CPdiyG6CcRjQdi9EnJQNjuM5cHnQr8f/u8IpmeusbV5D26Ic5EJUa7vissBIhXsT4qXEKET5BvsrEJGrumAT
X-Received: by 2002:a17:906:128f:b0:a52:10c8:c4e2 with SMTP id k15-20020a170906128f00b00a5210c8c4e2mr39178ejb.66.1713468396585;
        Thu, 18 Apr 2024 12:26:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713468396; cv=none;
        d=google.com; s=arc-20160816;
        b=fk9iNsoAWxLK9roGeBAwQKjeOPIR2ABg+v9w5Sy8kYNsy1w8rCsnJYCeCb9NNZV1+t
         G8YIBVaSp2fnLHzWwwtTuPX7CWmpVYRrVwtPNrSi5bTkeLIE0x0DGALbqYjP77FMKf8l
         M1vmEiwvsjMPjJeI78LWU2UpVqyzDUM7wQtgQQAQ4cq28lA4mFzNbRoYG73RpvL9lriO
         hqJmGdwD6ifKHYgQROOI1InT8U7G9YuEnAtrAEF7SyagSvZ1kbxvd/kZJVRtNsHIfR3i
         jtkdOGhOAPl8YIWmgbvrKxuaSFm+c+DUGqorcuVhLi73xD+8ofhnQMed8TIPVrY0zpPH
         GQ8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Jio+r+AEUkjjrU5gDZl4zBsemaqAFeHzEWFaXnqFrOQ=;
        fh=SGaZbUf/KlceQ/wta8Xv3RylI3kTbf9RX66RZJSEU+o=;
        b=EFZ0G6FP/9ThzCzrJeWUm4x9rpWvnu8Dx37rkaNQ0BEBiBpZprI8kyKVQxwhsxGBRP
         TeFwsYL4CxIfcSv1wcuEoIrisrEWRZov9XhXNMrMzD+XRtJ1G2V5PSf87ysEWkXDoJw1
         VuCqQXIAqwXuUzLHR/EHov/sZZ74umciDJ94xNbZLAP5i2j7VyNwOWyPa7VB4hRwjl1z
         JJl4gykUGtv+4OIAgUW5qpREy0nmauegotEq3ZFPJsLCj9+G9UNok0lnouYcjjTu6kCv
         UjPCd2CFxNp0oq01pN5pUqdi4uHBsuG8ltKxCV+NtUtoD3yI+5NIIQ9nJjBSxBmZYFUo
         hgZw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ksFSqjPA;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n27-20020a1709062bdb00b00a52584d63cesor682058ejg.21.2024.04.18.12.26.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 18 Apr 2024 12:26:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ksFSqjPA;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713468396; x=1714073196; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jio+r+AEUkjjrU5gDZl4zBsemaqAFeHzEWFaXnqFrOQ=;
        b=ksFSqjPAazgKv2XmkNd5a0QOv+lgp7PBjQC6wTwl/9H7o9asZebxEEi9pmIAtoyrEP
         0QHeCfgKkBSORvQLbTwF1U0206ououRtJv4dNSN84yTvTlHHfgHAnnIVaa0SXnfFf0x8
         5J+k+2ZCfowbsofI+uIjBpEQTMMK6m2LIgAYTPdkQ7W4cUEY66ubozauNgrP2o9wQBi9
         J18noKnNJlgA71mRRb3/kV850IKSMRedJ4kbPtS+712KQCLHmedgB6QUjqiHZYUk+20x
         r2v61AD6SOLnBIZdMfNZ0dVoosf//Varm97ciEQ2yShY1jFz8Wf1it/nHfJI3BsTwQmN
         y5PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713468396; x=1714073196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jio+r+AEUkjjrU5gDZl4zBsemaqAFeHzEWFaXnqFrOQ=;
        b=nhA5jOwV1RH8gbq9SWfgrHeCnX7xjqd8TxTx3H/2eW2xYpYYPVQ62xhTS/9LMuB5RR
         ThloN9j81wnBNMrK0KcAE/EsSlTqQ7m7NsRSUIJSvR8veoF9gtPXMUafkPMV2HosyeGZ
         rQUn8o0U/4UCcWS15DtoHiiKALuStFVX4bMGSMaePzL0UE02StdwzUu0wmL9Od4AxTYN
         toBaHoNpR8f5mTmLywnQ0F1JoGBovr+/lyb24E0J1inmGE83vMzmnYVQdI4V9KDDNcnq
         wBX+YSP1eJjAJwX2m0NE19o6f43EHj8NvWKziYFC3j0BVMIUeutpuVi4jOssSKHAyx6u
         NcxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcGJoLvQqHxY3izyqhm7mndt0LWG/HdHu6TzwL6iJt+pn9YSTuQk//bs/I5JV/38MUotBCkcJZWS5P6KTLlU9ek+Zi1qEb
X-Gm-Message-State: AOJu0Yz8RR0Hpn3vjQIgGPCTXTW0N5WpomwqG+gLBXo/rTWYSdDbIuNb
	87ppo5CCYNwpS8pHQ2wd01JSYeOygp+pTtA1xbxcRNEaCWNldBUI6ko2tIO5cpJUzQ==
X-Google-Smtp-Source: AGHT+IGvos0mZIxaTBgDhPQVJFUlHPzRnRLeB+2FoZuf4Lvw2zFvFjAnSJwEUd4r5lLo33Y0Jgv61A==
X-Received: by 2002:a17:906:1f48:b0:a4e:cd5c:da72 with SMTP id d8-20020a1709061f4800b00a4ecd5cda72mr43114ejk.63.1713468396179;
        Thu, 18 Apr 2024 12:26:36 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.151.213])
        by smtp.gmail.com with ESMTPSA id lu10-20020a170906faca00b00a52299d8eecsm1238430ejb.135.2024.04.18.12.26.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 18 Apr 2024 12:26:35 -0700 (PDT)
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
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Peter Xu <peterx@redhat.com>
Subject: [PATCH 11/24] exec: Move tlb_reset_dirty*() declarations to 'exec/cputlb.h'
Date: Thu, 18 Apr 2024 21:25:10 +0200
Message-ID: <20240418192525.97451-12-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240418192525.97451-1-philmd@linaro.org>
References: <20240418192525.97451-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: txwFIczQVs4o

Declare tlb_reset_dirty() and tlb_reset_dirty_range_all()
in "exec/cputlb.h". Restrict tlb_reset_dirty_range_all()
to TCG accel.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/cputlb.h   | 12 +++++++++++-
 include/exec/exec-all.h |  3 ---
 include/exec/ram_addr.h |  1 +
 system/physmem.c        |  2 ++
 4 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/include/exec/cputlb.h b/include/exec/cputlb.h
index 3594f904b4..dc92befb93 100644
--- a/include/exec/cputlb.h
+++ b/include/exec/cputlb.h
@@ -49,6 +49,9 @@ void *tlb_vaddr_to_host(CPUArchState *env, abi_ptr addr,
 void tlb_protect_code(ram_addr_t ram_addr);
 void tlb_unprotect_code(ram_addr_t ram_addr);
 
+void tlb_reset_dirty(CPUState *cpu, ram_addr_t start1, ram_addr_t length);
+void tlb_reset_dirty_range_all(ram_addr_t start, ram_addr_t length);
+
 /**
  * iotlb_to_section:
  * @cpu: CPU performing the access
@@ -69,6 +72,13 @@ hwaddr memory_region_section_get_iotlb(CPUState *cpu,
 
 #endif /* CONFIG_USER_ONLY */
 
-#endif /* CONFIG_TCG */
+#else /* !CONFIG_TCG */
+
+static inline void tlb_reset_dirty_range_all(ram_addr_t start,
+                                             ram_addr_t length)
+{
+}
+
+#endif /* !CONFIG_TCG */
 
 #endif
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 778c82ba8e..6f46015ab4 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -640,9 +640,6 @@ static inline void mmap_lock(void) {}
 static inline void mmap_unlock(void) {}
 #define WITH_MMAP_LOCK_GUARD()
 
-void tlb_reset_dirty(CPUState *cpu, ram_addr_t start1, ram_addr_t length);
-void tlb_reset_dirty_range_all(ram_addr_t start, ram_addr_t length);
-
 #endif
 
 #endif
diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index 3fc83587c0..f06ae9b516 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -26,6 +26,7 @@
 #include "exec/ramlist.h"
 #include "exec/ramblock.h"
 #include "exec/exec-all.h"
+#include "cputlb.h"
 #include "qemu/rcu.h"
 
 extern uint64_t total_dirty_pages;
diff --git a/system/physmem.c b/system/physmem.c
index 38d3ede9f9..7a7876a375 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -850,6 +850,7 @@ found:
     return block;
 }
 
+#ifdef CONFIG_TCG
 void tlb_reset_dirty_range_all(ram_addr_t start, ram_addr_t length)
 {
     CPUState *cpu;
@@ -869,6 +870,7 @@ void tlb_reset_dirty_range_all(ram_addr_t start, ram_addr_t length)
         tlb_reset_dirty(cpu, start1, length);
     }
 }
+#endif
 
 /* Note: start and end must be within the same ram block.  */
 bool cpu_physical_memory_test_and_clear_dirty(ram_addr_t start,
-- 
2.41.0
