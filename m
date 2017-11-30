Received: by 10.223.159.82 with SMTP id f18csp392367wrg;
        Thu, 30 Nov 2017 00:56:52 -0800 (PST)
X-Google-Smtp-Source: AGs4zMbdLisPdBxx2RXb9LODocRtAeKcEGhRVaY3u8VjcahBHKadHH0Bq62O2SFybpG97aAyXylc
X-Received: by 10.13.233.198 with SMTP id s189mr994977ywe.267.1512032212747;
        Thu, 30 Nov 2017 00:56:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512032212; cv=none;
        d=google.com; s=arc-20160816;
        b=MRss+c78qew0sRIbHyQm7mmlxKOTgdDHbyR9ytWG83QpDTv4/HUZIygKC3GU1IeiDK
         g1esbd4a88P+sQNilG6MN7h7w531/MabldnlSchKo5tqYhK2xa0t9OJLUegBH+EHWVPx
         ujcR0+okC7KT861FSaVsXRZlVNZRYNTXGQ20oRk1L+1LNv+mD3LOuHAULIXxAdiZqNVt
         9vEnixOaIMuwxb1TLY9qvnFdBFC8jie++xD4XvKN/CAgJ28cR//qgw4qWWtE7Re3d6mk
         AXLKVukgHWHQrHj8MhTVUpuGhhOUpQCc8O4Y4UcpCf1MgWnngjh5Bh/00sgXAggp1LZW
         KbrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=7tkDtewDwJPt4lefiGKhgExTQp4kBM6Q0fUXMFBnx64=;
        b=Fg4cpdoXcZ7e+ras8B/9rqQTZupn1T0mjUdcM7RZKDrgomzWzCppnaMTxOc9eOzZzg
         7+sptcvdn99KoKMSsjOYXMyIKbnToRtkbaU2m7Ar4st4a61RFCdciuHmufK9WY9HQ393
         ThcJnCsevvUTPxiv6S+ZpNmwEtOe7MyFkbKaBc6zfw69jLCbXekLeyF4xY1FumO9GoFE
         evOzFBVGb3h7LBe5n4ZvWhjnVkEbDAqPn5xhGS26roBD3TgRIa8mIYqh2t4b7pJQUZbC
         4MhrmWuicCT5uJdWPsUu2CBVn8UpPIij3iZkPBukWr9rfDVIZH3V70Ea5aSfR30Vptzh
         b5mg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g6si726725ybg.406.2017.11.30.00.56.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 30 Nov 2017 00:56:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46877 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eKKeK-00005G-4I
	for alex.bennee@linaro.org; Thu, 30 Nov 2017 03:56:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49176)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1eKKbD-0005QT-NJ
	for qemu-arm@nongnu.org; Thu, 30 Nov 2017 03:53:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1eKKbC-0006w5-OH
	for qemu-arm@nongnu.org; Thu, 30 Nov 2017 03:53:39 -0500
Received: from mx1.redhat.com ([209.132.183.28]:42156)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1eKKbC-0006vv-FE; Thu, 30 Nov 2017 03:53:38 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 13E5C820FB;
	Thu, 30 Nov 2017 08:53:37 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-158.ams2.redhat.com
	[10.36.116.158])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 71FBC5D6B4;
	Thu, 30 Nov 2017 08:53:33 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 30 Nov 2017 09:53:08 +0100
Message-Id: <1512031988-32490-8-git-send-email-thuth@redhat.com>
In-Reply-To: <1512031988-32490-1-git-send-email-thuth@redhat.com>
References: <1512031988-32490-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 30 Nov 2017 08:53:37 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH for-2.12 7/7] tests/boot-serial-test: Add support
 for the raspi2 machine
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Anthony Green <green@moxielogic.com>, Laurent Vivier <laurent@vivier.eu>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: o6e3V062CHzI

The raspi2 machine supports loading firmware images, so we can easily
load a small test sequence as raw binary blob here to test the UART.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/Makefile.include   | 1 +
 tests/boot-serial-test.c | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 00c1e11..09025dc 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -361,6 +361,7 @@ check-qtest-arm-y += tests/virtio-blk-test$(EXESUF)
 gcov-files-arm-y += arm-softmmu/hw/block/virtio-blk.c
 check-qtest-arm-y += tests/test-arm-mptimer$(EXESUF)
 gcov-files-arm-y += hw/timer/arm_mptimer.c
+check-qtest-arm-y += tests/boot-serial-test$(EXESUF)
 
 check-qtest-aarch64-y = tests/numa-test$(EXESUF)
 
diff --git a/tests/boot-serial-test.c b/tests/boot-serial-test.c
index 1deddb8..663b78b 100644
--- a/tests/boot-serial-test.c
+++ b/tests/boot-serial-test.c
@@ -47,6 +47,14 @@ static const uint8_t bios_moxiesim[] = {
     0x1a, 0x00, 0x00, 0x00, 0x10, 0x00      /* jmpa  0x1000 */
 };
 
+static const uint8_t bios_raspi2[] = {
+    0x08, 0x30, 0x9f, 0xe5,                 /* ldr   r3,[pc,#8]    Get base */
+    0x54, 0x20, 0xa0, 0xe3,                 /* mov     r2,#'T' */
+    0x00, 0x20, 0xc3, 0xe5,                 /* strb    r2,[r3] */
+    0xfb, 0xff, 0xff, 0xea,                 /* b       loop */
+    0x00, 0x10, 0x20, 0x3f,                 /* 0x3f201000 = UART0 base addr */
+};
+
 typedef struct testdef {
     const char *arch;       /* Target architecture */
     const char *machine;    /* Name of the machine */
@@ -78,6 +86,7 @@ static testdef_t tests[] = {
     { "microblazeel", "petalogix-ml605", "", "TT",
       sizeof(kernel_plml605), kernel_plml605 },
     { "moxie", "moxiesim", "", "TT", sizeof(bios_moxiesim), 0, bios_moxiesim },
+    { "arm", "raspi2", "", "TT", sizeof(bios_raspi2), 0, bios_raspi2 },
 
     { NULL }
 };
-- 
1.8.3.1

