Received: by 10.25.21.156 with SMTP id 28csp829211lfv;
        Wed, 3 Aug 2016 09:25:17 -0700 (PDT)
X-Received: by 10.55.190.199 with SMTP id o190mr829321qkf.51.1470241517030;
        Wed, 03 Aug 2016 09:25:17 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z186si2644906qke.27.2016.08.03.09.25.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Aug 2016 09:25:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35658 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bUyyq-0005aB-6z
	for alex.bennee@linaro.org; Wed, 03 Aug 2016 12:25:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35874)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1bUywu-0004DQ-AX
	for qemu-devel@nongnu.org; Wed, 03 Aug 2016 12:23:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1bUywp-0006jJ-M8
	for qemu-devel@nongnu.org; Wed, 03 Aug 2016 12:23:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49640)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>)
	id 1bUywf-0006fm-UO; Wed, 03 Aug 2016 12:23:02 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 61C65636E4;
	Wed,  3 Aug 2016 16:22:58 +0000 (UTC)
Received: from t530wlan.home.berrange.com.com (vpn1-7-219.ams2.redhat.com
	[10.36.7.219])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u73GMoaj009808; Wed, 3 Aug 2016 12:22:56 -0400
From: "Daniel P. Berrange" <berrange@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  3 Aug 2016 17:22:37 +0100
Message-Id: <1470241360-3574-3-git-send-email-berrange@redhat.com>
In-Reply-To: <1470241360-3574-1-git-send-email-berrange@redhat.com>
References: <1470241360-3574-1-git-send-email-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 03 Aug 2016 16:22:58 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 2/5] impi: check return of qemu_chr_fe_write()
 for errors
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
X-TUID: Xydaywn1s93R

The continue_send() method in ipmi_bmc_extern.c directly
assigns the return value of qemu_chr_fe_write() to the
variable tracking the I/O buffer offset. This ignores the
possibility that the return value could be -1 and so will
cause I/O go backwards on EAGAIN. Fortunately 'outpos' is
unsigned, so can't go negative - it will become MAX_INT
which will cause the loop to stop, and avoid an accidental
out of bounds array access.

Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
---
 hw/ipmi/ipmi_bmc_extern.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/ipmi/ipmi_bmc_extern.c b/hw/ipmi/ipmi_bmc_extern.c
index 157879e..5d5b4e4 100644
--- a/hw/ipmi/ipmi_bmc_extern.c
+++ b/hw/ipmi/ipmi_bmc_extern.c
@@ -100,12 +100,16 @@ ipmb_checksum(const unsigned char *data, int size, unsigned char start)
 
 static void continue_send(IPMIBmcExtern *ibe)
 {
+    int ret;
     if (ibe->outlen == 0) {
         goto check_reset;
     }
  send:
-    ibe->outpos += qemu_chr_fe_write(ibe->chr, ibe->outbuf + ibe->outpos,
-                                     ibe->outlen - ibe->outpos);
+    ret = qemu_chr_fe_write(ibe->chr, ibe->outbuf + ibe->outpos,
+                            ibe->outlen - ibe->outpos);
+    if (ret > 0) {
+        ibe->outpos += ret;
+    }
     if (ibe->outpos < ibe->outlen) {
         /* Not fully transmitted, try again in a 10ms */
         timer_mod_ns(ibe->extern_timer,
-- 
2.7.4

