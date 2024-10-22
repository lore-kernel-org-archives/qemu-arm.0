Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a91559c06sm324381166b.138.2024.10.22.03.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 03:56:19 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 5CB715F9D0;
	Tue, 22 Oct 2024 11:56:15 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	Thomas Huth <thuth@redhat.com>,
	John Snow <jsnow@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	devel@lists.libvirt.org,
	Cleber Rosa <crosa@redhat.com>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Riku Voipio <riku.voipio@iki.fi>,
	Zhao Liu <zhao1.liu@intel.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 08/20] accel/tcg: add tracepoints for cpu_loop_exit_atomic
Date: Tue, 22 Oct 2024 11:56:02 +0100
Message-Id: <20241022105614.839199-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241022105614.839199-1-alex.bennee@linaro.org>
References: <20241022105614.839199-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 0/accWW+Ulfn

We try to avoid using cpu_loop_exit_atomic as it brings in an all-core
sync point. However on some cpu/kernel/benchmark combinations it is
starting to show up in the performance profile. To make it easier to
see whats going on add tracepoints for the slow path so we can see
what is triggering the wait.

It seems for a modern CPU it can be quite a bit, for example:

./qemu-system-aarch64 \
           -machine type=virt,virtualization=on,pflash0=rom,pflash1=efivars,gic-version=max \
           -smp 4 \
           -accel tcg \
           -device virtio-net-pci,netdev=unet \
           -device virtio-scsi-pci \
           -device scsi-hd,drive=hd \
           -netdev user,id=unet,hostfwd=tcp::2222-:22 \
           -blockdev driver=raw,node-name=hd,file.driver=host_device,file.filename=/dev/zen-ssd2/trixie-arm64,discard=unmap \
           -serial mon:stdio \
           -blockdev node-name=rom,driver=file,filename=(pwd)/pc-bios/edk2-aarch64-code.fd,read-only=true \
           -blockdev node-name=efivars,driver=file,filename=$HOME/images/qemu-arm64-efivars \
           -m 8192 \
           -object memory-backend-memfd,id=mem,size=8G,share=on \
           -kernel /home/alex/lsrc/linux.git/builds/arm64/arch/arm64/boot/Image -append "root=/dev/sda2 console=ttyAMA0 systemd.unit=benchmark-stress-ng.service" \
           -display none -d trace:load_atom\*_fallback,trace:store_atom\*_fallback

With:

  -cpu neoverse-v1,pauth-impdef=on => 2203343

With:

  -cpu cortex-a76 => 0

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

---
v2
  - 0x prefixes for ra as per checkpatch
---
 accel/tcg/user-exec.c          |  2 +-
 accel/tcg/ldst_atomicity.c.inc |  9 +++++++++
 accel/tcg/trace-events         | 12 ++++++++++++
 3 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 51b2c16dbe..aa8af52cc3 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -29,7 +29,7 @@
 #include "exec/page-protection.h"
 #include "exec/helper-proto.h"
 #include "qemu/atomic128.h"
-#include "trace/trace-root.h"
+#include "trace.h"
 #include "tcg/tcg-ldst.h"
 #include "internal-common.h"
 #include "internal-target.h"
diff --git a/accel/tcg/ldst_atomicity.c.inc b/accel/tcg/ldst_atomicity.c.inc
index 134da3c1da..c735add261 100644
--- a/accel/tcg/ldst_atomicity.c.inc
+++ b/accel/tcg/ldst_atomicity.c.inc
@@ -168,6 +168,7 @@ static uint64_t load_atomic8_or_exit(CPUState *cpu, uintptr_t ra, void *pv)
 #endif
 
     /* Ultimate fallback: re-execute in serial context. */
+    trace_load_atom8_or_exit_fallback(ra);
     cpu_loop_exit_atomic(cpu, ra);
 }
 
@@ -212,6 +213,7 @@ static Int128 load_atomic16_or_exit(CPUState *cpu, uintptr_t ra, void *pv)
     }
 
     /* Ultimate fallback: re-execute in serial context. */
+    trace_load_atom16_or_exit_fallback(ra);
     cpu_loop_exit_atomic(cpu, ra);
 }
 
