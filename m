Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp2858839wrp;
        Mon, 23 Sep 2019 09:26:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxox+JmecbsFrMuZYcc+yd8DGKYb7riGgi4yMgxWduX2kqapCNgdIUjVcgKPZ7pJKLhYDYt
X-Received: by 2002:a17:906:fc11:: with SMTP id ov17mr652150ejb.288.1569255999806;
        Mon, 23 Sep 2019 09:26:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569255999; cv=none;
        d=google.com; s=arc-20160816;
        b=mdpEIjvyTR3PtSUAekE2vFG79ZC9SJAlPvvRmYgO9iq7FBguk/D3qkIwl+JZpTX/cf
         kY2PFUNV6SE+1kF2oeNc3MFGBZJ+tVPpnYuyIy24/gi7qG+OW3CWMqsC3FD8O1xKSfRR
         h1DVBpxqQRPFLGh/yUAdc59sajdkprecy9ePhXXtHgrcmAhfpmsZ1uPuAFNrX8ZwyQDo
         5flCJXSTCttTlPjhNuFPK2BVG0Tt7nN9780HhFnbKkYod0NUZhs0Ftum9B+MVXc4SJt2
         rLkAc0h6t/w7fu0pVl49VL0P1k4tshW9n8s8TYjPsdVCulkVEzogfgrDViuIw8pY78pG
         0M8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=HC7VDs7wF+HFaubAu0bajQyNrJq52GZQp5E3fA8zkoQ=;
        b=jwqhkgwrybqf3uX+QRjjkg3dlYLjzkpRV/6RbVsAqhilXIwQBISbCemz5h4Nb0CMTF
         gKw2xJnN7rnHS/hR9LtvRw9K9UPd+MOPHyWs7zXRHYL4wQsl2ZgGzH9S80LwAsiYkR4H
         CG6fx75yaNMeMu+pl/Ajd8n2kvK1tGYTaz5M2vFzzPPf1sf1ZMNq+PphBEj1x9HHGEN/
         D636j+TM1/yie8SwlpsdGyRq6dRaxb83+J+HaiPyri7c6bMJGEWgQVv/womXPUgecfjM
         XjPXFngdDm8s18ifc0uUs335mWZyAAXB606TlUaC7L3+/zsMVshKiL73tBYi3Lfjldr0
         STvg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=virtuozzo.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t16si7036835edd.269.2019.09.23.09.26.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Sep 2019 09:26:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=virtuozzo.com
