Received: by 10.223.159.82 with SMTP id f18csp391660wrg;
        Thu, 30 Nov 2017 00:55:55 -0800 (PST)
X-Google-Smtp-Source: AGs4zMaKBaTHvR/CGO06dQHvWjeOJmK2xvHrb/8cpKykCj87BcPbCWBAB3X3UIZzNS9OkLdXqaSq
X-Received: by 10.37.128.200 with SMTP id c8mr983583ybm.460.1512032155392;
        Thu, 30 Nov 2017 00:55:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512032155; cv=none;
        d=google.com; s=arc-20160816;
        b=R9sJZVAkOnbnCbqAsw8oabwCkmz09Mberc+HCrrePWej5omRjt/cZ3IAV4KA2fTJlq
         N1XO/JoVZdMOwkbGcnEVXzjnNaEWqRj0jJ2KmYdGnx2aBQ7zB3WEP20iTmu6hdSMrQN7
         OybvuHQ7BgYaK3EL6+Ua200pkMgE6Rn/PlpIUq4NYrK2xt7m7Rpr9mXHKAmm52RxeFtA
         9bYSwzH6YZGMM6lqpxGdnBQJdgwzlGa6flsi7gB8pmu2ExaFOpbtq9ohaBTAJP7GMmZa
         tPu7VZCxJ21aPAqGD9Sz44t+2euopXFvm8hRUHhuA/HZ+ziiy3mWClAYscKs7JxHe9nQ
         iPHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=Cu0qNFHbmjJebAI5PE8UzFOtQzvIvIBHvczQB4KHf84=;
        b=DeFMz3i2IpA0b+WnxBbbgJcUN9cTnaK5gpHrWxJt7KDgixesQHt1O1GdIB8k5mN2PU
         UTilA6yAH1DET8QkhLjIeSX06BUAwljBZgmq7OCkKtqqV3ExQTbNPikaFGcmILWE1Y1L
         0I/ddkdDZs3RzCLVdCBi6DBXeOyP5NdIHz8WioSPlp1iKnNIBElJbXjh+9WrjVVwwcdE
         86udxRPM+QRCtkTTIztUQi95mbvejUNV7poJT74ppNy8p9pPanFLj5PYlHrN+XWcrbet
         VZcPbjVOGGufy6b3rhhiNMc3Rc6H8B+A6vqMxiNKrqvupl9aZapIWRTcxd825a231zRU
         voLA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p15si709130ywm.566.2017.11.30.00.55.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 30 Nov 2017 00:55:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46868 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eKKdO-0006eL-PQ
	for alex.bennee@linaro.org; Thu, 30 Nov 2017 03:55:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49199)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1eKKbF-0005Rx-Bo
	for qemu-devel@nongnu.org; Thu, 30 Nov 2017 03:53:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1eKKbE-0006wu-Bm
	for qemu-devel@nongnu.org; Thu, 30 Nov 2017 03:53:41 -0500
Received: from mx1.redhat.com ([209.132.183.28]:37732)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1eKKb8-0006v4-1Y; Thu, 30 Nov 2017 03:53:34 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 16B346146F;
	Thu, 30 Nov 2017 08:53:33 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-158.ams2.redhat.com
	[10.36.116.158])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 866C35D6B4;
	Thu, 30 Nov 2017 08:53:28 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 30 Nov 2017 09:53:07 +0100
Message-Id: <1512031988-32490-7-git-send-email-thuth@redhat.com>
In-Reply-To: <1512031988-32490-1-git-send-email-thuth@redhat.com>
References: <1512031988-32490-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 30 Nov 2017 08:53:33 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH for-2.12 6/7] tests/boot-serial-test: Add a
 test for the moxiesim machine
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
X-TUID: QkVwQJrRvNB7

Now that moxiesim supports the -bios parameter, we can check this machine
in the boot-serial tester, too, by supplying a mini bios that only writes
'T' characters to the UART.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/Makefile.include   | 2 ++
 tests/boot-serial-test.c | 8 ++++++++
 2 files changed, 10 insertions(+)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index cd908da..00c1e11 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -307,6 +307,8 @@ check-qtest-mips64-y = tests/endianness-test$(EXESUF)
 
 check-qtest-mips64el-y = tests/endianness-test$(EXESUF)
 
+check-qtest-moxie-y = tests/boot-serial-test$(EXESUF)
+
 check-qtest-ppc-y = tests/endianness-test$(EXESUF)
 check-qtest-ppc-y += tests/boot-order-test$(EXESUF)
 check-qtest-ppc-y += tests/prom-env-test$(EXESUF)
diff --git a/tests/boot-serial-test.c b/tests/boot-serial-test.c
index a39273a..1deddb8 100644
--- a/tests/boot-serial-test.c
+++ b/tests/boot-serial-test.c
@@ -40,6 +40,13 @@ static const uint8_t kernel_plml605[] = {
     0xfc, 0xff, 0x00, 0xb8                  /* bri   -4  loop */
 };
 
+static const uint8_t bios_moxiesim[] = {
+    0x20, 0x10, 0x00, 0x00, 0x03, 0xf8,     /* ldi.s r1,0x3f8 */
+    0x1b, 0x20, 0x00, 0x00, 0x00, 0x54,     /* ldi.b r2,'T' */
+    0x1e, 0x12,                             /* st.b  r1,r2 */
+    0x1a, 0x00, 0x00, 0x00, 0x10, 0x00      /* jmpa  0x1000 */
+};
+
 typedef struct testdef {
     const char *arch;       /* Target architecture */
     const char *machine;    /* Name of the machine */
@@ -70,6 +77,7 @@ static testdef_t tests[] = {
       sizeof(kernel_pls3adsp1800), kernel_pls3adsp1800 },
     { "microblazeel", "petalogix-ml605", "", "TT",
       sizeof(kernel_plml605), kernel_plml605 },
+    { "moxie", "moxiesim", "", "TT", sizeof(bios_moxiesim), 0, bios_moxiesim },
 
     { NULL }
 };
-- 
1.8.3.1

