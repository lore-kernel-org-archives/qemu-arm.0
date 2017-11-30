Received: by 10.223.159.82 with SMTP id f18csp391524wrg;
        Thu, 30 Nov 2017 00:55:44 -0800 (PST)
X-Google-Smtp-Source: AGs4zMaCA7GEJdrG30qR9MgLcazpapEZtW4Tx+z8FI9+A556VHMl02t1wJcPk3pv/axVE1IJLr2h
X-Received: by 10.37.202.16 with SMTP id a16mr1069169ybg.304.1512032143948;
        Thu, 30 Nov 2017 00:55:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512032143; cv=none;
        d=google.com; s=arc-20160816;
        b=NPOYZ8RdlXofWk4193zrlJODf9xy+SFeiG+1Zvd+tHULpbpsD3s58LwvxCm8wDGiPc
         0xlKVYtpuD1dVmtqeSd11q5sTdHUlNRHrwaPCABr5N3y+uDZQ/ZgaKDGf206qQZMWOAB
         Ya2LPLrzmk9JVeLwB4lZlyQkZDv67fOq8ppof+gTHZtc7zrd8wTGKHSkICXSFHycbbkZ
         N/X7LJN+kjpgyLvkMiYDxWRafYklT+NRZxiShxQGvr8+LMuX5Xxn9OjaRVxf2momN93D
         zgtoKjTVFzrXhyb41gYzlA5bMABfmocW7Gp0VnaSC+gcqpceoYTcft7A6ZIa8JvQyEKM
         pqPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=Q/L2Ev00zGpxexQyVpISBdicH4W+sl9gmmOWp72k1uM=;
        b=HFGfiqkZvN+MASNbuAaFs7qsckWbdR+FlV9YHki2dcQ1QGdNLktNAh6NMpERMb3NFs
         RTxHMpz3bl24deXdcsJPrkkUC4Vmr3OOKwmG3k03pd3wyDkvS2i37rUfjlIbZA3Fb8kb
         8AeXMTk5x05jB3mOAkXY6iJKBklDkcQr13e22C6mS+iq0LF1HZYmfGLrWsMun8z5pzmU
         nHq3eMruFpLQQKBnbyO2YW2tshKmU9jsGML0w8ujQZktP75+wDU8+dHVErP6qNa+8lXJ
         OvNg5/uIyEmj25GsuNYD6mnFCOouRUIqiReZusNgEJey/a9wY9pJic2eNdz9Uc3WYOnx
         P8xg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 194si722267ybd.133.2017.11.30.00.55.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 30 Nov 2017 00:55:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46862 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eKKdD-0006Sv-BL
	for alex.bennee@linaro.org; Thu, 30 Nov 2017 03:55:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49063)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1eKKb1-0005Ft-Q8
	for qemu-devel@nongnu.org; Thu, 30 Nov 2017 03:53:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1eKKaw-0006nB-V1
	for qemu-devel@nongnu.org; Thu, 30 Nov 2017 03:53:27 -0500
Received: from mx1.redhat.com ([209.132.183.28]:41962)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1eKKau-0006k2-Rh; Thu, 30 Nov 2017 03:53:20 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EE92872D16;
	Thu, 30 Nov 2017 08:53:19 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-158.ams2.redhat.com
	[10.36.116.158])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1B66B5D6A5;
	Thu, 30 Nov 2017 08:53:17 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 30 Nov 2017 09:53:04 +0100
Message-Id: <1512031988-32490-4-git-send-email-thuth@redhat.com>
In-Reply-To: <1512031988-32490-1-git-send-email-thuth@redhat.com>
References: <1512031988-32490-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Thu, 30 Nov 2017 08:53:20 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH for-2.12 3/7] tests/boot-serial-test: Add
 support for the mcf5208evb board
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
Cc: Anthony Green <green@moxielogic.com>, Laurent Vivier <laurent@vivier.eu>,
	qemu-arm@nongnu.org, Edgar Iglesias <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VtKxN587L5bY

We can output a character quite easily here with some few lines of
assembly that we provide as a mini-kernel for this board.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/boot-serial-test.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/boot-serial-test.c b/tests/boot-serial-test.c
index d997269..dd3828c 100644
--- a/tests/boot-serial-test.c
+++ b/tests/boot-serial-test.c
@@ -16,6 +16,14 @@
 #include "qemu/osdep.h"
 #include "libqtest.h"
 
+static const uint8_t kernel_mcf5208[] = {
+    0x41, 0xf9, 0xfc, 0x06, 0x00, 0x00,     /* lea 0xfc060000,%a0 */
+    0x10, 0x3c, 0x00, 0x54,                 /* move.b #'T',%d0 */
+    0x11, 0x7c, 0x00, 0x04, 0x00, 0x08,     /* move.b #4,8(%a0)     Enable TX */
+    0x11, 0x40, 0x00, 0x0c,                 /* move.b %d0,12(%a0)   Print 'T' */
+    0x60, 0xfa                              /* bra.s  loop */
+};
+
 typedef struct testdef {
     const char *arch;       /* Target architecture */
     const char *machine;    /* Name of the machine */
@@ -41,6 +49,8 @@ static testdef_t tests[] = {
     { "x86_64", "q35", "-device sga", "SGABIOS" },
     { "s390x", "s390-ccw-virtio",
       "-nodefaults -device sclpconsole,chardev=serial0", "virtio device" },
+    { "m68k", "mcf5208evb", "", "TT", sizeof(kernel_mcf5208), kernel_mcf5208 },
+
     { NULL }
 };
 
-- 
1.8.3.1

