Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1944734lfq;
        Fri, 2 Oct 2020 15:00:09 -0700 (PDT)
X-Received: by 2002:a05:6808:1cf:: with SMTP id x15mr2366629oic.164.1601676008913;
        Fri, 02 Oct 2020 15:00:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601676008; cv=none;
        d=google.com; s=arc-20160816;
        b=Grxx5Iz/M//gARVXmFnUmVnzMMj8a/lHQaQNPiBFlEa4lapOT0vcsd9AejSXx70Fiy
         XRCB2x875OlzGFegkjYI+PLuDC/q+lrFd91JBqtQwU5nu4mEpXy+00qmvr4m+2OGeJre
         vVqdO56fTHzBAGmGKdevAJs+Yyc6BwFrUk/VjhZLC8A3fHjabdenD04ZW23Bo+5Ayx8J
         3tMmpETIPSezQSjlZgjSrdsIhst8y8HUCrITlrOwcb6zRt7waUumyRV7rgNpfhS+h5fL
         aCRzOwdgpyWDfziSShE8U8QgG6Ljis8ZsUYQkbuxDLiXcXUZ330Uzq2USOZyXN8UugZw
         lpFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=UmXRKUbKgXmhfW+77FLjDFzejAZSQt8OzgtpBP6qGqY=;
        b=jGDUI6DCSy/NXanjxb/EkoQdXZXP0LLIqdD8jcymM0ycOHRvagkwFWTSDC/pF1f2B7
         S6dll5Fokft4kX5f2ykT5GMmkaKNyiJ7bmU0zi36JBuBriUPOpThDQj82U/z7ugOldAb
         evgWryq5n1g66JHqPj2AdbKauTC7kw1AvxWfvSbNtdV/JaLCII6U5IyyajN3I/p3m8mm
         WFj4XiLdVowuDAcp4THcpDkIApLSI2KeZ3jLaGOSpTMt1E/12gzs7r51mWf974lVB6UP
         Xy2nLV5XMRJJ5i7Y8SBhOqm+zmOgY5qsHaHXbZmBgqt8qdLAWwhaHLmZP6sfn31GxR+B
         tL+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BP9MX9Oc;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id k4sor616425otc.180.2020.10.02.15.00.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 02 Oct 2020 15:00:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BP9MX9Oc;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UmXRKUbKgXmhfW+77FLjDFzejAZSQt8OzgtpBP6qGqY=;
        b=BP9MX9OcYQH2u/z17O9RrczsPMQ4PpIEB8DQmSSOx1zKmX/5WSpt/Ojh4Y3NO7nB63
         33789GG/tht7XCnfIGeByLbuMdrT0jiwA2xd00qJOXP2VQUAXV7xKu9++1L3v2JdnfnE
         BPDkUWSorIPaPcYfTEJKlTNuM9gMcekeOl2C81xfdF4GBjCfqnzx2mQsWMognZHs9XwS
         OnPkQbzqYhla/23ucPpCmhpTGeVY2NUfrqop1MWtEImjf0sdleiQcYcC6XKVpivs8agz
         YDUNJ3VR+QHNKJygy857y4Yvt0omcIFPZyXeigtJh6LLOJxkgrfjcMv86zT+MhrFEDSm
         fZ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UmXRKUbKgXmhfW+77FLjDFzejAZSQt8OzgtpBP6qGqY=;
        b=s0Oue3sDq1Q7bRewfsyV0NluSWvW/ydoeTfTANjpvI+pR3BS7kdUHNT1sxw1Q5XDP1
         2i44uVLb92szYyofCqjFWVgF7gNYt8ipEVLPmmDdYnS5ft2N1fZCWiKKSRWpLRXAvYrc
         AfQPILbEReT4XqiS/musMFdoJMdXDoIDh0bCJ91FeKw2rjrbu43wdcGYF63Z/b4Nx6UA
         OFEDCerWMX6x9wSJJ1wWLuaJyzQSd1pHNGhccESNVnOPaawdv1CzKg53BReQVK+q4pez
         Vig7Lk2B3B6R0lkynR/mqndGn9JEdkwE4duIIZP4GkZN1vlzrzJw/0YNjJhnPENvibH0
         ANXA==
X-Gm-Message-State: AOAM533w317fOUxDMOSnmIAozWo2G+n2C/6c1mjbwzGbM+/iZfmDzkUt
	KmAQc38w4SbOkB/HpqqNqlKvmf1Tkcr98BL+HKM=
