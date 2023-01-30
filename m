Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp942198ejb;
        Mon, 30 Jan 2023 05:24:17 -0800 (PST)
X-Google-Smtp-Source: AK7set+T0FiVYOfNDHoEUWsoK8bSdumUFn96koUckSC2B8jnXDkjkCzO8cVbaJRFTEvq0hQgCoCo
X-Received: by 2002:a0c:f8ca:0:b0:537:6a21:7dda with SMTP id h10-20020a0cf8ca000000b005376a217ddamr8912531qvo.2.1675085057364;
        Mon, 30 Jan 2023 05:24:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675085057; cv=none;
        d=google.com; s=arc-20160816;
        b=wRjdKrVzWqJCAx+213PpPpmVbSNg0OajMBj2rEQ2o4k66XhP5/i6N3GdcdStNCwLCm
         oGWFhGyLJVO3iD1+AdLUMl94K3v2NJyHqoALlZM4t9iVc/FZ8k08Z8ctMXcKENmB6Hr6
         qP8mNTkoFVb35PO4g6YCDzX1cdzu3wTrQBQStLSz+cS/Y655lxNSJuNVMhJyxTBPlLMv
         C0E0xpgGZRmuHi9DmGsIX70kk8gyXkF0ewpgsXCcUzaaEO9yEO1y/wPt0M+O+oHKWd9p
         ElL+qtyQjKAKrDMQ67ET5lmc/C9dbQiPv0bEY+HVPtenXEXI5DR/u1dQzTMZTg6pkdVn
         xiGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=XwzEO3ZQawUyZo8ixZ4rxULzkUrAMNz/Pht7lQz55io=;
        b=VPWefRIIjvtKUxnM9Y6P1XgkI7JQiXX5o3039bEKN40BhaRrd5vbRect4iNMYiEuCl
         7Wk2x13uxrzoKDhzwAksHN0g73xRiUUIx4I57pyIfXM2s7UvFRaKrVgj5g16jpLlhM+8
         Y7WG3b+6uRg6aML29LxXzANo0cMOMqLQTofVcuHtGYjlw+719rklBN+QPkSzEzpLXfs0
         Jva6TwYkILsvRyKE4s0HYpMZTq1IuvffwRNjm+JVCdRuyjuXdxPYDHI02zdukw2oiCjm
         GCLuD37qgoPRekthvaB/esTIjD2DMka8uXE+jeB3A/U5pq8UqmpTwtCLWaaaxxbKadDi
         +Fvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MmkvqIq+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m10-20020a05620a290a00b0071f819016b4si1436464qkp.577.2023.01.30.05.24.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Jan 2023 05:24:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MmkvqIq+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pMU8k-0000W6-Lo; Mon, 30 Jan 2023 08:24:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pMU7D-0005FL-NT
 for qemu-arm@nongnu.org; Mon, 30 Jan 2023 08:22:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pMU6q-0005lV-RR
 for qemu-arm@nongnu.org; Mon, 30 Jan 2023 08:22:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675084924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XwzEO3ZQawUyZo8ixZ4rxULzkUrAMNz/Pht7lQz55io=;
 b=MmkvqIq+qQQmCCB3TtqryfNCamDmip3uMI5c7UJJZRqs5QN2a5cvZKL+djJWA6RFHdSa06
 B+6tnF0J5oTs0soB4NeOuxFDg7DOGt67YFBgj0EdR3xNqvwH+SGpiTPaOoP/TtBJ29fQ2l
 4XJIvUslj507etqftfuyyy+XHCub+gM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-_dt6sW29OzOn2UYayuK1tQ-1; Mon, 30 Jan 2023 08:22:00 -0500
X-MC-Unique: _dt6sW29OzOn2UYayuK1tQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A340C811E6E;
 Mon, 30 Jan 2023 13:21:59 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C26740C2004;
 Mon, 30 Jan 2023 13:21:59 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7176921E691B; Mon, 30 Jan 2023 14:21:56 +0100 (CET)
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
Subject: [PATCH v5 17/20] Fix non-first inclusions of qemu/osdep.h
Date: Mon, 30 Jan 2023 14:21:53 +0100
Message-Id: <20230130132156.1868019-18-armbru@redhat.com>
In-Reply-To: <20230130132156.1868019-1-armbru@redhat.com>
References: <20230130132156.1868019-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: QFTWR7ENvCQX

This commit was created with scripts/clean-includes.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
---
 audio/sndioaudio.c       |  2 +-
 backends/hostmem-epc.c   |  2 +-
 block/export/vduse-blk.c |  2 +-
 hw/hyperv/syndbg.c       |  2 +-
 util/async-teardown.c    | 12 ++++--------
 5 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/audio/sndioaudio.c b/audio/sndioaudio.c
index 632b0e3825..3fde01fdbd 100644
--- a/audio/sndioaudio.c
+++ b/audio/sndioaudio.c
@@ -14,9 +14,9 @@
  * to recording, which is what guest systems expect.
  */
 
+#include "qemu/osdep.h"
 #include <poll.h>
 #include <sndio.h>
-#include "qemu/osdep.h"
 #include "qemu/main-loop.h"
 #include "audio.h"
 #include "trace.h"
diff --git a/backends/hostmem-epc.c b/backends/hostmem-epc.c
index 037292d267..4e162d6789 100644
--- a/backends/hostmem-epc.c
+++ b/backends/hostmem-epc.c
@@ -9,9 +9,9 @@
  * This work is licensed under the terms of the GNU GPL, version 2 or later.
  * See the COPYING file in the top-level directory.
  */
-#include <sys/ioctl.h>
 
 #include "qemu/osdep.h"
+#include <sys/ioctl.h>
 #include "qom/object_interfaces.h"
 #include "qapi/error.h"
 #include "sysemu/hostmem.h"
diff --git a/block/export/vduse-blk.c b/block/export/vduse-blk.c
index 350d6fdaf0..f7ae44e3ce 100644
--- a/block/export/vduse-blk.c
+++ b/block/export/vduse-blk.c
@@ -10,9 +10,9 @@
  * later.  See the COPYING file in the top-level directory.
  */
 
+#include "qemu/osdep.h"
 #include <sys/eventfd.h>
 
-#include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "block/export.h"
 #include "qemu/error-report.h"
diff --git a/hw/hyperv/syndbg.c b/hw/hyperv/syndbg.c
index 16d04cfdc6..94fe1b534b 100644
--- a/hw/hyperv/syndbg.c
+++ b/hw/hyperv/syndbg.c
@@ -5,8 +5,8 @@
  * See the COPYING file in the top-level directory.
  */
 
-#include "qemu/ctype.h"
 #include "qemu/osdep.h"
+#include "qemu/ctype.h"
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
 #include "qemu/sockets.h"
diff --git a/util/async-teardown.c b/util/async-teardown.c
index 62bfce1b3c..62cdeb0f20 100644
--- a/util/async-teardown.c
+++ b/util/async-teardown.c
@@ -10,16 +10,12 @@
  * option) any later version.  See the COPYING file in the top-level directory.
  *
  */
-#include <stdlib.h>
-#include <stdio.h>
-#include <sys/types.h>
-#include <dirent.h>
-#include <sys/prctl.h>
-#include <signal.h>
-#include <sched.h>
-#include <unistd.h>
 
 #include "qemu/osdep.h"
+#include <dirent.h>
+#include <sys/prctl.h>
+#include <sched.h>
+
 #include "qemu/async-teardown.h"
 
 #ifdef _SC_THREAD_STACK_MIN
-- 
2.39.0

