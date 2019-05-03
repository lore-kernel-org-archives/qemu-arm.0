Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp809892wrh;
        Fri, 3 May 2019 10:14:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxvjpIpZjM78Husb8I5zYh/POQytNIYSa8YD2vYWKixfbKln/XG9D4ie3EIJUlDJYnWsBW6
X-Received: by 2002:adf:8068:: with SMTP id 95mr7583480wrk.174.1556903690059;
        Fri, 03 May 2019 10:14:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556903690; cv=none;
        d=google.com; s=arc-20160816;
        b=GoSZ1N2YJmaK7tLgvK9XgzYkABVUFlKLwpXeqa3OzQblrWGMHu+2c4AkszD80EVfJP
         wvBguOuq73v1lmhxk197KHnylp/xucpaoYWcvEGYO70W/g5TsTJ2lBZRYjtHRor2cBAj
         f0S4uRtZD4XHsxYICT4etd8vQ8c8xlefBpEBXJXg+WP51Qw1uTe6T78q8/SVt7bwl6t/
         B79KJLQ0A2UJJR47ngNrBDHv62OoyR1r1reRBe3Fm5VyBIV4oHpuKo2BEnYqXrZmjVcA
         R39dQSdw7B2/QLBTKTU1XGrsIUP9vc2HSn4STDoMEZpA4R0vDusPszEYSbQVuvdczdQS
         A5lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=504IrJ8yDMIMkoZHoJWkBxU9Z2x6HMKnHorlvBhWYEg=;
        b=kIogvl5Xp9cl1mD/J7hR0JNGNzXyDVBAt3DRtUwGQ6nor6IlRfXTX1TZxrIhazum02
         uLgMuuiNfBrnBwRCKW0ogp1dH9eAiS7rFASbxnVxH0iGFqD997eI7856BUcp03Af15gL
         LjlXdWaJrpgLB5iL6aVJgfvYXnC8QUYrRK/7dn3GaHTAlcYyRoxsqvav2Z4eaNuJHeHX
         z/o+uoovTgEnzvJhn93ufaWtYybsz/WkzGuPfMyCc6fa2YOzBOPkjq9SKbJcEGR37RtJ
         gZ+YZLrU5bCjXRnQQbGgePuxZeMX3cjYs4F1EXCl3V0SH2rylwaC7DPv70g7apO++BA+
         0jJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xs4YbyAA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v6si1603095wmh.97.2019.05.03.10.14.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 May 2019 10:14:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xs4YbyAA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:44882 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hMblp-0006hS-3Q
	for alex.bennee@linaro.org; Fri, 03 May 2019 13:14:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34120)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hMbkv-0006bZ-Rs
	for qemu-devel@nongnu.org; Fri, 03 May 2019 13:13:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hMbku-000143-IQ
	for qemu-devel@nongnu.org; Fri, 03 May 2019 13:13:53 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:39972)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hMbku-00012U-Bu
	for qemu-devel@nongnu.org; Fri, 03 May 2019 13:13:52 -0400
Received: by mail-wr1-x441.google.com with SMTP id h4so8762063wre.7
	for <qemu-devel@nongnu.org>; Fri, 03 May 2019 10:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=504IrJ8yDMIMkoZHoJWkBxU9Z2x6HMKnHorlvBhWYEg=;
	b=xs4YbyAA0S7Vpgwc//ig58nHce57hbQReRpyI9/FzbDosA0WuUQoTvFyWZsNHhMn8g
	FbxPdZ34Xe0dTY7nQnl9wQKSgTOE1JPC3CO/9m7beJUfndYPjiEvI8enIevrVUmWvTsR
	epKTMnpVpj4lgkM/eiX5tce26NlN7EbpgFEobvu8PWr3gzQ5LstaX8ajnwnFg0ioUaCC
	LtuyMzrS/qVren4raks3H9ouE/BrB7dfHE9v/3lUJHit7I3M02F/ci9gf2Q46V4El+EY
	uodsPdss0PYPridTCY+MQTwBAeIFjvUtrcKisbPQJXY7nG9wplre+gikvsNJH/w0upME
	jhEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=504IrJ8yDMIMkoZHoJWkBxU9Z2x6HMKnHorlvBhWYEg=;
	b=WROu47/USgU6A/6FSeQ+8oq+6z11nAIk3wP5XGEwbweyRFjm+dbr7psI0qtz8OREas
	CCW9Y2PzfT4yBPWfo/NekX4qb9LA/6pixJMGzkoUYsKj7sQAhF4Y9nKpKcHLmT5QUb3m
	ArozjRCzH8uaq/D/g0taVN82ZzSW/SYfll7pbbmWTpBr61EQtSsyRLS5LaQWLQiDRAD7
	kmL1P2TrUo5i7HCfIHPF38qwJYxfE8IzvwKa//PUC8Y1O9ZQbTcd3mDBvJp0/5kF4XEx
	OMGVF3iTcGMy7tRpkUx0qWijkt11e3QRVrTunIbjn4Y0TcTOtTVF7NUxU/8w4woE2DRN
	eIpg==
