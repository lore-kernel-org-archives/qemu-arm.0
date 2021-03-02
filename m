Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp4539128lfg;
        Tue, 2 Mar 2021 06:59:49 -0800 (PST)
X-Received: by 2002:a50:ec07:: with SMTP id g7mr20618279edr.72.1614697189289;
        Tue, 02 Mar 2021 06:59:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614697189; cv=none;
        d=google.com; s=arc-20160816;
        b=soH6yFf+RbxCoew6KvZAbDOl8jmCWoNPr8rHzP4MNj/l5NDuNE2EDT4PMwJ03+vnLj
         UbDbc+HvcWzjO+w5IfGzUOWFXn8FxCfRGBvjIEeJbW6SHGp2oVCCpdBFKANefPvdaG+3
         Vw9B5g0MIso3+PT1dTD06b4MXfTT1NYVZH4KEnsXibDQ14650G09plksO3+hwHEhtJ5/
         6zpeDwzgPzFtSQYv6LumLflC/LrzNbZtXY32OFDS2l09HCutBaog45RHU5w6flMuqEH5
         ycjw66jZ6ZSxFvKz0C0bDwCmM3aV0Oo2jrccJ9sCzxoS4vbalAXtCJNL6EEbxWomzR1Q
         zDRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=GB8inY6UkxSK7b05oz5LFm6GUiIud2UztI6zOEllLW8=;
        b=HO+YYqTjMR1RNg2SQ0ura0SQ7vB2YyGRJDZRTo+HNYK1ipH2Mu/Cll52krsHCjLOjI
         RPYl6nSjc2e1D/61m5gF9sZUEiTYMM0JUg5YyOaYN6ghqzHR7WrxdVD1qPWzTmIL6+9i
         wHY8W/3GP/XwiFjj+J79ABAx8uSkp8TTTY/NtyM7lzWZarDHjKUzbOK5c2M2se7D70IH
         BLmqWJ1ACPQEfT/+SvSyz2koh70XDTsmwt9AuSYBEGEt58u9ZA1AZy51fEOOoxCoRXN9
         mDfsuoD/aLldM5DcVGrGIasD7l/n8a1S8VJl5xBq14LwPl+ZFNLz/fvP2gkYCmS118MH
         LHOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=IMJjTSYi;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u22sor13081830ejy.67.2021.03.02.06.59.49
        (Google Transport Security);
        Tue, 02 Mar 2021 06:59:49 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=IMJjTSYi;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GB8inY6UkxSK7b05oz5LFm6GUiIud2UztI6zOEllLW8=;
        b=IMJjTSYiB1fkBZFp2MrDYC/AUegkX+zhWk1OFuVLXWDTPYaqqISGPzuyvsKBQt9U6W
         De/+vWjkmxBsLjiuOtFiCsy5I0xlREAwz4sPwIQL19nm00I0nIhlotDaiW15aO3uL/8I
         fc/hhq7X6U4iQEbwoVVkZ6viotJGtsT2ezTydJW92mPzm6u8q7B0W/Iogb1mxocf3dsg
         yptUzjzQUp7Vny8RMwBgPAfiAVGyP9TegKscTbMmzzdIGKnzQ6NnkUekIGdDDmzwrN7p
         3KRAqMaBsoapuTx8TcRzArq+OI2KndhCVVhuh7SOWdgyj4U3/ui7J3LgLuTenvG7O42u
         hrlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=GB8inY6UkxSK7b05oz5LFm6GUiIud2UztI6zOEllLW8=;
        b=EA++/YyJ1Z0uGnSTPNDXtFw3mHajR/XdZQh7m0C3TtBeKstrSkyCWUQ1tdbE1hwyzk
         1UWKsT7OUbxSQHtxuh8qP5nB8Ej99AJ35qqp8jQCpO/MRKJtGa6DRHuDwXiWK87RrDKn
         Yc9qDM6VCIEHBPzoMPKQG/HMGVsM6EV3M9pyHfskALOkZZnKcXpisKtc8kmCFginHS+R
         B6RjlL2ubfV4L+jghF4CCOGrvhF9VRCztS0xAtHy99ch3sAiyeelPMIyfnJsNuZ68kXr
         W20MNHzIRGayj0tFcKPGAP1ObzJIy/ltHFtbd99NO5NVA02MdHaTcUgzD7XzVEdEOFm4
         D86Q==
X-Gm-Message-State: AOAM531OCW4qapMKe5tOUUQVwtqr0aVY5silCn3Oz6V2e4r2ZlzqvrQb
	tRAyLN18SvFdjQXQp2KaCpY=
