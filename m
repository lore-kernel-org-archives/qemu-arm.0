Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1781117lfa;
        Fri, 16 Oct 2020 11:42:27 -0700 (PDT)
X-Received: by 2002:a17:90b:3010:: with SMTP id hg16mr5102100pjb.21.1602873747469;
        Fri, 16 Oct 2020 11:42:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602873747; cv=none;
        d=google.com; s=arc-20160816;
        b=eDEypOFPeAsANGtZsTUo2Tw0TquUjVvQkCrCuVKrSlFblf8aK0UG6KHlhetAyJ3gX1
         T5IAMIg2RQSRRLL8cLz+co78nf90rIkjuQ5RIxihdcuyq2UUCVDZMPQxz2I8IhYfPM+o
         gMgv1UfyPbMMHoRYeY+Mr3saym0otmLS+4W56unBQ3ZzJvvTbbcP9pzDAUId32QPbREf
         z7DW3LuPSE2P+d70PeMm7fFSX81m3t1B+KvOdhQ4k0pkf1vxwzbinCgyAqAJ09yauqYV
         ZgmclzgZz5zfUlnCfKJ/lV92o18VJBSQYETm15F2+K5llS53DoIdiCq6qrGUr9o5FKcQ
         cjcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=kGZNmudBhXIU/a8gp/KXcyIKcPKoqtSco3EGBov+V2s=;
        b=Wt9CS6YNzf0pt2q4+dLKUXwqXxSLr1x1c8LNlBo+aAyNQdR87PIB27XmNKftcUQ9tI
         87V0y3Qt/ZNmb6c+wtmou4ONX2xCSv7FPs5MxeJr18Yj3OB9ZE9RyFjdNiR0AvVAXI66
         tmWC13Ch7uXBfI+HTeRaimXibX0thaUDosZCm+Pgb93sjIOfpk7xh2lR/MwX6tGBa1If
         1CxJRykgCcHSEML/UZhwYP2ZE0Y3kcK6PMIDSA5fSlRmBVK0fnkj908sABQCqQM4Hmmz
         9o3GlGiuYDAf/vpYQ1Vy3uDHYlJMx9d1n2v8DJuhZyR9i/y2Zzo12Ih96SgEdl6Prass
         ZLIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KkQnKXqA;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 16sor1490255pgr.86.2020.10.16.11.42.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 16 Oct 2020 11:42:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KkQnKXqA;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kGZNmudBhXIU/a8gp/KXcyIKcPKoqtSco3EGBov+V2s=;
        b=KkQnKXqAJpPxExziYSE5F6lME8UFZmYRo3UqCal0JjMWuckbI/lZHAC8pmcFSypTl+
         uhIjZaE880M8+3VY+bZKUFcRPyNrUjOeX41+kFLMx/zTklG0CeQFyz7nBAYtwn5X6gXk
         54yD+sIyPEXFmenJrYbpTeVYJgnCdqNwLLSPdFpn9haYsUmlsC50MTsUUwtYf/7SuAHX
         V61+yiOUGhMAGP3I0dgZvbN9alrs+rGCME2qG1YhCnCLPTna+kOUvqYqymGt9KFf6W9h
         NkmM/QExcb51nr1UqlE7Yd8qrY9/5fZciEtafXUA8WGadDId3yx807lpTkEO9n1TJCWi
         cKHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kGZNmudBhXIU/a8gp/KXcyIKcPKoqtSco3EGBov+V2s=;
        b=D1bjH596EKBGmnaM6V7hP+mRuqOrSoK5diYsupG3VEwoM5Is9MXccRCfPNn7w/IKUc
         J5HDETD8hYVbm+2kOkzduQ0uua0u/2miMhOQC9eDTN8f+uPy1L143bzqc/SKUqogIIa0
         6B/WKIbqKGt57R58fnM1UNacRAG/v9KcAWZgWxKughrz56KHL2XsU2VoFujc1VGUAwYc
         56kx6oB7JOMghLVbXeeaQGyWqDeJnsLSaA4GyENqvsdcOo+B+Kzyn/Egjot5o3U2VW4T
         sua/WVqdpUCIPmKmwTYIMm9MC47x71JVhVL7Gmwr3npksnGunqTBm88AUHsrOMay36lE
         +aHQ==
X-Gm-Message-State: AOAM530GruENbjZeJxIouO7nXcVaxCdkfiibFlw8+LtvFDwSb8305WeK
	EY/iofJiUUswA5ZKGosq74+e9dk7
