Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp2281622wrv;
        Sat, 3 Aug 2019 14:08:13 -0700 (PDT)
X-Received: by 2002:a17:902:583:: with SMTP id f3mr136724001plf.137.1564866493637;
        Sat, 03 Aug 2019 14:08:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564866493; cv=none;
        d=google.com; s=arc-20160816;
        b=jQ05/7rKMh8H4rVoqnXruuU2egGjZyE4MJvsAkcwG/01nSo//up6rRxHVcqO1BsaqH
         16NPCMNKrvPleGBL2z8NABFvq30SiA1QytkJBtPY8YEe5IpK+DdOvPAOKWIS6et9PxI8
         3CSm2VSAzra+S58anbeARJNCFksxTumXl0GyYlUq08qdKV3urUSeM54796vY8Duzb9Lk
         XxfnCYZ24XVyZ4ruHkOTFDleA7eVMva1N3/2oFQM9ksBtdg7U498ThWKzp8YHp4pQ/gp
         aV+p40y5k3MYgaA4SfE5s1wFmHgULd0ChlqlgLIVX2zTVAMn+v57I1ovhTF2tUHjYTxE
         5dfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=ijiZOLpvZs8wYEcrSua+yyDmUDcG7PPSoeYhYrFW+FU=;
        b=W52iYqm5vIi/xSB179SuaYEwMtKk5GwZdaeRr6MaiwsYlkrlKANN0GpC/pbXUv9BjF
         5lPgpSuUmZoBFgfA7j7mNu7J3cQjOSz7wlmoY55bnO9GjvMdvIOTR0yP7DJlcmOTyMOv
         qNkL/ohbN+BcwfBkdaMJJ4CnOK2U3MdrHi/hmzN1oQ9nB0JBstgUELlrViYITbAxhLTo
         kKNrAWdLbJ+uuXy0NshLw4KqOxWLg2TXpOEmURRe2bQmiz1Ur3FZqE46TkY0LFk8o6RC
         A8udnU7pMTwxweyI9nQFmD3IjJAXO7LVx+bxIJshxUUCWHH2D3L4jYbYCvbU2pxnDBoN
         parg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=atruJesB;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id r2sor59886628pfh.6.2019.08.03.14.08.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 Aug 2019 14:08:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=atruJesB;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ijiZOLpvZs8wYEcrSua+yyDmUDcG7PPSoeYhYrFW+FU=;
        b=atruJesBQmmDOSQE6mv5huwgbTxeK5blO5CxhiFkeECgtegRHtIof0HSIT75p79my0
         fTm2VLv8gh382rxTvg4qrtlzfwT6xOMv+1fqVP6G1MnRfxmlVKftdZs8nZWZlYmkJT74
         Xt+2AW2z+c0gIexCFZmxsnJCf2YCazy+9i/iKOW0hYS5X08DPCL35nvsNa0f6e4PZqZt
         /Zo/WpB3UoIH4VZW/TGQOEW8CeDUHwyexDGb/4JLybW1btrMyIbmasPzs9JgxnmtEfQp
         uVaJh3bUqOellP+u2P+xfZVqXAuGUaDzhs0QIZDmsAFboxClIqpdLKkaeKbJc4h1zatd
         yfkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ijiZOLpvZs8wYEcrSua+yyDmUDcG7PPSoeYhYrFW+FU=;
        b=o4rxKecO/GzH90AcfXyDpPh1GZmnnd7ziIuOogXSmuycDIlsCo0xdAN7BXrM/5vRUK
         ynGsj2vt4gyIe1D6RW1H1y3SWEEpaZIKf2pAW1VVcP/y1f57wzitRNbpcbTu4gbyTRZe
         FCV4lr8qkLqHnOBJEKXj+htddwWTwiJz8jwfpA38L/JYHIA6joBV27o/LhrMuy0tYDCu
         6bAEB1POLzXg66wqQfmp3x79N3cMRFPqRWe0uK53YKFYz81VKok7joyi+oYXt8yLSMX5
         Y6DfjrPUyA2HKEe/870XnC57v7MVRB+4XAlmUOAobTMyFnRR0NuewL+PbbF7yBJ/bYQC
         FFVA==
X-Gm-Message-State: APjAAAXlJSE8ec0PejBoNEK2MTxAttsBLPRaAbJGw0gnymrwgaAi9APb
	g6JkswhThg3H3TvlX1cgDja4aS94
X-Google-Smtp-Source: APXvYqyD30GknKiPzRFZVc8ceTZZnxa3eNkZs1R4sQV5ft0Le2oVvqbhlZk/SmKWxG0YptgkEkMN6g==
X-Received: by 2002:a62:be04:: with SMTP id l4mr63898674pff.77.1564866493177;
        Sat, 03 Aug 2019 14:08:13 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id x25sm110129644pfa.90.2019.08.03.14.08.11
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 03 Aug 2019 14:08:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org,
	Dave.Martin@arm.com