Received: from localhost ([::1]:59338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iCRAc-00038Q-CM
	for alex.bennee@linaro.org; Mon, 23 Sep 2019 12:26:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57328)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iCQxX-0002aB-PR
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 12:13:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iCQxV-0003rn-Ji
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 12:13:07 -0400
Received: from relay.sw.ru ([185.231.240.75]:39520)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iCQxM-0003aF-A4; Mon, 23 Sep 2019 12:12:56 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iCQwz-0001Fp-8w; Mon, 23 Sep 2019 19:12:33 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [RFC v2 3/9] errp: rename errp to errp_in where it is IN-argument
Date: Mon, 23 Sep 2019 19:12:25 +0300
Message-Id: <20190923161231.22028-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190923161231.22028-1-vsementsov@virtuozzo.com>
References: <20190923161231.22028-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
X-Mailman-Approved-At: Mon, 23 Sep 2019 12:25:24 -0400
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
Cc: stefanha@redhat.com, codyprime@gmail.com, jan.kiszka@siemens.com,
 eblake@redhat.com, berto@igalia.com, zhang.zhanghailiang@huawei.com,
 qemu-block@nongnu.org, arikalo@wavecomp.com, pasic@linux.ibm.com,
 hpoussin@reactos.org, anthony.perard@citrix.com, samuel.thibault@ens-lyon.org,
 philmd@redhat.com, green@moxielogic.com, lvivier@redhat.com,
 ehabkost@redhat.com, xiechanglong.d@gmail.com, pl@kamp.de, dgilbert@redhat.com,
 b.galvani@gmail.com, eric.auger@redhat.com, alex.williamson@redhat.com,
 ronniesahlberg@gmail.com, jsnow@redhat.com, rth@twiddle.net, kwolf@redhat.com,
 vsementsov@virtuozzo.com, andrew@aj.id.au, crwulff@gmail.com,
 sundeep.lkml@gmail.com, michael@walle.cc, qemu-ppc@nongnu.org,
 kbastian@mail.uni-paderborn.de, imammedo@redhat.com, fam@euphon.net,
 peter.maydell@linaro.org, sheepdog@lists.wpkg.org, david@redhat.com,
 palmer@sifive.com, thuth@redhat.com, jcmvbkbc@gmail.com, den@openvz.org,
 hare@suse.com, sstabellini@kernel.org, arei.gonglei@huawei.com,
 marcel.apfelbaum@gmail.com, namei.unix@gmail.com, atar4qemu@gmail.com,
 farman@linux.ibm.com, amit@kernel.org, sw@weilnetz.de, groug@kaod.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, peter.chubb@nicta.com.au,
 clg@kaod.org, shorne@gmail.com, qemu-riscv@nongnu.org, cohuck@redhat.com,
 amarkovic@wavecomp.com, aurelien@aurel32.net, pburton@wavecomp.com,
 sagark@eecs.berkeley.edu, jasowang@redhat.com, kraxel@redhat.com,
 gxt@mprc.pku.edu.cn, ari@tuxera.com, quintela@redhat.com,
 mdroth@linux.vnet.ibm.com, lersek@redhat.com, borntraeger@de.ibm.com,
 antonynpavlov@gmail.com, dillaman@redhat.com, joel@jms.id.au,
 xen-devel@lists.xenproject.org, integration@gluster.org, balrogg@gmail.com,
 rjones@redhat.com, Andrew.Baumann@microsoft.com, mreitz@redhat.com,
 walling@linux.ibm.com, mst@redhat.com, mark.cave-ayland@ilande.co.uk,
 v.maffione@gmail.com, marex@denx.de, armbru@redhat.com,
 marcandre.lureau@redhat.com, alistair@alistair23.me, paul.durrant@citrix.com,
 pavel.dovgaluk@ispras.ru, g.lettieri@iet.unipi.it, rizzo@iet.unipi.it,
 david@gibson.dropbear.id.au, akrowiak@linux.ibm.com, berrange@redhat.com,
 xiaoguangrong.eric@gmail.com, pmorel@linux.ibm.com, wencongyang2@huawei.com,
 jcd@tribudubois.net, pbonzini@redhat.com, stefanb@linux.ibm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +yUQwe+XJSr7

Error **errp is almost always OUT-argument: it's assumed to be NULL, or
pointer to NULL-initialized pointer, or pointer to error_abort or
error_fatal, for callee to report error.

But very few functions (most of the are error API) instead get Error
**errp as IN-argument: it's assumed to be set, and callee should clean
it. In such cases, rename errp to errp_in.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/monitor/hmp.h |  2 +-
 include/qapi/error.h  |  8 ++++----
 ui/vnc.h              |  2 +-
 monitor/hmp-cmds.c    |  8 ++++----
 ui/vnc.c              | 10 +++++-----
 util/error.c          |  2 +-
 6 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index a0e9511440..f929814f1a 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -16,7 +16,7 @@
 
 #include "qemu/readline.h"
 
-void hmp_handle_error(Monitor *mon, Error **errp);
+void hmp_handle_error(Monitor *mon, Error **errp_in);
 
 void hmp_info_name(Monitor *mon, const QDict *qdict);
 void hmp_info_version(Monitor *mon, const QDict *qdict);
