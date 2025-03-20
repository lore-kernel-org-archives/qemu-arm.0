Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp1278856njc;
        Thu, 20 Mar 2025 15:30:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWjDxuMzK2wDQOTOfkosp8Ie8HtydYZGFgHSYemJWHU99lwQ4kjF0tGDpOSPs+GbgWQRTo/rXk/07ISjA==@linaro.org
X-Received: by 2002:a17:903:2346:b0:224:5a8:ba2c with SMTP id d9443c01a7336-22780e1a5a7mr12049795ad.52.1742509815568;
        Thu, 20 Mar 2025 15:30:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742509815; cv=none;
        d=google.com; s=arc-20240605;
        b=fSKV13WWwAwTqeGRNyzF3lWFzyI7A28Y7fni153RVVKa0Z3o97etRVP2rpd7mDcGxB
         kUbgZ5Fv6UItoI535Ao1gnV1vpOPiTWQqupDVQbmGumoi074DyWWKzGYOdp485i0uN2R
         uKULkgTV2ZBb6/98NJkzKSDAAZhE/0lXMIQh4JKrFzH6zvTk+0Eh+YxMgqySusQwKdNc
         h2O5fDtJzTUM7//bvvTtr+3eTL2ufZWM8yjCM1GFLJvIBeaOXfo4QWFClvEyndpZV+1C
         dtn1oHXju4qDFZS+Yf2CYkNg9Jnb+4h/npDZGC7J9j7uLLd19m5wmdrO7geQ4cA0c8Y1
         7fGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=EUQWJa8M2i9P17T56WC7L1ajUU3UpMhiv0rwi6K2NYA=;
        fh=XzttYYYyHCN54xxM6BVa1an9UitOmP2hVoEXW5XSE6M=;
        b=OFzpnumt2eRsMtx7LE273cAV7kQpzXeeqbaxIcKwnRZnvKBBScIY4XGtN3DoCZGCwE
         RCpF0Pph0vSeH8kacKwkrEMOuc5CUXnxyfCsoMs+0YkES5WopPENMPOEKFEls2WzG+QW
         mshscsYoG4P4iQiTeooHnirceJk89qNFX0krtNjQzdMBBZ1B1eMBY0konDFJ5Y+Qfg/A
         XWlnkN5/ZdKsQJ5rH0NEgAjcBmO7BTchzUm6d/b1RTHe/B1YcqSeLfReEWFogT1OiCNZ
         to39BJHUaab4pCneQdbs8emMyU4a4PpeIC9Y3PYpgkQcalgTKmU8XnBmkTqcBXwig1e/
         F/iA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Mw2ddi2h;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22780f1c0cdsor4113085ad.2.2025.03.20.15.30.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 20 Mar 2025 15:30:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Mw2ddi2h;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742509815; x=1743114615; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EUQWJa8M2i9P17T56WC7L1ajUU3UpMhiv0rwi6K2NYA=;
        b=Mw2ddi2hoI0IndrCMGlcO8FZNv0RQEYPQIr1ql2mSHa4fZEplrmxylMXHhKvmUNjeb
         puOWUCawFksIlkXImglHMCeJHlQidbZnKlj7DIYeQVUA6ERj9vCc2LsWewa/hvKEr+OV
         fur944Y3I+Fl3SJ1YtWN0V+q3aAj/nT4+FiEx07GjC2MD6A+bp+OWlolhjUF65TwnQje
         yuyArwr2YkjnsKNOxeNZ2uaXU24671MARCXLINggI2XqsfP/N+h64W8tG4ZsjqcpZlZO
         pOtf68i5/80x31BiZpfu86Z58hFRcCY9DpbNRi6A1deFDstmDrTPy6HDRZ5zO2imWYNm
         t99g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742509815; x=1743114615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EUQWJa8M2i9P17T56WC7L1ajUU3UpMhiv0rwi6K2NYA=;
        b=PGSgON+ZUKgD9Q6gVqS3ZDRCiQT0aOovwjhCJweRj0g4YnLWgQK6qsUJl3LzeaiSaE
         pKdwLmv91M7LHrZNkPAe+hpik5ii9HJ8l/oorSQBH4Suo+FFnJBlDWNHTjkRw2yrPjsJ
         r87QxObYiKC+2dySZRXblsr6fMgaNXS6Axs7U5Hmi2tWi1bV1pOfC8CjfquiHwU8hyYh
         gBmkOodtALb9Z28GHxyBrMGFcVP0vt7Zg/pK7GCB32/3vkipVW5FqfIctyYQd58shkVd
         7EUD6dqg454HnBvcQGbhoUaGXYO43N10XqynYnXmUN0HhpDTkNRak5RHzR/k4mS6vjK2
         hmuw==
