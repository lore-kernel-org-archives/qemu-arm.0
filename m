Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp270447ejb;
        Thu, 30 Nov 2023 06:34:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG58G0s8FYjStcQzs80iWgvTP8mwQPU1z6xa7IoOsir3FRY9gOXuGJIAdWkJHSH0TiGxPBd
X-Received: by 2002:ad4:442e:0:b0:67a:2493:fdf with SMTP id e14-20020ad4442e000000b0067a24930fdfmr19828414qvt.17.1701354870424;
        Thu, 30 Nov 2023 06:34:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701354870; cv=none;
        d=google.com; s=arc-20160816;
        b=WtbNGU84a+MOu5XI4bygCrbcmEeGy5AiCJU23DrQEBAvUVZqIh1sHXpl9srMNrvmKu
         Y8VZHjDZP0WR0CtN6C32Cpv9B+JnsCFxTjprpalKs2QkwjW0jwI6wd+Goz+8SUTSlF+S
         y35dwsooU+sMMo8Ef/Y7UuWXjomfQ3529lmkuCeEvI0sDc4FJEtpd0x3MipXiD29GTmP
         n05T8LnCeQI0V05lGtrHOglEraW3iEzFzFS7lo6e3mUzYs4hL/LKBrwh3jvujdC/twOO
         CAxCAdfZtjhZOlGlipMlFG+MoB4ly52QM6UPwT4gy2LEHprYwV6GBRJ1QAXE8Z/NuJ41
         4LWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=NhGSjSM8zvmYtF9htWUN1IC/xVQTqQTxXNmapm/ov9g=;
        fh=EvzXIS2ygU9QKs+dZ6sztfuJi5WQr5izWtbugpSw92U=;
        b=JPD3yoRr+3YKBXADuDi8rfI1cq7wmGEWTVtYGShaTRDDeOoetTgdEnLUfn4+eUuk+S
         011Uvi6IyqyFU4RcQJ7u+vvPHbozuyisM3MzTXsqLfm22Uwp4/ADu7ZE1O3k3HAx9FgL
         +W4+FZjWDcuuLyoN+jzQmRHEjYNOIpkmoS2p+FKTP1oqGCMYs1tPvsYzrL+m+h0d7qZ7
         pNv7V4kQGYYatAaXTE00FICLldgW2lOPFNUr88FnjF1xHaZ1YVo9Q1XiBgO4YBbxo3g8
         zEVamLfQYuKiDSbeBc3xpsQ1kR11G4CokzXppXKT1bWoaCJccs3VK2bpYu9HiBnnEmdg
         +Wpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=A7LjNdy2;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@linux.intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.55.52.43])
        by mx.google.com with ESMTPS id d1-20020a0ce701000000b006471c003ddcsi1084530qvn.612.2023.11.30.06.34.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Nov 2023 06:34:30 -0800 (PST)
Received-SPF: none (google.com: linux.intel.com does not designate permitted sender hosts) client-ip=192.55.52.43;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=A7LjNdy2;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701354870; x=1732890870;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=R67m9mW34W7uiETtegm4359TeHvWglaSP7oCtBRRyHM=;
  b=A7LjNdy2Cl1idzU5WEFIh+IWk8Jzgx+oZMnkcWWtXEiBUFFkT/qfZgE5
   hxToLcxpj6GyFJdUmYrR3xl6iTpyXjCHVXryCJivk9IVEXMynH3qD/F93
   eZnF3oI3uoB9wTsOYbYzwVhR7rujApL7YoQncNreDK3s+PWogwgDKYscv
   fHDjpsvLXafe7ptI6j94QyqN6O6c7lNS5pSNyI0uu2LE+70jBQgd3MemS
   3iUMkv9SeFyfAk2dsH0xS2vL1De5JV3jYMzlr9VFS03gM1krd3pUFUXvZ
   rlBt+VgCxFCc1s4joYsmk5zTtuxFaA0iw00Mg+BNptKoBPWRsXqqVMfY7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479532200"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="479532200"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 06:34:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942730090"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="942730090"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 06:34:18 -0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	=?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Barrat?= <fbarrat@linux.ibm.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair@alistair23.me>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Bin Meng <bin.meng@windriver.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	qemu-devel@nongnu.org,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	xen-devel@lists.xenproject.org,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-s390x@nongnu.org
Cc: Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Zhiyuan Lv <zhiyuan.lv@intel.com>,
	Zhenyu Wang <zhenyu.z.wang@intel.com>,
	Yongwei Ma <yongwei.ma@intel.com>,
	Zhao Liu <zhao1.liu@intel.com>