X-Google-Smtp-Source: ABdhPJzo22ITm008d6QcdO0TtZIJ79gugpoCnWtNIh62a947O2gaIfoL+MrH30DTkvKuGEd8jXNN4g==
X-Received: by 2002:a17:907:76bb:: with SMTP id jw27mr20988095ejc.366.1614697189065;
        Tue, 02 Mar 2021 06:59:49 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net. [83.57.175.68])
        by smtp.gmail.com with ESMTPSA id y8sm17819516edd.97.2021.03.02.06.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 06:59:48 -0800 (PST)
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
Subject: [PATCH v3 12/27] cpu: Move CPUClass::asidx_from_attrs to SysemuCPUOps
Date: Tue,  2 Mar 2021 15:58:03 +0100
Message-Id: <20210302145818.1161461-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210302145818.1161461-1-f4bug@amsat.org>
References: <20210302145818.1161461-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: OAL6Xiq19ZkB

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h            | 3 ---
 include/hw/core/sysemu-cpu-ops.h | 5 +++++
 hw/core/cpu.c                    | 4 ++--
 target/arm/cpu.c                 | 2 +-
 target/i386/cpu.c                | 2 +-
 5 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 0a2c29c3735..6713a615916 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -108,8 +108,6 @@ struct AccelCPUClass;
  *       associated memory transaction attributes to use for the access.
  *       CPUs which use memory transaction attributes should implement this
  *       instead of get_phys_page_debug.
- * @asidx_from_attrs: Callback to return the CPU AddressSpace to use for
- *       a memory access with the specified memory transaction attributes.
  * @gdb_read_register: Callback for letting GDB read a register.
  * @gdb_write_register: Callback for letting GDB write a register.
  * @gdb_num_core_regs: Number of core registers accessible to GDB.
@@ -151,7 +149,6 @@ struct CPUClass {
     hwaddr (*get_phys_page_debug)(CPUState *cpu, vaddr addr);
     hwaddr (*get_phys_page_attrs_debug)(CPUState *cpu, vaddr addr,
                                         MemTxAttrs *attrs);
-    int (*asidx_from_attrs)(CPUState *cpu, MemTxAttrs attrs);
     int (*gdb_read_register)(CPUState *cpu, GByteArray *buf, int reg);
     int (*gdb_write_register)(CPUState *cpu, uint8_t *buf, int reg);
 
diff --git a/include/hw/core/sysemu-cpu-ops.h b/include/hw/core/sysemu-cpu-ops.h
index 60c667801ef..3c3f211136d 100644
--- a/include/hw/core/sysemu-cpu-ops.h
+++ b/include/hw/core/sysemu-cpu-ops.h
@@ -16,6 +16,11 @@
  * struct SysemuCPUOps: System operations specific to a CPU class
  */
 typedef struct SysemuCPUOps {
+    /**
+     * @asidx_from_attrs: Callback to return the CPU AddressSpace to use for
+     *       a memory access with the specified memory transaction attributes.
+     */
+    int (*asidx_from_attrs)(CPUState *cpu, MemTxAttrs attrs);
     /**
      * @get_crash_info: Callback for reporting guest crash information in
      * GUEST_PANICKED events.
diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index c74390aafbf..c44229205ff 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -116,8 +116,8 @@ int cpu_asidx_from_attrs(CPUState *cpu, MemTxAttrs attrs)
     CPUClass *cc = CPU_GET_CLASS(cpu);
     int ret = 0;
 
-    if (cc->asidx_from_attrs) {
-        ret = cc->asidx_from_attrs(cpu, attrs);
+    if (cc->sysemu_ops->asidx_from_attrs) {
+        ret = cc->sysemu_ops->asidx_from_attrs(cpu, attrs);
         assert(ret < cpu->num_ases && ret >= 0);
     }
     return ret;
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 7dc6956f2cc..acaa3ab68da 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2262,6 +2262,7 @@ static gchar *arm_gdb_arch_name(CPUState *cs)
 
 #ifndef CONFIG_USER_ONLY
 static struct SysemuCPUOps arm_sysemu_ops = {
+    .asidx_from_attrs = arm_asidx_from_attrs,
     .write_elf32_note = arm_cpu_write_elf32_note,
     .write_elf64_note = arm_cpu_write_elf64_note,
     .virtio_is_big_endian = arm_cpu_virtio_is_big_endian,
@@ -2307,7 +2308,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = arm_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_attrs_debug = arm_cpu_get_phys_page_attrs_debug;
-    cc->asidx_from_attrs = arm_asidx_from_attrs;
     cc->sysemu_ops = &arm_sysemu_ops;
 #endif
     cc->gdb_num_core_regs = 26;
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index b26905b22a3..10884540610 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7388,6 +7388,7 @@ static Property x86_cpu_properties[] = {
 
 #ifndef CONFIG_USER_ONLY
 static struct SysemuCPUOps i386_sysemu_ops = {
+    .asidx_from_attrs = x86_asidx_from_attrs,
     .get_crash_info = x86_cpu_get_crash_info,
     .write_elf32_note = x86_cpu_write_elf32_note,
     .write_elf64_note = x86_cpu_write_elf64_note,
@@ -7429,7 +7430,6 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
     cc->get_paging_enabled = x86_cpu_get_paging_enabled;
 
 #ifndef CONFIG_USER_ONLY
-    cc->asidx_from_attrs = x86_asidx_from_attrs;
     cc->get_memory_mapping = x86_cpu_get_memory_mapping;
     cc->get_phys_page_attrs_debug = x86_cpu_get_phys_page_attrs_debug;
     cc->sysemu_ops = &i386_sysemu_ops;
-- 
2.26.2
