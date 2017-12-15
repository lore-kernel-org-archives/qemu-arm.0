Received: by 10.223.159.74 with SMTP id f10csp7111886wrg;
        Thu, 14 Dec 2017 19:46:56 -0800 (PST)
X-Google-Smtp-Source: ACJfBovH5PxX/OWxUMKTpHT8z8HFYa1MgjNfRJRvTDPQVKjm5OKJomOjrSbQMY9/PAnB3B9mjoQD
X-Received: by 10.37.162.144 with SMTP id c16mr6054126ybi.291.1513309616719;
        Thu, 14 Dec 2017 19:46:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513309616; cv=none;
        d=google.com; s=arc-20160816;
        b=xI4wBb5rKIY4uYXoAQ7BHVFwbsT0q+JYwVpMyPJ/z3V2urChaj8sQoHhbi7zlsqGX1
         XUtR9op8TE+q92EklBLjEmu8/Vz9PaMfiwla95h1CX1Gfqv0ID+2Ll+Zishnu5aeSnrR
         JfatLUcUenFrlorSDW6GbRnWbaI2g/J9xagw9kY9HipbG7DP6H4NuiaphVsiRQzafxVW
         rHv0OwuK4mVH9i1KuBoougD0Pcs/Ct7ThBRyT+CQZnV2l9kgrojPUlj2qrEO3AvnBSPD
         qXp9YSNPA34LWATdUV5Xxzj+BrMsyulGCdDTOgT2E1YvD8VESYXcvqkOnzzgE7RfgtVf
         Zp2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=XyvpKAuJAffaHA+YlRgb2lXH6lVmwX6zm97HvkhxYy4=;
        b=qruqjJQ5cIiRvHwcTyROYaSM9k+8FNyBXNFomJppYyfK8EMX0tAbmRjtQ8Pq4jhopO
         BfyKL15CVJlF3Mj2J2rWU/PAwkh663+F698U5umW0pQQ0yOLSE1rxrZ1S1oaJs7zGqiH
         eUpsU/DPzOX/JPILYG3jZhr9qnFbRMV/npRPjxnTPigVFKyyLoqjj2Es8mxbhvjj2fQg
         ZdQMeSOf0HVbuvr7ZHsuHWpHVaAsN9wGk8BfkppR5/3DGfqaK3CavIqSXl+il7zXlVB6
         NI0veKqmgmqVq0jTQgfKRNboQHdP07rdxbD/exDHlnkfuMZXXNT/afJ4eg4S495ld8TB
         FQmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nhodMBun;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p64si1087699ybp.23.2017.12.14.19.46.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Dec 2017 19:46:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nhodMBun;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44167 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePgxc-0007fQ-36
	for alex.bennee@linaro.org; Thu, 14 Dec 2017 22:46:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34031)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgiS-00026d-UP
	for qemu-devel@nongnu.org; Thu, 14 Dec 2017 22:31:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgiR-0004M5-DX
	for qemu-devel@nongnu.org; Thu, 14 Dec 2017 22:31:16 -0500
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:44103)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgiR-0004LO-8x; Thu, 14 Dec 2017 22:31:15 -0500
Received: by mail-qk0-x243.google.com with SMTP id h19so8870765qkj.11;
	Thu, 14 Dec 2017 19:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=XyvpKAuJAffaHA+YlRgb2lXH6lVmwX6zm97HvkhxYy4=;
	b=nhodMBunoJhrrPkO0VQ81frk4E7dPyXIqh75IdL2jFQozErGV+qjCqURoQXcMc/Hci
	hhh2VDWY9ejON05xctGNKAN0ycwJodmGCZhfhoykazPyEfHBMdtjoghHmUdliTg0ns1z
	PMzsBnP0gefltpKdfi70MxfmnMwSyKSzht7Zy1wWIJY2Q8I9OGTutFPVo3D2GAUpST4Z
	P9BiOnD4VDs82c7cb1li7BAp/GLgDYiNJiW+uKZ41vq6uss4MzWI4LlAMjZTgvdGghW4
	VqmWPQFImjeC5DfT0bsy4+R8ch5bfi+jfKYvxeUll9daHlUdocdrcROMG1B0/vsA07g4
	kIzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=XyvpKAuJAffaHA+YlRgb2lXH6lVmwX6zm97HvkhxYy4=;
	b=QDDDI6k2VRMROqkrSXmxbq2Eta9fHOezKwOE06hlUGGLn0Bemc2RE/aOT1IiGAmy9D
	sAHj1H6m4SmvsJUSjKOnz6O6NRxmOPiTK3a6j99rK0DoIG7tUWYli+zClERf0S+FjUKF
	bbnIE9jHMUYFw5ulaqDeFflOD3vzu/Nnx9GKYD6Tf9UIoAnNTfq8fWcjLG/cOen7JYKA
	5Kg8wcfWguM5rL27H+uTyISkWJuXTsKhzvIHmmJmnxy8I029deh6VG0tkcl8AQkgNi8Z
	PX6yMvTfcwlRXrj2JWuw/LxH5dsBDHq0SZAyxt5YyNLD/90b1q01/bxGHdma0Lk70AGH
	O65w==
