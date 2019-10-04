Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp216773wrm;
        Fri, 4 Oct 2019 02:46:15 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzPdn5mwGw71kmPSjJw7ZVjDZUPrFpRhtrajUtNgweshLqNvpGcXlEdWX0024wqWtnijInm
X-Received: by 2002:a92:d1c5:: with SMTP id u5mr14953564ilg.201.1570182375802;
        Fri, 04 Oct 2019 02:46:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570182375; cv=none;
        d=google.com; s=arc-20160816;
        b=P/tMzn0NoJxBePbYb9eVuBr6Bhn4sMYBoW5T/DG5h0vY+dPxzxnRNmWjNFSntGZxkR
         ayn5tFpU79yq0rRVDn1wiulBu3MWRp0yz9yAz3xoRGN6aqU72/Wtt6C2hKDoAOBlMStf
         lHqTpNK3hpp1e7UH/DhYDgQJ4eTKxfMesLnVPwQSWnPjTH3uUspgRH4Wiswewa4HT462
         hAvTJMMUW8Mk79QwLNioznPOwGd9D3eQ2Y7em/7o56SNPNRMJuYu5nucxiu89e+DsDFF
         3Bp85+jxiqMAKUMcFYmwGaU4i1nVyenCOtC4Pke1GJu+Sa/SgRObiuqhf5ikBsE47x4x
         BgOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=GpAXr+i03ZTxmy1qbI7uInIQxmtPES1aKSlOnArEntE=;
        b=fcP/11b8i3glmT6bvlBP5yR1HPQMJ5afE3LfFA1XmczCVLEj4g8njIVlp9raWJiqWQ
         ilhIn5kXo2qGTeBgA0JKOyDNBRV8dExbkiH6wej1tnOr8WW5H0mPczSCPpSrZO17byCd
         3fhaJZPv19D7L0VjJ1qlDsKnPtv5wlUh8uKvuCz3CfNCwQTuvjpO0vofUhEzJWw1nXTl
         f3U4UXpXkXR6MeLvrFgDf4aiE2uaSohNSX9r/TYMLC8dd59zQw1cnRWUESNzS/HZhxDP
         iFj9FxxhTn5kxyutoCGyhs+u/u5bfeuAqyjMkPzE3DRY9WVq9IwPkJGWZYoZITwoHNs1
         V5+w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id d22si6773833jam.116.2019.10.04.02.46.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 Oct 2019 02:46:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E4103883BA;
	Fri,  4 Oct 2019 09:46:14 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 09B9B5C1D8;
	Fri,  4 Oct 2019 09:46:10 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	Dave.Martin@arm.com,
	eric.auger@redhat.com
Subject: [PATCH] target/arm/arch_dump: Add SVE notes
Date: Fri,  4 Oct 2019 11:46:09 +0200
Message-Id: <20191004094609.32714-1-drjones@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Fri, 04 Oct 2019 09:46:14 +0000 (UTC)
X-TUID: lhfz2f5zWZ6s

When dumping a guest with dump-guest-memory also dump the SVE
registers if they are in use.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 include/elf.h          |   2 +
 target/arm/arch_dump.c | 133 ++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 133 insertions(+), 2 deletions(-)

