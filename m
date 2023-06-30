Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id w11-20020a5d608b000000b00313f7fc35e9sm11940282wrt.63.2023.06.30.11.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 11:13:31 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id B8FB61FFDA;
	Fri, 30 Jun 2023 19:04:27 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Leonardo Bras <leobras@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Peter Xu <peterx@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	Riku Voipio <riku.voipio@iki.fi>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Bandan Das <bsd@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	qemu-arm@nongnu.org,
	Darren Kenny <darren.kenny@oracle.com>,
	Alexander Bulekov <alxndr@bu.edu>,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v4 33/38] linux-user: Emulate /proc/self/smaps
Date: Fri, 30 Jun 2023 19:04:18 +0100
Message-Id: <20230630180423.558337-34-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230630180423.558337-1-alex.bennee@linaro.org>
References: <20230630180423.558337-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: DxJjMsuyed8r

From: Ilya Leoshkevich <iii@linux.ibm.com>

/proc/self/smaps is an extension of /proc/self/maps: it provides the
same lines, plus additional information about each range.

GDB uses /proc/self/smaps when available, which means that
generate-core-file tries it first before falling back to
/proc/self/maps. This, in turn, causes it to dump the host mappings,
since /proc/self/smaps is not emulated and is just passed through.

Fix by emulating /proc/self/smaps. Provide true values only for
Size, KernelPageSize, MMUPageSize and VmFlags. Leave all other values
at 0, which is a valid conservative estimate.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230621203627.1808446-4-iii@linux.ibm.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 linux-user/syscall.c | 58 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 57 insertions(+), 1 deletion(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index ecd9f5e23d..08162cc966 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8042,7 +8042,36 @@ static int open_self_cmdline(CPUArchState *cpu_env, int fd)
     return 0;
 }
 
-static int open_self_maps(CPUArchState *cpu_env, int fd)
+static void show_smaps(int fd, unsigned long size)
+{
+    unsigned long page_size_kb = TARGET_PAGE_SIZE >> 10;
+    unsigned long size_kb = size >> 10;
+
+    dprintf(fd, "Size:                  %lu kB\n"
+                "KernelPageSize:        %lu kB\n"
+                "MMUPageSize:           %lu kB\n"
+                "Rss:                   0 kB\n"
+                "Pss:                   0 kB\n"
+                "Pss_Dirty:             0 kB\n"
+                "Shared_Clean:          0 kB\n"
+                "Shared_Dirty:          0 kB\n"
+                "Private_Clean:         0 kB\n"
+                "Private_Dirty:         0 kB\n"
+                "Referenced:            0 kB\n"
+                "Anonymous:             0 kB\n"
+                "LazyFree:              0 kB\n"
+                "AnonHugePages:         0 kB\n"
+                "ShmemPmdMapped:        0 kB\n"
+                "FilePmdMapped:         0 kB\n"
+                "Shared_Hugetlb:        0 kB\n"
+                "Private_Hugetlb:       0 kB\n"
+                "Swap:                  0 kB\n"
+                "SwapPss:               0 kB\n"
+                "Locked:                0 kB\n"
+                "THPeligible:    0\n", size_kb, page_size_kb, page_size_kb);
+}
+
+static int open_self_maps_1(CPUArchState *cpu_env, int fd, bool smaps)
 {
     CPUState *cpu = env_cpu(cpu_env);
     TaskState *ts = cpu->opaque;
@@ -8089,6 +8118,18 @@ static int open_self_maps(CPUArchState *cpu_env, int fd)
             } else {
                 dprintf(fd, "\n");
             }
+            if (smaps) {
+                show_smaps(fd, max - min);
+                dprintf(fd, "VmFlags:%s%s%s%s%s%s%s%s\n",
+                        (flags & PAGE_READ) ? " rd" : "",
+                        (flags & PAGE_WRITE_ORG) ? " wr" : "",
+                        (flags & PAGE_EXEC) ? " ex" : "",
+                        e->is_priv ? "" : " sh",
+                        (flags & PAGE_READ) ? " mr" : "",
+                        (flags & PAGE_WRITE_ORG) ? " mw" : "",
+                        (flags & PAGE_EXEC) ? " me" : "",
+                        e->is_priv ? "" : " ms");
+            }
         }
     }
 
@@ -8103,11 +8144,25 @@ static int open_self_maps(CPUArchState *cpu_env, int fd)
                     " --xp 00000000 00:00 0",
                     TARGET_VSYSCALL_PAGE, TARGET_VSYSCALL_PAGE + TARGET_PAGE_SIZE);
     dprintf(fd, "%*s%s\n", 73 - count, "",  "[vsyscall]");
+    if (smaps) {
+        show_smaps(fd, TARGET_PAGE_SIZE);
+        dprintf(fd, "VmFlags: ex\n");
+    }
 #endif
 
     return 0;
 }
 
+static int open_self_maps(CPUArchState *cpu_env, int fd)
+{
+    return open_self_maps_1(cpu_env, fd, false);
+}
+
+static int open_self_smaps(CPUArchState *cpu_env, int fd)
+{
+    return open_self_maps_1(cpu_env, fd, true);
+}
+
 static int open_self_stat(CPUArchState *cpu_env, int fd)
 {
     CPUState *cpu = env_cpu(cpu_env);
@@ -8459,6 +8514,7 @@ int do_guest_openat(CPUArchState *cpu_env, int dirfd, const char *pathname,
     const struct fake_open *fake_open;
     static const struct fake_open fakes[] = {
         { "maps", open_self_maps, is_proc_myself },
+        { "smaps", open_self_smaps, is_proc_myself },
         { "stat", open_self_stat, is_proc_myself },
         { "auxv", open_self_auxv, is_proc_myself },
         { "cmdline", open_self_cmdline, is_proc_myself },
-- 
2.39.2
