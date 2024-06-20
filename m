Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57cb72e9943sm9855578a12.51.2024.06.20.08.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 08:22:22 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 6C5285F9FB;
	Thu, 20 Jun 2024 16:22:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jamie Iles <quic_jiles@quicinc.com>,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Mark Burton <mburton@qti.qualcomm.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	qemu-arm@nongnu.org,
	Laurent Vivier <lvivier@redhat.com>,
	Alexander Graf <agraf@csgraf.de>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Marco Liebel <mliebel@qti.qualcomm.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	qemu-s390x@nongnu.org,
	Cameron Esfahani <dirty@apple.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	"Dr. David Alan Gilbert" <dave@treblig.org>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 04/12] sysemu: add set_virtual_time to accel ops
Date: Thu, 20 Jun 2024 16:22:12 +0100
Message-Id: <20240620152220.2192768-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240620152220.2192768-1-alex.bennee@linaro.org>
References: <20240620152220.2192768-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Tk3E6Sbu0KMR

We are about to remove direct calls to individual accelerators for
this information and will need a central point for plugins to hook
into time changes.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20240530220610.1245424-2-pierrick.bouvier@linaro.org>
---
 include/sysemu/accel-ops.h                     | 18 +++++++++++++++++-
 include/sysemu/cpu-timers.h                    |  3 ++-
 ...et-virtual-clock.c => cpus-virtual-clock.c} |  5 +++++
 system/cpus.c                                  | 11 +++++++++++
 stubs/meson.build                              |  2 +-
 5 files changed, 36 insertions(+), 3 deletions(-)
 rename stubs/{cpus-get-virtual-clock.c => cpus-virtual-clock.c} (68%)

diff --git a/include/sysemu/accel-ops.h b/include/sysemu/accel-ops.h
index ef91fc28bb..a088672230 100644
--- a/include/sysemu/accel-ops.h
+++ b/include/sysemu/accel-ops.h
@@ -20,7 +20,12 @@
 typedef struct AccelOpsClass AccelOpsClass;
 DECLARE_CLASS_CHECKERS(AccelOpsClass, ACCEL_OPS, TYPE_ACCEL_OPS)
 
-/* cpus.c operations interface */
+/**
+ * struct AccelOpsClass - accelerator interfaces
+ *
+ * This structure is used to abstract accelerator differences from the
+ * core CPU code. Not all have to be implemented.
+ */
 struct AccelOpsClass {
     /*< private >*/
     ObjectClass parent_class;
@@ -44,7 +49,18 @@ struct AccelOpsClass {
 
     void (*handle_interrupt)(CPUState *cpu, int mask);
 
+    /**
+     * @get_virtual_clock: fetch virtual clock
+     * @set_virtual_clock: set virtual clock
+     *
+     * These allow the timer subsystem to defer to the accelerator to
+     * fetch time. The set function is needed if the accelerator wants
+     * to track the changes to time as the timer is warped through
+     * various timer events.
+     */
     int64_t (*get_virtual_clock)(void);
+    void (*set_virtual_clock)(int64_t time);
+
     int64_t (*get_elapsed_ticks)(void);
 
     /* gdbstub hooks */
diff --git a/include/sysemu/cpu-timers.h b/include/sysemu/cpu-timers.h
index d86738a378..7bfa960fbd 100644
--- a/include/sysemu/cpu-timers.h
+++ b/include/sysemu/cpu-timers.h
@@ -96,8 +96,9 @@ int64_t cpu_get_clock(void);
 
 void qemu_timer_notify_cb(void *opaque, QEMUClockType type);
 
-/* get the VIRTUAL clock and VM elapsed ticks via the cpus accel interface */
+/* get/set VIRTUAL clock and VM elapsed ticks via the cpus accel interface */
 int64_t cpus_get_virtual_clock(void);
+void cpus_set_virtual_clock(int64_t new_time);
 int64_t cpus_get_elapsed_ticks(void);
 
 #endif /* SYSEMU_CPU_TIMERS_H */
diff --git a/stubs/cpus-get-virtual-clock.c b/stubs/cpus-virtual-clock.c
similarity index 68%
rename from stubs/cpus-get-virtual-clock.c
rename to stubs/cpus-virtual-clock.c
index fd447d53f3..af7c1a1d40 100644
--- a/stubs/cpus-get-virtual-clock.c
+++ b/stubs/cpus-virtual-clock.c
@@ -6,3 +6,8 @@ int64_t cpus_get_virtual_clock(void)
 {
     return cpu_get_clock();
 }
+
+void cpus_set_virtual_clock(int64_t new_time)
+{
+    /* do nothing */
+}
diff --git a/system/cpus.c b/system/cpus.c
index f8fa78f33d..d3640c9503 100644
--- a/system/cpus.c
+++ b/system/cpus.c
@@ -229,6 +229,17 @@ int64_t cpus_get_virtual_clock(void)
     return cpu_get_clock();
 }
 
+/*
+ * Signal the new virtual time to the accelerator. This is only needed
+ * by accelerators that need to track the changes as we warp time.
+ */
+void cpus_set_virtual_clock(int64_t new_time)
+{
+    if (cpus_accel && cpus_accel->set_virtual_clock) {
+        cpus_accel->set_virtual_clock(new_time);
+    }
+}
+
 /*
  * return the time elapsed in VM between vm_start and vm_stop.  Unless
  * icount is active, cpus_get_elapsed_ticks() uses units of the host CPU cycle
diff --git a/stubs/meson.build b/stubs/meson.build
index f15b48d01f..772a3e817d 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -29,7 +29,7 @@ endif
 if have_block or have_ga
   stub_ss.add(files('replay-tools.c'))
   # stubs for hooks in util/main-loop.c, util/async.c etc.
-  stub_ss.add(files('cpus-get-virtual-clock.c'))
+  stub_ss.add(files('cpus-virtual-clock.c'))
   stub_ss.add(files('icount.c'))
   stub_ss.add(files('graph-lock.c'))
   if linux_io_uring.found()
-- 
2.39.2