diff --git a/include/elf.h b/include/elf.h
index 3501e0c8d03a..a7c357af74ca 100644
--- a/include/elf.h
+++ b/include/elf.h
@@ -1650,6 +1650,8 @@ typedef struct elf64_shdr {
 #define NT_ARM_HW_BREAK 0x402           /* ARM hardware breakpoint registers */
 #define NT_ARM_HW_WATCH 0x403           /* ARM hardware watchpoint registers */
 #define NT_ARM_SYSTEM_CALL      0x404   /* ARM system call number */
+#define NT_ARM_SVE	0x405		/* ARM Scalable Vector Extension
+					   registers */
 
 /*
  * Physical entry point into the kernel.
diff --git a/target/arm/arch_dump.c b/target/arm/arch_dump.c
index 26a2c098687c..98976167d155 100644
--- a/target/arm/arch_dump.c
+++ b/target/arm/arch_dump.c
@@ -62,12 +62,23 @@ struct aarch64_user_vfp_state {
 
 QEMU_BUILD_BUG_ON(sizeof(struct aarch64_user_vfp_state) != 528);
 
+/* struct user_sve_header from arch/arm64/include/uapi/asm/ptrace.h */
+struct aarch64_user_sve_header {
+    uint32_t size;
+    uint32_t max_size;
+    uint16_t vl;
+    uint16_t max_vl;
+    uint16_t flags;
+    uint16_t reserved;
+} QEMU_PACKED;
+
 struct aarch64_note {
     Elf64_Nhdr hdr;
     char name[8]; /* align_up(sizeof("CORE"), 4) */
     union {
         struct aarch64_elf_prstatus prstatus;
         struct aarch64_user_vfp_state vfp;
+        struct aarch64_user_sve_header sve;
     };
 } QEMU_PACKED;
 
@@ -76,6 +87,8 @@ struct aarch64_note {
             (AARCH64_NOTE_HEADER_SIZE + sizeof(struct aarch64_elf_prstatus))
 #define AARCH64_PRFPREG_NOTE_SIZE \
             (AARCH64_NOTE_HEADER_SIZE + sizeof(struct aarch64_user_vfp_state))
+#define AARCH64_SVE_NOTE_SIZE(env) \
+            (AARCH64_NOTE_HEADER_SIZE + sve_size(env))
 
 static void aarch64_note_init(struct aarch64_note *note, DumpState *s,
                               const char *name, Elf64_Word namesz,
@@ -128,11 +141,111 @@ static int aarch64_write_elf64_prfpreg(WriteCoreDumpFunction f,
     return 0;
 }
 
+#ifdef TARGET_AARCH64
+static off_t sve_zreg_offset(uint32_t vq, int n)
+{
+    off_t off = sizeof(struct aarch64_user_sve_header);
+    return ROUND_UP(off, 16) + vq * 16 * n;
+}
+static off_t sve_preg_offset(uint32_t vq, int n)
+{
+    return sve_zreg_offset(vq, 32) + vq * 16 / 8 * n;
+}
+static off_t sve_fpsr_offset(uint32_t vq)
+{
+    off_t off = sve_preg_offset(vq, 17) + offsetof(struct aarch64_note, sve);
+    return ROUND_UP(off, 16) - offsetof(struct aarch64_note, sve);
+}
+static off_t sve_fpcr_offset(uint32_t vq)
+{
+    return sve_fpsr_offset(vq) + sizeof(uint32_t);
+}
+static uint32_t sve_current_vq(CPUARMState *env)
+{
+    return sve_zcr_len_for_el(env, arm_current_el(env)) + 1;
+}
+static size_t sve_size(CPUARMState *env)
+{
+    off_t off = sve_fpcr_offset(sve_current_vq(env)) +
+                sizeof(uint32_t) +
+                offsetof(struct aarch64_note, sve);
+    return ROUND_UP(off, 16) - offsetof(struct aarch64_note, sve);
+}
+
+static int aarch64_write_elf64_sve(WriteCoreDumpFunction f,
+                                   CPUARMState *env, int cpuid,
+                                   DumpState *s)
+{
+    struct aarch64_note *note;
+    uint32_t vq = sve_current_vq(env);
+    uint32_t fpr;
+    uint8_t *buf;
+    size_t size;
+    int ret, i;
+
+    note = g_malloc0(AARCH64_SVE_NOTE_SIZE(env));
+    size = sve_size(env);
+    buf = (uint8_t *)&note->sve;
+
+    aarch64_note_init(note, s, "LINUX", 6, NT_ARM_SVE, size);
+
+    note->sve.size = cpu_to_dump32(s, size);
+    note->sve.max_size = cpu_to_dump32(s, size);
+    note->sve.vl = cpu_to_dump16(s, vq * 16);
+    note->sve.max_vl = cpu_to_dump16(s, vq * 16);
+    note->sve.flags = cpu_to_dump16(s, 1);
+
+    for (i = 0; i < 32; ++i) {
+#ifdef HOST_WORDS_BIGENDIAN
+        uint64_t d[vq * 2];
+        int j;
+
+        for (j = 0; j < vq * 2; ++j) {
+            d[j] = bswap64(env->vfp.zregs[i].d[j]);
+        }
+#else
+        uint64_t *d = &env->vfp.zregs[i].d[0];
+#endif
+        memcpy(&buf[sve_zreg_offset(vq, i)], &d[0], vq * 16);
+    }
+
+    for (i = 0; i < 17; ++i) {
+#ifdef HOST_WORDS_BIGENDIAN
+        uint64_t d[DIV_ROUND_UP(vq * 2, 8)];
+        int j;
+
+        for (j = 0; j < DIV_ROUND_UP(vq * 2, 8); ++j) {
+            d[j] = bswap64(env->vfp.pregs[i].p[j]);
+        }
+#else
+        uint64_t *d = &env->vfp.pregs[i].p[0];
+#endif
+        memcpy(&buf[sve_preg_offset(vq, i)], &d[0], vq * 16 / 8);
+    }
+
+    fpr = cpu_to_dump32(s, vfp_get_fpsr(env));
+    memcpy(&buf[sve_fpsr_offset(vq)], &fpr, sizeof(uint32_t));
+
+    fpr = cpu_to_dump32(s, vfp_get_fpcr(env));
+    memcpy(&buf[sve_fpcr_offset(vq)], &fpr, sizeof(uint32_t));
+
+    ret = f(note, AARCH64_SVE_NOTE_SIZE(env), s);
+    g_free(note);
+
+    if (ret < 0) {
+        return -1;
+    }
+
+    return 0;
+}
+#endif
+
 int arm_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
                              int cpuid, void *opaque)
 {
     struct aarch64_note note;
-    CPUARMState *env = &ARM_CPU(cs)->env;
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
     DumpState *s = opaque;
     uint64_t pstate, sp;
     int ret, i;
@@ -163,7 +276,18 @@ int arm_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
         return -1;
     }
 
-    return aarch64_write_elf64_prfpreg(f, env, cpuid, s);
+    ret = aarch64_write_elf64_prfpreg(f, env, cpuid, s);
+    if (ret) {
+        return ret;
+    }
+
+#ifdef TARGET_AARCH64
+    if (cpu_isar_feature(aa64_sve, cpu)) {
+        ret = aarch64_write_elf64_sve(f, env, cpuid, s);
+    }
+#endif
+
+    return ret;
 }
 
 /* struct pt_regs from arch/arm/include/asm/ptrace.h */
@@ -335,6 +459,11 @@ ssize_t cpu_get_note_size(int class, int machine, int nr_cpus)
     if (class == ELFCLASS64) {
         note_size = AARCH64_PRSTATUS_NOTE_SIZE;
         note_size += AARCH64_PRFPREG_NOTE_SIZE;
+#ifdef TARGET_AARCH64
+        if (cpu_isar_feature(aa64_sve, cpu)) {
+            note_size += AARCH64_SVE_NOTE_SIZE(env);
+        }
+#endif
     } else {
         note_size = ARM_PRSTATUS_NOTE_SIZE;
         if (arm_feature(env, ARM_FEATURE_VFP)) {
-- 
2.20.1
