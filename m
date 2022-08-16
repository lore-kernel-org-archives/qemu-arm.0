Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp2008847ejf;
        Tue, 16 Aug 2022 13:34:14 -0700 (PDT)
X-Received: by 2002:a05:6808:14d1:b0:344:ee32:f7f6 with SMTP id f17-20020a05680814d100b00344ee32f7f6mr126456oiw.291.1660682054709;
        Tue, 16 Aug 2022 13:34:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660682054; cv=none;
        d=google.com; s=arc-20160816;
        b=R67ktJnK3Kl92WO1947Vr+ZcdtsheFkECcwKvnCOIi/iQpEWTyXrqNcRhRsIc2RSPt
         v7lBRzYuWbU0YF6vG9YJszbkTM4OT1qyAlCSeY/cWdcA7M27vauKe65i9GJ/KdxO9OMK
         ljsN2+M6/JqKGhsQXaqMXhv0hK/yHg8pjzWzUggV3OmsUlJCqw+ZZaXjpD2IIWk1Rl7W
         WzoHUpv1seAmiU8qs5vLdXV59rwvxLECU+6ppp6worlavEO/5FxvqhCeRYp+1xq5XIO8
         VmJzyx3BImLcIp6wc01mV9fhMNAlcV/lMU6MdFhc0uozQCFmoSVNzPO/vpN/HqNA/ia1
         hiLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=WyS1AkJjXgcx++s5EL+CHkdS52eWUfbVT52gpN5EMKs=;
        b=X5o40TNVowGJLsS2kSsq8zllpQjqJgeQWbhw/vdBgg5Lxie8tuBaeAch59EIZ9IqEK
         ao3pdVoTJGkC0DLI9L/v3cNLt2JOufKzBB9ZpKZ6xQbDsMOmwcLXJUgBkw15Z8D3PiPh
         ikwH12xBaiPSvkpSHZYsNvj7S+cLCuKIPreWz3iFmD/TCPHSw+IOG2vYg9rpce/o81Qc
         UoF5SYumUKxj14fAbhzh7HYT6sHbc/IQY0uomQRQLJWzWugyDHJa+rVZgf/3WGW6j+ub
         zx0DhXCFwietftGmcKbRtfJOKWCQE9+OjxvAvuY3b14xPdpIeXOXb/tNOZlnTgwl9iFd
         /UIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Kqw28FrA;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id gb13-20020a056870670d00b0010eb9103cfbsor2284516oab.133.2022.08.16.13.34.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 16 Aug 2022 13:34:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Kqw28FrA;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=WyS1AkJjXgcx++s5EL+CHkdS52eWUfbVT52gpN5EMKs=;
        b=Kqw28FrA0Ip0ok8/Z7eWT12WmrIOGLZ5XZmdEpFDDAOcAadGlugvqRahSfeIgGVMwk
         h34e2u0lkHX6DdBb/bYepYbsyxcSlYEgtQh7g/MC8q9OJsTnuD2QW0dkgvM0B6DO85Pp
         ziGgWUeWx/tldYbEKDgz9WjL7F+3IIRVOfP+k32GBsxeQ+9gRFkjE4pNOypVbieF6Etm
         oAM2XdGc4HLeRn2hJJO9DRRhNkTT347ZaG9sNebJjaGsn2cDKo0ms/CsOwnvrE3HEQ3Z
         tw7u/cQW5K6efJyoOv9abF+P1/6UjMRP0jf75RIhkMxixuILMhYfmElg2lc4sIFbW5bW
         +Ntw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=WyS1AkJjXgcx++s5EL+CHkdS52eWUfbVT52gpN5EMKs=;
        b=wX70pvkA89Ip95BoOW4s3wgx3FkBnuQBlKRBOJJE9CcLfkkCpSoBQOyYvP2Fe33dtg
         VhrPqAkuZkzTvVVXPpoS1i+zNlr85+0qBaL2SP4wotgFz/Fc2DlCbhGHxpsHyiPojLas
         /kOEZQVhmRwrX+odqzodUKXc6jaSjCZQTkYK+G/50AKBIoO/PAGWm7eCDbSDH6K+OmEs
         /gnMAWGkZpIECLWxl7GlGaej//hQNhpOSCJD2IidbvlG/c4K4i/QOGeGKTtB3a+cMBCw
         hOmx015EPOsDclHrPmgYhcx3Fq069JXeCja8boWXWi56mGQCJDgXp/4HCegFIn9rzi+w
         y/Zg==
X-Gm-Message-State: ACgBeo2F8jT67ZWudmuM7YKBT5tIYY7BlZPHhDIGoujrcRD/8jy19AYo
	JCrN4lFuHUyeHhn9MdQhBvU1s8ZQmx6KwL2J
X-Google-Smtp-Source: AA6agR4hkNt+pCgF09LJ7PMSN3/gMZvx0A/Qd1eQrylUVbCZwohIr13taCR/x5PwX3yfn0Pgu1X8dQ==
X-Received: by 2002:a05:6870:e2ca:b0:10e:6f87:baa with SMTP id w10-20020a056870e2ca00b0010e6f870baamr164238oad.58.1660682054340;
        Tue, 16 Aug 2022 13:34:14 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([2605:ef80:80f6:61fa:9bc2:5095:d612:5e22])
        by smtp.gmail.com with ESMTPSA id y23-20020a056870b01700b0010ef8ccde67sm2285220oae.13.2022.08.16.13.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 13:34:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	iii@linux.ibm.com
