Received: by 10.223.159.82 with SMTP id f18csp392247wrg;
        Thu, 30 Nov 2017 00:56:43 -0800 (PST)
X-Google-Smtp-Source: AGs4zMYcvd0zVwAR/tR8MvoKJmnZ/w13mc4u7/4i1mgwjbQDKmOGTCHA3cp99qQwQYEfqXojx3uV
X-Received: by 10.129.173.29 with SMTP id l29mr992851ywh.11.1512032202987;
        Thu, 30 Nov 2017 00:56:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512032202; cv=none;
        d=google.com; s=arc-20160816;
        b=QRqvqMZD40wkJzSamGCFLqZUX8583deENFJ9zkSLtkhj66rEWPlqbTkLlyImuneDPr
         Y5XR56ULxhpX2CR563SL6wNOoGbfqeJxTqkcI1CDUHt5Wgt8Dd8xUVt1692dc93deTUz
         6DkokRFRs8bBqsMDE9cGK6i3hILHpcBRT1E+E8VGlQml2KlDdQJWSgtBcO1YXVHj2wi8
         B8MoMDuMl3qKQbxsTFjyqaaxyZ2n0+GXPO370ykr57lOw2r4uz9iJJCz42fva11HqSDX
         ok2RRoSriAnXUS+px7KSzagSwnpjKVmiOsiZfS+E8A0McPT10e8mxeFEGVbPphMLEQdE
         uUGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=X8hn646YSifinZ6E798c/zPpmZs4SaLgC2SFmN6aBSA=;
        b=S/+FdZ/VYWxkNx9KYBEVMVFm6GDGyr3ACR4150a/w2MiMEbp3+ji2OkkNHmWYb7bqU
         0F/p9jcXDBZcg3IhHYdvs6Z8R0q4iA9kwdUpEcX/pmfQXS2skPI+abPQ9oWjWhpaJ0UB
         qmgu58YskmStoUWsJcVxnuOCrQewU8wMtDdB5LP1ikgVnOygP/dmj+Ur5Jw9Dd77bfiG
         /TP3i4o4ZnJ4VVzfEEUqbRaixH7TuDSMs9loujet0XMnH1ejGjIjpiBy0IPN7CF7kO0F
         PhP5bZHdNaNufMCzM2SC1VCvAZJ8q1ta5Ul6JmCbcVCq5OSJni0DPZ+4UVX+sv2+s++4
         J5aA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e12si776118ywl.190.2017.11.30.00.56.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 30 Nov 2017 00:56:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46873 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eKKeA-0008LO-Ej
	for alex.bennee@linaro.org; Thu, 30 Nov 2017 03:56:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49065)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1eKKb1-0005Fu-R0
	for qemu-arm@nongnu.org; Thu, 30 Nov 2017 03:53:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1eKKb0-0006rT-5Z
	for qemu-arm@nongnu.org; Thu, 30 Nov 2017 03:53:27 -0500
Received: from mx1.redhat.com ([209.132.183.28]:44754)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1eKKb0-0006qU-08; Thu, 30 Nov 2017 03:53:26 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EEC3285547;
	Thu, 30 Nov 2017 08:53:24 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-158.ams2.redhat.com
	[10.36.116.158])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 581C75D6A9;
	Thu, 30 Nov 2017 08:53:20 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 30 Nov 2017 09:53:05 +0100
Message-Id: <1512031988-32490-5-git-send-email-thuth@redhat.com>
In-Reply-To: <1512031988-32490-1-git-send-email-thuth@redhat.com>
References: <1512031988-32490-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 30 Nov 2017 08:53:25 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH for-2.12 4/7] tests/boot-serial-test: Add tests
 for microblaze boards
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
X-TUID: IzZkTcWWMfG4

This adds two simple TCG + UART tests for the microblaze boards,
one in big endian mode, and one in little endian mode.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/Makefile.include   |  2 ++
 tests/boot-serial-test.c | 20 ++++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 41ca44c..cd908da 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -299,6 +299,8 @@ check-qtest-alpha-y = tests/boot-serial-test$(EXESUF)
 
 check-qtest-m68k-y = tests/boot-serial-test$(EXESUF)
 
+check-qtest-microblaze-y = tests/boot-serial-test$(EXESUF)
+
 check-qtest-mips-y = tests/endianness-test$(EXESUF)
 
 check-qtest-mips64-y = tests/endianness-test$(EXESUF)
diff --git a/tests/boot-serial-test.c b/tests/boot-serial-test.c
index dd3828c..a39273a 100644
--- a/tests/boot-serial-test.c
+++ b/tests/boot-serial-test.c
@@ -24,6 +24,22 @@ static const uint8_t kernel_mcf5208[] = {
     0x60, 0xfa                              /* bra.s  loop */
 };
 
+static const uint8_t kernel_pls3adsp1800[] = {
+    0xb0, 0x00, 0x84, 0x00,                 /* imm   0x8400 */
+    0x30, 0x60, 0x00, 0x04,                 /* addik r3,r0,4 */
+    0x30, 0x80, 0x00, 0x54,                 /* addik r4,r0,'T' */
+    0xf0, 0x83, 0x00, 0x00,                 /* sbi   r4,r3,0 */
+    0xb8, 0x00, 0xff, 0xfc                  /* bri   -4  loop */
+};
+
+static const uint8_t kernel_plml605[] = {
+    0xe0, 0x83, 0x00, 0xb0,                 /* imm   0x83e0 */
+    0x00, 0x10, 0x60, 0x30,                 /* addik r3,r0,0x1000 */
+    0x54, 0x00, 0x80, 0x30,                 /* addik r4,r0,'T' */
+    0x00, 0x00, 0x83, 0xf0,                 /* sbi   r4,r3,0 */
+    0xfc, 0xff, 0x00, 0xb8                  /* bri   -4  loop */
+};
+
 typedef struct testdef {
     const char *arch;       /* Target architecture */
     const char *machine;    /* Name of the machine */
@@ -50,6 +66,10 @@ static testdef_t tests[] = {
     { "s390x", "s390-ccw-virtio",
       "-nodefaults -device sclpconsole,chardev=serial0", "virtio device" },
     { "m68k", "mcf5208evb", "", "TT", sizeof(kernel_mcf5208), kernel_mcf5208 },
+    { "microblaze", "petalogix-s3adsp1800", "", "TT",
+      sizeof(kernel_pls3adsp1800), kernel_pls3adsp1800 },
+    { "microblazeel", "petalogix-ml605", "", "TT",
+      sizeof(kernel_plml605), kernel_plml605 },
 
     { NULL }
 };
-- 
1.8.3.1

