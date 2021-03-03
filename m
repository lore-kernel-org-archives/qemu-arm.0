Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp5706424lfg;
        Wed, 3 Mar 2021 13:48:33 -0800 (PST)
X-Received: by 2002:adf:a2cf:: with SMTP id t15mr818677wra.250.1614808113290;
        Wed, 03 Mar 2021 13:48:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614808113; cv=none;
        d=google.com; s=arc-20160816;
        b=RP3LMEG2bLkHLbSkjJtSWv/HB0YzsiERA+x7ByZ9Neyjr/dOMnwyGsI9GrC5jezrMT
         rUxWFKgPRok8zz2YP4oEvI7zkd35UFt91q4hRaqCbv3z1EyR5dPtvanWYdVedy6O3wwb
         PcnovbO8nf619tydido3iJfIu8eZbpnJoypDSsBYvpVLicJM5/jAnqBSoHcTVEcBfrq9
         wHn/ghJqSAw9MBeE+BFZCcxE8JBxiUxb1Ospc6Jb26PQfQGv+1fgk3yfhaN1K3+ideV3
         Y4Cn9sWfz/XjHo0ptcEb2vdJJDD3ooCOQrHL24y8MKtj7uxHgGRfutwwIgu8GkH2C9AX
         MABA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=EgbaLT145JE9K24YqnNM6CBW+74A5NiqHCMjzrliWjU=;
        b=CjDMDjtpKZYEs81BWcV0KUYLzfYI8ScuC3HmnS8UW6VrJr/J0N20+xJPke1YaLO1wK
         cf3M/kQjDsq1o5qG957WSKlGP/mTHJJsM44BT6qGjIBIwiapKQyl4AbUrBtpUvM0jr7i
         mhmfWVVG2zsoQ+ZCa1XEj6ydABDRtj6oGDQI4134tdOJpK8aTMzIJ4RPBZw6kVUanINB
         8wfKHOlX9THw0a1CnzREU9dbZf+NSilso8gMJb9cnAoNHJu0qANhOsaz+SBOb2NyJLeF
         Q5cA1SPYcxJSd0B0b34B57bJ1xwF1ML1mOwwls0UjW9eDPCyw2bCFKr8Jkssyl3dit1b
         5ESw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=khFf7D1k;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id h2sor10719516wrw.49.2021.03.03.13.48.33
        (Google Transport Security);
        Wed, 03 Mar 2021 13:48:33 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=khFf7D1k;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EgbaLT145JE9K24YqnNM6CBW+74A5NiqHCMjzrliWjU=;
        b=khFf7D1kn1I8+VV7UwMj4AoxYALmg6FuAUX0DZ7Zk0Phjg623DyddsNHR60s5WzLo9
         k4juJhLrUafayhaebqLgOJlZ23QMmAZTIxksL9vlHpK+2ewfsEFVNU4DJ8+edDfQIOd/
         DigRaq5gqUjzRQ+ZDGUdk3yBn7L06hCul1H9NDWSFcH264CsAZeSAQEmTda1jOsi3aLT
         De7Rj8+80KgtFeYK/v/o6AaB3VjDS02KY03vMUz1OIII6ViwbTqBTQKUlUO0gWbMFKz+
         Fp8BZRyPzYlYvKHupe7pvAVDDICSY5P7wOzaPn80+L5h1sSfyoYQfIpt9E4hK+3c08X6
         PDHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=EgbaLT145JE9K24YqnNM6CBW+74A5NiqHCMjzrliWjU=;
        b=gtRUXUHv0FINFSXCrvIvXifrBoC7fm6KYSPcFCMIRmL4809tW16fqVSARGEA3eba3b
         T6vg6szBug1fHX40ZAm7TbQhVeHB9S3b9Bdu9c+HEbkPsVgwnC75QwG4oLYejxJ1TgfF
         0xSDkUwdbcQKQY8+xhF1wIh0n0XozFaXbgu7jO1hpGDAKYTT4M/nesCfecnOIAmMM+l/
         7LOn3H6Zf4nDUg1eYqF4Ht296w60OaAthf+Z0fYyCncKxCaXWmRwIOu6iBIckBIaEHEV
         ufDDTzfZFnCLlM5MCC/psnenU8PGONquuv1wt3Nclq5vCu0rjaUjkIONULWum3QlgvJj
         EnfA==
X-Gm-Message-State: AOAM533ouTyCoKHQH652z1yKvM8YyGnF9y+GrartLUe3sspG7ORe0LH1
	/nCiVIyDZlUR3zoFoACtE3Q=
