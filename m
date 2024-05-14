Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b17865sm737840166b.204.2024.05.14.10.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 10:42:54 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 1E3A05FA19;
	Tue, 14 May 2024 18:42:54 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Cornelia Huck <cohuck@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: [PATCH 02/11] scripts/update-linux-header.sh: be more src tree friendly
Date: Tue, 14 May 2024 18:42:44 +0100
Message-Id: <20240514174253.694591-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240514174253.694591-1-alex.bennee@linaro.org>
References: <20240514174253.694591-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: M0d6arfRCsRp

Running "install_headers" in the Linux source tree is fairly
unfriendly as out-of-tree builds will start complaining about the
kernel source being non-pristine. As we have a temporary directory for
the install we should also do the build step here. So now we have:

  $tmpdir/
    $blddir/
    $hdrdir/

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20240510111802.241284-1-alex.bennee@linaro.org>
---
 scripts/update-linux-headers.sh | 80 +++++++++++++++++----------------
 1 file changed, 41 insertions(+), 39 deletions(-)

diff --git a/scripts/update-linux-headers.sh b/scripts/update-linux-headers.sh
index 36f3e91fe4..8963c39189 100755
--- a/scripts/update-linux-headers.sh
+++ b/scripts/update-linux-headers.sh
@@ -27,6 +27,8 @@
 #   types like "__u64".  This work is done in the cp_portable function.
 
 tmpdir=$(mktemp -d)
+hdrdir="$tmpdir/headers"
+blddir="$tmpdir/build"
 linux="$1"
 output="$2"
 
@@ -110,56 +112,56 @@ for arch in $ARCHLIST; do
         arch_var=ARCH
     fi
 
-    make -C "$linux" INSTALL_HDR_PATH="$tmpdir" $arch_var=$arch headers_install
+    make -C "$linux" O="$blddir" INSTALL_HDR_PATH="$hdrdir" $arch_var=$arch headers_install
 
     rm -rf "$output/linux-headers/asm-$arch"
     mkdir -p "$output/linux-headers/asm-$arch"
     for header in kvm.h unistd.h bitsperlong.h mman.h; do
-        cp "$tmpdir/include/asm/$header" "$output/linux-headers/asm-$arch"
+        cp "$hdrdir/include/asm/$header" "$output/linux-headers/asm-$arch"
     done
 
     if [ $arch = mips ]; then
-        cp "$tmpdir/include/asm/sgidefs.h" "$output/linux-headers/asm-mips/"
-        cp "$tmpdir/include/asm/unistd_o32.h" "$output/linux-headers/asm-mips/"
-        cp "$tmpdir/include/asm/unistd_n32.h" "$output/linux-headers/asm-mips/"
-        cp "$tmpdir/include/asm/unistd_n64.h" "$output/linux-headers/asm-mips/"
+        cp "$hdrdir/include/asm/sgidefs.h" "$output/linux-headers/asm-mips/"
+        cp "$hdrdir/include/asm/unistd_o32.h" "$output/linux-headers/asm-mips/"
+        cp "$hdrdir/include/asm/unistd_n32.h" "$output/linux-headers/asm-mips/"
+        cp "$hdrdir/include/asm/unistd_n64.h" "$output/linux-headers/asm-mips/"
     fi
     if [ $arch = powerpc ]; then
-        cp "$tmpdir/include/asm/unistd_32.h" "$output/linux-headers/asm-powerpc/"
-        cp "$tmpdir/include/asm/unistd_64.h" "$output/linux-headers/asm-powerpc/"
+        cp "$hdrdir/include/asm/unistd_32.h" "$output/linux-headers/asm-powerpc/"
+        cp "$hdrdir/include/asm/unistd_64.h" "$output/linux-headers/asm-powerpc/"
     fi
 
     rm -rf "$output/include/standard-headers/asm-$arch"
     mkdir -p "$output/include/standard-headers/asm-$arch"
     if [ $arch = s390 ]; then
-        cp_portable "$tmpdir/include/asm/virtio-ccw.h" "$output/include/standard-headers/asm-s390/"
-        cp "$tmpdir/include/asm/unistd_32.h" "$output/linux-headers/asm-s390/"
-        cp "$tmpdir/include/asm/unistd_64.h" "$output/linux-headers/asm-s390/"
+        cp_portable "$hdrdir/include/asm/virtio-ccw.h" "$output/include/standard-headers/asm-s390/"
+        cp "$hdrdir/include/asm/unistd_32.h" "$output/linux-headers/asm-s390/"
+        cp "$hdrdir/include/asm/unistd_64.h" "$output/linux-headers/asm-s390/"
     fi
     if [ $arch = arm ]; then
-        cp "$tmpdir/include/asm/unistd-eabi.h" "$output/linux-headers/asm-arm/"
-        cp "$tmpdir/include/asm/unistd-oabi.h" "$output/linux-headers/asm-arm/"
-        cp "$tmpdir/include/asm/unistd-common.h" "$output/linux-headers/asm-arm/"
+        cp "$hdrdir/include/asm/unistd-eabi.h" "$output/linux-headers/asm-arm/"
+        cp "$hdrdir/include/asm/unistd-oabi.h" "$output/linux-headers/asm-arm/"
+        cp "$hdrdir/include/asm/unistd-common.h" "$output/linux-headers/asm-arm/"
     fi
     if [ $arch = arm64 ]; then