X-Forwarded-Encrypted: i=1; AJvYcCVZWI/Z2XABXXZKiNh+gfUZ1Ip9bFZ6usVdcg3oLeNq9mz7YS8JdWyxJZPLIzNkrvpOuPgmMKKSTRUOig==@linaro.org
X-Gm-Message-State: AOJu0Yz2KIPScnTb9rCa2gHnGXLG/wGmFuySmAdyix5smjMgf7L3fjCt
	mxKC40/rPq9+llTIpbygEnKxb/8F8LiXtZnfdKbdxQIXlRFytyZ7Z1Sfgp8EOd6gWw==
X-Gm-Gg: ASbGncuS29V2+tpr56ZIRqGW+/QxSA1qcu428M2RQgTeZA5peZ4tmA19otDMJ6K3lzr
	AiLql1fFBMRqTDUxauoJNML+bh/DFSTl49YAQemX5oGZYwVnDlbbmy1bSKpuNb8Zshub8eq6F5c
	i3vTAQXWvefAPBfghAgtX5nbgm9c2exdVKtkNRs37x6SQcm7oMcJTqqHmxbK1/cQVUUL3qiERaJ
	kSSpmqI+oKa9sBTdWinL2ORyPISTmKmJXdbSEz7WiJh26F9qZv6twmDwXBcdQjmK+2llIBaRhlh
	EaC5uxPD3Q1U7XShzwQi6rTkGw75ar+akhG0pS+UUEg2
X-Google-Smtp-Source: AGHT+IH6ZvqlVmR/vgYitM0gTW8xnrCBbOkByuhosGlG4c0RqGsCkRYzWH0d/KpBtFj4JuB9Fwyv6A==
X-Received: by 2002:a17:902:f20c:b0:224:256e:5e3f with SMTP id d9443c01a7336-22780d8370amr16464875ad.25.1742509815082;
        Thu, 20 Mar 2025 15:30:15 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f4581csm3370145ad.59.2025.03.20.15.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 15:30:11 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 01/30] exec/cpu-all: remove BSWAP_NEEDED
Date: Thu, 20 Mar 2025 15:29:33 -0700
Message-Id: <20250320223002.2915728-2-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: N3pov/or23E2

This identifier is poisoned, so it can't be used from common code
anyway. We replace all occurrences with its definition directly.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/cpu-all.h    | 12 ------------
 linux-user/syscall_defs.h |  2 +-
 bsd-user/elfload.c        |  6 +++---
 hw/ppc/mac_newworld.c     |  4 +---
 hw/ppc/mac_oldworld.c     |  4 +---
 hw/sparc/sun4m.c          |  6 +-----
 hw/sparc64/sun4u.c        |  6 +-----
 linux-user/elfload.c      |  8 ++++----
 8 files changed, 12 insertions(+), 36 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 981a08e3bb3..013fcc9412a 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -28,18 +28,6 @@
 #include "system/memory.h"
 #endif
 
-/* some important defines:
- *
- * HOST_BIG_ENDIAN : whether the host cpu is big endian and
- * otherwise little endian.
- *
- * TARGET_BIG_ENDIAN : same for the target cpu
- */
-
-#if HOST_BIG_ENDIAN != TARGET_BIG_ENDIAN
-#define BSWAP_NEEDED
-#endif
-
 /* page related stuff */
 #include "exec/cpu-defs.h"
 #include "exec/target_page.h"
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 86d773add75..5d227599924 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -462,7 +462,7 @@ typedef struct {
     abi_ulong sig[TARGET_NSIG_WORDS];
 } target_sigset_t;
 
-#ifdef BSWAP_NEEDED
+#if HOST_BIG_ENDIAN != TARGET_BIG_ENDIAN
 static inline void tswap_sigset(target_sigset_t *d, const target_sigset_t *s)
 {
     int i;
diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
index 833fa3bd057..3bca0cc9ede 100644
--- a/bsd-user/elfload.c
+++ b/bsd-user/elfload.c
@@ -44,7 +44,7 @@ static inline void memcpy_fromfs(void *to, const void *from, unsigned long n)
     memcpy(to, from, n);
 }
 
-#ifdef BSWAP_NEEDED
+#if HOST_BIG_ENDIAN != TARGET_BIG_ENDIAN
 static void bswap_ehdr(struct elfhdr *ehdr)
 {
     bswap16s(&ehdr->e_type);            /* Object file type */
@@ -111,7 +111,7 @@ static void bswap_note(struct elf_note *en)
     bswap32s(&en->n_type);
 }
 
-#else /* ! BSWAP_NEEDED */
+#else
 
 static void bswap_ehdr(struct elfhdr *ehdr) { }
 static void bswap_phdr(struct elf_phdr *phdr, int phnum) { }