X-Google-Smtp-Source: ABdhPJzJge76pwJCxGj0+2oKCY6gqJLt3HoWJfSHXqqmhMmb41blUIl6ptCFBqumAjGTeYLG67IKhA==
X-Received: by 2002:a63:e111:: with SMTP id z17mr4234127pgh.267.1602873746958;
        Fri, 16 Oct 2020 11:42:26 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain ([71.212.141.89])
        by smtp.gmail.com with ESMTPSA id c15sm3426011pgg.77.2020.10.16.11.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 11:42:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	laurent@vivier.eu
Subject: [PATCH v11 11/12] linux-user/elfload: Parse GNU_PROPERTY_AARCH64_FEATURE_1_AND
Date: Fri, 16 Oct 2020 11:42:06 -0700
Message-Id: <20201016184207.786698-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201016184207.786698-1-richard.henderson@linaro.org>
References: <20201016184207.786698-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: ZrF7MEUALAKa

Use the new generic support for NT_GNU_PROPERTY_TYPE_0.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v11: Split out aarch64 bits from generic patch.
---
 linux-user/elfload.c | 48 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 46 insertions(+), 2 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 428dcaa152..bf8c1bd253 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -1522,6 +1522,28 @@ static void elf_core_copy_regs(target_elf_gregset_t *regs,
 
 #include "elf.h"
 
+/* We must delay the following stanzas until after "elf.h". */
+#if defined(TARGET_AARCH64)
+
+static bool arch_parse_elf_property(uint32_t pr_type, uint32_t pr_datasz,
+                                    const uint32_t *data,
+                                    struct image_info *info,
+                                    Error **errp)
+{
+    if (pr_type == GNU_PROPERTY_AARCH64_FEATURE_1_AND) {
+        if (pr_datasz != sizeof(uint32_t)) {
+            error_setg(errp, "Ill-formed GNU_PROPERTY_AARCH64_FEATURE_1_AND");
+            return false;
+        }
+        /* We will extract GNU_PROPERTY_AARCH64_FEATURE_1_BTI later. */
+        info->note_flags = *data;
+    }
+    return true;
+}
+#define ARCH_USE_GNU_PROPERTY 1
+
+#else
+
 static bool arch_parse_elf_property(uint32_t pr_type, uint32_t pr_datasz,
                                     const uint32_t *data,
                                     struct image_info *info,
@@ -1531,6 +1553,8 @@ static bool arch_parse_elf_property(uint32_t pr_type, uint32_t pr_datasz,
 }
 #define ARCH_USE_GNU_PROPERTY 0
 
+#endif
+
 struct exec
 {
     unsigned int a_info;   /* Use macros N_MAGIC, etc for access */
@@ -2545,7 +2569,7 @@ static void load_elf_image(const char *image_name, int image_fd,
     struct elfhdr *ehdr = (struct elfhdr *)bprm_buf;
     struct elf_phdr *phdr;
     abi_ulong load_addr, load_bias, loaddr, hiaddr, error;
-    int i, retval;
+    int i, retval, prot_exec;
     Error *err = NULL;
 
     /* First of all, some simple consistency checks */
@@ -2712,6 +2736,26 @@ static void load_elf_image(const char *image_name, int image_fd,
     info->brk = 0;
     info->elf_flags = ehdr->e_flags;
 
+    prot_exec = PROT_EXEC;
+#ifdef TARGET_AARCH64
+    /*
+     * If the BTI feature is present, this indicates that the executable
+     * pages of the startup binary should be mapped with PROT_BTI, so that
+     * branch targets are enforced.
+     *
+     * The startup binary is either the interpreter or the static executable.
+     * The interpreter is responsible for all pages of a dynamic executable.
+     *
+     * Elf notes are backward compatible to older cpus.
+     * Do not enable BTI unless it is supported.
+     */
+    if ((info->note_flags & GNU_PROPERTY_AARCH64_FEATURE_1_BTI)
+        && (pinterp_name == NULL || *pinterp_name == 0)
+        && cpu_isar_feature(aa64_bti, ARM_CPU(thread_cpu))) {
+        prot_exec |= TARGET_PROT_BTI;
+    }
+#endif
+
     for (i = 0; i < ehdr->e_phnum; i++) {
         struct elf_phdr *eppnt = phdr + i;
         if (eppnt->p_type == PT_LOAD) {
@@ -2725,7 +2769,7 @@ static void load_elf_image(const char *image_name, int image_fd,
                 elf_prot |= PROT_WRITE;
             }
             if (eppnt->p_flags & PF_X) {
-                elf_prot |= PROT_EXEC;
+                elf_prot |= prot_exec;
             }
 
             vaddr = load_bias + eppnt->p_vaddr;
-- 
2.25.1