X-Google-Smtp-Source: ABdhPJxWQWgHqeHeLP9AZ7TlKphAE28bQei1LUV6m367BQpAYasGUBryOfDcMJHgROyhEPcNsD9ZpA==
X-Received: by 2002:a05:6830:1ac8:: with SMTP id r8mr3071904otc.70.1601676008387;
        Fri, 02 Oct 2020 15:00:08 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id k10sm684268ots.60.2020.10.02.15.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2020 15:00:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	laurent@vivier.eu
Subject: [PATCH v10 7/8] linux-user/elfload: Parse NT_GNU_PROPERTY_TYPE_0 notes
Date: Fri,  2 Oct 2020 16:59:54 -0500
Message-Id: <20201002215955.254866-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201002215955.254866-1-richard.henderson@linaro.org>
References: <20201002215955.254866-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: e7EWnA7yaKn2

For aarch64, this includes the GNU_PROPERTY_AARCH64_FEATURE_1_BTI bit,
which indicates that the image should be mapped with guarded pages.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v9: Only map the startup executable with BTI; anything else must be
    handled by the interpreter.
v10: Split out preparatory patches (pmm).
---
 linux-user/qemu.h    |  4 +++
 linux-user/elfload.c | 68 ++++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 70 insertions(+), 2 deletions(-)

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 941ca99722..534753ca12 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -61,6 +61,10 @@ struct image_info {
         abi_ulong       interpreter_loadmap_addr;
         abi_ulong       interpreter_pt_dynamic_addr;
         struct image_info *other_info;
+
+        /* For target-specific processing of NT_GNU_PROPERTY_TYPE_0. */
+        uint32_t        note_flags;
+
 #ifdef TARGET_MIPS
         int             fp_abi;
         int             interp_fp_abi;
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 6b422990ff..3c6cbd35c3 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2391,7 +2391,7 @@ static void load_elf_image(const char *image_name, int image_fd,
     struct elfhdr *ehdr = (struct elfhdr *)bprm_buf;
     struct elf_phdr *phdr;
     abi_ulong load_addr, load_bias, loaddr, hiaddr, error;
-    int i, retval;
+    int i, retval, prot_exec;
     const char *errmsg;
 
     /* First of all, some simple consistency checks */
@@ -2467,6 +2467,50 @@ static void load_elf_image(const char *image_name, int image_fd,
                 goto exit_errmsg;
             }
             *pinterp_name = interp_name;
+        } else if (eppnt->p_type == PT_GNU_PROPERTY) {
+            /* Process NT_GNU_PROPERTY_TYPE_0. */
+            const uint32_t gnu0_magic = const_le32('G' | 'N' << 8 | 'U' << 16);
+            uint32_t note[7];
+
+            /*
+             * The note contents are 7 words, but depending on LP64 vs ILP32
+             * there may be an 8th padding word at the end.  Check for and
+             * read the minimum size.  Further checks below will validate
+             * that the sizes of everything involved are as we expect.
+             */
+            if (eppnt->p_filesz < sizeof(note)) {
+                continue;
+            }
+            if (eppnt->p_offset + eppnt->p_filesz <= BPRM_BUF_SIZE) {
+                memcpy(note, bprm_buf + eppnt->p_offset, sizeof(note));
+            } else {
+                retval = pread(image_fd, note, sizeof(note), eppnt->p_offset);
+                if (retval != sizeof(note)) {
+                    goto exit_perror;
+                }
+            }
+#ifdef BSWAP_NEEDED
+            for (i = 0; i < ARRAY_SIZE(note); ++i) {
+                bswap32s(note + i);
+            }
+#endif
+            /*
+             * Check that this is a NT_GNU_PROPERTY_TYPE_0 note.
+             * Again, descsz includes padding.  Full size validation
+             * awaits checking the final payload.
+             */
+            if (note[0] != 4 ||                       /* namesz */
+                note[1] < 12 ||                       /* descsz */
+                note[2] != NT_GNU_PROPERTY_TYPE_0 ||  /* type */
+                note[3] != gnu0_magic) {              /* name */
+                continue;
+            }
+#ifdef TARGET_AARCH64
+            if (note[4] == GNU_PROPERTY_AARCH64_FEATURE_1_AND &&
+                note[5] == 4) {
+                info->note_flags = note[6];
+            }
+#endif /* TARGET_AARCH64 */
         }
     }
 
@@ -2555,6 +2599,26 @@ static void load_elf_image(const char *image_name, int image_fd,
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
@@ -2568,7 +2632,7 @@ static void load_elf_image(const char *image_name, int image_fd,
                 elf_prot |= PROT_WRITE;
             }
             if (eppnt->p_flags & PF_X) {
-                elf_prot |= PROT_EXEC;
+                elf_prot |= prot_exec;
             }
 
             vaddr = load_bias + eppnt->p_vaddr;
-- 
2.25.1
