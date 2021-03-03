Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp5706368lfg;
        Wed, 3 Mar 2021 13:48:28 -0800 (PST)
X-Received: by 2002:a5d:6304:: with SMTP id i4mr663589wru.155.1614808107962;
        Wed, 03 Mar 2021 13:48:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614808107; cv=none;
        d=google.com; s=arc-20160816;
        b=xvuRhQq+cU/HRu6htN26kvHy7S/Q76wxeWv1fIAf6EIIdlPul4iekPIInfrwZdafUu
         Nt/WYYJDGkdtNzL3mLm0ZVOj+FSB0ABSOyuCHtmCo1c1nBlE3H9KxGnAnqecd+X9g/X/
         dURGrlOxs7J0dC2EcvYoxTWV8XNB5Vnnv0YavkcFQvLujThjaZj2bmhepSrB/fi0OyUa
         thucM9VCoq3E2Y7Q1k+T56C7Ts3jqTmbABWHhESPqdUXQyYVU35GjdylIb5OTVoPAJWr
         +z3sdajeI09PsUuGSXv2msSzmY0Dj9izblfws8DeDSQIA7zoC/v7Hv7btjvMom/UHl1m
         D9aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=+jPLhsEGuSQelHyPz9BxX5tZZqthgY1a40XW4S6Sd60=;
        b=EAppptXqR63xKscrNa2HCrLg3zCM8IiTyPsid35r0/KGdAo8wzsSicU+EmshBPsLY6
         fQsXkmCxOZcnxSNB4XYqRTHpvOnWDQyfAQA4ycJ606lEyA5TqTngy5+bkgL/62wQZt5g
         WTK8u2rDyxkvDr+7XVQnASwVMEpUvXvJ6cjQkosWZ8OoBENVD2nhrnsDNjldjAwGJoO5
         /aJd6bxhOldymUVN+7muq45ol6EiE+aYhThct1xaMYypGfSUr4dByBvcppxLFzpYNyPF
         wctuhfg+Nsqp5KB2/AHXfkbmvKSBk5lGh6ZV+EpfdyvBptMWxnQd4xRa34H/Hc7Vnv0a
         iIPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=WNdrj8dP;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o25sor3479618wmh.17.2021.03.03.13.48.27
        (Google Transport Security);
        Wed, 03 Mar 2021 13:48:27 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=WNdrj8dP;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+jPLhsEGuSQelHyPz9BxX5tZZqthgY1a40XW4S6Sd60=;
        b=WNdrj8dPWwqyXW7+gX3jJsKJVD1MqaTQpRYiqerhSlaYz6eqqr1PX9tsS1AVmWNsqZ
         YWgHUGaFCcna3vaAqyBBak7ItwX4ilmU1ns3TUvkOP+QJAE16y7b6q7F//LRZM9caE6n
         3RoDZ1xhbj07vTJrlsc7gUz9REp83X1jyqxUjIWE+ONwUpOpLch9AyGe14ifqtvnPS4k
         VwTcTXogrH3i/bwg6xDVlOscZZGrE3ItATot/kNB0bUbHlkVhjv2avWBh5dUquBx2uPB
         z5Z+llvdByrPZnVSA5ZhXWG5bFEDh1d4DWws7lTsKzNhne/VQIQhlpYhhsuZw1bgn30x
         Jr+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=+jPLhsEGuSQelHyPz9BxX5tZZqthgY1a40XW4S6Sd60=;
        b=Ymuni5gOuaFvdUxVJmzOh1WO0WW3xS5iDYm4nWWo+2kSfOJGkodjxOp1lye39cSgik
         3uS8zYMLTHK8zDR/HHHaINxegk4Elx+hoNrqfhNjOnjNyEon85g+7kKogdic/3q05ibS
         tdoqw+IDM9/knw32FsUh292ZIIgsJIkeneu1NBgQjDYyMu4OvzrVfqcMu3kInyUxt1xb
         0W/7R8YFQkKgMGZEQYaGTjPKDpiHiYhTgrWHJwGlIXg+oClhFBdQrqOQVlKW9auF9xIE
         oQHuDQb7rWuEdZmGuIEIdDsu9eWDE1hgCs4ZIpgzQ6i13JX+17xMZeERYmVeX23s6rIV
         YGmw==
X-Gm-Message-State: AOAM530I7t8rkVUlZyJ3vmUjckkGvt4c8+t7bWoW3uEFX6k92tRw03HQ
	gIfM78k2gjuTyJ/TNat5yHw=
X-Google-Smtp-Source: ABdhPJzeqoIqC66Phs7TVVWlM+zEFWq9N5xg0qAHePbZ55pTvYFsMxVVPuL5zj5CVmEZa8IHflmKnQ==
X-Received: by 2002:a1c:f60b:: with SMTP id w11mr882481wmc.134.1614808107729;
        Wed, 03 Mar 2021 13:48:27 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net. [83.57.175.68])
        by smtp.gmail.com with ESMTPSA id f16sm32652298wrt.21.2021.03.03.13.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 13:48:27 -0800 (PST)
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
Subject: [PATCH v4 14/28] cpu: Move CPUClass::get_memory_mapping to SysemuCPUOps
Date: Wed,  3 Mar 2021 22:46:54 +0100
Message-Id: <20210303214708.1727801-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303214708.1727801-1-f4bug@amsat.org>
References: <20210303214708.1727801-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: IEfewNT4Qzaq

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
index 0de4ee18bee..b2d3debd1f2 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7388,6 +7388,7 @@ static Property x86_cpu_properties[] = {
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps i386_sysemu_ops = {
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