Subject: [PATCH v2 04/33] linux-user: Honor PT_GNU_STACK
Date: Tue, 16 Aug 2022 15:33:31 -0500
Message-Id: <20220816203400.161187-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220816203400.161187-1-richard.henderson@linaro.org>
References: <20220816203400.161187-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: BVeS+6gW91eY

Map the stack executable if required by default or on demand.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/elf.h        |  1 +
 linux-user/qemu.h    |  1 +
 linux-user/elfload.c | 19 ++++++++++++++++++-
 3 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/include/elf.h b/include/elf.h
index 3a4bcb646a..3d6b9062c0 100644
--- a/include/elf.h
+++ b/include/elf.h
@@ -31,6 +31,7 @@ typedef int64_t  Elf64_Sxword;
 #define PT_LOPROC  0x70000000
 #define PT_HIPROC  0x7fffffff
 
+#define PT_GNU_STACK      (PT_LOOS + 0x474e551)
 #define PT_GNU_PROPERTY   (PT_LOOS + 0x474e553)
 
 #define PT_MIPS_REGINFO   0x70000000
diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 7d90de1b15..e2e93fbd1d 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -48,6 +48,7 @@ struct image_info {
         uint32_t        elf_flags;
         int             personality;
         abi_ulong       alignment;
+        bool            exec_stack;
 
         /* Generic semihosting knows about these pointers. */
         abi_ulong       arg_strings;   /* strings for argv */
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index d783240a36..050cd1fa08 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -233,6 +233,7 @@ static bool init_guest_commpage(void)
 #define ELF_ARCH        EM_386
 
 #define ELF_PLATFORM get_elf_platform()
+#define EXSTACK_DEFAULT true
 
 static const char *get_elf_platform(void)
 {
@@ -309,6 +310,7 @@ static void elf_core_copy_regs(target_elf_gregset_t *regs, const CPUX86State *en
 
 #define ELF_ARCH        EM_ARM
 #define ELF_CLASS       ELFCLASS32
+#define EXSTACK_DEFAULT true
 
 static inline void init_thread(struct target_pt_regs *regs,
                                struct image_info *infop)
@@ -777,6 +779,7 @@ static inline void init_thread(struct target_pt_regs *regs,
 #else
 
 #define ELF_CLASS       ELFCLASS32
+#define EXSTACK_DEFAULT true
 
 #endif
 
@@ -974,6 +977,7 @@ static void elf_core_copy_regs(target_elf_gregset_t *regs, const CPUPPCState *en
 
 #define ELF_CLASS   ELFCLASS64
 #define ELF_ARCH    EM_LOONGARCH
+#define EXSTACK_DEFAULT true
 
 #define elf_check_arch(x) ((x) == EM_LOONGARCH)
 
@@ -1069,6 +1073,7 @@ static uint32_t get_elf_hwcap(void)
 #define ELF_CLASS   ELFCLASS32
 #endif
 #define ELF_ARCH    EM_MIPS
+#define EXSTACK_DEFAULT true
 
 #ifdef TARGET_ABI_MIPSN32
 #define elf_check_abi(x) ((x) & EF_MIPS_ABI2)
@@ -1807,6 +1812,10 @@ static inline void init_thread(struct target_pt_regs *regs,
 #define bswaptls(ptr) bswap32s(ptr)
 #endif
 
+#ifndef EXSTACK_DEFAULT
+#define EXSTACK_DEFAULT false
+#endif
+
 #include "elf.h"
 
 /* We must delay the following stanzas until after "elf.h". */
@@ -2082,6 +2091,7 @@ static abi_ulong setup_arg_pages(struct linux_binprm *bprm,
                                  struct image_info *info)
 {
     abi_ulong size, error, guard;
+    int prot;
 
     size = guest_stack_size;
     if (size < STACK_LOWER_LIMIT) {
@@ -2092,7 +2102,11 @@ static abi_ulong setup_arg_pages(struct linux_binprm *bprm,
         guard = qemu_real_host_page_size();
     }
 
-    error = target_mmap(0, size + guard, PROT_READ | PROT_WRITE,
+    prot = PROT_READ | PROT_WRITE;
+    if (info->exec_stack) {
+        prot |= PROT_EXEC;
+    }
+    error = target_mmap(0, size + guard, prot,
                         MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
     if (error == -1) {
         perror("mmap stack");
@@ -2920,6 +2934,7 @@ static void load_elf_image(const char *image_name, int image_fd,
      */
     loaddr = -1, hiaddr = 0;
     info->alignment = 0;
+    info->exec_stack = EXSTACK_DEFAULT;
     for (i = 0; i < ehdr->e_phnum; ++i) {
         struct elf_phdr *eppnt = phdr + i;
         if (eppnt->p_type == PT_LOAD) {
@@ -2962,6 +2977,8 @@ static void load_elf_image(const char *image_name, int image_fd,
             if (!parse_elf_properties(image_fd, info, eppnt, bprm_buf, &err)) {
                 goto exit_errmsg;
             }
+        } else if (eppnt->p_type == PT_GNU_STACK) {
+            info->exec_stack = eppnt->p_flags & PF_X;
         }
     }
 
-- 
2.34.1
