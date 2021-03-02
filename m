Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp4539348lfg;
        Tue, 2 Mar 2021 07:00:03 -0800 (PST)
X-Received: by 2002:a17:906:4955:: with SMTP id f21mr21872239ejt.74.1614697203595;
        Tue, 02 Mar 2021 07:00:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614697203; cv=none;
        d=google.com; s=arc-20160816;
        b=l4zvirWIItTSyIZ1bjAHkm1+xxX1rc6zH7xfFBwmjNnsarfatTIRaYI5f/pK6TJCBx
         dAYNH89m7SXMSLfxv64tJ/Diwip869CY91TzHmgErHHRcr/OCYdXCTXXG67UBApeDtB/
         3ibG6l226xKA/OJtqPmSa6JCfnSdZvOBrBkC4FtuPWHW4OYd1lIFruucfmZ3ZRtwYMKW
         yPsvbUBgao7EmPR6Ne6PHUJzpIK0DCMDFpuWIBXPA6NRGg9jHhJqHfviHxhJ7WTGC+ew
         EXMq/jdrLDtOjX4xGVYrGoLYll8AEyoxb/WpTjzxyJ2pXTNbLAVDObhOTMtE1gx+5RsO
         qjhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=80i+luS2gU1nZWsoBAiYbRUL/K5YnYdp7E5uXZjJBL4=;
        b=xvdb59BeAh8vtiOm5dOXLwUNyy4/OcsxmKkDcby1Ub9wg0wB8+H5WAwjJfyQxbNr4c
         TV8BCl6/YfRIyUeszGyIs60VL8DB/eoUdg7ERLSkhSKS7shE7lStN9+h61CVOgzC+JAk
         Q8FQTTHL1mNKhqq+qnaBOTnOcpLEAhu3hxNNcoq1hB9UrBWs9TR+YU9AK5rDYy0Gfso9
         JTwGrkrud4C+4TqLn24n7lAK5SK+KHQoQEQkHtHuaXcSxIEIaXMKYG9Fmieu3KmJ1Jz/
         wcdyi3//bc0rzqoFNslpvCzDLN6QPfcFjT4o2DBks66srdz4MooCGRW92EjGXxJwe7OR
         RumA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=dpGwCF6r;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n9sor7305583edt.19.2021.03.02.07.00.03
        (Google Transport Security);
        Tue, 02 Mar 2021 07:00:03 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=dpGwCF6r;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=80i+luS2gU1nZWsoBAiYbRUL/K5YnYdp7E5uXZjJBL4=;
        b=dpGwCF6rebaENcMlefxhPfnkG83niqll8GFUGNLSSk8S7EFiaz4tXcPgz1/bHzD/LG
         ySvI+vtZvFfOwKSfOyCwAOHdWro9HLaYSOVTUxfM0qXytAzCGZY/nOxz6r7wz4w6RxgS
         P3jtRjV0jIHhTtPTqTebeL0RhUPGgmkABM7OMFbp5k4mboy/vKFeqliQ5CQUAzYq8q/x
         2OFd7nr215d/UNsF3OF0FPoEliX9ng6XE4ZfumA/SLowiAyOqLIB5llWH5H489asaxSG
         ENsWhrR2IsMbVeRTxhN8DlSc8SLFzjg/o/winpzAwheC9289Q3m/3AsJQfU2nvJZOaqF
         gvwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=80i+luS2gU1nZWsoBAiYbRUL/K5YnYdp7E5uXZjJBL4=;
        b=pvdpGFsh0Qhu+H4RdfbsdffUOvtZodytRsbh+0KMhL+AKhVs5rVlfX7ASiX81r3qmj
         dA9T4Ec+cKOakkUT0Ue2hzR2w+wdihTNFN+Rvd/DStz91vNDouHTD6nKihHOrkKrRJKb
         OTTS3PE8WgTKOhIGVOl+AKFtbK87RdYkyse95D+I50wywC3wPtFyyEjHct4NqdumwXQc
         bkc+ntRzSdDGunCQbOIh6XPwvDL8H8lirdl9FCxCztifctSlwAvUVP/7GN68iprMBm0/
         bGt4dEGwwUjjO5LM21GFYzNKdvMskjion0muXvDJW4avzxjP5BVgh3gq6pxzLTU4gkqr
         8bhQ==
X-Gm-Message-State: AOAM532xPUZCtKv0GlURelh1aCEXJznCz3LMrAQ9srLOulyK0oQXiIj1
	a6TWGLzovYppctdIrmYs36s=