@@ -519,6 +521,7 @@ static uint64_t load_atom_8(CPUState *cpu, uintptr_t ra,
         if (HAVE_al8) {
             return load_atom_extract_al8x2(pv);
         }
+        trace_load_atom8_fallback(memop, ra);
         cpu_loop_exit_atomic(cpu, ra);
     default:
         g_assert_not_reached();
@@ -563,6 +566,7 @@ static Int128 load_atom_16(CPUState *cpu, uintptr_t ra,
         break;
     case MO_64:
         if (!HAVE_al8) {
+            trace_load_atom16_fallback(memop, ra);
             cpu_loop_exit_atomic(cpu, ra);
         }
         a = load_atomic8(pv);
@@ -570,6 +574,7 @@ static Int128 load_atom_16(CPUState *cpu, uintptr_t ra,
         break;
     case -MO_64:
         if (!HAVE_al8) {
+            trace_load_atom16_fallback(memop, ra);
             cpu_loop_exit_atomic(cpu, ra);
         }
         a = load_atom_extract_al8x2(pv);
@@ -897,6 +902,7 @@ static void store_atom_2(CPUState *cpu, uintptr_t ra,
         g_assert_not_reached();
     }
 
+    trace_store_atom2_fallback(memop, ra);
     cpu_loop_exit_atomic(cpu, ra);
 }
 
@@ -961,6 +967,7 @@ static void store_atom_4(CPUState *cpu, uintptr_t ra,
                 return;
             }
         }
+        trace_store_atom4_fallback(memop, ra);
         cpu_loop_exit_atomic(cpu, ra);
     default:
         g_assert_not_reached();
@@ -1029,6 +1036,7 @@ static void store_atom_8(CPUState *cpu, uintptr_t ra,
     default:
         g_assert_not_reached();
     }
+    trace_store_atom8_fallback(memop, ra);
     cpu_loop_exit_atomic(cpu, ra);
 }
 
@@ -1107,5 +1115,6 @@ static void store_atom_16(CPUState *cpu, uintptr_t ra,
     default:
         g_assert_not_reached();
     }
+    trace_store_atom16_fallback(memop, ra);
     cpu_loop_exit_atomic(cpu, ra);
 }
diff --git a/accel/tcg/trace-events b/accel/tcg/trace-events
index 4e9b450520..14f638810c 100644
--- a/accel/tcg/trace-events
+++ b/accel/tcg/trace-events
@@ -12,3 +12,15 @@ memory_notdirty_set_dirty(uint64_t vaddr) "0x%" PRIx64
 
 # translate-all.c
 translate_block(void *tb, uintptr_t pc, const void *tb_code) "tb:%p, pc:0x%"PRIxPTR", tb_code:%p"
+
+# ldst_atomicity
+load_atom2_fallback(uint32_t memop, uintptr_t ra) "mop:0x%"PRIx32", ra:0x%"PRIxPTR""
+load_atom4_fallback(uint32_t memop, uintptr_t ra) "mop:0x%"PRIx32", ra:0x%"PRIxPTR""
+load_atom8_or_exit_fallback(uintptr_t ra) "ra:0x%"PRIxPTR""
+load_atom8_fallback(uint32_t memop, uintptr_t ra) "mop:0x%"PRIx32", ra:0x%"PRIxPTR""
+load_atom16_fallback(uint32_t memop, uintptr_t ra) "mop:0x%"PRIx32", ra:0x%"PRIxPTR""
+load_atom16_or_exit_fallback(uintptr_t ra) "ra:0x%"PRIxPTR""
+store_atom2_fallback(uint32_t memop, uintptr_t ra) "mop:0x%"PRIx32", ra:0x%"PRIxPTR""
+store_atom4_fallback(uint32_t memop, uintptr_t ra) "mop:0x%"PRIx32", ra:0x%"PRIxPTR""
+store_atom8_fallback(uint32_t memop, uintptr_t ra) "mop:0x%"PRIx32", ra:0x%"PRIxPTR""
+store_atom16_fallback(uint32_t memop, uintptr_t ra) "mop:0x%"PRIx32", ra:0x%"PRIxPTR""
-- 
2.39.5
