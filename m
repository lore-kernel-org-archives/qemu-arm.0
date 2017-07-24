Received: by 10.25.44.15 with SMTP id s15csp4197144lfs;
        Mon, 24 Jul 2017 11:49:16 -0700 (PDT)
X-Received: by 10.55.72.206 with SMTP id v197mr20869818qka.133.1500922156294;
        Mon, 24 Jul 2017 11:49:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500922156; cv=none;
        d=google.com; s=arc-20160816;
        b=T153D438S3jv9KYcSGJKJn3JLzC+6as+dl+VQnvFvkvRZyvq3lTykXKnQEMjSzQ8As
         OFx/C9Ki6fnFu65UnAAWFYTZXt12eS55iSJAJnViggyXfVWA7c2uQpW1R7GA0biJFHIB
         4eWy1hK1MlNr5oKp153/rrCdXhnqFT/Z5fF0u4KULfZJyeO+dvNZm6KYrRQkjHgSPZTh
         CBUtqCI0W9qCfLI+UuMf+ThgWlGY33oXikJiFkvpfh+m5lyglj6u7rfzfSjE0ujfZol/
         h9l3zSqEpViyPtlZuGjH2zsW+H5SLfjn34PIFWIQHRf2AWEtxr7mTj3dSGJSc2ISzDpX
         sunQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=qcszXCoRlLX/kkct26pbv4QF4eJqOyrRFtFi31KytKo=;
        b=pYca1T1jZL2mZ/hHmzg7q4S2yalp8Pkib+aF9oWpoh1XORckIBn0Mx6Bk/j2DAgmw4
         WnArsjThzAWjm0vfFfyQyKcdANqXF4cogefX2rjO/CKBVYPx/8QyZLrxtnc+vJfhTspL
         rUDvMMc71NFO273SPGm6nV/Tai4T307KeliAa6nxQHoKMCa7J+KxyFYe9BtSOqeX6z63
         LSiTP8nmw67NKygr7IOfzMWc5eR2IQVmBZYNpAVe4mjSyIirGp6FuVTzn9dm8B4d/nUF
         BE1b0zbGfk0b5v0OE9K63XWP0TQUdLXDOU8aq6Av01TgN+CQt9WSwmdenwTaSJ8egu3q
         h0CA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=b5/wyXiD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l65si10525061qkh.207.2017.07.24.11.49.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 24 Jul 2017 11:49:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=b5/wyXiD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56426 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dZiPp-0000f0-G4
	for alex.bennee@linaro.org; Mon, 24 Jul 2017 14:49:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50614)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi6T-0000lP-TR
	for qemu-devel@nongnu.org; Mon, 24 Jul 2017 14:29:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi6T-0005Tr-2x
	for qemu-devel@nongnu.org; Mon, 24 Jul 2017 14:29:13 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:32928)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi6S-0005TF-Vm; Mon, 24 Jul 2017 14:29:13 -0400
Received: by mail-qt0-x244.google.com with SMTP id n42so3129050qtn.0;
	Mon, 24 Jul 2017 11:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=qcszXCoRlLX/kkct26pbv4QF4eJqOyrRFtFi31KytKo=;
	b=b5/wyXiDWV7ObtUdB5rLBfK4Os1T0C1uex/QvS5zGA+Wx97l22raaJD1z/u8b2E+U9
	rTjhcTttThPNSYIIb6XwO5w1sg7y0HwaBBNCeflCqT4C0Rd74j5h5PyfFYSGlB4kr8YN
	eNljKOTTCUbBfRKbT+FXm2Kp/wZX86zRz9CYcW7gahs5azzi3FZ9AxN0RteuT9aL1hxw
	4GzxNgVvvkFg9voyyNBCX9uK9dczfL4DVgYsvu7B8VTkyv229ZCwg+rZVhwhdjaffVNZ
	8FRiZU147XW/r1PBMjkE6b5wcGe8btbPdU9sp0dNtHmuNIQVeaImBBIp6D9wwS4Pi9vW
	Nk4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=qcszXCoRlLX/kkct26pbv4QF4eJqOyrRFtFi31KytKo=;
	b=da+bVTLUToPM1uZvVYnmK4QOHU0NtkkNbNqUGJHrVtCdff+YCLIoLFb5d8pXrNNkgV
	ZNZ8QxItGGtOAlyZp5wrBX+yM4DOib2wN0jt72NDkcXq0xKRG99lQDDSgO6eu887lfAE
	eYcQQD/8p+dfXi7iupKS/c2u/VaexGAT0kgFd6Wr+F3xzbx5fbxsFpaSKX2Esef+wH3s
	Xkdm7Cms3H8fLdMXbalsBP6fHNfwaTM4R/p4IlTml+B+vB3YZeAxzoYFalYeXy53uuIM
	KrlpRI9oty3QuO4V4xbn0XZpRfAzBMD5xJl4wVvaWAhfEGojMd/4gxs+TpbE3PW1BsEF
	4jBg==
X-Gm-Message-State: AIVw113+VZuhQhvINnpcMGR2Q4DIMmoyrlJyeLXkYlWb0OxaNnrTEz2X
	vd3LcYwx5HgYEQ==
X-Received: by 10.237.53.44 with SMTP id a41mr11360004qte.231.1500920952515;
	Mon, 24 Jul 2017 11:29:12 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	t57sm9033799qtt.18.2017.07.24.11.29.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Jul 2017 11:29:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Jul 2017 15:27:38 -0300
Message-Id: <20170724182751.18261-23-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170724182751.18261-1-f4bug@amsat.org>
References: <20170724182751.18261-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-devel] [PATCH for 2.10 22/35] arm/vexpress: fix potential
 memory leak
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
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ip/utbAa81L5

Reorder to only allocate if required.

hw/arm/vexpress.c:667:13: warning: Potential leak of memory pointed to by 'flashalias'

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/vexpress.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index 528c65ddb6..76c4d84482 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -553,8 +553,6 @@ static void vexpress_common_init(MachineState *machine)
     MemoryRegion *sysmem = get_system_memory();
     MemoryRegion *vram = g_new(MemoryRegion, 1);
     MemoryRegion *sram = g_new(MemoryRegion, 1);
-    MemoryRegion *flashalias = g_new(MemoryRegion, 1);
-    MemoryRegion *flash0mem;
     const hwaddr *map = daughterboard->motherboard_map;
     int i;
 
@@ -657,6 +655,9 @@ static void vexpress_common_init(MachineState *machine)
     }
 
     if (map[VE_NORFLASHALIAS] != -1) {
+        MemoryRegion *flashalias = g_new(MemoryRegion, 1);
+        MemoryRegion *flash0mem;
+
         /* Map flash 0 as an alias into low memory */
         flash0mem = sysbus_mmio_get_region(SYS_BUS_DEVICE(pflash0), 0);
         memory_region_init_alias(flashalias, NULL, "vexpress.flashalias",
-- 
2.13.3

