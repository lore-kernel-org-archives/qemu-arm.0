Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp4979222wrq;
        Tue, 12 Jun 2018 00:24:33 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLrSCgq2eUsIIH3vUS7EuOqO0QjZSWBtTnA8sEdF9bumhAZtZPDq5OWwqPFygLVfOgAjT0e
X-Received: by 2002:aed:359d:: with SMTP id c29-v6mr2309902qte.240.1528788273223;
        Tue, 12 Jun 2018 00:24:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528788273; cv=none;
        d=google.com; s=arc-20160816;
        b=lYnGZ131Wf+omUsS7Yf4NAeIQoIBdA2HOjF7F4yBGElp1VtBpSr+4QJ0mUjsUMWhyI
         5C0n4WoBpTFYUFaXXew2Ao18i3LLKURKOgA7X/l2czqah9BZS69VOHyyHf0TU3ZGNpkC
         9m4jiWBK9e9Z8JdojiW273WQ2pdULuymqENbA5GaSW5vO+vN0a4W44s3Vj3RChIlCkZ5
         Y4LXsHUsbpKPXjYSxf7IwIrWmC9YP/47dqzfxugGy1gDvyWhCUqahUXQe6k2TI1AnG3l
         ooIAZHbzXlCAXj0s5433NQrz4wvFEcd+6VcDLR2BCT7CoyYMG1TwxER1U8Yb+TPFcfxd
         CHhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=9e7VVVQNYURQ8ZbiJNC0zLjGZbqAfniXQG3Qez98C/0=;
        b=wn5GtsSo/9jLZElwu21XxXOZBEB9hHQcSCAuODFxxWdEIuEkaEjlMHBBb3QhXRMS+T
         fgjHybTcdFchyCeKeyUWSdy1nDNPwyWI0RHJpfD+BcMMoDfbFJZNvjJrLZZZuYFV4cgS
         YyQtcMkdTYU1PkWnWzQG+b5Om0/kPKwaV2biSAE2eNIl1BpMdniKUA6+1mJcJNIr+mbf
         TQKW8Hf/CLi4oV3iUeR8KaKgYt1rSKa9c7z7fYTeSYdMuvyTizJ1MSWPgrloufLlUkBV
         KJaW78cm8F6n9c1dKjG09nnHl7R+19vvP5zuzHDbz2Fk2TADInMYrjtFj6S+caJFY/vT
         nJlA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k30-v6si230161qtk.393.2018.06.12.00.24.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Jun 2018 00:24:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53457 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fSdfM-0002IQ-MD
	for alex.bennee@linaro.org; Tue, 12 Jun 2018 03:24:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33529)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fSdFY-0004mq-TO
	for qemu-arm@nongnu.org; Tue, 12 Jun 2018 02:57:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fSdFV-0001gK-Ph
	for qemu-arm@nongnu.org; Tue, 12 Jun 2018 02:57:52 -0400
Received: from 1.mo177.mail-out.ovh.net ([178.33.107.143]:50567)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fSdFV-0001fd-I3
	for qemu-arm@nongnu.org; Tue, 12 Jun 2018 02:57:49 -0400
Received: from player797.ha.ovh.net (unknown [10.109.120.19])
	by mo177.mail-out.ovh.net (Postfix) with ESMTP id 087D8B635D
	for <qemu-arm@nongnu.org>; Tue, 12 Jun 2018 08:57:47 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-TOU-1-49-10.w86-201.abo.wanadoo.fr
	[86.201.141.10]) (Authenticated sender: clg@kaod.org)
	by player797.ha.ovh.net (Postfix) with ESMTPSA id B57A92E009B;
	Tue, 12 Jun 2018 08:57:41 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-devel@nongnu.org
Date: Tue, 12 Jun 2018 08:57:16 +0200
Message-Id: <20180612065716.10587-4-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20180612065716.10587-1-clg@kaod.org>
References: <20180612065716.10587-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 7992481966904871744
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedthedrkeeigdduuddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 178.33.107.143
Subject: [Qemu-arm] [PATCH 3/3] aspeed/smc: rename
 aspeed_smc_flash_send_addr() to aspeed_smc_flash_setup()
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NimNTTDaqnaf

Also handle the fake transfers for dummy bytes in this setup
routine. It will be useful when we activate MMIO execution.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ssi/aspeed_smc.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index b15370893583..b29bfd3124a9 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -503,10 +503,11 @@ static int aspeed_smc_flash_dummies(const AspeedSMC=
Flash *fl)
     return dummies;
 }
=20
-static void aspeed_smc_flash_send_addr(AspeedSMCFlash *fl, uint32_t addr=
)
+static void aspeed_smc_flash_setup(AspeedSMCFlash *fl, uint32_t addr)
 {
     const AspeedSMCState *s =3D fl->controller;
     uint8_t cmd =3D aspeed_smc_flash_cmd(fl);
+    int i;
=20
     /* Flash access can not exceed CS segment */
     addr =3D aspeed_smc_check_segment_addr(fl, addr);
@@ -519,6 +520,18 @@ static void aspeed_smc_flash_send_addr(AspeedSMCFlas=
h *fl, uint32_t addr)
     ssi_transfer(s->spi, (addr >> 16) & 0xff);
     ssi_transfer(s->spi, (addr >> 8) & 0xff);
     ssi_transfer(s->spi, (addr & 0xff));
+
+    /*
+     * Use fake transfers to model dummy bytes. The value should
+     * be configured to some non-zero value in fast read mode and
+     * zero in read mode. But, as the HW allows inconsistent
+     * settings, let's check for fast read mode.
+     */
+    if (aspeed_smc_flash_mode(fl) =3D=3D CTRL_FREADMODE) {
+        for (i =3D 0; i < aspeed_smc_flash_dummies(fl); i++) {
+                ssi_transfer(fl->controller->spi, 0xFF);
+        }
+    }
 }
=20
 static uint64_t aspeed_smc_flash_read(void *opaque, hwaddr addr, unsigne=
d size)
@@ -537,19 +550,7 @@ static uint64_t aspeed_smc_flash_read(void *opaque, =
hwaddr addr, unsigned size)
     case CTRL_READMODE:
     case CTRL_FREADMODE:
         aspeed_smc_flash_select(fl);
-        aspeed_smc_flash_send_addr(fl, addr);
-
-        /*
-         * Use fake transfers to model dummy bytes. The value should
-         * be configured to some non-zero value in fast read mode and
-         * zero in read mode. But, as the HW allows inconsistent
-         * settings, let's check for fast read mode.
-         */
-        if (aspeed_smc_flash_mode(fl) =3D=3D CTRL_FREADMODE) {
-            for (i =3D 0; i < aspeed_smc_flash_dummies(fl); i++) {
-                ssi_transfer(fl->controller->spi, 0xFF);
-            }
-        }
+        aspeed_smc_flash_setup(fl, addr);
=20
         for (i =3D 0; i < size; i++) {
             ret |=3D ssi_transfer(s->spi, 0x0) << (8 * i);
@@ -586,7 +587,7 @@ static void aspeed_smc_flash_write(void *opaque, hwad=
dr addr, uint64_t data,
         break;
     case CTRL_WRITEMODE:
         aspeed_smc_flash_select(fl);
-        aspeed_smc_flash_send_addr(fl, addr);
+        aspeed_smc_flash_setup(fl, addr);
=20
         for (i =3D 0; i < size; i++) {
             ssi_transfer(s->spi, (data >> (8 * i)) & 0xff);
--=20
2.13.6

