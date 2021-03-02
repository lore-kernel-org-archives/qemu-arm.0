Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp4538834lfg;
        Tue, 2 Mar 2021 06:59:27 -0800 (PST)
X-Received: by 2002:a17:906:684b:: with SMTP id a11mr12440535ejs.329.1614697167639;
        Tue, 02 Mar 2021 06:59:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614697167; cv=none;
        d=google.com; s=arc-20160816;
        b=KaijXxdAqD7izU9EL8F5T7UAVwUEcDY5HQwR1eI+pJGzh2/OZYGk9XA1Mm9n38Ipah
         xyDBbHeGQ+fi7hWoH+Ux4H7z0eV4RACsRgoWXyu/0+DNuJsAieZLQlYLLGHVXBgtymKD
         Dy6inE+auiovQvodeCjMwm1I+eTaE5yoa87VLeBZqDsoGe8Db2OgxR+szTAnXEHz625f
         aecuofRkYQqbx4S6gXyJSoQmR9Nn7am9fuzf2hbv9wDz73xHiz+6Qn+Xst7OzWGMdQR3
         DbE18JLgKSxIvp/3owGVa0xIWGr1cut0NFIQGv0BXEgJJ7HLZ03BihYse+spWdzNfyjQ
         X0yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=WaQE95EZW9w0jtG86ZuVDK+2I8kDeUh8Unqfgkk9oi8=;
        b=KtB1y9PkApGYnEK4hFDSN4ZobGiW4S8SkJfrGJMHu6pKKUF/VXHwJRCvi8tT5pWOhk
         Ni70fyzXgCnJQ/Bv98q6IUaET/9iMRU5CEUwoY/6VbjtcRc2UhMctWEq+vkHvDTCQRh+
         rl08JqndMlo1Jw48o7BZq2P2G37McTDXeJK/xut34lAOD1vowUweQ7WE2dgC2XEV40xN
         IBr0WJ6Lq8hqEQUQPKPixc1xgZ1LfGq46947GvHJ/US74qcWfbsDYCD+m4DS+E2LnxXu
         KKA+6c1XNiub6GBrql8u+us0yT6jtKA4nvArYM8hR4fqWQ3C42RCluKdso8hvVzkVIGS
         PLUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=pS9zqPXv;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o26sor20550637edw.8.2021.03.02.06.59.27
        (Google Transport Security);
        Tue, 02 Mar 2021 06:59:27 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=pS9zqPXv;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WaQE95EZW9w0jtG86ZuVDK+2I8kDeUh8Unqfgkk9oi8=;
        b=pS9zqPXvVi2IsPH3cQF4J3BrAvlghDAENophKplQx6dJHds165ToSPtPjrZA9S4iIS
         xXhsk+2oVXOVkYUW6y59HMcJjih/qpQ2OAKxePlx2HGZDExyecQNXYJTkJql0kqN75NC
         Sz4qwRG7RGEv0LNS+0EV0/8mW+Xd8Tm7DoFd/Tm3lP/a2xAAc+7co0ChT1ucf/zkDHS/
         240cpQ1Ml+YP5cPGyAuvpP/kjKKyKA8qrGceeSeETR1QHgtizWJQvEKRqvT1w/Itsxo9
         bNEVECJ48XqUvpDoU2snIcMjHhT9I5JGvLxGeBdo8Jahz+as473Si4hRFAES62yGP+lr
         wNiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=WaQE95EZW9w0jtG86ZuVDK+2I8kDeUh8Unqfgkk9oi8=;
        b=SUPrfEkVpJskmQBjnxBaLBG1nBAUVGKW50D1O7GG8oMyuVQgNVHzMxQzrQHCmY5K7h
         Jsya6ke4nu7BZuGg7HAAd19TAFwG3iM6nqfgdGNVxiAo7CK3M0jFpdYUhnz0UZQD0cIy
         vtBCdWMulL4Kla/aHwDX1Jari7CbRkWdpaPVvHuao/+5yuG5q1pRbL2knjf9/WJvvDs9
         CTn2A+GqPvU6fRynefP34GpKq/vWUwijZ05+3KzIyrYf2+BYdrqk6kZ3dZMB1HwJQO4x
         rKPwk2weui18iOeHHtasBMh6KtXpBTCNbXiXYW+a/9eiFDfow5gXodsxfh5r9kBumq+h
         +7Jg==
X-Gm-Message-State: AOAM5336K32Rx+mziuFw9xpbepfvNssVmKxE9l+jENUVDomynZT27foY
	AyGCzSIPvP8Uii/Up1lPOoM=
X-Google-Smtp-Source: ABdhPJyuu08Fn+7nuWgEjISzbV1FOD+wd+HqiaEdluECsuvtSAyXtctebTw9gNKEoWtO5LaV1Gs0Dg==
X-Received: by 2002:a05:6402:158d:: with SMTP id c13mr20719331edv.297.1614697167427;
        Tue, 02 Mar 2021 06:59:27 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net. [83.57.175.68])
        by smtp.gmail.com with ESMTPSA id q16sm9321215ejd.15.2021.03.02.06.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 06:59:26 -0800 (PST)
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
Subject: [PATCH v3 09/27] cpu: Move CPUClass::virtio_is_big_endian to SysemuCPUOps
Date: Tue,  2 Mar 2021 15:58:00 +0100
Message-Id: <20210302145818.1161461-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210302145818.1161461-1-f4bug@amsat.org>
References: <20210302145818.1161461-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: IZGmWV4oHFB1

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
index e03977e4c3c..2bad6307cce 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2262,6 +2262,7 @@ static gchar *arm_gdb_arch_name(CPUState *cs)
 
 #ifndef CONFIG_USER_ONLY
 static struct SysemuCPUOps arm_sysemu_ops = {
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
index b5ed1dbfd26..2dd4f47adbb 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -10845,6 +10845,7 @@ static Property ppc_cpu_properties[] = {
 
 #ifndef CONFIG_USER_ONLY
 static struct SysemuCPUOps ppc_sysemu_ops = {
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