Subject: [PATCH v7 5/6] linux-user: Parse NT_GNU_PROPERTY_TYPE_0 notes
Date: Sat,  3 Aug 2019 14:08:02 -0700
Message-Id: <20190803210803.5701-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190803210803.5701-1-richard.henderson@linaro.org>
References: <20190803210803.5701-1-richard.henderson@linaro.org>
X-TUID: yVxXAkSfLDDT

For aarch64, this includes the GNU_PROPERTY_AARCH64_FEATURE_1_BTI bit,
which indicates that the image should be mapped with guarded pages.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/elfload.c | 94 ++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 86 insertions(+), 8 deletions(-)
---

Note: The behaviour here when GNU_PROPERTY_AARCH64_FEATURE_1_BTI
is present differs from Dave's v1 patch set, in which the kernel
refuses to load the binary if the host does not support BTI.

However, I feel that's not the best way to introduce a feature
that adds security and is otherwise designed to be backward
compatible to such hosts.  We should want entire distributions
to be built indicating compatibility with BTI via this markup.

I included this rationale in my review of Dave's patch set.


r~


diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index bd43c4817d..d18e7dd313 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2289,7 +2289,7 @@ static void load_elf_image(const char *image_name, int image_fd,
     struct elfhdr *ehdr = (struct elfhdr *)bprm_buf;
     struct elf_phdr *phdr;
     abi_ulong load_addr, load_bias, loaddr, hiaddr, error;
-    int i, retval;
+    int i, retval, prot_exec = PROT_EXEC;
     const char *errmsg;
 
     /* First of all, some simple consistency checks */
@@ -2324,17 +2324,89 @@ static void load_elf_image(const char *image_name, int image_fd,
     loaddr = -1, hiaddr = 0;
     info->alignment = 0;
     for (i = 0; i < ehdr->e_phnum; ++i) {
-        if (phdr[i].p_type == PT_LOAD) {
-            abi_ulong a = phdr[i].p_vaddr - phdr[i].p_offset;
+        struct elf_phdr *eppnt = phdr + i;
+
+        if (eppnt->p_type == PT_LOAD) {
+            abi_ulong a = eppnt->p_vaddr - eppnt->p_offset;
             if (a < loaddr) {
                 loaddr = a;
             }
-            a = phdr[i].p_vaddr + phdr[i].p_memsz;
+            a = eppnt->p_vaddr + eppnt->p_memsz;
             if (a > hiaddr) {
                 hiaddr = a;
             }
             ++info->nsegs;
-            info->alignment |= phdr[i].p_align;
+            info->alignment |= eppnt->p_align;
+        } else if (eppnt->p_type == PT_GNU_PROPERTY) {
+#ifdef TARGET_AARCH64
+            /*
+             * Process NT_GNU_PROPERTY_TYPE_0.
+             *
+             * TODO: For AArch64, the PT_GNU_PROPERTY is authoritative:
+             * it is present if and only if NT_GNU_PROPERTY_TYPE_0 is.
+             * That may or may not be true for other architectures.
+             *
+             * TODO: The only item that is AArch64 specific is the
+             * GNU_PROPERTY_AARCH64_FEATURE_1_AND processing at the end.
+             * If we were to ever process GNU_PROPERTY_X86_*, all of the
+             * code through checking the gnu0 magic number is sharable.
+             * But for now, since this *is* only used by AArch64, don't
+             * process the note elsewhere.
+             */
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
+            /*
+             * Check for the BTI feature.  If present, this indicates
+             * that all the executable pages of the binary should be
+             * mapped with PROT_BTI, so that branch targets are enforced.
+             */
+            if (note[4] == GNU_PROPERTY_AARCH64_FEATURE_1_AND &&
+                note[5] == 4 &&
+                (note[6] & GNU_PROPERTY_AARCH64_FEATURE_1_BTI)) {
+                /*
+                 * Elf notes are backward compatible to older cpus.
+                 * Do not enable unless it is supported.
+                 */
+                ARMCPU *cpu = ARM_CPU(thread_cpu);
+                if (cpu_isar_feature(aa64_bti, cpu)) {
+                    prot_exec |= TARGET_PROT_BTI;
+                }
+            }
+#endif /* TARGET_AARCH64 */
         }
     }
 
@@ -2394,9 +2466,15 @@ static void load_elf_image(const char *image_name, int image_fd,
             abi_ulong vaddr, vaddr_po, vaddr_ps, vaddr_ef, vaddr_em, vaddr_len;
             int elf_prot = 0;
 
-            if (eppnt->p_flags & PF_R) elf_prot =  PROT_READ;
-            if (eppnt->p_flags & PF_W) elf_prot |= PROT_WRITE;
-            if (eppnt->p_flags & PF_X) elf_prot |= PROT_EXEC;
+            if (eppnt->p_flags & PF_R) {
+                elf_prot |= PROT_READ;
+            }
+            if (eppnt->p_flags & PF_W) {
+                elf_prot |= PROT_WRITE;
+            }
+            if (eppnt->p_flags & PF_X) {
+                elf_prot |= prot_exec;
+            }
 
             vaddr = load_bias + eppnt->p_vaddr;
             vaddr_po = TARGET_ELF_PAGEOFFSET(vaddr);
-- 
2.17.1