-        cp "$tmpdir/include/asm/sve_context.h" "$output/linux-headers/asm-arm64/"
+        cp "$hdrdir/include/asm/sve_context.h" "$output/linux-headers/asm-arm64/"
     fi
     if [ $arch = x86 ]; then
-        cp "$tmpdir/include/asm/unistd_32.h" "$output/linux-headers/asm-x86/"
-        cp "$tmpdir/include/asm/unistd_x32.h" "$output/linux-headers/asm-x86/"
-        cp "$tmpdir/include/asm/unistd_64.h" "$output/linux-headers/asm-x86/"
-        cp_portable "$tmpdir/include/asm/kvm_para.h" "$output/include/standard-headers/asm-$arch"
+        cp "$hdrdir/include/asm/unistd_32.h" "$output/linux-headers/asm-x86/"
+        cp "$hdrdir/include/asm/unistd_x32.h" "$output/linux-headers/asm-x86/"
+        cp "$hdrdir/include/asm/unistd_64.h" "$output/linux-headers/asm-x86/"
+        cp_portable "$hdrdir/include/asm/kvm_para.h" "$output/include/standard-headers/asm-$arch"
         # Remove everything except the macros from bootparam.h avoiding the
         # unnecessary import of several video/ist/etc headers
         sed -e '/__ASSEMBLY__/,/__ASSEMBLY__/d' \
-               "$tmpdir/include/asm/bootparam.h" > "$tmpdir/bootparam.h"
-        cp_portable "$tmpdir/bootparam.h" \
+               "$hdrdir/include/asm/bootparam.h" > "$hdrdir/bootparam.h"
+        cp_portable "$hdrdir/bootparam.h" \
                     "$output/include/standard-headers/asm-$arch"
-        cp_portable "$tmpdir/include/asm/setup_data.h" \
+        cp_portable "$hdrdir/include/asm/setup_data.h" \
                     "$output/standard-headers/asm-x86"
     fi
     if [ $arch = riscv ]; then
-        cp "$tmpdir/include/asm/ptrace.h" "$output/linux-headers/asm-riscv/"
+        cp "$hdrdir/include/asm/ptrace.h" "$output/linux-headers/asm-riscv/"
     fi
 done
 arch=
@@ -169,13 +171,13 @@ mkdir -p "$output/linux-headers/linux"
 for header in const.h stddef.h kvm.h vfio.h vfio_ccw.h vfio_zdev.h vhost.h \
               psci.h psp-sev.h userfaultfd.h memfd.h mman.h nvme_ioctl.h \
               vduse.h iommufd.h bits.h; do
-    cp "$tmpdir/include/linux/$header" "$output/linux-headers/linux"
+    cp "$hdrdir/include/linux/$header" "$output/linux-headers/linux"
 done
 
 rm -rf "$output/linux-headers/asm-generic"
 mkdir -p "$output/linux-headers/asm-generic"
 for header in unistd.h bitsperlong.h mman-common.h mman.h hugetlb_encode.h; do
-    cp "$tmpdir/include/asm-generic/$header" "$output/linux-headers/asm-generic"
+    cp "$hdrdir/include/asm-generic/$header" "$output/linux-headers/asm-generic"
 done
 
 if [ -L "$linux/source" ]; then
@@ -210,23 +212,23 @@ EOF
 
 rm -rf "$output/include/standard-headers/linux"
 mkdir -p "$output/include/standard-headers/linux"
-for i in "$tmpdir"/include/linux/*virtio*.h \
-         "$tmpdir/include/linux/qemu_fw_cfg.h" \
-         "$tmpdir/include/linux/fuse.h" \
-         "$tmpdir/include/linux/input.h" \
-         "$tmpdir/include/linux/input-event-codes.h" \
-         "$tmpdir/include/linux/udmabuf.h" \
-         "$tmpdir/include/linux/pci_regs.h" \
-         "$tmpdir/include/linux/ethtool.h" \
-         "$tmpdir/include/linux/const.h" \
-         "$tmpdir/include/linux/kernel.h" \
-         "$tmpdir/include/linux/vhost_types.h" \
-         "$tmpdir/include/linux/sysinfo.h" \
-         "$tmpdir/include/misc/pvpanic.h"; do
+for i in "$hdrdir"/include/linux/*virtio*.h \
+         "$hdrdir/include/linux/qemu_fw_cfg.h" \
+         "$hdrdir/include/linux/fuse.h" \
+         "$hdrdir/include/linux/input.h" \
+         "$hdrdir/include/linux/input-event-codes.h" \
+         "$hdrdir/include/linux/udmabuf.h" \
+         "$hdrdir/include/linux/pci_regs.h" \
+         "$hdrdir/include/linux/ethtool.h" \
+         "$hdrdir/include/linux/const.h" \
+         "$hdrdir/include/linux/kernel.h" \
+         "$hdrdir/include/linux/vhost_types.h" \
+         "$hdrdir/include/linux/sysinfo.h" \
+         "$hdrdir/include/misc/pvpanic.h"; do
     cp_portable "$i" "$output/include/standard-headers/linux"
 done
 mkdir -p "$output/include/standard-headers/drm"
-cp_portable "$tmpdir/include/drm/drm_fourcc.h" \
+cp_portable "$hdrdir/include/drm/drm_fourcc.h" \
             "$output/include/standard-headers/drm"
 
 cat <<EOF >$output/include/standard-headers/linux/types.h
-- 
2.39.2
