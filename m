Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp485173njk;
        Thu, 23 Jan 2025 15:45:02 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWta9xKV7TsbyAdNIIPjF46G7ZEOvljK6QxjPdl8SImPh11aBiIgUVD49ojj0iCJ23TJcIWole2r2uzLg==@linaro.org
X-Received: by 2002:a05:600c:1d07:b0:434:a929:42bb with SMTP id 5b1f17b1804b1-438913e2cbfmr285581825e9.18.1737675902513;
        Thu, 23 Jan 2025 15:45:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737675902; cv=none;
        d=google.com; s=arc-20240605;
        b=ZPQ6lHGt7/CSRcHv72vc9QTZdes5kbGIntEFGdDsq0XNrcUgAU5TJb4Ji5TtjdPF4l
         /QSAQnNN3PVvUX/iAejXwWdRmblphvxEEqpd8G63cavNfoavo4iEIePksyzDzO3winNy
         354LK5+HvrmQl2uD0vJj1PgeRGzilTQzKzPp+7ScIhDY47yUFXhZczmahTBFcL1j/XSL
         QYInd3l/3AodHkdV2+VZuoIFwq52r1Sk0X78on0gOdpM4yDldaTe3qq7kwVPvj+pNCsT
         4SYOi8lTRDGBx+98wL5ARxzRCy7eFLdMWXtCn1lVATIIsUImvfl5PrjsqY4KwC1GWsWk
         Phpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=b+Ptx+X+/4qytTYw1NRizSw3Es7j283R5duCMBs45So=;
        fh=zesNmDxncvZpWK1wSdgQSbJtawpU3sAZ/uHH5v7OJGw=;
        b=lvqtGW+Qw2XZYW8g1Ou5lir082ZlrCSuqAZeYalRrTK8HnnoBKbaXG2vwkQ6aK/JMK
         zhX/lQW3aaB/0JBy9wYMAR5OU0MCDvDQ5dslj2TK4gDJ7NhPhXtcwgfZtRw9Dp0/fhEF
         NAWZz98lvqr4cb48DnC7BoGXM9tOc49/IAS7s7v35qyCe9xxGLRJWlf+owGb1GnaDhOP
         YwLK5CS1ts/PHYuecaH6X2qQ80et/R6aWUxFQHylYmmnvVFdH8LAFCWNYjdtliXMX3/z
         pkI/yevSmhTYEMO/ZEyMrRQqgcZVR3aDDUj5pCL8ayUSfB/j2xWXYLvJlazJHNWqfLzz
         3EkQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FKmvsRzG;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-438bd49f586sor1997535e9.2.2025.01.23.15.45.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 23 Jan 2025 15:45:02 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FKmvsRzG;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737675902; x=1738280702; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b+Ptx+X+/4qytTYw1NRizSw3Es7j283R5duCMBs45So=;
        b=FKmvsRzGZdPbOKB6fCyP34bVviNBZ0WG3tXeq8ZJfksFdsEwcOFbGI2Pf3XpcuHqvg
         oD7EBne4cTiNyqB3uDfm6wD/ECaWGZmr5idYmuCU/HMcQ+dt/6GIycgkSlZ98cR0BJEq
         WLl9fQtnJQHvjvZVOe2vOG53nIjSTd58y/FTu3rd9DE7WD6q9m8Obe1s6AeLiLuSen4e
         ZZzUH9rYgmGkfIvRdE8PCbDIkQjR6egdhUJG4AwCGKGpCuvFaJtY1tUXJsWr9QKb3VSD
         aM/vaBQjLeaCYE3N7iLen4ZhPqMUEz3uFNEDVCMI87jGk9LysU8FThVWPxGgsCXe7fnN
         wW1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737675902; x=1738280702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b+Ptx+X+/4qytTYw1NRizSw3Es7j283R5duCMBs45So=;
        b=cGAYu9aywmco9ABMyuBUm1Of3gxa2megwOvBYcQM9re1Pqw40Oyl6PHQRIXTDfv8K5
         L24tFFB08pNEjgNEadoyTumF81K8KIofA+49ad0HBONNSIUIM+8qARqAZmp0gmumIH65
         VOaAR4x+U4CWnNbootGaHbBriMcOaXmjK3NoyyU9r8wcnqM+mf4yvJnixVAEUjVBY3vw
         KnTQIGS0uZ8L4VN7VouhsIxtBA84cbUvwxzlddcx/KZ6Q2EW9SrkBUwRuctndNz4tQOI
         /CrXAE4f2v3a+CHuQFGRzz3D9DalxcVC/2HUIyOemg1X4e4ixgHsmhbgEXZF/1fTYZCW
         60mw==
