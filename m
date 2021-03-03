Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp5706180lfg;
        Wed, 3 Mar 2021 13:48:06 -0800 (PST)
X-Received: by 2002:a1c:7301:: with SMTP id d1mr807732wmb.33.1614808085949;
        Wed, 03 Mar 2021 13:48:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614808085; cv=none;
        d=google.com; s=arc-20160816;
        b=B35v+XejKwNVcbLmDvRRG4nuFoj2c5fRtm06Z0RFAXm2rLydDlaMIIBIKQRFyE2e1F
         rgRSBhr+/EWCJI/CjXNvetyJff9gW1SIsmVxcjE0ONO5Tq5hLfpqALbaBjMTczDgdFUx
         pdtdn8PKOIkq7rlbuFCh6vpFrrRN0gzEpYEttPp7vJAT8ycuvZmTSX2w/54oiq/9Pbxd
         oP/vG6EQDfSXH7ZseoKYrwb7sXXZiMZuiUhXejFmdcbfzXFcEEHvrtqjOIku4NjndtqI
         jAmrb+jQfUkY5Qg3xjR5Rb6UztMpi2pQCPjnzIyAKjjDcV5pUozFxRUTssBwXRjevG1h
         pRKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=qFTBHcwtMLt6piI19qY9hIVE30tS0o+fHbwt4Y38uFg=;
        b=arrPg9HK5tzs5811IA29Y58q9kIhW2UVq49pWtvjv0Af2m5qccvrgkiXpH9TypAOa7
         qTxJ2BNaKVAKxzkwO15AtS7PiqOHjLUl+UIclULngnd1P9ky/yux4VNf0E1h4zoa4+Xr
         3o/sTk53WB6dMDJZCkms0zTXj1F2KIZlbp+X367LI00s7BisTF+YNN6GYiXSsAvddNqU
         s30dOftbEG2+WQkSageW1pG5zcn792zNrO1tsQCYZ5DuFNTWVbGNWsZB081B6xeXiwjV
         qi9jVIYEA2TwReKW/bAFh9DddzvMDEqo6OhjUxbR2dMOGlNqRjCNCzLw3A9ofxZO4SM+
         fpvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=KQtjxa8q;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id r6sor7680434wrz.23.2021.03.03.13.48.05
        (Google Transport Security);
        Wed, 03 Mar 2021 13:48:05 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=KQtjxa8q;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qFTBHcwtMLt6piI19qY9hIVE30tS0o+fHbwt4Y38uFg=;
        b=KQtjxa8q0oGu1P01ZHc+oTFvjQlJ2RKqckDvVT6RTLR1PDEEHrvrxVoTAzCNYHWo80
         xBpq6O/SZh554bRL3TgBSl+OP6Nc9ZNudPNKHx2VqRjpYeKJ+UXNMMgm2IlSclBcmfDV
         9ulqH1zn0OTBIS2ph46dudYv0N+tFC8b2M8Aw7anGhvbgmBSoyhmrpp9k0err+9GBfnE
         dqqJq3R0x9HAL7LIOuXzP3LLD1TSRQtC5qhoukDRqxK5COfT4+1/vulhzpcoCOzoW/eQ
         yj5WzfLibe7gLHigWZtWvU3h7Fj/wIKlqF+jH1QhLzDib8q8RTbxc6/MIddH3Q38ivV3
         PcZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=qFTBHcwtMLt6piI19qY9hIVE30tS0o+fHbwt4Y38uFg=;
        b=ovzSvk+qdE0i/JwwT4LHOjJXWQa21rhyRdB0y/JCmaMvDkF76K7rOptW5w9uTiVtrh
         Ps5Hl9kzammJE457dTJX11WKKLKq1BE61H6CYhbepjyvr3G5kNaKiSMCFyfFFPpC4knn
         E7jSnIbOFhnrmRGAdwzOgqQu5/aOAgVT7fk4kQgDpDq/3sQejzPrBbiKKp0I3XjbmUB5
         k0Roy5rSPBp32OdL7kCotZq2GB0W4YQDnzhBo8MQY9YJHGqiJlS4QkOZ/pBLSTG8HPPy
         zYmo2OzBUtpX8yEPI1Mse5WIbzFOjvfWihlX9g+dGba4Rw0yL0W1q+ao+U302CFLtWBu
         4pQQ==
X-Gm-Message-State: AOAM5333ucfMfQqRXaLOWl6fFoKiFuVsdjwjlHUyV9iHgrbeN74Eh0WE
	nggMVBfwqs9t/KzCce4Dr8I=
