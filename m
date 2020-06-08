Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp5206350lfc;
        Mon, 8 Jun 2020 09:05:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvAvsHuaC2lmkHwCY3kDP3jQwDsddzt+tVQz5XZAGdwgWgEUnp4IJFw6CEgBuZ28cVzlCG
X-Received: by 2002:a25:ba84:: with SMTP id s4mr36687203ybg.6.1591632351451;
        Mon, 08 Jun 2020 09:05:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591632351; cv=none;
        d=google.com; s=arc-20160816;
        b=IUaPB3f9MKiUJh83NpjJ3x6gRSt3iz+kfFNSqESg9MeFKUvEBkQo25Sh7R2hMsunGa
         /F4P0GleTPYbKNf+Pbs478uIWYQcKijxCW/g+QIvAwcuVtrYZF2lPuzkEn9e3VbH91Pa
         giWrM6hDKUXptYLC6nkiXTkHewpO9RASE8Vqmby7wF5BJ5ubSOhVFnf0rPOs0l0Q/QVS
         wFAbXt9/FIEAAlKaTcmq//RNE+NzFMi7Pv3oGS2NRFD+U9EZHbEf016NIB5S+Q87QFnu
         5Un7lRbaGu+cB2ncHZP/Mwm86eSeIzU9IgXev+bm2SpCdvvfheKOxMz5+X7v6gQUUD3q
         oN9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=5qtqeym41wYPVUNcQP0hBuZd3ZN8CptiJr597zGfRw0=;
        b=nTkwzp6wkS9ZjZB0QzZJvAPGgnSIhj1tHe0c7bYA+wtlsOB32clnl8t11+uw5oNhIm
         VnfUU6F4KfVEEZtNQ39+lfZcpo0u951WNBktz7fELkm4YozaiSI6/ekK+ZnBs94BO+2F
         WgeDre6kk1YXMB1CxTvXv0ykiQzVThxTSnkkF8yG6ze54NPVzeyA0zE8K5EMfSFsv2Sk
         qX+FQKBBO+4U/M8u6GAydvOpJ8IFQdO3kwlCxhtr9glE7KowjVsSAA6N6t+iw86ZZowl
         uGWPyowsNngUFGXspG+EeHjmh/MDFms8dG7ErKfmhg0K7ZZGylvXL1DjbZL714H3/q8G
         ReNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZJ1bmmLC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e129si32872ybf.359.2020.06.08.09.05.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jun 2020 09:05:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZJ1bmmLC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jiKHW-0001Wm-O4
	for alex.bennee@linaro.org; Mon, 08 Jun 2020 12:05:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKCy-00060H-6t
 for qemu-arm@nongnu.org; Mon, 08 Jun 2020 12:01:10 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:20984
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKCw-0007Sf-Fk
 for qemu-arm@nongnu.org; Mon, 08 Jun 2020 12:01:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5qtqeym41wYPVUNcQP0hBuZd3ZN8CptiJr597zGfRw0=;
 b=ZJ1bmmLC8MzdFyhdJ/AYRnrDCyOMjqlp8Q3RNPHP7aw673+RFfO7MAjat4egBPWFlRoMh5
 KlHhjiLzfymReJojXx53IxMXyUGhDC0Q6sYBvyofF8yCZCYEuoHuDCuVigj6NumCRljMpS
 QBJbsDReAANM/DWECAyami/OuifkIMs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-_G_Zg5OCNXOxzyxCZ6WUOA-1; Mon, 08 Jun 2020 12:01:00 -0400
X-MC-Unique: _G_Zg5OCNXOxzyxCZ6WUOA-1
Received: by mail-wm1-f69.google.com with SMTP id h6so3134wmb.7
 for <qemu-arm@nongnu.org>; Mon, 08 Jun 2020 09:01:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5qtqeym41wYPVUNcQP0hBuZd3ZN8CptiJr597zGfRw0=;
 b=rDsU6G4fFyYZSoSWqAvHDZ7zov4SzH8vbf9po6CiscJTrKnZS9UkzXEHVY3ixkd0Js
 b1JzPT8vcX8b84OVp8FL029K1r0d3kT0HQPJSQiTXgn5CCpz6vbWWFTDt9sdw3ijO4wK
 iEYbEfdzqaAyHK1+QngujdwpQketrP3BiYobYq/xVNKW05U5LEi/sj4pc28aoCirjQS2
 rAO/SLxiE+kp4mRA82U7htKuLqdAwTKkDhzI/PguIQ3fjfMCV2lv66Id50LJisOME12p
 H/vTWQrN+C4QupFf2DVeGgBlAua1ejQm0UPxh5OcYsgU1j6xR1SVRjXOFQvCiAor7bhl
 vVZg==
X-Gm-Message-State: AOAM531JsfxSjaT6sdHhqg8rNGO+ut/UMceBDVh7mHN4qolSUdEcIgCt
 Qmh8AZ2IWhJ1lhjNIBaXgysr+EBZ7TF2cqlf45ZJ3bTQ1dCVOwl55DnxWZWc6wmxtCiZpi0x8Ok
 57InL/wLQHr1f
X-Received: by 2002:adf:de0b:: with SMTP id b11mr24236304wrm.346.1591632059269; 
 Mon, 08 Jun 2020 09:00:59 -0700 (PDT)