Subject: [RFC 25/41] hw/cpu/book: Abstract cpu-book level as topology device
Date: Thu, 30 Nov 2023 22:41:47 +0800
Message-Id: <20231130144203.2307629-26-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
References: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: UOxibuAvZrlr

From: Zhao Liu <zhao1.liu@intel.com>

Abstract book level as a topology device "cpu-book" to allow user to
create book level topology from cli and later the cpu-books could be
added into topology tree.

In addition, mark the cpu-book as DEVICE_CATEGORY_CPU_DEF category to
indicate it belongs to the basic CPU definition and should be created
from cli before board initialization.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 MAINTAINERS           |  2 ++
 hw/cpu/book.c         | 46 +++++++++++++++++++++++++++++++++++++++++++
 hw/cpu/meson.build    |  2 +-
 include/hw/cpu/book.h | 38 +++++++++++++++++++++++++++++++++++
 4 files changed, 87 insertions(+), 1 deletion(-)
 create mode 100644 hw/cpu/book.c
 create mode 100644 include/hw/cpu/book.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 6a9fa0aeed0c..dd5adfda64cc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1862,6 +1862,7 @@ F: hw/core/machine.c
 F: hw/core/machine-smp.c
 F: hw/core/null-machine.c
 F: hw/core/numa.c
+F: hw/cpu/book.c
 F: hw/cpu/cluster.c
 F: hw/cpu/die.c
 F: hw/cpu/socket.c
@@ -1871,6 +1872,7 @@ F: qapi/machine-target.json
 F: include/hw/boards.h
 F: include/hw/core/cpu.h
 F: include/hw/core/cpu-topo.h
+F: include/hw/cpu/book.h
 F: include/hw/cpu/cluster.h
 F: include/hw/cpu/die.h
 F: include/hw/cpu/socket.h
diff --git a/hw/cpu/book.c b/hw/cpu/book.c
new file mode 100644
index 000000000000..4b16267b10eb
--- /dev/null
+++ b/hw/cpu/book.c
@@ -0,0 +1,46 @@
+/*
+ * CPU book abstract device
+ *
+ * Copyright (c) 2023 Intel Corporation
+ * Author: Zhao Liu <zhao1.liu@intel.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License,
+ * or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/cpu/book.h"
+
+static void cpu_book_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    CPUTopoClass *tc = CPU_TOPO_CLASS(oc);
+
+    set_bit(DEVICE_CATEGORY_CPU_DEF, dc->categories);
+
+    tc->level = CPU_TOPO_BOOK;
+}
+
+static const TypeInfo cpu_book_type_info = {
+    .name = TYPE_CPU_BOOK,
+    .parent = TYPE_CPU_TOPO,
+    .class_init = cpu_book_class_init,
+    .instance_size = sizeof(CPUBook),
+};
+
+static void cpu_book_register_types(void)
+{
+    type_register_static(&cpu_book_type_info);
+}
+
+type_init(cpu_book_register_types)
diff --git a/hw/cpu/meson.build b/hw/cpu/meson.build
index 251724fea86c..c44b54c5abb0 100644
--- a/hw/cpu/meson.build
+++ b/hw/cpu/meson.build
@@ -1,4 +1,4 @@
-system_ss.add(files('core.c', 'cluster.c', 'die.c', 'socket.c'))
+system_ss.add(files('core.c', 'cluster.c', 'die.c', 'socket.c', 'book.c'))
 
 system_ss.add(when: 'CONFIG_ARM11MPCORE', if_true: files('arm11mpcore.c'))
 system_ss.add(when: 'CONFIG_REALVIEW', if_true: files('realview_mpcore.c'))
diff --git a/include/hw/cpu/book.h b/include/hw/cpu/book.h
new file mode 100644
index 000000000000..b91bd553bea6
--- /dev/null
+++ b/include/hw/cpu/book.h
@@ -0,0 +1,38 @@
+/*
+ * CPU book abstract device
+ *
+ * Copyright (c) 2023 Intel Corporation
+ * Author: Zhao Liu <zhao1.liu@intel.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License,
+ * or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef HW_CPU_BOOK_H
+#define HW_CPU_BOOK_H
+
+#include "hw/core/cpu-topo.h"
+#include "hw/qdev-core.h"
+
+#define TYPE_CPU_BOOK "cpu-book"
+
+OBJECT_DECLARE_SIMPLE_TYPE(CPUBook, CPU_BOOK)
+
+struct CPUBook {
+    /*< private >*/
+    CPUTopoState obj;
+
+    /*< public >*/
+};
+
+#endif /* HW_CPU_BOOK_H */
-- 
2.34.1