X-Google-Smtp-Source: ABdhPJxMaEhVPf2fe/w19zrKLULEho24wRE6zwqlZ6aAS3z9ICzA5F4ZQ7d+oIM/Mkgue9RwcrMVPw==
X-Received: by 2002:adf:a2c7:: with SMTP id t7mr804405wra.42.1614808085777;
        Wed, 03 Mar 2021 13:48:05 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net. [83.57.175.68])
        by smtp.gmail.com with ESMTPSA id w6sm12282220wrl.49.2021.03.03.13.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 13:48:05 -0800 (PST)
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
	David Hildenbrand <david@redhat.com>
Subject: [PATCH v4 10/28] cpu: Move CPUClass::get_crash_info to SysemuCPUOps
Date: Wed,  3 Mar 2021 22:46:50 +0100
Message-Id: <20210303214708.1727801-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303214708.1727801-1-f4bug@amsat.org>
References: <20210303214708.1727801-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ZBi7VM5Lx0Op

cpu_get_crash_info() is called on GUEST_PANICKED events,
which only occur in system emulation.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h            | 1 -
 include/hw/core/sysemu-cpu-ops.h | 5 +++++
 hw/core/cpu.c                    | 4 ++--
 target/i386/cpu.c                | 2 +-
 target/s390x/cpu.c               | 2 +-
 5 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index dfb50b60128..781cd8fc42b 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -150,7 +150,6 @@ struct CPUClass {
     int (*memory_rw_debug)(CPUState *cpu, vaddr addr,
                            uint8_t *buf, int len, bool is_write);
     void (*dump_state)(CPUState *cpu, FILE *, int flags);
-    GuestPanicInformation* (*get_crash_info)(CPUState *cpu);
     void (*dump_statistics)(CPUState *cpu, int flags);
     int64_t (*get_arch_id)(CPUState *cpu);
     bool (*get_paging_enabled)(const CPUState *cpu);
diff --git a/include/hw/core/sysemu-cpu-ops.h b/include/hw/core/sysemu-cpu-ops.h
index 9c3ac4f2280..b9ffca07665 100644
--- a/include/hw/core/sysemu-cpu-ops.h
+++ b/include/hw/core/sysemu-cpu-ops.h
@@ -16,6 +16,11 @@
  * struct SysemuCPUOps: System operations specific to a CPU class
  */
 typedef struct SysemuCPUOps {
+    /**
+     * @get_crash_info: Callback for reporting guest crash information in
+     * GUEST_PANICKED events.
+     */
+    GuestPanicInformation* (*get_crash_info)(CPUState *cpu);
     /**
      * @virtio_is_big_endian: Callback to return %true if a CPU which supports
      *       runtime configurable endianness is currently big-endian.
diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index 09eaa3fa49f..0aebc18c41f 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -220,8 +220,8 @@ GuestPanicInformation *cpu_get_crash_info(CPUState *cpu)
     CPUClass *cc = CPU_GET_CLASS(cpu);
     GuestPanicInformation *res = NULL;
 
-    if (cc->get_crash_info) {
-        res = cc->get_crash_info(cpu);
+    if (cc->sysemu_ops->get_crash_info) {
+        res = cc->sysemu_ops->get_crash_info(cpu);
     }
     return res;
 }
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index b8f056849a7..362ad56ab68 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7388,6 +7388,7 @@ static Property x86_cpu_properties[] = {
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps i386_sysemu_ops = {
+    .get_crash_info = x86_cpu_get_crash_info,
     .vmsd = &vmstate_x86_cpu,
 };
 #endif
@@ -7427,7 +7428,6 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
     cc->asidx_from_attrs = x86_asidx_from_attrs;
     cc->get_memory_mapping = x86_cpu_get_memory_mapping;
     cc->get_phys_page_attrs_debug = x86_cpu_get_phys_page_attrs_debug;
-    cc->get_crash_info = x86_cpu_get_crash_info;
     cc->write_elf64_note = x86_cpu_write_elf64_note;
     cc->write_elf64_qemunote = x86_cpu_write_elf64_qemunote;
     cc->write_elf32_note = x86_cpu_write_elf32_note;
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index fe908d9bc40..fdc169bb0ac 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -479,6 +479,7 @@ static void s390_cpu_reset_full(DeviceState *dev)
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps s390_sysemu_ops = {
+    .get_crash_info = s390_cpu_get_crash_info,
     .vmsd = &vmstate_s390_cpu,
 };
 #endif
@@ -523,7 +524,6 @@ static void s390_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = s390_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = s390_cpu_get_phys_page_debug;
-    cc->get_crash_info = s390_cpu_get_crash_info;
     cc->write_elf64_note = s390_cpu_write_elf64_note;
     cc->sysemu_ops = &s390_sysemu_ops;
 #endif
-- 
2.26.2
