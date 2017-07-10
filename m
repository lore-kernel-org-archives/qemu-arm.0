Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id 3sm5512727wrs.18.2017.07.10.07.29.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jul 2017 07:29:26 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 4E99F3E0157;
	Mon, 10 Jul 2017 15:29:26 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	bobby.prani@gmail.com
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Richard Henderson <rth@twiddle.net>
Subject: [RFC PATCH] include/exec/cpu-defs.h: try and make SoftMMU page size match target
Date: Mon, 10 Jul 2017 15:28:49 +0100
Message-Id: <20170710142850.10468-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: KObTaS2VrDsI

While the SoftMMU is not emulating the target MMU of a system there is
a relationship between its page size and that of the target. If the
target MMU is full featured the functions called to re-fill the
entries in the SoftMMU entries start moving up the perf profiles. If
we can we should try and prevent too much thrashing around by having
the page sizes the same.

Ideally we should use TARGET_PAGE_BITS_MIN but that potentially
involves a fair bit of #include re-jigging so I went for 10 bits (1k
pages) which I think is the smallest of all our emulated systems.

Some quick numbers show a reasonable performance win on an x86_64
host:

 ./aarch64-softmmu/qemu-system-aarch64 -machine type=virt \
   -display none -m 16384 -cpu cortex-a57 -serial mon:stdio \
   -drive file=../jessie-arm64.qcow2,id=myblock,index=0,if=none \
   -device virtio-blk-device,drive=myblock \
   -append "console=ttyAMA0 root=/dev/vda1 systemd.unit=benchmark-build.service" \
   -kernel ../aarch64-current-linux-kernel-only.img -machine gic-version=3 -smp 4

8 bit TLB:
  run 1: ret=0 (PASS), time=425.202797 (1/1)
  run 2: ret=0 (PASS), time=410.421742 (2/2)
  run 3: ret=0 (PASS), time=417.666752 (3/3)
  run 4: ret=0 (PASS), time=411.158793 (4/4)
  run 5: ret=0 (PASS), time=417.133068 (5/5)
  Results summary:
  0: 5 times (100.00%), avg time 416.317 (35.70 varience/5.98 deviation)

10 bit TLB
  run 1: ret=0 (PASS), time=359.310380 (1/1)
  run 2: ret=0 (PASS), time=387.826981 (2/2)
  run 3: ret=0 (PASS), time=381.097123 (3/3)
  run 4: ret=0 (PASS), time=393.826197 (4/4)
  run 5: ret=0 (PASS), time=384.340781 (5/5)
  Results summary:
  0: 5 times (100.00%), avg time 381.280 (173.08 varience/13.16 deviation)

CC: Pranith Kumar <bobby.prani@gmail.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/exec/cpu-defs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/exec/cpu-defs.h b/include/exec/cpu-defs.h
index bc8e7f848d..a0f9249752 100644
--- a/include/exec/cpu-defs.h
+++ b/include/exec/cpu-defs.h
@@ -89,7 +89,7 @@ typedef uint64_t target_ulong;
  * of tlb_table inside env (which is non-trivial but not huge).
  */
 #define CPU_TLB_BITS                                             \
-    MIN(8,                                                       \
+    MIN(10,                                                      \
         TCG_TARGET_TLB_DISPLACEMENT_BITS - CPU_TLB_ENTRY_BITS -  \
         (NB_MMU_MODES <= 1 ? 0 :                                 \
          NB_MMU_MODES <= 2 ? 1 :                                 \
-- 
2.13.0