X-Gm-Message-State: APjAAAUdbyrGy3U77gjUyKIp0z4scKMgrZlfeI20kav1FTp58vP48lHu
	sRDz5GNT6w6dCKO0+RhfMdxAyA==
X-Received: by 2002:adf:83a7:: with SMTP id 36mr7615173wre.310.1556903631199; 
	Fri, 03 May 2019 10:13:51 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id e5sm1717671wrh.79.2019.05.03.10.13.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 May 2019 10:13:50 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri,  3 May 2019 18:13:46 +0100
Message-Id: <20190503171347.13747-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190503171347.13747-1-peter.maydell@linaro.org>
References: <20190503171347.13747-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: [Qemu-devel] [PATCH 1/2] hw/arm/boot: Avoid placing the initrd on
 top of the kernel
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
Cc: Mark Rutland <mark.rutland@arm.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: i52JFiCuX8aq

We currently put the initrd at the smaller of:
 * 128MB into RAM
 * halfway into the RAM
(with the dtb following it).

However for large kernels this might mean that the kernel
overlaps the initrd. For some kinds of kernel (self-decompressing
32-bit kernels, and ELF images with a BSS section at the end)
we don't know the exact size, but even there we have a
minimum size. Put the initrd at least further into RAM than
that. For image formats that can give us an exact kernel size, this
will mean that we definitely avoid overlaying kernel and initrd.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/boot.c | 34 ++++++++++++++++++++--------------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index a830655e1af..7c978fedde4 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -998,20 +998,6 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
     if (info->nb_cpus == 0)
         info->nb_cpus = 1;
 
-    /*
-     * We want to put the initrd far enough into RAM that when the
-     * kernel is uncompressed it will not clobber the initrd. However
-     * on boards without much RAM we must ensure that we still leave
-     * enough room for a decent sized initrd, and on boards with large
-     * amounts of RAM we must avoid the initrd being so far up in RAM
-     * that it is outside lowmem and inaccessible to the kernel.
-     * So for boards with less  than 256MB of RAM we put the initrd
-     * halfway into RAM, and for boards with 256MB of RAM or more we put
-     * the initrd at 128MB.
-     */
-    info->initrd_start = info->loader_start +
-        MIN(info->ram_size / 2, 128 * 1024 * 1024);
-
     /* Assume that raw images are linux kernels, and ELF images are not.  */
     kernel_size = arm_load_elf(info, &elf_entry, &elf_low_addr,
                                &elf_high_addr, elf_machine, as);
@@ -1056,6 +1042,26 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
         exit(1);
     }
     info->entry = entry;
+
+    /*
+     * We want to put the initrd far enough into RAM that when the
+     * kernel is uncompressed it will not clobber the initrd. However
+     * on boards without much RAM we must ensure that we still leave
+     * enough room for a decent sized initrd, and on boards with large
+     * amounts of RAM we must avoid the initrd being so far up in RAM
+     * that it is outside lowmem and inaccessible to the kernel.
+     * So for boards with less  than 256MB of RAM we put the initrd
+     * halfway into RAM, and for boards with 256MB of RAM or more we put
+     * the initrd at 128MB.
+     * We also refuse to put the initrd somewhere that will definitely
+     * overlay the kernel we just loaded, though for kernel formats which
+     * don't tell us their exact size (eg self-decompressing 32-bit kernels)
+     * we might still make a bad choice here.
+     */
+    info->initrd_start = info->loader_start +
+        MAX(MIN(info->ram_size / 2, 128 * 1024 * 1024), kernel_size);
+    info->initrd_start = TARGET_PAGE_ALIGN(info->initrd_start);
+
     if (is_linux) {
         uint32_t fixupcontext[FIXUP_MAX];
 
-- 
2.20.1

