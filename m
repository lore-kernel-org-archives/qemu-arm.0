Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp5706139lfg;
        Wed, 3 Mar 2021 13:48:00 -0800 (PST)
X-Received: by 2002:adf:de92:: with SMTP id w18mr655268wrl.217.1614808080708;
        Wed, 03 Mar 2021 13:48:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614808080; cv=none;
        d=google.com; s=arc-20160816;
        b=TWydlUtHviFFdXlVyh+P0nqHKoxTt0ozws6bJGzTWYnEdAGdepytovVwJVAK71+O/7
         F0J25GAy1VXLmQcnZwg6JEhRQChQ0o8Gl5rYAT3lt6FYatcDcXDSTVxWQWQnXjHiSJf7
         xp7DHDPJ5ChkXkZHhfaHX/ZQctfRgTGYu8d0nCl/uQ2f+4EvcSGfTofw5ronyj1dz1He
         BJNXCoZV5CzPZIGwUQ/vEAGXXm/xAmUGNCY2H9E1tn8a7e5CJb+lVpA8rVzWMGYyqWO8
         lb09c41dT0SLZlNZu0TKHgYGU8aP6DwxFIB3vP37CAszyX2EriQTr1Rsh4DT5Gsiug0K
         sL8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=KrfmTAy/y06Liy613dmSM4G3rbSLinZL5wmkGcBjQ6Q=;
        b=eGi+VC2II7R4DEfAasTAP4BdtaqNTKNzEAdq1OsHPmfhJ655Z/R6X7ndiJ51FSfzIl
         iRqG0T/K9G0UwNvV6gOTG23d6VB2YVR5AgVu85s+ZYXSQbPJhcIzt9oeZ8Cv4PpVHBcv
         snsw1IwKzQDLOA/NxlWxcb134S2ERAFp++R0IzqOzOtc6ETL3bDm6mhOE3kkmjAr1I5t
         m+YMbNOWmOk18F3ISKiV0r3J9gsVAwJ8eXCdFFhgeBTtieulrw4xLUrQJLY3ECJQsirl
         1udxyv+62T8RDtmv6D5zVWKQumNlAcmQE2BVvgbwltZaIsoIHRjeDRzYyVBL1aBr4xeN
         6yNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="U7nX/qH/";
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 7sor12532256wrp.36.2021.03.03.13.48.00
        (Google Transport Security);
        Wed, 03 Mar 2021 13:48:00 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="U7nX/qH/";
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KrfmTAy/y06Liy613dmSM4G3rbSLinZL5wmkGcBjQ6Q=;
        b=U7nX/qH/pj9vuhk5OuE9MYtkaxBeNOesC2soCFMJdLnuVOBjF9fFA2Oxp1pSweSYco
         wiu2WVgM2FCSZe6jF5bu6+cluDmDfoxu6fop027s/68r5SQR4PP8IBFu0JtfEioDLhmG
         nBu+3OLGVESAfbUgltl7btQsSf4TjkXd8v7u9QOCsSxnQtn6/pEH0JntEMT2OsPOK6bL
         GXqJnjOuGDbPKlepBghW2gklBTNHdmVIa+OiETZb4n10MDPzGJKDo8ybIa44w8MNXfUs
         RKZzDqxxq4SvpBmxqzJgP2HgjMAk/X2A6/cyDGZf76xz92b4eUiFmveD19kme9JBjC37
         yMQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=KrfmTAy/y06Liy613dmSM4G3rbSLinZL5wmkGcBjQ6Q=;
        b=Qr4vm8/un8qBjn8pmnzbn++uaURqPV5XTDUaU5EonjuA+afVD/4zR5nHsyjUdGuIGY
         TaMsjf4mCBLsUS4Tcuyp3rBXnMG0owgCDj2GyEV/WFiBNtYAAMz7OBloKLG9bMscFZqW
         WzJC3ntfwvnVSUAKj5cwmDsyA9HiksedxJdTRTxAz+0c3iWzLwRozynw9h1iS1LlIinB
         vHao5CM919vwqOyjuT+XNYv2EzBm6bSyoF7s4jjEckl8CV6O+MFBW5sFh2OPgvKt8iHt
         0JmVut+tfbxT9W8GsI3OoMqVHAhHiihjQt5tfD74+8A7x2yWQRvEOw9s1O3bWbYfZcmV
         4rTA==
X-Gm-Message-State: AOAM533VBEL4m+T8KXwx8jTh4r7gl/Ae9QvrmG4mgf3/HY4wbSR9+DsG
	bxF5mBufsCodjICeSopbqgg=