X-Received: by 2002:adf:de0b:: with SMTP id b11mr24236267wrm.346.1591632059025; 
 Mon, 08 Jun 2020 09:00:59 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id z12sm227313wrg.9.2020.06.08.09.00.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:00:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 02/35] hw/core/qdev: Add
 qdev_warn_deprecated_function_used() helper
Date: Mon,  8 Jun 2020 18:00:11 +0200
Message-Id: <20200608160044.15531-3-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200608160044.15531-1-philmd@redhat.com>
References: <20200608160044.15531-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/08 11:58:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul@xen.org>, Magnus Damm <magnus.damm@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Andrzej Zaborowski <balrogg@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org,
 Stafford Horne <shorne@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <rth@twiddle.net>,
 "Daniel P . Berrange" <berrange@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FGT7ZgKrW1zJ

When built with --enable-qdev-deprecation-warning, calling
qdev_warn_deprecated_function_used() will emit a warning such:

  $ qemu-system-arm -M verdex ...
  qemu-system-arm: warning: use of deprecated non-qdev/non-qom code in pxa2xx_lcdc_init()
  qemu-system-arm: warning: use of deprecated non-qdev/non-qom code in pxa2xx_i2s_init()
  qemu-system-arm: warning: use of deprecated non-qdev/non-qom code in pxa27x_keypad_init()

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 configure                    |  8 ++++++++
 include/hw/qdev-deprecated.h | 26 ++++++++++++++++++++++++++
 hw/core/qdev.c               |  8 ++++++++
 3 files changed, 42 insertions(+)
 create mode 100644 include/hw/qdev-deprecated.h

diff --git a/configure b/configure
index 597e909b53..9b7a8927c6 100755
--- a/configure
+++ b/configure
@@ -434,6 +434,7 @@ edk2_blobs="no"
 pkgversion=""
 pie=""
 qom_cast_debug="yes"
+qdev_deprecation_warning="no"
 trace_backends="log"
 trace_file="trace"
 spice=""
@@ -1114,6 +1115,8 @@ for opt do
   ;;
   --enable-qom-cast-debug) qom_cast_debug="yes"
   ;;
+  --enable-qdev-deprecation-warning) qdev_deprecation_warning="yes"
+  ;;
   --disable-virtfs) virtfs="no"
   ;;
   --enable-virtfs) virtfs="yes"
@@ -1882,6 +1885,7 @@ disabled with --disable-FEATURE, default is enabled if available:
   virglrenderer   virgl rendering support
   xfsctl          xfsctl support
   qom-cast-debug  cast debugging support
+  qdev-deprecation-warning display qdev deprecation warnings
   tools           build qemu-io, qemu-nbd and qemu-img tools
   vxhs            Veritas HyperScale vDisk backend support
   bochs           bochs image format support
@@ -6723,6 +6727,7 @@ echo "gcov enabled      $gcov"
 echo "TPM support       $tpm"
 echo "libssh support    $libssh"
 echo "QOM debugging     $qom_cast_debug"
+echo "QDEV deprecation warnings $qdev_deprecation_warning"
 echo "Live block migration $live_block_migration"
 echo "lzo support       $lzo"
 echo "snappy support    $snappy"
@@ -7345,6 +7350,9 @@ fi
 if test "$qom_cast_debug" = "yes" ; then
   echo "CONFIG_QOM_CAST_DEBUG=y" >> $config_host_mak
 fi
+if test "$qdev_deprecation_warning" = "yes" ; then
+  echo "CONFIG_QDEV_DEPRECATION_WARNING=y" >> $config_host_mak
+fi
 if test "$rbd" = "yes" ; then
   echo "CONFIG_RBD=m" >> $config_host_mak
   echo "RBD_CFLAGS=$rbd_cflags" >> $config_host_mak
diff --git a/include/hw/qdev-deprecated.h b/include/hw/qdev-deprecated.h
new file mode 100644
index 0000000000..b815f62dae
--- /dev/null
+++ b/include/hw/qdev-deprecated.h
@@ -0,0 +1,26 @@
+/*
+ * QEMU QOM qdev deprecation helpers
+ *
+ * Copyright (c) 2020 Red Hat, Inc.
+ *
+ * Author:
+ *   Philippe Mathieu-Daudé <philmd@redhat.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+#ifndef HW_QDEV_DEPRECATED_H
+#define HW_QDEV_DEPRECATED_H
+
+/**
+ * qdev_warn_deprecated_function_used:
+ *
+ * Display a warning that deprecated code is used.
+ */
+#define qdev_warn_deprecated_function_used() \
+    qdev_warn_deprecated_function(__func__)
+void qdev_warn_deprecated_function(const char *function);
+
+#endif
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 9e5538aeae..901fa93657 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -35,6 +35,7 @@
 #include "hw/hotplug.h"
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
+#include "hw/qdev-deprecated.h"
 #include "hw/boards.h"
 #include "hw/sysbus.h"
 #include "hw/qdev-clock.h"
@@ -819,6 +820,13 @@ void qdev_alias_all_properties(DeviceState *target, Object *source)
     } while (class != object_class_by_name(TYPE_DEVICE));
 }
 
+void qdev_warn_deprecated_function(const char *function)
+{
+#ifdef CONFIG_QDEV_DEPRECATION_WARNING
+    warn_report("use of deprecated non-qdev/non-qom code in %s()", function);
+#endif
+}
+
 static bool device_get_realized(Object *obj, Error **errp)
 {
     DeviceState *dev = DEVICE(obj);
-- 
2.21.3