X-Gm-Message-State: AKGB3mJm4IMKcKH2NMevaLwUTq2z4BjwZbs4FAnPVb6JnMDRyyP+I5EJ
	a9XC1Jwyu96aNzvqLqdDoBw=
X-Received: by 10.55.23.24 with SMTP id i24mr19531878qkh.181.1513308674692;
	Thu, 14 Dec 2017 19:31:14 -0800 (PST)
Received: from x1.local ([181.91.222.165]) by smtp.gmail.com with ESMTPSA id
	q24sm3794605qkq.63.2017.12.14.19.31.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 19:31:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Fri, 15 Dec 2017 00:29:45 -0300
Message-Id: <20171215033015.738-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171215033015.738-1-f4bug@amsat.org>
References: <20171215033015.738-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-devel] [PATCH v4 13/43] misc: remove duplicated includes
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	qemu-trivial@nongnu.org, Alexander Graf <agraf@suse.de>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Marcel Apfelbaum <marcel@redhat.com>,
	"open list:X86" <xen-devel@lists.xenproject.org>,
	Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	"open list:S390 Virtio-ccw" <qemu-s390x@nongnu.org>,
	"open list:PXA2XX" <qemu-arm@nongnu.org>,
	Stafford Horne <shorne@gmail.com>, Richard Henderson <rth@twiddle.net>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Cornelia Huck <cohuck@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v8b8mHWLF3Nu

exec: housekeeping (funny since 02d0e095031)

applied using ./scripts/clean-includes

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Acked-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
---
 accel/tcg/translate-all.c          | 1 -
 exec.c                             | 3 ---
 hw/arm/spitz.c                     | 1 -
 hw/char/xen_console.c              | 1 -
 hw/core/machine.c                  | 1 -
 hw/s390x/css.c                     | 1 -
 target/openrisc/exception_helper.c | 1 -
 tests/vhost-user-test.c            | 1 -
 util/qemu-sockets.c                | 1 -
 vl.c                               | 1 -
 10 files changed, 12 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index e7f0329a52..22682d3cf1 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -31,7 +31,6 @@
 #include "tcg.h"
 #if defined(CONFIG_USER_ONLY)
 #include "qemu.h"
-#include "exec/exec-all.h"
 #if defined(__FreeBSD__) || defined(__FreeBSD_kernel__)
 #include <sys/param.h>
 #if __FreeBSD_version >= 700104
diff --git a/exec.c b/exec.c
index 03238a3449..3e7c57e914 100644
--- a/exec.c
+++ b/exec.c
@@ -18,8 +18,6 @@
  */
 #include "qemu/osdep.h"
 #include "qapi/error.h"
-#ifndef _WIN32
-#endif
 
 #include "qemu/cutils.h"
 #include "cpu.h"