@@ -119,7 +119,7 @@ static void bswap_shdr(struct elf_shdr *shdr, int shnum) { }
 static void bswap_sym(struct elf_sym *sym) { }
 static void bswap_note(struct elf_note *en) { }
 
-#endif /* ! BSWAP_NEEDED */
+#endif /* HOST_BIG_ENDIAN != TARGET_BIG_ENDIAN */
 
 #include "elfcore.c"
 
diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index cb3dc3ab482..624c2731a65 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -199,9 +199,7 @@ static void ppc_core99_init(MachineState *machine)
     if (machine->kernel_filename) {
         int bswap_needed = 0;
 
-#ifdef BSWAP_NEEDED
-        bswap_needed = 1;
-#endif
+        bswap_needed = HOST_BIG_ENDIAN != TARGET_BIG_ENDIAN;
         kernel_base = KERNEL_LOAD_ADDR;
         kernel_size = load_elf(machine->kernel_filename, NULL,
                                translate_kernel_address, NULL, NULL, NULL,
diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index 0dbcea035c3..439953fc29e 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -155,9 +155,7 @@ static void ppc_heathrow_init(MachineState *machine)
     if (machine->kernel_filename) {
         int bswap_needed = 0;
 
-#ifdef BSWAP_NEEDED
-        bswap_needed = 1;
-#endif
+        bswap_needed = HOST_BIG_ENDIAN != TARGET_BIG_ENDIAN;
         kernel_base = KERNEL_LOAD_ADDR;
         kernel_size = load_elf(machine->kernel_filename, NULL,
                                translate_kernel_address, NULL, NULL, NULL,
diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index a48d3622c5a..d27a9b693a5 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -235,11 +235,7 @@ static unsigned long sun4m_load_kernel(const char *kernel_filename,
     if (linux_boot) {
         int bswap_needed;
 
-#ifdef BSWAP_NEEDED
-        bswap_needed = 1;
-#else
-        bswap_needed = 0;
-#endif
+        bswap_needed = HOST_BIG_ENDIAN != TARGET_BIG_ENDIAN;
         kernel_size = load_elf(kernel_filename, NULL,
                                translate_kernel_address, NULL,
                                NULL, NULL, NULL, NULL,
diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index 8ab5cf0461f..c7bccf584e6 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -170,11 +170,7 @@ static uint64_t sun4u_load_kernel(const char *kernel_filename,
     if (linux_boot) {
         int bswap_needed;
 
-#ifdef BSWAP_NEEDED
-        bswap_needed = 1;
-#else
-        bswap_needed = 0;
-#endif
+        bswap_needed = HOST_BIG_ENDIAN != TARGET_BIG_ENDIAN;
         kernel_size = load_elf(kernel_filename, NULL, NULL, NULL, kernel_entry,
                                kernel_addr, &kernel_top, NULL,
                                ELFDATA2MSB, EM_SPARCV9, 0, 0);
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index f54054dce3d..99811af5e7b 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2122,7 +2122,7 @@ static inline void memcpy_fromfs(void * to, const void * from, unsigned long n)
     memcpy(to, from, n);
 }
 
-#ifdef BSWAP_NEEDED
+#if HOST_BIG_ENDIAN != TARGET_BIG_ENDIAN
 static void bswap_ehdr(struct elfhdr *ehdr)
 {
     bswap16s(&ehdr->e_type);            /* Object file type */
@@ -3144,7 +3144,7 @@ static bool parse_elf_properties(const ImageSource *src,
      * The contents of a valid PT_GNU_PROPERTY is a sequence of uint32_t.
      * Swap most of them now, beyond the header and namesz.
      */
-#ifdef BSWAP_NEEDED
+#if HOST_BIG_ENDIAN != TARGET_BIG_ENDIAN
     for (int i = 4; i < n / 4; i++) {
         bswap32s(note.data + i);
     }
@@ -4000,7 +4000,7 @@ struct target_elf_prpsinfo {
     char    pr_psargs[ELF_PRARGSZ]; /* initial part of arg list */
 };
 
-#ifdef BSWAP_NEEDED
+#if HOST_BIG_ENDIAN != TARGET_BIG_ENDIAN
 static void bswap_prstatus(struct target_elf_prstatus *prstatus)
 {
     prstatus->pr_info.si_signo = tswap32(prstatus->pr_info.si_signo);
@@ -4039,7 +4039,7 @@ static void bswap_note(struct elf_note *en)
 static inline void bswap_prstatus(struct target_elf_prstatus *p) { }
 static inline void bswap_psinfo(struct target_elf_prpsinfo *p) {}
 static inline void bswap_note(struct elf_note *en) { }
-#endif /* BSWAP_NEEDED */
+#endif /* HOST_BIG_ENDIAN != TARGET_BIG_ENDIAN */
 
 /*
  * Calculate file (dump) size of given memory region.
-- 
2.39.5
