Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp2008963ejf;
        Tue, 16 Aug 2022 13:34:31 -0700 (PDT)
X-Received: by 2002:aca:b543:0:b0:33a:cd04:d1a6 with SMTP id e64-20020acab543000000b0033acd04d1a6mr166346oif.40.1660682071249;
        Tue, 16 Aug 2022 13:34:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660682071; cv=none;
        d=google.com; s=arc-20160816;
        b=C9XDqpbuRoYhxN7ZdlbmuPGy9xHrvTcUOLnEPU6071AdkDgFyEDFPiL6qgz7KYmyNj
         KNF5wnmMowbVDUtAmReODNcMT0CI0EC9UZA96FG775jLf93uAF3ASsUCYYHr/ViwLwmu
         TTsFmPOG9hG8VkiN48BiPthzhAIvICHqO0oOP61mN7pv9z8P9oJzOzcXH4Rwm0VJ5vmR
         PU+QPkGCwZxE/7jtSqO//EGeKEC4uyTV6lQwzi6WT+4gMc+7opKMP8jjgN6ugyiwwqWr
         VgXzTgSmThe0sob0VdV73p+13oeUg4gbXDnTni2bc5NpOU/TJN+SjOaH/G9dUafm1+lk
         NU4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=xPtGK6M1TngwtnTnZLI8rBr9bzgA002Z+efjpC+i5Pw=;
        b=e66JKHQW7kD9/HD6m1HWrWCqdQdrhsK1aamBOplgP8DEAYBA6DHAiSKavsglPldN9y
         8nl303tzitlA5A1Zik5oi/R4NnRyNEwl45gKgTWmogaO1YafJoNziGTz12/LL2xF3tt6
         7zK6Z7tdwv3REikymnmHf0gZw+RbtiVmp4ef5v0DvpmTYMNpQHU//3n5752EDfnCTNT3
         YoXHKmnF0gB3PxRV8VLld/U9F9yViSCZkLtHIGn8ktgZiP3m7cOVpKozk2pDY23VAen3
         Fz6X7BWo1sh5lqOag9j46nPLmlTj2Sbbzdd9OCTB0cIvBp8pbHlyPukH3rrdokDByTRb
         VEEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qQGCEfSA;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g9-20020a05687054c900b0010e77cc40c3sor2228006oan.157.2022.08.16.13.34.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 16 Aug 2022 13:34:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qQGCEfSA;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=xPtGK6M1TngwtnTnZLI8rBr9bzgA002Z+efjpC+i5Pw=;
        b=qQGCEfSA2luztTiUGltj5LI3sMJBNu5jpnl++hvLA+vRy9fXkVyCKHl1J1P6hepkrQ
         uBVc+XQSG/6k9LdHw2rbA9GetJb78HTGL08tqimlp0AwkGDl5q5P7nv2ndqXJdqtNYxG
         fG6zxOr0RDhO5ArOLvf4wMjL7ZC8KlzwiQ8tqAHPuMBLIUgs39O2iCH+ch9C1p5HbOF8
         5WmeehX5RJp4Yl1HcKP5x7zrokjtJF3h1yxxbI9oS+0d/vUbiT3QfXpjt47BvryyIgcA
         nKRFllLoqPeX9rW0x0YUq2sDr5pX+4u2sO6i2dYA1wE3NVbKxylhufTNNNvfvZAvXd/t
         ZeHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=xPtGK6M1TngwtnTnZLI8rBr9bzgA002Z+efjpC+i5Pw=;
        b=mF17MUiOXpSHT4Z8cW9t9hus6p2by2cPhaNN5ZsdOLpHlT69qAzUFAnTS46F8IV0si
         wkUHRYlB+qSpxL61iQyAF24YelbpUKZRF+Zw65RX5VrnD2i05Fr3mfYUgZ7ikJ/MkZVn
         JhOetRUARYizOR+cT8Ng6/YcpOOO9bZvxlSVP+o/G2AjbkMgAdoctvCl7OMIF/8/OW+Z
         67I4aIgknk5Yy7G2b2ZYi478M9Vx/xnw7XLEDhgcEA2djRnNXPSM0Cb/AnB6DfRPpwVd
         TGLEEsZSF972XSZLgwUR9JIaY/nfdwqp6O61Qmnvvwbjk8RJI49fuqG2NoB7SOzKV5y0
         mwyg==
X-Gm-Message-State: ACgBeo0SeP6qVNIw8h5JiFRBSgGv8unvcwSlTjNnOYlyeXFdmJie24is
	9PksmGgt4vNXBEJIvfolpmedhDuh
X-Google-Smtp-Source: AA6agR7lBjemUM0YP1kaEWffm0xRqKvNJQ+J8f5q3yQHE8JaO2/2XGuVeoc9gC84rucAxDZnLKyBcg==
X-Received: by 2002:a05:6870:4214:b0:10b:be93:47 with SMTP id u20-20020a056870421400b0010bbe930047mr156941oac.276.1660682070819;
        Tue, 16 Aug 2022 13:34:30 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([2605:ef80:80f6:61fa:9bc2:5095:d612:5e22])
        by smtp.gmail.com with ESMTPSA id y23-20020a056870b01700b0010ef8ccde67sm2285220oae.13.2022.08.16.13.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 13:34:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	iii@linux.ibm.com
Subject: [PATCH v2 10/33] accel/tcg: Properly implement get_page_addr_code for user-only
Date: Tue, 16 Aug 2022 15:33:37 -0500
Message-Id: <20220816203400.161187-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220816203400.161187-1-richard.henderson@linaro.org>
References: <20220816203400.161187-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 02lzKO/RB1m5