@@ -51,7 +49,6 @@
 #include "trace-root.h"
 
 #ifdef CONFIG_FALLOCATE_PUNCH_HOLE
-#include <fcntl.h>
 #include <linux/falloc.h>
 #endif
 
diff --git a/hw/arm/spitz.c b/hw/arm/spitz.c
index feccdb00d3..ac1e15cbbc 100644
--- a/hw/arm/spitz.c
+++ b/hw/arm/spitz.c
@@ -29,7 +29,6 @@
 #include "sysemu/block-backend.h"
 #include "hw/sysbus.h"
 #include "exec/address-spaces.h"
-#include "sysemu/sysemu.h"
 #include "cpu.h"
 
 #undef REG_FMT
diff --git a/hw/char/xen_console.c b/hw/char/xen_console.c
index 3643dfe067..5e68326c19 100644
--- a/hw/char/xen_console.c
+++ b/hw/char/xen_console.c
@@ -27,7 +27,6 @@
 #include "hw/hw.h"
 #include "chardev/char-fe.h"
 #include "hw/xen/xen_backend.h"
-#include "qapi/error.h"
 
 #include <xen/io/console.h>
 
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 36c2fb069c..c857f3f934 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -20,7 +20,6 @@
 #include "sysemu/numa.h"
 #include "qemu/error-report.h"
 #include "qemu/cutils.h"
-#include "sysemu/numa.h"
 #include "sysemu/qtest.h"
 
 static char *machine_get_accel(Object *obj, Error **errp)
diff --git a/hw/s390x/css.c b/hw/s390x/css.c
index f6b5c807cd..e3918db741 100644
--- a/hw/s390x/css.c
+++ b/hw/s390x/css.c
@@ -13,7 +13,6 @@
 #include "qapi/error.h"
 #include "qapi/visitor.h"
 #include "hw/qdev.h"
-#include "qemu/error-report.h"
 #include "qemu/bitops.h"
 #include "qemu/error-report.h"
 #include "exec/address-spaces.h"
diff --git a/target/openrisc/exception_helper.c b/target/openrisc/exception_helper.c
index a8a5f69b05..6073a5b21c 100644
--- a/target/openrisc/exception_helper.c
+++ b/target/openrisc/exception_helper.c
@@ -21,7 +21,6 @@
 #include "cpu.h"
 #include "exec/exec-all.h"
 #include "exec/helper-proto.h"
-#include "exec/exec-all.h"
 #include "exception.h"
 
 void HELPER(exception)(CPUOpenRISCState *env, uint32_t excp)
diff --git a/tests/vhost-user-test.c b/tests/vhost-user-test.c
index 4b98018478..e2c89ed376 100644
--- a/tests/vhost-user-test.c
+++ b/tests/vhost-user-test.c
@@ -21,7 +21,6 @@
 #include "libqos/libqos.h"
 #include "libqos/pci-pc.h"
 #include "libqos/virtio-pci.h"
-#include "qapi/error.h"
 
 #include "libqos/malloc-pc.h"
 #include "hw/virtio/virtio-net.h"
diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index a1cf47e625..af4f01211a 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -26,7 +26,6 @@
 #include "qapi/error.h"
 #include "qemu/sockets.h"
 #include "qemu/main-loop.h"
-#include "qapi/clone-visitor.h"
 #include "qapi/qobject-input-visitor.h"
 #include "qapi/qobject-output-visitor.h"
 #include "qapi-visit.h"
diff --git a/vl.c b/vl.c
index fc8bd9372f..c1ba52306a 100644
--- a/vl.c
+++ b/vl.c
@@ -95,7 +95,6 @@ int main(int argc, char **argv)
 #include "sysemu/kvm.h"
 #include "sysemu/hax.h"
 #include "qapi/qobject-input-visitor.h"
-#include "qapi/qobject-input-visitor.h"
 #include "qapi-visit.h"
 #include "qapi/qmp/qjson.h"
 #include "qemu/option.h"
-- 
2.15.1

