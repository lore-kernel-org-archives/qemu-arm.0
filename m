Received: by 10.223.197.9 with SMTP id q9csp4801656wrf;
        Tue, 17 Oct 2017 09:51:25 -0700 (PDT)
X-Received: by 10.200.26.99 with SMTP id q32mr20610558qtk.222.1508259085270;
        Tue, 17 Oct 2017 09:51:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508259085; cv=none;
        d=google.com; s=arc-20160816;
        b=iBroqrKRWnVcg98PQz2YR7IzxEMB9m8GBF2JBAu8OB71Th662jsU9hihvzOhC8TWfw
         MJKr5Y2xnRjUdDwfNiF9nGg3R5pJffEggiW3FpAJV+YjNleHSRc4WpwRg7JIdwudna1f
         Bh0PyUgxW9DErPqgGF7DjPosUXuRCy2uDWFKInuID4W7lY6ImZlFgNu7TV2mkHIlyM5S
         Rust6uOLeZ96oUpDYeZxzp7y5RAYJP/tSEszKV+gS+DALRTC8PpU4jf+tK83VPqZ/svO
         XmIfPf/QnpsbJT3Riu8m8CSJPLOH8YTLgKSLzr+7WLx4VBp4J5D8OkA4Pmcl75+cF4El
         CZdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=DnzqFtTaNyiYhqLieZsTUgTvnHGIrUF4UKYJGxllEyY=;
        b=huR0Rq1V69ITRItET0EiD4ifm9yT7k9xf1FN0OENPVJy4RcqtZQ8oUCF3hhZf1XkHq
         vcMoDoUey5Ctqj3/jr4KsjvUs6+R81VnWE/GXVBe0WqChh78JeKhVR0HOhfkedpokD/s
         GYalns9izKIiwc34CHCJWg0FhHDPP6cbjqY3yr9vbb4D59iBF5xC/ifFGixqC7rZZH0a
         EdsPwd4soigSfWELg0uxNr0FWT0R0vP/rlJaCtpU0ZNmbd6SDPBJ0ttA4mOMLNv/CDvU
         J2VXa9yCz/QWDEx8XKCuMgqR5CEZacWM3Awf/FQDlBIKfVPAwqxVkHz22L9UDibYICH9
         KNSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rUyFJ6yV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v21si2582004qth.49.2017.10.17.09.51.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Oct 2017 09:51:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rUyFJ6yV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40563 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e4V5O-0005uv-VG
	for alex.bennee@linaro.org; Tue, 17 Oct 2017 12:51:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46582)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V06-0001fi-Sb
	for qemu-devel@nongnu.org; Tue, 17 Oct 2017 12:45:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V05-0003FS-Kt
	for qemu-devel@nongnu.org; Tue, 17 Oct 2017 12:45:54 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:50271)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V05-0003F7-Gc; Tue, 17 Oct 2017 12:45:53 -0400
Received: by mail-qt0-x241.google.com with SMTP id f15so4900047qtf.7;
	Tue, 17 Oct 2017 09:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=DnzqFtTaNyiYhqLieZsTUgTvnHGIrUF4UKYJGxllEyY=;
	b=rUyFJ6yVFwA05qPKBBHDXphifv8/0J24K4i/fRS+L88K5ywF4EUmI+QTTqEvu8j70F
	jCX0tb0XG2sgxk1wnQZqhFinLCGlsr89SepSfDj4XFwUDScAik5QcUEWD9nZgLRjccm2
	Rt4jMyxli/OUXErZCstukjK130v8ER/WqeggsUR4W4wanMml4qSAB0Cy5FPisxYRdUFa
	hqqsoU4JKk6GG5xlOo9ThYrRzbuFzeTwsNRinvSUjUTt7rwbiNbJk/waYzInfIJKsdT3
	lC7T8rgxptdpgcjLqiO9d8k3W56KTUAfiPH47o0xXknlpDLto/ErECXR7xl+FbS7yFKm
	7jOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=DnzqFtTaNyiYhqLieZsTUgTvnHGIrUF4UKYJGxllEyY=;
	b=fPsGJrryGxpSnyHvAUE+OdIQKjW9MyvpfVjBj3LqDZhWup1KmbsxD8EcUg2msDF3fg
	5HV6/5e3/0bCrvLlYc30xFFqagADCHKjiQpnYA67lryYlVh5xwZpbTNXNosB87J75owF
	ctKrz1Nj16hEQ4mciGTAb/IC2VO+GtaGGNgraVoH09xLw2ykvy9QuxRSunuhziwMhhhD
	3swgl4VZVO7Ra8ryFO1e6h/PFsqefYaULEQ15v4HFBXWY8V5klKHMSsIrsOdPqsQECIs
	B/JCVJCL8meob1yVL4SM8+0tfNf0Du80pfXiG6W4QqbcSFWWLjmVdXZkllfZs4YF4VwA
	nRLA==
X-Gm-Message-State: AMCzsaWHLDYZpZ/HvDojk8vyctZQQZs3U2wsumnK+bg5P1i2JhJgS+Jo
	C32zmC2tF/s7wsRWtvdIZ8qplx7z
X-Google-Smtp-Source: ABhQp+Q8LoM/0zjfG1ETvBJSPHmV1fFCS1YFzl4JUY8nZZMp4CUkrktUnXuj0pcI1urA8ylrlvW+NA==
X-Received: by 10.200.3.205 with SMTP id z13mr2792044qtg.25.1508258752819;
	Tue, 17 Oct 2017 09:45:52 -0700 (PDT)
Received: from x1.local ([181.93.89.178]) by smtp.gmail.com with ESMTPSA id
	q49sm6687653qtq.80.2017.10.17.09.45.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Oct 2017 09:45:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Tokarev <mjt@tls.msk.ru>
Date: Tue, 17 Oct 2017 13:43:57 -0300
Message-Id: <20171017164426.25277-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017164426.25277-1-f4bug@amsat.org>
References: <20171017164426.25277-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-devel] [PATCH v3 13/42] misc: remove duplicated includes
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
X-TUID: iU3EH6ggY51p

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