X-Google-Smtp-Source: ABdhPJzg229G09tZapjldlWd9H3NvLGpGzpJKR7kk7D9KbG56lVNaudV26dJHAEeGCzH3AIMxkWkUw==
X-Received: by 2002:adf:b355:: with SMTP id k21mr794588wrd.156.1614808113118;
        Wed, 03 Mar 2021 13:48:33 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net. [83.57.175.68])
        by smtp.gmail.com with ESMTPSA id g1sm6924468wmh.9.2021.03.03.13.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 13:48:32 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-s390x@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	qemu-ppc@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>,
	Cornelia Huck <cohuck@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v4 15/28] cpu: Move CPUClass::get_paging_enabled to SysemuCPUOps
Date: Wed,  3 Mar 2021 22:46:55 +0100
Message-Id: <20210303214708.1727801-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303214708.1727801-1-f4bug@amsat.org>
References: <20210303214708.1727801-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: rr2XAfsQy17v

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h            | 2 --
 include/hw/core/sysemu-cpu-ops.h | 4 ++++
 hw/core/cpu.c                    | 4 ++--
 target/i386/cpu.c                | 4 +++-
 4 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 8af78cdde23..960846d2b64 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -93,7 +93,6 @@ struct AccelCPUClass;
  * @dump_state: Callback for dumping state.
  * @dump_statistics: Callback for dumping statistics.
  * @get_arch_id: Callback for getting architecture-dependent CPU ID.
- * @get_paging_enabled: Callback for inquiring whether paging is enabled.
  * @set_pc: Callback for setting the Program Counter register. This
  *       should have the semantics used by the target architecture when
  *       setting the PC from a source such as an ELF file entry point;
@@ -136,7 +135,6 @@ struct CPUClass {
     void (*dump_state)(CPUState *cpu, FILE *, int flags);
     void (*dump_statistics)(CPUState *cpu, int flags);
     int64_t (*get_arch_id)(CPUState *cpu);
-    bool (*get_paging_enabled)(const CPUState *cpu);
     void (*set_pc)(CPUState *cpu, vaddr value);
     int (*gdb_read_register)(CPUState *cpu, GByteArray *buf, int reg);
     int (*gdb_write_register)(CPUState *cpu, uint8_t *buf, int reg);
diff --git a/include/hw/core/sysemu-cpu-ops.h b/include/hw/core/sysemu-cpu-ops.h
index 460e7d63b0c..3f9a5199dd1 100644
--- a/include/hw/core/sysemu-cpu-ops.h
+++ b/include/hw/core/sysemu-cpu-ops.h
@@ -21,6 +21,10 @@ typedef struct SysemuCPUOps {
      */
     void (*get_memory_mapping)(CPUState *cpu, MemoryMappingList *list,
                                Error **errp);
+    /**
+     * @get_paging_enabled: Callback for inquiring whether paging is enabled.
+     */
+    bool (*get_paging_enabled)(const CPUState *cpu);
     /**
      * @get_phys_page_debug: Callback for obtaining a physical address.
      */
diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index 339bdfadd7a..7a8487d468f 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -71,8 +71,8 @@ bool cpu_paging_enabled(const CPUState *cpu)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    if (cc->get_paging_enabled) {
-        return cc->get_paging_enabled(cpu);
+    if (cc->sysemu_ops->get_paging_enabled) {
+        return cc->sysemu_ops->get_paging_enabled(cpu);
     }
 
     return false;
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index b2d3debd1f2..994d58aa754 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7157,12 +7157,14 @@ static int64_t x86_cpu_get_arch_id(CPUState *cs)
     return cpu->apic_id;
 }
 
+#if !defined(CONFIG_USER_ONLY)
 static bool x86_cpu_get_paging_enabled(const CPUState *cs)
 {
     X86CPU *cpu = X86_CPU(cs);
 
     return cpu->env.cr[0] & CR0_PG_MASK;
 }
+#endif /* !CONFIG_USER_ONLY */
 
 static void x86_cpu_set_pc(CPUState *cs, vaddr value)
 {
@@ -7389,6 +7391,7 @@ static Property x86_cpu_properties[] = {
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps i386_sysemu_ops = {
     .get_memory_mapping = x86_cpu_get_memory_mapping,
+    .get_paging_enabled = x86_cpu_get_paging_enabled,
     .get_phys_page_attrs_debug = x86_cpu_get_phys_page_attrs_debug,
     .asidx_from_attrs = x86_asidx_from_attrs,
     .get_crash_info = x86_cpu_get_crash_info,
@@ -7429,7 +7432,6 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
     cc->gdb_read_register = x86_cpu_gdb_read_register;
     cc->gdb_write_register = x86_cpu_gdb_write_register;
     cc->get_arch_id = x86_cpu_get_arch_id;
-    cc->get_paging_enabled = x86_cpu_get_paging_enabled;
 
 #ifndef CONFIG_USER_ONLY
     cc->sysemu_ops = &i386_sysemu_ops;
-- 
2.26.2
