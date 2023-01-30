Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp941626ejb;
        Mon, 30 Jan 2023 05:23:18 -0800 (PST)
X-Google-Smtp-Source: AK7set/ATgyW8ORq9FAL6yU+GKOteAHD/tnU4BZIVfRasadwDBAjHogTzbTnnXs6KBpd1mP//zOh
X-Received: by 2002:ac8:5c43:0:b0:3b8:5810:561e with SMTP id j3-20020ac85c43000000b003b85810561emr11250480qtj.6.1675084998647;
        Mon, 30 Jan 2023 05:23:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675084998; cv=none;
        d=google.com; s=arc-20160816;
        b=XNDRM+o0FSxn3geHGYR9dC840R/U5Gz5RMFlxxmGswYf4m85ZR8Vs1wUuTq3AJGPGS
         cQRej4+G5ZDwp1N6ZNLb/W9P0ukYWLTbHOC/jgGGQZsgI5MbsvxglIPxCX1q0zi1IC4x
         XsLTEAImMm+0vTa4vibu8bEvGoKLIGcM7noZshoO2m5vZd2lzlEgnRAFUJyui8ixXtk2
         sESxbBy9kzxdX1jCAHElYKKFczc4bcjUWshYTJxDWrjYl5Mpmlt9MqkJQQELr9Ipdi9p
         h3bfZ+FTcOxSaUCRuTZeUQTEFMwAmJ/rewbbT047fBoYutgG4jfzusDPkqcIvlYKQT4O
         C/LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=4XEfBKWNyAi2J68lpx37vHlrsNvIHgtAg8Q2XUV895I=;
        b=OCQy2VjAPtf9FnvvCYgNH8VEKeR4+MvOuoa6R3bqWlAJwI6PL588ns/YdhsOlAIHkM
         yVHNAOG7DOD7nYRmvJ+n7HcAoXOo01M3dqCjeJYA0suFLwAcrlIfAtWCXtxhq42IqXAt
         aQwtn52Z7Jf3LDqk8L58O0uC9Q+R6fpI5smcE8HPyVOfxYPFKqwXRKQ5qqDC8pY5Xkv2
         j1C6HXzBN03Jyjj6NNgQ0hPChI2rQ+PzqZAyI1HzRPFhvDoCCiIMtFFHlPSXUNdaHqnU
         sPU0f9sXs2ICzcoU3pTgR3RmsGaO0FJF74BBmIpZMKDpNkx2tz41PJHclIpT/zd4bzTF
         WEtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="C/jdswaq";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q10-20020ac8410a000000b003ad06c19378si5926008qtl.785.2023.01.30.05.23.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Jan 2023 05:23:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="C/jdswaq";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMU7U-0005H1-4f; Mon, 30 Jan 2023 08:22:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pMU6u-0004JJ-5l
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:22:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pMU6m-0005jM-PQ
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:22:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675084923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4XEfBKWNyAi2J68lpx37vHlrsNvIHgtAg8Q2XUV895I=;
 b=C/jdswaqFYx1MBZVZNnLFlMoV8/n+8TQ0gPFD62p3NOOZjIHJaEtOhD8MIkw9tDlbcLX99
 fhGERcaopUMbJvenxwAaNmFF2PQxS8aEk72wfuYea04cAoqmx2i6CMz9dr0riYO/rkVz5/
 qrbe5YDnClPT6iCyjoRSmmTfTBuvgT4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-90-opOIk1mQOye4eg6pYkZ8Sw-1; Mon, 30 Jan 2023 08:21:59 -0500
X-MC-Unique: opOIk1mQOye4eg6pYkZ8Sw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A7B8C802C15;
 Mon, 30 Jan 2023 13:21:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 63F001121314;
 Mon, 30 Jan 2023 13:21:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4D16021E6A24; Mon, 30 Jan 2023 14:21:56 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, pbonzini@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, imp@bsdimp.com, kevans@freebsd.org, berrange@redhat.com,
 groug@kaod.org, qemu_oss@crudebyte.com, mst@redhat.com, philmd@linaro.org,
 peter.maydell@linaro.org, alistair@alistair23.me, jasowang@redhat.com,
 jonathan.cameron@huawei.com, kbastian@mail.uni-paderborn.de,
 quintela@redhat.com, dgilbert@redhat.com, michael.roth@amd.com,
 kkostiuk@redhat.com, tsimpson@quicinc.com, palmer@dabbelt.com,
 bin.meng@windriver.com, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v5 05/20] bsd-user: Clean up includes
Date: Mon, 30 Jan 2023 14:21:41 +0100
Message-Id: <20230130132156.1868019-6-armbru@redhat.com>
In-Reply-To: <20230130132156.1868019-1-armbru@redhat.com>
References: <20230130132156.1868019-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: vIj+giIkPzuT

Clean up includes so that qemu/osdep.h is included first in .c, and
not in .h, and headers which it implies are not included manually.

