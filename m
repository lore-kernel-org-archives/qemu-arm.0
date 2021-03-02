Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp4539482lfg;
        Tue, 2 Mar 2021 07:00:12 -0800 (PST)
X-Received: by 2002:a17:906:e0d6:: with SMTP id gl22mr5072128ejb.444.1614697211956;
        Tue, 02 Mar 2021 07:00:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614697211; cv=none;
        d=google.com; s=arc-20160816;
        b=jZ37XKXBqaLSt5UIhR35r+KyiQjhii04GQh1JlY2pxeLyB9IkTE/IK0RAXCXjILkMN
         9u4aK9cWdVHB0JFsb/yLhSL4d/pwZdCA0HN018zPMhPlEiU0gSHyGfMQpUQ3r0CM2vTN
         iU5ht8cLF7LPQkLGHnq9DLnKX92FZUhpxWfw8Xhkm5LwpJY0i7CUSI8ssH+hnxR9J07G
         yUjktHE4yLhtFsZsjKOdPC9WCEC376xrQPkJyy4jymS+Hg24SVfEVCX7RgZEdVDw7opm
         CypZJDIdkLfseTIxRKYhgj9XdfReNX4eV8U4yEwOxtT6gmCGagWaxmkRIhzz3IuQWUej
         B2cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=MXkQdWgohB9uSSp9OtT22O1oCJ949jTBzJW7O9qsdTc=;
        b=TAfySpCwabgsYyx+e6+wKrE66a/SU2Qd2qS0iDBkMppswEbVovwnjmswQUADo65dVN
         oJRujUJOoGTt0ra+0vJAXHIzmbIh72VYk9BCwotaiPpWZnU2QqbO5FDLSXAb4+erxuXT
         m14uDCIPxaGAXZCkKy0bZm3Ww+OPqG7qVQ23utYWLYjbUO5KT4kUXfMiLXwF6LPat8dW
         /0DZaS0V0bAyY/tc0P+M4ytE6LTDteodu9NBtNIIV/DwaNI6a9bT6i0GOGNPBjROvTGk
         9GG1wHlOuDq6t6H7HYB9TEJrpvmjdfoOH8hrk4iLMF8mXiIketClZsIXJbGkJqhJYtnD
         r52A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=GmayORTW;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id hr4sor12637056ejc.51.2021.03.02.07.00.11
        (Google Transport Security);
        Tue, 02 Mar 2021 07:00:11 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=GmayORTW;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MXkQdWgohB9uSSp9OtT22O1oCJ949jTBzJW7O9qsdTc=;
        b=GmayORTWFPj6iDGKUHa7t73OH3hTE1OJrvoWfY0PwzDb/vnzx/mKjkua+X+Z0gjGbs
         GEcOyF1fXcj0Gt+0LjmXtjH4VfoHFtI2oJte+jNXVAR5fq4Sv7XmtE0JzHtrPCfCmQUW
         3DXgkuj8yPjDQe65YoQxQx8iXry1nxCQCOawjGOEoU6HDBOI9o6UswNTP9oUiJ9HU2Sc
         /8z4GcL+ehWHak6J9d5CjsvvxnwlphAX6sZRIBVERthGUxDG4sjJb15S+GkGR40p6DUV
         CxawhI9etqquBI2/9gW3vFt5BQJy3/GD+/yOCgma9cNRWxUz8AGcC0vE2XLm4UzEbf/W
         2pGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=MXkQdWgohB9uSSp9OtT22O1oCJ949jTBzJW7O9qsdTc=;
        b=P0NEt6yKOS03ukudc7IJTGmjP8glcBaQ9q02C9BxMPwfMUnIaoq43DvJOx2dmoOiBH
         u4ewkCbElXNu6ookcJijXO9hLpD/LhmPKnuS14fi/yZUXPIjXlP9ugKXbLvjrydt854H
         zH4RqYh5w79Qv2o/xHLduf4mvQtUzn8uM7Hr+dDefgkLz1LBxUGjZWpvn59i1hgQxNW2
         W2k9BU6oZo1eWqzAUexeumV6CJwWYaUEwsPcBAr0H6W+X2sOed7NGmKEospXPNvGRnUF
         laPWuLHWQGCeA6USPbw3J89uC7cHh2QPAUe3v5NwXlfku/dqSZ3DgI+HOXHv4UraWdCo
         uZtQ==
X-Gm-Message-State: AOAM530Ejf7Ow0BMyfeZBPaxzfQgEvgNzXZOtXVIpqRPxPesagAH2XrK
	D4oOO0VCsnpmrwPMJ2A23Rk=
X-Google-Smtp-Source: ABdhPJzCJ5ZRVmsLs7BPbo8luyvvIsXPCSP371JAB0/fcmYSDVoccxfjf9SnpwtLQZYtRZOD8eWVaA==
X-Received: by 2002:a17:906:f296:: with SMTP id gu22mr20058872ejb.20.1614697210673;
        Tue, 02 Mar 2021 07:00:10 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net. [83.57.175.68])
        by smtp.gmail.com with ESMTPSA id h2sm16480337ejk.32.2021.03.02.07.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 07:00:10 -0800 (PST)
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
Subject: [PATCH v3 15/27] cpu: Move CPUClass::get_paging_enabled to SysemuCPUOps
Date: Tue,  2 Mar 2021 15:58:06 +0100
Message-Id: <20210302145818.1161461-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210302145818.1161461-1-f4bug@amsat.org>
References: <20210302145818.1161461-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Sivz1p620TWX

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
index d33ee9f831e..3519cef8fba 100644
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
 static struct SysemuCPUOps i386_sysemu_ops = {
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