X-Google-Smtp-Source: ABdhPJwwJYH4kp+e2fr7J19qTnWtXIwYIOd2JbiU45YGKXBBTf8H5A5pvrhOuqeIbSub+9as3hur6w==
X-Received: by 2002:adf:97d5:: with SMTP id t21mr675099wrb.139.1614808080451;
        Wed, 03 Mar 2021 13:48:00 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net. [83.57.175.68])
        by smtp.gmail.com with ESMTPSA id n6sm14034871wrt.1.2021.03.03.13.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 13:47:59 -0800 (PST)
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
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Greg Kurz <groug@kaod.org>
Subject: [PATCH v4 09/28] cpu: Move CPUClass::virtio_is_big_endian to SysemuCPUOps
Date: Wed,  3 Mar 2021 22:46:49 +0100
Message-Id: <20210303214708.1727801-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303214708.1727801-1-f4bug@amsat.org>
References: <20210303214708.1727801-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: wC502K5zwxwA

VirtIO devices are only meaningful with system emulation.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h            | 5 -----
 include/hw/core/sysemu-cpu-ops.h | 8 ++++++++
 hw/core/cpu.c                    | 4 ++--
 target/arm/cpu.c                 | 2 +-
 target/ppc/translate_init.c.inc  | 4 +---
 5 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 471c99d9f04..dfb50b60128 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -89,10 +89,6 @@ struct AccelCPUClass;
  * @parse_features: Callback to parse command line arguments.
  * @reset_dump_flags: #CPUDumpFlags to use for reset logging.
  * @has_work: Callback for checking if there is work to do.
- * @virtio_is_big_endian: Callback to return %true if a CPU which supports
- * runtime configurable endianness is currently big-endian. Non-configurable
- * CPUs can use the default implementation of this method. This method should
- * not be used by any callers other than the pre-1.0 virtio devices.
  * @memory_rw_debug: Callback for GDB memory access.
  * @dump_state: Callback for dumping state.
  * @dump_statistics: Callback for dumping statistics.
@@ -151,7 +147,6 @@ struct CPUClass {
 
     int reset_dump_flags;
     bool (*has_work)(CPUState *cpu);
-    bool (*virtio_is_big_endian)(CPUState *cpu);
     int (*memory_rw_debug)(CPUState *cpu, vaddr addr,
                            uint8_t *buf, int len, bool is_write);
     void (*dump_state)(CPUState *cpu, FILE *, int flags);
diff --git a/include/hw/core/sysemu-cpu-ops.h b/include/hw/core/sysemu-cpu-ops.h
index 05f19b22070..9c3ac4f2280 100644
--- a/include/hw/core/sysemu-cpu-ops.h
+++ b/include/hw/core/sysemu-cpu-ops.h
@@ -16,6 +16,14 @@
  * struct SysemuCPUOps: System operations specific to a CPU class
  */
 typedef struct SysemuCPUOps {
+    /**
+     * @virtio_is_big_endian: Callback to return %true if a CPU which supports
+     *       runtime configurable endianness is currently big-endian.
+     * Non-configurable CPUs can use the default implementation of this method.
+     * This method should not be used by any callers other than the pre-1.0
+     * virtio devices.
+     */
+    bool (*virtio_is_big_endian)(CPUState *cpu);
     /**
      * @vmsd: State description for migration.
      */
diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index 5abf8bed2e4..09eaa3fa49f 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -204,8 +204,8 @@ bool cpu_virtio_is_big_endian(CPUState *cpu)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    if (cc->virtio_is_big_endian) {
-        return cc->virtio_is_big_endian(cpu);
+    if (cc->sysemu_ops->virtio_is_big_endian) {
+        return cc->sysemu_ops->virtio_is_big_endian(cpu);
     }
     return target_words_bigendian();
 }
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 403422c6e76..fa0d4bba590 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2262,6 +2262,7 @@ static gchar *arm_gdb_arch_name(CPUState *cs)
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps arm_sysemu_ops = {
+    .virtio_is_big_endian = arm_cpu_virtio_is_big_endian,
     .vmsd = &vmstate_arm_cpu,
 };
 #endif
@@ -2305,7 +2306,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_attrs_debug = arm_cpu_get_phys_page_attrs_debug;
     cc->asidx_from_attrs = arm_asidx_from_attrs;
-    cc->virtio_is_big_endian = arm_cpu_virtio_is_big_endian;
     cc->write_elf64_note = arm_cpu_write_elf64_note;
     cc->write_elf32_note = arm_cpu_write_elf32_note;
     cc->sysemu_ops = &arm_sysemu_ops;
diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index 819b807097d..789124debe7 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -10845,6 +10845,7 @@ static Property ppc_cpu_properties[] = {
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps ppc_sysemu_ops = {
+    .virtio_is_big_endian = ppc_cpu_is_big_endian,
     .vmsd = &vmstate_ppc_cpu,
 };
 #endif
@@ -10913,9 +10914,6 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_core_xml_file = "power64-core.xml";
 #else
     cc->gdb_core_xml_file = "power-core.xml";
-#endif
-#ifndef CONFIG_USER_ONLY
-    cc->virtio_is_big_endian = ppc_cpu_is_big_endian;
 #endif
     cc->disas_set_info = ppc_disas_set_info;
 
-- 
2.26.2