X-Forwarded-Encrypted: i=1; AJvYcCUKPYt4Ud1jLz1POguspO7v+lC2HCNqxFky0KImfgctHsCP3d1oErMNskBNtXdfe+ETCWdO4kFVFt0TUQ==@linaro.org
X-Gm-Message-State: AOJu0YzhIvmz0oJ4CEDnwBg8aJzw1xIHcdCmC6MZw+5D2QC4IcwD7i4D
	xzekFE6v0o/FAEGeNJpscn4kWibDb3Flmna3HA438xy1oelDbOa77eWaF3m6l/nYYw==
X-Gm-Gg: ASbGncvEDuNQtfRi956bDAXb4fll0OefElntCMp0vnRFOrjbN6Mrx/R+WdXbf0fQFL8
	7bUg5K9yLsiTmFd7WdRHROTt3z9yCxEOzrliHTbgAy5p4pKmurz6tEFTj5//yEr84MPeZWNggc6
	MKE6i0N3PZ8+H5XOpeXfQ60QAY3YJMVoUosN4lqAXZN2nlkdAzGo/u75BGmT2cLrkvlpfP7oiy4
	lXkOgjBmK7tU7JtLwv/Ulbkeh24Jvh7Z4R37lGHvE0vEp1GvDdQ/eqfkRY9PAysS9+vHcoBtjVO
	JBZOjZ2aKtIgmXhg4dDeey3PBT0vW2GxGOpc/H9chWN4LwMp7faSdvw=
X-Google-Smtp-Source: AGHT+IGYKHSOUWuv3Z35/L1kDcj+xko6P82ABEfwOu6IFt4mwFRNrLSNCMYz6YlSXtAKxKsobnoAmQ==
X-Received: by 2002:a05:600c:46ca:b0:434:a367:2bd9 with SMTP id 5b1f17b1804b1-438913dfd7fmr310320675e9.14.1737675901922;
        Thu, 23 Jan 2025 15:45:01 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd54c0ecsm6510925e9.30.2025.01.23.15.44.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 23 Jan 2025 15:45:00 -0800 (PST)
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
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 08/20] accel/tcg: Restrict tlb_init() / destroy() to TCG
Date: Fri, 24 Jan 2025 00:44:02 +0100
Message-ID: <20250123234415.59850-9-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250123234415.59850-1-philmd@linaro.org>
References: <20250123234415.59850-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: j7EGNsEFGYyx

Move CPU TLB related methods to accel/tcg/ scope,
in "internal-common.h".

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/tcg/internal-common.h | 11 +++++++++++
 include/exec/exec-all.h     | 16 ----------------
 accel/tcg/user-exec-stub.c  | 11 +++++++++++
 3 files changed, 22 insertions(+), 16 deletions(-)

diff --git a/accel/tcg/internal-common.h b/accel/tcg/internal-common.h
index c8d714256cb..d3186721839 100644
--- a/accel/tcg/internal-common.h
+++ b/accel/tcg/internal-common.h
@@ -53,6 +53,17 @@ TranslationBlock *tb_link_page(TranslationBlock *tb);
 void cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
                                uintptr_t host_pc);
 
+/**
+ * tlb_init - initialize a CPU's TLB
+ * @cpu: CPU whose TLB should be initialized
+ */
+void tlb_init(CPUState *cpu);
+/**
+ * tlb_destroy - destroy a CPU's TLB
+ * @cpu: CPU whose TLB should be destroyed
+ */
+void tlb_destroy(CPUState *cpu);
+
 bool tcg_exec_realizefn(CPUState *cpu, Error **errp);
 void tcg_exec_unrealizefn(CPUState *cpu);
 
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index d9045c9ac4c..8eb0df48f94 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -29,16 +29,6 @@
 
 #if !defined(CONFIG_USER_ONLY) && defined(CONFIG_TCG)
 /* cputlb.c */
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
@@ -223,12 +213,6 @@ void tlb_set_page(CPUState *cpu, vaddr addr,
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
diff --git a/accel/tcg/user-exec-stub.c b/accel/tcg/user-exec-stub.c
index 4fbe2dbdc88..1d52f48226a 100644
--- a/accel/tcg/user-exec-stub.c
+++ b/accel/tcg/user-exec-stub.c
@@ -1,6 +1,7 @@
 #include "qemu/osdep.h"
 #include "hw/core/cpu.h"
 #include "exec/replay-core.h"
+#include "internal-common.h"
 
 void cpu_resume(CPUState *cpu)
 {
@@ -18,6 +19,16 @@ void cpu_exec_reset_hold(CPUState *cpu)
 {
 }
 
+/* User mode emulation does not support softmmu yet.  */
+
+void tlb_init(CPUState *cpu)
+{
+}
+
+void tlb_destroy(CPUState *cpu)
+{
+}
+
 /* User mode emulation does not support record/replay yet.  */
 
 bool replay_exception(void)
-- 
2.47.1
