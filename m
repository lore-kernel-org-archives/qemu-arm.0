Received: by 10.25.21.156 with SMTP id 28csp832045lfv;
        Wed, 3 Aug 2016 09:31:56 -0700 (PDT)
X-Received: by 10.200.57.108 with SMTP id t41mr887009qtb.33.1470241916659;
        Wed, 03 Aug 2016 09:31:56 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l3si2656395qkf.79.2016.08.03.09.31.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Aug 2016 09:31:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35716 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bUz5H-0004BQ-Uf
	for alex.bennee@linaro.org; Wed, 03 Aug 2016 12:31:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35868)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1bUywu-0004DK-5J
	for qemu-devel@nongnu.org; Wed, 03 Aug 2016 12:23:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1bUywp-0006jC-Hi
	for qemu-devel@nongnu.org; Wed, 03 Aug 2016 12:23:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33630)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>)
	id 1bUywf-0006fs-Ph; Wed, 03 Aug 2016 12:23:01 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 55F2B478;
	Wed,  3 Aug 2016 16:23:00 +0000 (UTC)
Received: from t530wlan.home.berrange.com.com (vpn1-7-219.ams2.redhat.com
	[10.36.7.219])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u73GMoak009808; Wed, 3 Aug 2016 12:22:58 -0400
From: "Daniel P. Berrange" <berrange@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  3 Aug 2016 17:22:38 +0100
Message-Id: <1470241360-3574-4-git-send-email-berrange@redhat.com>
In-Reply-To: <1470241360-3574-1-git-send-email-berrange@redhat.com>
References: <1470241360-3574-1-git-send-email-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 03 Aug 2016 16:23:00 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 3/5] sclpconsole: remove bogus check for -EAGAIN
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
Cc: Cornelia Huck <cornelia.huck@de.ibm.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	Amit Shah <amit.shah@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: skara4SYiRsl

The write_console_data() method in sclpconsole-lm.c checks
whether the return value of qemu_chr_fe_write() has the
value of -EAGAIN and if so then increments the buffer offset
by the value of EAGAIN. Fortunately qemu_chr_fe_write() will
never return EAGAIN directly, rather it returns -1 with
errno set to EAGAIN, so this broken code path was not
reachable. The behaviour on EAGAIN was stil bad though,
causing the write_console_data() to busy_wait repeatedly
calling qemu_chr_fe_write() with no sleep between iters.

Just remove all this loop logic and replace with a call
to qemu_chr_fe_write_all().

Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
---
 hw/char/sclpconsole-lm.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/hw/char/sclpconsole-lm.c b/hw/char/sclpconsole-lm.c
index a22ad8d..8cb0026 100644
--- a/hw/char/sclpconsole-lm.c
+++ b/hw/char/sclpconsole-lm.c
@@ -201,21 +201,9 @@ static int write_console_data(SCLPEvent *event, const uint8_t *buf, int len)
         return len;
     }
 
-    buf_offset = buf;
-    while (len > 0) {
-        ret = qemu_chr_fe_write(scon->chr, buf, len);
-        if (ret == 0) {
-            /* a pty doesn't seem to be connected - no error */
-            len = 0;
-        } else if (ret == -EAGAIN || (ret > 0 && ret < len)) {
-            len -= ret;
-            buf_offset += ret;
-        } else {
-            len = 0;
-        }
-    }
-
-    return ret;
+    /* XXX this blocks entire thread. Rewrite to use
+     * qemu_chr_fe_write and background I/O callbacks */
+    return qemu_chr_fe_write_all(scon->chr, buf, len);
 }
 
 static int process_mdb(SCLPEvent *event, MDBO *mdbo)
-- 
2.7.4

