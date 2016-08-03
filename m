Received: by 10.25.21.156 with SMTP id 28csp830818lfv;
        Wed, 3 Aug 2016 09:29:04 -0700 (PDT)
X-Received: by 10.237.39.34 with SMTP id n31mr850673qtd.55.1470241744876;
        Wed, 03 Aug 2016 09:29:04 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 81si2649961qkt.63.2016.08.03.09.29.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Aug 2016 09:29:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35697 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bUz2W-0001JG-44
	for alex.bennee@linaro.org; Wed, 03 Aug 2016 12:29:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35970)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1bUywz-0004HI-Pn
	for qemu-devel@nongnu.org; Wed, 03 Aug 2016 12:23:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1bUywv-0006lV-7G
	for qemu-devel@nongnu.org; Wed, 03 Aug 2016 12:23:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51790)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>)
	id 1bUywk-0006he-CR; Wed, 03 Aug 2016 12:23:06 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F332B83F45;
	Wed,  3 Aug 2016 16:23:05 +0000 (UTC)
Received: from t530wlan.home.berrange.com.com (vpn1-7-219.ams2.redhat.com
	[10.36.7.219])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u73GMoam009808; Wed, 3 Aug 2016 12:23:02 -0400
From: "Daniel P. Berrange" <berrange@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  3 Aug 2016 17:22:40 +0100
Message-Id: <1470241360-3574-6-git-send-email-berrange@redhat.com>
In-Reply-To: <1470241360-3574-1-git-send-email-berrange@redhat.com>
References: <1470241360-3574-1-git-send-email-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Wed, 03 Aug 2016 16:23:06 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 5/5] char: convert qemu_chr_fe_write to
 qemu_chr_fe_write_all
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
X-TUID: AkSOyQ70LCPn

The mux chardev was not checking the return value of any
qemu_chr_fe_write() call so would silently loose data
on EAGAIN.

Similarly the qemu_chr_fe_printf method would not check
errors and was not in a position to retry even if it
could check.

Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
---
 qemu-char.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/qemu-char.c b/qemu-char.c
index a50b8fb..e8dde2d 100644
--- a/qemu-char.c
+++ b/qemu-char.c
@@ -440,7 +440,9 @@ void qemu_chr_fe_printf(CharDriverState *s, const char *fmt, ...)
     va_list ap;
     va_start(ap, fmt);
     vsnprintf(buf, sizeof(buf), fmt, ap);
-    qemu_chr_fe_write(s, (uint8_t *)buf, strlen(buf));
+    /* XXX this blocks entire thread. Rewrite to use
+     * qemu_chr_fe_write and background I/O callbacks */
+    qemu_chr_fe_write_all(s, (uint8_t *)buf, strlen(buf));
     va_end(ap);
 }
 
@@ -556,7 +558,9 @@ static int mux_chr_write(CharDriverState *chr, const uint8_t *buf, int len)
                          (secs / 60) % 60,
                          secs % 60,
                          (int)(ti % 1000));
-                qemu_chr_fe_write(d->drv, (uint8_t *)buf1, strlen(buf1));
+                /* XXX this blocks entire thread. Rewrite to use
+                 * qemu_chr_fe_write and background I/O callbacks */
+                qemu_chr_fe_write_all(d->drv, (uint8_t *)buf1, strlen(buf1));
                 d->linestart = 0;
             }
             ret += qemu_chr_fe_write(d->drv, buf+i, 1);
@@ -594,13 +598,15 @@ static void mux_print_help(CharDriverState *chr)
                  "\n\rEscape-Char set to Ascii: 0x%02x\n\r\n\r",
                  term_escape_char);
     }
-    qemu_chr_fe_write(chr, (uint8_t *)cbuf, strlen(cbuf));
+    /* XXX this blocks entire thread. Rewrite to use
+     * qemu_chr_fe_write and background I/O callbacks */
+    qemu_chr_fe_write_all(chr, (uint8_t *)cbuf, strlen(cbuf));
     for (i = 0; mux_help[i] != NULL; i++) {
         for (j=0; mux_help[i][j] != '\0'; j++) {
             if (mux_help[i][j] == '%')
-                qemu_chr_fe_write(chr, (uint8_t *)ebuf, strlen(ebuf));
+                qemu_chr_fe_write_all(chr, (uint8_t *)ebuf, strlen(ebuf));
             else
-                qemu_chr_fe_write(chr, (uint8_t *)&mux_help[i][j], 1);
+                qemu_chr_fe_write_all(chr, (uint8_t *)&mux_help[i][j], 1);
         }
     }
 }
@@ -625,7 +631,7 @@ static int mux_proc_byte(CharDriverState *chr, MuxDriver *d, int ch)
         case 'x':
             {
                  const char *term =  "QEMU: Terminated\n\r";
-                 qemu_chr_fe_write(chr, (uint8_t *)term, strlen(term));
+                 qemu_chr_fe_write_all(chr, (uint8_t *)term, strlen(term));
                  exit(0);
                  break;
             }
-- 
2.7.4