The current implementation is a no-op, simply returning addr.
This is incorrect, because we ought to be checking the page
permissions for execution.

Make get_page_addr_code inline for both implementations.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h | 85 ++++++++++++++---------------------------
 accel/tcg/cputlb.c      |  5 ---
 accel/tcg/user-exec.c   | 15 ++++++++
 3 files changed, 43 insertions(+), 62 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index e7e30d55b8..9f35e3b7a9 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -595,43 +595,44 @@ struct MemoryRegionSection *iotlb_to_section(CPUState *cpu,
                                              hwaddr index, MemTxAttrs attrs);
 #endif
 
-#if defined(CONFIG_USER_ONLY)
-void mmap_lock(void);
-void mmap_unlock(void);
-bool have_mmap_lock(void);
-
 /**
- * get_page_addr_code() - user-mode version
+ * get_page_addr_code_hostp()
  * @env: CPUArchState
  * @addr: guest virtual address of guest code
  *
- * Returns @addr.
+ * See get_page_addr_code() (full-system version) for documentation on the
+ * return value.
+ *
+ * Sets *@hostp (when @hostp is non-NULL) as follows.
+ * If the return value is -1, sets *@hostp to NULL. Otherwise, sets *@hostp
+ * to the host address where @addr's content is kept.
+ *
+ * Note: this function can trigger an exception.
+ */
+tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env, target_ulong addr,
+                                        void **hostp);
+
+/**
+ * get_page_addr_code()
+ * @env: CPUArchState
+ * @addr: guest virtual address of guest code
+ *
+ * If we cannot translate and execute from the entire RAM page, or if
+ * the region is not backed by RAM, returns -1. Otherwise, returns the
+ * ram_addr_t corresponding to the guest code at @addr.
+ *
+ * Note: this function can trigger an exception.
  */
 static inline tb_page_addr_t get_page_addr_code(CPUArchState *env,
                                                 target_ulong addr)
 {
-    return addr;
+    return get_page_addr_code_hostp(env, addr, NULL);
 }
 
-/**
- * get_page_addr_code_hostp() - user-mode version
- * @env: CPUArchState
- * @addr: guest virtual address of guest code
- *
- * Returns @addr.
- *
- * If @hostp is non-NULL, sets *@hostp to the host address where @addr's content
- * is kept.
- */
-static inline tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env,
-                                                      target_ulong addr,
-                                                      void **hostp)
-{
-    if (hostp) {
-        *hostp = g2h_untagged(addr);
-    }
-    return addr;
-}
+#if defined(CONFIG_USER_ONLY)
+void mmap_lock(void);
+void mmap_unlock(void);
+bool have_mmap_lock(void);
 
 /**
  * adjust_signal_pc:
@@ -688,36 +689,6 @@ G_NORETURN void cpu_loop_exit_sigbus(CPUState *cpu, target_ulong addr,
 static inline void mmap_lock(void) {}
 static inline void mmap_unlock(void) {}
 
-/**
- * get_page_addr_code() - full-system version
- * @env: CPUArchState
- * @addr: guest virtual address of guest code
- *
- * If we cannot translate and execute from the entire RAM page, or if
- * the region is not backed by RAM, returns -1. Otherwise, returns the
- * ram_addr_t corresponding to the guest code at @addr.
- *
- * Note: this function can trigger an exception.
- */
-tb_page_addr_t get_page_addr_code(CPUArchState *env, target_ulong addr);
-
-/**
- * get_page_addr_code_hostp() - full-system version
- * @env: CPUArchState
- * @addr: guest virtual address of guest code
- *
- * See get_page_addr_code() (full-system version) for documentation on the
- * return value.
- *
- * Sets *@hostp (when @hostp is non-NULL) as follows.
- * If the return value is -1, sets *@hostp to NULL. Otherwise, sets *@hostp
- * to the host address where @addr's content is kept.
- *
- * Note: this function can trigger an exception.
- */
-tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env, target_ulong addr,
-                                        void **hostp);
-
 void tlb_reset_dirty(CPUState *cpu, ram_addr_t start1, ram_addr_t length);
 void tlb_set_dirty(CPUState *cpu, target_ulong vaddr);
 
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 5db56bcd1e..80a3eb4f1c 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1532,11 +1532,6 @@ tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env, target_ulong addr,
     return qemu_ram_addr_from_host_nofail(p);
 }
 
-tb_page_addr_t get_page_addr_code(CPUArchState *env, target_ulong addr)
-{
-    return get_page_addr_code_hostp(env, addr, NULL);
-}
-
 static void notdirty_write(CPUState *cpu, vaddr mem_vaddr, unsigned size,
                            CPUIOTLBEntry *iotlbentry, uintptr_t retaddr)
 {
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 20ada5472b..a20234fb02 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -199,6 +199,21 @@ void *probe_access(CPUArchState *env, target_ulong addr, int size,
     return size ? g2h(env_cpu(env), addr) : NULL;
 }
 
+tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env, target_ulong addr,
+                                        void **hostp)
+{
+    int flags;
+
+    flags = probe_access_internal(env, addr, 1, MMU_INST_FETCH, true, 0);
+    if (unlikely(flags)) {
+        return -1;
+    }
+    if (hostp) {
+        *hostp = g2h_untagged(addr);
+    }
+    return addr;
+}
+
 /* The softmmu versions of these helpers are in cputlb.c.  */
 
 /*
-- 
2.34.1