This commit was created with scripts/clean-includes.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
---
 bsd-user/bsd-proc.h               | 4 ----
 bsd-user/qemu.h                   | 1 -
 bsd-user/arm/signal.c             | 1 +
 bsd-user/arm/target_arch_cpu.c    | 2 ++
 bsd-user/freebsd/os-sys.c         | 1 +
 bsd-user/i386/signal.c            | 1 +
 bsd-user/i386/target_arch_cpu.c   | 3 +--
 bsd-user/main.c                   | 4 +---
 bsd-user/strace.c                 | 1 -
 bsd-user/x86_64/signal.c          | 1 +
 bsd-user/x86_64/target_arch_cpu.c | 3 +--
 11 files changed, 9 insertions(+), 13 deletions(-)

diff --git a/bsd-user/bsd-proc.h b/bsd-user/bsd-proc.h
index 68b66e571d..a1061bffb8 100644
--- a/bsd-user/bsd-proc.h
+++ b/bsd-user/bsd-proc.h
@@ -20,11 +20,7 @@
 #ifndef BSD_PROC_H_
 #define BSD_PROC_H_
 
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <sys/time.h>
 #include <sys/resource.h>
-#include <unistd.h>
 
 /* exit(2) */
 static inline abi_long do_bsd_exit(void *cpu_env, abi_long arg1)
diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index be6105385e..0ceecfb6df 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -17,7 +17,6 @@
 #ifndef QEMU_H
 #define QEMU_H
 
-#include "qemu/osdep.h"
 #include "cpu.h"
 #include "qemu/units.h"
 #include "exec/cpu_ldst.h"
diff --git a/bsd-user/arm/signal.c b/bsd-user/arm/signal.c
index 2b1dd745d1..9734407543 100644
--- a/bsd-user/arm/signal.c
+++ b/bsd-user/arm/signal.c
@@ -17,6 +17,7 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
+#include "qemu/osdep.h"
 #include "qemu.h"
 
 /*
diff --git a/bsd-user/arm/target_arch_cpu.c b/bsd-user/arm/target_arch_cpu.c
index 02bf9149d5..fe38ae2210 100644
--- a/bsd-user/arm/target_arch_cpu.c
+++ b/bsd-user/arm/target_arch_cpu.c
@@ -16,6 +16,8 @@
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
+
+#include "qemu/osdep.h"
 #include "target_arch.h"
 
 void target_cpu_set_tls(CPUARMState *env, target_ulong newtls)
diff --git a/bsd-user/freebsd/os-sys.c b/bsd-user/freebsd/os-sys.c
index 309e27b9d6..1676ec10f8 100644
--- a/bsd-user/freebsd/os-sys.c
+++ b/bsd-user/freebsd/os-sys.c
@@ -17,6 +17,7 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
+#include "qemu/osdep.h"
 #include "qemu.h"
 #include "target_arch_sysarch.h"
 
diff --git a/bsd-user/i386/signal.c b/bsd-user/i386/signal.c
index 5dd975ce56..a3131047b8 100644
--- a/bsd-user/i386/signal.c
+++ b/bsd-user/i386/signal.c
@@ -17,6 +17,7 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
+#include "qemu/osdep.h"
 #include "qemu.h"
 
 /*
diff --git a/bsd-user/i386/target_arch_cpu.c b/bsd-user/i386/target_arch_cpu.c
index d349e45299..2a3af2ddef 100644
--- a/bsd-user/i386/target_arch_cpu.c
+++ b/bsd-user/i386/target_arch_cpu.c
@@ -17,9 +17,8 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#include <sys/types.h>
-
 #include "qemu/osdep.h"
+
 #include "cpu.h"
 #include "qemu.h"
 #include "qemu/timer.h"
diff --git a/bsd-user/main.c b/bsd-user/main.c
index 6f09180d65..41290e16f9 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -18,12 +18,10 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#include <sys/types.h>
-#include <sys/time.h>
+#include "qemu/osdep.h"
 #include <sys/resource.h>
 #include <sys/sysctl.h>
 
-#include "qemu/osdep.h"
 #include "qemu/help-texts.h"
 #include "qemu/units.h"
 #include "qemu/accel.h"
diff --git a/bsd-user/strace.c b/bsd-user/strace.c
index a77d10dd6b..96499751eb 100644
--- a/bsd-user/strace.c
+++ b/bsd-user/strace.c
@@ -20,7 +20,6 @@
 #include <sys/select.h>
 #include <sys/syscall.h>
 #include <sys/ioccom.h>
-#include <ctype.h>
 
 #include "qemu.h"
 
diff --git a/bsd-user/x86_64/signal.c b/bsd-user/x86_64/signal.c
index c3875bc4c6..46cb865180 100644
--- a/bsd-user/x86_64/signal.c
+++ b/bsd-user/x86_64/signal.c
@@ -16,6 +16,7 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
+#include "qemu/osdep.h"
 #include "qemu.h"
 
 /*
diff --git a/bsd-user/x86_64/target_arch_cpu.c b/bsd-user/x86_64/target_arch_cpu.c
index be7bd10720..1d32f18907 100644
--- a/bsd-user/x86_64/target_arch_cpu.c
+++ b/bsd-user/x86_64/target_arch_cpu.c
@@ -17,9 +17,8 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#include <sys/types.h>
-
 #include "qemu/osdep.h"
+
 #include "cpu.h"
 #include "qemu.h"
 #include "qemu/timer.h"
-- 
2.39.0

