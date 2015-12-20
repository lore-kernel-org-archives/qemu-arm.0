Received: by 10.182.158.201 with SMTP id ww9csp2039672obb;
        Sat, 19 Dec 2015 21:46:02 -0800 (PST)
X-Received: by 10.140.166.10 with SMTP id m10mr16574096qhm.35.1450590362145;
        Sat, 19 Dec 2015 21:46:02 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g7si24283404qge.9.2015.12.19.21.46.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 19 Dec 2015 21:46:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39736 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aAWoj-0001Wz-Tr
	for alex.bennee@linaro.org; Sun, 20 Dec 2015 00:46:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41172)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aAWmq-0006vB-Qu
	for qemu-devel@nongnu.org; Sun, 20 Dec 2015 00:44:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aAWmp-0000cE-RU
	for qemu-devel@nongnu.org; Sun, 20 Dec 2015 00:44:04 -0500
Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a]:35032)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aAWmp-0000c9-Mc; Sun, 20 Dec 2015 00:44:03 -0500
Received: by mail-pa0-x22a.google.com with SMTP id jx14so53342847pad.2;
	Sat, 19 Dec 2015 21:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=D9ZQx/9DZdVn2dgeoF7JEjB+PUVBCPR7Urj1ntFYYfA=;
	b=fdujuoCVmA8q1pi4wItB3ovBGLAbHUsGFJQM4Av4O3orBGAn4yQVmQVTmbCkiqUFHx
	Usaq235d4F2ZgayE591tbRl8wrAzcJjgMYb/y6rgGN5VXgydYQ/tDLVgtlD5iUKHq5Hl
	AKxPub/UubPbxNf/rpnxpEKzMJ2SnVVVHlKKr2aMtENRmgo/s9hCYDOE2XG2SNrnxfEQ
	Fgion+CIk+4oBVkzEDT/u1z7PEcW3wOhNjwKEm9Q5hspGDlr5EJ+guKHCLp3EYsBN6OQ
	tRK6KF2+yKqIuU0XYjIXp+Afo2sQvZpfT0se/hCIGSmV2Hbk6Q3XaJ3ggxpR62dEj46a
	GH4w==
X-Received: by 10.66.190.98 with SMTP id gp2mr17611182pac.64.1450590243132;
	Sat, 19 Dec 2015 21:44:03 -0800 (PST)
Received: from localhost.localdomain
	(c211-31-14-155.rochd5.qld.optusnet.com.au. [211.31.14.155])
	by smtp.gmail.com with ESMTPSA id c27sm894550pfd.50.2015.12.19.21.43.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 19 Dec 2015 21:44:01 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Sat, 19 Dec 2015 21:43:34 -0800
Message-Id: <1bbbe46632f566b40ed1cb8c751ee9f04db7b496.1450570397.git.crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1450570397.git.crosthwaite.peter@gmail.com>
References: <cover.1450570397.git.crosthwaite.peter@gmail.com>
In-Reply-To: <cover.1450570397.git.crosthwaite.peter@gmail.com>
References: <cover.1450570397.git.crosthwaite.peter@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::22a
Cc: peter.maydell@linaro.org, crosthwaite.peter@gmail.com, qemu-arm@nongnu.org,
	pbonzini@redhat.com, alistair.francis@xilinx.com
Subject: [Qemu-devel] [PATCH v6 2/6] m25p80.c: Add sst25wf080 SPI flash
	device
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: SE0nRhzr/4b5

From: Alistair Francis <alistair.francis@xilinx.com>

Add the sst25wf080 SPI flash device.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---

 hw/block/m25p80.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index efc43dd..7b9f97c 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -163,6 +163,7 @@ static const FlashPartInfo known_devices[] = {
     { INFO("sst25wf010",  0xbf2502,      0,  64 << 10,   2, ER_4K) },
     { INFO("sst25wf020",  0xbf2503,      0,  64 << 10,   4, ER_4K) },
     { INFO("sst25wf040",  0xbf2504,      0,  64 << 10,   8, ER_4K) },
+    { INFO("sst25wf080",  0xbf2505,      0,  64 << 10,  16, ER_4K) },
 
     /* ST Microelectronics -- newer production may have feature updates */
     { INFO("m25p05",      0x202010,      0,  32 << 10,   2, 0) },
-- 
1.9.1