diff --git a/include/qapi/error.h b/include/qapi/error.h
index 551385aa91..4264d22223 100644
--- a/include/qapi/error.h
+++ b/include/qapi/error.h
@@ -283,7 +283,7 @@ void error_free(Error *err);
 /*
  * Convenience function to assert that *@errp is set, then silently free it.
  */
-void error_free_or_abort(Error **errp);
+void error_free_or_abort(Error **errp_in);
 
 /*
  * Convenience function to warn_report() and free @err.
@@ -301,19 +301,19 @@ void error_report_err(Error *err);
  * Functions to clean Error **errp: call corresponding Error *err cleaning
  * function an set pointer to NULL
  */
-static inline void error_free_errp(Error **errp)
+static inline void error_free_errp(Error **errp_in)
 {
     error_free(*errp_in);
     *errp_in = NULL;
 }
 
-static inline void error_report_errp(Error **errp)
+static inline void error_report_errp(Error **errp_in)
 {
     error_report_err(*errp_in);
     *errp_in = NULL;
 }
 
-static inline void warn_report_errp(Error **errp)
+static inline void warn_report_errp(Error **errp_in)
 {
     warn_report_err(*errp_in);
     *errp_in = NULL;
diff --git a/ui/vnc.h b/ui/vnc.h
index fea79c2fc9..00e0b48f2f 100644
--- a/ui/vnc.h
+++ b/ui/vnc.h
@@ -547,7 +547,7 @@ uint32_t read_u32(uint8_t *data, size_t offset);
 
 /* Protocol stage functions */
 void vnc_client_error(VncState *vs);
-size_t vnc_client_io_error(VncState *vs, ssize_t ret, Error **errp);
+size_t vnc_client_io_error(VncState *vs, ssize_t ret, Error **errp_in);
 
 void start_client_init(VncState *vs);
 void start_auth_vnc(VncState *vs);
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index b2551c16d1..941d5d0a45 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -60,11 +60,11 @@
 #include <spice/enums.h>
 #endif
 
-void hmp_handle_error(Monitor *mon, Error **errp)
+void hmp_handle_error(Monitor *mon, Error **errp_in)
 {
-    assert(errp);
-    if (*errp) {
-        error_reportf_err(*errp, "Error: ");
+    assert(errp_in);
+    if (*errp_in) {
+        error_reportf_err(*errp_in, "Error: ");
     }
 }
 
diff --git a/ui/vnc.c b/ui/vnc.c
index 87b8045afe..9d6384d9b1 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -1312,7 +1312,7 @@ void vnc_disconnect_finish(VncState *vs)
     g_free(vs);
 }
 
-size_t vnc_client_io_error(VncState *vs, ssize_t ret, Error **errp)
+size_t vnc_client_io_error(VncState *vs, ssize_t ret, Error **errp_in)
 {
     if (ret <= 0) {
         if (ret == 0) {
@@ -1320,14 +1320,14 @@ size_t vnc_client_io_error(VncState *vs, ssize_t ret, Error **errp)
             vnc_disconnect_start(vs);
         } else if (ret != QIO_CHANNEL_ERR_BLOCK) {
             trace_vnc_client_io_error(vs, vs->ioc,
-                                      errp ? error_get_pretty(*errp) :
+                                      errp_in ? error_get_pretty(*errp_in) :
                                       "Unknown");
             vnc_disconnect_start(vs);
         }
 
-        if (errp) {
-            error_free(*errp);
-            *errp = NULL;
+        if (errp_in) {
+            error_free(*errp_in);
+            *errp_in = NULL;
         }
         return 0;
     }
diff --git a/util/error.c b/util/error.c
index dfba091757..b3ff3832d6 100644
--- a/util/error.c
+++ b/util/error.c
@@ -271,7 +271,7 @@ void error_free(Error *err)
     }
 }
 
-void error_free_or_abort(Error **errp)
+void error_free_or_abort(Error **errp_in)
 {
     assert(errp_in && *errp_in);
     error_free(*errp_in);
-- 
2.21.0

