Received: by 10.223.197.9 with SMTP id q9csp4052831wrf;
        Mon, 16 Oct 2017 17:20:25 -0700 (PDT)
X-Received: by 10.55.19.98 with SMTP id d95mr16927193qkh.123.1508199625062;
        Mon, 16 Oct 2017 17:20:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508199625; cv=none;
        d=google.com; s=arc-20160816;
        b=wETR/Nct8bZG7MtOHZRuID6m+jvXulkqGgacOW335tdTaiQM0c6PCM3ZdtkD+7DWIO
         ifOeoJxJxwdw4jXBIDqO5GHGCap1sf0PhAM/FZI0kyl/KALaP1tGA6EmyQQgUuWnY49E
         EEvol89SMSDLVsxBNkzDbK1ReFCE+dI1Yub8ei/xG9TfDWM3fW5g2z0MgjJA+QMLAmQi
         fz3HdpvX20Ki4gA3bIhwS7DycywMwRzecLsOYHWw+ev+oYP24aTkCL0LewSuI/tValHa
         rNw2qv2kNCkHt6NGo2dmXyIWQec2AYEmS147VlO35yng5x6wlFH0z7YnPBgLJOdDDlp+
         4NnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=DnzqFtTaNyiYhqLieZsTUgTvnHGIrUF4UKYJGxllEyY=;
        b=c7Jhq7MUtnaaBnL/uUSR4DFbdAkLP0eCgHzrDE3aNE5TbA5VCABB5bNqXkyKxw1kb0
         wXB7cwYbKNjzQSSFEkNDFOZhPLGE5R+TcmxwQvUS8TRUoCfTMhp5m/fiPjd9O/ZF9DsD
         TzqtZnbAt6N71HD3+2pb61IhCpSVGOaV7W0eLeD/VcclrcgainPNrxhn4nLE4hXt0lek
         pgly+RlNF+l3XrWngErRmZdGMbvtzY+YQh4HNI6lTHYm4fbThO46dZBrglHQz377keGo
         0pkYjNl1iWHWJBUJrZVfgMraJiKVCD227YeTim/BeSzZBMnLqOMdMVB5XslOILo0B2h1
         IdJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ufCg3ob8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k198si6715886qke.395.2017.10.16.17.20.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Oct 2017 17:20:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ufCg3ob8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35742 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e4FcM-0003Ko-PC
	for alex.bennee@linaro.org; Mon, 16 Oct 2017 20:20:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33325)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FVM-00068g-8g
	for qemu-devel@nongnu.org; Mon, 16 Oct 2017 20:13:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FVK-00040p-O9
	for qemu-devel@nongnu.org; Mon, 16 Oct 2017 20:13:08 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:50943)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FVK-00040f-JH; Mon, 16 Oct 2017 20:13:06 -0400
Received: by mail-qt0-x244.google.com with SMTP id f15so53183qtf.7;
	Mon, 16 Oct 2017 17:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=DnzqFtTaNyiYhqLieZsTUgTvnHGIrUF4UKYJGxllEyY=;
	b=ufCg3ob8H9EYIwBFfgdiy/zRuDxeveR+zV1towy86FLXgdkymTFYUrEQmBSvH2qj38
	k0oHmufP91HDgUaQOM1OL5QlCnwSUkDTD2otxEcy/7Xvi8VtP6P2N9m12q3D86eAYGKa
	fKzo/JDO/tIoEMMZIOtZZX1vYLQywBJbndyL1gxKRZj50Eh8tfeANLXn8iRXqYC+TIOU
	js0CQzdK6Iuy74o5QdlTN2JYPW/l13wToAYAvRMvEiupzj+6BggQQEeBSpW3Yr+R8ww5
	W3DgYFHfv+S5EB7sd37+CGfNp7Fd0W6BqXffCsWib1COYtgwuKqaCwCKdknxlb2d2Bse
	bRPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=DnzqFtTaNyiYhqLieZsTUgTvnHGIrUF4UKYJGxllEyY=;
	b=SmCj6HfODmiKDEOUyxglQOYaYB1VJ6X6EXDb0SaJjzRXIH8cG0RN3w+8R69cd37keN
	L85dwCsko/TLWGnmAzxUW/HasXGKkfC7wt9lEydbVfUXQ0Ks9v7bA15L0woMbcl+RtZb
	FMXzSshn9tKyUDZT40WO1nCXC7YWyiMhdykw2K70JrF4YXcwCm6v0nMObKYkDlWzd5Xo
	hUO7ZevcfBxpE30ltoN9nOxotca986wsGhGp3MarCal9SkqulruJzuq1zU+YIXGSYsX9
	lLVKFF0yb7fXqvpbzyZVYyzmEYShuck+HkrES+xM+qQG4/+1gBXsyc+eoFYOJf6NZX7Z
	t4lQ==
X-Gm-Message-State: AMCzsaWeInpg8+KjqEuCrrNVWBugD/4M6yXDTpbf4OQ8AZdsk3SehcYb
	5Ee9bKywshQoxMeh22fiTNsgblue
X-Google-Smtp-Source: AOwi7QBtCdDe3MudQxKp/WPsUc+++nMWxTWE3d934s7T5wF5KgO8VC4HH65QFP0jGxStD9j7h2P2xw==
X-Received: by 10.237.60.154 with SMTP id d26mr15473900qtf.227.1508199186097; 
	Mon, 16 Oct 2017 17:13:06 -0700 (PDT)
Received: from x1.local ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id r6sm5409043qkh.22.2017.10.16.17.13.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Oct 2017 17:13:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 16 Oct 2017 21:11:42 -0300
Message-Id: <20171017001209.32276-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017001209.32276-1-f4bug@amsat.org>
References: <20171017001209.32276-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-devel] [PATCH v2 12/39] misc: remove duplicated includes
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
Cc: qemu-trivial@nongnu.org, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CLLde3HxOnli

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
index c5ce99d549..f81afb87e6 100644
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
index 6378714a2b..c19061465f 100644
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
index 35683d7954..2f4d40a5fb 100644
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
index d149383bb9..d700caef45 100644
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
index 0723835bbf..0d1f612629 100644
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
2.15.0.rc0