X-Google-Smtp-Source: ABdhPJyXQFUGRRxV54Xm/zg4k3LV8CQ/B3gXnhCbP+IjO4+X69LJTqe/h1Q4Rh1dH6mRTY7/JWneNw==
X-Received: by 2002:aa7:c150:: with SMTP id r16mr20556346edp.96.1614697203386;
        Tue, 02 Mar 2021 07:00:03 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net. [83.57.175.68])
        by smtp.gmail.com with ESMTPSA id p25sm18624983eds.55.2021.03.02.07.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 07:00:02 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	Max Filippov <jcmvbkbc@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Michael Rolnik <mrolnik@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Greg Kurz <groug@kaod.org>,
	Stafford Horne <shorne@gmail.com>,
	qemu-ppc@nongnu.org,
	Anthony Green <green@moxielogic.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Claudio Fontana <cfontana@suse.de>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Michael Walle <michael@walle.cc>,
	Marek Vasut <marex@denx.de>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Chris Wulff <crwulff@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-s390x@nongnu.org,
	Sarah Harris <S.E.Harris@kent.ac.uk>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	qemu-riscv@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Taylor Simpson <tsimpson@quicinc.com>
Subject: [PATCH v3 14/27] cpu: Move CPUClass::get_memory_mapping to SysemuCPUOps
Date: Tue,  2 Mar 2021 15:58:05 +0100
Message-Id: <20210302145818.1161461-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210302145818.1161461-1-f4bug@amsat.org>
References: <20210302145818.1161461-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: I2cSOBxALBCm

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h            | 3 ---
 include/hw/core/sysemu-cpu-ops.h | 5 +++++
 hw/core/cpu.c                    | 4 ++--
 target/i386/cpu.c                | 2 +-
 4 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 9a86c707cf7..8af78cdde23 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -94,7 +94,6 @@ struct AccelCPUClass;
  * @dump_statistics: Callback for dumping statistics.
  * @get_arch_id: Callback for getting architecture-dependent CPU ID.
  * @get_paging_enabled: Callback for inquiring whether paging is enabled.
- * @get_memory_mapping: Callback for obtaining the memory mappings.
  * @set_pc: Callback for setting the Program Counter register. This
  *       should have the semantics used by the target architecture when
  *       setting the PC from a source such as an ELF file entry point;
@@ -138,8 +137,6 @@ struct CPUClass {
     void (*dump_statistics)(CPUState *cpu, int flags);
     int64_t (*get_arch_id)(CPUState *cpu);
     bool (*get_paging_enabled)(const CPUState *cpu);
-    void (*get_memory_mapping)(CPUState *cpu, MemoryMappingList *list,
-                               Error **errp);
     void (*set_pc)(CPUState *cpu, vaddr value);
     int (*gdb_read_register)(CPUState *cpu, GByteArray *buf, int reg);
     int (*gdb_write_register)(CPUState *cpu, uint8_t *buf, int reg);
diff --git a/include/hw/core/sysemu-cpu-ops.h b/include/hw/core/sysemu-cpu-ops.h
index 0c8f616a565..460e7d63b0c 100644
--- a/include/hw/core/sysemu-cpu-ops.h
+++ b/include/hw/core/sysemu-cpu-ops.h
@@ -16,6 +16,11 @@
  * struct SysemuCPUOps: System operations specific to a CPU class
  */
 typedef struct SysemuCPUOps {
+    /**
+     * @get_memory_mapping: Callback for obtaining the memory mappings.
+     */
+    void (*get_memory_mapping)(CPUState *cpu, MemoryMappingList *list,
+                               Error **errp);
     /**
      * @get_phys_page_debug: Callback for obtaining a physical address.
      */
diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index 6932781425a..339bdfadd7a 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -83,8 +83,8 @@ void cpu_get_memory_mapping(CPUState *cpu, MemoryMappingList *list,
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    if (cc->get_memory_mapping) {
-        cc->get_memory_mapping(cpu, list, errp);
+    if (cc->sysemu_ops->get_memory_mapping) {
+        cc->sysemu_ops->get_memory_mapping(cpu, list, errp);
         return;
     }
 
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index c7a18cd8e4f..d33ee9f831e 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7388,6 +7388,7 @@ static Property x86_cpu_properties[] = {
 
 #ifndef CONFIG_USER_ONLY
 static struct SysemuCPUOps i386_sysemu_ops = {
+    .get_memory_mapping = x86_cpu_get_memory_mapping,
     .get_phys_page_attrs_debug = x86_cpu_get_phys_page_attrs_debug,
     .asidx_from_attrs = x86_asidx_from_attrs,
     .get_crash_info = x86_cpu_get_crash_info,
@@ -7431,7 +7432,6 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
     cc->get_paging_enabled = x86_cpu_get_paging_enabled;
 
 #ifndef CONFIG_USER_ONLY
-    cc->get_memory_mapping = x86_cpu_get_memory_mapping;
     cc->sysemu_ops = &i386_sysemu_ops;
 #endif /* !CONFIG_USER_ONLY */
 
-- 
2.26.2
